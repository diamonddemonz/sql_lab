SELECT * FROM Student;
SELECT * FROM Subject;
Select s.family,s.name,s.parentname,sub.name from Student s cross join Subject sub;