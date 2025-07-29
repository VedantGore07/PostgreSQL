----- stored procedure ----------------------------------

create or replace procedure message()
language plpgsql
as $$
begin
       raise notice 'Hello Everyone';
end;
$$;

call message();

----------------------------
select * from customers;
create or replace procedure selectAllCustomers2(title varchar(30))
language plpgsql
as $$
begin
      select * from customers where contact_title='title';
end;
$$;

call selectAllCustomers2('Owner');

----------------------------

CREATE OR REPLACE PROCEDURE selectAllCustomers2(title varchar(30))
LANGUAGE plpgsql
AS $$
BEGIN
    -- Use EXECUTE for dynamic query and replace 'title' properly
    EXECUTE format('SELECT * FROM customers WHERE contact_title = %L', title);
END;
$$;

-- Now call the procedure:
CALL selectAllCustomers2('Owner');


--------------------------------------------

--------- stored procedure --------------------

create table emp4(id serial primary key, name varchar(100), age int);

create procedure add_emp5(emp_name varchar, emp_age int)
language plpgsql
as
$$
begin 
insert into emp4(name, age) values(emp_name, emp_age);
end;
$$;

call add_emp5('alice', 24);
select * from emp4;

--------- update-----------
create procedure update_emp4(emp_id int, new_age int)
language plpgsql
as
$$
begin 
update emp4 set age = new_age where id = emp_id;
end;
$$;

call update_emp4(1,56);
select * from emp4;
















































































