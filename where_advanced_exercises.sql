show databases;
use chipotle;
select database();
show tables;
select *
from orders;

select *
from orders;

select DISTINCT item_name
from orders
where item_name like '%bowl%';

show databases;
use employees;
select database();
show tables;



-- Find all current or previous employees with first names 'Irena', 'Vidya', or 'Maya' using IN. 
-- What is the employee number of the top three results? 10200, 10397, 10610
select *
from employees
where first_name in ('Irena', 'Vidya', 'Maya')
;

-- Find all current or previous employees with first names 'Irena', 'Vidya', or 'Maya', as in Q2, but use OR instead of IN.
-- What is the employee number of the top three results? Does it match the previous question? 10200, 10397, 10610, yes

select *
from employees
where first_name IN ('Irena')
	OR first_name in ('Vidya')
    OR first_name in ('Maya');

-- Find all current or previous employees with first names 'Irena', 'Vidya', or 'Maya', using OR, and who is male. What is the employee number of the top three results.
select *
from employees
where first_name in ('Irena', 'Vidya', 'Maya')
	AND gender = 'm';

select *
from employees
where first_name IN ('Irena')
	AND gender = 'm'
	OR first_name in ('Vidya')
    AND gender = 'm'
    OR first_name in ('Maya')
    AND gender = 'm';
    
select *
from employees
where (first_name = 'Irena'
	OR first_name = 'Vidya'
    OR first_name = 'Maya')
    AND gender = 'm';

-- Find all unique last names that start with 'E'.
select *
from employees
where last_name LIKE 'e%';

-- Find all unique last names that start or end with 'E'.
select *
from employees
where last_name LIKE 'e%'
	or last_name LIKE '%e'; 


	

-- Find all unique last names that end with E, but does not start with E?
select *
from employees
where last_name LIKE '%e'
	and last_name NOT LIKE 'e%'; 

-- Find all unique last names that start and end with 'E'.
select *
from employees
where last_name LIKE '%e'
	and last_name LIKE 'e%';
    
    -- another way to do it
    
select *
from employees
where last_name LIKE 'e%e';

-- Find all current or previous employees hired in the 90s. Enter a comment with top three employee numbers. 10008, 10011, 10012
select *
from employees
where hire_date between '1990-01-01' AND '1999-12-31';

-- Find all current or previous employees born on Christmas. Enter a comment with top three employee numbers. 10050, 10180, 10220
select *
from employees
where birth_date LIKE '%12-25%';

-- Find all current or previous employees hired in the 90s and born on Christmas. Enter a comment with top three employee numbers.
select *
from employees
where hire_date > '1990-01-01'
	AND hire_date < '1999-12-31'
    AND birth_date LIKE '%12-25%';

-- Find all unique last names that have a 'q' in their last name.
select *
from employees
where last_name LIKE '%q%';

-- Find all unique last names that have a 'q' in their last name but not 'qu'.
select distinct last_name
from employees
where last_name LIKE '%q%'
	and last_name NOT LIKE '%qu%';
