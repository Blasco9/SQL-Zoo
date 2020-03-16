-- 1
SELECT
  COUNT(*)
FROM stops;
-- 2
SELECT
  id
FROM stops
WHERE
  name = 'Craiglockhart';
-- 3
SELECT
  id,
  name
FROM stops
JOIN route ON stops.id = route.stop
WHERE
  route.num = '4'
  AND route.company = 'LRT';
-- 4
SELECT
  company,
  num,
  COUNT(*) AS c
FROM route
WHERE
  stop = 149
  OR stop = 53
GROUP BY
  company,
  num
HAVING
  c = 2;
-- 5
SELECT
  a.company,
  a.num,
  a.stop,
  b.stop
FROM route a
JOIN route b ON (
    a.company = b.company
    AND a.num = b.num
  )
WHERE
  a.stop = 53
  AND b.stop = (
    SELECT
      stops.id
    FROM stops
    WHERE
      name = 'London Road'
  );
-- 6
SELECT
  a.company,
  a.num,
  stopa.name,
  stopb.name
FROM route a
JOIN route b ON (
    a.company = b.company
    AND a.num = b.num
  )
JOIN stops stopa ON (a.stop = stopa.id)
JOIN stops stopb ON (b.stop = stopb.id)
WHERE
  stopa.name = 'Craiglockhart'
  AND stopb.name = 'London Road';
-- 7
SELECT
  DISTINCT a.company,
  a.num
FROM route a
JOIN route b ON (
    a.company = b.company
    AND a.num = b.num
  )
JOIN stops stopa ON (a.stop = stopa.id)
JOIN stops stopb ON (b.stop = stopb.id)
WHERE
  stopa.id = 115
  AND stopb.id = 137;
-- 8
SELECT
  a.company,
  a.num
FROM route a
JOIN route b ON (
    a.company = b.company
    AND a.num = b.num
  )
JOIN stops stopa ON (a.stop = stopa.id)
JOIN stops stopb ON (b.stop = stopb.id)
WHERE
  stopa.name = 'Craiglockhart'
  AND stopb.name = 'Tollcross';
-- 9
SELECT
  stopb.name,
  a.company,
  a.num
FROM route a
JOIN route b ON (
    a.company = b.company
    AND a.num = b.num
  )
JOIN stops stopa ON (a.stop = stopa.id)
JOIN stops stopb ON (b.stop = stopb.id)
WHERE
  stopa.name = 'Craiglockhart';
-- 10
SELECT
  a.num,
  a.company,
  trans1.name,
  c.num,
  c.company
FROM route a
JOIN route b ON (
    a.company = b.company
    AND a.num = b.num
  )
JOIN (
    route c
    JOIN route d ON (
        c.company = d.company
        AND c.num = d.num
      )
  )
JOIN stops start ON (a.stop = start.id)
JOIN stops trans1 ON (b.stop = trans1.id)
JOIN stops trans2 ON (c.stop = trans2.id)
JOIN stops
end ON (d.stop =end.id
)
WHERE
  start.name = 'Craiglockhart'
  AND
end.name = 'Lochend'
AND trans1.name = trans2.name
ORDER BY
  a.num,
  b.num,
  trans1.id,
  d.num;