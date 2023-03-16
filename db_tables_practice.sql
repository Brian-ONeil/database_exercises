show databases;
use albums_db;
select database();
show create database albums_db; -- shows how the db was created
show tables;

select *
from albums;

select artist, name
from albums
where artist = 'The Beatles'
	and name = '1'; 
    
select * 
from albums;

select id, name, sales, release_date as released
from albums
where sales > '20';

select artist, name
from albums
where artist = 'pink floyd';

select *
from albums;

select artist, name
from albums
where name = 'Bat Out of Hell';

select artist, name
from albums
where name = 'Sgt. Pepper\'s Lonely Hearts Club Band'; 

select artist, name, genre
from albums
where name = 'Nevermind';

select artist, name, release_date
from albums
where release_date between '1990' and '1999';

show databases;
use employees;
select database();
show tables;

select * 
from employees
where first_name in ('Irena', 'Vidya','Maya')
;

select emp_no, first_name, last_name
from employees
where first_name = 'Irena' 
	or first_name = 'Vidya'
    or first_name = 'Maya';
    
select emp_no, first_name, last_name, gender
from employees
where (first_name = 'Irena' 
	or first_name = 'Vidya'
    or first_name = 'Maya')
    and gender = 'M';
    
select last_name
from employees
where last_name LIKE 'e%';
    
select last_name
from employees
where last_name LIKE 'e%e';

select last_name
from employees
where last_name LIKE '%e';

show databases;
use employees;
select database();
show tables;

select count(*)
from employees;

show databases;
use employees;
select database();

select *
from employees;

show databases;
use chipotle;
select database();
show tables;

select *
from orders; 

select concat(UPPER(item_name), '--', UPPER(quantity)) as item_and_quantity,
	id, quantity, item_name, choice_description, item_price
from orders;

show databases;
use employees;
select database();
show tables;

select *
from employees;

select lower(concat(substr(first_name, 1, 1), 
	substr(last_name, 1, 4),
    substr(emp_no, 1, 4))) as username,
    hire_date
from employees;

select * 
from employees;



select min(item_price), max(item_price), avg(item_price)
from orders;

select *
from employees;

select distinct last_name, first_name
from employees
group by last_name, first_name
order by last_name asc, first_name asc;

select avg(salary)
from employees;

show tables;

select avg(salary)
from salaries;

select *
from dept_emp;

show databases;
use employees;
select database();
show tables;

select dept_no, to_date
from dept_emp
where to_date like '%9999%'
group by dept_no;





