-- pelda csomagra

CREATE PACKAGE emp_pkg IS
  PROCEDURE getemp;
  FUNCTION avg_salary RETURN NUMBER;
END emp_pkg;
/

CREATE PACKAGE BODY emp_pkg IS

  PROCEDURE getemp IS  -- header
    emp_id  employees.employee_id%type;
    lname   employees.last_name%type;
  BEGIN
    emp_id := 100;
    SELECT last_name INTO lname
    FROM EMPLOYEES
    WHERE employee_id = emp_id;
    DBMS_OUTPUT.PUT_LINE('Last name: '||lname);
  END;


  FUNCTION avg_salary RETURN NUMBER IS
    avg_sal employees.salary%type;
  BEGIN
    SELECT AVG(salary) INTO avg_sal
    FROM EMPLOYEES;
    RETURN avg_sal;
  END;
  
END emp_pkg;
/

