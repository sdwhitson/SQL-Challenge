-- Commands

--List the employee number, last name, first name, sex, and salary of each employee.
SELECT e.emp_no, e.last_name, e.first_name, e.sex, s.salary
FROM Employees e
JOIN Salaries s ON e.emp_no = s.Emp_no
JOIN Department_Employee de ON e.emp_no = de.emp_no
JOIN Departments d ON de.dept_no = d.Dept_no
ORDER BY e.emp_no;

--List the first name, last name, and hire date for the employees who were hired in 1986.
SELECT e.first_name, e.last_name, e.hire_date
FROM Employees e
WHERE EXTRACT(YEAR FROM e.hire_date) = 1986;

--List the manager of each department along with their department number, department name, employee number, last name, and first name.
SELECT D.Dept_no, D.Dept_name, e.emp_no, e.last_name, e.first_name, M.emp_no AS manager_emp_no
FROM Departments D
JOIN Department_Employee DE ON D.Dept_no = DE.dept_no
JOIN Employees e ON DE.emp_no = e.emp_no
JOIN Department_manager dm ON D.Dept_no = dm.dept_no
JOIN Employees M ON dm.emp_no = M.emp_no;

--List the department number for each employee along with that employee’s employee number, last name, first name, and department name.
SELECT E.emp_no, E.last_name, E.first_name, D.Dept_name, D.Dept_no
FROM Employees E
JOIN Department_Employee DE ON E.emp_no = DE.emp_no
JOIN Departments D ON DE.dept_no = D.Dept_no;

--List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.
SELECT e.first_name, e.last_name, e.sex
FROM employees e
WHERE e.first_name = 'Hercules' AND e.last_name LIKE 'B%';

--List each employee in the Sales department, including their employee number, last name, and first name.
SELECT e.emp_no, e.last_name, e.first_name
FROM employees e
JOIN Department_Employee DE ON e.emp_no = DE.emp_no
JOIN Departments D ON DE.dept_no = D.Dept_no
WHERE D.Dept_name = 'Sales';

--List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees e
JOIN Department_Employee DE ON e.emp_no = DE.emp_no
JOIN Departments D ON DE.dept_no = D.Dept_no
WHERE D.Dept_name IN ('Sales', 'Development');

--List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).
SELECT last_name, COUNT(last_name) AS Frequency
FROM employees
GROUP BY last_name
ORDER BY Frequency DESC;
