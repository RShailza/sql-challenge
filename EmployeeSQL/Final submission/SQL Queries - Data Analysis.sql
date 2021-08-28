-- Data Analysis
-- Once you have a complete database, do the following:
-- List the following details of each employee: employee number, last name, first name, sex, and salary.

SELECT e.emp_no, e.last_name, e.first_name, e.sex, s.salary 
FROM employees e
	JOIN salaries s
		ON (e.emp_no = s.emp_no)
		ORDER BY emp_no

-- List first name, last name, and hire date for employees who were hired in 1986.

SELECT first_name, last_name, hire_date
FROM employees
	WHERE (hire_date BETWEEN '1986-01-01' AND '1987-01-01')

-- List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.

SELECT m.dept_no, 
	d.dept_name,
	e.emp_no AS manager_emp_no, 
	e.last_name, 
	e.first_name	
FROM employees As e 
	JOIN dept_manager As m
	ON e.emp_no = m.emp_no
		JOIN departments AS d
		 ON m.dept_no = d.dept_no


-- List the department of each employee with the following information: employee number, last name, first name, and department name.

SELECT 
	e.emp_no, 
	e.last_name, 
	e.first_name,
	d.dept_name
FROM employees As e 
	JOIN dept_emp As de
	ON e.emp_no = de.emp_no
		JOIN departments AS d
		 ON de.dept_no = d.dept_no


-- List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."

SELECT first_name, last_name, sex
FROM employees
	WHERE (first_name = 'Hercules') AND (last_name LIKE 'B%')

-- List all employees in the Sales department, including their employee number, last name, first name, and department name.

SELECT e.emp_no, e.Last_name, e.first_name, d.dept_name
FROM employees As e
	JOIN dept_emp As de
	ON e.emp_no = de.emp_no
		JOIN departments As d
		ON de.dept_no = d.dept_no
		WHERE dept_name = 'Sales'
    
-- List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.

SELECT e.emp_no, e.Last_name, e.first_name, d.dept_name
FROM employees As e
	JOIN dept_emp As de
	ON e.emp_no = de.emp_no
		JOIN departments As d
		ON de.dept_no = d.dept_no
		WHERE dept_name = 'Sales' OR dept_name = 'Development'

-- In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.

SELECT last_name, COUNT(*) AS freq_count
FROM Employees
	GROUP BY last_name
	ORDER BY freq_count DESC