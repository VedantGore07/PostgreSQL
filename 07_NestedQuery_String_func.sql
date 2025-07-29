select * from employee;

-- ---- Nested query ----------------------------

select emp_name from employee
where emp_salary = (select max(emp_salary)from employee);

select emp_name from employee
where emp_salary < (select avg(emp_salary)from employee);

-- ------ string functions ------------------------

select upper('postgresql');
select lower('GOOD MORNING');
select right('infosys', 3);
select left('bangalore',4);
select char_length('hello world good evening');

select emp_name from employee where right(emp_name, 2) = 'nt';


-- --------------- split_part() function -------------------
-- --- split_part(string, delimiter, position)      

select * from user1;
select split_part(email::text,'@',1) from user1;

select split_part(email::text,'@',2) from user1;

-- ---------- replace function -----------------

select * from employee;

update employee
set emp_dept = replace(emp_dept, 'AR','ARR');





























































