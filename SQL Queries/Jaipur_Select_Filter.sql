All tourist places  in Jaipur?

SELECT *
FROM dbo.Places;

All hotels available in Jaipur?

SELECT *
FROM dbo.Hotels;

What are the names and prices of all hotels?

SELECT
HOTEL,
PRICE_RUPEES
FROM dbo.Hotels;

Which hotels cost less than ₹1000?

SELECT 
HOTEL,
PRICE_RUPEES
FROM Hotels
WHERE PRICE_RUPEES < 1000;

Which hotels have prices greater than ₹5000?

SELECT
HOTEL,
PRICE_RUPEES
FROM dbo.Hotels
WHERE PRICE_RUPEES > 5000;

Which hotels have more than 1000 customer reviews?

SELECT
HOTEL,
NUMBER_OF_REVIEWS
FROM dbo.Hotels
WHERE NUMBER_OF_REVIEWS > 1000;

What are the top 10 most expensive hotels in Jaipur?

SELECT TOP 10
HOTEL,
PRICE_RUPEES
FROM dbo.Hotels
ORDER BY PRICE_RUPEES DESC;

What are the top 10 most affordable/cheapest hotels in Jaipur?

SELECT TOP 10
HOTEL,
PRICE_RUPEES
FROM dbo.Hotels
ORDER BY PRICE_RUPEES;

Which hotels have received the highest number of reviews?

SELECT TOP 10
HOTEL,
NUMBER_OF_REVIEWS
FROM dbo.Hotels
ORDER BY NUMBER_OF_REVIEWS DESC;

Retrieve names of hotels priced between ₹2000 and ₹5000

SELECT HOTEL, PRICE_RUPEES
FROM Hotels
WHERE PRICE_RUPEES BETWEEN 2000 AND 5000
order by price_rupees desc;

Which attractions have 'PALACE' in their name?

SELECT POIs
FROM Places
WHERE POIs LIKE '%PALACE%';