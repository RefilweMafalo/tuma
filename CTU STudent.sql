CREATE DATABASE CTU_Students;

CREATE TABLE Student (
Student_Id INT PRIMARY KEY ,
FirstName VARCHAR (50),
LastName VARCHAR (50),
StudentNumber VARCHAR (50),
StudentEmail VARCHAR (50),
Phonenumber VARCHAR (50),
EnrolDate  DATE,
Qualificatiion VARCHAR (50),
Fees Float ,
InterestperQualification float,);

INSERT INTO Student(
Student_Id, FirstName, LastName,StudentNumber, StudentEmail, Phonenumber, EnrolDate, Qualificatiion,Fees,InterestperQualification) 
VALUES (1,'James','Cook', 'SN000001', 'SN000001@ctu.co.za', '0800- STUDENT01', '2021-02-03','BI',13463.0,2.58),