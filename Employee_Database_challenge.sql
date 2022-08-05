
SELECT e.emp_no, e.first_name, e.last_name,
t.title,t.from_date, t.to_date 
INTO retirement_title 
FROM employees e
INNER JOIN titles t on e.emp_no = t.emp_no
WHERE birth_date BETWEEN '1952-01-01' AND '1955-12-31'
order by e.emp_no

-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (emp_no) first_name,
last_name,
title
--INTO unique_titles
FROM retirement_title
WHERE to_date = '9999-01-01'
ORDER BY emp_no, to_date DESC;

SELECT count(*) as count, title
into retiring_titles 
from unique_titles
group by title 
order by count(*) DESC

SELECT DISTINCT ON (e.emp_no) e.emp_no, first_name,
last_name, birth_date,
de.from_date,de.to_date,t.title
INTO mentorship_eligibility
from employees e 
inner join dept_emp de on e.emp_no = de.emp_no 
inner join titles t on de.emp_no = t.emp_no
WHERE de.to_date = '9999-01-01'
AND birth_date BETWEEN '1965-01-01' AND '1965-12-31'
order by e.emp_no

