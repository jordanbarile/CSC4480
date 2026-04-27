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
DROP TABLE GRADES CASCADE CONSTRAINTS;

CREATE TABLE GRADES(
    GradeID VARCHAR2(4) PRIMARY KEY NOT NULL, 
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

Insert into Student Values ('CW01',	'Catherine', 'Wollan',	'Sophomore', 'ME', 'ME2001', 'cwollan@villanova.edu', '100');
Insert into Student Values ('JC01',  'Joe', 'Ciampa', 'Sophomore', 'ME', 'ME2001', 'jciampa@villanova.edu', '90');
Insert into Student Values ('JS01', 'Jack', 'Szeghy', 'Sophomore', 'ME', 'ME2001', 'jszeghy@villanova.edu', '95');
Insert into Student Values('MD01',	'Mary',	'Duncan',	'Sophomore',	'ME',	'ME2001',	'mduncan@villanova.edu', '91');
Insert into Student Values ('JB01',	'Jacob', 'Bambino',	'Sophomore', 'ME',	'ME2001', 'jbambino@villanova.edu', '93');
Insert into Student Values ('KP01',	'Kierra',	'Pickard',	'Junior',	'ME',	'ME3600',	'kpickard@villanova.edu', '94.62');
Insert into Student Values ('MB01', 'Morgan',	'Bullen', 'Junior', 'ME', 'ME3600', 'mbullen@villanova.edu', '96.15');
Insert into Student Values ('CM01',	'Catherine',	'Murphy',	'Junior', 'ME',	'ME3600', 'Cmurph90@villanova.edu', '89.23');
Insert into Student Values('MW01',	'Mia',	'Walsh',	'Junior',	'ME',	'ME3600',	'mwalsh@villanova.edu', '91.54');
Insert into Student Values ('MS01', 'Matthew', 	'Seal',	'Junior',	'ME',	'ME3600',	'mseal@villanova.edu', '93.85');
Insert into Student Values ('AM01',	'Ava',	'McCann',	'Junior',	'ME',	'ME3950',	'amccann@villanova.edu', '97');
Insert into Student Values ('AK01',	'Arya',	'Kaul',	'Junior',	'ME',	'ME3950',	'akaul@villanova.edu', '93');
Insert into Student Values ('SD01',	'Samantha',	'Damaia',	'Junior',	'ME',	'ME3950',	'sdamaia@villanova.edu', '91');
Insert into Student Values ('SP01',	'Jenna',	'Parker',	'Junior',	'ME',	'ME3950', 'jparker@villanova.edu', '96');
Insert into Student Values ('CD01',	'Caleigh',	'Dinsmore',	'Junior', 'ME', 'ME3950',	'cdinsmore@villanova.edu', '94');

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







