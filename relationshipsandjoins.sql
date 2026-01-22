//one to one relationship
create table students(
student_id serial primary key,
name varchar(100) not null
);

insert into students(name) values('nisha sah'),('siddharth rai'),('ii');
select * from students;
create table students_profiles(
student_id int primary key,
address text,
age int,
phone varchar(15)
);
insert into students_profiles(student_id,address,age,phone)
values(1,'delhi',22,'123456789'),
(2,'mumbai',21,'34588888888'),
(3,'bangalore',23,'1234567');
select * from students_profiles;
alter table students_profiles 
add constraint fk_student_id
foreign key(student_id) 
references students(student_id);
select 
s.student_id,
s.name,
sp.address,
sp.age,
sp.phone
from students s
join students_profiles sp
on s.student_id = sp.student_id;
//one to many relationship
create table marks(
mark_id serial primary key,
student_id int,
subject varchar(50),
marks int,
foreign key (student_id) references students(student_id)
);
INSERT INTO marks (student_id, subject, marks)
VALUES
(1, 'English', 85), (1, 'Math', 89), (1, 'Science', 92),
(2, 'English', 80), (2, 'Math', 75), (2, 'Science', 78),
(3, 'English', 72), (3, 'Math', 70), (3, 'Science', 74);

select * from marks;
//inner join returns only matching rows in both tables
select s.name,m.subject,m.marks 
from students s 
join marks m on s.student_id = m.student_id;
insert into students(name) values('harsh');
//left join
select s.name,m.subject,m.marks 
from students s 
left join marks m on s.student_id = m.student_id;
//right join
insert into marks (student_id,subject,marks)
values(4,'english',34);
select s.name,m.subject,m.marks 
from students s 
right join marks m on s.student_id = m.student_id;
//full join
insert into students(name) values('op');
//cross join
select s.name,m.subject,m.marks 
from students s 
cross join marks m on s.student_id = m.student_id;



