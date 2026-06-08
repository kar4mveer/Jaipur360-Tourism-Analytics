Rank hotels based on price.
--- RANK

SELECT HOTEL, PRICE_RUPEES,
RANK() OVER(ORDER BY PRICE_RUPEES DESC) AS PRICE_RANK
FROM DBO.HOTELS;

Rank hotels based on price.
--- DENSE RANK

SELECT HOTEL, PRICE_RUPEES,
DENSE_RANK() OVER(ORDER BY PRICE_RUPEES DESC) AS PRICE_RANK
FROM DBO.HOTELS;

Rank hotels based on reviews.
--- DENSE RANK

SELECT HOTEL, NUMBER_OF_REVIEWS,
DENSE_RANK() OVER(ORDER BY NUMBER_OF_REVIEWS DESC) AS REVIEW_RANK
FROM DBO.HOTELS;

Assign a unique row number to each hotel based on price.

SELECT HOTEL, PRICE_RUPEES,
ROW_NUMBER() OVER(ORDER BY PRICE_RUPEES DESC) AS ROW_NUM
FROM DBO.HOTELS;

Display the average hotel price alongside every hotel.

SELECT HOTEL, PRICE_RUPEES,
AVG(PRICE_RUPEES) OVER() AS AVG_PRICE
FROM DBO.HOTELS;

Rank hotels within each price segment.
--- PARTITION BY

SELECT HOTEL, PRICE_RUPEES,
CASE
    WHEN PRICE_RUPEES < 2500 THEN 'BUDGET'
    WHEN PRICE_RUPEES < 7000 THEN 'MID RANGE'
    WHEN PRICE_RUPEES < 15000 THEN 'PREMIUM'
    ELSE 'LUXURY'
END AS HOTEL_CATEGORY,
DENSE_RANK() OVER(PARTITION BY CASE
                            WHEN PRICE_RUPEES < 2500 THEN 'Budget'
                            WHEN PRICE_RUPEES < 7000 THEN 'Mid Range'
                            WHEN PRICE_RUPEES < 15000 THEN 'Premium'
                            ELSE 'Luxury'
                          END
ORDER BY PRICE_RUPEES DESC) AS CATEGORY_RANK
FROM DBO.HOTELS;


How are hotels ranked within their respective Luxury, Premium, Mid Range, and Budget categories according to price?

SELECT HOTEL, PRICE_RUPEES,
CASE
    WHEN PRICE_RUPEES < 2500 THEN 'BUDGET'
    WHEN PRICE_RUPEES < 7000 THEN 'MID RANGE'
    WHEN PRICE_RUPEES < 15000 THEN 'PREMIUM'
 ELSE 'LUXURY'
 END AS HOTEL_CATEGORY,

DENSE_RANK() OVER(PARTITION BY CASE
                                    WHEN PRICE_RUPEES < 2500 THEN 'BUDGET'
                                    WHEN PRICE_RUPEES < 7000 THEN 'MID RANGE'
                                    WHEN PRICE_RUPEES < 15000 THEN 'PREMIUM'
                                    ELSE 'LUXURY'
                                END
ORDER BY PRICE_RUPEES DESC) AS CATEGORY_RANK

FROM DBO.HOTELS

ORDER BY CASE
            WHEN PRICE_RUPEES >= 15000 THEN 1
            WHEN PRICE_RUPEES >= 7000 THEN 2
            WHEN PRICE_RUPEES >= 2500 THEN 3
            ELSE 4
          END,
          CATEGORY_RANK;