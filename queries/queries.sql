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

-- Using joins
select employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
from employees
	inner join dept_emp on
	dept_emp.emp_no = employees.emp_no
	inner join departments on
	dept_emp.dept_no = departments.dept_no;

-- -- List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
select first_name, last_name, sex from employees
	where first_name = 'Hercules' and last_name like 'B%';

-- -- List all employees in the Sales department, including their employee number, last name, first name, and department name.
select employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
from employees
	inner join dept_emp on
	dept_emp.emp_no = employees.emp_no
	inner join departments on
	dept_emp.dept_no = departments.dept_no
-- Filtering by id in case sales changes name
where departments.dept_no = 'd007';

-- -- List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
select employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
from employees
	inner join dept_emp on
	dept_emp.emp_no = employees.emp_no
	inner join departments on
	dept_emp.dept_no = departments.dept_no
-- Filtering by id in case sales changes name
where departments.dept_no = 'd007' or departments.dept_no = 'd005';

-- -- In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
select last_name, count(last_name) as LNCount from employees group by last_name order by LNCount desc;