-- funkcja zwraca dane uczniów zapisanych na kurs o danym identyfikatorze przekazywanym parametrem

CREATE FUNCTION ListOFStudents (@CourseID INT)
RETURNS TABLE
AS
RETURN 
(
SELECT StudentId, Name, Surname FROM dbo.Course
LEFT JOIN Class ON Class.Course_ID = Course.Course_ID
LEFT JOIN dbo.Classroom_Student ON Classroom_Student.Class_ID = Class.Class_ID
LEFT JOIN dbo.Students ON Students.StudentId = Classroom_Student.Student_ID
WHERE @CourseID = Course.Course_ID AND Name IS NOT NULL
)
GO
SELECT * FROM dbo.ListOFStudents(2)
GO