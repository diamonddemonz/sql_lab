IF OBJECT_ID('tr2') IS NOT NULL
DROP TRIGGER tr2
GO

create trigger tr2
   on  Marks
   for insert
as 
begin
 declare @ivalue int
 SELECT @ivalue = m.value
 from Marks m, inserted i
 if @ivalue > 5 or @ivalue < 2
begin
  rollback tran
  print('Value имеет инервал [2..5]')
end
end
go

INSERT INTO Marks(iid, student_id, subject_id, value,teach_id)
VALUES(54, 5, 2, 1,5)

select * from Marks;