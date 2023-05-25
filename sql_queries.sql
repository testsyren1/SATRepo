create table employee(empno varchar(5) , emp_name varchar(8) ,
dept varchar(20) , salary int , doj date , branch varchar(15));

insert into employee(empno , emp_name , dept , salary , 
doj , branch)
values('e101' , 'amit' , 'production' , 45000 ,
 '2000-03-12' ,'banagalore') , 
 ('e102' , 'amit' , 'hr' , 70000 , '2002-07-03' ,'bangalore'),
 ('e103' , 'sunita' , 'management' , 120000 , '2001-01-11' ,
 'mysore'),
 ('e105' , 'sunita' , 'it' , 67000 , '2001-08-01' , 'mysore'),
 ('e106' , 'mahesh' , 'civil' , 145000 , '2003-09-20' , 'mumbai');
 
 select * from employee;
 
 ---------------------------
 -- 1. Display all the fields of employee table
 SELECT * FROM employee;
 
 -- 2. Retrieve employee number and their salary
 SELECT empno,salary from employee;
 
 -- 3. Retrieve total salary of employee group by employee name and count similar names
 SELECT SUM(salary) as total_salary,emp_name,count(emp_name) AS count
 FROM employee
 group by emp_name;
 
 -- 4. Retrieve total salary of employee which is greater than >120000
select empno , emp_name , salary 
from employee
where salary > 120000;

-- 5.  Display name of employee in descending order
 select * from employee
 order by emp_name desc;

-- 6. Display details of employee whose name is AMIT and salary greater than 50000
select empno , emp_name , salary 
from employee
where emp_name = 'amit' and  salary > 50000;

-- 1.a) Create Triggers and implement insert ,delete and update on employee table.
 
 select * from emp;
 
 -- INSERT TRIGGER
 -- before insert trigger
 create or replace trigger before_insert
before insert on emp
for each row
begin
:new.doj := SYSDATE - 30 ;
END;
 
insert into emp(empno , emp_name , dept , salary  , branch)
 values
 ('e107' , 'ramesh' , 'it' , 50000  , 'chennai');
 
  select * from emp;
  
 -- after insert trigger
 create table emp_copy(empno varchar2(5) , emp_name varchar2(8) ,
dept varchar2(20) , salary int , doj date , branch varchar2(15));

select * from emp_copy;

create or replace trigger after_insert
after insert on emp
for each row
begin
insert into emp_copy
(empno , emp_name , dept , salary , doj , branch)
values(:new.empno , :new.emp_name , :new.dept , 
:new.salary , :new.doj , :new.branch);
END;

select * from emp;
select * from emp_copy;
 
insert into emp(empno , emp_name , dept , salary  , branch)
 values
 ('e108' , 'suresh' , 'hr' , 75000  , 'hyderabad');
 
 
 
 -- DELETE TRIGGER
 select * from emp;

create or replace trigger aft_dlt
after delete on emp
for each row
begin
insert into emp_copy(empno , emp_name , dept , salary  , branch)
values(:old.empno , :old.emp_name ,
:old.dept , :old.salary , :old.branch);
end;

delete from emp
where empno = 'e107';

select * from emp_copy;

-- UPDATE TRIGGER
create or replace trigger after_update
after update on emp
for each row
begin
insert into emp_copy(empno , emp_name , dept , salary  , branch)
values(:old.empno , :old.emp_name ,
:old.dept , :old.salary , :old.branch);
end;

select * from emp;
select * from emp_copy;

update emp
set branch = 'pune'
where empno = 'e108';
 
 
-- ---------------------------------------------------------------------------------------------------------------------------------
--                 Q-2   Movies Database 
-- ---------------------------------------------------------------------------------------------------------------------------------

CREATE TABLE movies(title varchar(20), director varchar(20), movie_year year, rating float);
insert into movies(title, director, movie_year, rating) 
values('Annamayya', 'Ragavendrarao', 1997, 9.0),('KGF', 'Prasanth', 2022, 8.5),('Bahubali', 'Rajamouli', 2015, 9.2),
('Horry Potter', 'Chriscolumbus', 1997, 8.0),
('Sarkaru Vari pata','Parasuram', 2022, 7.5);

select * FROM movies;
-- ---------------------------------------------------
create table actors(actors varchar(20), entry_year year);
insert into actors(actors,entry_year)
values('Nagarjuna',1994);
insert into actors(actors,entry_year)
values('Yash',2014);
insert into actors(actors,entry_year)
values('Prabhas',2017);
insert into actors(actors,entry_year)
values('Daniel', 1901);
insert into actors(actors,entry_year)
values('Mahesh',2005);

select * FROM actors;
-- ------------------------------------------------------
create table title(actor varchar(20), title varchar(20));
insert into title(actor,title)
values('Nagarjuna', 'Annamayya'),('Yash', 'KGF'),
('Prabhas', 'Bahubali'),('Daniel', 'Horry Potter'),
('Mahesh', 'Sarkaru Vari pata');

select * FROM movies;
-- -----------------------------------------------------
create table director(director varchar(20), dyear year);
insert into director(director,dyear)
values('Rajamouli', 2001),('Chris columbus', 1980),
('Parasuram', 2009),('Ragavendrarao', 1975);

select * FROM movies;
-- -----------------------------------------------------






          