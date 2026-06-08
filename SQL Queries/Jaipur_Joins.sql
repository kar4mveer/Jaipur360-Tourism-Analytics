What is the primary tourism category of each tourist place?

SELECT P.POIs, T.PRIORITY_1
FROM DBO.PLACES P
INNER JOIN DBO.TYPES T ON P.PID = T.PID;

Which tourist attractions belong to the History and Culture category?

SELECT P.POIs
FROM DBO.PLACES P
INNER JOIN DBO.TYPES T ON P.PID = T.PID
WHERE T.PRIORITY_1 = 'HISTORY AND CULTURE';

Which tourist attractions are categorized as Scenic destinations?

SELECT P.POIs
FROM DBO.PLACES P
INNER JOIN DBO.TYPES T ON P.PID = T.PID
WHERE T.PRIORITY_1 = 'SCENIC';

Display tourist places along with all assigned tourism categories.

SELECT P.POIs, T.PRIORITY_1, T.PRIORITY_2, T.PRIORITY_3, T.PRIORITY_4, T.PRIORITY_5
FROM DBO.PLACES P
INNER JOIN DBO.TYPES T ON P.PID = T.PID;

How many places belong to each primary tourism category?

SELECT T.PRIORITY_1, COUNT(*) AS TOTAL_PLACES
FROM DBO.PLACES P
INNER JOIN DBO.TYPES T ON P.PID = T.PID
GROUP BY T.PRIORITY_1
ORDER BY TOTAL_PLACES DESC;

Which tourism category has the highest number of tourist places?

SELECT TOP 1 T.PRIORITY_1, COUNT(*) AS TOTAL_PLACES
FROM DBO.PLACES P
INNER JOIN DBO.TYPES T ON P.PID = T.PID
GROUP BY T.PRIORITY_1
ORDER BY TOTAL_PLACES DESC;

Which attractions have more than one tourism category assigned?

SELECT P.POIs, T.PRIORITY_1, T.PRIORITY_2, T.PRIORITY_3, T.PRIORITY_4, T.PRIORITY_5
FROM DBO.PLACES P
INNER JOIN DBO.TYPES T ON P.PID = T.PID
WHERE T.PRIORITY_2 IS NOT NULL;

Which attractions belong to Adventure tourism?

SELECT P.POIs
FROM DBO.PLACES P
INNER JOIN DBO.TYPES T ON P.PID = T.PID
WHERE T.PRIORITY_1 = 'Adventure' 
OR T.PRIORITY_2 = 'Adventure'
OR T.PRIORITY_3 = 'Adventure'
OR T.PRIORITY_4 = 'Adventure'
OR T.PRIORITY_5 = 'Adventure';

Which attractions belong to Food and Drinks tourism?

SELECT P.POIs
FROM DBO.PLACES P
INNER JOIN DBO.TYPES T ON P.PID = T.PID
WHERE T.PRIORITY_1 = 'FOOD AND DRINKS' 
OR T.PRIORITY_2 = 'FOOD AND DRINKS'
OR T.PRIORITY_3 = 'FOOD AND DRINKS'
OR T.PRIORITY_4 = 'FOOD AND DRINKS'
OR T.PRIORITY_5 = 'FOOD AND DRINKS';

Which attractions close the latest?

SELECT TOP 10 POIs, OUT_TIME1
FROM DBO.PLACES
ORDER BY OUT_TIME1 DESC;

Which attractions operate in multiple shifts?

SELECT POIs, IN_TIME1, OUT_TIME1, IN_TIME2, OUT_TIME2
FROM DBO.PLACES
WHERE IN_TIME2 <> '-';

Which attractions operate in a single shift?

SELECT POIs
FROM DBO.PLACES
WHERE IN_TIME2 = '-';

Which attractions open the earliest?

SELECT POIs, IN_TIME1
FROM DBO.PLACES
ORDER BY IN_TIME1;