Display rounded hotel prices.

SELECT
HOTEL,
PRICE_RUPEES,
ROUND(PRICE_RUPEES,0) AS ROUNDED_PRICE
FROM DBO.Hotels;

Display hotel prices rounded up to the nearest whole number.

SELECT
HOTEL,
PRICE_RUPEES,
CEILING(PRICE_RUPEES) AS ROUNDED_UP_PRICE_WHOLE
FROM DBO.Hotels;

Display hotel prices rounded down to the nearest whole number.

SELECT
HOTEL,
PRICE_RUPEES,
FLOOR(PRICE_RUPEES) AS ROUNDED_DOWN_PRICE_WHOLE
FROM DBO.Hotels;

Display hotel prices in hundreds.

SELECT
HOTEL,
PRICE_RUPEES,
PRICE_RUPEES / 100 AS PRINCE_IN_HUNDREDS
FROM DBO.Hotels;

What would be the hotel price after applying a 10% discount?

SELECT
HOTEL,
PRICE_RUPEES,
ROUND(PRICE_RUPEES * 0.90,1) AS DISCOUNTED_PRICE
FROM DBO.Hotels;

Which hotels have prices that are exact multiples of 100?

SELECT
HOTEL,
PRICE_RUPEES
FROM DBO.Hotels
WHERE PRICE_RUPEES % 100 = 0;