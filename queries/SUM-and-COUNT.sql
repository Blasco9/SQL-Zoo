-- 1
SELECT
  SUM(population)
FROM world;
-- 2
SELECT
  DISTINCT continent
FROM world;
-- 3
SELECT
  SUM(gdp)
FROM world
WHERE
  continent = 'Africa';
-- 4
SELECT
  COUNT(name)
FROM world
WHERE
  area >= 1000000;
-- 5
SELECT
  SUM(population)
FROM world
WHERE
  name IN ('Estonia', 'Latvia', 'Lithuania');
-- 6
SELECT
  DISTINCT continent,
  (
    SELECT
      COUNT(name)
    FROM world y
    WHERE
      x.continent = y.continent
  )
FROM world x;
-- 7
SELECT
  DISTINCT continent,
  (
    SELECT
      COUNT(name)
    FROM world y
    WHERE
      x.continent = y.continent
      AND population >= 10000000
  )
FROM world x;
-- 8
SELECT
  DISTINCT continent
FROM world x
WHERE
  (
    SELECT
      SUM(population)
    FROM world y
    WHERE
      x.continent = y.continent
  ) >= 100000000;