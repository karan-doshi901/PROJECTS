use project ;

#1
create table brands(
bid int primary key ,
bname varchar(20)
 );

insert into brands
values(1,"nike"),
(2," adidas "),
(3,"puma"),
(4,"fila"),
(5," bata"),
(6,"US polo"),
(7,"gucci"),
(8,"Apsara"),
(9,"pepsi"),
(10,"fanta");




#2
 create table inv_user(
 user_id varchar(20) primary key,
 name varchar(20),
password varchar(20) unique,
 last_login timestamp,
 user_type varchar(10)
 );
 
 insert into inv_user
 values(01,"vijay","@viju","30-10-22->18:04","Doctor"),
 (02,"kartik","*kartik","31-1-22->12:04","programmer"),
 (03,"asha","123&asha","12-6-21->14:40","student"),
 (04,"viru","$viru","18-8-22->11:04","cricketer"),
 (05,"jay","@jay","31-2-21->10:04","celebrity"),
 (06,"aryan","$#aryan","23-5-22->19:55","retailer"),
 (07,"vijay","@#vijay","13-10-22->15:34","Doctor"),
 (08,"dhruv","@%dhruv","28-5-21->14:07","engineer"),
 (09,"vikas","vikas!","31-12-20->12:35","reporter"),
 (10,"vishnu","@wala","10-10-20->11:45","engineer");

drop table inv_user;



#3
create table categories(
 cid int primary key,
 category_name varchar(20)
 );
 
 insert into categories
 values(1,'footwear'),
 (2,'footwear'),
 (3,'footwear'),
(4,'footwear'),
(5,'footwear'),
(6,'clothing'),
(7,'clothing'),
(8,'stationery'),
(9,'Beverages'),
(10,'Beverages');
 
 
 
 
 #4
 create table product(
 pid int primary key,
 cid int references categories(cid),
 bid int references brands(bid),
 sid int references stores(sid),
 pname varchar(50),
 p_stock int,
 price int,
 added_date date
);

insert into product
values(1,1,1,1,1,1,100,"10-1-22"),
(2,2,2,2,2,2,200,"11-2-22"),
(3,3,3,3,3,3,300,"12-3-22"),
(4,4,4,4,4,4,400,"13-2-22"),
(5,5,5,5,5,5,500,"18-9-22"),
(6,6,6,6,6,6,660,"13-2-22"),
(7,7,7,7,7,7,789,"14-4-22"),
(8,8,8,8,8,8,543,"22-6-22"),
(9,9,9,9,9,9,320,"21-9-22"),
(10,10,10,10,10,10,890,"22-5-22");


 create table stores(
 sid int(5),
 sname varchar(20),
 address varchar(20),
 mobno int(10)
 );
 
 insert into stores
 values(1,"sto-1","b-101 ak mall",100000000),
 (2,"sto-2","c-304 dmart",200000000),
 (3,"sto-3"," infinity mall",300000000),
 (4,"sto-4","t-10 big bazar",40000000),
 (5,"sto-5","rt road ",500000000),
 (6,"sto-6","ed-101 tata power",600000000),
(7,"sto-7","b-101 bk mall",700000000),
(8,"sto-8","g-101 ck mall",800000000),
(9,"sto-9","b-101 dk mall",900000000),
(10,"sto-10","u-101 bn mall",1010000000);


create table product
 (
 product_id int  primary key not null,
categories_id int(5) ,
 brand_id int(5) ,
store_id int(5),
pname varchar(20),
p_stock int,
price varchar(5),
 added_date date);
 
 desc product;
 
create table store
(
 store_id int primary key not null ,
store_name varchar(20),
address varchar(20),
mobno varchar(10)
 );

desc store;

create table provides(
brand_id int primary key not null,
store_id int  not null,
discount varchar(5));

desc providers;

create table customer_cart
(
cust_id int primary key not null,
 cust_name varchar(20),
 mobno varchar(10)
 );

desc customer_cart;

create table select_product(
cust_id int primary key not null references customer_cart(cust_id),
 product_id int  not null,
 quantity varchar(4)
 
 
 );

desc select_product;

 create table transactions
 (
 transaction_id int primary key not null,
total_amount varchar(5),
 paid varchar (5),
 due varchar(5),
 gst varchar(3),
discount varbinary(5),
 payment_method varchar(10),
cart_id int3  not null references customer_cart(cust_id)
 );
 
 desc transactions;
 
 create table invoice
 (
 item_no int primary key not null,
product_name varchar(20),
quantity varchar(5),
 net_price varchar(5),
transaction_id varchar(5)references transaction(transaction_id)
);

desc invoice;

insert into invoice values(1,'shoes',2,20,1);
insert into invoice values(2,'runmagic',1,50,2);
insert into invoice values(3,'mercedes',3,60,3);
insert into invoice values(4,'sandal',1,70,3);
insert into invoice values(5,'premium hush puppy ',2,80,4);
insert into invoice values(6,'tshirt',3,90,5);
insert into invoice values(7,'purse',4,10,6);
insert into invoice values(8,'5 packs pencil',6,20,7);
insert into invoice values(9,'tropicana',9,30,8);
insert into invoice values(10,'thums up',4,40,9);

drop table invoice;







drop table invoice;
select * from product;
desc product;
drop table product;

 insert into product values(1,1, 1 ,1, 'airdrop1', '4', '45000', '31-10-18');
 insert into product values(2,2,2,2,'zx8000','3',19000,'27-10-18'); 
insert into product values(3,3,3,3,' flyer flex','3',19000,'27-10-18');
 insert into product values(4,4,4,4,'Air Max',6,7000,'27-10-18');
 insert into product values(5,5,5,5,'hush puppy sandals',6,750,'25-10-18');
insert into product values(6,6,6,6,'neck t-shirt',7,1750,'15-10-18');
insert into product values(7,7,7,7,'diana mii',8,250,'12-10-18');
 insert into product values(8,8,8,8,'pencil',9,2750,'25-2-18');
  insert into product values(9,9,9,9,'tropicana guava',2,1150,'05-10-18');
   insert into product values(10,10,10,0,'thums up',10,70,'12-3-8');




desc provides;

insert into provides values(1,1,12);
insert into provides values(2,2,7);
 insert into provides values(3,3,15);
 insert into provides values(4,2,7);
 insert into provides values(5,2,19);
 insert into provides values(6,3,20);
  insert into provides values(7,5,10);
   insert into provides values(8,13,30);
    insert into provides values(9,2,20);
     insert into provides values(10,7,5);




 
 select * from provides;

 insert into customer_cart values( '1', 'Ram', '9876543210');
 insert into customer_cart values(2,'Shyam',7777777777);
 insert into customer_cart values(3,'Mohan',7777777775);


insert into select_product values( 1, 2, 3);
insert into select_product values(2,3,1);
insert into select_product values(3,3,3);
 insert into select_product values(4,2,1);
 insert into select_product values(5,3,2);
 insert into select_product values(6,7,2);
  insert into select_product values(7,3,2);
 insert into select_product values(8,3,2);
  insert into select_product values(9,1,2);
   insert into select_product values(10,2,2);

desc select_product;


 insert into transactions values( '1', '25000', '20000', '5000', '350', '350', 'card', '1');
insert into transactions values(2,57000,57000,0,570,570,'cash',2);
 insert into transactions values(3,19000,17000,2000,190,190,'cash',3);
 insert into transactions values(4,19000,17000,2000,190,190,'cash',3);
 insert into transactions values(5,16000,14000,3000,140,140,'cash',4);
 insert into transactions values(6,16000,14000,3000,140,140,'card',4);
insert into transactions values(7,15000,19000,5000,170,170,'cash',5);
insert into transactions values(8,15000,19000,5000,170,170,'card',5);
insert into transactions values(9,11000,18000,7000,130,130,'cash',6);
insert into transactions values(10,11000,18000,7000,130,130,'card',6);
show tables;

select * from select_product;
desc transactions;
select * from customer_cart;
select * from invoice;

select * from stores where sid>4 and sid<9;
select pid from product;
select * from brands
union
select * from categories;

desc stores;
desc inv_user;
select user_id from inv_user where name like "v%";

select cid from categories where category_name="footwear";

select * from brands;
select * from categories;
select * from inv_user;
select * from product;
select * from stores;

select bid as orders from brands;
select * from invoice;
desc transcaction;

select * from product where product_id=6;

select * from provide;

select*from stores where sid=3;
desc product;
desc select_product;
drop  table product;
select pname,p_stock,quantity as purchased,p_stock-quantity as remaining  from product as p , select_product as sp where p.product_id>=10 and p.product_id<=1 and p.product_id=sp.product_id
group by pname;