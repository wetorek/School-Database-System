-- procedura zwraca w parametrze @temp ID klasy ktora ma najwiecej nieobecnosci

CREATE PROC maxAbsences (@temp INT OUTPUT)
AS
SELECT @temp = MAX(A.[Liczba nieobecnosci]) FROM 
(SELECT Count (*) AS [Liczba nieobecnosci]
FROM dbo.Absences
JOIN dbo.Classroom_Student ON Classroom_Student.Classroom_ID = Absences.Classroom_Student_ID
JOIN dbo.Class ON Class.Class_ID = Classroom_Student.Class_ID
GROUP BY Class.Class_ID
) AS A