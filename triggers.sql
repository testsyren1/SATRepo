# test 3
----- Triggers:  Triggers are the special kind of stored procedures, and they are automatically executed when there is 
                 any change in the database.
----- Uses:      -> It also allows recursion.
				 -> Used for auditing purposes
# Definition: Triggers are statements that are executed automatically in the order of occurrence of any event.
              It is executed whenever there is any change or modification in the database.
              It will execute if any of the operations is performed in database.
              It might be :
              DML- Data Manipulation Language (INSERT|UPDATE|DELETE)
              DDL- DATA DEFINITION LANGUAGE (CREATE|ALTER|DROP)
              LOGON - it is executed in order to occurence of logon event.
              
# SYNTAX OF TRIGGER:
create trigger trigger_name
before|after
insert|update|delete
on table_name
for each row
Trigger_Body

------Before insert Trigger
create table passenger(
name varchar(20),
id int(10),
address varchar(20),
charges int(10),
primary key(id));

select * from passenger

insert into passenger
values("Gaurav",459,"Bengaluru",5000)
insert into passenger
values("manish",460,"Jammu",7000)
insert into passenger
values("Astha",461,"Hyderabad",9000)
insert into passenger
values("Ram",462,"Cochin",8000)
insert into passenger
values("Shyam",463,"Srinagar",10000)


create trigger newtrigger
before insert
on passenger
for each row
set new.charges=new.charges-2000

insert into passenger
values("Athreeth",496,"Raipur",10000
insert into passenger
values("Akanksha",471,"Secundarabad",10000)

------------------------------------------------------------
after insert on trigger example


create table college_student(
name varchar(10),
id int(10),
age int(10),
primary key(id));

select * from college_student

create table college_audit(
id int(10),
audit_description varchar(1000),
primary key(id));

select * from college_audit

create trigger afterinsertcoll
after insert on college_student
for each row
insert into college_audit values(id,concat("A new row is inserted",date_format(now(),'%d %m %y  %h:%i:%s %p')))

drop table college_student
drop table college_audit

drop trigger afterinsertcoll

insert into college_student
values("Manish",250,25)

insert into college_student
values("Manisha",266,27)

---------------------------------------------------------------
->before update example 

CREATE TABLE sales_info (  
    id INT AUTO_INCREMENT,  
    product VARCHAR(100) NOT NULL,  
    quantity INT NOT NULL DEFAULT 0,  
    fiscalYear SMALLINT NOT NULL,  
    CHECK(fiscalYear BETWEEN 2000 and 2050),  
    CHECK (quantity >=0),  
    UNIQUE(product, fiscalYear),  
    PRIMARY KEY(id)  
); 
INSERT INTO sales_info(product, quantity, fiscalYear)  
VALUES  
    ('2003 Maruti Suzuki',110, 2020),  
    ('2015 Avenger', 120,2020),  
    ('2018 Honda Shine', 150,2020),  
    ('2014 Apache', 150,2020); 
    
select * from sales_info


DELIMITER $$  
  
CREATE TRIGGER before_update_salesInfo  
BEFORE UPDATE  
ON sales_info FOR EACH ROW  
BEGIN  
    DECLARE error_msg VARCHAR(255);  
    SET error_msg = ('The new quantity cannot be greater than 2 times the current quantity');  
    IF new.quantity > old.quantity * 2 THEN  
    SIGNAL SQLSTATE '45000'   
    SET MESSAGE_TEXT = error_msg;  
    END IF;  
END $$  
  
DELIMITER ;  

UPDATE sales_info SET quantity = 125 WHERE id = 2;   
 UPDATE sales_info SET quantity = 600 WHERE id = 2;   

select * from sales_info

-----------------------------------------------
-> after update 
create table workers(
   id int(10),
   name varchar(10),
   income int(10)
   primary key(id)
   );
   
   select * from workers;
   
   create table emp_audit(
   id int,
   audit_descp varchar(100)
 
   );

select * from emp_audit;

create  trigger after_update
after update
on workers 
for each row
insert into emp_audit values(id,concat("updated row at ",date_format(now(),'%d %m %y %h:%i:%s %p')));

insert into workers values(3,"Ashish",20000);

update workers set income=23000 where id=3

drop table emp_audit
drop trigger after_update

select * from emp_audit
select * from workers
------------------------------------------------------
#before delete

CREATE TABLE salaries (  
    emp_num INT PRIMARY KEY,  
    valid_from DATE NOT NULL,  
    amount DEC(8 , 2 ) NOT NULL DEFAULT 0  
);  

CREATE TABLE salary_archives (  
    id INT PRIMARY KEY AUTO_INCREMENT,  
    emp_num INT,  
    valid_from DATE NOT NULL,  
    amount DEC(18 , 2 ) NOT NULL DEFAULT 0,  
    deleted_time TIMESTAMP DEFAULT NOW()  
);  
DELIMITER $$  
  
CREATE TRIGGER before_delete_salaries  
BEFORE DELETE  
ON salaries FOR EACH ROW  
BEGIN  
    INSERT INTO salary_archives (emp_num, valid_from, amount)  
    VALUES(OLD. emp_num, OLD.valid_from, OLD.amount);  
END$$   
  
DELIMITER ;  

INSERT INTO salaries (emp_num, valid_from, amount)  
VALUES  
    (102, '2020-01-10', 45000),  
    (103, '2020-01-10', 65000),  
    (105, '2020-01-10', 55000),  
    (107, '2020-01-10', 70000),  
    (109, '2020-01-10', 40000);  

select * from salaries 
select * from salary_archives

DELETE FROM salaries WHERE emp_num = 102;  
-------------------------------------------------------
AFTER DELETE

DROP TABLE IF EXISTS Salaries;

CREATE TABLE Salaries (
    employeeNumber INT PRIMARY KEY,
    salary DECIMAL(10,2) NOT NULL DEFAULT 0
);


INSERT INTO Salaries(employeeNumber,salary)
VALUES
    (1002,5000),
    (1056,7000),
    (1076,8000);

SELECT * FROM Salaries
DROP TABLE IF EXISTS SalaryBudgets;

CREATE TABLE SalaryBudgets(
    total DECIMAL(15,2) NOT NULL
);

select * from SalaryBudgets

INSERT INTO SalaryBudgets(total)
SELECT SUM(salary) 
FROM Salaries;


CREATE TRIGGER after_salaries_delete
AFTER DELETE
ON Salaries FOR EACH ROW
UPDATE SalaryBudgets 
SET total = total - old.salary;

DELETE FROM Salaries
WHERE employeeNumber = 1002;

SELECT * FROM SalaryBudgets;   

-----------------------------------------------------
