create database ola;
use Ola;

select * from bookings ;

#create table bookings
CREATE TABLE bookings (
    Booking_ID INT PRIMARY KEY AUTO_INCREMENT,
    Customer_ID INT,
    Vehicle_Type VARCHAR(50),
    Ride_Distance DECIMAL(5,2),
    Booking_Status VARCHAR(50),
    Canceled_Rides_by_Driver VARCHAR(100),
    Driver_Ratings DECIMAL(3,1),
    Payment_Method VARCHAR(50),
    Customer_Rating DECIMAL(3,1),
    Booking_Value DECIMAL(10,2),
    Incomplete_Rides VARCHAR(5),
    Incomplete_Rides_Reason VARCHAR(255)
);



#-----> 1. Retrieve all successful bookings:
create view  Success_Booking as
select * from bookings 
where Booking_Status="Success";


#-----> Retrieve all successful bookings:
select * from Success_Booking;