-- Use employees;
-- inner joins works when we want to extract the common  data from two tables.
-- inner join  also does not consider null values  from  tables or 
-- null values are not in play.
-- if there is no matching values present in table result set will be empty.
-- inner join is equal to join keyword , even if we write only join then it will work same as inner join.

-- syntax
-- select table1.columnName tabel2.columnName
-- from table1
-- join table2 ON table1.column = table2.column
Select m.dept_no , m.emp_no , d.dept_name
from dept_manager_dup m
inner join
departments_dup d on m.dept_no = d.dept_no
order by m.dept_no;

-- exercise
-- Extract a list containing information about all managers’ employee number, first and last name, department number, and hire date. 
SELECT emp.emp_no , emp.first_name , emp.last_name , dm.dept_no , dm.from_date
from employees emp
INNER JOIN
dept_manager dm ON emp.emp_no = dm.emp_no
order by dm.from_date; 




Select m.dept_no , m.emp_no, m.from_date, m.to_date, d.dept_name
FROM dept_manager_dup m
	JOIN
    departments_dup d ON m.dept_no = d.dept_no
ORDER BY d.dept_no;

-- Duplicate Records.
-- duplicate rows , are identical rows in SQL table.
--  for pair of duplicate records, the value in each column coincide.

-- duplicate data are sometime encountered , especially in new , raw or uncontrolled data.alter

-- lets insert some duplicate data.
insert into dept_manager_dup
values('110228','d003','1992-03-21','9999-01-01');

insert into departments_dup
values ('d009' , 'Customer Service');

-- delete from departments_dup
-- where dept_no = 'd009';

Select * from departments_dup order by dept_no;
Select * from dept_manager_dup order by dept_no;

# inner join on tables which contains the duplicate data. 
Select m.dept_no, m.emp_no ,d.dept_name
from dept_manager_dup m
inner join  departments_dup d on m.dept_no = d.dept_no
order by dept_no;


# inner join above shows multiple duplicate records.
# how to handle duplicate records ?
# use group by clause on column which differs most(most likely primary key column).
SELECT 
    m.dept_no, m.emp_no, d.dept_name
FROM
    dept_manager_dup m
        INNER JOIN
    departments_dup d ON m.dept_no = d.dept_no
GROUP BY m.emp_no
ORDER BY dept_no;




# at old time where clause were used in case of joins and similiar result could be achieved by that.alter
SELECT 
    m.dept_no, m.emp_no, d.dept_name
FROM
    dept_manager_dup m,
    departments_dup d 
where 	
	m.dept_no = d.dept_no
ORDER BY m.dept_no;


-- Extract a list containing information about all managers’ employee number, first and last name, department number, and hire date. Use the old type of join syntax to obtain the result.
-- old join syntax
 SELECT 
    e.emp_no, e.first_name, e.last_name, m.dept_no, m.from_date
FROM
    employees e,
    dept_manager_dup m
WHERE
    e.emp_no = m.emp_no
ORDER BY e.emp_no;

-- new join syntax

SELECT 
    e.emp_no, e.first_name, e.last_name, m.dept_no, m.from_date
FROM
    employees e
        JOIN
    dept_manager_dup m ON e.emp_no = m.emp_no
ORDER BY e.emp_no;





-- Using aggregate functions with joins


SELECT 
    e.gender, AVG(s.salary) AS 'Average Salary'
FROM
    employees e
        JOIN
    salaries s ON e.emp_no = s.emp_no
GROUP BY e.gender;


-- join multiple tables usign join .
SELECT 
    e.first_name,
    e.last_name,
    e.hire_date,
    dm.from_date,
    d.dept_name
FROM
    employees e
        JOIN
    dept_manager dm ON e.emp_no = dm.emp_no
        JOIN
    departments d ON dm.dept_no = d.dept_no;
    
-- remember order of tables does not matter here because this is an inner join and it does not matter which table we write first.