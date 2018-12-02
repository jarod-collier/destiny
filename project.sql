SPOOL project.out
SET ECHO ON
/*
CIS 353 - Database Design Project
Jarod Collier
Randy Nguyen
Josef Hartsough
Josh Weinmann
Nick Sheehan
*/
--
-- Drop the tables (in case they already exist)
--
DROP TABLE player CASCADE CONSTRAINTS;
DROP TABLE raid CASCADE CONSTRAINTS;
DROP TABLE raid_obstacle CASCADE CONSTRAINTS;
DROP TABLE quests CASCADE CONSTRAINTS;
DROP TABLE obtains CASCADE CONSTRAINTS;
DROP TABLE strike CASCADE CONSTRAINTS;
DROP TABLE planet CASCADE CONSTRAINTS;
--
-- Create the tables
--
CREATE TABLE planet (
  name 		char(10) PRIMARY KEY,
  material 	varchar2(20),
  enemType	varchar2(10)
);
CREATE TABLE raid (
  name		char(25) PRIMARY KEY,
  dfclty	varchar2(10),
  antgnst	varchar2(10),
  sect	varchar2(18),
  recLevel	integer,
  Pname char(10),
  charAmt	integer,
  CONSTRAINT fk_raidToPlanet FOREIGN KEY (Pname) REFERENCES planet(name)
);
CREATE TABLE raid_obstacle (
  name 		char(25),
  obstacle	varchar2(25),
  CONSTRAINT fk_obstacleToRaid FOREIGN KEY (name) REFERENCES raid(name),
  PRIMARY KEY (name, obstacle)
);
CREATE TABLE quests (
  Qname 	char(25),
  Pname 	char(10),
  objective	varchar2(20),
  timer		integer,
  CONSTRAINT fk_questsToPlanet FOREIGN KEY (Pname) REFERENCES planet(name),
  PRIMARY KEY (Qname, Pname)
);
CREATE TABLE obtains (
  username	char(10),
  Pname 	char(10),
  Qname 	char(25),
  PRIMARY KEY (username, Pname, Qname)
);
CREATE TABLE strike (
  name 		char(25) PRIMARY KEY,
  boss		varchar2(25),
  dfclty	varchar2(10),
  pname		char(10),
  charAmt	integer,
  CONSTRAINT fk_strikeToPlanet FOREIGN KEY (Pname) REFERENCES planet(name)
);
CREATE TABLE player (
  username  char(10) PRIMARY KEY, 
  hp	    integer,
  strength  integer,
  speed		integer,
  lvl	    integer,
  strName	char (25),
  raidName	char(25),
  CONSTRAINT player_strike FOREIGN KEY (strName) REFERENCES strike(name),
  CONSTRAINT player_raid FOREIGN KEY (raidName) REFERENCES raid(name),
/*
IC1: The player's strength and speed cannot sum to be greater than 100.
*/ 
CONSTRAINT IC1 CHECK ((strength + speed) < 101),
/*
IC2: The player's hp must not be positive.
*/
CONSTRAINT IC2 CHECK (hp >= 0)
);
--
SET FEEDBACK OFF
--
-- Add the planets
--
INSERT INTO planet values ('Earth', 'Spin Metal', 'Hive');
INSERT INTO planet values ('Moon', 'Helium Fragments', 'Fallen');
INSERT INTO planet values ('Venus', 'Spirit Bloom' , 'Vex');
INSERT INTO planet values ('Mars', 'Relic Iron', 'Cabal');
--
-- Add the raids
--
insert into raid values ('Vault of Glass', 'Easy', 'Atheon', 'Ishtar Sink', 26, 'Venus', 4);
insert into raid values ('Crota''s End', 'Normal', 'Crota', 'Ocean of Storms', 33, 'Moon', 4);
insert into raid values ('King''s Fall', 'Hard', 'Oryx', 'Dreadnaught', 38, 'Mars', 4);
insert into raid values ('Wrath of the Machine', 'Legendary', 'Aksis', 'Foundary 113', 40, 'Earth', 4);
--
-- Add the raid_obstacle
--
insert into raid_obstacle values ('Vault of Glass', 'Time''s Conflux');
insert into raid_obstacle values ('Vault of Glass', 'The Spire');
insert into raid_obstacle values ('Vault of Glass', 'The Templar');
insert into raid_obstacle values ('Crota''s End', 'The Bridge');
insert into raid_obstacle values ('Crota''s End', 'The Hellmouth');
insert into raid_obstacle values ('Crota''s End', 'The Stills');
insert into raid_obstacle values ('King''s Fall', 'Hall of Souls');
insert into raid_obstacle values ('King''s Fall', 'The Warpriest');
insert into raid_obstacle values ('King''s Fall', 'Golgoroth''s Cellar');
insert into raid_obstacle values ('Wrath of the Machine', 'Siege Engine');
insert into raid_obstacle values ('Wrath of the Machine', 'Vosik Phase 1');
insert into raid_obstacle values ('Wrath of the Machine', 'Aksis Phase1');

--
-- Add the strikes      
--
INSERT INTO strike values ('The Abomination Heist', 'Hive Abomination', 'Normal', 'Moon', 3);
INSERT INTO strike values ('Fallen Saber', 'SABER 2', 'Easy', 'Earth', 3);
INSERT INTO strike values ('Dust Palace', 'Vatch', 'Normal', 'Mars', 3);
INSERT INTO strike values ('Echo Chamber', 'Theosyion', 'Hard', 'Venus', 3);
INSERT INTO strike values ('Winter''s Run', 'Aksor', 'Hard', 'Venus', 3);
INSERT INTO strike values ('The Undying Mind', 'The Undying Mind', 'Normal', 'Mars', 3);
INSERT INTO strike values ('The Shadow Thief', 'Taniks Perfected', 'Normal', 'Moon', 3);
INSERT INTO strike values ('The Will of Crotia', 'Omnigul', 'Easy', 'Earth', 3);    
-- 
--
-- Add the quests
--
insert into quests values ('Bounty Hunter', 'Earth', 'Eliminate Target',	25);
insert into quests values ('Patrols 101', 'Earth', 'Patrol',	15);
insert into quests values ('The mountaintop', 'Earth', 'Eliminate enemies',	10);
insert into quests values ('High-Value Targets', 'Earth', 'Eliminate Target',	20);
insert into quests values ('A Cry for Help', 'Moon', 'Defend Objective',	10);
insert into quests values ('Retaliation', 'Moon', 'Attack objective',	25);
insert into quests values ('Neverending Battle', 'Venus', 'Eliminate enemies',	30);
insert into quests values ('Back in the Saddle', 'Venus', 'Attack objective',	20);
insert into quests values ('Flameforged', 'Venus', 'Eliminate Target',	20);
insert into quests values ('Successor to the Throne', 'Mars', 'Defend Objective', 25);
insert into quests values ('Conquer the Day', 'Mars', 'Eliminate enemies',	35);
insert into quests values ('Lost and Found', 'Mars', 'Collect Items',	15);

--
-- Add the obtains
--
insert into obtains values ('Farmer', 'Earth', 'Patrols 101');
insert into obtains values ('Butcher', 'Earth', 'Bounty Hunter');
insert into obtains values ('Pawn', 'Earth', 'The mountaintop');
insert into obtains values ('Servant', 'Earth', 'High-Value Targets');
insert into obtains values ('Minion', 'Moon', 'A Cry for Help');
insert into obtains values ('Assassin', 'Moon', 'Retaliation');
insert into obtains values ('Knight', 'Venus', 'Back in the Saddle');
insert into obtains values ('Bishop', 'Venus', 'Neverending Battle');
insert into obtains values ('Lancer', 'Venus', 'Flameforged');
insert into obtains values ('Archer', 'Mars', 'Successor to the Throne');
insert into obtains values ('Rook', 'Mars', 'Conquer the Day');
insert into obtains values ('Ruler', 'Mars', 'Lost and Found');
--
-- Add the players
--
insert into player values ('Farmer', 5, 15, 10, 1, NULL, NULL);
insert into player values ('Butcher', 5, 20, 5, 1, NULL, NULL);
insert into player values ('Pawn', 15, 10, 15, 3, 'The Will of Crotia', NULL);
insert into player values ('Servant', 45, 12, 13, 9, 'The Will of Crotia', NULL);
insert into player values ('Minion', 95, 30, 20, 19, 'The Will of Crotia', 'Vault of Glass');
insert into player values ('Assassin', 110, 20, 55, 22, NULL, 'Vault of Glass');
insert into player values ('Knight', 125, 5, 70, 25, NULL, 'Vault of Glass');
insert into player values ('Bishop', 135, 25, 50, 27, 'Dust Palace', NULL);
insert into player values ('Lancer', 150, 55, 20, 30, NULL, 'Vault of Glass');
insert into player values ('Archer', 165, 50, 50, 33,'Dust Palace', NULL);
insert into player values ('Rook', 180, 50, 50, 36, NULL, 'Crota''s End');
insert into player values ('Ruler', 200, 30, 70, 40, 'Dust Palace',	'Crota''s End');
insert into player values ('Queen', 200, 50, 50, 40, NULL, 'Crota''s End');
insert into player values ('King', 200, 90, 10, 40, NULL, 'Crota''s End');

SET FEEDBACK ON
SET LINESIZE 32000
COMMIT;
--
-- ONE QUERY PER TABLE TO PRINT OUT DATABASE
--
SELECT * FROM player;
SELECT * FROM raid;
SELECT * FROM raid_obstacle;
SELECT * FROM quests;
SELECT * FROM obtains;
SELECT * FROM strike;
SELECT * FROM planet;
--
--Q1 A join involving at least four relations
-- Find the username, level, quest name, objective, and enemy type
-- of players to show who is on what quest, the enemy they are fighting, 
-- and their objective for the quest
--
SELECT u.username, u.lvl, q.Qname, q.objective, p.enemType
FROM player u, obtains o, quests q, planet p
WHERE u.username = o.username AND o.Qname = q.Qname AND
	q.Pname = p.name;
--
--Q2 A self-join
--Finds the username and level of players that have equal strength but one 
--player has a higher level. Orderded by level
--
SELECT p1.username, p2.username, p1.lvl, p2.lvl
FROM player p1, player p2
WHERE p1.strength = p2.strength AND p1.lvl > p2.lvl
ORDER BY p1.lvl;
--
----Q4 SUM, AVG, MAX, and/or MIN
--Finds the username, strength, and level of players that have greater than 
--average strength of all players (average strength = 33). Ordered by strength.
--
SELECT p.username, p.strength, p.lvl
FROM player p
WHERE p.strength > (SELECT AVG(p2.strength)
	FROM player p2)
ORDER BY p.strength;
--
----Q5 GROUP BY, HAVING, and ORDER BY, all appearing in the same query
-- Finding levels that have more than one player at that level
--
SELECT lvl, COUNT(*)
FROM player
GROUP BY lvl
HAVING COUNT(*) > 1
ORDER BY lvl;
--
----Q6 A correlated subquery
-- Find the raid name and strength from the player 
-- where the highest strength on a raid
--
SELECT p.raidName, p.strength
FROM player p
WHERE p.strength = (SELECT MAX(p2.strength)
	FROM player p2
	WHERE p.raidName = p2.raidName)
ORDER BY p.strength;
--
----Q8 A relational DIVISION query
----Q3 UNION, INTERSECT, and/or MINUS
-- This will give us all of the raids that do not have any players on them
--
SELECT *
FROM raid r
WHERE EXISTS ((SELECT r1.name
  FROM raid r1
  WHERE r1.name = r.name)
  MINUS
  (SELECT p.raidName
    FROM player p
    WHERE p.raidName = r.name));
--
--Q9 An outer join query
-- Find the strike name, the planet name, and the enemy type 
-- of the strikes and combines it with planetsso that you can see 
-- what the enemy type is.
--
SELECT s.name, p.name, p.enemType
FROM planet p, strike s
WHERE p.name = s.pname
ORDER BY s.name;
--
----Q10 A RANK query
-- Finds the rank of a player with level 25 from the top
--
SELECT RANK (25) WITHIN GROUP
  (ORDER BY lvl desc) "Level Rank"
FROM player;
--
--Q11 A Top-N query
--Q7 A non-correlated subquery
-- Find the quest name, the timer, and the objective 
-- to show the 4 quests that take the most amount of time
--
SELECT Qname, timer, objective
FROM (SELECT *
  FROM quests
  ORDER BY timer desc)
WHERE ROWNUM < 5;
--
-- Testing: <IC1> to show that strength and speed is not greater than 100
insert into player values ('Superman' , 1000, 1000, 1000, 40, NULL, NULL);
-- Testing: <IC2> to show that player's health cannot be negative
insert into player values ('Corpse', -2, 1, 1, 3, NULL, NULL);
-- Testing: <player primary key> constraint for player table
insert into planet values('Earth', 'Boss', 'Humans');
-- Testing: <fk_strikeToPlanet> foreign key constraint for strike name
insert into player values ('Person' , 1, 10, 10, 4, 'str_name', NULL);
--
COMMIT;
--
SPOOL OFF
