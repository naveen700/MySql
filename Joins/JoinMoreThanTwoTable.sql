Use Employees;

-- exercise on joining more than two table.
-- Select all managers’ first and last name, hire date, job title, start date, and department name.

SELECT 
    em.first_name,
    em.last_name,
    em.hire_date,
    t.title,
    dm.from_date,
    d.dept_name
FROM
    dept_manager dm
        LEFT JOIN
    employees em ON dm.emp_no = em.emp_no
        JOIN
    titles t ON dm.emp_no = t.emp_no
        JOIN
    departments d ON dm.dept_no = d.dept_no
WHERE
    t.title = 'Manager'
ORDER BY em.emp_no;

SELECT 
    *
FROM
    dept_manager dm
        JOIN
    titles t ON t.emp_no = dm.emp_no;

SELECT
    e.first_name,
    e.last_name,
    e.hire_date,
    t.title,
    m.from_date,
    d.dept_name
FROM
    employees e
        JOIN
    dept_manager m ON e.emp_no = m.emp_no
        JOIN
    departments d ON m.dept_no = d.dept_no
        JOIN
    titles t ON e.emp_no = t.emp_no
ORDER BY e.emp_no;


-- exercise 2 average salaary of all departments manager.
-- need department_name with avg salary to its departments manger.

-- because we are using aggregate function we must use group by clause , if we do not use group by clause then mysql will apply default order and give single output. 
SELECT 
    d.dept_name, AVG(s.salary) AS average_salary
FROM
    dept_manager dm
        JOIN
    departments d ON d.dept_no = dm.dept_no
        JOIN
    salaries s ON s.emp_no = dm.emp_no
GROUP BY d.dept_name
HAVING average_salary > 60000
ORDER BY average_salary DESC;



-- exercise 3 How many male and how many female managers do we have in the ‘employees’ database ?

SELECT 
    e.gender, COUNT(e.gender) AS total_manager
FROM
    employees e
        JOIN
    dept_manager d ON d.emp_no = e.emp_no
GROUP BY e.gender
ORDER BY total_manager DESC;








