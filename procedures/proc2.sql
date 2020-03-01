-- procedura wyœwietla dane nauczyciela- lub nauczycieli, którego klasa ma najwiecej nieobecnosci, u¿ywa zagnie¿d¿onych procedur przechowywanych

CREATE PROCEDURE DisplayMax
AS
DECLARE @cur INT
EXEC maxAbsences @cur OUTPUT
SELECT T2.Class_Name, Name, Surname FROM 
(
SELECT Class.Class_ID FROM dbo.Absences
JOIN dbo.Classroom_Student ON Classroom_Student.Classroom_ID = Absences.Classroom_Student_ID
JOIN dbo.Class ON Class.Class_ID = Classroom_Student.Class_ID
GROUP BY Class.Class_ID
HAVING COUNT (*) =  (@cur)) AS T1 
JOIN dbo.Class AS T2 ON T2.Class_ID = T1.Class_ID
JOIN dbo.Teachers ON T2.Teacher_ID = Teachers.Teacher_Id
