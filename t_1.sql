--1．列出所有不属于必修课程但有学生选修的课程号，课程名。
select cno,cname
       from Courses
	   where cno in
	         (select distinct cno from Scores) 
			 and  ismust='F'

--2.	将所有学号当中没有“1”这个数字的同学信息列出来
select*from students where StuId not like '%1%'

--3.查询出生日期在89年1月1日至89年3月1日的学生的名单。
select * from Students where (StuDate+0)>19890101 and (StuDate+0)<19890301

--4．列出所有学生选修的课程号，去掉重复值
select distinct cno from Scores

--5.查询选修了“程序设计基础”课而且选修课程数大于4 门的所有学生的学号、姓名与专业
select StuId, StuName,
       (select DeptName from DeptInfo where DeptId = Students.DeptId) as professional 
	       from Students 
		       where 
			     (select cno from Courses where Courses.cname='程序设计基础') 
				     in (select cno from Scores where stuid=Students.StuId) 
					 and (select COUNT(cno) from Scores where stuid=Students.StuId)>4

--6. 将所有选课人数多于40人的课程名与学分、学时列出来
select cname,gpa,ctime from Courses where (select COUNT(stuid) from Scores where cno=Courses.cno)>40

--7.查询入学成绩高出平均成绩10分的学生信息。
select *  from Students where StuGrade-(select AVG(StuGrade) from Students )>10

--8．求出所有课程的最低分高于60的学生的学号，姓名及选修课程数与总成绩
select StuId,StuName,
     (select Count(1) from Scores where stuid=Students.StuId) as CoursesCount,
	 (select sum(StuGrade) from Scores where stuid=Students.StuId) as SumScores 
	       from Students 
		       where 
			      (select min(StuGrade) from Scores where stuid=Students.StuId )>60

--9. 列出成绩为满分的学生的学号和课号及专业
select  Students.StuId,Scores.cno,
     (select DeptName from DeptInfo where DeptId=Students.DeptId) as DeptName 
	      from Students INNER JOIN Scores 
		      on Students.StuId=scores.stuid and Scores.stugrade=100;

--10.	查询选修了“软件基础”课的学生学号，姓名。
select StuId,StuName from Students 
    where (select cno from Courses where cname='软件基础') 
	    in (select cno from scores where stuid= Students.StuId)

--11．查询其中有一门课成绩大于 80 分的学生学号、姓名与专业。
select StuId,StuName,
  (select DeptName from DeptInfo where DeptId=Students.DeptId) as professional 
      from Students where (select max(stugrade) 
	     from Scores where stuid =Students.StuId)>80

--12.	查询选修了“数据库概论”课而且成绩大于 70 分的学生学号，姓名与专业。
select StuId,StuName,
    (select DeptName from DeptInfo where DeptId=Students.DeptId) as professional 
	   from Students 
	       where (select stugrade from Scores where cno=(select cno from Courses where cname='数据库概论') 
		      and Scores.stuid =Students.StuId)>70;

--13.	查询姓“田”的同学的信息，要求不能使用like。
select * from Students where left(StuName,1)='田'

--14.查询没有选修“程序设计基础”课的学生学号，姓名与专业
select StuId,StuName,
    (select DeptName from DeptInfo where DeptId=Students.DeptId) as professional from Students 
	     where (select cno from Courses where  cname='程序设计基础') 
		    not in (select cno from Scores where stuid=students.StuId)

