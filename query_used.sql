-- this is the query that creates the table and populates it
-- it is embedded in the other file

DROP TABLE IF EXISTS `AverageLifeExpectancy`;
CREATE TABLE `AverageLifeExpectancy` (
LifeProm FLOAT,
Region VARCHAR(20)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

set autocommit=0;
INSERT INTO AverageLifeExpectancy (Region, LifeProm)
SELECT continent AS Region, AVG(LifeExpectancy) AS LifeProm
FROM country
WHERE LifeExpectancy IS NOT NULL
GROUP BY continent;
commit;

-- simulating the answer for the challenge:
-- SELECT * FROM world.AverageLifeExpectancy;
-- 'LifeProm', 'Region'
-- '75.1477', 'Europe'
-- '72.9919', 'North America'
-- '70.9462', 'South America'
-- '69.715', 'Oceania'
-- '67.4412', 'Asia'
-- '52.5719', 'Africa'
