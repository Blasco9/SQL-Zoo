-- 1
SELECT
  DISTINCT teacher.name
FROM teacher
JOIN dept ON teacher.dept IS NULL;
-- 2
SELECT
  teacher.name,
  dept.name
FROM teacher
INNER JOIN dept ON (teacher.dept = dept.id);
-- 3
SELECT
  teacher.name,
  dept.name
FROM teacher
LEFT JOIN dept ON teacher.dept = dept.id;
-- 4
SELECT
  teacher.name,
  dept.name
FROM teacher
RIGHT JOIN dept ON teacher.dept = dept.id;
-- 5
SELECT
  teacher.name,
  COALESCE(mobile, '07986 444 2266')
FROM teacher;
-- 6
SELECT
  teacher.name,
  COALESCE(dept.name, 'None') AS department
FROM teacher
LEFT JOIN dept ON teacher.dept = dept.id;
-- 7
SELECT
  COUNT(name),
  COUNT(mobile)
FROM teacher;
-- 8
SELECT
  dept.name,
  COUNT(teacher.dept)
FROM dept
LEFT JOIN teacher ON dept.id = teacher.dept
GROUP BY
  dept.name;
-- 9
SELECT
  name,
  CASE
    WHEN dept = 1
    OR dept = 2 THEN 'Sci'
    ELSE 'Art'
  END
FROM teacher;
-- 10
SELECT
  name,
  CASE
    WHEN dept = 1
    OR dept = 2 THEN 'Sci'
    WHEN dept = 3 THEN 'Art'
    ELSE 'None'
  END
FROM teacher;