Display all hotel names in uppercase.

SELECT
UPPER(HOTEL) AS HOTEL_NAME_UPPERCASE
FROM DBO.Hotels;

Display all hotel names in lowercase.

SELECT
LOWER(HOTEL) AS HOTEL_NAME_LOWERCASE
FROM DBO.Hotels;

Find the length of each hotel name.

SELECT 
HOTEL,
LEN(HOTEL) AS HOTEL_NAME_LENGTH
FROM DBO.Hotels;

Extract the first 20 characters of hotel names.

SELECT 
HOTEL,
LEFT(HOTEL,20) AS HOTEL_NAME_SHORT_FIRST
FROM DBO.Hotels;

Extract the last 20 characters of hotel names.

SELECT 
HOTEL,
RIGHT(HOTEL,20) AS HOTEL_NAME_SHORT_END
FROM DBO.Hotels;

Replace the word 'JAIPUR' with 'PINK CITY' in hotel names.

SELECT 
HOTEL,
REPLACE(HOTEL,'Jaipur','Pink City') AS JAIPUR_TO_PINKCITY
FROM DBO.Hotels;

Remove extra spaces from hotel names if exists.

SELECT
    HOTEL,
    TRIM(HOTEL) AS Clean_Name
FROM dbo.Hotels;