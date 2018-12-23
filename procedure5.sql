DROP proc SUMM
GO

create proc SUMM
@avge float
as

select family, name, parentname,a.ave from Students s 
join (select AVG(CAST(value as float)) as ave, student_id from Marks m group by student_id) a ON s.iid = a.student_id
where a.ave > @avge;
Go
exec SUMM @avge = 3 






