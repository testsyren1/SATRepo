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
 
 