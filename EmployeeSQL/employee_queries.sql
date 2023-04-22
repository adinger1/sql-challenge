--List emp_no, last name, first name, sex, and salary of each employee
select emp_no,last_name,first_name,sex,
	(select salary from salaries where employees.emp_no = salaries.emp_no) as salary
	from employees 
	limit 15

--List the first name, last name, and hire date of employees who were hired in 1986
select first_name,last_name,hire_date from employees 
	where date_part('year',hire_date) = 1986 
	limit 15
	
--List manager of each department with dept number, dept name, emp number, last name, and first name	
select d_man.dept_no,
	(select dept_name from departments where d_man.dept_no = departments.dept_no),
	d_man.emp_no,e.last_name,e.first_name
	from dept_manager as d_man 
		inner join employees as e on d_man.emp_no = e.emp_no 
limit 15

--List each employee's dept_no, emp_no, last_name, first_name, and department name
select dept_emp.dept_no,dept_emp.emp_no,emp.last_name,emp.first_name, 
(select dept_name from departments where dept_emp.dept_no = departments.dept_no)
	from employees as emp inner join dept_emp on emp.emp_no = dept_emp.emp_no 
limit 15

--List first name, last name, and sex of each employees 
--whose first name is Hercules
--and whose last name begins with 'B'
select first_name, last_name,sex from employees
where first_name='Hercules' and last_name like 'B%'
limit 15

--List each employee in the Sales department
select emp_no,last_name,first_name from employees
where emp_no in (select emp_no from dept_emp where dept_no = 'd007')
limit 15

--List each employee the Sales and Development departments
select e.emp_no,e.last_name,e.first_name,departments.dept_name 
from employees as e
	----Join on dept_emp to get to the departments table
	left join dept_emp on e.emp_no = dept_emp.emp_no
	----join on departments table to get department name
	inner join departments on departments.dept_no = dept_emp.dept_no
where departments.dept_name = 'Sales' or departments.dept_name = 'Development'
	 limit 15

--List the frequency counts of all the employee last names in descending order
select last_name, Count(last_name) from employees
group by last_name order by last_name desc
limit 15