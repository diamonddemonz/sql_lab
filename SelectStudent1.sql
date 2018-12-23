SELECT * FROM Student;
SELECT * FROM Groups;
SELECT * from Student where group_id = (select id from Groups where name = '3084/1_2004');

