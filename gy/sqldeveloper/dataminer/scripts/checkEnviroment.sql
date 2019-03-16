-- Check if the repository is already installed
DECLARE
  v_user_name VARCHAR2(30);
BEGIN
  EXECUTE IMMEDIATE 'select username from DBA_USERS where username = ''ODMRSYS''' INTO v_user_name;
  RAISE_APPLICATION_ERROR(-20000, 'An existing repository is already installed. Please review documenation on how to migrate or drop a repository.');
EXCEPTION
    WHEN NO_DATA_FOUND THEN
    DBMS_OUTPUT.PUT_LINE('Verified that ODMRSYS is not installed.');
END;
/

-- Check the compatibility level
DECLARE
  v_compatible_level VARCHAR2(30);
BEGIN
    EXECUTE IMMEDIATE 'select VALUE from database_compatible_level' INTO v_compatible_level;
    DBMS_OUTPUT.PUT_LINE('database_compatible_level = ' || v_compatible_level);
EXCEPTION
    WHEN NO_DATA_FOUND THEN
    DBMS_OUTPUT.PUT_LINE('compatible_level was not found.');
END;
/

-- Check if a conversion from OR to Binary is required (db 11.2.0.4 and up). If so, does the ODMRSYS account Table Space have ASM setting
DECLARE
  v_db_ver  VARCHAR2(30);
  v_segment VARCHAR2(30);
BEGIN
  SELECT VERSION INTO v_db_ver FROM product_component_version WHERE product LIKE 'Oracle Database%';
  IF ( INSTR(v_db_ver, '11.2.0.3') > 0 
    OR INSTR(v_db_ver, '11.2.0.2') > 0 
    OR INSTR(v_db_ver, '11.2.0.1') > 0 
    OR INSTR(v_db_ver, '11.2.0.0') > 0) THEN
    NULL; -- no OR to Binary is necessary
  ELSE
    SELECT SEGMENT_SPACE_MANAGEMENT INTO v_segment FROM dba_tablespaces WHERE tablespace_name = '&&1';    
    IF (v_segment != 'AUTO') THEN
      RAISE_APPLICATION_ERROR(-20002, 'Default table space with ASM setting is required for installation.');
    ELSE
      dbms_output.put_line('Continue installation');
    END IF;
  END IF;
EXCEPTION
  WHEN NO_DATA_FOUND THEN
  RAISE_APPLICATION_ERROR(-20002, 'Default table space is not found.');
END;
/

-- Check the extent size
DECLARE
  v_securefile  v$parameter.value%type;
  v_block_size  dba_tablespaces.block_size%type;
  v_extent_size dba_tablespaces.initial_extent%type;

BEGIN 
  SELECT value INTO v_securefile FROM v$parameter WHERE name = 'db_securefile';
  
  IF v_securefile = 'ALWAYS' THEN
    SELECT block_size, initial_extent INTO v_block_size, v_extent_size 
    FROM dba_tablespaces WHERE tablespace_name = '&&1';
    
    IF v_extent_size <= (v_block_size * 14) THEN
      RAISE_APPLICATION_ERROR(-20001, 'Extent size too small, must be at least 14 times the block size plus 1');
    ELSE
      dbms_output.put_line('Correct extent size');
    END IF;
  ELSE
    dbms_output.put_line('Continue installation');
END IF;
END;
/
