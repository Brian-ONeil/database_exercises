show databases;
use employees;
select database();
show tables;

select *
from employees;

select item_name, quantity
from orders
where item_name Like '%chicken%'
group by item_name, quantity
order by item_name;

show databases;
use employees;
select database();
show tables;

select *
from titles;

-- 2. In your script, use  DISTINCT to find the unique titles in the  titles  table. 
-- How many unique titles have there ever been? 7 Answer that in a comment in your SQL file. 

select distinct(title)
from titles;  -- total of 7

-- 3. Write a query to to find a list of all unique last names of all employees that start and end with  
-- 'E' using group by.
select *
from employees;

select last_name
from employees
where last_name like 'e%e'
group by last_name;

-- 4. Write a query to find all unique combinations of first and last names of all employees whose 
-- last names start and end with 'E'. 
select first_name, last_name
from employees
where last_name like 'e%e'
group by first_name, last_name; -- dont need distinct because 'group by' is finding all the distinct


-- 5.  Write a query to find the unique last names with a  'q'  but not  'qu' . Include those names in a 
-- comment in your sql code. 

select last_name
from employees
where last_name LIKE '%q%'
	and last_name NOT LIKE '%qu%'
group by last_name;

-- 6.  Add a COUNT() to your results (the query above) to and the number of employees with the same 
-- last name. 
select last_name, count(*)
from employees
where last_name LIKE '%q%'
	and last_name NOT LIKE '%qu%'
group by last_name;

-- 7.  Find all all employees with first names  'Irena' ,  'Vidya' , or  'Maya' . Use  COUNT(*)  
-- and  GROUP BY to find the number of employees for each gender with those names.
select first_name, gender, count(*)
from employees
where first_name in ('Irena', 'Vidya', 'Maya')
group by first_name, gender; 

-- 8.  Using your query that generates a username for all of the employees, generate a count 
-- employees for each unique username. 
select LOWER(concat(
substr(first_name, 1, 1), 
substr(last_name, 1, 4), 
'_', 
substr(birth_date, 6, 2),
substr(birth_date, 3, 2))) as username, 
COUNT(*)
from employees
GROUP BY username;

-- 9.  From your previous query, are there any duplicate usernames? Yes 
-- What is the higest number of times a username shows up? 6
-- Bonus: How many duplicate usernames are there from your previous query?

select LOWER(concat(
substr(first_name, 1, 1), 
substr(last_name, 1, 4), 
'_', 
substr(birth_date, 6, 2),
substr(birth_date, 3, 2))) as username, 
COUNT(*)
from employees
GROUP BY username
having count(*) > 1
order by count(*) DESC; -- needed if we have more than 1000 rows in the query