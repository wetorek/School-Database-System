-- funkcja tworzy i zwraca karte biblioteczn¹ danej ksi¹¿ki o identyfikatorze w param @BookId

CREATE FUNCTION BookCard (@BookId INT)
RETURNS @BookCard TABLE
(
	BookID INT,
	StudentName NVARCHAR(50),
	StudentSurname NVARCHAR(50),
	TakenDate DATE,
	ReturnDate Date
)
BEGIN
	INSERT INTO @BookCard
		SELECT @BookId, dbo.Students.Name, Surname, Taken_Date, Return_Date 
		FROM dbo.Borrows JOIN dbo.Students ON Students.StudentId = Borrows.Student_ID
		WHERE Book_ID = @BookId
		ORDER BY Taken_Date
	RETURN
END


