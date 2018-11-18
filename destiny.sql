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
CREATE TABLE employee (
  fname     varchar2(15), 
  minit     char,
  lname     varchar2(15),
  ssn       char(9) PRIMARY KEY,
  bdate     date,
  address   varchar2(30),
  sex       char,
  salary    number(10,2),
  super_ssn char(9),
  dno       number(4)
);