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