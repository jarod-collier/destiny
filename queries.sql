--Q1 A join involving at least four relations



--Q2 A self-join

SELECT p1.username, p2.username, p1.lvl, p2.lvl
FROM players p1, players.p2
WHERE p1.strength = p2.strength AND p1.lvl > p2.lvl
ORDER BY p1.lvl;

--Q4 SUM, AVG, MAX, and/or MIN

SELECT p.username, p.stregth, p.lvl
FROM players p
WHERE p1.stength > (MAX(p1.strength))
ORDER BY p.strength;

--Q5 GROUP BY, HAVING, and ORDER BY, all appearing in the same query

SELECT name, dfclty
FROM strike
WHERE charAmt = 3
GROUP BY dfclty
HAVING COUNT(*) > 2
ORDER BY dfclty;

--Q6 A correlated subquery

SELECT p.raidName, p.strength
FROM player p
WHERE p.stregth = (SELECT MAX(p2.strength)
  FROM player p2
  WHERE p.raidName = p2.raidName
  AND p.strength = p2. strength)
ORDER BY p.strength;

--Q8 A relational DIVISION query
--Q3 UNION, INTERSECT, and/or MINUS

SELECT *
FROM raid r
WHERE EXISTS ((SELECT r1.name
  FROM raid r1
  WHERE r1.name = r.name)
  MINUS
  (SELECT p.raidName
    FROM player p
    WHERE p.raidName = r.name));

--Q9 An outer join query

SELECT s.name, p.name, p.enemType
FROM planets p, strikes s
WHERE p.name = s.pname
ORDER BY s.name;

--Q10 A RANK query

SELECT RANK (25) WITHIN GROUP
  (ORDER BY lvl) "Level Rank"
FROM players;

--Q11 A Top-N query
--Q7 A non-correlated subquery

SELECT q.qname, q.timer, q.objective
FROM (SELECT *
  FROM quests
  ORDER BY timer desc)
WHERE ROWNUM < 5;
