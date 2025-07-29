create table a2(
id serial primary key,
name varchar(30),
age int
);

-- auto increment (serial)
insert into a2(name, age) values('ram', 10), ('sham', 15);    

select * from a2;


create table datatype(id int, name text, price double precision, discount float, amount numeric(10,2));

insert into datatype values(1, 'tv', 12.345678234, 0.39, 2344.243567);
select * from datatype;

