IF OBJECT_ID('Marks', 'U') IS NOT NULL
DROP TABLE Marks
GO
IF OBJECT_ID('Subject', 'U') IS NOT NULL
DROP TABLE Subject
GO
IF OBJECT_ID('Students', 'U') IS  NOT NULL
DROP TABLE Students
GO
IF OBJECT_ID('Groups', 'U') IS    NOT NULL
DROP TABLE Groups
GO

CREATE TABLE Groups
(
   iid             INT            NOT NULL   PRIMARY KEY,
   name	          [VARCHAR](50)  
);
GO



CREATE TABLE Students
(
   iid             INT            NOT NULL   PRIMARY KEY,
   family	      [VARCHAR](50)  ,  
   name           [VARCHAR](50)  ,
   parentname     [VARCHAR](50)  ,
   group_id       INT			 ,
   type			  [char]		 DEFAULT 'S',

   FOREIGN KEY (group_id) REFERENCES Groups (iid)
);
GO



CREATE TABLE Subject
(
   iid             INT            NOT NULL   PRIMARY KEY,
   name	          [VARCHAR](50)  
);
GO



CREATE TABLE Marks
(
   iid             INT  NOT NULL   PRIMARY KEY,
   student_id	   INT  ,
   subject_id	   INT  ,
   value		   INT  ,
   teach_id	       INT  ,
   FOREIGN KEY (subject_id) REFERENCES Subject  (iid),
   FOREIGN KEY (student_id) REFERENCES Students (iid),
   FOREIGN KEY (teach_id)   REFERENCES Students (iid)
);
GO

