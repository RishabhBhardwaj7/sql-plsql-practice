-- Stored Procedures Practice

-- 1. Simple Procedure: Increase Employee Salary

CREATE OR REPLACE PROCEDURE increase_salary (
    p_employee_id IN employees.employee_id%TYPE,
    p_increment IN NUMBER
)
IS
BEGIN
    UPDATE employees
    SET salary = salary + p_increment
    WHERE employee_id = p_employee_id;

    COMMIT;
END;
/

-- 2. Procedure with Parameters: Add New Employee
    
CREATE OR REPLACE PROCEDURE add_employee (
    p_first_name IN VARCHAR2,
    p_last_name IN VARCHAR2,
    p_email IN VARCHAR2,
    p_hire_date IN DATE,
    p_job_id IN VARCHAR2,
    p_salary IN NUMBER
)
IS
BEGIN
    INSERT INTO employees (employee_id, first_name, last_name, email, hire_date, job_id, salary)
    VALUES (employees_seq.NEXTVAL, p_first_name, p_last_name, p_email, p_hire_date, p_job_id, p_salary);

    COMMIT;
END;
/

-- 3. Dynamic SQL Example
    
CREATE OR REPLACE PROCEDURE get_employee_by_column (
    p_column_name IN VARCHAR2,
    p_value IN VARCHAR2
)
IS
    v_sql VARCHAR2(1000);
BEGIN
    v_sql := 'SELECT * FROM employees WHERE ' || p_column_name || ' = :1';
    EXECUTE IMMEDIATE v_sql USING p_value;
END;
/

