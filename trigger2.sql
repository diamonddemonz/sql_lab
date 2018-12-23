IF OBJECT_ID('tr2') IS NOT NULL
DROP TRIGGER tr2
GO

create trigger tr2
   on  Groups   
   for insert
as 
begin
if 1 < (
		select count(g.name)
        from Groups g, inserted i
        where g.name=i.name
       )
	begin
		rollback tran
		print('Группа с таким названием уже есть!')
	end
end;
go

insert into Groups(iid, name)
values(8,'1020/2_2005');

select * from Groups;