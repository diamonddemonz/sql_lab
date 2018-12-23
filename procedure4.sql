DROP proc SubjectL
GO

create proc SubjectL
@subL varchar(50)
as

select name from Groups g 
join(select group_id from Students s 
join(select student_id from Marks m 
join(select iid from Subject sub where sub.name = @subL) c ON m.subject_id = c.iid group by student_id)
 b  ON s.iid = b.student_id)
 a  ON g.iid = a.group_id group by name




