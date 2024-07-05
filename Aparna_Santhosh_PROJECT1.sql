--PROJECT 1 (Hotel Reservation Analysis in SQL)

--Aparna Santhosh----------------------------------------
--Batch No: MIP-DA-10-------------------------------------
     
CREATE TABLE booking (
    Booking_ID VARCHAR(10) PRIMARY KEY,
    no_of_adults INT,
    no_of_children INT,
    no_of_weekend_nights INT,
    no_of_week_nights INT,
    type_of_meal_plan VARCHAR(20),
    room_type_reserved VARCHAR(20),
    lead_time INT,
    arrival_date DATE,
    market_segment_type VARCHAR(20),
    avg_price_per_room DECIMAL(6, 2),
    booking_status VARCHAR(20)
);




--------------------------------------TASK 1 TO 15------------------------------------------------------------
----------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------

--What is the total number of reservations in the dataset?

SELECT COUNT(*)
FROM booking;

--Which meal plan is the most popular among guests?

SELECT type_of_meal_plan, COUNT(*) AS total_bookings
FROM booking
GROUP BY type_of_meal_plan
ORDER BY total_bookings DESC
LIMIT 1;

--What is the average price per room for reservations involving children?

SELECT AVG(avg_price_per_room) AS average_price
FROM booking
WHERE no_of_children > 0;

--How many reservations were made for the year 20XX (replace XX with the desired year)?

SELECT COUNT(*) AS total_reservations
FROM booking
WHERE arrival_date >= '2018-01-01' AND arrival_date < '2019-01-01';

--What is the most commonly booked room type?

SELECT room_type_reserved, COUNT(*) AS total_bookings
FROM booking
GROUP BY room_type_reserved
ORDER BY total_bookings DESC
LIMIT 1;

--How many reservations fall on a weekend (no_of_weekend_nights > 0)?

SELECT COUNT(*) AS weekend_reservations
FROM booking
WHERE no_of_weekend_nights > 0;

--What is the highest and lowest lead time for reservations?

SELECT MAX(lead_time) AS HighestLeadTime, MIN(lead_time) AS LowestLeadTime
FROM booking;

--What is the most common market segment type for reservations?

SELECT market_segment_type, COUNT(*) AS total_reservations
FROM booking
GROUP BY market_segment_type
ORDER BY total_reservations DESC
LIMIT 1;

--How many reservations have a booking status of "Confirmed"?

SELECT COUNT(*) AS confirmed_reservations
FROM booking
WHERE booking_status = 'Confirmed';

--What is the total number of adults and children across all reservations?

SELECT SUM(no_of_adults) AS total_adults, SUM(no_of_children) AS total_children
FROM booking;

--What is the average number of weekend nights for reservations involving children?

SELECT AVG(no_of_weekend_nights) AS average_weekend_nights
FROM booking
WHERE no_of_children > 0;

--How many reservations were made in each month of the year?

SELECT
    EXTRACT(MONTH FROM arrival_date) AS Month,
    COUNT(*) AS TotalReservations
FROM
    booking
GROUP BY
    EXTRACT(MONTH FROM arrival_date);

--What is the average number of nights (both weekend and weekday) spent by guests for each room type?

SELECT room_type_reserved,
       AVG(no_of_weekend_nights + no_of_week_nights) AS avg_nights
FROM booking
GROUP BY room_type_reserved;

--For reservations involving children, what is the most common room type, and what is the average price for that room type?

SELECT room_type_reserved, COUNT(*) AS total_reservations, AVG(avg_price_per_room) AS average_price
FROM your_table_name
WHERE no_of_children > 0
GROUP BY room_type_reserved
ORDER BY total_reservations DESC
LIMIT 1;

--Find the market segment type that generates the highest average price per room.

SELECT market_segment_type, AVG(avg_price_per_room) AS average_price
FROM booking
GROUP BY market_segment_type
ORDER BY average_price DESC
LIMIT 1;
