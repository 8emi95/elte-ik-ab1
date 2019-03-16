-- schema11_2_1_1_1to11_2_2_1_1.sql is used by the migration process to migrate the XML Schema from 11.2.1.1.1 to 11.2.2.1.1
-- Usage @schema11_2_1_1_1to11_2_2_1_1.sql
-- Example: @schema11_2_1_1_1to11_2_2_1_1.sql
WHENEVER SQLERROR EXIT SQL.SQLCODE;

ALTER session set current_schema = "SYS";
/

EXECUTE dbms_output.put_line('Start Data Miner XML Schema migration from 11.2.1.1.1 tp 11.2.2.1.1 ' || systimestamp);

DECLARE
  ver_num         VARCHAR2(30);
  v_storage       VARCHAR2(30);
BEGIN
  SELECT STORAGE_TYPE INTO v_storage FROM ALL_XML_TAB_COLS WHERE OWNER='ODMRSYS' AND TABLE_NAME='ODMR$WORKFLOWS' AND COLUMN_NAME='WORKFLOW_DATA';
  SELECT PROPERTY_STR_VALUE INTO ver_num FROM ODMRSYS.ODMR$REPOSITORY_PROPERTIES WHERE PROPERTY_NAME = 'WF_VERSION';
  dbms_output.put_line('Current xml schema version in database: ' || to_char(ver_num));
  IF (ver_num = '11.2.1.1.1') THEN
    IF (v_storage != 'BINARY') THEN
      EXECUTE IMMEDIATE 'CREATE INDEX "ODMRSYS"."DYNAMIC_PREDICT_N_ID_IDX"
      ON "ODMRSYS"."DYNAMIC_PREDICT_TAB" (extractValue(OBJECT_VALUE, ''/DynamicPrediction/@Id''))';
      
      EXECUTE IMMEDIATE 'CREATE INDEX "ODMRSYS"."DYNAMIC_FEATURE_N_ID_IDX"
      ON "ODMRSYS"."DYNAMIC_FEATURE_TAB" (extractValue(OBJECT_VALUE, ''/DynamicFeature/@Id''))';
      
      EXECUTE IMMEDIATE 'CREATE INDEX "ODMRSYS"."DYNAMIC_CLUSTER_N_ID_IDX"
      ON "ODMRSYS"."DYNAMIC_CLUSTER_TAB" (extractValue(OBJECT_VALUE, ''/DynamicCluster/@Id''))';
      
      EXECUTE IMMEDIATE 'CREATE INDEX "ODMRSYS"."DYNAMIC_ANOMALY_N_ID_IDX"
      ON "ODMRSYS"."DYNAMIC_ANOMALY_TAB" (extractValue(OBJECT_VALUE, ''/DynamicAnomaly/@Id''))';
      
      EXECUTE IMMEDIATE 'CREATE INDEX "ODMRSYS"."SQL_QUERY_N_ID_IDX"
      ON "ODMRSYS"."SQL_QUERY_TAB" (extractValue(OBJECT_VALUE, ''/SQLQuery/@Id''))';
      
      EXECUTE IMMEDIATE 'CREATE INDEX "ODMRSYS"."GRAPH_N_ID_IDX"
      ON "ODMRSYS"."GRAPH_TAB" (extractValue(OBJECT_VALUE, ''/Graph/@Id''))';
      
      EXECUTE IMMEDIATE 'CREATE INDEX "ODMRSYS"."EM_M_N_ID_IDX"
      ON "ODMRSYS"."EM_M_TAB" (extractValue(OBJECT_VALUE, ''/ExpectationMaximizationModel/@Id''))';
      
      EXECUTE IMMEDIATE 'CREATE INDEX "ODMRSYS"."SVD_M_N_ID_IDX"
      ON "ODMRSYS"."SVD_M_TAB" (extractValue(OBJECT_VALUE, ''/SVDModel/@Id''))';
      
      EXECUTE IMMEDIATE 'CREATE INDEX "ODMRSYS"."PCA_M_N_ID_IDX"
      ON "ODMRSYS"."PCA_M_TAB" (extractValue(OBJECT_VALUE, ''/PCAModel/@Id''))';
    ELSE
      EXECUTE IMMEDIATE 'ALTER user ODMRSYS quota 200M on SYSTEM';

      BEGIN
        EXECUTE IMMEDIATE 'DROP INDEX ODMRSYS.WF_NODES_XMLINDEX';
      EXCEPTION WHEN OTHERS THEN
        NULL;
      END;

      BEGIN
        DBMS_XMLINDEX.DROPPARAMETER('idx_param');
      EXCEPTION WHEN OTHERS THEN
        NULL;
      END;
      DBMS_XMLINDEX.REGISTERPARAMETER('idx_param',
      'XMLTable WF_NODES XMLNAMESPACES(DEFAULT ''http://xmlns.oracle.com/odmr11''),
            ''/WorkflowProcess/Nodes/*''
            COLUMNS NodeType     VARCHAR2(30) PATH ''name()'',
                    NodeId       VARCHAR2(30) PATH ''@Id'',
                    NodeName     VARCHAR2(30) PATH ''@Name'',
                    NodeStatus   VARCHAR2(30) PATH ''@Status''');
      EXECUTE IMMEDIATE 'CREATE INDEX ODMRSYS.WF_NODES_XMLINDEX ON ODMRSYS.ODMR$WORKFLOWS(WORKFLOW_DATA) INDEXTYPE IS XDB.XMLIndex PARAMETERS(''param idx_param'')';
      
      BEGIN
        DBMS_XMLINDEX.DROPPARAMETER('idx_param_1');
      EXCEPTION WHEN OTHERS THEN
        NULL;
      END;
      DBMS_XMLINDEX.REGISTERPARAMETER('idx_param_1',
      'ADD_GROUP GROUP MODEL_GROUP
       XMLTable WF_MODELS XMLNAMESPACES(DEFAULT ''http://xmlns.oracle.com/odmr11''),
            ''/WorkflowProcess/Nodes/*/Models/*''
            COLUMNS ModelType     VARCHAR2(30) PATH ''name()'',
                    ModelId       VARCHAR2(30) PATH ''@Id'',
                    ModelName     VARCHAR2(30) PATH ''@Name'',
                    ModelStatus   VARCHAR2(30) PATH ''@Status''');
      EXECUTE IMMEDIATE 'ALTER INDEX ODMRSYS.WF_NODES_XMLINDEX parameters (''param idx_param_1'')';
    END IF;
    dbms_output.put_line('Workflow schema migration from version 11.2.1.1.1 to version 11.2.2.1.1 succeeded.');
    -- uptick the WF_VERSION
    UPDATE ODMRSYS.ODMR$REPOSITORY_PROPERTIES SET PROPERTY_STR_VALUE = '11.2.2.1.1' WHERE PROPERTY_NAME = 'WF_VERSION';
    COMMIT;
  END IF;  
EXCEPTION WHEN OTHERS THEN
  ROLLBACK;
  dbms_output.put_line('Workflow schema migration from version 11.2.1.1.1 to version 11.2.2.1.1 failed: '||DBMS_UTILITY.FORMAT_ERROR_STACK());
  RAISE;
END;
/

ALTER session set current_schema = "ODMRSYS";

DECLARE
  ver_num   VARCHAR2(30);
BEGIN
  SELECT PROPERTY_STR_VALUE INTO ver_num FROM ODMRSYS.ODMR$REPOSITORY_PROPERTIES WHERE PROPERTY_NAME = 'WF_VERSION';
  IF (ver_num = '11.2.2.1.1') THEN
    UPDATE ODMRSYS.ODMR$WORKFLOWS x
      SET x.WORKFLOW_DATA = updateXML(x.WORKFLOW_DATA, '/WorkflowProcess/@Version', ver_num, 'xmlns="http://xmlns.oracle.com/odmr11"')
    WHERE XMLExists('declare default element namespace "http://xmlns.oracle.com/odmr11";
      $p/WorkflowProcess' PASSING x.WORKFLOW_DATA AS "p");
    COMMIT;
    dbms_output.put_line('Migrated workflows version have been updated to version 11.2.2.1.1');
  END IF;
EXCEPTION WHEN OTHERS THEN
  ROLLBACK;
  dbms_output.put_line('Migrated workflows version update failed: '||DBMS_UTILITY.FORMAT_ERROR_STACK());
  RAISE;
END;
/

EXECUTE dbms_output.put_line('End Data Miner XML Schema migration from 11.2.1.1.1 to 11.2.2.1.1 ' || systimestamp);
