
create view Type2
as select * from Students where type like 'S' and
 group_id = (select iid from Groups where name LIKE '%_2004')