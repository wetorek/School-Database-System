--Widok przedstawia liczbê klas, w ilu s¹ prowadzone zajêcia w danym jêzyku

CREATE VIEW ClassNumber AS
SELECT P1.*, ISNULL (P2.Klasy,0) [Iloœæ klas w danym jêzyku] 
FROM Language P1 
LEFT JOIN (
SELECT L.Language_ID, Count (DISTINCT Class_ID) AS Klasy FROM Language L 
LEFT JOIN Course ON L.Language_Id = Course.Language_ID
LEFT JOIN Class ON Class.Course_ID = Course.Course_ID
WHERE Course.Course_ID IS NOT NULL AND Class.Class_ID IS NOT NULL
GROUP BY L.Language_ID ) AS P2
ON P1.Language_ID = P2.Language_ID

--SELECT * FROM ClassNumber;