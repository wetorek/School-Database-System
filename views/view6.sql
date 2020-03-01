-- widok pokacuje wszyskie jêzyki w których s¹ prowadzone zajêcia w których dany student uczestniczy

CREATE VIEW LanguageNumber AS
SELECT P1.StudentId, P1.Name, P1.Surname, 
ISNULL (P2.Name, 'Nie uczestniczy w ¿adnym kursie')  [ró¿ne jêzyki kursów w których uczestniczy student]
FROM Students AS P1 
LEFT JOIN 
(
SELECT A.StudentId, B.Name 
FROM Students A, Language B
WHERE EXISTS (
SELECT C.Student_Id, L.Name FROM Classroom_Student AS C
JOIN Class ON C.Class_ID = Class.Class_Id
JOIN Course ON Course.Course_ID = Class.Course_ID
JOIN Language L ON Course.Language_ID = L.Language_ID
WHERE C.Student_ID = A.StudentId AND L.Name = B.Name)
) AS P2 ON P1.StudentId = P2.StudentId

SELECT * FROM LanguageNumber
