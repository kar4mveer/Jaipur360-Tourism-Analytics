What is the total number of tourist places available in Jaipur?

SELECT COUNT(*) AS Total_Places
FROM dbo.Places;

What is the average hotel price in Jaipur?

SELECT AVG(PRICE_RUPEES) AS Avg_Price
FROM dbo.Hotels;

What is the maximum hotel price available in Jaipur?

SELECT MAX(PRICE_RUPEES) AS Max_Price
FROM dbo.Hotels;

What is the minimum hotel price available in Jaipur?	

SELECT MIN(PRICE_RUPEES) AS Min_Price
FROM dbo.Hotels;

How many total reviews received by all hotels?

SELECT SUM(NUMBER_OF_REVIEWS) AS Total_Reviews
FROM dbo.Hotels;

What is the average number of reviews received by hotels?

SELECT AVG(NUMBER_OF_REVIEWS) AS Avg_Reviews
FROM dbo.Hotels;

What is the total reviews for hotels priced above ₹5000?

SELECT SUM(NUMBER_OF_REVIEWS) AS Total_Reviews
FROM dbo.Hotels
WHERE PRICE_RUPEES > 5000;

What is the average price of hotels having more than 1000 reviews?

SELECT AVG(PRICE_RUPEES) AS Avg_Price
FROM dbo.Hotels
WHERE NUMBER_OF_REVIEWS > 1000;

How many hotels have prices greater than the average hotel price?

SELECT COUNT(*) AS Hotels_Above_Average
FROM dbo.Hotels
WHERE PRICE_RUPEES > (SELECT AVG(PRICE_RUPEES) FROM dbo.Hotels);

What is the average hotel price among the Top 10 most reviewed hotels?

SELECT AVG(PRICE_RUPEES) AS Avg_Price
FROM (SELECT TOP 10 HOTEL, PRICE_RUPEES FROM dbo.Hotels ORDER BY NUMBER_OF_REVIEWS DESC) AS TopHotels;

