create view TypeP
as select * from Students where type like 'P';

create view TypeS
as select * from Students where type like 'S' and select * from Group where name