select * from student;
select * from course;

-- students without middle name
select * from student
where middleinitial is null;

-- how many students live in ohio
select count(*) from student
where state = 'OH';
select * from student
where state = 'OH';

-- how many students in each state
select state, count(*)
from student
group by state;

-- who's the oldest student
select concat(firstName, " ", middleInitial, " ", lastName) as 'Oldest Student:', 
	    birthday as 'Birthday:', 
	   (year(curdate())-year(birthday)) as 'AGE'
  from student
 where birthday = (select min(birthday) from student);

-- who's the youngest student
select concat(firstName, '', middleinitial, '',lastname, '') as 'Youngest Student', 
	   birthday 'Birthday', 
	   (year(curdate())-year(birthday)) as 'AGE'
from student
where birthday = (select max(birthday) from student);

-- All student ages
select birthday, year(birthday), curdate(), year(curdate()),
(year(curdate())-year(birthday)) as 'AGE'
from student
order by age;

-- how many social studies courses
select count(*) as 'Social Studies' from course
where subject = 'socialstudies';
select * from course
where subject = 'socialstudies';

-- Number of courses of all courses
select subject as 'Course Subject:', count(name) as 'Number of Courses:'
  from course
group by subject;

-- list all subjects starting with the letter m
select * from course 
where subject like 'm%';

-- how many math courses
select count(*) as 'Math' from course
where subject = 'math';

-- inner join of all three - show all students enrolled in class
select * from enrolled e
join course c on c.id = e.courseID
join student s on s.id = e.studentID;

select * from student s
join enrolled e on e.studentid = s.id
join course c on e.courseid = c.id;

-- all students plus enrollments - outer join
select s.id, firstname, lastname, e.studentID, e.courseid, e.grade from student s
left outer join enrolled e
on e.studentid = s.id;

select c.id 'Course Id', e.grade 'Grade', s.firstname 'First Name', s.middleinitial 'Middle Initial', s.lastname 'Last Name' from enrolled e
inner join course c on c.id = e.courseID
inner join student s on s.id = e.studentID;

-- all students plus enrollments - outer join
select s.id, firstname, lastname, e.studentID, e.courseid, e.grade, c.name 
from student s
left join enrolled e
on e.studentid = s.id
left join course c
on e.courseid = c.id;