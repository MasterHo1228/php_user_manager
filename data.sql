CREATE DATABASE IF NOT EXISTS dbUserManager CHARACTER SET utf8mb4;
USE dbUserManager;

CREATE TABLE IF NOT EXISTS Class(
    ID INT UNSIGNED PRIMARY KEY NOT NULL AUTO_INCREMENT,
    Grade YEAR NOT NULL ,
    Name VARCHAR(30) NOT NULL ,
    Sum_students INT UNSIGNED NOT NULL ,
    Max_students INT UNSIGNED NOT NULL
);

CREATE TABLE IF NOT EXISTS Student(
    ID BIGINT UNSIGNED PRIMARY KEY NOT NULL AUTO_INCREMENT,
    Name VARCHAR(15) NOT NULL ,
    Gender ENUM('male','female'),
    Age TINYINT UNSIGNED ,
    DateOfBirth DATE,
    BirthPlace VARCHAR(15),
    Nationality VARCHAR(20),
    Class_ID INT UNSIGNED NOT NULL ,
    Home_addr VARCHAR(50) ,
    Politic VARCHAR(10) ,
    ID_Number VARCHAR(18) ,
    Job VARCHAR(15) ,
    Major VARCHAR(15),
    CONSTRAINT FK_ClassID FOREIGN KEY (Class_ID) REFERENCES Class(ID) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS Course(
    ID INT UNSIGNED PRIMARY KEY NOT NULL AUTO_INCREMENT,
    Name VARCHAR(35) NOT NULL ,
    Credit DECIMAL(2,1) UNSIGNED NOT NULL
);

CREATE TABLE IF NOT EXISTS Student_score(
    Course_ID INT UNSIGNED NOT NULL ,
    Student_ID BIGINT UNSIGNED NOT NULL ,
    Score TINYINT UNSIGNED NOT NULL ,
    Semester TINYINT(1) UNSIGNED NOT NULL ,
    School_year YEAR NOT NULL,
    CONSTRAINT FK_CourseID FOREIGN KEY (Course_ID) REFERENCES Course(ID),
    CONSTRAINT FK_StudentID FOREIGN KEY (Student_ID) REFERENCES Student(ID)
);

CREATE TABLE IF NOT EXISTS AdminUser(
    ID INT UNSIGNED PRIMARY KEY NOT NULL AUTO_INCREMENT,
    Name VARCHAR(25) NOT NULL UNIQUE ,
    Password VARCHAR(32) NOT NULL ,
    salt CHAR(4) NOT NULL ,
    User_role VARCHAR(10) NOT NULL
);

INSERT INTO AdminUser SET Name='admin',Password=MD5('123456msho'),salt='msho',User_role='God';
INSERT INTO AdminUser SET Name='Demo1',Password=MD5('123456demo'),salt='demo',User_role='Admin';

CREATE TABLE IF NOT EXISTS AdminUserLoginLog(
    AdminID int UNSIGNED NOT NULL ,
    LastLoginTime DATETIME NOT NULL ,
    LastLoginIP VARCHAR(35) NOT NULL ,
    CONSTRAINT FK_AdminID FOREIGN KEY (AdminID) REFERENCES AdminUser(ID)
);

CREATE VIEW viewStudentInfos AS
  SELECT
    a.ID,
    a.Name AS 'StudentName',
    a.Gender,
    a.Age,
    a.DateOfBirth,
    a.BirthPlace,
    a.Nationality,
    b.Name AS 'ClassName',
    a.Home_addr,
    a.Politic,
    a.ID_Number,
    a.Job,
    a.Major
  FROM Student a,Class b
  WHERE a.Class_ID=b.ID;

CREATE VIEW viewStudentScore AS
  SELECT
    a.ID AS 'Student_ID',
    a.StudentName,
    a.ClassName,
    c.Name AS 'CourseName',
    b.Score,
    b.School_year,
    b.Semester
  FROM viewStudentInfos a,
    Student_score b,
    Course c
  WHERE
    b.Student_ID=a.ID
  AND
    b.Course_ID = c.ID;
