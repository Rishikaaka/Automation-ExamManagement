select * from shoplogins

select * from categories

select getdate()

delete from items
drop table items

create table items(
shopid bigint,
catid bigint,
subcatid bigint,
itemid bigint  primary key identity(1,1),
itemname varchar(50),
itemdate date,
itemcost int,
discount int,
itemdesc varchar(300),
picname varchar(100));


insert into items(shopid ,catid,subcatid,itemname,itemdate,itemcost,discount,picname) values('37864915,womens-2,saree2-104,'abcd',getdate(),250,8,'Tulips.jpg') 

insert into items(shopid ,catid,subcatid,itemname,itemdate,itemcost,discount,picname)
 values(37864915,2,2,'abcd',getdate(),250,8,'2085932390Tulips.jpg')

select * from shoplogins 

delete from shoplogins


select itemname from items where shopid=37864915 and catid=2 and subcatid=2

select * from customers