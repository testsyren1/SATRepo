create table Sailors(
SID int,
SNAME varchar(15),
SRATING int,
SAGE int);
 
 insert into Sailors(SID,SNAME,SRATING,SAGE)
 values(22,'dustin',7,45);
insert into Sailors(SID,SNAME,SRATING,SAGE)
values(29,'brutus',1,33);
insert into Sailors(SID,SNAME,SRATING,SAGE)
 values(31,'lubber',8,56);
  insert into Sailors(SID,SNAME,SRATING,SAGE)
 values(32,'andy',8,26);
  insert into Sailors(SID,SNAME,SRATING,SAGE)
 values(58,'rusty',10,36);
  insert into Sailors(SID,SNAME,SRATING,SAGE)
 values(64,'horatio',7,36);
  insert into Sailors(SID,SNAME,SRATING,SAGE)
 values(74,'horatio',9,35);
 
 select * from Sailors;
 
 -----
 
 create table Boats(
BID int,
BNAME varchar(15),
BCOLOR varchar(10)
);

insert into Boats(BID,BNAME,BCOLOR)
values(101,'interlake','blue');
insert into Boats(BID,BNAME,BCOLOR)
values(102,'inter','red');
insert into Boats(BID,BNAME,BCOLOR)
values(103,'clipper','green');
insert into Boats(BID,BNAME,BCOLOR)
values(104,'marine','red');

select * from Boats;
-----

create table Reserves(
SID int,
BID int,
DAY DATE
);

insert into Reserves(SID,BID,DAY)
values(22,101,'1998-10-10');
insert into Reserves(SID,BID,DAY)
values(22,102,'1998-10-10');
insert into Reserves(SID,BID,DAY)
values(22,103,'1998-08-10');
insert into Reserves(SID,BID,DAY)
values(22,104,'1998-07-10');
insert into Reserves(SID,BID,DAY)
values(31,104,'1998-12-10');
insert into Reserves(SID,BID,DAY)
values(64,102,'1998-08-10');
insert into Reserves(SID,BID,DAY)
values(74,103,'1998-08-10');

select * from Reserves;

_________________
Q1. Find all sailors with a rating above 7

select * from Sailors
where SRATING > 7;

Q2. Find the colors of boats reserved by Lubber.

select BCOLOR,BNAME,SNAME
from Boats B
inner join Reserves R on B.BID=R.BID
inner join Sailors s on R.SID=S.SID
where SNAME='lubber';

Q3.  Find the names of sailors who have reserved all boats

select S.SID,SNAME,R.BID,BNAME
from Sailors S
inner join Reserves R on S.SID = R.SID
inner join Boats B on R.BID=B.BID;

Q4.  Find the names of sailors who have reserved both a red and a green boat

----------------------------------------------------------------------
-- 4th QUES
CREATE TABLE emp(empno int , e_name varchar(15),
 e_address varchar(20) , e_phn_no varchar(10),
 dept_no int ,dept_name varchar(15) , job_id char , salary int);
 
 select * from emp;
 -- 1)  Add a new column; HIREDATE to the existing relation
 alter table emp
 add column hiredate date;
 
 -- 2) Change the datatype ofJOB ID from char to varchar2
 alter table emp
 modify job_id varchar(10);
 
-- 3)  Change the name of column/field Emp_no to E_no
ALTER TABLE emp
CHANGE empno e_no INT ;

-- 4) Modify the column width of the job field of emp table
ALTER TABLE emp
 MODIFY job_id VARCHAR(12);
