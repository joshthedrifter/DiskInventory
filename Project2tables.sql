-- ===========================================================================
-- Author: Josh Novikoff
-- Create date: 2/28/2020
-- Description: This program creates database tables and test user/login

--2/28/2020 Josh	Initial Deployment
--3/5/2020	Josh	Added inserts to all tables.
-- ===========================================================================

use master;
go
-- Remove and create database
drop database IF EXISTS disk_inventoryJN;
go

create database disk_inventoryJN;
go

use disk_inventoryJN;
go
--Create Tables
CREATE TABLE genre (
	genre_id	INT NOT NULL PRIMARY KEY IDENTITY,
	description VARCHAR(60) NOT NULL
);

CREATE TABLE status (
	status_id	INT NOT NULL PRIMARY KEY IDENTITY,
	description VARCHAR(60) NOT NULL
);

CREATE TABLE disk_type (
	disk_type_id INT NOT NULL PRIMARY KEY IDENTITY,
	description VARCHAR(60) NOT NULL
);

CREATE TABLE artist_type (
	artist_type_id	INT NOT NULL PRIMARY KEY IDENTITY,
	description		VARCHAR(60) NOT NULL
);

CREATE TABLE borrower (
	borrower_id		INT NOT NULL PRIMARY KEY IDENTITY,
	fname			VARCHAR(60) NOT NULL,
	lname			VARCHAR(60) NOT NULL,
	phone_num		VARCHAR(60) NOT NULL
);

CREATE TABLE artist (
	artist_id	INT NOT NULL PRIMARY KEY IDENTITY,
	fname		VARCHAR(60) NOT NULL,
	lname		VARCHAR(60) NULL,
	artist_type_id	INT NOT NULL REFERENCES artist_type(artist_type_id)
);

CREATE TABLE disk (
	disk_id		INT NOT NULL PRIMARY KEY IDENTITY,
	disk_name	VARCHAR(60) NOT NULL,
	release_date DATE NOT NULL,
	genre_id	INT NOT NULL REFERENCES genre(genre_id),
	status_id	INT NOT NULL REFERENCES status(status_id),
	disk_type_id INT NOT NULL REFERENCES disk_type(disk_type_id)
);

CREATE TABLE disk_has_artist (
	disk_id		INT NOT NULL REFERENCES disk(disk_id),
	artist_id	INT NOT NULL REFERENCES artist(artist_id),
	PRIMARY KEY (disk_id, artist_id)
);

CREATE TABLE disk_has_borrower (
	borrower_id		INT NOT NULL REFERENCES borrower(borrower_id),
	disk_id			INT NOT NULL REFERENCES disk(disk_id),
	borrowed_date	DATE NOT NULL,
	returned_date	DATE null,
	PRIMARY KEY (borrower_id, disk_id, borrowed_date)
);

--Drop & Create login/user
IF SUSER_ID('diskUserjn') IS NULL
		CREATE LOGIN diskUserjn WITH PASSWORD = 'Pa$$w0rd',
		DEFAULT_DATABASE = disk_inventoryJN;

DROP USER IF EXISTS diskUserjn;

CREATE USER diskUserjn FOR LOGIN diskUserjn;

--Grant read permission to user
ALTER ROLE db_datareader ADD MEMBER diskUserjn;

--Project 3
--Insert disk status
USE [disk_inventoryJN]
GO

INSERT INTO [dbo].[status]
           ([description])
     VALUES
           ('Available'),
		   ('On Loan'),
		   ('Damaged'),
		   ('Missing')
GO
--Insert music genres

INSERT INTO [dbo].[genre]
           ([description])
     VALUES
           ('Classic Rock'),
		   ('Country'),
		   ('Jazz'),
		   ('AltRock'),
		   ('Metal')
GO
--Insert music formats


INSERT INTO [dbo].[disk_type]
           ([description])
     VALUES
           ('CD'),
		   ('Vinyl'),
		   ('8Track'),
		   ('Cassette'),
		   ('DVD')
GO

USE [disk_inventoryJN]
GO
--Insert artist types
INSERT INTO [dbo].[artist_type]
           ([description])
     VALUES
           ('Solo'),
		   ('Group')
GO
--Insert disk rows part c


INSERT INTO [dbo].[disk]
           ([disk_name]
           ,[release_date]
           ,[genre_id]
           ,[status_id]
           ,[disk_type_id])
     VALUES
           ('Crazy Train', '1/1/1995',1,1,1),
		   ('No More Tears', '11/21/1995',1,1,1),
		   ('Red', '11/13/2008',2,2,1),
		   ('Jagged Little Pill', '1/15/1995',1,2,1),
		   ('Candy-O', '10/10/1992',1,2,2),
		   ('Hotel California', '11/1/1977',1,2,2),
		   ('One of These Nights', '4/1/1975',1,2,2),
		   ('The Long Run', '10/21/1979',1,2,2),
		   ('Hints, Allegations, and Things Left Unsaid', '1/21/1999',4,2,1),
		   ('Blender', '1/29/2000',4,1,1),
		   ('Dirt', '1/27/1992',4,1,2),
		   ('Unplugged', '5/23/1996',4,1,2),
		   ('Facelift', '8/22/1990',4,1,2),
		   ('Black Gives Way to Blue', '11/21/2009',4,1,2),
		   ('Live', '11/11/2009',4,1,2),
		   ('Ten', '12/1/1991',4,1,2),
		   ('Vitalogy', '3/22/1994',4,1,2),
		   ('No Code', '4/20/1996',4,1,2),
		   ('Backspacer', '5/21/2009',4,1,2),
		   ('Home', '1/19/1995',1,2,1)
GO

UPDATE disk
SET release_date = '11/11/2011'
WHERE disk_id = 20;
GO

--Insert borrower rows part d

INSERT INTO [dbo].[borrower]
           ([fname],[lname],[phone_num])
     VALUES
           ('Mickey', 'Mouse', '111-111-1234'),
		   ('Minnie', 'Mouse', '111-222-1234'),
		   ('Daisy', 'Duck', '123-111-1234'),
		   ('Daffy', 'Duck', '444-111-1234'),
		   ('Donald', 'Duck', '555-111-1234'),
		   ('Huey', 'Duck', '666-111-1234'),
		   ('Duey', 'Duck', '777-111-1234'),
		   ('Louie', 'Duck', '888-111-1234'),
		   ('Elmer', 'Fudd', '999-111-1234'),
		   ('Buzz', 'Lightyear', '122-111-1234'),
		   ('Sheriff', 'Woody', '133-111-1234'),
		   ('Little Bo', 'Peep', '144-111-1234'),
		   ('Slinky', 'Dog', '155-111-1234'),
		   ('Mr. Potato', 'Head', '166-111-1234'),
		   ('Mr.', 'Spell', '177-111-1234'),
		   ('Race', 'Car', '188-111-1234'),
		   ('T', 'Rex', '199-111-1234'),
		   ('Mrs. Potato', 'Head', '211-111-1234'),
		   ('Sargeant', 'Soldier', '311-111-1234'),
		   ('Jessie', 'Cowgirl', '411-111-1234')
GO
--Delete the last borrower
DELETE borrower
where borrower_id = 20;
--Insert Artist rows part e


INSERT INTO [dbo].[artist]
           ([fname]
           ,[lname]
           ,[artist_type_id])
     VALUES
           ('Ozzy', 'Osbourne',1),
		   ('Willie', 'Nelson',1),
		   ('Taylor', 'Swift',1),
		   ('Alanis', 'Morrisette',1),
		   ('Chris', 'Daughtry',1),
		   ('The Cars', null,2),
		   ('Black Sabbath', null,2),
		   ('The Eagles', 'null',2),
		   ('Patsy', 'Cline',1),
		   ('Pearl Jam', null,2),
		   ('Shinedown', null,2),
		   ('Collective Soul', null,2),
		   ('Five Finger Death Punch', null,2),
		   ('Disturbed', null,2),
		   ('Stone Temple Pilots', null,2),
		   ('Breaking Benjamin', null,2),
		   ('Seether', null,2),
		   ('Audioslave', null,2),
		   ('Temple of the Dog', null,2),
		   ('Alice in Chains', null,2)
GO
--Insert disk has borrower rows

INSERT INTO [dbo].[disk_has_borrower]
           ([borrower_id]
           ,[disk_id]
           ,[borrowed_date]
           ,[returned_date])
     VALUES
           (2,4, '1-2-2019', '2-20-2019'),
		   (3,5, '11-12-2019', '12-21-2019'),
		   (3,6, '1-22-2019', '2-22-2019'),
		   (2,7, '7-22-2019', '8-20-2019'),
		   (5,2, '10-2-2019', '12-20-2019'),
		   (5,7, '4-2-2019', '5-20-2019'),
		   (5,7, '8-22-2019', '9-22-2019'),
		   (5,8, '11-2-2019', '12-20-2019'),
		   (11,14, '7-26-2019', null),
		   (12,15, '8-25-2019', '9-26-2019'),
		   (13,15, '10-24-2019', '11-20-2019'),
		   (14,11, '10-23-2019', '11-26-2019'),
		   (15,11, '11-22-2018', '12-2-2018'),
		   (15,12, '12-12-2018', null),
		   (8,8, '3-21-2019', '6-23-2019'),
		   (9,4, '4-2-2019', '7-20-2019'),
		   (10,9, '5-25-2019', '6-22-2019'),
		   (4,3, '6-2-2019', '7-29-2019'),
		   (7,4, '1-22-2019', '2-22-2019'),
		   (2,14, '5-12-2019', '6-2-2019')
GO
--Insert disk has artist rows
USE [disk_inventoryJN]
GO

INSERT INTO [dbo].[disk_has_artist]
           ([disk_id]
           ,[artist_id])
     VALUES
           (1,1),
		   (2,1),
		   (3,3),
		   (4,4),
		   (5,6),
		   (6,8),
		   (7,8),
		   (8,8),
		   (8,6),
		   (8,7),
		   (9,12),
		   (10,12),
		   (11,18),
		   (12,16),
		   (13,15),
		   (14,15),
		   (15,12),
		   (15,15),
		   (16,16),
		   (17,17)
GO
--list the disks on loan that have not been returned
SELECT borrower_id as Borrower_id, disk_id as Disk_id, borrowed_date as Borrowed_date, returned_date as Return_date
FROM disk_has_borrower
WHERE returned_date IS NULL;