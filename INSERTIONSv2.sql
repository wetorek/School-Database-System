INSERT INTO Account VALUES
('PioKow','aBcDeFgH','S','2018-09-01'),
('JakNow','a3c4e5gHd6$','S','2018-09-01'),
('PawKsi','$%^&gH','S','2018-09-01'),
('IzaDru','15155151','S','2018-09-01'),
('JakNow','a3c4e5gHd6$','S','2018-09-01'),
('NatDrz','97444444','S','2018-09-01'),
('KlaKow','123456','S','2018-09-01'),
('KrzWoj','85sd85ds85','T','2015-09-01'),
('NatWes','HHHBB%^s85','T','2015-09-01'),
('JadJak','963214587','T','2015-09-01'),
('DorSko','AAA34567','T','2015-09-01'),
('PioMus','85ds123','T','2015-09-01'),
('AnnZdr','858585','T','2015-09-01'),
('PauSam','%^&*85','T','2015-09-01'),
('TomZaj','85s234sx','T','2015-09-01'),
('PawJur','25252525','T','2015-09-01'),
('KarDen','85asdasdasd','T','2015-09-01'),
('JulBie','klasklas','T','2015-09-01'),
('KlaPi¹','mnzxxxxzzzz','T','2015-09-01'),
('AdaIgn','85assasa85','T','2015-09-01'),
('RobNow','65437654','T','2015-09-01'),
('DawZmi','qwerty','T','2015-09-01')

INSERT into Students values
('male', '2011-11-01','Piotr', 'Kowal', 513407123),
('male', '2014-02-01','Jakub', 'Nowak', 123456456),
('male', '2013-03-01',N'Pawe³', N'Ksi¹¿ek', 132647941),
('female', '2012-04-01','Izabela', 'Druga', 256376132),
('female', '2015-05-01','Natalia', 'Drzewiasta', 464115645),
('female', '2013-06-01','Klaudia', 'Kowalska', 515456466)
select * from Students


INSERT INTO Teachers VALUES
('Krzysztof','Wojciechowski', 546328745, 'male',7),
('Natalia','Weso³owska', 785426951, 'female',8),
('Jadwiga','Jakubiec', 632459876, 'female',9),
('Dorota','Skowronek', 59873461, 'female',10),
('Piotr','Muszyñski', 897643256, 'male',11),
('Anna','Zdrojewska', 899996542, 'female',12),
('Paulina','Samoæ', 874442569, 'female',13),
('Tomasz','Zaj¹c', 656565656, 'male',14),
('Pawe³','Juraszek', 518516666, 'male',15),
('Karolina','Dendzik', 545454546, 'female',16),
('Julia','Biel', 888555666, 'female',17),
('Klaudia','Pi¹tek', 654456654, 'female',18),
('Adam','Ignasiak', 869733332, 'male',19),
('Robert','Nowak', 666666589, 'male',20),
('Dawid','Zmilczak', 555455555, 'male',21)

insert into Authors values
('Adam', 'Zyta'),
('Jakub', 'Matuszewisz'),
('Ryszard', 'Mataczak'),
('Jan', 'Krupa'),
('Maciej', 'Pitt'),
(N'Bart³omiej', 'Jones'),
('Zofia', 'Turner'),
('Zuzanna', 'Dumpling'),
('Ida', N'Curuœ'),
('Zuzanna', 'Szewc')
select * from Authors;


INSERT INTO Books VALUES
(1, 'ksiazka1', 123, 2011),
(1, 'ksiazka2', 45, 2010),
(1, 'ksiazka3', 212, 2019),
(2, 'ksiazka4', 464, 2008),
(3, 'ksiazka5', 445, 2007),
(4, 'ksiazka6', 311, 2004),
(5, 'ksiazka7', 211, 2001),
(6, 'ksiazka8', 456, 2003),
(1, 'ksiazka9', 798, 2004)
SELECT * FROM dbo.Books

INSERT INTO dbo.Borrows VALUES
(1, 1,'2019-11-11', null),
(1, 2,'2016-11-11', null),
(1, 3,'2015-11-11', '2016-11-11'),
(1, 4,'2014-11-11', '2016-11-01'),
(1, 5,'2012-11-11', '2012-12-11'),
(2, 2,'2016-11-11', null),
(3, 5,'2015-11-11', '2016-11-11'),
(4, 6,'2014-11-11', null),
(5, 7,'2012-11-11', '2012-12-11'),
(6, 8,'2016-11-11', null),
(5, 9,'2015-11-11', '2016-11-11'),
(6, 3,'2014-11-11', '2016-11-01'),
(2, 4,'2012-11-11', '2012-12-11'),
(3, 6,'2016-11-11', null),
(4, 4,'2015-11-11', '2016-11-11'),
(5, 7,'2014-11-11', null),
(6, 8,'2012-11-11', '2012-12-11'),
(2, 7,'2016-11-11', null),
(3, 8,'2015-11-11', '2016-11-11'),
(4, 9,'2014-11-11', '2016-11-01'),
(5, 8,'2012-11-11', null)
SELECT * FROM dbo.Borrows

INSERT INTO Type_Of_Course VALUES
('e-learning'),
('lecture'),
('lessons'),
('practical')

INSERT INTO Language VALUES
('Polish'),
('English'),
('German'),
('Italian')

INSERT INTO Course VALUES 
(60,'Mathematics','winter',1,2,5),
(45, 'English','summer',2,3,2),
(45, 'History','winter',1,3,2),
(45, 'PE','winter',1,4,0),
(45, 'IT','summer',1,4,2),
(45, 'Italian','winter',4,3,2),
(45, 'History','summer',1,3,2),
(45, 'Physics','winter',1,3,2),
(45, 'Biology','winter',1,3,2),
(45, 'Chemistry','winter',1,3,2)

INSERT INTO Weekday VALUES
(1,N'Poniedzia³ek'), (2,'Wtorek'),(3,N'Œroda'), (4,'Czwartek'),(5,N'Pi¹tek'),(6,'Sobota'), (7,'Niedziela')

INSERT INTO Class VALUES
('2020-01-02' , '2020-06-30', 5,'Programming 1',3),
('2020-01-01' , '2020-06-30', 3,'Programming 1',1),
('2020-01-20' , '2020-06-30', 1,'Programming 1',2),
('2020-01-20' , '2020-06-30', 6,'Programming 1',4),
('2020-01-20' , '2020-06-30', 2,'Programming 1',5),
('2019-01-20' , '2020-06-30', 3,'Data Bases 1',3),
('2020-01-20' , '2020-06-30', 5,'Data Bases 1',2),
('2020-01-20' , '2020-06-30', 1,'Data Bases 1',1),
('2020-01-20' , '2020-06-30', 2,'Data Bases 1',5),
('2020-01-20' , '2020-06-30', 6,'Data Bases 1',4),
('2020-01-20' , '2020-06-30', 5,'Discrete Math',1),
('2020-01-20' , '2020-06-30', 2,'Discrete Math',2),
('2020-01-20' , '2020-06-30', 3,'Discrete Math',3),
('2020-01-20' , '2020-06-30', 4,'Discrete Math',5)

INSERT INTO Exams VALUES
('1', '2014-07-12', 'desprition',5),
('1', '2013-06-12', 'desprition',5),
('2', '2012-01-12', 'desprition',3),
('3', '2013-02-12', 'desprition',1),
('4', '2014-03-12', 'desprition',6),
('5', '2019-04-12', 'desprition',2),
('6', '2019-05-12', 'desprition',3),
('7', '2019-06-12', 'desprition',5),
('8', '2019-08-12', 'desprition',1),
('9', '2019-01-12', 'desprition',2),
('10', '2019-02-12', 'desprition',6),
('11', '2019-03-12', 'desprition',5),
('12', '2019-04-12', 'desprition',2),
('13', '2019-05-12', 'desprition',3),
('2', '2019-01-12', 'desprition',3),
('3', '2019-02-12', 'desprition',1),
('4', '2019-03-12', 'desprition',6),
('5', '2019-05-12', 'desprition',2);

INSERT INTO Classroom_Student VALUES
(1,1),
(2,1),
(3,1),
(4,1),
(5,1),
(1,2),
(2,2),
(4,2),
(3,3),
(4,3),
(5,3),
(6,4),
(3,4),
(5,4),
(4,4),
(1,5),
(2,5),
(3,5),
(4,5)

INSERT INTO dbo.Exams_Result
SELECT Exam_ID,Student_ID,Class.Class_ID, Class.Teacher_ID,  FLOOR(RAND(CHECKSUM(NEWID()))*(6-1+1)+1)AS random, '2019-03-06'
FROM dbo.Exams
JOIN dbo.Class ON dbo.Exams.Classroom_ID = Class.Class_ID
JOIN dbo.Classroom_Student ON Classroom_Student.Class_ID = Class.Class_ID

INSERT INTO dbo.Class_Date_Details
(
    Class_ID,
    WeekDay_ID,
    Start_Hour,
    End_Hour
)
VALUES
(2,1,'11:00:00','13:00:00'),
(3,1,'13:00:00','15:00:00'),
(4,2,'08:00:00','10:00:00'),
(5,2,'10:00:00','12:00:00'),
(6,3,'13:00:00','15:00:00'),
(7,4,'11:00:00','13:00:00'),
(8,5,'08:00:00','10:00:00')


INSERT INTO dbo.Absences VALUES
('2019-07-12', 1, 1,'F', ''),
('2017-07-12', 6, 2,'F', ''),
('2016-07-12', 16, 5,'F', ''),
('2015-07-12', 2, 1,'F', ''),
('2014-07-12', 7, 2,'F', ''),
('2013-07-12', 13, 4,'F', ''),
('2012-07-12', 18, 5,'F', ''),
('2011-07-12', 4, 1,'F', ''),
('2010-07-12', 8, 2,'F', ''),
('2011-07-12', 10, 3,'F', ''),
('2012-07-12', 15, 4,'F', ''),
('2013-07-12', 19, 5,'F', ''),
('2014-07-12', 12, 4,'F', ''),
('2015-07-12', 14, 4,'F', ''),
('2016-07-12', 11, 3,'F', ''),
('2011-07-12', 5, 1,'F', ''),
('2012-07-12', 19, 5,'F', ''),
('2011-07-12', 15, 4,'F', ''),
('2012-07-12', 12, 4,'F', ''),
('2013-07-12', 9, 3,'F', ''),
('2014-07-12', 1, 1,'F', '')