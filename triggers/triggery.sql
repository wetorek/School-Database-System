-- triger 1 
CREATE TRIGGER poprawa ON Exams_Result 
 FOR INSERT
	AS 
	DECLARE  @temp_mark INT
	DECLARE @wynik DATE
	SELECT @temp_mark = (select Mark from inserted)
	SELECT @wynik =  (GETDATE() + 14) 
	IF( @temp_mark = 1)
		PRINT 'obowiazkowa poprawa do dnia: ' + CONVERT(varchar(100),@wynik)
--koniec

		--triger 2 dziala
		CREATE TRIGGER kara ON Borrows
		FOR  INSERT,  UPDATE 
		AS 
		DECLARE @iloscDNI INT
		DECLARE @wynik  FLOAT 
		DECLARE @wypozyczenie DATE
		DECLARE @oddanie DATE

		SELECT @wypozyczenie = (SELECT Taken_Date FROM inserted)
		SELECT @oddanie = (SELECT Return_Date FROM inserted)
		SELECT  @iloscDNI  = DATEDIFF(DAY, @wypozyczenie, @oddanie) 
		SELECT @wynik = (@iloscDNI - 14) * 1.2 
		
		IF (@iloscDNI > 14)
			BEGIN
			PRINT 'kara za opoznienie: ' + CONVERT(varchar(100),@wynik)
			END
		ELSE
			BEGIN
			PRINT 'oddane w terminie' 
			END
		--koniec

	--trigger 3 
	CREATE TRIGGER zapowiedz ON Exams
	FOR INSERT, UPDATE
	AS
	DECLARE @temp DATE
	SELECT @temp = (SELECT Data_Of_Test FROM inserted)
		IF (@temp  < GETDATE() + 14)
			PRINT 'zapowiedz sprawdzianu narusza prawa ucznia, najblizsza mozliwa zapowiedz to: '
			+ CONVERT(varchar(100), GETDATE() + 14)
	--koniec 

	--trigger 4 --dziala
	CREATE TRIGGER godziny ON Class_Date_Details
	FOR INSERT, UPDATE
	AS
		DECLARE @start TIME
		DECLARE @koniec TIME
		DECLARE @temp1 DATETIME
		DECLARE @temp2 DATETIME
		SELECT @start  = (SELECT Start_Hour FROM inserted)
		SELECT @koniec = (SELECT End_Hour FROM inserted)
	
		IF( CONVERT(DATETIME, @koniec) < CONVERT(DATETIME, @start))
			PRINT 'prawdopodobnie wpisano odwrotnie godzine rozpoczecia i zakonczenia'

	--koniec

	--trigger 5
	CREATE TRIGGER dlugoscKursu ON Class 
	FOR INSERT, UPDATE
	AS
		DECLARE @start DATE
		DECLARE @koniec DATE
		DECLARE @iloscDni INT 
		SELECT @start = (SELECT Start_Date FROM inserted)
		SELECT @koniec = (SELECT End_Date FROM inserted)
		SELECT  @iloscDNI  = DATEDIFF(DAY, @start, @koniec)
			IF( @iloscDni < 0)
				PRINT 'daty wpisane odwrotnie'
			ELSE IF(@iloscDni < 150 )
				PRINT 'kurs jest zbyt krotki'
			

	--koniec
