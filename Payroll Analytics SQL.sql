--creating the table of employee details
create table Employee_details(
	Employee_id varchar(50) primary key not null,
	Employee_name varchar(50) not null,
	Department varchar(50) not null,
	Designation varchar(50) not null,
	Employee_Type varchar(50) not null,
	Date_of_Join varchar(50) not null
);

alter table Employee_details
alter column Date_of_join type date
using Date_of_Join :: date;

-- importing file of employee details into SQL
copy Employee_details(employee_id, employee_name, department, designation, employee_type, date_of_join)
from 'C:\Users\naman\Downloads\Employee_details.txt'
with (format text, delimiter E'\t', header true);

-- creating the table of salary details
create table Salary_details(
	employee_id varchar(50) not null,
 	basic_salary numeric(10,2) not null,
 	hra numeric(10,2) not null,
	transport_allowance numeric(10,2) not null,
 	special_allowance numeric(10,2) not null,
 	gross_salary numeric(10,2) not null
);

-- importing data of attendance details
-- copy it via SQL Shell
\copy Salary_details(employee_id, basic_salary, hra, transport_allowance, special_allowance, gross_salary)
from 'C:\Users\naman\Downloads\Salary_details.txt'
with (format text, delimiter E'\t', header true);

create table attendance_details(
	employee_id varchar(50) not null,
	working_days integer not null,
	days_present integer not null, 
	overtime_hours integer not null
);

-- importing the data via SQL Shell
\copy attendance_details(employee_id, working_days, days_present, overtime_hours)
from 'C:\Users\naman\Downloads\attendence_details.txt'
with (format text, delimiter E'\t', header true);

--selection of data
select * from Employee_details;
select * from Salary_details;
select * from attendance_details;

--create the final payroll view
create or replace view payroll_view as 
select 
	e.employee_id,
	e.employee_name,
	e.department,
	e.designation,
	e.employee_type,
	e.date_of_join,

	a.working_days,
	a.days_present,
	a.overtime_hours,

	s.basic_salary,
	s.hra,
	s.transport_allowance,
	s.gross_salary,

-- Attendance-Adjusted Salary
	round(
		s.gross_salary * (a.days_present::numeric/a.working_days),
		2
	) as attendance_adjusted_salary,

-- Hourly Rate
	round(
		s.basic_salary/(a.working_days * 8),
		2	
	) as hourly_rate,

-- overtime payment
	round(
		(s.basic_salary/(a.working_days * 8)) * 1.5 * overtime_hours,
		2
	) as overtime_pay,

--Deductions
	round (s.basic_salary * 0.12, 2) AS pf_deduction,
    200 AS professional_tax,

-- Net Salary
	round(
        (s.gross_salary * (a.days_present::NUMERIC / a.working_days))
        + ((s.basic_salary / (a.working_days * 8)) * 1.5 * a.overtime_hours)
        - (s.basic_salary * 0.12)
        - 200,
        2
    ) AS net_salary

from employee_details as e
join salary_details as s
	on e.employee_id = s.employee_id
join attendance_details as a
	on e.employee_id = a.employee_id;


--view all
select * from payroll_view;
	


