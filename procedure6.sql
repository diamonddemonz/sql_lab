DROP proc SUMM
GO

create proc SUMM
@sub1 varchar(50),
@sub2 varchar(50)
as

select * from Students s
join(select AVG(CAST(value as float)) as avge, c.name from Marks m
join (select sub.name,iid from Subject sub where name = @sub1 or name = @sub2)  c ON m.subject_id = c.iid
join (select iid from Students group by group_id)								d ON m.student_id = d.iid
																		group by m.student_id) b ON s.group_id = b.name

/*select g.name from Group g
join(select group_id,s.name from Students s
join(select top(1) AVG(CAST(value as float)) as avge, c.name from Marks m
join (select sub.name,iid from Subject sub where name = @sub1 or name = @sub2)  c ON m.subject_id = c.iid
join (select group_id from Students group by group_id)					d ON m.student_id = d.group_id 
																		group by m.student_id order by avge desc)
 b ON s.group_id = b.name ) a ON g.name = a.name*/


/*
select family, name, parentname,a.ave from Students s 
join (select AVG(CAST(value as float)) as ave, student_id from Marks m group by student_id) a ON s.iid = a.student_id
where a.ave > @avge;
Go
exec SUMM @avge = 3 */






