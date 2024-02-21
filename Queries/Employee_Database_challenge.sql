-- Deliverable 1: Number of Retiring Employees by Title

SELECT e.emp_no,
       e.first_name,
       e.last_name,
       t.title,
       t.from_date,
       t.to_date
INTO retirement_titles
FROM employees as e
INNER JOIN titles as t
ON (e.emp_no = t.emp_no)
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
order by e.emp_no;

SELECT DISTINCT ON (rt.emp_no) rt.emp_no,
	rt.first_name,
	rt.last_name,
	rt.title
INTO unique_titles
FROM retirement_titles AS rt
WHERE rt.to_date = ('9999-01-01')
ORDER BY emp_no, to_date DESC;

SELECT COUNT(ut.emp_no),
	ut.title
INTO retiring_titles
FROM unique_titles as ut
GROUP BY title 
ORDER BY COUNT(title) DESC;


-- Deliverable 2: Employees Eligible for the Mentorship Program

SELECT DISTINCT ON (e.emp_no)
	e.emp_no,
	e.first_name, 
	e.last_name, 
	e.birth_date,
	d.from_date,
	d.to_date,
	t.title
INTO mentorship_eligibilty
FROM employees as e
INNER JOIN dept_emp as d
ON (e.emp_no = d.emp_no)
INNER JOIN titles as t
ON (e.emp_no = t.emp_no)
WHERE (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
AND (d.to_date = '9999-01-01')
ORDER BY e.emp_no, t.from_date DESC;
