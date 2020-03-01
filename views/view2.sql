-- widok wyœwietla studentów którzy nie oddali swoich ksi¹¿ek

CREATE VIEW NieoddaneKsiazki AS
SELECT P1.StudentId, Name, Surname, P1.[Nieoddane ksi¹¿ki] FROM 
(SELECT Students.StudentId,COUNT(*) AS [Nieoddane ksi¹¿ki] FROM Students 
LEFT JOIN Borrows ON Students.StudentID = Borrows.Student_ID
WHERE Return_Date IS NULL AND Borrow_ID IS NOT NULL
GROUP BY Students.StudentId ) AS P1
JOIN Students AS P2 ON P1.StudentId = P2.StudentId

--SELECT * FROM NieoddaneKsiazki