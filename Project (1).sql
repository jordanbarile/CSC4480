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
    Start_Time TIMESTAMP
);

CREATE TABLE STUDENT (
    Student_ID VARCHAR2(4) PRIMARY KEY NOT NULL,
    First_Name VARCHAR2(25),
    Last_Name VARCHAR2(25),
    Class_Year VARCHAR2(15),
    Major VARCHAR2(2),
    Course_ID VARCHAR(6), 
    Email_Address VARCHAR2(25)
);

ALTER TABLE STUDENT ADD FOREIGN KEY (Course_ID) REFERENCES COURSE(Course_ID);