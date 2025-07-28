----------------------------------------------------------------------------------------------------------------------------------------
--------------------- T A B E L L E N --------------------------------------------------------------------------------------------------

--Erstellen der ADMINS-Tabelle

CREATE TABLE ADMINS (
	AdminID SERIAL PRIMARY KEY,			--Eindeutige, automatisch inkrementierende Kennung des Admins
	Firstname VARCHAR(100) NOT NULL,	--Vorname des Admins als Pflichtfeld bis 100 Zeichen
	Surname VARCHAR(200) NOT NULL,		--Nachname des Admins als Pflichtfeld bis 200 Zeichen
	EMail VARCHAR(200) UNIQUE NOT NULL	--Einmalige E-Mailadresse des Admins als Pflichtfeld bis 200 Zeichen
);

--Beispieldaten für ADMINS-Tabelle

INSERT INTO ADMINS (Firstname, Surname, Email)
	VALUES 	('Martina', 'Oezkan', 'moez@iu-study.org'),
			('Maxim', 'Mustermann', 'maximilian.mustermann@study.de'),
			('Anton', 'Müller', 'am@gmail.de'),
			('Paula', 'Schlau', 'pschlau23@yahoo.com'),
			('Jule', 'Rich', 'jule.rich@t-online.de'),
			('Tilo', 'Sar', 'tilo66@gmail.com',),
			('Anne', 'Baumann', 'any4586@aol.de'),
			('Boris', 'Baecker', 'bbaecker@gmx.de'),
			('Sinem', 'Oezdal', 'Sino@yahoo.com'),
			('Murat', 'Kan', 'muki@example.de');

-------------------------------------------------------------------------------------------------------------------------------------

--Erstellen der USERS-Tabelle

CREATE TABLE USERS (
	UserID SERIAL PRIMARY KEY,			--Eindeutige, automatisch inkrementierende Kennung des Users
	Firstname VARCHAR(100) NOT NULL,	--Vorname des Admins als Pflichtfeld bis 100 Zeichen
	Surname VARCHAR(200) NOT NULL,		--Nachname des Admins als Pflichtfeld bis 200 Zeichen
	EMail VARCHAR(200) UNIQUE NOT NULL,	--Einmalige E-Mailadresse des Admins als Pflichtfeld bis 200 Zeichen
	UserPassword VARCHAR(255) NOT NULL,	--Passwort für die Anmeldung des Users (Zeichenanzahl für mögliche Hashwerte)
	Phone VARCHAR(20)					--Telefonnummer des Users bis 20 Zeichen
);

--Beispieldaten für USERS-Tabelle

INSERT INTO USERS (Firstname, Surname, Email, UserPassword, Phone)
	VALUES 	('Max', 'Mueller', 'mm@beispiel.com','nsjcdi125#5', '0160222569' ),
			('Maxim', 'Muster', 'maxim123@gmx.de', '00009', '074268895648'),
			('Jana', 'Koncelmann', 'jk@gmail.de', '$§er%215!', '01744488908'),
			('Petra', 'Schlauer', 'peta1@yahoo.com', 'petraS1auR', '015012345678'),
			('Julius', 'Keller', '33J33K@t-online.de', 'Kelo5', '0733566513'),
			('Ali', 'Sari', 'alis@gmail.com', 'ben&sen2025=biz', '0160987654321'),
			('Anna', 'Burger', 'any6@aol.de', 'Toplianska25', '0907863842'),
			('Sarah', 'Baecker', 'baecky@gmx.de', 'SB§4444!', '016078451296'),
			('Zeynep', 'Akyol', 'akyolzeynep@yahoo.com', 'Zeynep08012004', '0175553428'),
			('Davide', 'Weis', 'Davis@example.de', 'whitY#007', '017512312344');

--------------------------------------------------------------------------------------------------------------------------------------

--Erstellen der REGISTRATIONS-Tabelle

CREATE TABLE REGISTRATIONS (
	RegID SERIAL PRIMARY KEY,				--Eindeutige, automatisch inkrementierende Kennung der Userregistrierung
	UserID INT REFERENCES USERS(UserID), 	--Fremdschlüssel UserID mit Bezug auf Tabelle USERS
	AdminID INT REFERENCES ADMINS(AdminID),	--Fremdschlüssel AdminID mit Bezug auf Tabelle ADMINS
	RegistrationDate TIMESTAMP NOT NULL,	--Zeitpunkt der Registrierung
	Status INT CHECK (Status IN (0,1))		--Registrierungsstatus (aktiv = 1, inaktiv = 0)
);


--Beispieldaten für REGISTRATIONS-Tabelle

INSERT INTO REGISTRATIONS (UserID, AdminID, RegistrationDate, Status)
	VALUES 	(9,1,'2025-01-15 10:23:00',1),
			(2,3,'2025-01-02 11:44:00',1),
			(7,1,'2025-02-01 10:00:00',0),
			(9,1,'2025-01-15 00:20:00',1),
			(1,2,'2025-04-25 07:23:01',1),
			(3,1,'2025-03-15 10:23:00',1),
			(5,1,'2025-01-30 09:13:50',0),
			(4,2,'2025-03-15 10:27:00',1),
			(8,2,'2025-01-15 07:26:00',1),
			(6,3,'2025-02-28 03:33:00',1);

---------------------------------------------------------------------------------------------------------------------------------------

--Erstellen der LANGUAGES-Tabelle

CREATE TABLE LANGUAGES (
	LanguageID SERIAL PRIMARY KEY,	--Eindeutige, automatisch inkrementierende Kennung des Autors
	Description VARCHAR(100)		--Bezeichnung der Sprache bis 100 Zeichen
);


--Beispieldaten für LANGUAGES-Tabelle

INSERT INTO LANGUAGES (Description)
	VALUES 	('Deutsch'),
			('Englisch'),
			('Franzoesich'),
			('Spanisch'),
			('Italienisch'),
			('Slowakisch'),
			('Türkisch'),
			('Arabisch'),
			('Portugiesisch'),
			('Griechisch');

-------------------------------------------------------------------------------------------------------------------------------------

--Erstellen der AUTHORS-Tabelle

CREATE TABLE AUTHORS (
	AuthorID SERIAL PRIMARY KEY,		--Eindeutige, automatisch inkrementierende Kennung des Autors
	Firstname VARCHAR(100) NOT NULL,	--Vorname des Autors als Pflichtfeld bis 100 Zeichen
	Surname VARCHAR(200) NOT NULL		--Nachname des Autors als Pflichtfeld bis 200 Zeichen
);


--Beispieldaten für AUTHORS-Tabelle

INSERT INTO AUTHORS (Firstname, Surname)
	VALUES 	('Franz','Kafka'),
			('Jane','Austen'),
			('Leo','Tolstoi'),
			('William','Shakespeare'),
			('Toni','Morrison'),
			('Haruki','Murakami'),
			('Sally','Rooney'),
			('Margaret','Atwood'),
			('Colleen','Hoover'),
			('Leila','Slimani');

--------------------------------------------------------------------------------------------------------------------------------------

--Erstellen der PUBLISHINGHOUSES-Tabelle

CREATE TABLE PUBLISHINGHOUSES (
	PubHouseID SERIAL PRIMARY KEY,	--Eindeutige, automatisch inkrementierende Kennung des Verlages
	Name VARCHAR(255) NOT NULL,		--Bezeichnung des Verlalges bis 255 Zeichen als Pflichtfeld
	FoundationYear INT ,			--Gründungsjahr des Verlages
	Phone VARCHAR(20),				--Telefonnummer des Verlages bis 20 Zeichen
	Email VARCHAR(200)  ,			--Einmalige E-Mailadresse des Verlages bis 200 Zeichen
	Homepage VARCHAR(255) 			--Webseite des Verlangs bis 255 Zeichen
);


--Beispieldaten für PUBLISHINGHOUSES-Tabelle

INSERT INTO PUBLISHINGHOUSES (Name,FoundationYear, Phone, Email, Homepage)
	VALUES 	('Klett Gruppe', 1785, '03412396-0', 'info@klett.support', 'www.klett.de'),
			('Springer Nature', 2015, '-', 'info@springer.com', 'www.springer.com'),
			('Fischer Verlag GmbH', 1886, '+49 69 6062-0', 'info@fischerverlage.de', 'www.fischerverlage.de'),
			('Penguin Random House Verlagsgruppe GmbH', 2009, ' 0800 500 33 22', 'Kundenservice@penguin.de', 'www.penguin.de'),
			('Suhrkamp Verlag GmbH', 1950, '+49 30 740744-0', ' info@suhrkamp.de', 'www.suhrkamp.de'),
			('Carl Hanser Verlag GmbH & Co.KG', 1928, '+49 89 99830-0', 'info@hanser.de', 'www.hanser.de'),
			('HarperCollins Publishers', 1989, '+1 212-207-7000', '-', 'www.harpercollins.com'),
			('Europa Editions', 0, '+39 06 3722829', 'info@europaeditions.com', 'www.europaeditons.com'),
			('World Editions', 2013, '-', '-', 'www.worldeditions.org'),
			('Kehrer Verlag', 1995, '+49 711 6672-1216', ' svk@svk.de', 'www.kehrerverlag.com');

--------------------------------------------------------------------------------------------------------------------------------------------

--Erstellen der ADDRESSES-Tabelle

CREATE TABLE ADDRESSES (
	AddressID SERIAL PRIMARY KEY,							--Eindeutige, automatisch inkrementierende Kennung der Anschrift
	UserID INT REFERENCES USERS(UserID),					--Fremdschlüssel UserID mit Bezug auf Tabelle USERS
	PubHouseID INT REFERENCES PUBLISHINGHOUSES(PubHouseID) ,--Fremdschlüssel PubHouseID mit Bezug auf Tabelle PUBLISHINGHOUSES
	Street VARCHAR(100) UNIQUE NOT NULL,					--Straße bis 200 Zeichen
	HouseNo VARCHAR(20) NOT NULL,							--Hausnummer bis 20 Zeichen
	ZIPCode VARCHAR(6),										--Postleitzahl bis 6 Zeichen
	Place VARCHAR(100)										--Ort bis 100 Zeichen
);

--Beispieldaten für ADDRESSES-Tabelle

INSERT INTO ADDRESSES (UserID, PubHouseID, Street, HouseNO, ZIPCode, Place)
	VALUES 	(3, NULL, 'Langenweg','3', '01589', 'Berlin' ),
			(NULL,1, 'Rotebuehlstrasse', '77', '70178','Stuttgart' ),
			(NULL,2, 'Europaplatz', '3', '69115', 'Heidelberg'),
			(1,NULL, 'Hauptstrasse', '11B', '40213','Duesseldorf'),
			(NULL,9, 'Cassellastrasse', '30-32', '60386', 'Frankfurt am Main'),
			(9,NULL, 'Landhausweg', '59', '50672', 'Koeln'),
			(8,NULL, 'Friedrich-Ebert-Allee', '123', '53113','Bonn'),
			(10,NULL, 'Isernhägener Strasse', '16', '30938','Burgwedel bei Hannover'),
			(NULL,10, 'Mannheimer Strasse', '175', '69123', 'Heidelberg'),
			(5,NULL, 'Immenstaedter Strasse', '67/1/22', '87435','Kempten (Allgaeu)');

-------------------------------------------------------------------------------------------------------------------------------------------------

--Erstellen der CATEGORIES-Tabelle

CREATE TABLE CATEGORIES (
	CategoryID SERIAL PRIMARY KEY,			--Eindeutige, automatisch inkrementierende Kennung der Kategorie
	CatName VARCHAR(255)					--Kategorie Bezeichnung bis 255 Zeichen
);

--Beispieldaten für CATEGORIES-Tabelle

INSERT INTO CATEGORIES (CatName)
	VALUES 	('Sachbuch' ),
			('Biografie'),
			('Historisch'),
			('Romantik'),
			('Thriller'),
			('Fantasy'),
			('Horror'),
			('Fiktion'),
			('Science Fiction'),
			('Kinderbuch');
			
------------------------------------------------------------------------------------------------------------------------------------------------

--Erstellen der SHIPPINGOPTIONS-Tabelle

CREATE TABLE SHIPPINGOPTIONS (
	ShippingID SERIAL PRIMARY KEY,															--Eindeutige, automatisch inkrementierende Kennung der Versandoption
	ShippingOption VARCHAR(100) CHECK (ShippingOption IN ('Mit Versand','Nur Abholung')),	--Versandoption - Versand oder Abholung	
	ShippingDate TIMESTAMP,																	--Datum an dem das Buch versendet / abgeholt würde
	ShippmentNo VARCHAR(100),																--Sendungsnummer / Tracking-Nummer zur Nachverfolgung beim Versand
	ShippmentStatus VARCHAR(100) CHECK (ShippmentStatus IN ('Versendet','Zugestellt')),	 	--Status des Versands (Versendet, Zugestellt)
	AddressID INT REFERENCES ADDRESSES(AddressID) 											--Fremdschlüssel AddressID mit Bezug auf Tabelle ADDRESSES für Lieferadresse
	);		

--Beispieldaten für SHIPPINGOPTIONS-Tabelle

INSERT INTO SHIPPINGOPTIONS (ShippingOption, ShippingDate, ShippmentNo, ShippmentStatus, AddressID)
	VALUES 	('Mit Versand', '2025-07-11', 'SN123456996254', 'Versendet', 11),
			('Mit Versand', '2025-04-13', 'H6543212221514', 'Zugestellt', 12),
			('Nur Abholung', NULL, NULL, NULL, NULL),
			('Nur Abholung', NULL, NULL, NULL, NULL),
			('Mit Versand', '2025-01-23', 'SN901234', 'Zugestellt', 15),
			('Nur Abholung', NULL, NULL, NULL, NULL),
			('Nur Abholung', NULL, NULL, NULL, NULL),
			('Nur Abholung', NULL, NULL, NULL, NULL),
			('Nur Abholung', NULL, NULL, NULL, NULL),
			('Mit Versand', '2025-06-01', 'SN012678', 'Versendet', 20);

-----------------------------------------------------------------------------------------------------------------------------------------------------

--Erstellen der BOOKS-Tabelle

CREATE TABLE BOOKS (
	BookID SERIAL PRIMARY KEY,								--Eindeutige, automatisch inkrementierende Kennung des Buches
	AuthorID INT NOT NULL REFERENCES AUTHORS(AuthorID),		--Fremdschlüssel AuthorID mit Bezug auf Tabelle AUTHORS
	PubHouseID INT REFERENCES PUBLISHINGHOUSES(PubHouseID) ,--Fremdschlüssel PubHouseID mit Bezug auf Tabelle PUBLISHINGHOUSES
	CategoryID INT REFERENCES CATEGORIES(CategoryID),		--Fremdschlüssel CategoryID mit Bezug auf Tabelle CATEGORIES
	LanguageID INT REFERENCES LANGUAGES(LanguageID),		--Fremdschlüssel LanguageID mit Bezug auf Tabelle LANGUAGES
	ShippingID INT REFERENCES SHIPPINGOPTIONS(ShippingID),	--Fremdschlüssel ShippingID mit Bezug auf Tabelle SHIPPINGOPTIONS
	PublicationYear INT ,									--Jahr der Veröffentlichung des Buches
	Titel VARCHAR(255) NOT NULL,							--Pflichtfeld Titel des Buches bis 255 Zeichen
	ISBN VARCHAR(20) UNIQUE NOT NULL,						--Eindeutige Internationale Standardbuchnummer
	BookCondition VARCHAR(255),								--Zustand des Buches bis 255 Zeichen
	Pages INT												--Anzahl der Seiten eines Buches
);

--Beispieldaten für BOOKS-Tabelle

INSERT INTO BOOKS (AuthorID, PubHouseID, CategoryID, LanguageID, ShippingID, PublicationYear, Titel, ISBN, BookCondition, Pages)
	VALUES 	(1, 1, 1, 5, 11, 1808, 'Faust', '978-3-16-148410-0', 'Neu', 200),
			(2, 2, 2, 1, 12, 1813, 'Stolz und Vorurteil', '978-1-23-456789-7',  'Gebraucht', 300),
			(3, 3, 4, 4, 13, 1599, 'Hamlet', '978-0-12-345678-9',  'Neu', 150),
			(4, 4, 5, 3, 14, 1869, 'Krieg und Frieden', '978-3-16-148411-7',  'Gebraucht', 1200),
			(5, 5, 3, 10,15, 1869, 'Tom Sawyer', '978-0-98-765432-1',  'Neu', 350),
			(6, 6, 6, 2, 16, 1987, 'Norwegian Wood', '978-4-20-123456-7',  'Neu', 400),
			(7, 7, 7, 1, 17, 1929, 'Mrs Dalloway', '978-0-14-118247-5',  'Gebraucht', 250),
			(8, 8, 8, 1, 18, 1795, 'Wallenstein', '978-3-16-148412-4',  'Neu', 180),
			(9, 9, 9, 2, 19, 1859, 'A Tale of Two Cities', '978-0-14-143960-0',  'Neu', 320),
			(10, 10, 10, 2, 20, 1926, 'The Sun Also Rises', '978-0-14-118263-5',  'Gebraucht', 280);

--------------------------------------------------------------------------------------------------------------------------------------------------

--Erstellen der LOANS-Tabelle

CREATE TABLE LOANS (
	LoanID SERIAL PRIMARY KEY,					--Eindeutige, automatisch inkrementierende Kennung der Ausleihe
	BookID INT REFERENCES BOOKS(BookID),		--Fremdschlüssel BookID mit Bezug auf Tabelle Books
	UserID INT REFERENCES USERS(UserID) ,		--Fremdschlüssel UserID mit Bezug auf Tabelle USERS
	LoanDate TIMESTAMP,							--Datum an dem das Buch ausgeliehn würde
	LoanPeriod INT,								--Dauer der Ausleihe in Tagen
	ReturnDate TIMESTAMP						--Datum der Rückgabe des Buches
	);

--Beispieldaten für LOANS-Tabelle

INSERT INTO LOANS (BookID, UserID, LoanDate, LoanPeriod, ReturnDate)
	VALUES 	(1, 1, '2025-06-10 10:00:00', 14, '2025-06-24 10:00:00'),
			(2, 2, '2025-05-12 14:30:00', 7, '2025-05-19 14:30:00'),
			(3, 3, '2025-04-15 09:00:00', 21, NULL),
			(4, 4, '2025-04-20 16:45:00', 14, NULL),
			(5, 5, '2025-04-22 11:15:00', 10, NULL),
			(6, 6, '2025-04-25 13:00:00', 14, NULL),
			(7, 7, '2025-04-28 17:30:00', 7, NULL),
			(8, 8, '2025-05-30 10:00:00', 14, NULL),
			(9, 9, '2025-07-01 09:45:00', 21, NULL),
			(10, 10, '2025-06-03 15:20:00', 14, '2025-06-17 18:35:00');

------------------------------------------------------------------------------------------------------------------------------------------------------

--Erstellen der COMMENTS-Tabelle

CREATE TABLE COMMENTS (
	CommentID SERIAL PRIMARY KEY,			--Eindeutige, automatisch inkrementierende Kennung des Kommentars
	BookID INT REFERENCES BOOKS(BookID),	--Fremdschlüssel BookID mit Bezug auf Tabelle Books
	UserID INT REFERENCES USERS(UserID) ,	--Fremdschlüssel UserID mit Bezug auf Tabelle USERS
	Score INT CHECK (Score BETWEEN 1 AND 5),--Sterne der Bewertung von 1 bis 5
	Text TEXT,								--Kommentar-Text
	CommentDate TIMESTAMP					--Aktuelles Datum der Abgabe eines Kommentars
	);

--Beispieldaten für COMMENTS-Tabelle

INSERT INTO COMMENTS (BookID, UserID, Score, Text, CommentDate)
	VALUES 	(1, 1, 5, 'Sehr Spannend!', '2025-07-14 10:00:00'),
			(2, 2, 4, 'Ganz ok.', '2025-06-19 14:30:00'),
			(3, 3, 3, 'Klassiker, muss man mögen.', '2025-05-15 09:00:00'),
			(4, 4, 2, 'Sehr traurig und teilweise langweilig','2025-05-20 16:45:00'),
			(5, 5, 1, 'Naja','2025-05-22 11:15:00'),
			(6, 6, 2, 'Not the best.', '2025-05-25 13:00:00'),
			(7, 7, 3, 'Buch ist ziemlich verbraucht, manche Seiten beschädigt, zum Lesen aber reicht.', '2025-05-28 17:30:00'),
			(8, 8, 4, 'Für Drama- und Gedichtliebhaber ausgezeichnet', '2025-06-30 10:00:00'),
			(9, 9, 5, 'Wer historische Romane mag, ist das klare Empfehlung', '2025-07-15 09:45:00'),
			(10, 10, 1, 'Schwierig zu Lesen, somit hat es mich nicht gefesselt.', '2025-07-15 18:35:00');

---------------------------------------------------------------------------------------------------------------------------------------------------

--Erstellen der VALUATIONS-Tabelle

CREATE TABLE VALUATIONS (
	ValuationID SERIAL PRIMARY KEY,			--Eindeutige, automatisch inkrementierende Kennung der Userbewertung
	BookID INT REFERENCES BOOKS(BookID),	--Fremdschlüssel BookID mit Bezug auf Tabelle Books
	UserID INT REFERENCES USERS(UserID) ,	--Fremdschlüssel UserID mit Bezug auf Tabelle USERS
	Score INT CHECK (Score BETWEEN 1 AND 5),--Sterne der Bewertung von 1 bis 5
	Text TEXT,								--Userbewertung-Text
	ValuationDate TIMESTAMP					--Aktuelles Datum der Abgabe einer Bewertung
	);

--Beispieldaten für VALUATIONS-Tabelle

INSERT INTO VALUATIONS (BookID, UserID, Score, Text, ValuationDate)
	VALUES 	(1, 1, 5, 'Sehr zuverlässig', '2025-07-15 10:00:00'),
			(2, 2, 4, 'Alles bestens', '2025-07-10 14:30:00'),
			(3, 3, 3, 'Ganz ok', '2025-06-15 09:00:00'),
			(4, 4, 2, 'Total unflexibel','2025-06-20 16:45:00'),
			(5, 5, 1, 'Geht gar nicht','2025-06-22 11:15:00'),
			(6, 6, 2, 'Not the best.', '2025-06-25 13:00:00'),
			(7, 7, 3, 'Buch ist ziemlich verbraucht, bin enttäuscht.', '2025-06-28 17:30:00'),
			(8, 8, 4, 'Toller Kontakt', '2025-07-03 10:00:00'),
			(9, 9, 5, 'Sehr nette Person, pünktlich und die Bücher sind 1A', '2025-07-15 11:45:00'),
			(10, 10, 1, 'Kann ich leider nicht empfehlen.', '2025-07-15 18:40:00');

-------------------------------------------------------------------------------------------------------------------------------------------------

--Erstellen der RESERVATIONS-Tabelle

CREATE TABLE RESERVATIONS (
	ReservationID SERIAL PRIMARY KEY,		--Eindeutige, automatisch inkrementierende Kennung der Reservierung
	BookID INT REFERENCES BOOKS(BookID),	--Fremdschlüssel BookID mit Bezug auf Tabelle Books
	UserID INT REFERENCES USERS(UserID) ,	--Fremdschlüssel UserID mit Bezug auf Tabelle USERS
	ReservationFrom TIMESTAMP,				--Startdatum der Reservierung
	ReservationUntill TIMESTAMP				--Enddatum der Reservierung
	);

--Beispieldaten für RESERVATIONS-Tabelle

INSERT INTO RESERVATIONS (BookID, UserID, ReservationFrom, ReservationUntill)
	VALUES 	(1, 10, '2025-08-15 10:00:00','2025-08-18 10:00:00'),
			(2, 9, '2025-08-10 14:30:00','2025-08-13 14:30:00'),
			(3, 8, '2025-07-15 09:00:00','2025-07-18 09:00:00'),
			(4, 7, '2025-07-20 16:45:00','2025-07-23 16:45:00'),
			(5, 6, '2025-07-22 11:15:00','2025-07-25 11:15:00'),
			(6, 5, '2025-07-25 13:00:00','2025-07-28 13:00:00'),
			(7, 4, '2025-07-28 17:30:00','2025-07-30 17:30:00'),
			(8, 3, '2025-08-03 10:00:00','2025-08-07 10:00:00'),
			(9, 2, '2025-08-15 11:45:00','2025-08-18 11:45:00'),
			(10, 1,'2025-08-15 18:40:00','2025-08-18 18:40:00');

---------------------------------------------------------------------------------------------------------------------------------------------------

--Erstellen der SEARCHES-Tabelle

CREATE TABLE SEARCHES (
	SearchID SERIAL PRIMARY KEY,			--Eindeutige, automatisch inkrementierende Kennung des Suchvorgangs
	UserID INT REFERENCES USERS(UserID) ,	--Fremdschlüssel UserID mit Bezug auf Tabelle USERS
	SearchTerm Varchar(255),				--Texteingabe der Suche (Titel, Autor, Verlag...)
	BookLocation Varchar(255),				--Standort - Adresseingabe
	Availability BOOLEAN 					--Verfügbarkeit , ob nur verfügbare Bücher aufgelistet werden sollen
	);

--Beispieldaten für SEARCHES-Tabelle

INSERT INTO SEARCHES (UserID, SearchTerm, BookLocation, Availability)
	VALUES 	(1,  'Kinderbuch',NULL, TRUE),
			(2,  'Kafka',NULL, FALSE),
			(3,  'Hoover','Koeln', FALSE),
			(4,  NULL,'Berlin', TRUE),
			(5,  NULL,NULL,TRUE),
			(6,  'Klett Gruppe',NULL, TRUE),
			(7,  'Fischer Verlag',NULL, FALSE),
			(8,  'Romantik','Stuttgart', FALSE),
			(9,  'Fantasy',NULL, FALSE),
			(10, NULL,'Bonn', TRUE);

---------------------------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------------------------


---------------------------- T E S T F A E L L E --------------------------------------------------------------------------------------------------


--Testfall der Tabelle ADMINS

SELECT * FROM ADMINS;

--Erwartetes Ergebnis - Auflistung aller Studenten, 
--die der Tabelle ADMINS hinzugefügt wurden und für die App
--Verwaltung zuständig sind.

---------------------------------------------------------------------------------------------------------------------------------------------------

--Testfall der Tabelle USERS

SELECT * FROM USERS;

--Erwartetes Ergebnis - Auflistung aller Benutzer, 
--die der Tabelle USERS hinzugefügt wurden
---------------------------------------------------------------------------------------------------------------------------------------------------


--Testfall der Tabelle REGISTRATIONS

SELECT * FROM REGISTRATIONS;

--Erwartetes Ergebnis - Auflistung aller Registrierungen
---------------------------------------------------------------------------------------------------------------------------------------------------


--Testfall der Tabelle LANGUAGES

SELECT * FROM LANGUAGES;

--Erwartetes Ergebnis - Auflistung aller Sprachen
---------------------------------------------------------------------------------------------------------------------------------------------------

--Testfall der Tabelle AUTHORS

SELECT * FROM AUTHORS;

--Erwartetes Ergebnis - Auflistung aller Autoren
---------------------------------------------------------------------------------------------------------------------------------------------------

--Testfall der Tabelle PUBLISHINGHOUSES

SELECT * FROM PUBLISHINGHOUSES;

--Erwartetes Ergebnis - Auflistung aller Verlagshäuser
---------------------------------------------------------------------------------------------------------------------------------------------------

--Testfall der Tabelle ADDRESSES

SELECT * FROM ADDRESSES;

--Erwartetes Ergebnis - Auflistung aller Anschriften, 
--die der Tabelle ADDRESSES hinzugefügt wurden
---------------------------------------------------------------------------------------------------------------------------------------------------


--Testfall der Tabelle CATEGORIES

SELECT * FROM CATEGORIES;

--Erwartetes Ergebnis - Auflistung aller Kategorien, 
--die der Tabelle CATEGORIES hinzugefügt wurden
---------------------------------------------------------------------------------------------------------------------------------------------------


--Testfall der Tabelle SHIPPINGOPTIONS

SELECT * FROM SHIPPINGOPTIONS;

--Erwartetes Ergebnis - Auflistung aller Versandoptionen, 
--die der Tabelle SHIPPINGOPTIONS hinzugefügt wurden
---------------------------------------------------------------------------------------------------------------------------------------------------

--Testfall der Tabelle BOOKS

SELECT * FROM BOOKS;

--Erwartetes Ergebnis - Auflistung aller Bücher, 
--die der Tabelle BOOKS hinzugefügt wurden
---------------------------------------------------------------------------------------------------------------------------------------------------


--Testfall der Tabelle LOANS

SELECT * FROM LOANS;

--Erwartetes Ergebnis - Auflistung aller Ausleihen, 
--die der Tabelle LOANS hinzugefügt wurden
---------------------------------------------------------------------------------------------------------------------------------------------------


--Testfall der Tabelle COMMENTS

SELECT * FROM COMMENTS;

--Erwartetes Ergebnis - Auflistung aller Kommentaren, 
--die der Tabelle COMMENTS hinzugefügt wurden
---------------------------------------------------------------------------------------------------------------------------------------------------


--Testfall der Tabelle VALUATIONS

SELECT * FROM VALUATIONS;

--Erwartetes Ergebnis - Auflistung aller Bewertungen, 
--die der Tabelle VALUATIONS hinzugefügt wurden
---------------------------------------------------------------------------------------------------------------------------------------------------


--Testfall der Tabelle RESERVATIONS

SELECT * FROM RESERVATIONS;

--Erwartetes Ergebnis - Auflistung aller Buchreservierungen, 
--die der Tabelle RESERVATIONS hinzugefügt wurden
---------------------------------------------------------------------------------------------------------------------------------------------------


--Testfall der Tabelle SEARCHES

SELECT * FROM SEARCHES;

--Erwartetes Ergebnis - Auflistung aller Suchvorgängen pro User, 
--die der Tabelle SEARCHES hinzugefügt wurden

---------------------------------------------------------------------------------------------------------------------------------------------------

-- Suche nach Bücher in mehreren Feldern der BOOKS-Tabelle anhand der letzter Suche von User 8

SELECT B.*														--Liste alles
FROM BOOKS B													--aus Tabelle BOOKS 
JOIN AUTHORS A ON B.AuthorID = A.AuthorID						--Verknüpfe die Tabelle BOOKS mit AUTHORS
JOIN PUBLISHINGHOUSES P ON B.PubHouseID = P.PubHouseID			--Verknüpfe die Tabelle BOOKS mit PUBLISHINGHOUSES
JOIN CATEGORIES C ON B.CategoryID = C.CategoryID				--Verknüpfe die Tabelle BOOKS mit CATEGORIES
WHERE 															--Unter Bedingung
	 B.Titel ILIKE  (SELECT SearchTerm FROM SEARCHES WHERE UserID = 8 ORDER BY SearchID DESC LIMIT 1)
	-- das Buchtitel mit der letzen Sucheingabe des Users 8 übereinstimmt
    OR A.Surname ILIKE (SELECT SearchTerm FROM SEARCHES WHERE UserID = 8 ORDER BY SearchID DESC LIMIT 1)
	-- oder Nachname des Autors mit der letzen Sucheingabe ders Users 8 übereinstimmt
    OR P.Name ILIKE (SELECT SearchTerm FROM SEARCHES WHERE UserID = 8 ORDER BY SearchID DESC LIMIT 1)
	-- oder Verlagname mit der letzen Sucheingabe ders Users 8 übereinstimmt
    OR C.CatName ILIKE (SELECT SearchTerm FROM SEARCHES WHERE UserID = 8 ORDER BY SearchID DESC LIMIT 1);
	-- oder die Kategoriebezeichnung eines Buches mit der letzen Sucheingabe ders Users 8 übereinstimmt

-- ORDER BY SearchID DESC = Sortiert nach der SearchID absteigend, d.h. die höchste ID kommt zuerst
-- LIMIT 1 = Es wird nur der letze (neueste) Eintrag zurückgegeben

--------------------------------------------------------------------------------------------------------------------------------------------------

-- Suche nach Bücher, die einem Verlag mit der Anfangsbuchstabe "S" gehören
SELECT B.* , P.Name												--Liste alles aus Tabelle BOOKS + Name des Verlags
FROM BOOKS B													--aus Tabelle BOOKS 
JOIN PUBLISHINGHOUSES P ON B.PubHouseID = P.PubHouseID			--Verknüpfe die Tabelle BOOKS mit PUBLISHINGHOUSES
WHERE 															--Unter Bedingung 
    P.Name ILIKE 'S%';											--dass Name des Verlags mit S
   
--------------------------------------------------------------------------------------------------------------------------------------------------

-- Liste alle Reservierungen inkl. Username, Buchtitel, ISBN-Nummer, Buchzustand, Veröffentlichungsjahr und Seitenanzahl
SELECT R.*, U.Surname, B.Titel, B.ISBN, B.Bookcondition, B.Publicationyear, B.Pages														
FROM RESERVATIONS R									--aus Tabelle RESERVATIONS
JOIN BOOKS B ON R.BookID = B.BookID					--Verknüpfe die Tabelle RESERVATIONS mit BOOKS
JOIN USERS U ON R.UserID = U.UserID;				--Verknüpfe die Tabelle RESERVATIONS mit USERS

--------------------------------------------------------------------------------------------------------------------------------------------------

-------------------------------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------------------------------


------------------------ T R I G G E R ----------------------------------------------------------------------------------------------------------

CREATE OR REPLACE FUNCTION validate_fields() RETURNS TRIGGER AS $$
BEGIN
	--E-Mail-Validierung
	IF NEW.Email IS NOT NULL AND NEW.Email !~* '^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$' THEN
		RAISE EXCEPTION 'Ungültige E-Mail-Adresse: %', NEW.Email;
	END IF;
	-- Stellt sicher, dass E-Mails korrekt aufgebaut sind

	--Telefonnummer-Validierung (nur Ziffern, +, -, /, Leerzeichen erlaubt)
	IF NEW.Phone IS NOT NULL AND NEW.Phone !~* '^[0-9+\-\/\s]+$' THEN
		RAISE EXCEPTION 'Ungültige Telefonnummer: %', NEW.Phone;
	END IF;
	--Prüft die Telefonnummern auf unerlaubte Zeichen

	--ISBN-Validierung (nur für Tabelle BOOKS)
	IF TG_TABLE_NAME = 'BOOKS' AND (NEW.ISBN IS NULL OR NEW.ISBN !~* '^(\d{10}|\d{13})$') THEN
		RAISE EXCEPTION 'Ungültige ISBN (muss 10 oder 13 Ziffern enthalten): %', NEW.ISBN;
	END IF;
	--Prüft grob, ob die ISBN-Struktur passt

	RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-----------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------------


------------------------ I N D E X I E R U N G ------------------------------------------------------------------------------------------------

--Index auf die Spalte Titel in der Tabelle BOOKS

CREATE INDEX idx_books_titel_fts		  --Erstelle Index idx_books_titel_fts
ON BOOKS								  --Bezug des Indexes auf die Tabelle BOOKS
USING GIN (to_tsvector('german', titel)); --GIN = Generalized Inverted Index - Indextyp optimiert für Volltextsuche (to_tsvector)
										  -- to_tsvector('german',titel) = Umwandlung des Titels in ein Textsuchformat in deutscher Sprache

--------------------------------------------------------------------------------------------------------------------------------------------


----------------------TESTS VALIDIERUNG------------------------------------------------------------------------------------------------------

--Test zur Telefonnummervalidierung
INSERT INTO USERS (Firstname, Surname, Email, UserPassword, Phone)
	VALUES 	('Max', 'TEST', 'mt@test.com','test125#5', 'ABC-#123' );

-----------------------------------------------------------------------

--Test zur Pflichtfeld Titel und Text in ISBN in Tabelle BOOKS
INSERT INTO BOOKS (AuthorID, PubHouseID, CategoryID, LanguageID, ShippingID, PublicationYear, Titel, ISBN, BookCondition, Pages)
	VALUES 	(1, 1, 1, 5, 11, 1808, NULL, 'TEST', 'Neu', 200);

--------------------------------------------------------------------------------------------------------------------------------------------

--Test für E-Mailvalidierung in der Tabelle ADMINS
INSERT INTO ADMINS (Firstname, Surname, Email)
	VALUES 	('Test', 'Test', 'test.de');

Select * From ADMINS

------------------------------------------------------
------------------------------------------------------

----------------TRIGGER ZUWEISUNG----------------------------------------------

-- Verbindung von Trigger zu Tabelle USERS

CREATE TRIGGER trg_validate_user_fields		--Erzeuge ein Trigger zur Validierung von Benutzerdatenfeldern
BEFORE INSERT OR UPDATE ON USERS			--der Trigger soll sowohl beim Hinzufügen als auch beim Ändern von Datensätzen ausgelöst
FOR EACH ROW								--Trigger soll für jede einzelne betroffene Zeile ausgeführt werden
EXECUTE FUNCTION validate_fields();			--Referenz auf die Triggerfunktion validate_fields
-----------------------------------------------------------------------------------------------

-- Verbindung von Trigger zu Tabelle ADMINS

CREATE TRIGGER trg_validate_admins_fields	--Erzeuge ein Trigger zur Validierung von Adminsdatenfeldern
BEFORE INSERT OR UPDATE ON ADMINS			--der Trigger soll sowohl beim Hinzufügen als auch beim Ändern von Datensätzen ausgelöst
FOR EACH ROW								--Trigger soll für jede einzelne betroffene Zeile ausgeführt werden
EXECUTE FUNCTION validate_fields();			--Referenz auf die Triggerfunktion validate_fields

-------------------------------------------------------------------------------------------------

-- Verbindung von Trigger zu Tabelle BOOKS

CREATE TRIGGER trg_validate_books_fields	--Erzeuge ein Trigger zur Validierung von Bücherdatenfeldern
BEFORE INSERT OR UPDATE ON BOOKS			--der Trigger soll sowohl beim Hinzufügen als auch beim Ändern von Datensätzen ausgelöst
FOR EACH ROW								--Trigger soll für jede einzelne betroffene Zeile ausgeführt werden
EXECUTE FUNCTION validate_fields();			--Referenz auf die Triggerfunktion validate_fields
-------------------------------------------------------------------------------------------------

---------------TRIGGER Funktion KORREKTUR-------------------------------------------------

--Korrektur der Trigger Funktion

CREATE OR REPLACE FUNCTION validate_fields() RETURNS TRIGGER AS $$		--aktualisiert bestehende Funktion in-place
DECLARE
	isbn_clean TEXT;													--Variable für bereinigte ISBN (Nur Ziffern)
	sum INT := 0;														--Zwischensumme für ISBN-Prüfzifferberechnung
	digit INT;															--Variable speichert der jeweiligen Ziffer
BEGIN
	-- E-Mail-Prüfung nur in relevanten Tabellen USERS, ADMINS und PUBLISHINGHOUSES
	IF TG_TABLE_NAME IN ('users', 'admins','publishinghouses') THEN
		IF NEW.Email IS NOT NULL AND NEW.Email !~* '^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$' THEN
			RAISE EXCEPTION 'Ungültige E-Mail-Adresse in Tabelle %: %', TG_TABLE_NAME, NEW.Email;
		END IF;
	END IF;

	-- Telefonnummer-Prüfung nur in USERS und PUBLISHINGHOUSES
	IF TG_TABLE_NAME IN ('users', 'publishinghouses') THEN
		IF NEW.Phone IS NOT NULL AND NEW.Phone !~* '^[0-9+\-\/\s]+$' THEN
			RAISE EXCEPTION 'Ungültige Telefonnummer in Tabelle %: %', TG_TABLE_NAME, NEW.Phone;
		END IF;
	END IF;

	-- ISBN-Prüfung nur in BOOKS
	IF TG_TABLE_NAME = 'books' AND
		 NEW.ISBN IS NOT NULL THEN
			isbn_clean := regexp_replace(NEW.ISBN, '[^0-9Xx]', '', 'g');
		

		-- ISBN-10 mit Prüfziffer
		IF length(isbn_clean) = 10 THEN
			FOR i IN 1..9 LOOP
				digit := CAST(substring(isbn_clean, i, 1) AS INTEGER);
				sum := sum + digit * i;
			END LOOP;
			IF upper(substring(isbn_clean, 10, 1)) = 'X' THEN
				sum := sum + 10 * 10;
			ELSE
				digit := CAST(substring(isbn_clean, 10, 1) AS INTEGER);
				sum := sum + digit * 10;
			END IF;
			IF sum % 11 <> 0 THEN
				RAISE EXCEPTION 'Ungültige ISBN-10 Prüfziffer: %', NEW.ISBN;
			END IF;

		-- ISBN-13 mit Prüfziffer
		ELSIF length(isbn_clean) = 13 THEN
			sum := 0;
			FOR i IN 1..12 LOOP
				digit := CAST(substring(isbn_clean, i, 1) AS INTEGER);
				IF i % 2 = 0 THEN
					sum := sum + digit * 3;
				ELSE
					sum := sum + digit;
				END IF;
			END LOOP;
			digit := CAST(substring(isbn_clean, 13, 1) AS INTEGER);
			IF (10 - (sum % 10)) % 10 <> digit THEN
				RAISE EXCEPTION 'Ungültige ISBN-13 Prüfziffer: %', NEW.ISBN;
			END IF;
		ELSE
			RAISE EXCEPTION 'ISBN muss 10 oder 13 Zeichen lang sein: %', NEW.ISBN;
		END IF;
	END IF;

	RETURN NEW;
END;
$$ LANGUAGE plpgsql;
-----------------------------------------------------------------------------------------------------------------

--------------------------TEST VALIDIERUNG ----------------------------------------------------------------------

--Test zur Pflichtfeld Titel und Text in ISBN in Tabelle BOOKS
INSERT INTO BOOKS (AuthorID, PubHouseID, CategoryID, LanguageID, ShippingID, PublicationYear, Titel, ISBN, BookCondition, Pages)
	VALUES 	(1, 1, 1, 5, 11, 1808, NULL, '0123456789', 'Neu', 200);
----------------------------------------------------------------------------------------------------------------

-- Falsche Prüfziffer (ISBN-13)
INSERT INTO BOOKS (AuthorID, PubHouseID, Titel, ISBN)
VALUES (1, 1, 'Falsche ISBN 13', '9783161484101');      -- letzte Ziffer falsch
---------------------------------------------------------------------------------------------------------------
--Ungültige Email in Teabell ADMINS eingügen

INSERT INTO ADMINS (Firstname, Surname, EMail)
VALUES ('Fehler', 'Admin', 'admin(at)email.de');  
---------------------------------------------------------------------------------------------------------------

--Reservierung über Jahreswechsel

INSERT INTO RESERVATIONS (BookID, UserID, ReservationFrom, ReservationUntill)
VALUES (1, 1, '2024-12-31 23:00:00', '2025-01-01 08:00:00');

--Prüfung: Daten korrekt gespeichert?
SELECT * FROM RESERVATIONS
WHERE ReservationFrom >= '2024-12-31 23:00:00' AND ReservationUntill <= '2025-01-01 08:00:00';
----------------------------------------------------------------------------------------------------------------

------------------INDEXIERUNG ERWEITERUNG----------------------------------------------------------------------
--Indexe anlegen----------------------------------------------------------------

--BOOKS: für häufige Filter nach Autor, Verlag, Kategorie, Sprache, Versand
CREATE INDEX idx_books_authorid     ON books (authorid);
CREATE INDEX idx_books_pubhouseid   ON books (pubhouseid);
CREATE INDEX idx_books_categoryid   ON books (categoryid);
CREATE INDEX idx_books_languageid   ON books (languageid);
CREATE INDEX idx_books_shippingid   ON books (shippingid);

--LOANS: häufig nach UserID und ReturnDate gesucht (z.B. offene Ausleihen)
CREATE INDEX idx_loans_userid_returndate ON loans (userid, returndate);

--RESERVATIONS: Suche nach UserID und BookID häufig sinnvoll
CREATE INDEX idx_reservations_userid ON reservations (userid);
CREATE INDEX idx_reservations_bookid ON reservations (bookid);

--ADDRESSES: Suche nach Ort/PLZ oder Verknüpfungen mit User/Verlag
CREATE INDEX idx_addresses_place   ON addresses (place);
CREATE INDEX idx_addresses_zipcode ON addresses (zipcode);
CREATE INDEX idx_addresses_userid  ON addresses (userid);
CREATE INDEX idx_addresses_pubhouseid ON addresses (pubhouseid);
----------------------------------------------------------------------------------------------------------------

---------------------------Materialized View----------------------------------------------------------------------

--Diese Materialized View speichert den aktuellen Zustand aller verfügbaren Bücher

CREATE MATERIALIZED VIEW available_books AS
SELECT b.*
FROM books b
LEFT JOIN loans l ON b.bookid = l.bookid AND (l.returndate IS NULL OR l.returndate > NOW())	--Buch ist ausgeliehen und noch nicht zurückgegeben 
																							--oder Rückgabedatum liegt in der Zukunft
LEFT JOIN reservations r ON b.bookid = r.bookid 											--Buch ist reserviert und 
                         AND NOW() BETWEEN r.reservationfrom AND r.reservationuntill		--die aktuelle Zeit liegt im Reservierungszeitraum
WHERE l.bookid IS NULL AND r.bookid IS NULL;				--kein aktiver Leihvorgang und keine aktive Reservierung vorhanden
----------------------------------------------------------------------------------------------------------------------------------------------------

-----------------------KOMPLEXE ABFRAGE-----------------------------------------------------------------------------------
--Komplexere Abfrage über mehrere Tabellen BOOKS, AUTHORS, USERS, SHIPPINGOPTIONS, ADRESSES,
--die noch nicht zurückgegebene Bücher filtert
SELECT
    B.BookID,
    B.Titel AS BookTitle,
    CONCAT(A.Firstname, ' ', A.Surname) AS AuthorName,
    CONCAT(U.Firstname, ' ', U.Surname) AS BorrowerName,
    L.LoanDate,
    (L.LoanDate + INTERVAL '1 day' * L.LoanPeriod) AS ExpectedReturnDate, --berechnet erwartete Rückgabe in Tagen
    S.ShippingOption,
    S.ShippmentStatus,
    A2.Street || ' ' || A2.HouseNo || ', ' || A2.ZIPCode || ' ' || A2.Place AS ShippingAddress
FROM
    LOANS L
JOIN BOOKS B ON L.BookID = B.BookID
JOIN AUTHORS A ON B.AuthorID = A.AuthorID
JOIN USERS U ON L.UserID = U.UserID
LEFT JOIN SHIPPINGOPTIONS S ON B.ShippingID = S.ShippingID
LEFT JOIN ADDRESSES A2 ON S.AddressID = A2.AddressID
WHERE
    L.ReturnDate IS NULL
ORDER BY
    L.LoanDate DESC;
--------------------------------------------------------------------------------------------------------------------------------------

----------------------M E T A D A T E N -------------------------------------------------------------------------------------------
--Anzahl der Tabellen im aktuellen Hauptschema _ public-Schema
SELECT COUNT(*) 
FROM information_schema.tables 
WHERE table_schema = 'public';
--------------------------------------------------------------
--Schätzung der aktuell vorhandenen Zeilen pro Tabelle (n_Live_tup)
--Für exakte Werte muss COUNT(*) verwendet werden, bei großen Tabellen kann
--es aber zu Performanceschwierigkeiten kommen
SELECT 
  relname AS table_name, 
  n_live_tup AS row_estimate
FROM pg_stat_user_tables
ORDER BY n_live_tup DESC;
-------------------------------------------------------------------
--Gesamtgröße der Datenbank in lesbaren Format

SELECT pg_size_pretty(pg_database_size(current_database())) AS db_size;
-----------------------------------------------------------------------------
--Speichergröße pro Tabelle inklusive Indexe, z.B. für die Identifizierung
--von großen Tabellen für mögliche Optimierung (durch REINDEX beispielsweise)

SELECT 
  relname AS table_name, 
  pg_size_pretty(pg_total_relation_size(relid)) AS total_size
FROM pg_catalog.pg_statio_user_tables 
ORDER BY pg_total_relation_size(relid) DESC;
-----------------------------------------------------------------------------
--Gesamtanzahl von Zeilen in der DB

SELECT SUM(n_live_tup) AS total_rows
FROM pg_stat_user_tables;
------------------------------------------------------------------------------
--Um Performance-Überwacheung oder Entscheidung für Optimierungsmaßnahmen zu erleichtern, 
--kann eine Abfrage zur Vacuum- oder Analyse-Zeitpunkt durchgeführt werden:
--VACUUM - Durch Updates oder Delets entstandene "tote" Tupel werden entfernt
--ANALYZE - Statistikdaten über die Tabelleninhalte werden gesammelt
SELECT 
  relname AS table_name,
  last_vacuum,
  last_autovacuum,
  last_analyze,
  last_autoanalyze
FROM pg_stat_user_tables;
---------------------------------------------------------------------------------------
--Abfrage der Größe der Tabelle Books mit und ohne Indexe

SELECT 
  pg_size_pretty(pg_relation_size('BOOKS')) AS nur_tabelle,
  pg_size_pretty(pg_total_relation_size('BOOKS')) AS tabelle_inkl_indexe;
  
------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------