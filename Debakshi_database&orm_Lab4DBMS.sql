create database Ecommerce;
create table supplier(SUPP_ID int primary key,SUPP_NAME varchar(50) not null,
SUPP_CITY varchar(50) not null,SUPP_PHONE varchar(50) not null);

create table customer(CUS_ID int primary key,CUS_NAME varchar(20) not null,
CUS_PHONE varchar(10) not null,CUS_CITY varchar(30) not null,CUS_GENDER char(1));

create table category(CAT_ID int primary key,CAT_NAME varchar(20) not null
);

create table product(PRO_ID int primary key,PRO_NAME varchar(20) not null default "Dummy",
PRO_DESC varchar(60) ,CAT_ID int ,foreign key product(CAT_ID) references category(CAT_ID));

create table supplier_pricing(PRICING_ID int primary key ,
PRO_ID int ,
SUPP_ID int ,
SUPP_PRICE int default 0,
foreign key (PRO_ID) references product(PRO_ID),
foreign key (SUPP_ID) references supplier(SUPP_ID));

create table if not exists orrder(ORD_ID int primary key ,
ORD_AMOUNT int not null,
ORD_DATE date not null ,
CUS_ID int ,
PRICING_ID int,
foreign key (CUS_ID) references customer(CUS_ID),
foreign key (PRICING_ID) references supplier_pricing(PRICING_ID));

create table if not exists rating(RAT_ID int primary key ,
ORD_ID int ,
RAT_RATSTARS int  not null ,
foreign key (ORD_ID) references orrder(ORD_ID)
);

insert into supplier values(1,'Rajesh Retails',	'Delhi','1234567890');
insert into supplier values(2,'Appario Ltd.',	'Mumbai','2589631470');
insert into supplier values(3,'Knome products',	'Banglore','9785462315');
insert into supplier values(4,'Bansal Retails',	'Kochi','8975463285');
insert into supplier values(5,'Mittal Ltd.',	'Lucknow','7898456532');
select * from supplier;

insert into customer values(1,'AAKASH','9999999999','DELHI','M');
insert into customer values(2,'AMAN','9785463215','NOIDA','M');
insert into customer values(3,'NEHA','9999999999','MUMBAI','F');
insert into customer values(4,'MEGHA','9994562399','KOLKATA','F');
insert into customer values(5,'PULKIT','7895999999','LUCKNOW','M');

select * from customer;

insert into category values(1,'BOOKS');
insert into category values(2,'GAMES');
insert into category values(3,'GROCERIES');
insert into category values(4,'ELECTRONICS');
insert into category values(5,'CLOTHES');

select * from category;

insert into product values(1,'GTA V',
'Windows 7 and above with i5 processor and 8GB RAM',2);
insert into product values(2,'TSHIRT',
'SIZE-L with Black, Blue and White variations',5);
insert into product values(3,'ROG LAPTOP',
'Windows 10 with 15inch screen, i7 processor, 1TB SSD',4);
insert into product values(4,'OATS',
'Highly Nutritious from Nestle',3);
insert into product values(5,'HARRY POTTER',
'Best Collection of all time by J.K Rowling',1);
insert into product values(6,'MILK',
'1L Toned MIlk',3);
insert into product values(7,'Boat Earphones',
'1.5Meter long Dolby Atmos',4);
insert into product values(8,'Jeans',
'Stretchable Denim Jeans with various sizes and color',5);
insert into product values(9,'Project IGI',
'compatible with windows 7 and above',2);
insert into product values(10,'Hoodie',
'Black GUCCI for 13 yrs and above',5);
insert into product values(11,'Rich Dad Poor Dad',
'Written by RObert Kiyosaki',1);
insert into product values(12,'Train Your Brain',
'By Shireen Stephen',1);

select * from product;

insert into supplier_pricing values(1,1,2,1500);
insert into supplier_pricing values(2,3,5,30000);
insert into supplier_pricing values(3,5,1,3000);
insert into supplier_pricing values(4,2,3,2500);
insert into supplier_pricing values(5,4,1,1000);
insert into supplier_pricing values(6,12,2,780);
insert into supplier_pricing values(7,12,4,789);
insert into supplier_pricing values(8,3,1,31000);
insert into supplier_pricing values(9,1,5,1450);
insert into supplier_pricing values(10,4,2,999);
insert into supplier_pricing values(11,7,3,549);
insert into supplier_pricing values(12,7,4,529);
insert into supplier_pricing values(13,6,2,105);
insert into supplier_pricing values(14,6,1,99);
insert into supplier_pricing values(15,2,5,2999);
insert into supplier_pricing values(16,5,2,2999);

select * from supplier_pricing ;

insert into orrder values(101,1500,'2021-10-06',2,1);
insert into orrder values(102,1000,'2021-10-12',3,5);
insert into orrder values(103,30000,'2021-09-16',5,2);
insert into orrder values(104,1500,'2021-10-05',1,1);
insert into orrder values(105,3000,'2021-08-16',4,3);
insert into orrder values(106,1450,'2021-08-18',1,9);
insert into orrder values(107,789,'2021-09-01',3,7);
insert into orrder values(108,780,'2021-09-07',5,6);
insert into orrder values(109,3000,'2021-09-10',5,3);
insert into orrder values(110,2500,'2021-09-10',2,4);
insert into orrder values(111,1000,'2021-09-15',4,5);
insert into orrder values(112,789,'2021-09-16',4,7);
insert into orrder values(113,31000,'2021-09-16',1,8);
insert into orrder values(114,1000,'2021-09-16',3,5);
insert into orrder values(115,3000,'2021-09-16',5,3);
insert into orrder values(116,99,'2021-09-17',2,14);

select * from orrder  ;

insert into rating values(1,101,4);
insert into rating values(2,102,3);
insert into rating values(3,103,1);
insert into rating values(4,104,2);
insert into rating values(5,105,4);
insert into rating values(6,106,3);
insert into rating values(7,107,4);
insert into rating values(8,108,4);
insert into rating values(9,109,3);
insert into rating values(10,110,5);
insert into rating values(11,111,3);
insert into rating values(12,112,4);
insert into rating values(13,113,2);
insert into rating values(14,114,1);
insert into rating values(15,115,1);
insert into rating values(16,116,0);

select * from rating;

select count(customer.CUS_NAME) as total_customers,customer.CUS_GENDER from customer , orrder 
where customer.CUS_ID=orrder.CUS_ID and orrder.ORD_AMOUNT>=3000 group by customer.CUS_GENDER;

select orrder.*,product.PRO_NAME from orrder,product,supplier_pricing 
where  product.PRO_ID=supplier_pricing .PRO_ID
and supplier_pricing.PRICING_ID=orrder.PRICING_ID
and orrder.CUS_ID=2;

select * from supplier;
select * from supplier_pricing;
select * from product;

select supplier.*,count(supplier.SUPP_NAME) as No_of_products from supplier,supplier_pricing,product where 
supplier.SUPP_ID=supplier_pricing.SUPP_ID
and supplier_pricing.PRO_ID=product.PRO_ID
group by supplier.SUPP_ID;

select * from category;
select * from product;
select * from supplier_pricing;



select category.CAT_ID,category.CAT_NAME,product.PRO_NAME,supplier_pricing.SUPP_PRICE as price
from product,supplier_pricing,category where supplier_pricing.SUPP_PRICE in
(select min(supplier_pricing.SUPP_PRICE) as price from product,supplier_pricing,category 
where supplier_pricing.SUPP_PRICE in (select min(supplier_pricing.SUPP_PRICE) as price
from product,supplier_pricing,category where
supplier_pricing.PRO_ID=product.PRO_ID and product.CAT_ID=category.CAT_ID group by product.PRO_ID)
and supplier_pricing.PRO_ID=product.PRO_ID and product.CAT_ID=category.CAT_ID 
group by category.CAT_ID) and  supplier_pricing.PRO_ID=product.PRO_ID and product.CAT_ID=category.CAT_ID ;

select product.PRO_ID,product.PRO_NAME from product,supplier_pricing,orrder
where product.PRO_ID=supplier_pricing.PRO_ID
and supplier_pricing.PRICING_ID=orrder.PRICING_ID
and orrder.ORD_DATE>"2021-10-05";

select customer.CUS_NAME,customer.CUS_GENDER from customer where customer.CUS_NAME like 'A%'
or customer.CUS_NAME like '%A';


DELIMITER &&
CREATE PROCEDURE performance ()
begin 
select supplier.SUPP_ID,supplier.SUPP_NAME,rating.RAT_RATSTARS,
 case
 when rating.RAT_RATSTARS=5 then 'Excellent service'
 when rating.RAT_RATSTARS>4 then 'Good service'
 when  rating.RAT_RATSTARS>2 then 'Average service'
 else 'poor service'
 end as type_of_service
 from  supplier,supplier_pricing,orrder,rating
where supplier.SUPP_ID=supplier_pricing.SUPP_ID
and supplier_pricing.PRICING_ID=orrder.PRICING_ID
and orrder.ORD_ID=rating.ORD_ID;
end &&
DELIMITER ;
call performance();


















