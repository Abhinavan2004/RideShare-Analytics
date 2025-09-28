create database ola;
use Ola;

select * from bookings ;

# to load csv dataset file (easy and faster manner)
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/Bookings.csv'
INTO TABLE bookings
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

# to get to know about mysql secure folder 
SHOW VARIABLES LIKE 'secure_file_priv';

#create table bookings
CREATE TABLE bookings (
    Date DATE,
    Time TIME,
    Booking_ID VARCHAR(50) PRIMARY KEY,
    Booking_Status VARCHAR(50),
    Customer_ID VARCHAR(50),
    Vehicle_Type VARCHAR(50),
    Pickup_Location VARCHAR(100),
    Drop_Location VARCHAR(100),
    V_TAT INT,
    C_TAT INT,
    Canceled_Rides_by_Customer VARCHAR(255),
    Canceled_Rides_by_Driver VARCHAR(255),
    Incomplete_Rides VARCHAR(10),
    Incomplete_Rides_Reason VARCHAR(255),
    Booking_Value DECIMAL(10,2),
    Payment_Method VARCHAR(50),
    Ride_Distance DECIMAL(5,2),
    Driver_Ratings DECIMAL(3,1),
    Customer_Rating DECIMAL(3,1),
    Vehicle_Images VARCHAR(255)
);




#-----> 1. Retrieve all successful bookings:
create view  Success_Booking as
select * from bookings 
where Booking_Status="Success";


#-----> Retrieve all successful bookings:
select * from Success_Booking;


#-----> 2. Find the average ride distance for each vehicle type:
create view average_ride_distance_for_each_vehicle as
select Vehicle_Type,AVG(Ride_Distance) as booking
from bookings 
group by Vehicle_Type;


#-----> 2. Find the average ride distance for each vehicle type:
select * from average_ride_distance_for_each_vehicle;

#-----> 3. Get the total number of cancelled rides by customers:
create view  number_of_cancelled_rides as
SELECT COUNT(*) FROM bookings 
WHERE Booking_Status = 'Canceled by Customer';


#-----> Retrieve all successful bookings:
select * from number_of_cancelled_rides;

#-----> 4. List the top 5 customers who booked the highest number of rides:
create view top_5_customers as
select Customer_ID,count(Booking_ID) as total_rides from bookings
group by Customer_ID
order by total_rides desc limit 5;

#-----> 4. List the top 5 customers who booked the highest number of rides:
select * from top_5_customers;

#-----> 5. Get the number of rides cancelled by drivers due to personal and car-related issues:
create view rides_cancelled_by_drivers as
select count(*) from  bookings
where Canceled_Rides_by_Driver = 'Personal & Car related issue';

#-----> 5. Get the number of rides cancelled by drivers due to personal and car-related issues:
select * from rides_cancelled_by_drivers;


#-----> 6. Find the maximum and minimum driver ratings for Prime Sedan bookings:
Create View Max_Min_Driver_Rating As
SELECT  MAX(Driver_Ratings) as max_rating, MIN(Driver_Ratings) as min_rating 
FROM bookings 
WHERE Vehicle_Type = 'Prime Sedan';


#-----> 6. Find the maximum and minimum driver ratings for Prime Sedan bookings:
select * from Max_Min_Driver_Rating;


#-----> 7. Retrieve all rides where payment was made using UPI:
create view UPI_payments as
select * from bookings
where Payment_Method='UPI';

#-----> 7. Retrieve all rides where payment was made using UPI:
select * from UPI_payments;

#-----> 8. Find the average customer rating per vehicle type:
create view avg_rating_for_v_type as
select Vehicle_Type,round(avg(Customer_Rating),1) as avg_rating_for_v_type 
from bookings 
group by Vehicle_Type;

#-----> 8. Find the average customer rating per vehicle type:
select * from avg_rating_for_v_type;

