select * from shops

select * from userlogins

select count(*) from transactions



delete from transactions

insert into transactions values(202,'101,102,105','2016-11-12')
insert into transactions values(203,'102,104','2016-11-12')
insert into transactions values(204,'102,103','2016-11-12')
insert into transactions values(205,'101,102,104','2016-11-12')

insert into transactions values(206,'101,103','2016-11-12')
insert into transactions values(207,'102,103','2016-11-12')
insert into transactions values(208,'101,103','2016-11-12')
insert into transactions values(209,'101,102,103,105','2016-11-12')
insert into transactions values(209,'101,102,103','2016-11-12')


drop table dummy;
drop table dummy1;


create table dummy
(itemsid varchar(200),
support int)

create table dummy1
(itemsid varchar(200),
support int)

select * from transactions

select * from dummy;
select * from dummy1;


delete from dummy1;

select count(*) from transactions where itemsid like '%101%' and itemsid like '%102%'



select count(*) minsupport from dummy where itemsid like '%101,102%';
select count(*) minsupport from dummy where itemsid like '%101,103%';
select count(*) minsupport from dummy where itemsid like '%101,104%';
select count(*) minsupport from dummy where itemsid like '%101,105%';
select count(*) minsupport from dummy where itemsid like '%102,103%';
select count(*) minsupport from dummy where itemsid like '%102,104%';
select count(*) minsupport from dummy where itemsid like '%102,105%';
select count(*) minsupport from dummy where itemsid like '%103,104%';
select count(*) minsupport from dummy where itemsid like '%103,105%';
select count(*) minsupport from dummy where itemsid like '%104,105%' ;


