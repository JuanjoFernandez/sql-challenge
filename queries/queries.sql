-- -- List the following details of each employee: employee number, last name, first name, sex, and salary.

select employees.emp_no, employees.last_name, employees.first_name, employees.sex, salaries.salary 
from employees
inner join salaries on
salaries.emp_no=employees.emp_no;

-- -- List first name, last name, and hire date for employees who were hired in 1986.

-- Converting date from string to date type
alter table employees alter column hire_date type date using to_date(hire_date, 'MM/DD/YYYY');

-- Building the Query
select first_name, last_name, hire_date from employees
where hire_date >= '1986-01-01' and hire_date <= '1986-12-31';

-- -- List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.

-- Using joins
select dept_manager.dept_no, departments.dept_name, dept_manager.emp_no, 
	employees.last_name, employees.first_name
from dept_manager
	inner join departments on
	departments.dept_no=dept_manager.dept_no
	inner join employees on
	employees.emp_no=dept_manager.emp_no;
	
-- -- List the department of each employee with the following information: employee number, last name, first name, and department name.

-- Using sub-queries
select emp_no, last_name, first_name,
	(select dept_no
	 from dept_emp
	 where employees.emp_no = dept_emp.emp_no)
from employees;


