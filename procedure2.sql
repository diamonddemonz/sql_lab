DROP proc MAX_S
GO

create proc MAX_S as
select s.iid, family, g.name, m.avge from Students s  
left outer join (select iid,name from Groups) g ON s.group_id = g.iid 
join (select top(4) student_id, avg(cast(value as Float)) as avge from Marks group by student_id order by avge desc) m ON s.iid = m.student_id 
