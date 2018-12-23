create view Typey

as select s.name, family, parentname, sub.name as names, value as numer from Students as s 
																cross join Subject sub 
																	join Marks m ON sub.iid = m.iid
 where type like 'P'and value = (select avg(value) from Marks where subject_id = sub.iid and
  teach_id = 5)
				