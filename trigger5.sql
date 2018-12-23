IF OBJECT_ID('tr5') IS NOT NULL
DROP TRIGGER tr5
GO

create trigger tr5
   on  Groups   
   after update
as 
begin
if exists (		
		select * from Marks m join (select s.iid from Students s join(select iid from deleted where name = ' Иммеет студента с оценкой') b ON s.group_id = b.iid) a ON m.student_id = a.iid
		where exists(select iid from Marks where m.iid = iid and m.value = value) 
       )
	begin 
	rollback tran
	print('Иммеет студента с оценкой')
	end
end;
go

update Groups
set name = 'Иммеет студента с оценкой' where name = ' Иммеет студента с оценкой'

select * from Groups
select * from Marks;