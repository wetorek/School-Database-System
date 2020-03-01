--usprawiedliwia nieobecnosc ucznia w danym dniu

CREATE PROCEDURE usprawiedliwienie 
(@date DATE, @classroom INT, @studentId int)
AS
UPDATE dbo.Absences
SET Status = 'T'
WHERE Date = @date AND Student_ID= @studentId AND Classroom_Student_ID = @classroom