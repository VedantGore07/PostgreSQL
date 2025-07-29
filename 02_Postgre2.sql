--  uuid universal unique identifier 128 bit value --

-- need to create this extension for uuid

-- create extension "uuid-ossp";

create table contactdetails(
contact_id uuid default public.uuid_generate_v1(),
f_name varchar,
l_name varchar,
phone varchar,
primary key (contact_id)
);

insert into contactdetails(f_name, l_name, phone) values
('Ram', 'Singh', '8936796373'),
('Sham', 'More', '4936796748'),
('Rahul', 'Roy', '7836796373');

select * from contactdetails;


-- json format ---------------------------------------------------------

create table ordernew(
id serial primary key,
info json not null
);

insert into ordernew(info) values('{"customer":"radha","items":{"products":"coffee","qty":7}}');

select * from ordernew;

-- ---------------------------------------------------
create table studnew(
s_id serial primary key,
info json not null
);

insert into studnew(info) values
('{"name":"radha","sem":3}'),
('{"name":"rahul","sem":6}'),
('{"name":"sita","sem":5}');

select * from studnew;


-- --- XML data --------------------------------------

create table personnew(
id serial primary key,
info xml not null
);

insert into personnew(info) values
(xmlparse (document '<?xml version="1.0" encoding="UTF-8" ?>
<personnew>
<name>alice</name>
<age>33</age>
<city>newyork</city>
</personnew>'));
select xpath('/personnew/age/text()', info) as name from personnew;
select * from personnew;


-- hstore -------------

-- create extension hstore;

create table country(
id serial primary key,
attr hstore
);

insert into country(attr) values
('"karnataka" => "bangalore"'),
('"maharashtra" => "mumbai"'),
('"rajasthan" => "jaipur"');

select * from country;






