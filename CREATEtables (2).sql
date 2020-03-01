drop table Exams_Result
drop table Class_Date_Details
drop table Absences
drop table Parent
drop table Borrows
drop table Classroom_Student
drop table Students
drop table Books
drop table Authors
drop table Weekday;
drop table Exams;
drop table Class;
drop table Teachers;
drop table Course;
drop table Type_Of_Course;
drop table Language;

CREATE TABLE Account 
(	ID_Account INTEGER NOT NULL PRIMARY KEY IDENTITY (1,1),
	Loginn NVARCHAR (50) NOT NULL,
	Passwordd NVARCHAR (50) NOT NULL,
	TypeOfAccount NVARCHAR (1) NOT NULL,
	ActiveFrom Date NOT NULL
)    

    CREATE TABLE Students
    (
     StudentId INTEGER NOT NULL PRIMARY KEY IDENTITY(1,1),
     Gender NVARCHAR (20) NOT NULL ,
     DateBirth DATE NOT NULL ,
     Name NVARCHAR (50) NOT NULL ,
     Surname NVARCHAR (50) NOT NULL ,
     PhoneNumber INTEGER NOT NULL,
	 AccountID INTEGER NOT NULL UNIQUE,
	 CONSTRAINT StudentsFK FOREIGN KEY (AccountID) REFERENCES Account (ID_Account)
    )
GO
CREATE TABLE Parent
    (
     Parent_ID INTEGER NOT NULL PRIMARY KEY IDENTITY (1,1) ,
     Name NVARCHAR (50) NOT NULL ,
     Surname NVARCHAR (50) NOT NULL ,
     PhoneNumber INTEGER NOT NULL ,
     Gender NVARCHAR (20) NOT NULL ,
     Child_ID INTEGER NOT NULL 
    )
	
ALTER TABLE Parent
    ADD CONSTRAINT Parent_Students_FK 
	FOREIGN KEY(Child_ID)REFERENCES Students(StudentId)
	ON DELETE CASCADE
	ON UPDATE CASCADE
GO
CREATE TABLE Borrows
    (
     Borrow_ID INTEGER NOT NULL PRIMARY KEY IDENTITY (1,1),
     Student_ID INTEGER NOT NULL ,
     Book_ID INTEGER NOT NULL ,
     Taken_Date DATE NOT NULL ,
     Return_Date DATE
    )
GO
ALTER TABLE Borrows
    ADD CONSTRAINT Borrows_Students_FK FOREIGN KEY (Student_ID)REFERENCES Students(StudentId)
    ON DELETE CASCADE
	ON UPDATE CASCADE;
GO
CREATE TABLE Books
    (
     Book_ID INTEGER NOT NULL PRIMARY KEY IDENTITY (1,1),
     Author_ID INTEGER NOT NULL ,
     Name NVARCHAR (50) NOT NULL ,
     Pages_Number INTEGER NOT NULL ,
     ReleaseYear INTEGER NOT NULL
    )
GO
ALTER TABLE Borrows
    ADD CONSTRAINT Borrows_Books_FK FOREIGN KEY (Book_ID)REFERENCES Books(Book_ID)
    ON DELETE CASCADE
	ON UPDATE CASCADE;
GO
CREATE TABLE Authors
    (
     Author_ID INTEGER NOT NULL PRIMARY KEY IDENTITY (1,1),
     Name NVARCHAR (50) NOT NULL ,
     Surname NVARCHAR (50) NOT NULL
    )
GO
ALTER TABLE Books
    ADD CONSTRAINT Books_AuthorID_FK FOREIGN KEY (Author_ID)REFERENCES Authors(Author_ID)
    ON DELETE CASCADE
	ON UPDATE CASCADE;

CREATE TABLE Absences
    (
     Date DATE NOT NULL ,
     Classroom_Student_ID INTEGER NOT NULL ,
     Student_ID INTEGER NOT NULL ,
     Status CHAR (1) NOT NULL DEFAULT 'F' ,
     Comment CHAR (50)
    )
GO

ALTER TABLE Absences 
ADD CONSTRAINT Absences_PK PRIMARY KEY (Classroom_Student_ID, Date, Student_ID);
ALTER TABLE Absences
ADD CONSTRAINT Absences_Students_FK FOREIGN KEY(Student_ID)REFERENCES Students(StudentId)
ON DELETE CASCADE
ON UPDATE CASCADE;
GO

CREATE TABLE Classroom_Student
    (
     Classroom_ID INTEGER NOT NULL PRIMARY KEY IDENTITY (1,1),
     Class_ID INTEGER NOT NULL ,
     Student_ID INTEGER NOT NULL 
    )
GO
ALTER TABLE Classroom_Student 
ADD CONSTRAINT Classroom_Student__UN UNIQUE NONCLUSTERED (Class_ID, Student_ID)
GO

ALTER TABLE Classroom_Student
ADD CONSTRAINT Classroom_Student_Students_FK FOREIGN KEY(Student_ID)
REFERENCES Students(StudentId)
GO
    
ALTER TABLE Absences
    ADD CONSTRAINT Absences_Classroom_Student_FK FOREIGN KEY (Classroom_Student_ID)
    REFERENCES Classroom_Student(Classroom_ID)
    ON DELETE CASCADE
	ON UPDATE CASCADE
GO
CREATE TABLE Class_Date_Details
    (
     Class_ID INTEGER NOT NULL ,
     WeekDay_ID INTEGER NOT NULL ,
     Start_Hour TIME NOT NULL ,
     End_Hour TIME NOT NULL
    )
GO

ALTER TABLE Class_Date_Details 
ADD CONSTRAINT Class_Date_Details_PK PRIMARY KEY (Class_ID, WeekDay_ID);

ALTER TABLE Class_Date_Details
    ADD CONSTRAINT Class_Date_Details_Classroom_Student_FK 
	FOREIGN KEY (Class_ID)REFERENCES Classroom_Student( Classroom_ID)
    ON DELETE CASCADE
	ON UPDATE CASCADE
GO

CREATE TABLE Weekday
    (
     Weekday_ID INTEGER NOT NULL ,
     Name NVARCHAR (50) NOT NULL
    )
GO

ALTER TABLE Weekday 
ADD CONSTRAINT Weekday_PK PRIMARY KEY (Weekday_ID);

ALTER TABLE Class_Date_Details
    ADD CONSTRAINT Class_Date_Details_Weekday_FK 
	FOREIGN KEY (WeekDay_ID)REFERENCES Weekday (Weekday_ID)
	ON DELETE CASCADE
	ON UPDATE CASCADE;

CREATE TABLE Teachers
    (
     Teacher_Id INTEGER NOT NULL PRIMARY KEY  IDENTITY(1,1),
     Name NVARCHAR (50) NOT NULL ,
     Surname NVARCHAR (50) NOT NULL ,
     PhoneNumber INTEGER NOT NULL ,
     Gender NVARCHAR (20) NOT NULL,
	 AccountID INTEGER NOT NULL UNIQUE,
	 CONSTRAINT TeachersFK FOREIGN KEY (AccountID) REFERENCES Account(ID_Account) 
    )
GO


CREATE TABLE Class
    (
     Class_ID INTEGER NOT NULL PRIMARY KEY IDENTITY (1,1),
     Start_Date DATE NOT NULL ,
     End_Date DATE NOT NULL ,
     Teacher_ID INTEGER NOT NULL ,
     Class_Name NVARCHAR (50) NOT NULL ,
     Course_ID INTEGER NOT NULL
    )
GO

ALTER TABLE Class
    ADD CONSTRAINT Class_Teachers_FK 
	FOREIGN KEY (Teacher_ID)REFERENCES Teachers(Teacher_Id)
    ON DELETE CASCADE
	ON UPDATE CASCADE
GO
CREATE TABLE Exams
    (
     Exam_ID INTEGER NOT NULL PRIMARY KEY IDENTITY (1,1) ,
     Classroom_ID INTEGER NOT NULL ,
     Data_Of_Test DATE NOT NULL ,
     Description NVARCHAR (300) NOT NULL ,
     Teacher_ID INTEGER NOT NULL
    )
GO

ALTER TABLE Exams
    ADD CONSTRAINT Exams_Class_FK 
	FOREIGN KEY ( Classroom_ID )REFERENCES Class (Class_ID)
    ON DELETE CASCADE
	ON UPDATE CASCADE
GO

CREATE TABLE Exams_Result
    (
     Mark_ID INTEGER NOT NULL PRIMARY KEY IDENTITY (1,1),
     Exam_ID INTEGER NOT NULL ,
     Student_ID INTEGER NOT NULL ,
     Cours_ID INTEGER NOT NULL ,
     Teacher_ID INTEGER NOT NULL ,
     Mark INTEGER NOT NULL ,
     Date DATE NOT NULL
    )
GO

ALTER TABLE Exams_Result
    ADD
    CHECK ( Mark BETWEEN 1 AND 6 )
GO

ALTER TABLE Exams_Result
    ADD CONSTRAINT Exams_Result_Exams_FK 
	FOREIGN KEY ( Exam_ID )REFERENCES Exams (Exam_ID)
    ON DELETE CASCADE
	ON UPDATE CASCADE
GO

ALTER TABLE Exams_Result
    ADD CONSTRAINT Exams_Result_Teachers_FK 
	FOREIGN KEY(Teacher_ID)REFERENCES Teachers(Teacher_Id)
GO

CREATE TABLE 
Type_Of_Course ( 
	Type_ID INTEGER NOT NULL PRIMARY KEY IDENTITY (1,1),
	Name VARCHAR (50) NOT NULL 
)
GO

CREATE TABLE Language
    (
     Language_ID INTEGER NOT NULL PRIMARY KEY IDENTITY (1,1),
     Name VARCHAR (50) NOT NULL
    )
GO

CREATE TABLE Course
    (
     Course_ID INTEGER NOT NULL PRIMARY KEY IDENTITY (1,1),
     Hours INTEGER NOT NULL ,
     Description VARCHAR (300) ,
     Term VARCHAR (20) NOT NULL ,
     Language_ID INTEGER NOT NULL ,
     Type_Of_Course INTEGER NOT NULL ,
     ECTS_Points INTEGER NOT NULL
    )
GO
ALTER TABLE Course
    ADD CONSTRAINT Course_Language_FK FOREIGN KEY
    (
     Language_ID
    )
    REFERENCES Language
    (
     Language_ID
    )
    ON DELETE CASCADE
	ON UPDATE CASCADE
GO

ALTER TABLE Course
    ADD CONSTRAINT Course_Type_of_course_FK FOREIGN KEY
    (
     Type_Of_Course
    )
    REFERENCES Type_Of_Course
    (
     Type_ID
    )
    ON DELETE CASCADE
	ON UPDATE CASCADE
GO


ALTER TABLE Class
    ADD CONSTRAINT Class_Course_FK 
	FOREIGN KEY(Course_ID)REFERENCES Course(Course_ID)
    ON DELETE CASCADE
	ON UPDATE CASCADE
GO

ALTER TABLE Classroom_Student
    ADD CONSTRAINT Classroom_Student_Class_FK 
	FOREIGN KEY (Class_ID)REFERENCES Class(Class_ID)
    ON DELETE CASCADE
	ON UPDATE CASCADE
GO


ALTER TABLE Course
ADD CONSTRAINT liczbaECTS CHECK(ECTS_Points > 0) 

ALTER TABLE Course
ADD CONSTRAINT liczbaGodzin CHECK(Hours > 0) 

ALTER TABLE Books
ADD CONSTRAINT liczbaStron CHECK (Pages_Number > 0)

ALTER TABLE Books
ADD CONSTRAINT ROK CHECK (ReleaseYear < YEAR(GETDATE()) )

ALTER TABLE Students 
ADD CONSTRAINT dataUro CHECK( YEAR(DateBirth) < (YEAR(GETDATE())) )

ALTER TABLE Teachers
ADD CONSTRAINT phone CHECK( PhoneNumber > 100000000 AND LEN(PhoneNumber) = 9 )

ALTER TABLE Parent 
ADD CONSTRAINT phone2 CHECK( PhoneNumber > 100000000 AND LEN(PhoneNumber) = 9 )

ALTER TABLE Account
ADD CONSTRAINT pass CHECK ( LEN(Passwordd) > 8)


