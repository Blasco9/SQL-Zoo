-- 1
SELECT
  id,
  title
FROM movie
WHERE
  yr = 1962;
-- 2
SELECT
  yr
FROM movie
WHERE
  title = 'Citizen Kane';
-- 3
SELECT
  id,
  title,
  yr
FROM movie
WHERE
  title LIKE('%Star Trek%')
ORDER BY
  yr;
-- 4
SELECT
  id
FROM actor
WHERE
  name = 'Glenn Close';
-- 5
SELECT
  id
FROM movie
WHERE
  title = 'Casablanca';
-- 6
SELECT
  name
FROM actor
JOIN casting ON actor.id = casting.actorid
JOIN movie ON casting.movieid = movie.id
WHERE
  movie.id = 11768;
-- 7
SELECT
  name
FROM actor
JOIN casting ON actor.id = casting.actorid
JOIN movie ON casting.movieid = movie.id
WHERE
  movie.id = (
    SElECT
      id
    FROM movie
    WHERE
      title = 'Alien'
  );
-- 8
SELECT
  title
FROM movie
JOIN casting ON movie.id = casting.movieid
JOIN actor ON casting.actorid = actor.id
WHERE
  actor.name = 'Harrison Ford';
-- 9
SELECT
  title
FROM movie
JOIN casting ON movie.id = casting.movieid
JOIN actor ON casting.actorid = actor.id
WHERE
  actor.name = (
    SELECT
      name
    FROM actor
    WHERE
      name = 'Harrison Ford'
  )
  AND casting.ord != 1;
-- 10
SELECT
  title,
  name
FROM movie
JOIN casting ON movie.id = casting.movieid
JOIN actor ON casting.actorid = actor.id
WHERE
  casting.ord = 1
  AND movie.yr = 1962;
-- 11
SELECT
  yr,
  COUNT(title)
FROM movie
JOIN casting ON movie.id = movieid
JOIN actor ON actorid = actor.id
WHERE
  name = 'Rock Hudson'
GROUP BY
  yr
HAVING
  COUNT(title) > 2;
-- 12
SELECT
  title,
  name
FROM movie
JOIN casting ON movie.id = movieid
JOIN actor ON actorid = actor.id
WHERE
  title IN(
    SELECT
      title
    FROM movie
    JOIN casting ON movie.id = movieid
    JOIN actor ON actorid = actor.id
    WHERE
      name = 'Julie Andrews'
  )
  AND ord = 1
  AND movie.id != (
    SELECT
      id
    FROM movie
    WHERE
      title = 'Little Miss Marker'
      AND yr = 1934
  );
-- 13
SELECT
  name
FROM actor
JOIN casting ON actor.id = casting.actorid
JOIN movie ON casting.movieid = movie.id
WHERE
  ord = 1
GROUP BY
  name
HAVING
  COUNT(name) >= 15;
-- 14
SELECT
  title,
  COUNT(actorid) AS actors
FROM movie
JOIN casting ON id = movieid
WHERE
  yr = 1978
GROUP BY
  title
ORDER BY
  actors DESC,
  title;
-- 15
SELECT
  name
FROM actor
JOIN casting ON id = actorid
WHERE
  movieid IN(
    SELECT
      movie.id
    FROM movie
    JOIN casting ON movie.id = casting.movieid
    JOIN actor ON casting.actorid = actor.id
    WHERE
      actor.name = 'Art Garfunkel'
  )
  AND name != 'Art Garfunkel';