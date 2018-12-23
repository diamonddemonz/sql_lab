DROP proc Sub
GO

create proc Sub as
select name, avge from Subject sub 
		join (select avg(cast(value as Float)) as avge,subject_id from Marks m
					join (select s.iid from Students s
								join (select substring(name, 6, 5) as year,iid from Groups g where substring(name, 6, 5) like '%_2004%') a ON s.group_id = a.iid)
								 b ON m.student_id = b.iid	group by subject_id) m ON sub.iid = m.subject_id


