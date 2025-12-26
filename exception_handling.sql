-- Exception Handling Practice

-- 1. Handle Divide by Zero
DECLARE
    v_salary NUMBER;
    v_bonus NUMBER := 0;
BEGIN
    SELECT salary / v_bonus
    INTO v_salary
    FROM employees
    WHERE employee_id = 100;

EXCEPTION
    WHEN ZERO_DIVIDE THEN
        DBMS_OUTPUT.PUT_LINE('Error: Division by zero');
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Error: No employee found');
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
END;
/

-- 2. Handle Insert with Exception
DECLARE
    v_emp_id NUMBER := 1000;
BEGIN
    INSERT INTO employees (employee_id, first_name, last_name, email, hire_date, job_id, salary)
    VALUES (v_emp_id, 'John', 'Doe', 'jdoe@example.com', SYSDATE, 'IT_PROG', 6000);

    COMMIT;
EXCEPTION
    WHEN DUP_VAL_ON_INDEX THEN
        DBMS_OUTPUT.PUT_LINE('Error: Employee ID already exists');
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Unexpected error: ' || SQLERRM);
END;
/

