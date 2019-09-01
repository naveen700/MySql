--  right join = right outer join , both of these are same.
-- only diffrence is data retrieved will be shared part of both table + all data from left table.

Use employees;
SELECT 
    d.dept_no, m.emp_no, d.dept_name
FROM
    dept_manager_dup m
        RIGHT JOIN
    departments_dup d ON m.dept_no = d.dept_no
ORDER BY m.emp_no;
 -- if we inverted the tables positoin and apply left join , ans will be the same.
 -- aliases will be same , no change in that.
 SELECT 
    d.dept_no, m.emp_no, d.dept_name
FROM
    departments_dup d
        LEFT JOIN
    dept_manager_dup m ON d.dept_no = m.dept_no
ORDER BY m.emp_no;



