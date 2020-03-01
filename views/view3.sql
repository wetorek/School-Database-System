-- widok pokazuje liczbê kursów na które jest zapisany dany student
CREATE VIEW Kursy AS
SELECT P2.StudentID, P2.Name, P2. Surname, ISNULL(P1.[Liczba Kursów], 0) AS [Liczba Kursów] FROM (
SELECT Student_ID, Count (*) AS [Liczba Kursów] FROM Classroom_Student
GROUP BY Student_ID )
AS P1 RIGHT JOIN Students AS P2 ON P1.Student_ID = P2.StudentID

--SELECT * FROM Kursy