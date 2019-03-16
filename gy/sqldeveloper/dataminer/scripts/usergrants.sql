-- Usage @usergrants.sql <P1>
--    P1: User account being configured for use with ODMR
-- Example: @usergrants.sql DMUSER
WHENEVER SQLERROR EXIT SQL.SQLCODE;

DEFINE USER_ACCOUNT = &&1

EXECUTE dbms_output.put_line('Grant access to Data Miner repository objects to specified user. ' || systimestamp);

-- grants access to required objects including the ODMRUSER role
-- also add ODMRUSER to the user's default list of roles
@@usergrantshelper.sql GRANT "&USER_ACCOUNT"

EXECUTE dbms_output.put_line('Finished grant access to Data Miner repository objects to specified user. ' || systimestamp);


exit;