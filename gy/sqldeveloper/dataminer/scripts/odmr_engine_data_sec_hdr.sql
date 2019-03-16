CREATE OR REPLACE PACKAGE "ODMRSYS"."ODMR_ENGINE_DATA_SEC" 
AS

  /**
   * 
   -- @param p_workflowId  _
   -- @param p_nodeId      _
   -- @param p_schema      _
   -- @param p_table       _
   -- @param p_attributes  _
   -- @param p_attr_types  _
   */
  PROCEDURE get_cache_table_info(
    p_workflowId IN NUMBER, 
    p_nodeId      IN VARCHAR2, 
    p_schema      OUT VARCHAR2, 
    p_table       OUT VARCHAR2, 
    p_attributes  IN OUT NOCOPY ODMR_OBJECT_NAMES, 
    p_attr_types  IN OUT NOCOPY ODMR_OBJECT_NAMES);

  /**
   * 
   -- @param p_workflowId          _
   -- @param p_nodeId              _
   -- @param p_use_full            _
   -- @param p_num_bins            _
   -- @param p_cat_bins            _
   -- @param p_date_bins           _
   -- @param p_grouping_attr       _
   -- @param p_grouping_attr_type  _
   -- @param p_attributes          _
   -- @param p_aliases             _
   -- @param p_attr_types          _
   */
  PROCEDURE get_profile_sample_table_info(
    p_workflowId IN NUMBER, 
    p_nodeId      IN VARCHAR2, 
    p_use_full    OUT VARCHAR2,
    p_num_bins    OUT INTEGER,
    p_cat_bins    OUT INTEGER,
    p_date_bins   OUT INTEGER,
    p_grouping_attr OUT VARCHAR2, 
    p_grouping_attr_type OUT VARCHAR2, 
    p_attributes  IN OUT NOCOPY ODMR_OBJECT_NAMES, 
    p_aliases  IN OUT NOCOPY ODMR_OBJECT_NAMES,
    p_attr_types  IN OUT NOCOPY ODMR_OBJECT_NAMES);

  /**
   * 
   -- @param p_workflowId  _
   -- @param p_nodeId      _
   -- @param p_attributes  _
   */
  PROCEDURE get_profile_output_columns(
    p_workflowId  IN NUMBER, 
    p_nodeId      IN VARCHAR2, 
    p_attributes  IN OUT NOCOPY ODMR_OBJECT_NAMES);

   /**
   *
   -- @param p_workflowId  _
   -- @param p_nodeType    _
   -- @param p_chain_step  _
   -- @param p_attribute   _
   -- @param p_status      _
   -- @param p_commit      _
   */
  PROCEDURE update_attribute_status(
    p_workflowId  IN NUMBER, 
    p_nodeType    IN VARCHAR2, 
    p_chain_step  IN VARCHAR2, 
    p_attribute   IN VARCHAR2, 
    p_status      IN VARCHAR2, 
    p_commit      IN BOOLEAN);

  /**
   * 
   -- @param p_workflowId _
   -- @param p_nodeType   _
   -- @param p_chain_step _
   -- @param p_attribute  _
   -- @param p_status     _
   -- @param p_commit     _
   */
  PROCEDURE update_dbattribute_status(
    p_workflowId IN NUMBER, 
    p_nodeType   IN VARCHAR2, 
    p_chain_step IN VARCHAR2, 
    p_attribute  IN VARCHAR2, 
    p_status     IN VARCHAR2, 
    p_commit     IN BOOLEAN);

  /**
   *
   -- @param p_workflowId  _
   -- @param p_nodeId      _
   -- @param p_db_objects  _
   */
  PROCEDURE delete(
    p_workflowId IN NUMBER, 
    p_nodeId      IN VARCHAR2, 
    p_db_objects  IN OUT NOCOPY ODMR_INTERNAL_UTIL.DB_OBJECTS);
    
  /**
   *
   -- @param p_workflowId    _
   -- @param p_nodeId        _
   -- @param p_use_full      _
   -- @param p_table         _
   -- @param p_table_name    _
   -- @param p_attributes    _
   -- @param p_aliases       _
   -- @param p_types         _
   -- @param p_primary_keys  _
   -- @param p_indices       _
   */
  PROCEDURE get_create_table_node_info(
    p_workflowId IN NUMBER, 
    p_nodeId      IN VARCHAR2, 
    p_use_full    OUT VARCHAR2,
    p_table       OUT VARCHAR2,
    p_table_name  OUT VARCHAR2,
    p_attributes  IN OUT NOCOPY ODMR_OBJECT_NAMES,
    p_aliases     IN OUT NOCOPY ODMR_OBJECT_NAMES,
    p_types       IN OUT NOCOPY ODMR_OBJECT_NAMES,
    p_primary_keys IN OUT NOCOPY ODMR_OBJECT_NAMES,
    p_indices      IN OUT NOCOPY ODMR_OBJECT_NAMES );

  /**
   * 
   -- @param p_workflowId          _
   -- @param p_nodeId              _
   -- @param p_use_full            _
   -- @param p_drop_existing       _
   -- @param p_target_table_name   _
   -- @param p_target_schema_name  _
   -- @param p_target_attributes   _
   -- @param p_source_attributes   _
   */
  PROCEDURE get_update_table_node_info(
    p_workflowId          IN NUMBER, 
    p_nodeId              IN VARCHAR2, 
    p_use_full            OUT VARCHAR2,
    p_drop_existing       OUT VARCHAR2,
    p_target_table_name   OUT VARCHAR2,
    p_target_schema_name  OUT VARCHAR2,
    p_target_attributes  IN OUT NOCOPY ODMR_OBJECT_NAMES,
    p_source_attributes  IN OUT NOCOPY ODMR_OBJECT_NAMES);

  /**
   *
   -- @param p_workflowId  _
   -- @param p_nodeId      _
   -- @param p_db_objects  _
   */
  PROCEDURE drop_create_table_node_tables(p_workflowId IN NUMBER, 
                                          p_nodeId     IN VARCHAR2, 
                                          p_db_objects IN OUT NOCOPY ODMR_INTERNAL_UTIL.DB_OBJECTS);
  
  /**
   *
   -- @param p_workflowId  _
   -- @param p_nodeId      _
   -- @param p_db_objects  _
   */
  PROCEDURE drop_profile_tables(p_workflowId IN NUMBER, 
                                p_nodeId      IN VARCHAR2, 
                                p_db_objects  IN OUT NOCOPY ODMR_INTERNAL_UTIL.DB_OBJECTS);
  
  /**
   *
   -- @param p_workflowId  _
   -- @param p_nodeId      _
   -- @param p_db_objects  _
   */
  PROCEDURE drop_aggr_table_node_tables(p_workflowId IN NUMBER, 
                                        p_nodeId      IN VARCHAR2, 
                                        p_db_objects IN OUT NOCOPY ODMR_INTERNAL_UTIL.DB_OBJECTS);

  /**
   *
   -- @param p_workflowId  _
   -- @param p_nodeId      _
   -- @param p_db_objects  _
   */
  PROCEDURE drop_update_node_tables(
    p_workflowId IN NUMBER, 
    p_nodeId      IN VARCHAR2, 
    p_db_objects  IN OUT NOCOPY ODMR_INTERNAL_UTIL.DB_OBJECTS);
 
  /**
   * Changes the datatype of the transformed column
   *
   -- @param p_workflowId  _
   -- @param p_nodeId      _
   -- @param p_attributes  _
   -- @param p_data_types  _
   */
  PROCEDURE update_attribute_data_types (p_workflowId IN NUMBER, 
                                         p_nodeId     IN VARCHAR2,
                                         p_attributes IN ODMR_OBJECT_NAMES,
                                         p_data_types IN ODMR_OBJECT_NAMES);

  /**
   *
   -- @param p_workflowId   _
   -- @param p_nodeId       _
   -- @param p_stats_table  _
   */
  PROCEDURE get_profile_stats_table(
    p_workflowId  IN NUMBER, 
    p_nodeId      IN VARCHAR2, 
    p_stats_table OUT VARCHAR2);

END;
/
 
