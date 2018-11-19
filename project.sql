SPOOL project.out
SET ECHO ON
/*
CIS 353 - Database Design Project
Jarod Collier
Randy Nguyen
Josef Hartsough
Josh Weinmann
Nick Shaheen
*/
--< The SQL/DDL code that creates your schema >
--In the DDL, every IC must have a unique name; e.g. IC5, IC10, IC15, etc.

-- Drop the tables (in case they already exist)
--
DROP TABLE player CASCADE CONSTRAINTS;
DROP TABLE raid CASCADE CONSTRAINTS;
DROP TABLE raid_section CASCADE CONSTRAINTS;
DROP TABLE quests CASCADE CONSTRAINTS;
DROP TABLE found_on CASCADE CONSTRAINTS;
DROP TABLE strike CASCADE CONSTRAINTS;
DROP TABLE planet CASCADE CONSTRAINTS;
--
-- Create the tables
--
CREATE TABLE player (
  username  char(15) PRIMARY KEY, 
  hp	    integer,
  strength  integer,
  speed		integer,
  lvl	    integer,
  strName	varchar2(20),
  raidName	varchar2(20)
);
CREATE TABLE raid (
  name		char(20) PRIMARY KEY,
  dfclty	varchar2(20),
  antgnst	varchar2(20),
  obstacle	varchar2(20),
  recLevel	integer,
  charAmt	integer
);
CREATE TABLE raid_section (
  name 		char(20) PRIMARY KEY,
  section	char(20) PRIMARY KEY
);
CREATE TABLE quests (
  Qname 	char(20) PRIMARY KEY,
  Pname 	char(20) PRIMARY KEY,
  objective	varchar2(20),
  timer		integer,
  username	varchar2(20)
);
CREATE TABLE found_on (
  Pname 	char(20) PRIMARY KEY,
  Qname 	char(20) PRIMARY KEY
);
CREATE TABLE strike (
  name 		char(20) PRIMARY KEY,
  boss		varchar2(20),
  dfclty	varchar2(20),
  pname		varchar2(20),
  charAmt	integer
);
CREATE TABLE planet (
  name 		char(20) PRIMARY KEY,
  material 	varchar2(20),
  enemType	varchar2(20),
  enviro	varchar2(20)
);
--
--
SET FEEDBACK OFF
-- < The INSERT statements that populate the tables>
--
-- Add the players
--
insert into player values ('Farmer', '5', '15',	'10',	'1', NULL,	NULL);
insert into player values ('Butcher',	'5',	'20',	'5',	'1',	NULL,	NULL);
insert into player values ('Pawn',	'15',	'10',	'15',	'3',	'The Will of Crotia',	NULL);
insert into player values ('Servant',	'45',	'12',	'13',	'9',	'The Will of Crotia',	NULL);
insert into player values ('Minion',	'95',	'30',	'20',	'19',	'The Will of Crotia',	'Vault of Glass');
insert into player values ('Assassin',	'110',	'20',	'55',	'22',	NULL,	'Vault of Glass');
insert into player values ('Knight',	'125',	'5',	'70',	'25',	NULL,	'Vault of Glass');
insert into player values ('Bishop',	'135',	'25',	'50',	'27',	'Dust Palace',	NULL);
insert into player values ('Lancer',	'150',	'55',	'20', '30',	NULL,	'Vault of Glass');
insert into player values ('Archer',	'165',	'50',	'50', '33',	'Dust Palace',	NULL);
insert into player values ('Rook',	'180',	'50',	'50',	'36',	NULL,	'Crota\'s End');
insert into player values ('Ruler',	'200',	'30',	'70',	'40',	'Dust Palace',	'Crota\'s End');
insert into player values ('Queen',	'200',	'50',	'50',	'40',	NULL,	'Crota\'s End');
insert into player values ('King',	'200',	'90',	'10',	'40',	NULL,	'Crota\'s End');
--
-- Add the raids
--
insert into raid values ('Vault of Glass', 'easy', 'Atheon', 'Ishtar Sink', 26, 'Venus', 4);
insert into raid values ('Crota\s End', 'Normal', 'Crota', 'Ocean of Storms', 33, 'Moon', 4);
insert into raid values ('King\'s Fall', 'Hard', 'Oryx', 'Dreadnaught', 38, 'Mars', 4);
insert into raid values ('Wrath of the Machine', 'Legendary', 'Aksis', 'Foundary 113', 40, 'Earth', 4);
--
-- Add the raid_sections
--
insert into raid_section values ('Vault of Glass', 'Time\'s Conflux');
insert into raid_section values ('Vault of Glass', 'The Spire');
insert into raid_section values ('Vault of Glass', 'The Templar');
insert into raid_section values ('Crota\'s End', 'The Bridge');
insert into raid_section values ('Crota\'s End', 'The Hellmouth');
insert into raid_section values ('Crota\'s End', 'The Stills');
insert into raid_section values ('King\'s Fall', 'Hall of Souls');
insert into raid_section values ('King\'s Fall', 'The Warpriest');
insert into raid_section values ('King\'s Fall', 'Golgoroth\'s Cellar');
insert into raid_section values ('Wratch of the Machine', 'Siege Engine');
insert into raid_section values ('Wratch of the Machine', 'Vosik Phase 1');
insert into raid_section values ('Wratch of the Machine', 'Aksis Phase1');
--
-- Add the planets
--
INSERT INTO planet ('Earth', 'Spin Metal', 'Hive');
INSERT INTO planet ('Moon', 'Helium Fragments', 'Fallen');
INSERT INTO planet ('Venus', 'Spirit Bloom' , 'Vex');
INSERT INTO planet ('Mars', 'Relic Iron', 'Cabal');
--
-- Add the strikes      
--
INSERT INTO strike ('The Abomination Heist', 'Hive Abomination', 'Normal', 'Moon', 3);
INSERT INTO strike ('Fallen Saber', 'SABER 2', 'Easy', 'Earth', 3);
INSERT INTO strike ('Dust Palace', 'Vatch', 'Normal', 'Mars', 3);
INSERT INTO strike ('Echo Chamber', 'Theosyion', 'Hard', 'Venus', 3);
INSERT INTO strike ('Winter\'s Run', 'Aksor', 'Hard', 'Venus', 3);
INSERT INTO strike ('The Undying Mind', 'The Undying Mind', 'Normal', 'Mars', 3);
INSERT INTO strike ('The Shadow Thief', 'Taniks Perfected', 'Normal', 'Moon', 3);
INSERT INTO strike ('The Will of Crotia', 'Omnigul', 'Easy', 'Earth', 3);    
-- 
--                           
SET FEEDBACK ON
COMMIT;
--
--
-- ONE QUERY PER TABLE TO PRINT OUT DATABASE
SELECT * FROM players;
SELECT * FROM raid;
SELECT * FROM raid_section;
SELECT * FROM quests;
SELECT * FROM found_on;
SELECT * FROM strike;
SELECT * FROM planet;
--
--
-- < The SQL queries>. Include the following for each query:
-- 1. A comment line stating the query number and the feature(s) it demonstrates
-- (e.g. – Q25 – correlated subquery).
-- 2. A comment line stating the query in English.
-- 3. The SQL code for the query.
-- --
-- --
-- < The insert/delete/update statements to test the enforcement of ICs >
-- Include the following items for every IC that you test (Important: see the next section titled
-- “Submit a final report” regarding which ICs to test).
-- A comment line stating: Testing: < IC name>
-- A SQL INSERT, DELETE, or UPDATE that will test the IC.

COMMIT;
--

SPOOL OFF
