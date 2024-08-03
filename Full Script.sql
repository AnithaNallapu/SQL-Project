/*
MBA STUDENTS DATA
From January 2022-January 2024
2 Years course
compulsory modules for 3 semisters and in last semister students can choose any one optional program based module
*/
					/* CORE REQUIREMENTS All */
/* Q1,Q2 */

Create table MBAStudents.Students
(Student_ID INT primary key Not Null, First_Name varchar(50) Not Null, Last_Name varchar(50) Not Null, Email_Id varchar(50) Not Null);
Insert into MBAStudents.Students
values 
(109804,'Anitha','Nallapu', 'AnithaN@uclan.ac.uk' ),
(109750,'Pravalika', 'Nimmarajula', 'PravalikaN@uclan.ac.uk'),
(109888, 'Shiva', 'Thamisetty','ShivaT@uclan.ac.uk'),
(109204, 'Manipal', 'Thota','ManipalT@uclan.ac.uk'),
(109150, 'Indira', 'Mani', 'IndiraM@uclan.ac.uk'),
(109657, 'Daksha', 'Adapala','DakshaA@uclan.ac.uk'),
(109366, 'Vignesh','Kumar','VigneshK@uclan.ac.uk'),
(109226, 'Ramcharan','Konidela','RamcharanK@uclan.ac.uk');

Create table MBAStudents.Address
(Address_ID Int Primary key not null, Student_ID INT not null,Address Varchar(500) not null, 
City Varchar(50) not null,Postcode varchar(50) not null, 
Foreign key (Student_ID) References Students(Student_ID));
insert into MBAStudents.Address
values 
(1,109804,'33 Frenchwood','Preston','PR1 6LE'),
(2,109750,'27 Citycentre','Manchester','M1 1AD'),
(3,109888,'85 Newhalllane','Preston', 'PR1 5AB'),
(4,109204,'66 Moorpark', 'Preston', 'PR1 3MM'),
(5,109150,'203 Avenhamstreet', 'Preston', 'PR1 3AE'),
(6,109657,'229 Blackrod', 'Bolton', 'BL5 8FT'),
(7,109366,'190 StockportRD', 'Manchester','M19 3JN'),
(8,109226,'802 OxfordRD', 'Manchester', 'M13 8HJ');


Create table MBAStudents.Enrolment
(Enrolment_ID INT Primary key,Student_ID Int, Program Varchar(500),
Enrolment1_Date Date, Enrolment2_Date Date,
Foreign key (Student_ID) References Students(Student_ID));
insert into MBAStudents.Enrolment
values
(1298,109804,'MBA with Work-based Learning','2022-01-19', '2023-03-22'),
(1273,109750,'MBA with Work-based Learning','2022-01-23', '023-03-02'),
(1092,109888,'MBA with Placement','2022-02-01', '2023-03-12'),
(1982,109204,'MBA with Placement','2022-02-15','2023-04-01'),
(1289,109150,'MBA with Placement','2022-01-24','2023-03-16'),
(1345,109657,'MBA with Placement','2022-01-22','2023-04-16'),
(1125,109366,'MBA with Work-based Learning','2022-02-13','2023-03-17'),
(1362,109226,'MBA with Placement','2022-01-28','2023-03-09');

Create table MBAStudents.Professors
(Professor_ID Int primary key, First_Name Varchar(50), Last_Name varchar(50),Email varchar(100));
Insert Into MBAStudents.Professors
values
(1011,'Shelly','Bavin','ShellyB@uclan.ac.uk'),
(1012,'Ruth','Stav','RuthS@uclan.ac.uk'),
(1013,'Khurram','Conway','KhurramT@Uclan.ac.uk'),
(1014,'Tony','Tan','TonyT@uclan.ac.uk');

Create table MBAStudents.Modules
(Module_ID Int Primary Key, Module_Name Varchar(50),Semester Int, Credits Int, Professor_ID Int,
Foreign key (Professor_ID) References Professors(Professor_ID));
Insert into MBAStudents.Modules
values
(400804, 'Professional Development',1,20,1011),
(400352,'Research Skills',1,20,1013),
(400609,'Entrepreneurship Theory',2,20,1012),
(100210,'Finacial Management',2,20,1011),
(200298, 'Project Managemnt',3,20,1012),
(400201,'Management Consultancy',3,40,1011),
(300158,'Work-Based Learning', 4,60,1013),
(400123,'Placement',4,60,1014);

Create table MBAStudents.Assignments
(Assignment_ID Int Primary Key,Assignment_Name Varchar(50),Module_ID Int,Type varchar(50),
Foreign key (Module_ID) References Modules(Module_ID));
insert Into MBAStudents.Assignments
Values
(1,'PD CW',400804,'2000W Assignment'),
(2,'RS CW',400352,'Presentation'),
(3,'ET CW',400609,'3000WGroup Report'),
(4,'FM CW',100210,'Exam'),
(5,'PM CW',200298, '2000W Assignment'),
(6,'MC CW',400201,'5000W Group Report'),
(7,'WBL Project',300158, '12000W Project'),
(8,'PT Project',400123,'12000W Project');


Create table MBAStudents.Grades
(Grade_ID Int primary key, Assignment_ID int,Student_ID Int, Grade Int, Pass_or_Fail varchar(50),
Foreign key (Assignment_ID) References Assignments(Assignment_ID),
Foreign key (Student_ID) References Students(Student_ID));
insert Into MBAStudents.Grades
values
(1,1,109804,77,'pass'),
(2,1,109750,67,'pass'),
(3,1,109888,54,'pass'),
(4,1,109204,55,'pass'),
(5,1,109150,58,'pass'),
(6,1,109657,65,'pass'),
(7,1,109366,60,'pass'),
(8,1,109226,51,'pass'),

(9,2,109804,63,'pass'),
(10,2,109750,58,'pass'),
(11,2,109888,66,'pass'),
(12,2,109204,55,'pass'),
(13,2,109150,55,'pass'),
(14,2,109657,57,'pass'),
(15,2,109366,56,'pass'),
(16,2,109226,62,'pass'),

(17,3,109804,69,'pass'),
(18,3,109750,61,'pass'),
(19,3,109888,51,'pass'),
(20,3,109204,53,'pass'),
(21,3,109150,61,'pass'),
(22,3,109657,66,'pass'),
(23,3,109366,40,'fail'),
(24,3,109226,51,'pass'),

(25,4,109804,61,'pass'),
(26,4,109750,55,'pass'),
(27,4,109888,67,'pass'),
(28,4,109204,52,'pass'),
(29,4,109150,59,'pass'),
(30,4,109657,62,'pass'),
(31,4,109366,45,'fail'),
(32,4,109226,51,'pass'),

(33,5,109804,54,'pass'),
(34,5,109750,59,'pass'),
(35,5,109888,51,'pass'),
(36,5,109204,59,'pass'),
(37,5,109150,52,'pass'),
(38,5,109657,63,'pass'),
(39,5,109366,54,'pass'),
(40,5,109226,66,'pass'),

(41,6,109804,68,'pass'),
(42,6,109750,59,'pass'),
(43,6,109888,65,'pass'),
(44,6,109204,54,'pass'),
(45,6,109150,71,'pass'),
(46,6,109657,65,'pass'),
(47,6,109366,58,'pass'),
(48,6,109226,52,'pass'),

(49,7,109804,64,'pass'),
(50,7,109750,62,'pass'),
(51,7,109366,58,'pass'),

(52,8,109888,60,'pass'),
(53,8,109204,50,'pass'),
(54,8,109150,43,'fail'),
(55,8,109657,57,'pass'),
(56,8,109226,44,'fail');



Create table MBAStudents.Retake
(Retake_ID int Primary key, Enrolment_ID int,Retake_Module_ID Int, Grade_ID int, Retake_StartDate date,
Foreign key (Retake_Module_ID) References Modules(Module_ID),
Foreign key (Enrolment_ID) References Enrolment(Enrolment_ID),
Foreign key (Grade_ID) References Grades(Grade_ID));
insert into MBAStudents.Retake
values
(1,1125,400609,23,'2024-03-11'),
(2,1125,100210,31,'2024-03-13'),
(3,1289,400123,54,'2024-03-15'),
(4,1362,400123,56,'2024-03-15');

/* DIFFERENT TASKS RELATED TO PROJECT*/

/* Q3-Using any type of the joins create a view that combines multiple tables in a logical way
A- craeting a VIEW by joining 4 tables
   view is showing Retake studnets names, their retaking modules and grades 
*/
CREATE VIEW `V_Retake_Students` AS
SELECT s.First_Name, s.Last_Name, m.Module_Name, g.grade, g.pass_or_fail
FROM MBAStudents.Retake as r
inner join MBAStudents.enrolment as e on e.Enrolment_ID = r.Enrolment_ID
inner join MBAStudents.Students as s on s.Student_ID = e.Student_ID
inner join MBAStudents.Modules as m on m.Module_ID = r.Retake_Module_ID
inner join MBAStudents.Grades as g on g.Grade_ID = r.Grade_ID;

/*Q4: using STORED FUNCTION to generate a query */

SELECT concat( s.first_name, ' ', s.last_name) as 'Student FullName',
count( distinct g.Assignment_ID) as 'Total Assignments',
AverageGrade(Sum(g.Grade), count( distinct g.Assignment_ID)) as 'Overall Average Grade'
FROM MBAStudents.Grades as g
inner join students as s on s.Student_ID = g.Student_ID
group by g.Student_ID
order by AverageGrade(Sum(g.Grade), count( distinct g.Assignment_ID)) Desc;

/* Q5: Prepare an example query with a subquery 
to demonstrate how to extract data from your DB for analysis
A: by this subquery we can find which students doing placement program 
and with other query we can find students who are doing Work-based learning)
*/
SELECT * FROM MBAStudents.students
where student_ID in
(select Student_ID from enrolment
where program = 'MBA with Placement');

SELECT * FROM MBAStudents.students
where student_ID in
(select Student_ID from enrolment
where program = 'MBA with Work-based Learning');

				/* ADVANCED OPTIONS All 5 */
                
/*Q1 : In your database, create a  STORED PROCEDURE and demonstrate how it runs
USING Stored Procedure 
to show any one student complete information */

call StudentFullDetails(109804);
call StudentFullDetails(109750);


/* Q2: create a trigger and demonstrate how it runs
we craeted a trigger with Students_BEFORE_INSERT
set new.First_name = upper(new.first_name)
*/
insert into Students
values (1, 'shivani', 'Setty','ss@uclan.ac.uk');

/* Q3: create an event and demonstrate how it runs* /
/*
-- change DELIMITER 
DELIMITER //

create Event Delete_Data_Grades
on schedule every 1 month starts now()
do begin 
DELETE from MBAStudents.Grades
where grade > 50;
END //
-- change DELIMITER
DELIMITER ;

*/

SELECT * FROM MBAStudents.Grades;
drop event Delete_Data_Grades;


/*Q4:Create a view that uses at least 3-4 base tables; */

CREATE VIEW `ProssorsHelpForRetake` AS
SELECT v.*, p.professor_ID,
Concat(p.first_name,' ', p.last_name) as Professor_Name,
p.Email
FROM v_retake_students as v
inner join modules as m on m.Module_name = v.module_name
inner join professors as p on p.Professor_Id = m.Professor_ID;



/*Q5 : Prepare an example query with group by and having to 
demonstrate how to extract data from your DB for analysis
A: Avggrade > 57
*/

SELECT concat( s.first_name, ' ', s.last_name) as 'Student FullName',
count( distinct g.Assignment_ID) as 'Total Assignments',
AverageGrade(Sum(g.Grade), count( distinct g.Assignment_ID)) as 'Overall_Average_Grade'
FROM MBAStudents.Grades as g
inner join students as s on s.Student_ID = g.Student_ID
group by g.Student_ID
having Overall_Average_Grade >57
order  by Overall_Average_Grade Desc;


					/*COMPLETED 
                    THANK YOU*/









