Which hotel is the most expensive in Jaipur?

SELECT *
FROM DBO.HOTELS
WHERE PRICE_RUPEES =
(SELECT MAX(PRICE_RUPEES) FROM DBO.HOTELS);

Which hotel has received the highest number of reviews?

SELECT *
FROM DBO.HOTELS
WHERE NUMBER_OF_REVIEWS = (SELECT MAX(NUMBER_OF_REVIEWS) FROM DBO.HOTELS);

Which hotels have prices above the average hotel price?

SELECT HOTEL, PRICE_RUPEES
FROM DBO.HOTELS
WHERE PRICE_RUPEES >
(SELECT AVG(PRICE_RUPEES) FROM DBO.HOTELS);

Which hotels have review counts above the average review count?

SELECT HOTEL, NUMBER_OF_REVIEWS
FROM DBO.HOTELS
WHERE NUMBER_OF_REVIEWS >
(SELECT AVG(NUMBER_OF_REVIEWS) FROM DBO.HOTELS);

Which hotels have prices higher than average but reviews lower than average?

SELECT HOTEL, PRICE_RUPEES, NUMBER_OF_REVIEWS
FROM DBO.HOTELS
WHERE PRICE_RUPEES > (SELECT AVG(PRICE_RUPEES) FROM DBO.HOTELS) AND NUMBER_OF_REVIEWS < (SELECT AVG(NUMBER_OF_REVIEWS) FROM DBO.HOTELS);

Which tourist attractions belong to the most common tourism category?

SELECT P.POIs, T.PRIORITY_1
FROM DBO.PLACES P
INNER JOIN DBO.TYPES T ON P.PID = T.PID
WHERE T.PRIORITY_1 =
(SELECT TOP 1
PRIORITY_1
FROM DBO.TYPES
GROUP BY PRIORITY_1
ORDER BY COUNT(*) DESC);

Which attractions belong to categories having more than 5 tourist places?

SELECT P.POIs, T.PRIORITY_1
FROM DBO.PLACES P
INNER JOIN DBO.TYPES T ON P.PID = T.PID
WHERE T.PRIORITY_1 IN
(SELECT
    PRIORITY_1
    FROM DBO.TYPES
    GROUP BY PRIORITY_1
    HAVING COUNT(*) > 5);

Which attractions belong to the least common tourism category?

SELECT P.POIs, T.PRIORITY_1
FROM DBO.PLACES P
INNER JOIN DBO.TYPES T ON P.PID = T.PID
WHERE T.PRIORITY_1 = (
                        SELECT TOP 1
                        PRIORITY_1
                        FROM DBO.TYPES
                        GROUP BY PRIORITY_1
                        ORDER BY COUNT(*) ASC 
                      );