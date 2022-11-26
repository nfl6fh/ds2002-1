# DS 2002 - Lab 02
# Nathan Lindley

# 1)
SELECT gender, COUNT(*) AS count FROM employees GROUP BY gender ORDER BY count DESC;

# 2)
SELECT title, ROUND(AVG(salary), 2) AS pay_avg FROM salaries NATURAL JOIN titles GROUP BY title ORDER BY pay_avg DESC;

# 3)
SELECT * FROM (SELECT first_name, last_name, COUNT(*) as Dept_Count FROM employees NATURAL JOIN dept_emp GROUP BY emp_no ORDER BY Dept_Count ASC) AS Temp WHERE Dept_Count >= 2;

# 4)
SELECT first_name, last_name, salary FROM employees NATURAL JOIN salaries ORDER BY salary DESC LIMIT 1;

# 5)
SELECT * FROM (SELECT first_name, last_name, salary FROM employees NATURAL JOIN salaries ORDER BY salary DESC LIMIT 2) AS temp ORDER BY salary ASC LIMIT 1;

# 6)
SELECT MONTH(hire_date), COUNT(*) FROM employees GROUP BY MONTH(hire_date) ORDER BY COUNT(*) DESC;

# 7)
SELECT dept_name, MIN(years) AS youngest FROM (SELECT emp_no, dept_no, DATEDIFF(hire_date, birth_date)/365 AS years FROM employees NATURAL JOIN dept_emp)
	AS emp_age NATURAL JOIN departments GROUP BY dept_name;
    
# 8)
SELECT first_name, last_name, dept_name FROM employees NATURAL JOIN departments WHERE (first_name NOT LIKE '%a%' AND first_name NOT LIKE '%e%'
	AND first_name NOT LIKE '%i%' AND first_name NOT LIKE '%o%' AND first_name NOT LIKE '%u%');

