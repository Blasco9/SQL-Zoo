-- 1
SELECT
  name
FROM world
WHERE
  population > (
    SELECT
      population
    FROM world
    WHERE
      name = 'Russia'
  );
-- 2
SELECT
  name
FROM world
WHERE
  continent = 'Europe'
  AND gdp / population > (
    SELECT
      gdp / population
    FROM world
    WHERE
      name = 'United Kingdom'
  );
-- 3
SELECT
  name,
  continent
FROM world
WHERE
  continent = (
    SELECT
      continent
    FROM world
    WHERE
      name = 'Argentina'
  )
  OR continent = (
    SELECT
      continent
    FROM world
    WHERE
      name = 'Australia'
  )
ORDER BY
  name;
-- 4
SELECT
  name,
  population
FROM world
WHERE
  population > (
    SELECT
      population
    FROM world
    WHERE
      name = 'Canada'
  )
  AND population < (
    SELECT
      population
    FROM world
    WHERE
      name = 'Poland'
  );
-- 5
SELECT
  name,
  CONCAT(
    ROUND(
      population * 100 /(
        SELECT
          population
        FROM world
        WHERE
          name = 'Germany'
      ),
      0
    ),
    '%'
  )
FROM world
WHERE
  continent = 'Europe';
-- 6
SELECT
  name
FROM world
WHERE
  gdp > ALL(
    SELECT
      gdp
    FROM world
    WHERE
      continent = 'Europe'
      AND gdp > 0
  );
-- 7
SELECT
  continent,
  name,
  area
FROM world x
WHERE
  area >= ALL(
    SELECT
      area
    FROM world y
    WHERE
      y.continent = x.continent
  );
-- 8
SELECT
  DISTINCT continent,
  (
    SELECT
      name
    FROM world y
    WHERE
      y.continent = x.continent
    LIMIT
      1
  )
FROM world x;
-- 9
SELECT
  name,
  continent,
  population
FROM world
WHERE
  continent IN(
    SELECT
      DISTINCT continent
    FROM world x
    WHERE
      25000000 >= ALL(
        SELECT
          population
        FROM world y
        WHERE
          x.continent = y.continent
      )
  );
-- 10
SELECT
  name,
  continent
FROM world x
WHERE
  population > ALL(
    SELECT
      population * 3
    FROM world y
    WHERE
      x.continent = y.continent
      AND x.name != y.name
  );