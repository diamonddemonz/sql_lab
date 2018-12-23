IF OBJECT_ID('tr4') IS NOT NULL
DROP TRIGGER tr4
GO

create trigger tr4
   on  Subject   
   after update
as 
begin
if exists (
		select * from Marks m join (select iid from deleted where name = 'и') a ON m.subject_id = a.iid
		where exists(select iid from Marks where m.iid = iid)
       )
	begin 
	rollback tran
	print('»ммеет ссылку')
	end
end;
go

update Subject
set name = 'иии' where name = 'и'

select * from Subject;
select * from Marks;