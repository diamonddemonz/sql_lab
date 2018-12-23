
create view Type3
as select * from Students as m where exists (select * from Marks where value is not NULL and m.iid = student_id  
				and teach_id = (select iid from Students where name like 'Егор' and family like 'Горный'));
