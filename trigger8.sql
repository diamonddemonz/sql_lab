IF OBJECT_ID('tr7') IS NOT NULL
DROP TRIGGER tr7
GO

create trigger tr7
   on  Marks
   after delete
as 
begin
		delete from Students where iid = 1
end
go

delete from Marks where student_id = 1 /*name and family and parentname*/

select * from Students
select * from Marks;