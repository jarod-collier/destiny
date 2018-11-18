-- File: destiny.sql
--
/* This command file creates and populates the Destiny database. 
*/
--
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













