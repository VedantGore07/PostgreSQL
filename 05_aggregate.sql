-- ---------------------- order byy ----------------------------------
select * from demo1
order by gender;

select * from demo1 order by gender desc;

select * from demo1 order by gender desc null first;
select * from demo1 order by gender desc null last;


-- ----- aggregate functions (count, sum, max, min, avg) ------

select count(gender) from demo1;
select avg(age) as avg_gender from a2;

alter table a2 
add column salary int;

insert into a2(salary) values(50000), (60000);

select * from a2;

select sum(salary) as sum_salary from a2;
select max(salary) as max_salary from a2;
select min(salary) as min_salary from a2;
select avg(salary) as avg_salary from a2;


-- ------ group by clause -----------------

select name, sum(salary) as totalsalary
from a2
group by name;

select name, max(salary) as maxsalary from a2
group by name;

select id, count(*) as number from a2
group by id;

select name, count(*) as number from a2
group by name;


-- -------- having clause ------------------------

select name, sum(salary) as salary_details
from a2
group by name
having sum(salary) =60000;

select name, count(*) from a2
where salary > 50000
group by name
having count(*) >= 1;

















