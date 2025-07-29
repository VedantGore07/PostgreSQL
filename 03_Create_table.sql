
-- create student database having the below fields with 5 set of data ----

create table stud(
roll_no serial primary key,
first_name varchar,
last_name varchar,
city varchar,
state varchar);

insert into stud(first_name, last_name, city, state) values
('ram', 'singh', 'pune', 'maharashtra'),
('ayush', 'rathod', 'mumbai', 'punjab'),
('rahul', 'kapoor', 'chennai', 'kerala'),
('shreya', 'singh', 'jaipur', 'rajasthan'),
('tanaya', 'roy', 'kumta', 'karnataka');

select * from stud;

------- explain   ----
explain select * from stud;

-- ------ alter  (add, drop, rename, modify)  ------------

-- 1) alter add
alter table stud add column grade varchar;

-- 2) alter rename
alter table stud rename column grade to marks;
alter table stud rename to stud_1;
-- rename table
alter table stud_1 rename to stud;
-- -3) alter drop
alter table stud drop column grade;


-- ----- create table animal  ------------------------

create table animal(id  int, name varchar);
insert into animal values
(1, 'Tiger'),
(1, 'Lion'),
(1, 'Elephant'),
(1, 'Jaguar');

-- truncate  removes records not table structure
-- drop removes table structure and its content and space allocated to thre table from memory

truncate table animal;

select * from animal;
drop table animal;






































































