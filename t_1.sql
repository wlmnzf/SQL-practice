--1���г����в����ڱ��޿γ̵���ѧ��ѡ�޵Ŀγ̺ţ��γ�����
select cno,cname
       from Courses
	   where cno in
	         (select distinct cno from Scores) 
			 and  ismust='F'

--2.	������ѧ�ŵ���û�С�1��������ֵ�ͬѧ��Ϣ�г���
select*from students where StuId not like '%1%'

--3.��ѯ����������89��1��1����89��3��1�յ�ѧ����������
select * from Students where (StuDate+0)>19890101 and (StuDate+0)<19890301

--4���г�����ѧ��ѡ�޵Ŀγ̺ţ�ȥ���ظ�ֵ
select distinct cno from Scores

--5.��ѯѡ���ˡ�������ƻ������ζ���ѡ�޿γ�������4 �ŵ�����ѧ����ѧ�š�������רҵ
select StuId, StuName,
       (select DeptName from DeptInfo where DeptId = Students.DeptId) as professional 
	       from Students 
		       where 
			     (select cno from Courses where Courses.cname='������ƻ���') 
				     in (select cno from Scores where stuid=Students.StuId) 
					 and (select COUNT(cno) from Scores where stuid=Students.StuId)>4

--6. ������ѡ����������40�˵Ŀγ�����ѧ�֡�ѧʱ�г���
select cname,gpa,ctime from Courses where (select COUNT(stuid) from Scores where cno=Courses.cno)>40

--7.��ѯ��ѧ�ɼ��߳�ƽ���ɼ�10�ֵ�ѧ����Ϣ��
select *  from Students where StuGrade-(select AVG(StuGrade) from Students )>10

--8��������пγ̵���ͷָ���60��ѧ����ѧ�ţ�������ѡ�޿γ������ܳɼ�
select StuId,StuName,
     (select Count(1) from Scores where stuid=Students.StuId) as CoursesCount,
	 (select sum(StuGrade) from Scores where stuid=Students.StuId) as SumScores 
	       from Students 
		       where 
			      (select min(StuGrade) from Scores where stuid=Students.StuId )>60

--9. �г��ɼ�Ϊ���ֵ�ѧ����ѧ�źͿκż�רҵ
select  Students.StuId,Scores.cno,
     (select DeptName from DeptInfo where DeptId=Students.DeptId) as DeptName 
	      from Students INNER JOIN Scores 
		      on Students.StuId=scores.stuid and Scores.stugrade=100;

--10.	��ѯѡ���ˡ������������ε�ѧ��ѧ�ţ�������
select StuId,StuName from Students 
    where (select cno from Courses where cname='��������') 
	    in (select cno from scores where stuid= Students.StuId)

--11����ѯ������һ�ſγɼ����� 80 �ֵ�ѧ��ѧ�š�������רҵ��
select StuId,StuName,
  (select DeptName from DeptInfo where DeptId=Students.DeptId) as professional 
      from Students where (select max(stugrade) 
	     from Scores where stuid =Students.StuId)>80

--12.	��ѯѡ���ˡ����ݿ���ۡ��ζ��ҳɼ����� 70 �ֵ�ѧ��ѧ�ţ�������רҵ��
select StuId,StuName,
    (select DeptName from DeptInfo where DeptId=Students.DeptId) as professional 
	   from Students 
	       where (select stugrade from Scores where cno=(select cno from Courses where cname='���ݿ����') 
		      and Scores.stuid =Students.StuId)>70;

--13.	��ѯ�ա����ͬѧ����Ϣ��Ҫ����ʹ��like��
select * from Students where left(StuName,1)='��'

--14.��ѯû��ѡ�ޡ�������ƻ������ε�ѧ��ѧ�ţ�������רҵ
select StuId,StuName,
    (select DeptName from DeptInfo where DeptId=Students.DeptId) as professional from Students 
	     where (select cno from Courses where  cname='������ƻ���') 
		    not in (select cno from Scores where stuid=students.StuId)
