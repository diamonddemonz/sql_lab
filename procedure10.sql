drop proc less
go

create proc less
@lgroup varchar(50),
@lsubject varchar(50) output,
@lavge float output
 as

 select @lsubject = sub.name from Subject sub 
	join(select value,student_id from Marks m 
		join(select group_id,s.iid from Students s 
			join(select iid from Groups where name = @lgroup) c ON s.group_id = c.iid) b ON m.student_id = b.iid group by subject_id) a 
			;

declare @useless1 varchar(50)
exec uselesss @tname = '����',@tfamily = '������',@tparenname = '���������', @useless = @useless1 OUT
select @useless1 as groupless;
select @useless1 as groupless;

select min(avg(cast(value as Float))) as avge from Marks m  /****************������, ��� ������� ����������� �������� ���� �� ���? �� ����� ����� ���********************/
		join(select group_id,s.iid from Students s 
			join(select iid from Groups where name = '1084/1_2004') c ON s.group_id = c.iid) b ON m.student_id = b.iid group by subject_id order by;

			select group_id,s.iid from Students s 
			join(select iid from Groups where name = '1084/1_2004') c ON s.group_id = c.iid;

			select* from Marks m 
		join(select group_id,s.iid from Students s 
			join(select iid from Groups where name = '1084/1_2004') c ON s.group_id = c.iid) b ON m.student_id = b.iid

			select *from Marks;
 /*
 select top(1) @useless = name from Groups g
 join (select group_id, avg(cast(value as Float)) as avge from Students s /*���������� �� �������*/
		join (select m.iid,student_id,value from Marks m /*��� ������, ������� ��������� �������������*/
		join (select iid from Students where name = @tname and family = @tfamily and parentname = @tparenname ) b ON b.iid = m.teach_id) m ON m.student_id = s.iid group by group_id) 
		a ON g.iid = a.group_id order by avge;
		go

declare @useless1 varchar(50)
exec uselesss @tname = '����',@tfamily = '������',@tparenname = '���������', @useless = @useless1 OUT
select @useless1 as groupless;

select name,avge from Groups g
 join (select group_id, avg(cast(value as Float)) as avge from Students s /*���������� �� �������*/
		join (select m.iid,student_id,value from Marks m /*��� ������, ������� ��������� �������������*/
		join (select iid from Students where name = '����' and family = '������' and parentname = '���������' ) b ON b.iid = m.teach_id) m ON m.student_id = s.iid group by group_id) 
		a ON g.iid = a.group_id order by avge;*/