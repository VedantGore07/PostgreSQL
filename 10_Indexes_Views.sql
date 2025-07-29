------------ indexes (speed up the query ) -------------------------

select * from customers;
select * from customers where contact_title = 'Owner';
explain analyze select * from customers where contact_title = 'Owner';

create index indexdemo on customers(contact_title);

select * from orders;
select order_id, ship_country from orders where ship_country = 'France';
explain analyze select order_id, ship_country from orders where ship_country = 'France';
create index ship_idx on orders(ship_country);
explain analyze select order_id, ship_via from orders where ship_via = 3;
create index sindx on orders(ship_via);


----------- views -------------------------------------------------------

select * from products;
create or replace view prod_view2 as
select * from products where supplier_id = 3;

select * from prod_view2;
update prod_view2 set unit_price = 100 where product_id = 6;

select * from products;

create view orderviewdemo as
select customers.customer_id, customers.company_name, orders.order_id from customers, orders
where orders.customer_id = customers.customer_id;
select * from orderviewdemo;


-------------- view (with check option) ------------------------------------

select * from products;
select * from v_pro1;

create or replace view v_pro1 as 
select * from products where product_name = 'Chai'
with check option;

insert into v_pro1(product_id, product_name, discontinued) values(989, 'Chai', 0);
insert into v_pro1(product_id, product_name, discontinued) values(999, 'Chai', 0);
insert into v_pro1(product_id, product_name, discontinued) values(978, 'biscuits', 0);
insert into v_pro1(product_id, product_name, discontinued) values(976, 'tofee', 0);


--------------- Materialized view (physically stores the query result) ----------------------

create table random_tab2(id int, val decimal);
insert into random_tab2 select 1,random() from generate_series(1, 1000000);
insert into random_tab2 select 2,random() from generate_series(1, 10000000);

select * from random_tab2;

select id, avg(val), count(*)
from random_tab2
group by id;

create materialized view mv_random_tab2
as
select id, avg(val), count(*)
from random_tab2
group by id;

select * from mv_random_tab2;
delete from random_tab2 where id=1;

refresh materialized view mv_random_tab2;



























