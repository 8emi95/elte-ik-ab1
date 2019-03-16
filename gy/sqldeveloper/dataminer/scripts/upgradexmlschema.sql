WHENEVER SQLERROR EXIT SQL.SQLCODE;
EXECUTE dbms_output.put_line('Start Data Miner Repository Workflow schema Upgrade.' || systimestamp);

DECLARE
  wf_version VARCHAR2(30);
BEGIN
  SELECT PROPERTY_STR_VALUE INTO wf_version FROM ODMRSYS.ODMR$REPOSITORY_PROPERTIES WHERE PROPERTY_NAME = 'WF_VERSION';
  dbms_output.put_line('Existing Repository version prior to upgrade is: ' || wf_version);
END;
/

@@schema11_2_0_1_9to11_2_1_1_1.sql
@@schema11_2_1_1_1to11_2_2_1_1.sql

EXECUTE dbms_output.put_line('End Data Miner Repository Workflow schema Upgrade.' || systimestamp);
