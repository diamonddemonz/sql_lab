IF OBJECT_ID('tr9') IS NOT NULL
DROP TRIGGER tr9
GO

create trigger tr9
   on  Subject
    instead of delete
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

delete from Subject where name = 'и' /*name and family and parentname*/

select * from Subject;
select * from Marks;