drop proc interval
go

create proc interval
@inter1 int, /*min*/
@inter2 int  /*max*/
 as

select name, group_id, avge from Groups g
join (select group_id, avg(cast(value as Float)) as avge from Students 
			inner join (select value,student_id from Marks) m ON m.student_id = Students.iid
group by group_id) a ON g.iid = a.group_id where cast(SUBSTRING(name,8,4) as int) > @inter1 and cast(SUBSTRING(name,8,4) as int) < @inter2
;		
go	
exec interval @inter1 = 2003, @inter2 = 2006
