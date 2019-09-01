-- cross join will take values from ceratin table and connect them with all the values from tables we want to join it with
-- eg we have two table author and store table have 10 	rows both the output of cross join will have 100 rows, it will join eazh row of author table with all the rows of the store table.
-- mathemetical terms it will give cartesian product of values of two or more sets. 
-- cross join is used generally when there is no relation in btw tables and we want every possible outcome.

Use employees;
SELECT 
    dm.*, d.*
FROM
    dept_manager dm
        CROSS JOIN
    departments d
ORDER BY dm.emp_no , d.dept_no;

-- same cross join can be achieved by  old join statement using from .
-- and also join works same as cross join if omitt the ON or don't use where clause in it, then it will also performs the cross product.
SELECT 
    dm.*, d.*
FROM
    dept_manager dm,
    departments d
ORDER BY dm.emp_no , d.dept_no;


SELECT 
    d.*, dm.*
FROM
    departments d
        CROSS JOIN
    dept_manager dm
WHERE
    d.dept_no <> dm.dept_no
ORDER BY dm.emp_no , d.dept_no;

-- mix use of join and cross join together

SELECT 
    em.*, d.*
FROM
    departments d
        CROSS JOIN
    dept_manager dm
        JOIN
    employees em ON em.emp_no = dm.emp_no
WHERE
    d.dept_no <> dm.dept_no
ORDER BY dm.emp_no , d.dept_no;


-- exercise 

-- Use a CROSS JOIN to return a list with all possible combinations between managers from the dept_manager table and department number 9.

SELECT 
    dm.*, d.*
FROM
    dept_manager dm
        CROSS JOIN
    departments d
WHERE
    d.dept_no = 'd009';


-- Q2. Return a list with the first 10 employees with all the departments they can be assigned to.

SELECT 
    e.* , d.*
FROM
    employees e
        CROSS JOIN
    departments d
where 
	e.emp_no < 10011
order by e.emp_no;





