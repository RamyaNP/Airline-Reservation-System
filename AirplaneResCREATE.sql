drop database airres;
create database airres;

\c airres

CREATE TABLE Airline_Company
(
  CName text NOT NULL,
  Cid varchar(4) NOT NULL,
  PRIMARY KEY (Cid)
);

CREATE TABLE Aeroplane
(
  AplaneNo VARCHAR(10) NOT NULL,
  Tot_seats INT NOT NULL,
  Cid VARCHAR(4) NOT NULL,
  PRIMARY KEY (AplaneNo),
  FOREIGN KEY (Cid) REFERENCES Airline_Company(Cid)
  
);

CREATE TABLE Airport
(
  AName text NOT NULL,
  ACode varchar(4) NOT NULL,
  zip NUMERIC(6,0) NOT NULL,
  Location text NOT NULL,
  City text NOT NULL,
  Country text NOT NULL,
  Staete text NOT NULL,
  PRIMARY KEY (ACode)
);

CREATE TABLE Arrives_at
(
	a_Arr_time TIMESTAMP NOT NULL,
	a_Dep_time TIMESTAMP NOT NULL,
	ACode varchar(4) NOT NULL,
	AplaneNo VARCHAR(10) NOT NULL,
	--Trip_id varchar(4) not null,
	FOREIGN KEY (ACode) REFERENCES Airport(ACode),
	FOREIGN KEY (AplaneNo) REFERENCES Aeroplane(AplaneNo),
	PRIMARY KEY (AplaneNo)
	--this table is fr the airport that the plane starts at. as in 
	-- if you had a flight frm blr to bom, blr would b recorded in this table.
);

CREATE TABLE Stops_at
(	Stop_no INT NOT NULL,
	Dist INT NOT NULL,
	Arr_time TIMESTAMP NOT NULL,
	Dep_time TIMESTAMP,
	--Trip_id varchar(4) not null,
	ACode varchar(4) NOT NULL,
	AplaneNo VARCHAR(10) NOT NULL,
	FOREIGN KEY (ACode) REFERENCES Airport(ACode),
	FOREIGN KEY (AplaneNo) REFERENCES Aeroplane(AplaneNo),
	--FOREIGN KEY (Trip_id) REFERENCES 
	PRIMARY KEY (AplaneNo, Acode)
	--this table is fr the airport that the plane stops at. as in 
	-- if you had a flight frm blr to bom, bom would b recorded in this table.
);

CREATE TABLE Seat
(
  SeatNo VARCHAR(4) NOT NULL,
  AplaneNo VARCHAR(10) NOT NULL,
  Availability BOOLEAN NOT NULL,
  Location TEXT NOT NULL,
  SClass TEXT NOT NULL,
  PRIMARY KEY (AplaneNo, SeatNo),
  FOREIGN KEY (AplaneNo) REFERENCES Aeroplane(AplaneNo)
  
);

CREATE TABLE USER1
(
  FName text NOT NULL,
  LName text NOT NULL,
  email VARCHAR NOT NULL,
  PhNo varchar(16) NOT NULL,
  PRIMARY KEY (email)
  
);

CREATE TABLE Flight_Trip
(
  email varchar NOT NULL,
  FT_Dep_Airp VARCHAR(10) NOT NULL,
  FT_Dep_Time TIMESTAMP NOT NULL,
  FT_Arr_Airp VARCHAR(10) NOT NULL,
  Arr_Time TIMESTAMP NOT NULL,
  Trip_ID VARCHAR(13) NOT NULL,
  No_Trav INT NOT NULL,
  Tot_Amt MONEY NOT NULL,
  Tax MONEY NOT NULL,
  Tran_id VARCHAR(10) NOT NULL,
  Currency varchar NOT NULL,
  Base_Amt MONEY NOT NULL,
  Discount MONEY NOT NULL,
  AplaneNo VARCHAR(10) NOT NULL,
  PRIMARY KEY (Trip_ID),
  FOREIGN KEY (AplaneNo) REFERENCES Aeroplane(AplaneNo),
  FOREIGN KEY (email) REFERENCES USER1(email)
  --FOREIGN KEY (FT_Dep_Time) REFERENCES arrives_at(a_Dep_time),
  --FOREIGN KEY (Arr_Time) REFERENCES Stops_at(Arr_time)
  --you cannot do this because foreign key must reference a unique attribute
  --i.e. a foreign key should reference a key.
  
);

CREATE TABLE Traveller
(
  FName text NOT NULL,
  LName text NOT NULL,
  Trav_ID varchar NOT NULL,
  Trip_ID varchar NOT NULL,
  PhNo varchar(16) NOT NULL,
  PRIMARY KEY (Trav_ID, Trip_ID),
  FOREIGN KEY (Trip_ID) REFERENCES Flight_Trip(Trip_ID)
);

CREATE TABLE Reserved
(
  Trav_ID varchar NOT NULL,
  Trip_ID varchar NOT NULL,
  SeatNo VARCHAR(4) NOT NULL,
  AplaneNo VARCHAR(10) NOT NULL,
  FOREIGN KEY (Trav_ID, Trip_ID) REFERENCES Traveller(Trav_ID, Trip_ID),
  FOREIGN KEY (AplaneNo, SeatNo) REFERENCES Seat(AplaneNo, SeatNo),
  --FOREIGN KEY (Trip_ID) REFERENCES Traveller(Trip_ID),
  --FOREIGN KEY (SeatNo) REFERENCES Seat(SeatNo),
  PRIMARY KEY (Trav_ID, Trip_ID, SeatNo, AplaneNo)
);





--to_timestamp('2016-06-22 01:10:25AM', 'yyyy/mm/dd:hh:mi:ssam')
--if you wish to cater to international fligts, use timezone to convert 
--timestamps from different timezones to local 
--time and save. easier to compare.


-- CREATE TABLE Fare
-- (
  -- Tot_Amt INT NOT NULL,
  -- Tax INT NOT NULL,
  -- Tran_id INT NOT NULL,
  -- Trip_ID INT NOT NULL,
  -- Currency INT NOT NULL,
  -- Discount INT NOT NULL,
  -- PRIMARY KEY (Tran_id, Trip_ID),
  -- FOREIGN KEY (Trip_ID) REFERENCES Flight_Trip(Trip_ID) 
-- );
-- the above mentioned relation has been merged with flight trip




