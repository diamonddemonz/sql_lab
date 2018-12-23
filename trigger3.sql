IF OBJECT_ID('tr3') IS NOT NULL
DROP TRIGGER tr3
GO

create trigger tr3
   on  Students   
   for insert
as 
begin
if 0 = (
		select (case when s.type = 'P' or s.type = 'S'
		then 1
		else 0
		end) as bit
        from Students s, inserted i where s.iid = i.iid
       )
	begin
		rollback tran
		print('Тип отличается от P и S')
	end
end;
go

insert into Students(iid,type)
values(17,'P');

select * from Students;