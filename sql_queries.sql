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

select * FROM title;
-- -----------------------------------------------------
create table director(director varchar(20), dyear year);
insert into director(director,dyear)
values('Rajamouli', 2001),('Chris columbus', 1980),
('Parasuram', 2009),('Ragavendrarao', 1975);

select * FROM movies;
-- -----------------------------------------------------

--- 2.Find MovieS Made after 1997
select title as Movies 
from movies  
where movie_year > 1997

---- 3.Find movies made by Rajamouli after 1997

select title as Movies 
from movies 
where director = 'Rajamouli' and movie_year > 1997 

----- 4. Find all movies and their ratings 

select title as Movies , rating from movies

----- 5.Find all actors and directors 
select 
 m.Director, t.Actor 
from movies m
inner join title t on m.Title=t.Title

---- 6.Find Yash movies with Prasanth
select m.title as movies
from movies m
inner join title t on m.Title=t.Title
where t.Actor='Yash' and m.Director='Prasanth'

--- 7. Find the Director who got highest rating.


select director 
from movies 
where rating = (select max(rating)
                from movies)

---- 8. Find the Horry Potter Actor
select Actor from title
where title = 'Horry Potter'

----9. Create View for who got rating below 9

create view lowratingmovie as 
select * from movies
where rating < 9

select * from lowratingmovie