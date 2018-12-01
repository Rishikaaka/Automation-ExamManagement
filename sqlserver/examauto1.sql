select * from duties;

select * from timetable;

select * from exams;

drop table examtimetable;
create table examtimetable(
examid int primary key identity(101,1),
examtype varchar(30),
year int,
sem int,
branch varchar(30),
examdate varchar(20),
day varchar(20),
subjectname varchar(50),
);

select * from examtimetable;
delete from examtimetable;

select getdate()

select * from timetable;


select * from examtimetable;


select * from rooms;

drop table rooms;

create table rooms(
roomid int primary key identity(100,1),
block varchar(10),
roomno int,
capacity int);

select * from rooms;
delete from rooms;

drop table courses;
create table courses
(
courseid int primary key identity(101,1),
coursecode varchar(30),
roomid int);

select * from rooms;
select * from student;
insert into admin values('rishika','rishika','faculty');



drop table student;

create table student(
sid varchar(50) primary key,
sname varchar(50),
coursecode varchar(30),
phone varchar(15)
);


create table studroomsallot
(srid int primary key identity(1,1),
roomid int,
coursecode varchar(30));


select * from examtimetable;


select * from rooms A where roomid in(select roomid from courses B where coursecode  
any(select concat(branch,'-',year,'-',sem) from examtimetable
where 

select distinct coursecode from courses A,examtimetable B where A.coursecode like B.branch+'-'+CONVERT(varchar(10), B.year)+'-'+Convert(varchar(4),B.sem)+'%';

select * from rooms where roomid in (select distinct roomid from courses A,examtimetable B where A.coursecode like B.branch+'-'+CONVERT(varchar(10), B.year)+'-'+Convert(varchar(4),B.sem)+'%');


select coursecode from courses where coursecode like 'cse-1-1%';
select  B.branch+CONVERT(varchar(10), B.year)+Convert(varchar(4),B.sem)+'%' from examtimetable B;
select 'A'+'B'+'C';


select sid,coursecode from student where coursecode in(select distinct coursecode from courses A,examtimetable B where A.coursecode like B.branch+'-'+CONVERT(varchar(10), B.year)+'-'+Convert(varchar(4),B.sem)+'%');
select * from courses;

select * from student;

select * from rooms;


delete from rooms;

create table seatallots
(seatid int primary key identity(1,1),
roomid int,
sids varchar(500));

select * from seatallots;

delete from seatallots;

select * from rooms;

select * from duties;

drop table duties;

create table duties(
dutiesid int primary key identity(100,1),
fid varchar(50),
roomid int,
day varchar(20));


select * from duties;

select * 

select * from examtimetable;

select * from faculty
select * from timetable;

select day from examtimetable

delete from seatallots;
delete from duties;

select * from seatallots;
select * from duties

select * from timetable;
delete from timetable;
delete from examtimetable;


