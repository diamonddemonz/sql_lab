SELECT * FROM Marks;
SELECT * FROM Subject;
SELECT AVG(vakue) from Marks where subject_id = (select id from Subject where name = 'Biologi');

