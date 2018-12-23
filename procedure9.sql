drop proc uselesss
go

create proc uselesss
@tname varchar(50),
@tfamily varchar(50),
@tparenname varchar(50),
@useless varchar(50) output
 as

 select top(1) @useless = name from Groups g
 join (select group_id, avg(cast(value as Float)) as avge from Students s /*группируем по группам*/
		join (select m.iid,student_id,value from Marks m /*Все оценки, которые проставил преподаватель*/
		join (select iid from Students where name = @tname and family = @tfamily and parentname = @tparenname ) b ON b.iid = m.teach_id) m ON m.student_id = s.iid group by group_id) 
		a ON g.iid = a.group_id order by avge;
		go

declare @useless1 varchar(50)
exec uselesss @tname = 'Егор',@tfamily = 'Горный',@tparenname = 'Сергеевич', @useless = @useless1 OUT
select @useless1 as groupless;

select name,avge from Groups g
 join (select group_id, avg(cast(value as Float)) as avge from Students s /*группируем по группам*/
		join (select m.iid,student_id,value from Marks m /*Все оценки, которые проставил преподаватель*/
		join (select iid from Students where name = 'Егор' and family = 'Горный' and parentname = 'Сергеевич' ) b ON b.iid = m.teach_id) m ON m.student_id = s.iid group by group_id) 
		a ON g.iid = a.group_id order by avge;