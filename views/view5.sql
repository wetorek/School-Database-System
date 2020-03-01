-- widok pokazuje informacje o studencie oraz liczbê godzin jego zajêæ

CREATE VIEW StudentHours AS
SELECT P1.*, ISNULL(P2.[Liczba godzin],0) AS [Liczba godzin studenta] 
FROM Students AS P1
LEFT JOIN
(
SELECT C.Student_ID AS [Identyfikator], SUM(Hours) AS [Liczba godzin] 
FROM Classroom_Student C JOIN CLASS ON Class.Class_ID = C.Class_Id
JOIN Course Co ON co.Course_Id = Class.Course_ID
GROUP BY C.Student_ID 
) AS P2 ON P1.StudentId = P2.Identyfikator

SELECT * FROM StudentHours
