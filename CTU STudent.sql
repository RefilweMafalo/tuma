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
VALUES (1,'James','Cook', 'SN000001', 'SN000001@ctu.co.za', '0800- STUDENT01', '2021-02-03','BI',13463.0,2.58),(2,'Monga','Manganyi', 'SN000002', 'SN000002@ctu.co.za', '0800- STUDENT02', '2022-07-20','PF',8094.03,3.75),(3,'Karabo','Mfene', 'SN000003', 'SN000003@ctu.co.za', '0800- STUDENT03', '2022-02-17','AAD',5478.56,2.78),(4,'Sizwe','Dlomo', 'SN000004', 'SN000004@ctu.co.za', '0800- STUDENT04', '2022-03-21','GD',19444.47,2.44);UPDATE StudentSET Fees = 25000WHERE Student_Id= 1;DECLARE	@p float,	@r float,	@t float = 1,	@tot float;BEGINSELECT @p=Fees, @r=InterestPerQualification, @tot = @p * power (1 + ( @r/100),@t)FROM StudentWHERE Student_ID = 3;END;SELECT round(@tot,2) AS Total_After_Interest;