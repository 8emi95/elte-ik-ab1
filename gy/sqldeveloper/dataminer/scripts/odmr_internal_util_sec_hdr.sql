CREATE OR REPLACE PACKAGE "ODMRSYS"."ODMR_INTERNAL_UTIL_SEC" 
AS

  /**
   -- @param p_user            IN VARCHAR2,
   -- @param p_job             IN VARCHAR2,
   -- @param p_workflowId      IN NUMBER,
   -- @param p_nodeId          IN VARCHAR2,
   -- @param p_node_name       IN VARCHAR2 DEFAULT NULL,
   -- @param p_subnode_id      IN VARCHAR2,
   -- @param p_subnode_name    IN VARCHAR2 DEFAULT NULL,
   -- @param p_message_type    IN VARCHAR2,
   -- @param p_message_subtype IN VARCHAR2,
   -- @param p_message_task    IN VARCHAR2,
   -- @param p_duration        INTERVAL DAY TO SECOND,
   -- @param p_message         IN NVARCHAR2,
   -- @param p_message_details IN VARCHAR2
   */
  PROCEDURE EVENT_LOG(p_user            IN VARCHAR2,
                      p_job             IN VARCHAR2,
                      p_workflowId      IN NUMBER,
                      p_nodeId          IN VARCHAR2,
                      p_node_name       IN VARCHAR2 DEFAULT NULL,
                      p_subnode_id      IN VARCHAR2,
                      p_subnode_name    IN VARCHAR2 DEFAULT NULL,
                      p_message_type    IN VARCHAR2,
                      p_message_subtype IN VARCHAR2,
                      p_message_task    IN VARCHAR2,
                      p_duration        INTERVAL DAY TO SECOND,
                      p_message         IN NVARCHAR2,
                      p_message_details IN VARCHAR2);

  /**
   -- @param p_workflowId IN NUMBER,
   -- @param p_runNode_id IN VARCHAR,
   -- @param p_input_data Resulting SQL expression
   -- @param p_inclusive  IN BOOLEAN DEFAULT TRUE
   */
  PROCEDURE GET_INPUT_DATA (
    p_workflowId IN NUMBER,
    p_runNode_id IN VARCHAR,
    p_input_data IN OUT NOCOPY ODMR_INTERNAL_UTIL.LSTMT_REC_TYPE, -- Resulting SQL expression
    p_inclusive IN BOOLEAN DEFAULT TRUE);

  /**
   * for Update Table Node only, because the SQL expression for UTN can
   * include columns missing from the input sql
   *
   -- @param p_workflowId IN NUMBER,
   -- @param p_runNode_id IN VARCHAR,
   -- @param p_source_attributes  IN ODMR_OBJECT_NAMES,
   -- @param Resulting SQL expression.
   */
  PROCEDURE GET_INPUT_DATA_UTN (
    p_workflowId IN NUMBER,
    p_runNode_id IN VARCHAR,
    p_source_attributes  IN ODMR_OBJECT_NAMES,
    p_input_data IN OUT NOCOPY ODMR_INTERNAL_UTIL.LSTMT_REC_TYPE);-- Resulting SQL expression.

  /**
   -- @param p_workflowId    IN NUMBER,
   -- @param p_runNode_id    IN VARCHAR,
   -- @param p_parentNode_id IN VARCHAR,
   -- @param p_input_data    Resulting SQL expression.
   */
  PROCEDURE GET_INPUT_DATA (
    p_workflowId IN NUMBER,
    p_runNode_id IN VARCHAR,
    p_parentNode_id IN VARCHAR,
    p_input_data IN OUT NOCOPY ODMR_INTERNAL_UTIL.LSTMT_REC_TYPE); -- Resulting SQL expression.

  /**
   -- @param p_property_name IN VARCHAR2
   */
  FUNCTION GET_REPOSITORY_NUM_VALUE(p_property_name IN VARCHAR2) RETURN NUMBER;

  /**
   -- @param p_property_name IN VARCHAR2
   */
  FUNCTION GET_REPOSITORY_STR_VALUE(p_property_name IN VARCHAR2) RETURN VARCHAR2;

  /**
   * DEBUG_ADD_LOG_ROW logs debug trace to ODMR$DEBUG_LOG
   -- @param p_workflow_name IN VARCHAR := NULL,
   -- @param p_workflowId IN NUMBER := NULL,
   -- @param p_nodeId IN VARCHAR2 := NULL,
   -- @param p_subnode_id IN NUMBER := NULL,
   -- @param p_output_mesg IN VARCHAR := NULL,
   -- @param p_output_clob IN CLOB := NULL
   */
  PROCEDURE DEBUG_ADD_LOG_ROW (
    p_workflow_name IN VARCHAR := NULL,
    p_workflowId IN NUMBER := NULL,
    p_nodeId IN VARCHAR2 := NULL,
    p_subnode_id IN NUMBER := NULL,
    p_output_mesg IN VARCHAR := NULL,
    p_output_clob IN CLOB := NULL);

  /**
   -- @param p_workflow_name IN VARCHAR := NULL,
   -- @param p_workflowId IN NUMBER := NULL,
   -- @param p_nodeId IN VARCHAR2 := NULL,
   -- @param p_subnode_id IN NUMBER := NULL,
   -- @param p_output_mesg IN VARCHAR := NULL,
   -- @param p_output_clob IN CLOB := NULL,
   -- @param p_workflow_data IN CLOB := NULL
   */
  PROCEDURE INTERNAL_DEBUG (
    p_workflow_name IN VARCHAR := NULL,
    p_workflowId IN NUMBER := NULL,
    p_nodeId IN VARCHAR2 := NULL,
    p_subnode_id IN NUMBER := NULL,
    p_output_mesg IN VARCHAR := NULL,
    p_output_clob IN CLOB := NULL,
    p_workflow_data IN CLOB := NULL);
    
  /**
   * To run with SQL_TRACE set to TRUE you must alter session for both the user account(dmuser) and ODMRSYS,
   * otherwise you will not have sufficient rights. 
   *  - grant alter session to dmuser; 
   *  -grant alter session to ODMRSYS; 
   * 
   -- @param p_job_name IN VARCHAR2,
   -- @param  p_workflowId IN NUMBER,
   -- @param  p_nodeId IN VARCHAR2,
   -- @param  p_modelId IN VARCHAR2 := NULL,
   -- @param  p_trace_file_suffix IN VARCHAR2 := NULL
   */
  PROCEDURE AUTO_SQL_TRACE(
    p_job_name IN VARCHAR2,
    p_workflowId IN NUMBER,
    p_nodeId IN VARCHAR2,
    p_modelId IN VARCHAR2 := NULL,
    p_trace_file_suffix IN VARCHAR2 := NULL);

  /**
   -- @param p_job_name IN VARCHAR2 := NULL,
   -- @param  p_workflowId IN NUMBER := NULL,
   -- @param  p_nodeId IN VARCHAR2 := NULL,
   -- @param  p_modelId IN VARCHAR2 := NULL,
   -- @param  p_trace_file_suffix IN VARCHAR2 := NULL
   */
  PROCEDURE AUTO_SQL_TRACE_OFF(
    p_job_name IN VARCHAR2 := NULL,
    p_workflowId IN NUMBER := NULL,
    p_nodeId IN VARCHAR2 := NULL,
    p_modelId IN VARCHAR2 := NULL,
    p_trace_file_suffix IN VARCHAR2 := NULL);

  /**
   -- @param p_job_name IN VARCHAR2,
   -- @param p_workflowId IN NUMBER,
   -- @param p_nodeId IN VARCHAR2,
   -- @param p_modelId IN VARCHAR2 := NULL
   */
  PROCEDURE ALTER_SESSION_FIX(
    p_job_name IN VARCHAR2,
    p_workflowId IN NUMBER,
    p_nodeId IN VARCHAR2,
    p_modelId IN VARCHAR2 := NULL);

  
  /**
   -- @param p_workflowId IN NUMBER
   -- @param p_nodeName  IN VARCHAR2
   */
  FUNCTION get_wf_node_id(p_workflowId IN NUMBER, p_nodeName IN VARCHAR2) RETURN VARCHAR2;

  /**
   -- @param p_workflowId IN NUMBER
   -- @param p_nodeId    IN VARCHAR2
   */
  FUNCTION get_wf_node_type(p_workflowId IN NUMBER, p_nodeId IN VARCHAR2) RETURN VARCHAR2;

  /**
   -- @param p_workflowId IN NUMBER
   -- @param p_nodeId    IN VARCHAR2
   */
  FUNCTION get_wf_node_name(p_workflowId IN NUMBER, p_nodeId IN VARCHAR2) RETURN VARCHAR2;

  /**
   -- @param p_workflowId IN NUMBER
   -- @param p_modelId    IN VARCHAR2
   */
  FUNCTION get_wf_model_type(p_workflowId IN NUMBER, p_modelId IN VARCHAR2) RETURN VARCHAR2;

  /**
   -- @param p_workflowId IN NUMBER
   -- @param p_modelId    IN VARCHAR2
   */
  FUNCTION get_wf_model_name(p_workflowId IN NUMBER, p_modelId IN VARCHAR2) RETURN VARCHAR2;

  /**
   -- @param p_value IN VARCHAR2
   */
  FUNCTION replace_nonstardard_characters(p_value IN VARCHAR2) RETURN VARCHAR2;

  /**
   -- @param p_workflowId IN NUMBER,
   -- @param p_runNode_id IN VARCHAR,
   -- @param p_input_data Resulting SQL expression
   */
  PROCEDURE GET_INPUT_DATA_DYN (
    p_workflowId IN NUMBER,
    p_runNode_id IN VARCHAR,
    p_input_data IN OUT NOCOPY ODMR_INTERNAL_UTIL.LSTMT_REC_TYPE );-- Resulting SQL expression

  FUNCTION isCompatibleXmlSchemaVersion(p_version in varchar2) RETURN BOOLEAN;

  -- return TRUE if repository XMLSchema >= p_version.  For example, it returns TRUE if repository XMLSchema is 11.2.1.1.1 and p_version is 11.2.0.1.9
  FUNCTION isCompatibleXMLSchema(p_version in varchar2) RETURN BOOLEAN;

  -- return TRUE if database version >= p_version.  For example, it returns TRUE if database is 12.1.0.0.0 and p_version is 11.2.0.2.0
  FUNCTION isCompatibleDB(p_version in varchar2) RETURN BOOLEAN;

  FUNCTION isCompatibleXMLSchemaAndDB(p_xmlversion in varchar2, p_dbversion in varchar2) RETURN BOOLEAN;

  FUNCTION max_varchar2_size RETURN NUMBER;

  FUNCTION is_binary_xml RETURN BOOLEAN;
  
  FUNCTION is_auto_space_management RETURN NUMBER;

END;
/
