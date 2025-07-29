-- generate report that gives details like company name,orderdate and ship country for each order

select "CompanyName","OrderDate","ShipCountry"
from orders
join customers on customers."CustomerID"=orders."CustomerID";

-- connect employee and orders table for gettig first name,last name and order date for all orders
select "FirstName","LastName","OrderDate"
from orders 
join employees on employees."EmployeeID"=orders."EmployeeID";

-- connect products and suppliers and pull back company name unit cost and unit in stock
select "CompanyName","UnitPrice","UnitsInStock"
from products
join suppliers on products."SupplierID"=suppliers."SupplierID";

-- pull back company name,order date,unit price and quantity
select "CompanyName","OrderDate","UnitPrice","Quantity"
from order_details
join orders on order_details."OrderID"=orders."OrderID"
join customers on orders."CustomerID"=customers."CustomerID";

-- add product name

select "CompanyName","OrderDate",order_details."UnitPrice","Quantity"
from order_details
join orders on order_details."OrderID"=orders."OrderID"
join customers on orders."CustomerID"=customers."CustomerID"
join products on products."ProductID"=order_details."ProductID";

-- add catagory name
select "CompanyName","OrderDate",order_details."UnitPrice","Quantity","CategoryName"
from order_details
join orders on order_details."OrderID"=orders."OrderID"
join customers on orders."CustomerID"=customers."CustomerID"
join products on products."ProductID"=order_details."ProductID"
join categories on categories."CategoryID"=products."CategoryID";

-- add where clause select catagory name of dairy products and amount spent>=500
select * from categories;
select "CompanyName","OrderDate",order_details."UnitPrice","Quantity","CategoryName"
from order_details
join orders on order_details."OrderID"=orders."OrderID"
join customers on orders."CustomerID"=customers."CustomerID"
join products on products."ProductID"=order_details."ProductID"
join categories on categories."CategoryID"=products."CategoryID"
where "CategoryName"='Produce' and (order_details."UnitPrice"*"Quantity")>=500;