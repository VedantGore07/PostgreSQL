---------------- TRIGGERS ------------------------------

create table company1(id serial primary key,
name text not null,
age int,
address char(50),
salary decimal);

create table audit1(emp_id int, entry_date timestamp);

---- trigger function

create or replace function auditlog1()
returns trigger as $$
begin
insert into audit1(emp_id, entry_date) values(new.id, current_timestamp);
return new;
end;
$$ language plpgsql;

---- create trigger

create trigger example_trigger
after insert on company1
for each row
execute function auditlog1();

insert into company1(name, age, address, salary) values('Ram', 22, 'pimpri nehrunagar', 60000);

select * from company1;

select * from audit1;

































































