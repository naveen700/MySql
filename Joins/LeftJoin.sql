# left join
# all matching values from  both table.
# and all the values from the left table that matches no value from the right table.
# in simple words , all data from left table which is not matching from right and data  which is matching from both table will be considered . 
# when working with left joins the order inwhich table written in query matters.
# left and right join are good example of one to many reloationship.
Use Employees;
SELECT 
    m.dept_no, m.emp_no, d.dept_name
FROM
    dept_manager_dup m
        LEFT JOIN
    departments_dup d ON m.dept_no = d.dept_no;
    
# order matter's here

SELECT 
    d.dept_no, d.dept_name, m.emp_no
FROM
    departments_dup d
        LEFT JOIN
    dept_manager_dup m ON m.dept_no = d.dept_no
ORDER BY d.dept_no;
    
    
select * from departments_dup order by dept_no;
select * from dept_manager_dup order by dept_no;
# outer join is when data also  comes from outer part of venn diagram (mean outside of shared part of  both tables).
# left join falls in this category so in mysql left join = left outer join gives same ouput.


SELECT 
    d.dept_no, d.dept_name, m.emp_no
FROM
    departments_dup d
        LEFT OUTER JOIN
    dept_manager_dup m ON m.dept_no = d.dept_no
ORDER BY d.dept_no;


-- only listing data of left table which is not same as right tables's data.
SELECT 
    m.dept_no, m.emp_no, d.dept_name
FROM
    dept_manager_dup m
        LEFT JOIN
    departments_dup d ON m.dept_no = d.dept_no
WHERE
    dept_name IS NULL
ORDER BY d.dept_no;







-- exercise

-- Join the 'employees' and the 'dept_manager' tables to return a subset of all the employees whose last name is Markovitch. See if the output contains a manager with that name.  

SELECT 
    em.emp_no,
    em.first_name,
    em.last_name,
    dm.dept_no,
    dm.from_date
FROM
    employees em
     LEFT   JOIN
    dept_manager_dup dm ON em.emp_no = dm.emp_no
where em.last_name = "Markovitch"
ORDER BY dm.dept_no DESC, em.emp_no ;


-- left join and left outer join are do same operations , there is no diffrence in that.