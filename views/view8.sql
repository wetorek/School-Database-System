--widok wyœwietla topowe trzy kursy, które ciesz¹ siê najwiêksz¹ popularnoœci¹

CREATE VIEW MostPopularCourses AS
SELECT TOP (3) P2.*, P1.Participants FROM (
SELECT Class.Class_ID, Count (DISTINCT Cs.Classroom_ID) AS Participants FROM Class
LEFT JOIN dbo.Classroom_Student AS CS 
ON CS.Class_ID = Class.Class_ID
GROUP BY Class.Class_ID
) AS P1 JOIN Class AS P2 ON P1.Class_ID = P2.Class_ID

--Select * from MostPopularCourses