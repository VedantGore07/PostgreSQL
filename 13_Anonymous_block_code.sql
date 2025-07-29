---- anonymous block 

do $$
declare 
counter integer :=0;
begin
counter := counter + 1;
raise notice 'The current value of counter is %', counter;
end $$;

-- count no of employees
do
$$
declare 
emp_count int;
begin
select count(*)
into emp_count
from employees;
raise notice 'there are % employees', emp_count;
end
$$;


do $$
declare 
v_first_name varchar(30);
v_city varchar(50);
begin
select first_name, city
into v_first_name, v_city
from employees where employee_id = 5;
raise notice 'First name : %,city %', v_first_name, v_city;
end
$$;

select * from employees;


-- if-then-else

do 
$$
declare
emp_count int;
begin
select count(*)
into emp_count
from employees;
if emp_count > 5 then
raise notice 'more than 5 employees are working';
else
raise notice 'less than 5 employees are working';
end if;
end
$$;


--  for loop

do $$
begin
for counter in 1..5 loop
raise notice 'counter :%', counter;
counter := counter + 1;
end loop;
end $$;

-- while loop

do $$
declare
counter integer := 0;
begin
while counter < 5 loop
raise notice 'counter :%', counter;
counter := counter + 1;
end loop;
end $$;



























































































