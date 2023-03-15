-- Warm up
-- Using the customer table from sakila database,
-- find the number of active and inactive users
Select *
From employees;
show databases; 
use sakila;
show tables;

select count(*), active
from customer
where active = 1 and (select count(*), active
from customer
where active = 0);

select active, count(*)
from customer
group by active;


-- 1.  Write a query that returns all employees, their department number, their start date, their end date, and a new column 'is_current_employee' that is a 1 if the employee is still with the company and 0 if not. 

show tables;

select emp_no, dept_no, first_name, last_name, from_date, to_date, 
	if(to_date > curdate(), 1, 0) as with_company
from employees
join dept_emp using (emp_no);


-- 2.  Write a query that returns all employee names (previous and current), and a new column 'alpha_group' that returns 'A-H', 'I-Q', or 'R-Z' depending on the Irst letter of their last name. 

select first_name, last_name,
	CASE
		WHEN last_name < substr('ijklmnopq', 1, 9) THEN 'A-H'
        WHEN last_name = substr('ijklmnopq', 1, 9) THEN 'I-Q'
        WHEN last_name > substr('ijklmnopq', 1, 9) THEN 'R-Z'
	end as alpha_group
from employees;

-- 3.  How many employees (current or previous) were born in each decade? 
select count(*),
	CASE
		WHEN birth_date like '%195%' THEN 'born_50s'
        WHEN birth_date like '%196%' THEN 'born_60s'
        WHEN birth_date like '%197%' THEN 'born_70s'
	END AS born_decade
from employees
group by born_decade;

select *
from employees;

-- WHEN birth_date LIKE ('%196%') THEN born_60s
        -- WHEN birth_date LIKE ('%197%') THEN born_70s
      --  WHEN birth_date LIKE ('%198%') THEN born_80s

-- 4.  What is the current average salary for each of the following department groups: R&D, Sales & Marketing, Prod & QM, Finance & HR, Customer Service?

select *
from departments;

from dept_emp
join employees using (emp_no)
join departments using (dept_no);
group by ;

select *
from salaries;

Select dept_name, dept_group, 
from departments;

SELECT avg(salary),
	CASE        
		WHEN dept_name IN ('research', 'development') THEN 'R&D'
		WHEN dept_name IN ('sales', 'marketing') THEN 'Sales & Marketing'        
		WHEN dept_name IN ('Production', 'Quality Management') THEN 'Prod & QM'        
		ELSE dept_name    
END AS dept_group 
FROM departments
join dept_emp using (dept_no)
join salaries using (emp_no)
group by dept_group
;

(select avg(salary) from salaries) as avg_salary,

join dept_emp using (dept_no)
join salaries using (emp_no);  -- need to add salaries****

select avg(salary) from salaries;



select *
from employees;