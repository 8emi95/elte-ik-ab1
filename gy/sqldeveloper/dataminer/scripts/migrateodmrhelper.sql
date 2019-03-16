
WHENEVER SQLERROR EXIT SQL.SQLCODE;

EXECUTE dbms_output.put_line('Start migrateodmrhelper. ' || systimestamp);

alter session set current_schema = "SYS";

-- migrate the XML Schema to current version
@@upgradexmlschema.sql

--WHENEVER SQLERROR CONTINUE;

-- upgrade ODMr Repository
alter session set current_schema = "ODMRSYS";

-- install new packages
@@instpackages.sql

-- upgradeRepository.sql sets WHENEVER SQLERROR EXIT SQL.SQLCODE
@@upgradeRepository.sql


--WHENEVER SQLERROR CONTINUE;

-- install the stopwords used for Oracle Text operations
@@inststopwords.sql

-- install NLS messages
@@instmessages.sql

WHENEVER SQLERROR EXIT SQL.SQLCODE;

alter session set current_schema = "SYS";
-- insure there are no invalid objects
@@validateODMRSYS.sql

EXECUTE dbms_output.put_line('Finished migrateodmrhelper. ' || systimestamp);
