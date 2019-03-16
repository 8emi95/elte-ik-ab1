WHENEVER SQLERROR EXIT SQL.SQLCODE;
EXECUTE dbms_output.put_line('Start upgrade Object-Relational schema.' || systimestamp);

-- backup workflows to WORKFLOW_DATA_BACKUP
ALTER TABLE "ODMRSYS"."ODMR$WORKFLOWS" ADD(WORKFLOW_DATA_BACKUP SYS.XMLTYPE);

BEGIN
  FOR wf IN (
    SELECT 
      b.WORKFLOW_ID,
      b.WORKFLOW_DATA.createNonSchemaBasedXML() "WORKFLOW_DATA"
    FROM ODMRSYS.ODMR$WORKFLOWS b
  )
  LOOP
    BEGIN
      UPDATE ODMRSYS.ODMR$WORKFLOWS w
      SET w.WORKFLOW_DATA_BACKUP = wf.WORKFLOW_DATA
      WHERE w.WORKFLOW_ID = wf.WORKFLOW_ID;
      COMMIT;
      dbms_output.put_line('Workflow backed up: '||wf.WORKFLOW_ID);
    EXCEPTION WHEN OTHERS THEN
      dbms_output.put_line('Workflow backup failed: '||wf.WORKFLOW_ID);
    END;
  END LOOP;
END;
/

-- drop existing WORKFLOW_DATA column
ALTER TABLE "ODMRSYS"."ODMR$WORKFLOWS" DROP COLUMN "WORKFLOW_DATA";

-- drop the old schema and register a updated version
@@instschema_g.sql

-- create a new WORKFLOW_DATA based on the updated xml schema
ALTER TABLE "ODMRSYS"."ODMR$WORKFLOWS" ADD(WORKFLOW_DATA SYS.XMLTYPE)
  XMLTYPE COLUMN WORKFLOW_DATA store AS OBJECT RELATIONAL 
   XMLSCHEMA "http://xmlns.oracle.com/odmr11/odmr.xsd" ELEMENT "WorkflowProcess";

-- restore workflows from backup
BEGIN
  FOR wf IN (
    SELECT 
      b.WORKFLOW_ID,
      b.WORKFLOW_DATA_BACKUP
    FROM ODMRSYS.ODMR$WORKFLOWS b
  )
  LOOP
    BEGIN
      UPDATE ODMRSYS.ODMR$WORKFLOWS w
      SET w.WORKFLOW_DATA = wf.WORKFLOW_DATA_BACKUP
      WHERE w.WORKFLOW_ID = wf.WORKFLOW_ID;
      COMMIT;
      dbms_output.put_line('Workflow restored: '||wf.WORKFLOW_ID);
    EXCEPTION WHEN OTHERS THEN
      dbms_output.put_line('Workflow restore failed: '||wf.WORKFLOW_ID);
    END;
  END LOOP;
END;
/

-- drop WORKFLOW_DATA_BACKUP column
ALTER TABLE "ODMRSYS"."ODMR$WORKFLOWS" DROP COLUMN "WORKFLOW_DATA_BACKUP";

EXECUTE dbms_output.put_line('Finished upgrade Object-Relational schema.' || systimestamp);
