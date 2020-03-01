-- Funkcja zwraca tablê, która jest podzia³em godzin ucznia o identyfikatorze przekazywanym w parametrze @UserId

CREATE FUNCTION CreateTimeTable (@UserId int )
RETURNS @Timetable TABLE
 (
 [Dzien Tygodnia] NVARCHAR(50),
 Class_Name NVARCHAR(50),
 Start_Hour TIME,
 End_Hour TIME
 )
AS
BEGIN
   INSERT INTO @Timetable
		SELECT Weekday.Name, Class_Name, Start_Hour, End_Hour FROM dbo.Classroom_Student AS CS
		JOIN dbo.Students ON Students.StudentId = CS.Student_ID
		JOIN dbo.Class ON Class.Class_ID = CS.Class_ID 
		JOIN dbo.Class_Date_Details ON Class_Date_Details.Class_ID = Class.Class_ID
		JOIN dbo.Weekday ON Weekday.Weekday_ID = Class_Date_Details.WeekDay_ID
		WHERE dbo.Students.StudentId = @UserId
	RETURN
END;

SELECT * FROM dbo.CreateTimeTable(6)