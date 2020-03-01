-- widok pokazuje liczbe godzin pracy dla wszystkich nauczycieli

CREATE VIEW WorkingHours AS
SELECT P2.Teacher_Id, P2.Name, P2.Surname, ISNULL(P1.[Hours Sum],0) AS [Liczba godzin]
FROM (SELECT Teachers.Teacher_Id, SUM(Hours) AS [Hours Sum]
FROM Teachers
LEFT JOIN Class ON Teachers.Teacher_Id = Class.Teacher_ID
JOIN Course ON Course.Course_ID = Class.Course_ID 
GROUP BY Teachers.Teacher_Id ) AS P1
RIGHT JOIN Teachers P2 ON P1.Teacher_ID = P2. Teacher_ID

--SELECT * FROM WorkingHours