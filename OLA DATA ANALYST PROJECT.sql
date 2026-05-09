Create database OLA;

use OLA;

-- 1. Retrieve all successful booking:
SELECT * FROM
BOOKINGS 
WHERE BOOKING_STATUS="SUCCESS";


-- 2. Find the average rides distance for each vehical type:
SELECT VEHICLE_TYPE,AVG(RIDE_DISTANCE) AS RIDE_DISTANCE
FROM BOOKINGS 
GROUP BY VEHICLE_TYPE
ORDER BY avg(RIDE_DISTANCE) DESC;


-- 3. Get the total numbers of cancelled rides by customers:
SELECT count(*) AS RIDES_CANCELLED
FROM BOOKINGS 
WHERE BOOKING_STATUS="CANCELED BY CUSTOMER";


-- 4 LIST THE TOP 5 CUSTOMERS WHO 
-- BOOKED THE HIGHEST NUMERS OF RIDES

SELECT CUSTOMER_ID , count(BOOKING_ID) AS TOTAL_RIDES
FROM BOOKINGS
Group by CUSTOMER_ID
Order by TOTAL_RIDES DESC
LIMIT 5;


-- 5 Get the number of rides cancelled by 
-- drivers due to personal and car-related issues:
SELECT count(*)
FROM BOOKINGS
WHERE CANCELED_RIDES_BY_DRIVER="PERSONAL & CAR RELATED ISSUE";
  

-- 6. . Find the maximum and minimum driver 
-- ratings for Prime Sedan bookings:
SELECT VEHICLE_TYPE, max(DRIVER_RATINGS) AS MAX_RATING, min(DRIVER_RATINGS) AS MIN_RATING
FROM BOOKINGS 
WHERE VEHICLE_TYPE = "PRIME SEDAN" AND DRIVER_RATINGS!="";


-- 7. Retrieve all rides where payment was made using UPI:
SELECT *
FROM BOOKINGS
WHERE PAYMENT_METHOD="UPI";


-- 8.  Find the average customer rating per vehicle type:
SELECT VEHICLE_TYPE, AVG(CUSTOMER_RATING) AS CUSTOMER_RATING
FROM BOOKINGS
GROUP BY VEHICLE_TYPE;


-- 9.  Calculate the total booking value of rides completed successfully:
SELECT SUM(BOOKING_VALUE) AS TOTAL_SUCCESS_VALUE
FROM BOOKINGS
WHERE BOOKING_STATUS="SUCCESS";


-- 10.  List all incomplete rides along with the reason:
SELECT BOOKING_ID, INCOMPLETE_RIDES_REASON
FROM BOOKINGS
WHERE INCOMPLETE_RIDES="YES";
