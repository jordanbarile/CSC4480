--Lauren Markarian: Inserting Course and Student Tables
DROP TABLE STUDENT CASCADE CONSTRAINTS;
DROP TABLE COURSE CASCADE CONSTRAINTS;
CREATE TABLE COURSE (
    Course_ID VARCHAR2(6) PRIMARY KEY NOT NULL,
    Department VARCHAR2(25),
    Course_Number VARCHAR2(4),
    Course_Title VARCHAR2(25),
    Time_Semester VARCHAR2(10),
    Name_Year VARCHAR2(4),
    Room_Number VARCHAR2(15),
    Status VARCHAR2(6),
    Start_Time VARCHAR(10)
);

CREATE TABLE STUDENT (
    Student_ID VARCHAR2(4) PRIMARY KEY NOT NULL,
    First_Name VARCHAR2(25),
    Last_Name VARCHAR2(25),
    Class_Year VARCHAR2(15),
    Major VARCHAR2(2),
    Course_ID VARCHAR2(6), 
    Email_Address VARCHAR2(25),
    Final_Grade NUMBER(5,2)
);

ALTER TABLE STUDENT ADD FOREIGN KEY (Course_ID) REFERENCES COURSE(Course_ID);

--Jordan Barile: Inserting Categories and Assignment Tables
DROP TABLE CATEGORIES CASCADE CONSTRAINTS;
DROP TABLE ASSIGNMENT CASCADE CONSTRAINTS;

CREATE TABLE CATEGORIES (
    CategoryID VARCHAR2(4) PRIMARY KEY NOT NULL,
    Course_ID VARCHAR2(6),
    CategoryName VARCHAR2(15),
    WeightPercentage INT
);
ALTER TABLE CATEGORIES ADD FOREIGN KEY (Course_ID) REFERENCES COURSE(Course_ID);

CREATE TABLE ASSIGNMENT (
    AssignmentID VARCHAR2(15) PRIMARY KEY NOT NULL,
    CategoryID VARCHAR2(4),
    AssignmentName VARCHAR2(10),
    PointsPossible INT
);
ALTER TABLE ASSIGNMENT ADD FOREIGN KEY (CategoryID) REFERENCES CATEGORIES(CategoryID);

-- Julia Smyth: Inserting the Grade table 
DROP TABLE Grades CASCADE CONSTRAINTS;

CREATE TABLE Grades(
    Student_ID VARCHAR2(4),
    AssignmentID varchar(15), 
    PointsEarned INT
);
ALTER TABLE Grades ADD FOREIGN KEY (Student_ID) REFERENCES Student(Student_ID);
ALTER TABLE Grades ADD FOREIGN KEY (AssignmentID) REFERENCES Assignment(AssignmentID);

-- Lauren Markarian: Inserting records in Course and Student tables
Insert into Course Values ('ME2001', 'Mechanical Engineering', '2001', 'Statics', 'Fall', '2026', 'Drosdick036', 'Full', '8:30am');
Insert into Course Values ('ME3600', 'Mechanical Engineering', '3600', 'Fluid Mechanics', 'Fall', '2026', 'Drosdick031', 'Full', '12:30pm');
Insert into Course Values ('ME3950', 'Mechanical Engineering', '3950', 'Heat Transfer', 'Fall', '2026',	'Drosdick314', 'Full', '3:30pm');

Insert into Student Values ('CW01',	'Catherine', 'Wollan',	'Sophomore', 'ME', 'ME2001', 'cwollan@villanova.edu', NULL);
Insert into Student Values ('JC01',  'Joe', 'Ciampa', 'Sophomore', 'ME', 'ME2001', 'jciampa@villanova.edu', NULL);
Insert into Student Values ('JS01', 'Jack', 'Szeghy', 'Sophomore', 'ME', 'ME2001', 'jszeghy@villanova.edu', NULL);
Insert into Student Values('MD01',	'Mary',	'Duncan',	'Sophomore',	'ME',	'ME2001',	'mduncan@villanova.edu', NULL);
Insert into Student Values ('JB01',	'Jacob', 'Bambino',	'Sophomore', 'ME',	'ME2001', 'jbambino@villanova.edu', NULL);
Insert into Student Values ('KP01',	'Kierra',	'Pickard',	'Junior',	'ME',	'ME3600',	'kpickard@villanova.edu', NULL);
Insert into Student Values ('MB01', 'Morgan',	'Bullen', 'Junior', 'ME', 'ME3600', 'mbullen@villanova.edu', NULL);
Insert into Student Values ('CM01',	'Catherine',	'Murphy',	'Junior', 'ME',	'ME3600', 'Cmurph90@villanova.edu', NULL);
Insert into Student Values('MW01',	'Mia',	'Walsh',	'Junior',	'ME',	'ME3600',	'mwalsh@villanova.edu', NULL);
Insert into Student Values ('MS01', 'Matthew', 	'Seal',	'Junior',	'ME',	'ME3600',	'mseal@villanova.edu', NULL);
Insert into Student Values ('AM01',	'Ava',	'McCann',	'Junior',	'ME',	'ME3950',	'amccann@villanova.edu', NULL);
Insert into Student Values ('AK01',	'Arya',	'Kaul',	'Junior',	'ME',	'ME3950',	'akaul@villanova.edu', NULL);
Insert into Student Values ('SD01',	'Samantha',	'Damaia',	'Junior',	'ME',	'ME3950',	'sdamaia@villanova.edu', NULL);
Insert into Student Values ('SP01',	'Jenna',	'Parker',	'Junior',	'ME',	'ME3950', 'jparker@villanova.edu', NULL);
Insert into Student Values ('CD01',	'Caleigh',	'Dinsmore',	'Junior', 'ME', 'ME3950',	'cdinsmore@villanova.edu', NULL);

-- Jordan Barile: Inserting values into categories and assignment tables
INSERT INTO CATEGORIES VALUES ('C001','ME2001','HW_Grade', 20);
INSERT INTO CATEGORIES VALUES ('C002','ME2001','Lab_Grade', 20);
INSERT INTO CATEGORIES VALUES ('C003','ME2001','MidtermExam', 30);
INSERT INTO CATEGORIES VALUES ('C004','ME2001','FinalExam', 30);
INSERT INTO CATEGORIES VALUES ('C005','ME3600','AttendanceGrade', 15);
INSERT INTO CATEGORIES VALUES ('C006','ME3600','LabGrade', 25);
INSERT INTO CATEGORIES VALUES ('C007','ME3600','Exam1', 20);
INSERT INTO CATEGORIES VALUES ('C008','ME3600','Exam2', 20);
INSERT INTO CATEGORIES VALUES ('C009','ME3600','Exam3', 20);
INSERT INTO CATEGORIES VALUES ('C010','ME3950','HWGrade', 25);
INSERT INTO CATEGORIES VALUES ('C011','ME3950','LabGrade', 25);
INSERT INTO CATEGORIES VALUES ('C012','ME3950','Midterm', 25);
INSERT INTO CATEGORIES VALUES ('C013','ME3950','Final', 25);

INSERT INTO ASSIGNMENT VALUES ('HW1_S', 'C001', 'Homework1', 10);
INSERT INTO ASSIGNMENT VALUES ('HW2_S', 'C001', 'Homework2', 10);
INSERT INTO ASSIGNMENT VALUES ('LAB1_S', 'C002', 'Lab1', 10);
INSERT INTO ASSIGNMENT VALUES ('LAB2_S', 'C002', 'Lab2', 10);
INSERT INTO ASSIGNMENT VALUES ('MIDTERM_S', 'C003', 'Midterm', 30);
INSERT INTO ASSIGNMENT VALUES ('FINAL_S', 'C004', 'Final', 30);
INSERT INTO ASSIGNMENT VALUES ('ATTENDANCE_F', 'C005', 'Attendance', 15);
INSERT INTO ASSIGNMENT VALUES ('LAB1_F', 'C006', 'Lab1', 25);
INSERT INTO ASSIGNMENT VALUES ('EXAM1_F', 'C007', 'Exam1', 30);
INSERT INTO ASSIGNMENT VALUES ('EXAM2_F', 'C008', 'Exam2', 30);
INSERT INTO ASSIGNMENT VALUES ('EXAM3_F', 'C009', 'Exam3', 30);
INSERT INTO ASSIGNMENT VALUES ('HW1_H', 'C010', 'Homework1', 25);
INSERT INTO ASSIGNMENT VALUES ('LAB1_H', 'C011', 'Lab1', 25);
INSERT INTO ASSIGNMENT VALUES ('MIDTERM_H', 'C012', 'Midterm', 25);
INSERT INTO ASSIGNMENT VALUES ('FINAL_H', 'C013', 'Final', 25);

-- inserted grades Julia 
insert into Grades values('CW01','HW1_S', 10); 
insert into Grades values('CW01','HW2_S', 10);
insert into Grades values('CW01','LAB1_S', 10);
insert into Grades values('CW01','LAB2_S', 10);
insert into Grades values('CW01','MIDTERM_S', 30);
insert into Grades values('CW01','FINAL_S', 30);

insert into Grades values('JC01','HW1_S', 8); 
insert into Grades values('JC01','HW2_S', 9);
insert into Grades values('JC01','LAB1_S', 9);
insert into Grades values('JC01','LAB2_S', 10);
insert into Grades values('JC01','MIDTERM_S', 28);
insert into Grades values('JC01','FINAL_S', 26);

insert into Grades values('JS01','HW1_S', 10); 
insert into Grades values('JS01','HW2_S', 9);
insert into Grades values('JS01','LAB1_S', 10);
insert into Grades values('JS01','LAB2_S', 10);
insert into Grades values('JS01','MIDTERM_S', 27);
insert into Grades values('JS01','FINAL_S', 29);

insert into Grades values('MD01','HW1_S', 9); 
insert into Grades values('MD01','HW2_S', 8);
insert into Grades values('MD01','LAB1_S', 10);
insert into Grades values('MD01','LAB2_S', 9);
insert into Grades values('MD01','MIDTERM_S', 25);
insert into Grades values('MD01','FINAL_S', 30);


insert into Grades values('JB01','HW1_S', 6); 
insert into Grades values('JB01','HW2_S', 7);
insert into Grades values('JB01','LAB1_S', 6);
insert into Grades values('JB01','LAB2_S', 7);
insert into Grades values('JB01','MIDTERM_S', 20);
insert into Grades values('JB01','FINAL_S', 21);


insert into Grades values('KP01','ATTENDANCE_F', 15);
insert into Grades values('KP01','LAB1_F', 24);
insert into Grades values('KP01','EXAM1_F', 30);
insert into Grades values('KP01','EXAM2_F', 28);
insert into Grades values('KP01','EXAM3_F', 26);

insert into Grades values('MB01','ATTENDANCE_F', 15);
insert into Grades values('MB01','LAB1_F', 25);
insert into Grades values('MB01','EXAM1_F', 26);
insert into Grades values('MB01','EXAM2_F', 29);
insert into Grades values('MB01','EXAM3_F', 30);

insert into Grades values('CM01','ATTENDANCE_F', 14);
insert into Grades values('CM01','LAB1_F', 22);
insert into Grades values('CM01','EXAM1_F', 28);
insert into Grades values('CM01','EXAM2_F', 29);
insert into Grades values('CM01','EXAM3_F', 23);


insert into Grades values('MW01','ATTENDANCE_F', 13);
insert into Grades values('MW01','LAB1_F', 24);
insert into Grades values('MW01','EXAM1_F', 30);
insert into Grades values('MW01','EXAM2_F', 29);
insert into Grades values('MW01','EXAM3_F', 23);


insert into Grades values('MS01','ATTENDANCE_F', 15);
insert into Grades values('MS01','LAB1_F', 22);
insert into Grades values('MS01','EXAM1_F', 30);
insert into Grades values('MS01','EXAM2_F', 27);
insert into Grades values('MS01','EXAM3_F', 28);


insert into Grades values('AM01','HW1_H', 23);
insert into Grades values('AM01','LAB1_H', 25);
insert into Grades values('AM01','MIDTERM_H', 24);
insert into Grades values('AM01','FINAL_H', 25);

insert into Grades values('AK01','HW1_H', 25);
insert into Grades values('AK01','LAB1_H', 22);
insert into Grades values('AK01','MIDTERM_H', 24);
insert into Grades values('AK01','FINAL_H', 22);


insert into Grades values('SD01','HW1_H', 25);
insert into Grades values('SD01','LAB1_H', 23);
insert into Grades values('SD01','MIDTERM_H', 22);
insert into Grades values('SD01','FINAL_H', 21);


insert into Grades values('SP01','HW1_H', 22);
insert into Grades values('SP01','LAB1_H', 25);
insert into Grades values('SP01','MIDTERM_H', 24);
insert into Grades values('SP01','FINAL_H', 25);

insert into Grades values('CD01','HW1_H', 25);
insert into Grades values('CD01','LAB1_H', 23);
insert into Grades values('CD01','MIDTERM_H', 24);
insert into Grades values('CD01','FINAL_H', 22);

-- Jordan Barile: triggers to not allow over enrollment in the class
CREATE OR REPLACE TRIGGER prevent_over_enrollment
BEFORE INSERT ON STUDENT
FOR EACH ROW
DECLARE
    v_count INT;
    v_status VARCHAR2(6);
BEGIN
    SELECT COUNT(*), MAX(Status)
    INTO v_count, v_status
    FROM STUDENT s
    JOIN COURSE c ON s.Course_ID = c.Course_ID
    WHERE s.Course_ID = :NEW.Course_ID;

    IF v_status = 'Full' OR v_count >= 5 THEN
        RAISE_APPLICATION_ERROR(-20001, 
            'Cannot enroll student: Course ' || :NEW.Course_ID || ' is full.');
    END IF;
END;
/
--Lauren Markarian: Update Final Grade Field
UPDATE STUDENT s
SET FINAL_GRADE =
(
SELECT ROUND(SUM((category_score * WeightPercentage / 100.0)), 2
)
From (
    Select c.CategoryID, c.WeightPercentage, (SUM(g.PointsEarned) / SUM(a.PointsPossible)) * 100 AS
    Category_Score
FROM Grades g
JOIN ASSIGNMENT a
    ON g.AssignmentID = a.AssignmentID
JOIN Categories c
    ON a.CategoryID = c.CategoryID
WHERE g.Student_ID = s.Student_ID
Group by c.CategoryID, c.WeightPercentage
)
);

--Lauren Markarian: Update the Status Field
UPDATE COURSE c
SET Status =
(
    SELECT CASE 
        WHEN COUNT(*) >= 5 THEN 'Full'
        ELSE 'Open'
    END
    FROM STUDENT s
    WHERE s.Course_ID = c.Course_ID
);

PROMPT ===== COURSE TABLE =====
select * from Course;
PROMPT ===== STUDENT TABLE =====
select * from Student;
PROMPT ===== CATEGORIES TABLE =====
select * from Categories;
PROMPT ===== ASSIGNMENT TABLE =====
select * from Assignment;
PROMPT ===== GRADES TABLE =====
select * from Grades;

-- Jordan: Update a Record
UPDATE Grades
    SET PointsEarned = 30
    WHERE Student_ID = 'JB01'
    AND AssignmentID = 'FINAL_S';

UPDATE STUDENT s
SET FINAL_GRADE =
(
SELECT ROUND(SUM((category_score * WeightPercentage / 100.0)), 2
)
From (
    Select c.CategoryID, c.WeightPercentage, (SUM(g.PointsEarned) / SUM(a.PointsPossible)) * 100 AS
    Category_Score
FROM Grades g
JOIN ASSIGNMENT a
    ON g.AssignmentID = a.AssignmentID
JOIN Categories c
    ON a.CategoryID = c.CategoryID
WHERE g.Student_ID = s.Student_ID
Group by c.CategoryID, c.WeightPercentage
)
)
WHERE s.Student_ID = 'JB01';

select * from student where Student_ID = 'JB01';

-- Jordan Barile: Read a record

SELECT *
FROM STUDENT
WHERE FINAL_GRADE >= 89 AND FINAL_GRADE < 90;

UPDATE STUDENT
SET FINAL_GRADE = 90
WHERE Student_ID = 'CM01';

PROMPT ===== STUDENT TABLE =====
select * from student;

-- Jordan Barile: test to try and enroll student in a full class
--INSERT INTO STUDENT VALUES ('JB02', 'Jordan', 'Barile', 'Junior', 'ME', 'ME2001', 'jbarile@villanova.edu', NULL);