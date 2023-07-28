/* List four columns from the table Trip: TripId, TripName, Type, and Season.*/
SELECT TripId, TripName, Type, Season FROM trip;

/* List the name of each trip that does not start in Vermont [VT].*/
SELECT TripName FROM Trip
WHERE State != 'VT';

/* List the name and start location for each trip that has the type Hiking.*/
SELECT TripName, StartLocation FROM Trip
WHERE Type = 'Hiking';

/* List the name of each trip that has the type Hiking and that has a distance of greater than four miles.*/
SELECT TripName FROM Trip 
WHERE Type = 'Hiking' AND Distance > 4;

/* List the name of each trip that has the type Paddling or that is located in Connecticut [CT).*/
SELECT TripName
FROM Trip
WHERE Type = 'Paddling' OR State = 'CT';

/* How many trips have a type of Hiking or Biking?*/
SELECT Count(*)
FROM Trip
WHERE Type = 'Hiking' OR Type = 'Biking';

/* List the name of each trip that has the type Hiking and that is guided by Rita Boyers.*/
SELECT TripName FROM Trip, TripGuides
WHERE Type= 'hiking' AND GuideNum= 'BR01'
AND TripGuides.TripID=Trip.TripID; 

/* How many reservations include a trip with a price that is greater than $20 but less than $75?*/
Select Count(*) AS NumberOfReservations FROM Reservation
WHERE TripPrice > 20 AND TripPrice < 75; 

/* List the reservation ID, customer number, customer last name, and customer   first name for all trips that occur in July 2018.*/
SELECT Reservation.ReservationID, Customer.CustomerNum, Customer.LastName, Customer.FirstName
FROM Customer, Reservation
WHERE Customer.CustomerNum= Reservation.CustomerNum AND Reservation.TripDate
BETWEEN '7/1/2018' AND '7/31/2018';

/* List one column from the Customers tabled named FullName that joins the LastName and FirstName columns (ex. Doe John). Sort Ascending*/
SELECT CONCAT(LastName, FirstName) AS FullName FROM Customer
ORDER BY LastName asc