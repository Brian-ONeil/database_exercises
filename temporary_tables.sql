show databases;
use pagel_2183;
select database();
show tables;

-- nothing in it yet

create temporary table my_numbers
(n int unsigned not null,
name varchar(20) not null);


select *
from my_numbers; 

INSERT INTO my_numbers (n, name)
VALUES (1, 'a'), (2, 'b'), (3, 'c'), (4,'d');

select * 
from my_numbers;

--  1.  Using the example from the lesson, create a temporary table called  employees_with_departments  that contains  first_name ,  last_name , and  dept_name  for employees currently with that department. Be absolutely sure to create this table on your own database. If you see "Access denied for user ...", it means that the query was attempting to write a new table to a database that you can only read.

SHOW DATABASES;
USE employees;
SELECT database();

CREATE TEMPORARY TABLE pagel_2183.employees_with_departments AS 
SELECT emp_no, first_name, last_name, dept_no, dept_name 
FROM employees 
JOIN dept_emp USING(emp_no) 
JOIN departments USING(dept_no) 
WHERE to_date > curdate();

use pagel_2183;

select *
from employees_with_departments;


-- a.  Add a column named full_name to this table. It should be a VARCHAR whose length is the sum of the lengths of the Prst name and last name columns. 

ALTER TABLE employees_with_departments
ADD full_name varchar(30) NOT NULL;


-- b.  Update the table so that the  full_name  column contains the correct data. 

UPDATE employees_with_departments
SET full_name = (concat(first_name, ' ', last_name));

select *
from employees_with_departments;

-- c.  Remove the  first_name  and  last_name  columns from the table. 

ALTER TABLE employees_with_departments 
DROP COLUMN last_name;

ALTER TABLE employees_with_departments 
DROP COLUMN first_name;

-- d.  What is another way you could have ended up with this same table?
	-- While creating temp table you can create full_name and not include 	first_name/last_name.

-- 2.  Create a temporary table based on the  payment  table from the  sakila  database. Write the SQL necessary to transform the  amount  column such that it is stored as an integer representing the number of cents of the payment. For example, 1.99 should become 199. 

use sakila;

select *
from payment;

CREATE TEMPORARY TABLE pagel_2183.payment_update AS 
SELECT payment_id, customer_id, staff_id, rental_id, amount, payment_date, last_update 
FROM payment 
LIMIT 100;

ALTER TABLE payment_update
modify amount int not null;

UPDATE payment_update
SET amount = amount * 100;

UPDATE payment_update
SET amounts = amount;

use pagel_2183;
select *
from payment_update;

-- 3.  Find out how the current average pay in each department compares to the overall current pay for everyone at the company. For this comparison, you will calculate the z-score for each salary. In terms of salary, what is the best department right now to work for? The worst?

select avg(salary), std(salary)
from employees.salaries
where to_date > curdate();

create temporary table overall_aggregates as (select avg(salary), std(salary)
from employees.salaries
where to_date > curdate());

select *
from overall_aggregates;

select dept_name, avg(salary) as department_current_average
from employees.salaries
join employees.dept_emp using (emp_no)
join employees.departments using(dept_no)
where employees.dept_emp.to_date > curdate()
and employees.salaries.to_date > curdate()
group by dept_name;

select * 
from current_info;

alter table current_info
add overall_avg float(10, 2);

alter table current_info
add overall_std float(10, 2);

select *
from current_info;

update current_info
set overall_avg =  (select avg(salary) from overall_aggregates);

update current_info
set overall_std =  (select std(salary) from overall_aggregates);

select *
from current_info;

alter table current_info
add zscore float(10,2);

update current_info
set zscore = (department_current_average - overall_avg) / overall_avg;

select *
from current_info
order by zscore desc;

select database();
