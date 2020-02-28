-- ===========================================================================
-- Author: Josh Novikoff
-- Create date: 2/28/2020
-- Description: This program creates database tables and test user/login
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
	lname		VARCHAR(60) NOT NULL,
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
	returned_date	DATE NOT NULL,
	PRIMARY KEY (borrower_id, disk_id, borrowed_date)
);

--Drop & Create login/user
IF USER_ID('diskUserjn') IS NULL
		CREATE LOGIN diskUserjn WITH PASSWORD = 'Pa$$w0rd',
		DEFAULT_DATABASE = disk_inventoryJN;

DROP USER IF EXISTS diskUserjn;

CREATE USER diskUserjn FOR LOGIN diskUserjn;

--Grant read permission to user
ALTER ROLE db_datareader ADD MEMBER diskUserjn;