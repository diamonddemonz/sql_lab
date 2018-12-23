drop proc maxavg
go

create proc maxavg
@subs varchar(50),
@maxg float output
 as

select top(1) @maxg = avge from Groups g
join (select group_id, avg(cast(value as Float)) as avge from Students 
			inner join (select value, student_id,subject_id from Marks m 
										join(select name,iid from Subject where name = @subs) sub ON m.subject_id = sub.iid
						) m ON m.student_id = Students.iid group by group_id,m.subject_id 
		) a ON g.iid = a.group_id order by avge desc
;
go

declare @maxg1 float
exec maxavg @subs = 'Информатика', @maxg = @maxg1 OUT
select @maxg1
