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

SELECT Qname, timer, objective
FROM (SELECT *
  FROM quests
  ORDER BY timer desc)
WHERE ROWNUM < 5;
