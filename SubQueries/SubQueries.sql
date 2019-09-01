-- subqueries are query nested inside Query also called ad innerquery or nested query or inner select
-- queries embedded in query 
-- they  are part of another query called an outer  query = outer select . 
-- subquery should always put inside braces.
-- sql executes first innery query , then output of that used as intermediate for outer query.
-- subquery may return a single value(a scalar) , a single row ,a single column, or an entire table 
-- it is possible to nest inner queries within other inner queries. in this case sql will execute inner most query first then moves right to left (outermost query)or down to up.






-- all dept manager's first and last name 
Use Employees;
SELECT 
    e.first_name, e.last_name
FROM
    employees e
WHERE
    e.emp_no IN (SELECT 
            dm.emp_no
        FROM
            dept_manager dm);
            
            
-- exercise
-- Extract the information about all department managers who were hired between the 1st of January 1990 and the 1st of January 1995.

-- my anwer is correct but not professional.
-- SELECT 
-- 	em.emp_no,
--     em.first_name,
--     em.last_name,
--     em.gender,
--     em.birth_date,
--     em.hire_date
-- FROM
--     employees em
-- WHERE
--     em.emp_no IN (SELECT 
--             dm.emp_no
--         FROM
--             dept_manager dm) and em.hire_date >'1990-01-01' and em.hire_date < '1995-01-01';
--             
            
SELECT 
    *
FROM
    dept_manager
WHERE
    emp_no IN (SELECT 
            emp_no
        FROM
            employees
        WHERE
            hire_date BETWEEN '1990-01-01' AND '1995-01-01');
            
            

-- subqueries :- 
-- joins can be also used inside subqueries. 
-- allow for better structuring of the outer query. 
-- thus , each inner query can be thought of an isloation. 
-- in some situations, the use of subqueries is much more intutive compared to the use of complex joins and umions.
-- many users prefers subqueries because they offer enhanced code readabillity.