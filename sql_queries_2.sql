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