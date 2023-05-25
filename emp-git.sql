create table emp(empno varchar2(5) , emp_name varchar2(8) ,
dept varchar2(20) , salary int , doj date , branch varchar2(15));

drop table if exists emp;


insert into emp(empno , emp_name , dept , salary , doj , branch)
values('e101' , 'amit' , 'production' , 45000 ,date'2000-03-12' ,'bangalore');
 insert into emp(empno , emp_name , dept , salary , doj , branch)
 values('e102' , 'amit' , 'hr' , 70000 , date'2002-07-03' ,'bangalore');
 insert into emp(empno , emp_name , dept , salary , doj , branch)
 values('e103' , 'sunita' , 'management' , 120000 , date'2001-01-11' ,'mysore');
 insert into emp(empno , emp_name , dept , salary , doj , branch)
 values('e105' , 'sunita' , 'it' , 67000 , date'2001-08-01' , 'mysore');
 insert into emp(empno , emp_name , dept , salary , doj , branch)
 values('e106' , 'mahesh' , 'civil' , 145000 , date'2003-09-20' , 'mumbai');
 
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
 
 
 
 