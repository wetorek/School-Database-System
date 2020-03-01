--wyswietla ilosc nieusprawiedliwionych nieobecnosci jezeli isnieja

CREATE PROCEDURE getWithoutSickNote (@StudentID INT, @ilosc INT OUTPUT)
AS
SELECT @ilosc = COUNT (*) 
FROM dbo.Absences
Where Status = 'F' AND Student_ID = @StudentID
GROUP BY Student_ID
