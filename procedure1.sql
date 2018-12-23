create proc GroupBBB as
select name, group_id, avge from Groups g
join (select group_id, avg(cast(value as Float)) as avge from Students 
			inner join (select value,student_id from Marks) m ON m.student_id = Students.iid
group by group_id) a ON g.iid = a.group_id where avge > 3.4
			
			 