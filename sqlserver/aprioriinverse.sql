create table admin(
username varchar(20),
password varchar(20));

insert into admin values('admin','admin');

create table items(
itemid int primary key identity(101,1),
itemname varchar(20),
category varchar(20),
price float);

create table trans(
tid int primary key identity(101,1),
itemid varchar(60)
);

create table support(
suportid int primary key identity(101,1),
itemid varchar(20),
support int);

