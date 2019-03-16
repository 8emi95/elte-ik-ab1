CREATE OR REPLACE PACKAGE "ODMRSYS"."ODMR_UTIL" 
AUTHID CURRENT_USER AS

   TYPE BINNING_GROUP IS RECORD (
      included_list           ODMR_OBJECT_NAMES,
      bin_number              NUMBER );

    TYPE BIN_NUMBERS_ARRAY IS TABLE OF BINNING_GROUP INDEX BY VARCHAR2(32);

  /***
   * Creates table from the user defined sql. <br/ >
   * This procedure is available for the client code.
   *
   -- @param p_result_table_name   name of the result table
   -- @param p_primary_keys        
   -- @param p_indices              
   -- @param p_attributes          list of attributes
   -- @param p_src_table           name of the src table or view
   */
  FUNCTION create_table_external(
    p_result_table_name IN VARCHAR2,
    p_primary_keys      IN ODMR_OBJECT_NAMES,
    p_indices           IN ODMR_OBJECT_NAMES,
    p_attributes        IN ODMR_OBJECT_NAMES,
    p_src_table         IN VARCHAR2) RETURN NUMBER;

  /**
   * Creates view from the user defined specification 
   *
   -- @param p_workflowId        IN NUMBER,
   -- @param p_result_view_name  IN VARCHAR2,
   -- @param p_attributes        IN ODMR_OBJECT_NAMES,
   -- @param p_src_table         IN VARCHAR2
   */
  PROCEDURE create_view_from_spec(
    p_workflowId        IN NUMBER,
    p_result_view_name  IN VARCHAR2,
    p_attributes        IN ODMR_OBJECT_NAMES,
    p_src_table         IN VARCHAR2);

  /**
   * Creates view from the user defined specification 
   *
   -- @param p_workflowId        IN NUMBER,
   -- @param p_result_view_name  IN VARCHAR2,
   -- @param p_attributes        IN ODMR_OBJECT_NAMES,
   -- @param p_src_table         IN ODMR_INTERNAL_UTIL
   */
  PROCEDURE create_view_from_spec(
    p_workflowId        IN NUMBER,
    p_result_view_name  IN VARCHAR2,
    p_attributes        IN ODMR_OBJECT_NAMES,
    p_sql               IN ODMR_INTERNAL_UTIL.LSTMT_REC_TYPE);

  /**
   * Returns specification for the input sql.
   *
   -- @param p_input_sql    SQL expression to evaluate
   -- @param all            the rest are arrays of primitives describing he SQL
   */
  PROCEDURE DESCRIBE_SQL_EXPRESSION(
     p_input_sql  IN     CLOB,
     p_col_names  IN OUT ODMR_OBJECT_VALUES,
     p_col_types  IN OUT ODMR_OBJECT_NAMES,
     p_data_legth IN OUT ODMR_OBJECT_IDS,
     p_precision  IN OUT ODMR_OBJECT_IDS,
     p_scale      IN OUT ODMR_OBJECT_IDS );

--  FUNCTION GENERATE_DEFAULT_DATE_BINS(
--    p_input_sql              IN CLOB, -- input data
--    p_input_column_name      IN VARCHAR2,  -- input column to get bins
--    p_bin_count              IN NUMBER-- number of bins
--    ) RETURN VARCHAR2;
--
  
  /**
   * returns list of default bins for:TIMESTAMP WITH ZONE
   *
   -- @param p_input_sql              input data
   -- @param p_input_column_name      input column to bin
   -- @param p_bin_count              number of bins
   */
  FUNCTION GENERATE_DEFAULT_TS_TZ_BINS(
    p_input_sql              IN CLOB, -- input data
    p_input_column_name      IN VARCHAR2,  -- input column to bin
    p_bin_count              IN NUMBER-- number of bins
    ) RETURN VARCHAR2;

  /**
   * Returns list of default bins
   *
   -- @param p_input_sql              input data
   -- @param p_col_names              resulting bin names
   -- @param p_bin_num_values         resulting bin values
   -- @param p_bin_cat_values         resulting bin values
   -- @param p_bin_categories         resulting bin categories
   -- @param p_disinct_values         all available distinc values
   -- @param p_input_column_name      input column to get bins
   -- @param p_input_column_type      input column data type
   -- @param p_binning_type           EQWIDTH, QTILE, TOPN
   -- @param p_auto                   1 - auto, 0 - manual
   -- @param p_bin_count              number of bins
   */
  PROCEDURE GENERATE_DEFAULT_BINS(
    p_input_sql              IN CLOB,
    p_col_names              IN OUT ODMR_OBJECT_NAMES,
    p_bin_num_values         IN OUT ODMR_OBJECT_IDS,
    p_bin_cat_values         IN OUT ODMR_OBJECT_VALUES,
    p_bin_categories         IN OUT ODMR_OBJECT_VALUES,
    p_disinct_values         IN OUT ODMR_OBJECT_VALUES,
    p_input_column_name      IN VARCHAR2,
    p_input_column_type      IN VARCHAR2,
    p_binning_type           IN VARCHAR2,
    p_auto                   IN INTEGER,
    p_bin_count              IN NUMBER );
  
  /**
   * Code to be called from the client transformations node
   *
   -- @param p_input_sample_table   name of the input sample table
   -- @param  p_statistics_table    name of the existing stats table
   -- @param p_cat_bins             number of cat bins to use for histogram
   -- @param p_num_bins             number of num bins to use for histogram
   -- @param p_date_bins            number of num bins to use for histogram
   -- @param p_src_columns          list of src columns for which statsistics is missing
   -- @param p_src_col_types        list of src columns for which statsistics is missing
   -- @param p_out_atrs_topn        list of output names for topn
   -- @param p_src_atrs_topn        list of source columns for topn
   -- @param p_topn_bin_counts      topn bin number
   -- @param p_topn_other           topn "other" value
   -- @param p_out_atrs_topn_nc     list of output names for topn
   -- @param p_src_atrs_topn_nc     list of source columns for topn
   -- @param p_topn_bin_counts_nc topn bin number
   -- @param p_topn_other_nc      topn "other" value
   -- @param p_out_atrs_eqw       list of output names for eq.width
   -- @param p_src_atrs_eqw       list of source columns for eq.width
   -- @param p_src_atrs_eqw_types list of source columns types for eq.width
   -- @param p_bin_counts_eqw     eqw bin number
   -- @param p_bin_auto_eqw       BinGeneration auto
   -- @param p_bin_man_eqw        BinGeneration manual
   -- @param p_bin_num_seq_eqw    BinLabels num seq
   -- @param p_out_atrs_date_eqw  list of output names for eq.width
   -- @param p_src_atrs_date_eqw  list of source columns for eq.width
   -- @param p_bin_counts_date_eqw eqw bin number
   -- @param p_bin_auto_date_eqw  BinGeneration auto
   -- @param p_bin_man_date_eqw   BinGeneration manual
   -- @param p_bin_num_seq_date_eqw BinLabels num seq
   -- @param p_out_atrs_tz_eqw  list of output names for eq.width
   -- @param p_src_atrs_tz_eqw  list of source columns for eq.width
   -- @param p_bin_counts_tz_eqw eqw bin number
   -- @param p_bin_auto_tz_eqw  BinGeneration auto
   -- @param p_bin_man_tz_eqw   BinGeneration manual
   -- @param p_bin_num_seq_tz_eqw BinLabels num seq
   -- @param p_out_atrs_qtile     list of output names for qtile
   -- @param p_src_atrs_qtile     list of source columns for qtile
   -- @param p_bin_counts_qtile   qtile bin number
   -- @param p_bin_auto_qtile     BinGeneration auto
   -- @param p_bin_man_qtile      BinGeneration manual
   -- @param p_bin_num_seq_qtile  BinLabels num seq
   -- @param p_out_atrs_cus_date  list of output names for cust. date
   -- @param p_src_atrs_cus_date  list of source columns for cust. date
   -- @param p_bin_date_seq       BinLabels date seq
   -- @param p_cust_date_bin_names 
   -- @param p_cust_date_low_bnds 
   -- @param p_out_atrs_cus_ts_tz   list of output names for cust. timestamp with time zone
   -- @param p_src_atrs_cus_ts_tz   list of source columns for cust. timestamp with time zone
   -- @param p_bin_ts_tz_seq        BinLabels date seq
   -- @param p_cust_ts_tz_bin_names 
   -- @param p_cust_ts_tz_low_bnds  
   -- @param p_out_atrs_cusn      list of output names for cust. num
   -- @param p_src_atrs_cusn      list of source columns for cust. num
   -- @param p_bin_num_seq_cusn   BinLabels num seq
   -- @param p_num_bin_names_cusn  
   -- @param p_num_low_bnds_cusn  
   -- @param p_out_atrs_cusc      list of output names for cust. cat
   -- @param p_src_atrs_cusc      list of source columns for cust. cat
   -- @param p_cat_bin_names_cusc 
   -- @param p_is_others_cusc     
   -- @param p_bin_values_cusc    
   -- @param p_out_atrs_mvc       list of output names for cust. cat
   -- @param p_src_atrs_mvc       list of source columns for cust. cat
   -- @param p_src_atrs_types_mvc list of source types for cust. cat
   -- @param p_mv_cat_function    functions: Mode
   -- @param p_mv_cat_replace     replacement values
   -- @param p_out_atrs_mvn       list of output names for cust. cat
   -- @param p_src_atrs_mvn       list of source columns for cust. cat
   -- @param p_mv_num_function    functions: Mean, Max, Min
   -- @param p_mv_num_replace     replacement values
   -- @param p_out_atrs_mv_date     list of output names for cust. cat
   -- @param p_src_atrs_mv_date     list of source columns for cust. cat
   -- @param p_mv_date_function     functions: Mean, Max, Min
   -- @param p_mv_date_replace      replacement values
   -- @param p_out_atrs_mv_tz       list of output names for cust. cat
   -- @param p_src_atrs_mv_tz       list of source columns for cust. cat
   -- @param p_mv_tz_function       functions: Mean, Max, Min
   -- @param p_mv_tz_replace        replacement values
   -- @param p_meta_statistics_table   name of the stats table in the metadata
   -- @param p_out_atrs_outlier        list of output names for cust. cat
   -- @param p_src_atrs_outlier        list of source columns for cust. cat
   -- @param p_outlier_type            tandardDeviation, Value, Percent
   -- @param p_replace_with            EdgeValues or Nulls
   -- @param p_outlier_multiple_value  outlier multiple
   -- @param p_outlier_upper_value     outlier upper value
   -- @param p_outlier_lower_percent   outlier lower percent
   -- @param p_outlier_upper_percent   outlier upper percent
   -- @param p_out_atrs_norm      list of output names for Normalization
   -- @param p_src_atrs_norm      list of source columns for Normalization
   -- @param p_norm_type          MinMax, ZScore, LinearScale, Custom
   -- @param p_norm_custom_shift  custom shift
   -- @param p_norm_custom_scale  custom scale
   -- @param p_out_atrs_custom    list of output names for Custom
   -- @param p_src_atrs_custom    list of source columns for Custom
   -- @param p_cust_transforms    custom sql expresions
   */
  FUNCTION CLIENT_TRANSFORM(
    p_input_sample_table IN VARCHAR2, -- name of the input sample table
    p_statistics_table   IN VARCHAR2, -- name of the existing stats table
    p_cat_bins           IN INTEGER, -- number of cat bins to use for histogram
    p_num_bins           IN INTEGER, -- number of num bins to use for histogram
    p_date_bins          IN INTEGER, -- number of num bins to use for histogram
    -- missing statistics
    p_src_columns        IN ODMR_OBJECT_NAMES, -- list of src columns for which statsistics is missing
    p_src_col_types      IN ODMR_OBJECT_NAMES, -- list of src columns for which statsistics is missing
    -- topn
    p_out_atrs_topn      IN ODMR_OBJECT_NAMES, -- list of output names for topn
    p_src_atrs_topn      IN ODMR_OBJECT_NAMES, -- list of source columns for topn
    p_topn_bin_counts    IN ODMR_OBJECT_IDS,  -- topn bin number
    p_topn_other         IN ODMR_OBJECT_VALUES,  -- topn "other" value
    -- topn NC
    p_out_atrs_topn_nc   IN ODMR_OBJECT_NAMES, -- list of output names for topn
    p_src_atrs_topn_nc   IN ODMR_OBJECT_NAMES, -- list of source columns for topn
    p_topn_bin_counts_nc IN ODMR_OBJECT_IDS,  -- topn bin number
    p_topn_other_nc      IN ODMR_OBJECT_VALUES,  -- topn "other" value
    -- eqw
    p_out_atrs_eqw       IN ODMR_OBJECT_NAMES, -- list of output names for eq.width
    p_src_atrs_eqw       IN ODMR_OBJECT_NAMES, -- list of source columns for eq.width
    p_src_atrs_eqw_types IN ODMR_OBJECT_NAMES, -- list of source columns types for eq.width
    p_bin_counts_eqw     IN ODMR_OBJECT_IDS,  -- eqw bin number
    p_bin_auto_eqw       IN ODMR_OBJECT_IDS,  -- BinGeneration auto
    p_bin_man_eqw        IN ODMR_OBJECT_IDS,  -- BinGeneration manual
    p_bin_num_seq_eqw    IN ODMR_OBJECT_IDS,  -- BinLabels num seq
    -- date eqw
    p_out_atrs_date_eqw  IN ODMR_OBJECT_NAMES, -- list of output names for eq.width
    p_src_atrs_date_eqw  IN ODMR_OBJECT_NAMES, -- list of source columns for eq.width
    p_bin_counts_date_eqw IN ODMR_OBJECT_IDS,  -- eqw bin number
    p_bin_auto_date_eqw  IN ODMR_OBJECT_IDS,  -- BinGeneration auto
    p_bin_man_date_eqw   IN ODMR_OBJECT_IDS,  -- BinGeneration manual
    p_bin_num_seq_date_eqw IN ODMR_OBJECT_IDS,  -- BinLabels num seq
    -- TIMESTAMP WITH TIME ZONE   eqw
    p_out_atrs_tz_eqw  IN ODMR_OBJECT_NAMES, -- list of output names for eq.width
    p_src_atrs_tz_eqw  IN ODMR_OBJECT_NAMES, -- list of source columns for eq.width
    p_bin_counts_tz_eqw IN ODMR_OBJECT_IDS,  -- eqw bin number
    p_bin_auto_tz_eqw  IN ODMR_OBJECT_IDS,  -- BinGeneration auto
    p_bin_man_tz_eqw   IN ODMR_OBJECT_IDS,  -- BinGeneration manual
    p_bin_num_seq_tz_eqw IN ODMR_OBJECT_IDS,  -- BinLabels num seq
    -- qtile
    p_out_atrs_qtile     IN ODMR_OBJECT_NAMES, -- list of output names for qtile
    p_src_atrs_qtile     IN ODMR_OBJECT_NAMES, -- list of source columns for qtile
    p_bin_counts_qtile   IN ODMR_OBJECT_IDS,  -- qtile bin number
    p_bin_auto_qtile     IN ODMR_OBJECT_IDS,  -- BinGeneration auto
    p_bin_man_qtile      IN ODMR_OBJECT_IDS,  -- BinGeneration manual
    p_bin_num_seq_qtile  IN ODMR_OBJECT_IDS,  -- BinLabels num seq
    -- cust date.
    p_out_atrs_cus_date  IN ODMR_OBJECT_NAMES, -- list of output names for cust. date
    p_src_atrs_cus_date  IN ODMR_OBJECT_NAMES, -- list of source columns for cust. date
    p_bin_date_seq       IN ODMR_OBJECT_IDS,  -- BinLabels date seq
    p_cust_date_bin_names IN ODMR_OBJECT_VALUES, 
    p_cust_date_low_bnds IN ODMR_OBJECT_VALUES,
    -- cust. timestamp with time zone
    p_out_atrs_cus_ts_tz   IN ODMR_OBJECT_NAMES, -- list of output names for cust. timestamp with time zone
    p_src_atrs_cus_ts_tz   IN ODMR_OBJECT_NAMES, -- list of source columns for cust. timestamp with time zone
    p_bin_ts_tz_seq        IN ODMR_OBJECT_IDS,  -- BinLabels date seq
    p_cust_ts_tz_bin_names IN ODMR_OBJECT_VALUES, 
    p_cust_ts_tz_low_bnds  IN ODMR_OBJECT_VALUES,
    -- cust n.
    p_out_atrs_cusn      IN ODMR_OBJECT_NAMES, -- list of output names for cust. num
    p_src_atrs_cusn      IN ODMR_OBJECT_NAMES, -- list of source columns for cust. num
    p_bin_num_seq_cusn   IN ODMR_OBJECT_IDS,  -- BinLabels num seq
    p_num_bin_names_cusn IN ODMR_OBJECT_VALUES, 
    p_num_low_bnds_cusn  IN ODMR_OBJECT_IDS,
    -- cust c.
    p_out_atrs_cusc      IN ODMR_OBJECT_NAMES, -- list of output names for cust. cat
    p_src_atrs_cusc      IN ODMR_OBJECT_NAMES, -- list of source columns for cust. cat
    p_cat_bin_names_cusc IN ODMR_OBJECT_VALUES, 
    p_is_others_cusc     IN ODMR_OBJECT_IDS,
    p_bin_values_cusc    IN ODMR_OBJECT_VALUES,
    -- miss. val. cat
    p_out_atrs_mvc       IN ODMR_OBJECT_NAMES, -- list of output names for cust. cat
    p_src_atrs_mvc       IN ODMR_OBJECT_NAMES, -- list of source columns for cust. cat
    p_src_atrs_types_mvc IN ODMR_OBJECT_NAMES, -- list of source types for cust. cat
    p_mv_cat_function    IN ODMR_OBJECT_VALUES,  -- functions: Mode
    p_mv_cat_replace     IN ODMR_OBJECT_VALUES,  -- replacement values
    -- miss. val. num
    p_out_atrs_mvn       IN ODMR_OBJECT_NAMES, -- list of output names for cust. cat
    p_src_atrs_mvn       IN ODMR_OBJECT_NAMES, -- list of source columns for cust. cat
    p_mv_num_function    IN ODMR_OBJECT_VALUES,  -- functions: Mean, Max, Min
    p_mv_num_replace     IN ODMR_OBJECT_IDS,  -- replacement values
    -- miss. val. timestamp/date
    p_out_atrs_mv_date     IN ODMR_OBJECT_NAMES, -- list of output names for cust. cat
    p_src_atrs_mv_date     IN ODMR_OBJECT_NAMES, -- list of source columns for cust. cat
    p_mv_date_function     IN ODMR_OBJECT_VALUES,  -- functions: Mean, Max, Min
    p_mv_date_replace      IN ODMR_OBJECT_VALUES,  -- replacement values
    -- miss. val. timestamp with timezone
    p_out_atrs_mv_tz       IN ODMR_OBJECT_NAMES, -- list of output names for cust. cat
    p_src_atrs_mv_tz       IN ODMR_OBJECT_NAMES, -- list of source columns for cust. cat
    p_mv_tz_function       IN ODMR_OBJECT_VALUES,  -- functions: Mean, Max, Min
    p_mv_tz_replace        IN ODMR_OBJECT_VALUES,  -- replacement values
    -- outlier
    p_meta_statistics_table   IN VARCHAR2, -- name of the stats table in the metadata
    p_out_atrs_outlier        IN ODMR_OBJECT_NAMES, -- list of output names for cust. cat
    p_src_atrs_outlier        IN ODMR_OBJECT_NAMES, -- list of source columns for cust. cat
    p_outlier_type            IN ODMR_OBJECT_VALUES, -- StandardDeviation, Value, Percent
    p_replace_with            IN ODMR_OBJECT_VALUES, -- EdgeValues or Nulls
    p_outlier_multiple_value  IN ODMR_OBJECT_IDS,  -- outlier multiple
    p_outlier_lower_value     IN ODMR_OBJECT_IDS,  -- outlier lower value
    p_outlier_upper_value     IN ODMR_OBJECT_IDS,  -- outlier upper value
    p_outlier_lower_percent   IN ODMR_OBJECT_IDS,  -- outlier lower percent
    p_outlier_upper_percent   IN ODMR_OBJECT_IDS,  -- outlier upper percent
    -- normalization
    p_out_atrs_norm      IN ODMR_OBJECT_NAMES,  -- list of output names for Normalization
    p_src_atrs_norm      IN ODMR_OBJECT_NAMES,  -- list of source columns for Normalization
    p_norm_type          IN ODMR_OBJECT_VALUES, -- MinMax, ZScore, LinearScale, Custom
    p_norm_custom_shift  IN ODMR_OBJECT_IDS,    -- custom shift
    p_norm_custom_scale  IN ODMR_OBJECT_IDS,    -- custom scale
    -- custom
    p_out_atrs_custom    IN ODMR_OBJECT_NAMES,  -- list of output names for Custom
    p_src_atrs_custom    IN ODMR_OBJECT_NAMES,  -- list of source columns for Custom
    p_cust_transforms    IN ODMR_OBJECT_VALUES -- custom sql expresions
  ) RETURN VARCHAR2;

  /***
   * Determines whether the SQL is valid and if it is returns the type 
   * of the created column.
   *
   -- @param p_input_sql              IN CLOB,-- input data
   -- @param p_out_column_type        IN OUT VARCHAR2
  */
  PROCEDURE CLIENT_VALIDATE_SQL(
    p_input_sql              IN CLOB,-- input data
    p_out_column_type        IN OUT VARCHAR2 );

  /**
   -- @param p_string  VARCHAR2
   */
  FUNCTION get_varchar2_byte_length( p_string  VARCHAR2 ) RETURN INTEGER;
  
  /**
   -- @param p_clob CLOB
   */
  FUNCTION get_clob_byte_length( p_clob  CLOB ) RETURN INTEGER;

  /**
   * Creates table from the user defined sql.
   * This procedure is available for the client code.
   *
   -- @param p_result_table_name   name of the result table
   -- @param p_primary_keys        IN ODMR_OBJECT_NAMES,
   -- @param p_indices             IN ODMR_OBJECT_NAMES,
   -- @param p_attributes          list of attributes
   -- @param p_aliases             list of aliases ( can be null )
   -- @param p_src_table            name of the src table or view
  */
  FUNCTION create_table_external2(
    p_result_table_name IN VARCHAR2,
    p_primary_keys      IN ODMR_OBJECT_NAMES,
    p_indices           IN ODMR_OBJECT_NAMES,
    p_attributes        IN ODMR_OBJECT_NAMES,
    p_aliases           IN ODMR_OBJECT_NAMES,
    p_src_table         IN VARCHAR2) RETURN NUMBER;

  /**
   * Public method CLIENT_CALCULATE_HISTOGRAMS. <br />
   * Used in Code Generation. Persists the histograms data into the
   * HISTOGRAMS column of the statsistical table
   * 
   -- @param p_input_table           IN VARCHAR2,
   -- @param  p_stats_table_name      IN VARCHAR2,
   -- @param  p_num_bins              IN INTEGER,
   -- @param  p_cat_bins              IN INTEGER,
   -- @param  p_date_bins             IN INTEGER,
   -- @param  p_grouping_column       IN VARCHAR2,
   -- @param  p_grouping_column_type  IN VARCHAR2,
   -- @param  p_columns               IN ODMR_OBJECT_NAMES,
   -- @param  p_column_data_types     IN ODMR_OBJECT_NAMES
  */
  PROCEDURE CLIENT_CALCULATE_HISTOGRAMS (
    p_input_table           IN VARCHAR2,
    p_stats_table_name      IN VARCHAR2,
    p_num_bins              IN INTEGER,
    p_cat_bins              IN INTEGER,
    p_date_bins             IN INTEGER,
    p_grouping_column       IN VARCHAR2,
    p_grouping_column_type  IN VARCHAR2,
    p_columns               IN ODMR_OBJECT_NAMES,
    p_column_data_types     IN ODMR_OBJECT_NAMES);

  /**
   * Returns list of requested bins for multiple columns
   * EQWIDTH only
   *
   -- @param p_input_sql              input data
   -- @param p_input_column_names     input columns to bins
   -- @param p_bin_counts             requested number of bins for each input column
   -- @param p_col_names              resulting bin names
   -- @param p_bin_num_values         resulting bin values
   -- @param p_bin_ids                resulting bin ids ( 1, 2, 3 ...)
   */
  PROCEDURE GENERATE_MULTI_EQW_BINS(
    p_input_sql              IN CLOB,
    p_input_column_names     IN ODMR_OBJECT_VALUES,
    p_bin_counts             IN ODMR_OBJECT_IDS,
    p_col_names              IN OUT ODMR_OBJECT_NAMES,
    p_bin_num_values         IN OUT ODMR_OBJECT_IDS,  
    p_bin_ids                IN OUT ODMR_OBJECT_VALUES);

  /**
   * Returns list of requested bins for multiple columns.
   * TOPN only
   *
   -- @param p_input_sql              input data
   -- @param p_input_column_names     input columns to bins
   -- @param p_bin_counts             numbers of bins
   -- @param p_col_names              resulting bin names
   -- @param p_bin_cat_values         resulting bin values
   -- @param p_bin_ids                resulting bin ids
   */
  PROCEDURE GENERATE_MULTI_TOPN_BINS(
    p_input_sql              IN CLOB,
    p_input_column_names     IN ODMR_OBJECT_VALUES,
    p_bin_counts             IN ODMR_OBJECT_IDS,
    p_col_names              IN OUT ODMR_OBJECT_NAMES,
    p_bin_cat_values         IN OUT ODMR_OBJECT_VALUES,
    p_bin_ids                IN OUT ODMR_OBJECT_VALUES);

  /**
   -- @param p_input_table_name       input data
   -- @param p_input_column_names     input columns to bins
   -- @param p_bin_counts             requested number of bins for each input column
   -- @param p_res_col_names          names of binned cols
   -- @param p_lower_bounds           output results: lower bounds
   -- @param p_upper_bounds           output results: upper bounds
   */
  PROCEDURE GENERATE_TS_TZ_BINS(
    p_input_table_name       IN VARCHAR2,
    p_input_column_names     IN ODMR_OBJECT_VALUES,
    p_bin_counts             IN ODMR_OBJECT_IDS,
    p_res_col_names          IN OUT ODMR_OBJECT_VALUES,
    p_lower_bounds           IN OUT ODMR_OBJECT_VALUES,
    p_upper_bounds           IN OUT ODMR_OBJECT_VALUES);

  /**
   -- @param p_input_table_name       input data
   -- @param p_input_column_names     input columns to bins
   -- @param p_bin_counts             requested number of bins for each input column
   -- @param p_res_col_names          names of binned cols
   -- @param p_lower_bounds           output results: lower bounds
   -- @param p_upper_bounds           output results: upper bounds
   */
  PROCEDURE GENERATE_DATE_BINS( 
    p_input_table_name       IN VARCHAR2,
    p_input_column_names     IN ODMR_OBJECT_VALUES,
    p_bin_counts             IN ODMR_OBJECT_IDS,
    p_res_col_names          IN OUT ODMR_OBJECT_VALUES,
    p_lower_bounds           IN OUT ODMR_OBJECT_VALUES,
    p_upper_bounds           IN OUT ODMR_OBJECT_VALUES);

  /**
   * Returns list of requested bins for multiple columns
   * Binning types supported: TOPN, EQW 
   *
   -- @param p_input_sql              input data
   -- @param p_input_column_names     input columns to bin
   -- @param p_input_column_types     input columns types
   -- @param p_bin_counts             numbers of bins
   -- @param p_col_names              resulting bin names
   -- @param p_bin_num_values         resulting numeric bin values
   -- @param p_bin_cat_values         resulting categorical bin values
   -- @param p_bin_ids                resulting bin ids
   */
  PROCEDURE GENERATE_MULTI_BINS(
    p_input_sql              IN CLOB,
    p_input_column_names     IN ODMR_OBJECT_VALUES,
    p_input_column_types     IN ODMR_OBJECT_VALUES,
    p_bin_counts             IN ODMR_OBJECT_IDS,
    p_col_names              IN OUT ODMR_OBJECT_NAMES,
    p_bin_num_values         IN OUT ODMR_OBJECT_IDS,
    p_bin_cat_values         IN OUT ODMR_OBJECT_VALUES,
    p_bin_ids                IN OUT ODMR_OBJECT_VALUES);

  /**
   * Formats the stack to be displayed:
   *
   -- @param p_function_name IN VARCHAR2,
   -- @param p_sqlerr        IN VARCHAR2,
   -- @param p_error_stack   IN VARCHAR2
   */
  FUNCTION FORMAT_ERROR_STACK(
    p_function_name IN VARCHAR2,
    p_sqlerr        IN VARCHAR2,
    p_error_stack   IN VARCHAR2 ) RETURN VARCHAR2;

  /** Provide a list of fully qualified model names and returns a piped record result set of
    *   models that have a imbedded scoring cost matrix.
    *   The input consists of 2 collections of paired user and model names.
    *   If a model does not exist, it will not cause an exception.
    *
    -- @param p_users        A collection of user account names.
    -- @param p_model_names  A collection of modle names.
    -- @return ODMR_QUALIFIED_OBJECT_NAMES - A piped record containing fully qualified model names.
    */
  FUNCTION GET_MODELS_WITH_COST_MATRIX(
    p_users ODMR_OBJECT_NAMES,
    p_model_names ODMR_OBJECT_NAMES)
  RETURN ODMR_QUALIFIED_OBJECT_NAMES PIPELINED; 

  /*
   * Return 1 if ODMRSYS table space management is AUTO
   */
  FUNCTION is_auto_space_management RETURN NUMBER;

  /*
   * Return 1 if Binary XML storage type is detected 
   */
  FUNCTION is_binary_xml RETURN NUMBER;

END ODMR_UTIL;
/
