SELECT E."emp_no", E."last_name", E."first_name", E."sex", S."Salary"
FROM "Employees" E
INNER JOIN "Salaries" S ON E."emp_no" = S."Emp_no";

SELECT "first_name", "last_name", "hire_date"
FROM "Employees"
WHERE EXTRACT(YEAR FROM "hire_date") = 1986;

SELECT D."Dept_no", D."Dept_name", E."emp_no", E."last_name", E."first_name" 
FROM "Department_manager" DM
JOIN "Departments" D ON DM."dept_no" = D."Dept_no"
JOIN "Employees" E ON DM."emp_no" = E."emp_no";

SELECT  E."emp_no", E."last_name",  E."first_name", DE."dept_no", D."Dept_name" 
FROM "Employees" E
JOIN  "Department_Employee" DE ON E."emp_no" = DE."emp_no"
JOIN "Departments" D ON DE."dept_no" = D."Dept_no";

SELECT  "first_name", "last_name", "sex" 
FROM "Employees" 
WHERE "first_name" = 'Hercules' 
AND "last_name" LIKE 'B%';

SELECT E."emp_no", E."last_name", E."first_name"
FROM  "Employees" E
JOIN  "Department_Employee" DE ON E."emp_no" = DE."emp_no"
JOIN "Departments" D ON DE."dept_no" = D."Dept_no"
WHERE  D."Dept_name" = 'Sales';

SELECT E."emp_no", E."last_name", E."first_name", D."Dept_name" 
FROM "Employees" E
JOIN "Department_Employee" DE ON E."emp_no" = DE."emp_no"
JOIN "Departments" D ON DE."dept_no" = D."Dept_no"
WHERE D."Dept_name" IN ('Sales', 'Development');

SELECT "last_name", COUNT(*) AS "frequency"
FROM "Employees" 
GROUP BY "last_name"
ORDER BY "frequency" DESC;