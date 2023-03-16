select *
from employees;

-- 1.  Find all the current employees with the same hire date as employee  101010  using a subquery.
select *
from employees;

select hire_date
from employees
where emp_no = '101010';

select first_name, last_name, hire_date, to_date 
from employees
join titles using (emp_no)
where to_date > curdate() 
		and hire_date = (select hire_date
		from employees 
		where emp_no = '101010');

-- 2.  Find all the titles ever held by all current employees with the first name Aamod .

select *
from titles;

select title
from employees
join titles using (emp_no)
where titles.emp_no IN (select emp_no from employees where first_name = 'Aamod')
	and titles.to_date > curdate()
group by title;

/* where first_name = 'Aamod'
	and to_date in (select to_date
					from titles
					where to_date > now());

select to_date
from titles
where to_date > now();

select first_name
from employees
where first_name = 'Aamod'; */

-- 3.  How many people in the employees table are no longer working for the company? Give the answer in a comment in your code. 

select count(to_date) -- emp_no, first_name, last_name, to_date
from employees
join titles using (emp_no)
where to_date in (select to_date
				from titles
				where to_date < curdate()); -- 203,184
                
select count(*) AS PrevEmpCount -- 59,900
from employees e 
where emp_no NOT IN (select emp_no from dept_emp where to_date > curdate()); -- 59,900

select *
from employees;

select to_date
from titles
where to_date < now();

-- 4.  Find all the current department managers that are female. List their names in a comment in your code. 

select *
from dept_manager
where gender = 'F';

select first_name, last_name, gender, to_date
from employees
join dept_manager using (emp_no)
where gender = 'F'
	and to_date in (select to_date
	from dept_manager
	where to_date > now()); -- Legleitner, Sigstam, DasSarma, Kambil

select to_date
from dept_manager
where to_date > now();

select first_name, last_name, gender
from employees
join dept_manager using (emp_no)
where;


-- 5.  Find all the employees who currently have a higher salary than the companies overall, historical average salary. 

select first_name, last_name, salary
from employees
join salaries using (emp_no)
where salary > (select avg(salary) as avg_salary
from salaries) and to_date > curdate();

select avg(salary) as avg_salary
from salaries;




-- 6.  How many current salaries are within 1 standard deviation of the current highest salary? (Hint: you can use a built in function to calculate the standard deviation.) What percentage of all salaries is this? 						Hint You will likely use multiple subqueries in a variety of ways 							 							Hint It's a good practice to write out all of the small queries that you can. Add a comment above the query showing the number of rows returned. You will use this number (or the query that produced it) in other, larger queries.

select first_name, last_name, salary, stdv_max_salary
from employees
join salaries using (emp_no)
where salary in ((select stddev(max(salary)), 2)
from salaries);

select round(stddev(salary), 2) from salaries
where to_date > curdate();

select max(salary) from salaries where to_date > curdate();

select * from salaries
where salary > ((select max(salary) - round(stddev(salary), 2) from salaries where to_date > curdate()) and to_date > curdate()) / (select count(*) from salaries s where s.to_date > curdate())
)* 100, 2) as pctmaxstd

select *
from salary;