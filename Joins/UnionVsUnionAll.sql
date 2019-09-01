-- Union All is used to
-- combine a few select statements  in a single output.
-- it allows us to unify tables.
-- syntax
				-- select n_columns
				-- from table_1
				-- union all 
				-- select n_columns
				-- from table_2
-- no of column retrieved from both table should be same.alter
-- columns sahould have same name , should be in same order and should comtain related data type.

Use Employees;

Drop table if exists employees_dup;

CREATE TABLE employees_dup (
    emp_no INT(11),
    birth_date DATE,
    first_name VARCHAR(14),
    last_name VARCHAR(16),
    gender ENUM('M', 'F'),
    hire_date DATE
);

insert into employees_dup 
Select * from employees
limit 20;

-- insert a duplciate of first row
insert into employees_dup values('10001','1953-09-02','Georgi', 'Facella' ,'M', '1986-06-26');
delete from employees_dup where last_name = 'Facello';
Select * from employees_dup;


-- example on union vs union all
select e.emp_no,
	   e.first_name, 
       e.last_name,
       Null as dept_no,
       Null as from_date
from 
	   employees_dup e
where 
	   e.emp_no = '10001'
       Union all
Select Null as emp_no,
	   Null as first_name,
       Null as last_name,
       dm.dept_no,
       dm.from_date
from 	
	   dept_manager dm;

-- syntax of union and union all is same just remove all from the union.

-- Diffrence btw union and union all is

-- union displays only distinct values  in the output.
-- because union give distinct values it uses  more mysql resource(computational power and storage space.)
	-- for better result we use union

-- union all retrieves duplicated as well. 
	-- for better performance we use union all.
    
    
-- exercise
-- Click 'Continue' and execute the query. What do you think is the meaning of the minus sign before subset A in the last row (ORDER BY -a.emp_no DESC)?

SELECT 
    *
FROM
    (SELECT 
        e.emp_no,
            e.first_name,
            e.last_name,
            NULL AS dept_no,
            NULL AS from_date
    FROM
        employees e
    WHERE
        last_name = 'Denis' UNION SELECT 
        NULL AS emp_no,
            NULL AS first_name,
            NULL AS last_name,
            dm.dept_no,
            dm.from_date
    FROM
        dept_manager dm) AS a
ORDER BY -a.emp_no ASC;
