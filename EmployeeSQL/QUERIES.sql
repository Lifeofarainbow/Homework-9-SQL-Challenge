-- 1. List the employee number, last name, first name, sex, and 
--salary of each employee.

SELECT e.emp_no, e.last_name, e.first_name, e.sex, s.salary
FROM employees AS e
LEFT JOIN salaries AS s ON
e.emp_no = s.emp_no;


-- 2. List the first name, last name, and hire date for the employees who were hired in 1986

SELECT first_name, last_name, hire_date
FROM employees
WHERE hire_date BETWEEN '01-01-1986' AND '12-31-1986'
ORDER BY hire_date;

-- 3. List the manager of each department along with their department number, 
--department name, employee number, last name, and first name.

SELECT  dm.dept_no, d.dept_name, dm.emp_no, e.last_name, e.first_name
FROM employees AS e
JOIN dept_manager AS dm
ON e.emp_no = dm.emp_no
JOIN departments AS d
ON dm.dept_no = d.dept_no;

-- 4. List the department number for each employee along with that 
--employee’s employee number, last name, first name, and department name.

SELECT de.dept_no, e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees AS e
LEFT JOIN dept_emp AS de
ON e.emp_no = de.emp_no
LEFT JOIN departments AS d
ON d.dept_no = de.dept_no;

-- 5. List first name, last name, and sex of each employee whose first name is 
--Hercules and whose last name begins with the letter B.

SELECT first_name, last_name, sex
FROM employees
WHERE  first_name = 'Hercules' AND 
last_name LIKE 'B%';

--6. List each employee in the Sales department, including their employee number, 
--last name, and first name.

SELECT e.emp_no, e.last_name, e.first_name
FROM employees AS e
JOIN dept_emp AS d_e
ON d_e.emp_no = e.emp_no
WHERE d_e.dept_no = 'd007';

-- 7. List each employee in the Sales and Development departments, 
--including their employee number, last name, first name, and department name.

SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees AS e
JOIN dept_emp AS d_e
ON d_e.emp_no = e.emp_no
JOIN departments AS d
ON d.dept_no = d_e.dept_no
WHERE d_e.dept_no = 'd007' OR
d_e.dept_no = 'd005';

-- 8. List the frequency counts, in descending order, of all the 
--employee last names (that is, how many employees share each last name).

SELECT last_name, COUNT(last_name) AS "last_name count"
FROM employees
GROUP BY last_name
ORDER BY "last_name count" DESC;
