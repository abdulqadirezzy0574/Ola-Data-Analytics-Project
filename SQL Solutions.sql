Create Database Ola;
use Ola;

select count(*) from bookings;

#1. Retrieve all successful bookings:
create view  Successful_Booking as
select * from bookings
where Booking_Status = 'success';
#1. Retrieve all successful bookings:
select * from Successful_Booking;


#2. Find the average ride distance for each vehicle type:
 create view ride_distance_for_each_vehicle as
 select Vehicle_Type, avg(Ride_Distance)
 as avg_distance from bookings
 group by  Vehicle_Type;
#2. Find the average ride distance for each vehicle type:
select * from ride_distance_for_each_vehicle;


#3. Get the total number of cancelled rides by customers:
create view canceled_rides_by_customer as
select count(*) from bookings
where booking_Status = 'canceled by customer';
#3. Get the total number of cancelled rides by customers:
select * from canceled_rides_by_customer;


#4. List the top 5 customers who booked the highest number of rides:
create view top_5_customers as 
select Customer_ID, count(Booking_ID) as total_rides
from bookings 
Group by Customer_ID
order by total_rides desc limit 5;
#4. List the top 5 customers who booked the highest number of rides:
select * from top_5_customers;


#5. Get the number of rides cancelled by drivers due to personal and car-related issues:
create view Rides_Canceled_by_Drivers_Personal_or_Car_Issues as
select count(*) from bookings
where Canceled_Rides_by_Driver = 'personal & car related issue';
select * from  Rides_Canceled_by_Driver_Personal_or_Car_Issues;


#6. Find the maximum and minimum driver ratings for Prime Sedan bookings:
create view Max_Min_Driver_Rating as
SELECT MAX(Driver_Ratings) as max_rating,
MIN(Driver_Ratings) as min_rating 
FROM bookings WHERE Vehicle_Type = 'Prime Sedan';


#7. Retrieve all rides where payment was made using UPI:
create view UPI_Payment as
select * from bookings
where Payment_Method = 'UPI';


#8. Find the average customer rating per vehicle type:
create view Avg_Customer_Rating as
select Vehicle_Type, AVG(Customer_Rating) as avg_customer_rating
from bookings
Group by Vehicle_type;
select * from Avg_Customer_Rating;


#9. Calculate the total booking value of rides completed successfully:
create view Total_Successful_Ride_Value as
select sum(Booking_Value) as total_successful_ride_value
from bookings
where Booking_Status = 'success';
select * from Total_Successful_Ride_Value;


#10. List all incomplete rides along with the reason:
create view Total_Incomplete_Rides_With_Reason as 
select Booking_ID, Incomplete_Rides_Reason
from bookings
where Incomplete_Rides = 'yes';
select * from Total_Incomplete_Rides_With_Reason;