-- Complex Queries Practice

-- 1. Join Example: Employees and Departments
SELECT e.employee_id, e.first_name, e.last_name, d.department_name
FROM employees e
JOIN departments d
ON e.department_id = d.department_id
WHERE e.salary > 5000
ORDER BY d.department_name;

-- 2. Aggregation Example: Average Salary by Department
SELECT department_id, AVG(salary) AS avg_salary, COUNT(*) AS num_employees
FROM employees
GROUP BY department_id
HAVING AVG(salary) > 4000;

-- 3. Subquery Example: Employees earning above average
SELECT first_name, last_name, salary
FROM employees
WHERE salary > (
    SELECT AVG(salary)
    FROM employees
);

-- 4. Nested Query with Join
SELECT e.first_name, e.last_name, e.salary, d.department_name
FROM employees e
WHERE e.department_id IN (
    SELECT department_id
    FROM departments
    WHERE location_id = 1700
);

