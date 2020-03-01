-- procedura oblicza maksymalny wynik z egzaminu o danym identyfikatorze, zwraca go w @output

CREATE PROCEDURE getHighestMark 
(@examID INT, @output INT OUTPUT)
AS
SELECT @output = MAX(Mark) 
FROM dbo.Exams_Result WHERE
Exam_ID = @examID


--test
/* 
DECLARE @temp INT;
EXEC getHighestMark 2, @temp OUTPUT;
SELECT @temp;
SELECT * FROM dbo.Exams_Result WHERE Exam_ID = 2
*/