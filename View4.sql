
create view Type4444
as select s.name, family, parentname, sub.name as names from Students as s cross join Subject sub ON s.iid = sub.iid
 where type like 'P' 
  /*and O = (select avg(value) from Marks where subject_id = sub.iid 
											and teach.id = (select iid from Students where type like 'P'));*/


 /* Students as m where exists (select * from Marks where value is not NULL and m.iid = student_id  
				and teach_id = (select iid from Students where name like 'Егор' and family like 'Горный')); */
