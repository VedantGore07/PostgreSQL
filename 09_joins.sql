-- --------- left join -------------

select company_name, order_id
from customers
left join orders on customers.customer_id = orders.customer_id;

select * from customers;
select * from orders;


select company_name, order_id
from customers
left join orders on customers.customer_id = orders.customer_id
where order_id is null;

-- ---- right join ----------------

select company_name, order_id
from customers
right join orders on customers.customer_id = orders.customer_id;

select company_name, order_id
from customers
right join orders on customers.customer_id = orders.customer_id
where order_id is null;


-- - full join (full outer join) ---------

select company_name, order_id
from customers
full join orders on customers.customer_id = orders.customer_id;

select product_name, category_name
from categories
full join products on products.category_id = categories.category_id;


------------------ self join (alias)-------------------------

-- -- find customers who are in same city and order by city 

select a.company_name as customername1, b.company_name as customername2, a.city
from customers a, customers b
where a.customer_id > b.customer_id
and a.city = b.city
order by city;

-- find the supplier from same country and order by country

select a.company_name as suppliername1, b.company_name as suppliername2, a.country
from suppliers a, suppliers b
where a.supplier_id > b.supplier_id and a.country = b.country
order by country;

select * from suppliers;

-- ------- cross join (cartesian product of every row of a with every row of b) --------------

create table department(dept_id int, dept_name text);
insert into department values(1, 'HR');
insert into department values(2, 'IT');
insert into department values(3, 'SALES');
insert into department values(4, 'FINANCE');

select * from department;

select employee_id, first_name, last_name from employees;

select e.employee_id, e.first_name, e.last_name,
d.dept_id, d.dept_name
from employees e cross join department d
order by e.employee_id;

-- -------------------------------------------------
create table zoo1(id int, animal text);
insert into zoo1 values(1, 'Lion'),
(2, 'Tiger'),
(3, 'Wolf'),
(4, 'Fox');

create table zoo2(id int, animal text);
insert into zoo2 values(1, 'Tiger'),
(2, 'Lion'),
(3, 'Rhino'),
(4, 'Panther');

select * from zoo1;
select * from zoo2;

-- --- inner join -------------------------
select zoo1.id id_a,
zoo1.animal animal_a,
zoo2.id id_b,
zoo2.animal animal_b
from zoo1
inner join zoo2 on zoo1.animal = zoo2.animal;

-- --- left join -------------

select zoo1.id, zoo1.animal, zoo2.id, zoo2.animal
from zoo1 
left join zoo2 on zoo1.animal = zoo2.animal;

-- --- right join -------------

select zoo1.id, zoo1.animal, zoo2.id, zoo2.animal
from zoo1 
right join zoo2 on zoo1.animal = zoo2.animal;

-- --- full join -------------

select zoo1.id, zoo1.animal, zoo2.id, zoo2.animal
from zoo1 
full join zoo2 on zoo1.animal = zoo2.animal;

-- --- cross join -------------

select zoo1.id, zoo1.animal, zoo2.id, zoo2.animal
from zoo1 
cross join zoo2
order by zoo1.id;

-- --- self join  (alias)-------------

select zoo1.id, zoo1.animal, zoo2.id, zoo2.animal
from zoo1, zoo2
where zoo1.id > zoo2.id
and zoo1.animal = zoo2.animal
order by zoo2.animal;

-- ---- natural join (it returns the matching columns)

select * from zoo1 natural join zoo2;









































