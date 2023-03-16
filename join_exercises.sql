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

-- 2. Using the example in the Associative Table Joins section as a guide, write a query that shows each department along with the name of the current manager for that department.

select concat(departments.dept_name) as Department_Name, 
	concat(employees.first_name, ' ', employees.last_name) as Department_Manager
from employees
join dept_manager on employees.emp_no = dept_manager.emp_no
join departments on dept_manager.dept_no = departments.dept_no
where to_date like '%9999%';

select * 
from dept_manager;

-- 3.  Find the name of all departments currently managed by women.
select concat(departments.dept_name) as Department_Name, 
	concat(employees.first_name, ' ', employees.last_name) as Department_Manager
from employees
join dept_manager on employees.emp_no = dept_manager.emp_no
join departments on dept_manager.dept_no = departments.dept_no
where employees.gender = 'F';

-- 4.  Find the current titles of employees currently working in the Customer Service department.

select *
from titles;

select titles.title, count(*)
from titles
join employees on titles.emp_no = employees.emp_no
where titles.to_date like '%9999%'
	-- and departments.dept_name = 'Customer Service'
group by title;



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

-- 6.  Find the number of current employees in each department.
select *
from employees;

select departments.dept_no, departments.dept_name, count(*) 
from employees
join dept_emp on employees.emp_no = dept_emp.emp_no
join departments on dept_emp.dept_no = departments.dept_no
where dept_emp.to_date like '%9999%'
group by departments.dept_name;

-- 7.  Which department has the highest average salary? Hint: Use current not historic information. Sales

select departments.dept_name, avg(salaries.salary) as average_salary
from dept_emp
join salaries on dept_emp.emp_no = salaries.emp_no
join departments on dept_emp.dept_no = departments.dept_no
where salaries.to_date like '%9999%'
group by departments.dept_name
order by average_salary desc
Limit 1;


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

-- 10.  Determine the average salary for each department. Use all salary information and round your results.
select departments.dept_name, round (avg(salaries.salary), 2) as avg_dept_salary
from dept_emp
join salaries on dept_emp.emp_no = salaries.emp_no
join departments on dept_emp.dept_no = departments.dept_no
where salaries.to_date like '%9999%'
group by departments.dept_name
order by average_salary desc;

-- 11.  Bonus Find the names of all current employees, their department name, and their current manager's name.
-- 12.  Bonus Who is the highest paid employee within each department.


