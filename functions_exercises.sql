show databases;
use employees;
select database();
show tables;

select *
from albums;

select concat(name, release_date) as release_date_name
	,sales, id, artist
from albums;

show databases;
use employees;
select database();
show tables;

select *
from employees;


-- 1.  Copy the order by exercise and save it as functions_exercises.sql .



-- 2.  Write a query to find all employees whose last name starts and ends with  'E' . 
-- Use  concat() to combine their first and last name together as a single column named full_name.
select concat(first_name, ' ', last_name) as full_name
from employees
where last_name LIKE '%e'
	and last_name LIKE 'e%'
	;


-- 3.  Convert the names produced in your last query to all uppercase. 
select concat(UPPER (first_name), ' ', UPPER(last_name)) as full_name
from employees
where last_name LIKE 'e%e'
	;

-- 4.  Use a function to determine how many results were returned from your previous query. 
select concat(UPPER (first_name), ' ', UPPER(last_name)) as full_name, 
from employees
where last_name LIKE '%e%'
	;
select count(first_name)
from employees
where last_name LIKE '%e%';
-- 165450

-- 5.  Find all employees hired in the 90s and born on Christmas. Use  datediff() function to find how many days
-- they have been working at the company (Hint: You will also need to use  NOW() or  CURDATE()),
select *, datediff(now(), hire_date) as days_since_hire
from employees
where hire_date LIKE '%199%'
    AND birth_date LIKE '%12-25%';



-- 6.  Find the smallest and largest current salary from the  salaries  table. 
select *
from salaries;

select min(salary), max(salary)
from salaries
where to_date > now();


-- 7.  Use your knowledge of built in SQL functions to generate a username for all of the employees. A username
-- should be all lowercase, and consist of the ;rst character of the employees ;rst name, the ;rst 4 characters
-- of the employees last name, an underscore, the month the employee was born, and the last two digits of the
-- year that they were born. Below is an example of what the ;rst 10 rows will look like:
select LOWER(concat(
substr(first_name, 1, 1), 
substr(last_name, 1, 4), 
'_', 
substr(birth_date, 6, 2),
substr(birth_date, 3, 2))) as username
from employees;