create database bd;
use bd;

create table customers(customer_id int primary key , name varchar(50),email varchar(50),address varchar(50));


insert into customers(customer_id,name,email,address)
values
(1,'kelvin','kelvin@gmail.com','rajkot'),
(2,'jenil','jenil@gmail.com','ahemdabad'),
(3,'om','om@gmail.com','surat'),
(4,'karan','karan@gmail','jamnagar'),
(5,'jay','jay@gmail.com','bhuj');

select * from customers;

update customers set address='rajkot' where customer_id=4;

select * from customers;

delete from customers where customer_id=1;

select * from customers;

create table orders(orderID int primary key , customer_id int , orderdate date , totalamount decimal(10,2),
foreign key (customer_id) references customers(customer_id));	

insert into orders(customer_id,orderID,orderdate,totalamount)
values
(1,1,'2026-02-13',300.30),
(2,2,'2026-03-15',500.50),
(3,3,'2026-04-17',400.50),
(4,4,'2026-02-19',700.60),
(5,5,'2026-07-10',900.90);

select * from orders;

update orders set totalamount=9000 where orderID=4;

select * from orders;

delete from orders where orderID=4;

select * from orders;

select * from orders where orderdate >= curdate() - interval 30 day;

select 
max(totalamount) as highest,
min(totalamount) as lowest,
avg(totalamount) as avrege
from orders;

create table products (productID int primary key ,productname varchar(50),price int , stock int);

insert into products(productID,productname,price,stock)
values
(1,'sumsung',5000,5),
(2,'apple',6000,6),
(3,'redmi',3000,8),
(4,'vivo',8000,3),
(5,'googlepixel',10000,9);

select * from products;

select * from products order by price desc;

select * from products order by stock desc;

update products set price='12000' where productID=5;

select * from  products;

set sql_safe_updates = 0;

delete from products where productID=3;

select * from products;

select * from products where price>=500 and price>=2000;

select max(price) as most_expensive from products; 
select min(price) as cheapest from product;

create table OrderDetails(orderdetailID int primary key, orderID int, productID int, Quantity int, SubTotal int,
foreign key (orderID) references orders(OrderID),
foreign key (productID) references Products(ProductID));

insert into OrderDetails(orderdetail, orderID, productID, Quantity, SubTotal)
values(1, 1, 1, 1, 50000),
(2, 1, 2, 2, 1000),
(3, 2, 3, 1, 1500),
(4, 3, 1, 1, 12000),
(5, 4, 2, 2, 1500);


select * from Orderdetails where orderID = 2;

select sum(SubTotal) as Total_Revenue from Orderdetails;

select * from Orderdetails order by Quantity desc limit 3;

select ProductID, count(*) as Times_Sold 
from OrderDetails group by ProductID;

