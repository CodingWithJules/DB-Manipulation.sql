/*Create a view named NHTrips_VW. It consists of a trip ID, trip name, start location, distance, maximum group size, type and season for every trip located in New Hampshire (NH).  Show the SQL Server code for the view. */
CREATE VIEW NHTrips_NW AS
SELECT TripID, TripName, StartLocation, Distance, MaxGrpSize, Type, season
FROM Trip
WHERE State='NH';

/*Create a view named ReservationCustomer_VW. It consists of the reservation ID, trip ID, trip name, trip date, customer number, customer last name, customer first name, and phone number for trips whose guide is Glory Unser or Susan Kiley. */
CREATE VIEW ReservationCustomer_VW AS
SELECT Rservation.ReservationID
, Trip.TripID
, Trip.TripName
, Reservation.TripDate
, Customer.CustomerNum
, Customer.LastName
, Customer.FirstName
, Customer.Phone

FROM [COLONIAL].[dbo].[Trip]

INNER JOIN [Reservation] ON [Trip.[TripID]] = [Reservation].[TripID]
INNER JOIN [TripGuides] ON [Trip.[TripID]] = [TripGuides].[TripID]
INNER JOIN [Customer] ON [Reservation].[CustomerNum] = [Customer].[CustomerNum]

WHERE TripGuides.GuideNum = 'UG01' OR TripGuides.GuideNum = 'KS01'

/*Create the following indexes: [Show the SQL Server code for each index]*/
     /*A. Create an index named TripIndex1 on the trip name field in the trip table.*/
     CREATE INDEX TripIndex1 ON trip(Tripname)
     /*B. Create a unique index named Tripindex2 on the type field in the trip table.*/
     CREATE UNIQUE INDEX TripIndex2 ON trip(Type)
     /*C. Create an index named Tripindex3 on the type and season fields in the trip table and list the seasons in descending order. */
     CREATE INDEX TripIndex3 ON trip(type,season DESC)

/*Add to the customer table a new character field name Waiver that is one character in length and is a required field.  Show the SQL Server instruction.*/
ALTER TABLE [dbo].[Customer]
ADD [Waiver] VARCHAR{1} NOT NULL DEFAULT(' ')

/*What command(s) would you use to get rid of the TripGuides table? [Show the SQL Server instruction, but do not execute it]*/
DROP TABLE [dbo].[TripGuides]
