IF OBJECT_ID('tr6') IS NOT NULL
DROP TRIGGER tr6
GO

create trigger tr6
   on  Marks 
   after update
as 
begin

if exists (		
		select * from deleted m join (select iid from Students where iid = 8/* (select iid from Students where iid = 8/*name ='' and family = '' and parentname = ''*/)*/) a ON m.teach_id =a.iid
		where student_id = 1 and subject_id = 1 and exists(select* from deleted where m.iid = iid and value = m.value)
       )
	begin 
	rollback tran
	print('Иммеет студента с оценкой')
	end
end;
go

update Marks
set teach_id  = 5 /* (select iid from Students where iid = 8/*name ='' and family = '' and parentname = ''*/)*/ where student_id = 1 and subject_id = 1

select * from Students
select * from Marks;