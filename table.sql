create table DeptInfo
(
   DeptId varchar(255),
   DeptName varchar(255),
)

create table Students
(
   DeptId varchar(255),
   StuId varchar(255),
   StuName varchar(255),
   StuSex varchar(255),
   StuHome varchar(255),
   StuDate varchar(255),
   StuGrade numeric(10,1),
   IsParty varchar(1),
)

create table Scores
(
   stuid varchar(255),
   cno varchar(255),
   stugrade numeric(10,1),
)

create table Courses
(
   cno varchar(255),
   cname varchar(255),
   gpa  int,
   ctime int,
   ismust varchar(1),
)