-- widok pokazuje liczbê wypo¿yczeñ dla danego autora

CREATE VIEW BorrowsForAuthor AS
SELECT P2.Author_ID ,P2.Name, P2. Surname, P1.[Liczba wypozyczen] FROM (
SELECT  Authors.Author_ID,COUNT (*) AS [Liczba wypozyczen] FROM Authors 
LEFT JOIN Books ON Authors.Author_ID = Books.Author_ID
LEFT JOIN Borrows ON Books.Book_ID = Borrows.Book_ID
GROUP BY Authors.Author_ID
) AS P1 
JOIN Authors AS P2 ON P1.Author_ID = P2.Author_ID

--SELECT * FROM BorrowsForAuthor