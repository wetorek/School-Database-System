-- widok pokazuje liczb� kurs�w na kt�re jest zapisany dany student
CREATE VIEW Kursy AS
SELECT P2.StudentID, P2.Name, P2. Surname, ISNULL(P1.[Liczba Kurs�w], 0) AS [Liczba Kurs�w] FROM (
SELECT Student_ID, Count (*) AS [Liczba Kurs�w] FROM Classroom_Student
GROUP BY Student_ID )
AS P1 RIGHT JOIN Students AS P2 ON P1.Student_ID = P2.StudentID

--SELECT * FROM Kursy