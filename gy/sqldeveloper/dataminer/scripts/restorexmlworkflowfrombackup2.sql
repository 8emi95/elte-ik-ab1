-- Run this script in SYS account to restore backup workflows
-- @restorexmlworkflowfrombackup2.sql <backup account>
-- Parameter
-- account to restore backup workflows from
-- Example:
-- @restorexmlworkflowfrombackup2.sql ODMR_BACKUP

WHENEVER SQLERROR EXIT SQL.SQLCODE;

EXECUTE dbms_output.put_line('');
EXECUTE dbms_output.put_line('Start Restore Data Miner Workflows');
EXECUTE dbms_output.put_line('');

-- restore backup workflows to ODMR$WORKFLOWS
DECLARE
  v_curProjectId NUMBER := NULL;
  v_newProject BOOLEAN := TRUE;
  v_projectId  NUMBER;
  v_workflowId NUMBER;
BEGIN
  FOR wf IN (
    SELECT 
      b.WORKFLOW_ID,
      b.WORKFLOW_NAME, 
      b.WORKFLOW_DATA,
      b.USER_NAME,
      b.PROJECT_ID,
      b.PROJECT_NAME,
      b.PJ_CREATION_TIME,
      b.PJ_LAST_UPDATED_TIME,
      b.PJ_COMMENTS,
      b.CHAIN_NAME,
      b.RUN_MODE,
      b.STATUS,
      b.WF_CREATION_TIME,
      b.WF_LAST_UPDATED_TIME,
      b.WF_COMMENTS
    FROM "&1".ODMR$WORKFLOWS_BACKUP b
    WHERE b.VERSION = (SELECT MAX(VERSION) FROM "&1".ODMR$WORKFLOWS_BACKUP)
    ORDER BY b.PROJECT_ID
  )
  LOOP
    BEGIN
      dbms_output.put_line('Restore workflow: ('||wf.PROJECT_NAME||', '||wf.WORKFLOW_NAME||', '||wf.PROJECT_ID||', '||wf.WORKFLOW_ID||')');
      IF (v_curProjectId IS NULL) THEN
        v_curProjectId := wf.PROJECT_ID;
        v_projectId := ODMRSYS.ODMR$PROJECT_ID_SEQ.nextval;
        v_newProject := TRUE;
      ELSIF (v_curProjectId != wf.PROJECT_ID) THEN
        v_curProjectId := wf.PROJECT_ID;
        v_projectId := ODMRSYS.ODMR$PROJECT_ID_SEQ.nextval;
        v_newProject := TRUE;
      ELSE
        v_newProject := FALSE;
      END IF;
      IF (v_newProject = TRUE) THEN
        INSERT INTO ODMRSYS.ODMR$PROJECTS VALUES (wf.USER_NAME, v_projectId, wf.PROJECT_NAME, wf.PJ_CREATION_TIME, wf.PJ_LAST_UPDATED_TIME, wf.PJ_COMMENTS);
      END IF;
      v_workflowId := ODMRSYS.ODMR$WORKFLOW_ID_SEQ.nextval;
      INSERT INTO ODMRSYS.ODMR$WORKFLOWS VALUES (v_workflowId, wf.WORKFLOW_NAME, wf.WORKFLOW_DATA, wf.CHAIN_NAME, wf.RUN_MODE, wf.STATUS, wf.WF_CREATION_TIME, wf.WF_LAST_UPDATED_TIME, wf.WF_COMMENTS, v_projectId);
      COMMIT;
      dbms_output.put_line('Workflow restored: ('||wf.PROJECT_NAME||', '||wf.WORKFLOW_NAME||', '||v_projectId||', '||v_workflowId||')');
    EXCEPTION WHEN OTHERS THEN
      dbms_output.put_line('Workflow restore failed: '||wf.WORKFLOW_NAME||' due to: '||SUBSTR(DBMS_UTILITY.FORMAT_ERROR_STACK(), 1, 4000));
    END;
  END LOOP;
END;
/

EXECUTE dbms_output.put_line('End Restore Data Miner Workflows');
