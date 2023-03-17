-- Use the  join_example_db . Select all the records from both the  users  and  roles  tables.

show databases;
use join_example_db;
select database();
show tables;

select * 
from roles;

select * 
from users;

-- Use join, left join, and right join to combine results from the  users  and  roles  tables as we did in the lesson. Before you run each query, guess the expected number of results. 4, 4, 6

select *
from roles
join users on roles.id = users.role_id;

select *
from roles
left join users on roles.id = users.id;

select *
from roles
right join users on roles.id = users.id;



-- Although not explicitly covered in the lesson, aggregate functions like count can be used with join queries. Use count and the appropriate join type to get a list of roles along with the number of users that has the role. Hint: You will also need to use  group by  in the query.

SELECT count(*)
FROM roles 
JOIN users ON role_id = users.id;

SELECT count(*)
FROM roles 
LEFT JOIN users ON roles.id = users.id;

SELECT count(*)
FROM roles 
RIGHT JOIN users ON roles.id = users.id;

show databases;
use employees;
select database();
show tables;

SELECT roles.name
FROM roles 
LEFT JOIN users ON roles.id = users.role_id;

SELECT roles.name AS role_name, COUNT(users.name) AS number_of_employees
FROM users
RIGHT JOIN roles ON users.role_id = roles.id
GROUP BY role_name;

-- 2. Using the example in the Associative Table Joins section as a guide, write a query that shows each department along with the name of the current manager for that department.

select concat(departments.dept_name) as Department_Name, 
	concat(employees.first_name, ' ', employees.last_name) as Department_Manager
from employees
join dept_manager on employees.emp_no = dept_manager.emp_no
join departments on dept_manager.dept_no = departments.dept_no
where to_date like '%9999%';

SELECT
	d.dept_name,
	CONCAT(e.first_name, ' ', e.last_name) AS current_department_manager
FROM employees AS e
-- I can have multiple conditions in my JOIN logic. Only current department managers. I have to use "ON".
JOIN dept_manager AS dm ON e.emp_no = dm.emp_no
	AND to_date > CURDATE()
JOIN departments AS d USING(dept_no)
ORDER BY dept_name;
select * 
from dept_manager;

-- 3.  Find the name of all departments currently managed by women.
select concat(departments.dept_name) as Department_Name, 
	concat(employees.first_name, ' ', employees.last_name) as Department_Manager
from employees
join dept_manager on employees.emp_no = dept_manager.emp_no
join departments on dept_manager.dept_no = departments.dept_no
where employees.gender = 'F';

SELECT
	d.dept_name,
	CONCAT(e.first_name, ' ', e.last_name) AS current_department_manager,
	gender
FROM employees AS e
-- I can add logic into my JOIN to now also filter for females only.
JOIN dept_manager AS dm ON e.emp_no = dm.emp_no
	AND to_date > CURDATE()
	AND gender = 'F'
JOIN departments AS d USING(dept_no)
ORDER BY dept_name;

-- 4.  Find the current titles of employees currently working in the Customer Service department.

select *
from titles;

select titles.title, count(*)
from titles
join employees on titles.emp_no = employees.emp_no
where titles.to_date like '%9999%'
	-- and departments.dept_name = 'Customer Service'
group by title;

SELECT 
	t.title,
	COUNT(de.emp_no) AS Count
FROM dept_emp AS de
JOIN titles AS t ON de.emp_no = t.emp_no
	AND t.to_date > CURDATE()
	AND de.to_date > CURDATE()
JOIN departments AS d ON d.dept_no = de.dept_no
	AND dept_name = 'Customer Service'
GROUP BY t.title;

-- 5.  Find the current salary of all current managers.
select *
from dept_manager;

select concat(departments.dept_name) as Department_Name, 
	concat(employees.first_name, ' ', employees.last_name) as Department_Manager, salary
from employees
join dept_manager on employees.emp_no = dept_manager.emp_no
join departments on dept_manager.dept_no = departments.dept_no
join salaries on dept_manager.emp_no = salaries.emp_no
where dept_manager.to_date like '%9999%'
	and salaries.to_date like '%9999%';
    
SELECT
	d.dept_name,
	CONCAT(e.first_name, ' ', e.last_name) AS current_department_manager,
	s.salary
FROM employees AS e
JOIN salaries AS s ON e.emp_no = s.emp_no
	AND s.to_date > CURDATE()
JOIN dept_manager AS dm ON dm.emp_no = e.emp_no
	AND dm.to_date > CURDATE()
JOIN departments AS d USING(dept_no)
ORDER BY dept_name;

-- 6.  Find the number of current employees in each department.
select *
from employees;

select departments.dept_no, departments.dept_name, count(*) 
from employees
join dept_emp on employees.emp_no = dept_emp.emp_no
join departments on dept_emp.dept_no = departments.dept_no
where dept_emp.to_date like '%9999%'
group by departments.dept_name;

SELECT
	d.dept_no,
	d.dept_name,
	COUNT(emp_no) AS num_employees
FROM dept_emp AS de
JOIN departments AS d ON de.dept_no = d.dept_no
	AND de.to_date > CURDATE()
GROUP BY dept_no, dept_name;

-- 7.  Which department has the highest average salary? Hint: Use current not historic information. Sales

select departments.dept_name, avg(salaries.salary) as average_salary
from dept_emp
join salaries on dept_emp.emp_no = salaries.emp_no
join departments on dept_emp.dept_no = departments.dept_no
where salaries.to_date like '%9999%'
group by departments.dept_name
order by average_salary desc
Limit 1;

SELECT
	d.dept_name,
	ROUND(AVG(salary), 2) AS average_salary
FROM dept_emp AS de
JOIN salaries AS s ON de.emp_no = s.emp_no
	AND de.to_date > CURDATE()
	AND s.to_date > CURDATE()
JOIN departments AS d ON de.dept_no = d.dept_no
GROUP BY d.dept_name
ORDER BY average_salary DESC
LIMIT 1;

-- 8.  Who is the highest paid employee in the Marketing department? Akemi Warwick

select *
from departments;

select employees.first_name, employees.last_name 
from employees
join salaries on employees.emp_no = salaries.emp_no
join dept_emp on employees.emp_no = dept_emp.emp_no
join departments on dept_emp.dept_no = departments.dept_no
where salaries.to_date like '%9999%'
	and departments.dept_name = 'marketing'
order by salaries.salary desc
limit 1;

SELECT
	e.first_name,
	e.last_name
FROM employees AS e
JOIN dept_emp AS de ON e.emp_no = de.emp_no
	AND de.to_date > CURDATE()
JOIN salaries AS s ON e.emp_no = s.emp_no
	AND s.to_date > CURDATE()
JOIN departments AS d ON de.dept_no = d.dept_no
	AND d.dept_name = 'Marketing'
ORDER BY s.salary DESC
LIMIT 1;

-- 9.  Which current department manager has the highest salary? M. Vishwani
select employees.first_name, employees.last_name, salaries.salary, departments.dept_name 
from employees
join dept_manager on employees.emp_no = dept_manager.emp_no
join departments on dept_manager.dept_no = departments.dept_no
join salaries on dept_manager.emp_no = salaries.emp_no
where dept_manager.to_date like '%9999%'
	and salaries.to_date like '%9999%'
order by salaries.salary desc
limit 1;

SELECT
	e.first_name,
	e.last_name,
	s.salary,
	d.dept_name
FROM employees AS e
JOIN dept_manager AS dm ON e.emp_no = dm.emp_no
	AND to_date > CURDATE()
JOIN salaries AS s ON e.emp_no = s.emp_no
	AND s.to_date > CURDATE()
JOIN departments AS d USING(dept_no)
ORDER BY s.salary DESC
LIMIT 1;

-- 10.  Determine the average salary for each department. Use all salary information and round your results.
select departments.dept_name, round (avg(salaries.salary), 2) as avg_dept_salary
from dept_emp
join salaries on dept_emp.emp_no = salaries.emp_no
join departments on dept_emp.dept_no = departments.dept_no
where salaries.to_date like '%9999%'
group by departments.dept_name
order by average_salary desc;

SELECT d.dept_name, ROUND(AVG(s.salary),0) AS avg_dept_salary
FROM departments d
JOIN dept_emp de ON d.dept_no = de.dept_no
JOIN salaries s ON e.emp_no = s.emp_no
GROUP BY d.dept_name
ORDER BY avg_dept_salary DESC;

-- 11.  Bonus Find the names of all current employees, their department name, and their current manager's name.
-- 12.  Bonus Who is the highest paid employee within each department.


