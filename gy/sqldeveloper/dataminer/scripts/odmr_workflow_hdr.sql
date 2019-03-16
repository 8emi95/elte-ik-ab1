CREATE OR REPLACE PACKAGE "ODMRSYS"."ODMR_WORKFLOW" 
AUTHID CURRENT_USER AS

  XML_NAME_SPACE_URL  CONSTANT VARCHAR2(100) := '"http://xmlns.oracle.com/odmr11"';
  XML_NAME_SPACE_URL_NQ  CONSTANT VARCHAR2(100) := 'http://xmlns.oracle.com/odmr11';
  XML_NAME_SPACE      CONSTANT VARCHAR2(100) := 'xmlns="http://xmlns.oracle.com/odmr11"';
  XML_LOCATION        CONSTANT VARCHAR2(100) := 'xsi:schemaLocation="http://xmlns.oracle.com/odmr11 http://xmlns.oracle.com/odmr11/odmr.xsd"';
  RUN_MODE            CONSTANT VARCHAR2(30) := 'RUN';
  RERUN_MODE          CONSTANT VARCHAR2(30) := 'RERUN';
  VALIDATE_MODE       CONSTANT VARCHAR2(30) := 'VALIDATE';
  UPSTREAM            CONSTANT VARCHAR2(30) := 'UPSTREAM';
  DOWNSTREAM          CONSTANT VARCHAR2(30) := 'DOWNSTREAM';

  --c_node_status_invalid   CONSTANT VARCHAR2(30) := 'INVALID';
  c_wf_chain_name_prefix  CONSTANT VARCHAR2(30) := 'ODMR$WFCHAIN';
  c_wf_job_name_prefix    CONSTANT VARCHAR2(30) := 'ODMR$WFJOB';

  SUBTYPE ODMR_LSTMT_REC_TYPE  IS ODMR_INTERNAL_UTIL.LSTMT_REC_TYPE;

  TYPE SUBFLOWRECTYPE IS RECORD (
    SUBFLOW_ENTRY VARCHAR2(30),
    SUBFLOW_EXIT  VARCHAR2(30) );

  TYPE SUBFLOWRECTYPES IS TABLE OF SUBFLOWRECTYPE INDEX BY VARCHAR2(30);

  TYPE WORKFLOWRECTYPE IS RECORD (
    PARENT_ID           VARCHAR2(30),
    PARENT              VARCHAR2(30),
    CHILD_ID            VARCHAR2(30),
    CHILD_TYPE          VARCHAR2(30),
    CHILD               VARCHAR2(30),
    EXPRESSION          CLOB );

  TYPE WORKFLOWRECTYPES is TABLE OF WORKFLOWRECTYPE INDEX BY VARCHAR2(60);

  TYPE LOOKUPTYPE IS TABLE OF VARCHAR2(60) INDEX BY VARCHAR2(60);

  TYPE RULERECTYPE IS RECORD (
    --RULE_NAME   USER_SCHEDULER_CHAIN_RULES.RULE_NAME%TYPE,
    CONDITION   USER_SCHEDULER_CHAIN_RULES.CONDITION%TYPE,
    ACTION      USER_SCHEDULER_CHAIN_RULES.ACTION%TYPE,
    COMMENTS    USER_SCHEDULER_CHAIN_RULES.COMMENTS%TYPE);

  TYPE RULELOOKUPTYPE IS TABLE OF RULERECTYPE INDEX BY VARCHAR2(30);

  TYPE NODERECTYPE IS RECORD (
    TYPE      VARCHAR2(30),
    ID        VARCHAR2(30),
    NAME      VARCHAR2(30),
    STATUS    VARCHAR2(30));
    
  TYPE NODELOOKUPTYPE IS TABLE OF NODERECTYPE INDEX BY VARCHAR2(30);

  /**
   * Create an empty workflow using the supplied name.
   *
   -- @param p_project_id     project id
   -- @param p_workflow_name  workflow id
   -- @param p_comment        workflow comment
   -- @return workflow id
   -- @throws if workflow name conflict, then error.
   */
  FUNCTION WF_CREATE(p_project_id IN NUMBER,
                  p_workflow_name IN VARCHAR2, p_comment IN VARCHAR2,
                  p_timestamp IN OUT TIMESTAMP) RETURN NUMBER;

  /*
  Return the workflow XML definition.  User needs to specify the desired access mode for the returned workflow.  The API will try to honor the access mode if possible; otherwise it will return the available access mode based on the current workflow state.  For example, user specifies the ¿W¿(read/write) access mode to load the workflow for editing, but the workflow is being used, so the API returns the ¿R¿(read only) access mode.   In this case, the user should not modify the returned workflow.
  Parameters:
    p_workflowId - workflow id
    p_mode ¿ W ¿ read/write, R ¿ read only
  Return:
    p_mode ¿ W ¿ read/write, R ¿ read only
    workflow XML definition
  Validation:
  */
  --FUNCTION WF_OLD_LOAD(p_workflowId IN NUMBER, p_mode IN OUT CHAR, p_timestamp IN OUT TIMESTAMP) RETURN XMLType;

  /**
   -- @param p_workflowId
   -- @param p_mode
   -- @param p_timestamp
   -- @return 
   */
  FUNCTION WF_LOAD(p_workflowId IN NUMBER, p_mode IN OUT CHAR, p_timestamp IN OUT TIMESTAMP) RETURN CLOB;

  /**
   * WF_SAVE
   *
   * Save the workflow that was previously loaded in read/write mode.  
   *  User can specify the desired access mode after the workflow is saved.  
   *  By default after the workflow is saved, it switches to ¿R¿ access mode,
   *  so the workflow can be run (lock released). <br/>
   * The new workflow XML definition will be compared against the persisted one.  
   * If any nodes are deleted, their associated/generated objects (e.g. cache, models, result outputs) 
   *   will be deleted from the user account. <br/>
   * If workflow is locked by another client, server throws an exception, as expected. 
   * Otherwise, it compares the previously saved time stamp with p_timestamp. <br/>
   * If time stamps are equal, server saves the workflow, updates and returns the new time stamp, 
   * and (optionally) re-locks the workflow. <br/>
   * If time stamps differ, server throws an exception allowing the client to prompt the user whether 
   * to overwrite the document.  
   * If the user decides to overwrite, the client invokes WF_SAVE with p_force set to 'Y', which saves workflow,
   * updates the time stamp, and (optionally) re-locks the workflow. <br/>
   * <br/>
   * Validation:  <br/>
   *   If the workflow was not previously loaded in read/write mode, then error
   *
   -- @param p_workflowId      workflow id
   -- @param p_workflow_data   workflow XML definition
   -- @param p_mode            ¿ W ¿ read/write, R ¿ read only (default)
  */
  PROCEDURE WF_SAVE(p_workflowId IN NUMBER, p_workflow_data IN XMLType,
                  p_timestamp IN OUT TIMESTAMP, p_mode IN CHAR DEFAULT 'R', p_force IN CHAR DEFAULT 'N');

  /**
   * Unlock the workflow regardless of any lock on it.
   *
   -- @param p_workflowId  workflow id
   -- @return
   */
  FUNCTION WF_UNLOCK(p_workflowId IN NUMBER) RETURN BOOLEAN;

  /*
   * Run the workflow
   * Validation:
   *   If the workflow is either in running or edit mode, then error
   *
   -- @param p_project_name     project name
   -- @param p_workflow_name    workflow name
   -- @param p_node_name        run node names
   -- @param p_run_mode         RUN, VALIDATE, RERUN
                               RUN - run nodes with non-complete status
                               VALIDATE - validate parent nodes
                               RERUN - run nodes regardless of their status (PLANNED)
   -- @param p_direction        UPSTREAM or DOWNSTREAM
                               UPSTREAM - run the node and its parents
                               DOWNSTREAM - run the node and its children, ignore if VALIDATE_MODE
   -- @param p_max_num_threads  max number of parallel model builds
   -- @param p_start_time       scheduled start time, NULL if run immediately
   -- @param p_repeat_interval  repeat interval for workflow run
   -- @param p_end_date         scheduled end time, NULL if none
   -- @param p_job_class        job class, if NULL, default job class will be used
   *
   -- @return scheduler chain job id
   */
  FUNCTION WF_RUN(p_project_name      IN VARCHAR2,
                  p_workflow_name     IN VARCHAR2,
                  p_node_names        IN OUT NOCOPY ODMR_OBJECT_NAMES,
                  p_run_mode          IN VARCHAR2,
                  p_direction         IN VARCHAR2,
                  p_max_num_threads   IN NUMBER,
                  p_start_date        IN TIMESTAMP WITH TIME ZONE,
                  p_repeat_interval   IN VARCHAR2,
                  p_end_date          IN TIMESTAMP WITH TIME ZONE,
                  p_job_class         IN VARCHAR2)
    RETURN VARCHAR2;

  /*
   * Run the workflow
   * Validation:
   *   If the workflow is either in running or edit mode, then error
   *
   -- @param p_workflow_id      workflow id
   -- @param p_node_ids         run node ids
   -- @param p_run_mode         RUN, VALIDATE, RERUN
                               RUN - run nodes with non-complete status
                               VALIDATE - validate parent nodes
                               RERUN - run nodes regardless of their status (PLANNED)
   -- @param p_direction        UPSTREAM or DOWNSTREAM
                               UPSTREAM - run the node and its parents
                               DOWNSTREAM - run the node and its children, ignore if VALIDATE_MODE
   -- @param p_max_num_threads  max number of parallel model builds
   -- @param p_start_time       scheduled start time, NULL if run immediately
   -- @param p_repeat_interval  repeat interval for workflow run
   -- @param p_end_date         scheduled end time, NULL if none
   -- @param p_job_class        job class, if NULL, default job class will be used
   *
   -- @return scheduler chain job id
   */
  FUNCTION WF_RUN(p_workflow_id       IN VARCHAR2,
                  p_node_ids          IN OUT NOCOPY ODMR_OBJECT_NAMES,
                  p_run_mode          IN VARCHAR2,
                  p_direction         IN VARCHAR2,
                  p_max_num_threads   IN NUMBER,
                  p_start_date        IN TIMESTAMP WITH TIME ZONE,
                  p_repeat_interval   IN VARCHAR2,
                  p_end_date          IN TIMESTAMP WITH TIME ZONE,
                  p_job_class         IN VARCHAR2)
    RETURN VARCHAR2;

  /**
   * WF_RUN (deprecated)
   * 
   -- @param p_workflowId
   -- @param p_nodeId
   -- @param p_run_mode
   -- @param p_max_num_threads
   -- @param p_job_class
   -- @param p_start_time
   -- @param p_direction
   *
   -- @return VARCHAR2
   */
  FUNCTION WF_RUN(p_workflowId IN NUMBER,
                  p_nodeId IN VARCHAR2,
                  p_run_mode IN VARCHAR2,
                  p_max_num_threads IN NUMBER,
                  p_job_class IN VARCHAR2,
                  p_start_time IN TIMESTAMP WITH TIME ZONE,
                  p_direction IN VARCHAR2)
    RETURN VARCHAR2;

  /**
   * Stop the workflow (run to completion, then stop)
   * 
   -- @param p_workflowId  workflow id
   -- @throws If the workflow is not in running mode, then error
   */
  PROCEDURE WF_STOP(p_workflowId IN NUMBER);

  /**
   * Delete the workflow
   * 
   -- @param p_workflowId workflow id
   -- @throws If the workflow is in either running or edit mode, then error
  */
  PROCEDURE WF_DELETE(p_workflowId IN NUMBER);

  /**
   * Rename the workflow
   *
   -- @param p_workflowId      workflow id
   -- @param p_workflow_name   new workflow name
   -- @param p_mode            mode
   -- @throws If name already existed, then error
   */
  PROCEDURE WF_RENAME(
    p_workflowId    IN NUMBER, 
    p_workflow_name IN VARCHAR2, 
    p_mode          IN CHAR DEFAULT 'R');

  /**
   -- @param p_models IN OUT NOCOPY ODMR_OBJECT_NAMES
   */
  PROCEDURE WF_GET_ALL_MODELS(p_models IN OUT NOCOPY ODMR_OBJECT_NAMES);

  /**
   -- @param p_tables IN OUT NOCOPY ODMR_OBJECT_NAMES
   */
  PROCEDURE WF_GET_ALL_TABLES(p_tables IN OUT NOCOPY ODMR_OBJECT_NAMES);

  /**
   -- @param p_node_type IN VARCHAR2, 
   -- @param p_nodes     IN OUT NOCOPY ODMR_NODE_REFERENCE_SET
   */
  PROCEDURE WF_GET_NODES_BY_TYPE(
    p_node_type IN VARCHAR2, 
    p_nodes     IN OUT NOCOPY ODMR_NODE_REFERENCE_SET);

  /**
   -- @param p_node_type   IN VARCHAR2, 
   -- @param p_project_id  IN NUMBER, 
   -- @param p_workflow_id IN NUMBER, 
   -- @param p_node_id     IN NUMBER
   */
  FUNCTION WF_GET_NODE_CONTENT(
    p_node_type   IN VARCHAR2, 
    p_project_id  IN NUMBER, 
    p_workflow_id IN NUMBER, 
    p_node_id     IN NUMBER) RETURN CLOB;

END ODMR_WORKFLOW;
/
