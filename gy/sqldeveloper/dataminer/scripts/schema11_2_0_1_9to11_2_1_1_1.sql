-- schema11_2_0_1_9to11_2_1_1_1.sql is used by the migration process to migrate the XML Schema from 11.2.0.1.9 to 11.2.1.1.1
-- Usage @schema11_2_0_1_9to11_2_1_1_1.sql
-- Example: @schema11_2_0_1_9to11_2_1_1_1.sql
WHENEVER SQLERROR EXIT SQL.SQLCODE;

ALTER session set current_schema = "SYS";
/

EXECUTE dbms_output.put_line('Start Data Miner XML Schema migration from 11.2.0.1.9 tp 11.2.1.1.1 ' || systimestamp);

DECLARE
  ver_num      VARCHAR2(30);
BEGIN
  BEGIN
    SELECT PROPERTY_STR_VALUE INTO ver_num FROM ODMRSYS.ODMR$REPOSITORY_PROPERTIES WHERE PROPERTY_NAME = 'WF_VERSION';
    dbms_output.put_line('Current xml schema version in database: ' || to_char(ver_num));
  EXCEPTION WHEN NO_DATA_FOUND THEN
    ver_num := '11.2.0.1.9'; -- if it doesn't exist, assume 11.2.0.1.9
    dbms_output.put_line('Schema version did not exist in properties so it will be added : ' || to_char(ver_num));
    INSERT INTO ODMRSYS.ODMR$REPOSITORY_PROPERTIES (PROPERTY_NAME, PROPERTY_STR_VALUE, "COMMENT") VALUES ('WF_VERSION', ver_num, 'Supported workflow version');
    COMMIT;
  END;
  IF (ver_num = '11.2.0.1.9') THEN
    dbms_output.put_line('Workflow schema migration from version 11.2.0.1.9 to version 11.2.1.1.1 succeeded');
    -- uptick the WF_VERSION
    UPDATE ODMRSYS.ODMR$REPOSITORY_PROPERTIES SET PROPERTY_STR_VALUE = '11.2.1.1.1' WHERE PROPERTY_NAME = 'WF_VERSION';
    COMMIT;
  END IF;
EXCEPTION WHEN OTHERS THEN
  ROLLBACK;
  dbms_output.put_line('Workflow schema migration from version 11.2.0.1.9 to version 11.2.1.1.1 failed: '||DBMS_UTILITY.FORMAT_ERROR_STACK());
  RAISE;
END;
/

ALTER session set current_schema = "ODMRSYS";

DECLARE
  ver_num   VARCHAR2(30);
BEGIN
  SELECT PROPERTY_STR_VALUE INTO ver_num FROM ODMRSYS.ODMR$REPOSITORY_PROPERTIES WHERE PROPERTY_NAME = 'WF_VERSION';
  IF (ver_num = '11.2.1.1.1') THEN
    UPDATE ODMRSYS.ODMR$WORKFLOWS x
      SET x.WORKFLOW_DATA = updateXML(x.WORKFLOW_DATA, '/WorkflowProcess/@Version', ver_num, 'xmlns="http://xmlns.oracle.com/odmr11"')
    WHERE XMLExists('declare default element namespace "http://xmlns.oracle.com/odmr11";
      $p/WorkflowProcess' PASSING x.WORKFLOW_DATA AS "p");
    COMMIT;
    dbms_output.put_line('Migrated workflows version have been updated to version 11.2.1.1.1');
  END IF;
EXCEPTION WHEN OTHERS THEN
  ROLLBACK;
  dbms_output.put_line('Migrated workflows version update failed: '||DBMS_UTILITY.FORMAT_ERROR_STACK());
  RAISE;
END;
/

EXECUTE dbms_output.put_line('End Data Miner XML Schema migration from 11.2.0.1.9 to 11.2.1.1.1 ' || systimestamp);
