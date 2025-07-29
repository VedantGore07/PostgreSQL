
-------------------- 

create table employee(
emp_id int ,
emp_name varchar,
emp_dept varchar,
emp_salary int
);

insert into employee values
(1, 'ram', 'IT', 25000),
(2, 'sham', 'CS', 35000),
(3, 'rahul', 'ENTC', 40000),
(4, 'rachit', 'AIDS', 45000),
(5, 'aush', 'AR', 23000),
(6, 'pratik', 'MECH', 38000),
(7, 'jayesh', 'CIVIL', 60000),
(8, 'mayur', 'IT', 46000),
(9, 'akshay', 'CS', 67000),
(10, 'vedant', 'AIDS', 40000);

select * from employee;

-- ------- distinct --------------------------
select distinct emp_dept from employee order by emp_dept;

-- ------------------- limit ---------------------------

select emp_name, emp_id from employee limit 3;
-- --- offset skips the rows ----
select emp_name, emp_id from employee limit 3 offset 2;  

-- --------- fetch -------------
select emp_name, emp_id from employee fetch first 3 rows only;

-- ---- AND operator ----------
select emp_name from employee where emp_dept='IT' and emp_salary=46000;

-- ---- OR operator -------------
select emp_name from employee where emp_dept='IT' or emp_salary=46000;

-- --------- between --------------------------------
select emp_name from employee where emp_id between 1 and 5;
select emp_name from employee where emp_salary between 45000 and 60000;
select emp_name from employee where emp_salary not between 45000 and 60000;

-- ----- like operator ----------------------
-------  % matches 0,1, more characters
------- like _b (underscore) matches a single character
-- ----- like '%ch%' starts and ends with anything in between ch must present
-- ----  like  '%a' ends with a
-- ----  like 'r%' starts with r
-- ----- like 'le_' match the string followed by one character
-- ----- like '_at' match the string preceeded by one character
-- ----  like '%are_' 

select emp_name from employee where emp_name like '%h';
select emp_name from employee where emp_name like 'p%';
select emp_name from employee where emp_name like '_am';
select emp_name from employee where emp_name like 'prati_';
select emp_name from employee where emp_name like '%a%';
select emp_name from employee where emp_name like '%dan_';
select emp_name from employee where emp_name like '_aye%';
















































































