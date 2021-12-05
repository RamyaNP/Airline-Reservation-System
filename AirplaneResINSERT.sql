\c airres
INSERT into Airline_Company values('Indigo', 'IG' );
INSERT into Airline_Company values('Spicejet', 'SJ');
INSERT into Airline_Company values('Air India', 'AI');
INSERT into Airline_Company values('Vistara', 'VT');
INSERT into Airline_Company values('AirAsia', 'AA');

INSERT into Aeroplane values ('IG751', 40, 'IG');
INSERT into Aeroplane values ('IG851', 60, 'IG');
INSERT into Aeroplane values ('SJ100', 40, 'SJ');
INSERT into Aeroplane values ('AI785', 60, 'AI');
INSERT into Aeroplane values ('VT757', 40, 'VT');
INSERT into Aeroplane values ('AA651', 40, 'AA');
INSERT into Aeroplane values ('AA751', 60, 'AA');

INSERT into Airport  values('Kempegowda International Airport', 'KIA', 560300, 'KIAL Rd Devanahalli', 'Bangalore', 'India', 'Karnataka');
INSERT into Airport  values('Indira Gandhi International Airport', 'DEL', 110037, 'New Delhi Delhi', 'New Delhi', 'India', 'Delhi');
INSERT into Airport  values('Mangalore International Airport', 'IXE', 574142, 'Bajpe Main Rd Kenjar HC', 'Mangalore', 'India', 'Karnataka');
INSERT into Airport  values('Cochin International Airport', 'CIA', 683111, 'Airport Rd Kochi', 'Kochi', 'India', 'Kerala');
INSERT into Airport  values('Visakhapatnam Airport', 'VTZ', 530009, 'NH 16 Opp Viman Nagar', 'Visakhapatnam', 'India', 'Andhra Pradesh');
INSERT into Airport  values('Surat International Airport', 'STV', 395007, 'Surat-Dumas Rd Gaviyer', 'Surat', 'India', 'Gujarat');
INSERT into Airport  values('Bagdogra Airport', 'IXB', 734421, 'Airport Road Bagdogra', 'Siliguri', 'India', 'West Bengal');
INSERT into Airport  values('Chhatrapati Shivaji International Airport', 'BOM', 400099, 'Mumbai Maharashtra', 'Mumbai', 'India', 'Maharashtra');

INSERT into Arrives_at values('2021-06-27 09:10:25-07', '2021-06-27 12:10:25-07','KIA', 'IG751');
INSERT into Arrives_at values('2021-06-26 23:00:00-07', '2021-06-27 1:00:00-07','DEL', 'IG851');
INSERT into Arrives_at values('2021-07-14 06:00:00-07', '2021-07-14 08:00:00-07','IXE', 'SJ100');
INSERT into Arrives_at values('2021-08-02 15:10:00-07', '2021-08-02 17:30:00-07','CIA', 'AI785');
INSERT into Arrives_at values('2021-08-07 19:30:00-07', '2021-08-07 21:00:00-07','VTZ', 'AA751');
INSERT into Arrives_at values('2021-09-17 13:45:30-07', '2021-09-17 16:30:00-07','STV', 'VT757');
INSERT into Arrives_at values('2021-10-10 10:00:00-07', '2021-10-10 12:30:00-07','BOM', 'AA651');

INSERT into Stops_at values (1, 350, '2021-06-27 13:00:00-07', NULL, 'IXE', 'IG751');
INSERT into Stops_at values (1, 1000, '2021-06-27 3:00:00-07', '2021-06-27 4:00:00-07', 'BOM', 'IG851');
INSERT into Stops_at values (2, 1100, '2021-06-27 6:00:00-07', NULL, 'KIA', 'IG851');
INSERT into Stops_at values (1, 1300, '2021-07-14 10:00:00-07',NULL , 'VTZ', 'SJ100');
INSERT into Stops_at values (1, 500, '2021-08-02 18:30:00-07', '2021-08-02 19:30:00-07', 'KIA', 'AI785');
INSERT into Stops_at values (2, 1000, '2021-08-02 21:00:00-07', NULL, 'BOM', 'AI785');
INSERT into Stops_at values (1, 400, '2021-08-07 21:45:00-07', NULL, 'IXE', 'AA751');
INSERT into Stops_at values (1, 2100, '2021-09-17 21:00:00-07',NULL , 'IXB', 'VT757');
INSERT into Stops_at values (1, 1400, '2021-10-10 14:15:00-07', NULL, 'DEL', 'AA651');

INSERT into Seat values('A23', 'IG751', 'FALSE', 'Window','Economic');
INSERT into Seat values('A24', 'IG751', 'FALSE', 'Window','Economic');
INSERT into Seat values('B15', 'IG851', 'FALSE', 'Aisle','Economic');
INSERT into Seat values('C8', 'SJ100', 'FALSE', 'Window','Economic');
INSERT into Seat values('D4', 'AI785', 'FALSE', 'Aisle','Economic');
INSERT into Seat values('D2', 'VT757', 'FALSE', 'Window','Economic');
INSERT into Seat values('E1', 'AA651', 'TRUE', 'Aisle','Business');

INSERT into USER1 values('Rahul', 'Arora', 'rahul.arora@gmail.com', '+919584267854');
INSERT into USER1 values('Rajiv', 'S', 'rajiv16@yahoo.com', '+918564726549');
INSERT into USER1 values('Srishti', 'Agarwal', 'srishtia@gmail.com', '+919658556478');
INSERT into USER1 values('Ananya', 'Singh', 'ananyasingh12@gmail.com', '+919588564452');
INSERT into USER1 values('Aditi', 'Iyer', 'aditii@gmail.com', '+918885241699');

INSERT into Flight_Trip values('aditii@gmail.com', 'VTZ', '2021-08-07 21:00:00-07', 'IXE', '2021-08-07 21:45:00-07', 'aditi16aug', 1, '2750', '50', '10159', 'Rs.', '3000', '300', 'AA751');
INSERT into Flight_Trip values('rahul.arora@gmail.com', 'KIA', '2021-06-27 12:10:25-07', 'IXE', '2021-06-27 13:00:00-07', 'rahul16dec', 1, '3000', '100', '10110', 'Rs.', '3000', '100', 'IG751');
INSERT into Flight_Trip values('rajiv16@yahoo.com', 'DEL', '2021-06-27 1:00:00-07', 'KIA', '2021-06-27 6:00:00-07', 'rajiv20sept', 1, '2500', '100', '10111', 'Rs.', '2400', '0', 'IG851');
INSERT into Flight_Trip values('srishtia@gmail.com', 'IXE', '2021-07-14 08:00:00-07', 'VTZ', '2021-07-14 10:00:00-07', 'srishti5oct', 1, '3100', '82', '10112', 'Rs.', '3100', '82', 'SJ100');
INSERT into Flight_Trip values('ananyasingh12@gmail.com', 'CIA', '2021-08-02 17:30:00-07', 'BOM', '2021-08-02 21:00:00-07', 'ananya15oct', 1, '2197', '97', '10113', 'Rs.', '2100', '0', 'AI785');


INSERT into Traveller values('Rahul', 'Arora', 'ra1', 'rahul16dec', '+919584267854');
INSERT into Traveller values('Rajiv', 'S', 'rs2', 'rajiv20sept', '+918564726549');
INSERT into Traveller values('Srishti', 'Agarwal', 'sa1', 'srishti5oct', '+919658556478');
INSERT into Traveller values('Ananya', 'Singh', 'as1', 'ananya15oct', '+919588564452');
INSERT into Traveller values('Aditi', 'Iyer', 'ai1', 'aditi16aug', '+918885241699');


INSERT into Reserved values('ra1', 'rahul16dec', 'A23', 'IG751');
INSERT into Reserved values('rs2', 'rajiv20sept', 'B15', 'IG851');
INSERT into Reserved values('sa1', 'srishti5oct', 'C8', 'SJ100');
INSERT into Reserved values('as1', 'ananya15oct', 'D4', 'AI785');
INSERT into Reserved values('ai1', 'aditi16aug', 'A24', 'IG751');

INSERT into Airline_Company values('Go First', 'GF' );
INSERT into Airline_Company values('Star Air', 'OG');
INSERT into Airline_Company values('TruJet', 'TJ');
INSERT into Airline_Company values('Kingfisher Airlines', 'KF');
INSERT into Airline_Company values('Jet Airways', 'JA');

INSERT into Aeroplane values ('GF421', 40, 'GF');
INSERT into Aeroplane values ('KF215', 60, 'KF');
INSERT into Aeroplane values ('OG127', 40, 'OG');
INSERT into Aeroplane values ('TJ785', 60, 'TJ');
INSERT into Aeroplane values ('JA617', 40, 'JA');
INSERT into Aeroplane values ('GF611', 60, 'GF');
INSERT into Aeroplane values ('OG230', 40, 'OG');

INSERT into Airport  values('Sardar Vallabhbhai Patel International Airport', 'AMD', 380003, 'Hansol, Ahmedabad', 'Ahmedabad', 'India', 'Gujarat');
INSERT into Airport  values('Kannur International Airport', 'CNN',  670702, 'Mattannur, Mattannur Rd.', 'Kannur', 'India', 'Kerala');
INSERT into Airport  values('Trivandrum International Airport', 'TRV', 695008, 'Airport Rd, Chacka', 'Thiruvananthapuram', 'India', 'Kerala');
INSERT into Airport  values('Aurangabad Airport', 'IXU', 431006, 'Jalna Road, Chilkalthana', 'Aurangabad', 'India', 'Maharashtra');
INSERT into Airport  values('Imphal International Airport', 'IMF', 795140, 'Tipaimukh Rd, Hiangtam Lamka', 'Imphal', 'India', 'Manipur');
INSERT into Airport  values('Shillong Airport', 'SHL', 793103, 'Shillong Airport Road', 'Umroi', 'India', 'Meghalaya');
INSERT into Airport  values('Biju Patnaik International Airport', 'BBI', 751020, 'Airport Rd, Aerodrome Area', 'Bhubaneswar', 'India', 'Orissa');
INSERT into Airport  values('Veer Surendra Sai Airport', 'JRG', 768204, 'SH 10', 'Durlaga', 'India', 'Orissa');

INSERT into Arrives_at values('2021-07-07 09:10:25-07', '2021-07-07 12:10:25-07','IXU', 'GF421');
INSERT into Arrives_at values('2021-10-26 23:00:00-07', '2021-10-27 1:00:00-07','SHL', 'KF215');
INSERT into Arrives_at values('2021-07-14 06:00:00-07', '2021-07-14 08:00:00-07','CNN', 'OG230');
INSERT into Arrives_at values('2021-08-02 15:10:00-07', '2021-08-02 17:30:00-07','JRG', 'JA617');
INSERT into Arrives_at values('2021-08-01 18:30:00-07', '2021-08-01 19:00:00-07','BBI', 'OG127');
INSERT into Arrives_at values('2021-09-17 13:45:30-07', '2021-09-17 16:30:00-07','AMD', 'TJ785');
INSERT into Arrives_at values('2021-10-12 10:00:00-07', '2021-10-12 12:30:00-07','TRV', 'GF611');

INSERT into Stops_at values(1, 1110, '2021-07-07 16:10:25-07', '2021-07-07 16:40:00-07','KIA', 'GF421');
INSERT into Stops_at values(2, 2273, '2021-07-07 20:10:25-07', NULL,'JRG', 'GF421');
INSERT into Stops_at values(1, 2556, '2021-10-12 20:00:00-07', NULL,'IMF', 'GF611');
INSERT into Stops_at values(1, 1252, '2021-08-02 19:10:00-07', '2021-08-02 19:30:00-07','AMD', 'JA617');
INSERT into Stops_at values(2, 2220, '2021-08-02 21:10:00-07', NULL,'KIA', 'JA617');
INSERT into Stops_at values(1, 2605, '2021-07-14 12:30:00-07', '2021-07-14 13:00:00-07','BOM', 'OG230');
INSERT into Stops_at values(2, 3115, '2021-07-14 15:30:00-07', '2021-07-14 15:45:00-07','IXE', 'OG230');
INSERT into Stops_at values(3, 4001, '2021-07-14 18:30:00-07', NULL,'KIA', 'OG230');
INSERT into Stops_at values(1, 1015, '2021-09-17 20:45:30-07', '2021-09-17 21:30:00-07','KIA', 'TJ785');
INSERT into Stops_at values(2, 2000, '2021-09-17 17:45:30-07', NULL,'STV', 'TJ785');
INSERT into Stops_at values(1, 1028, '2021-10-27 06:00:00-07', NULL,'DEL', 'KF215');
INSERT into Stops_at values(1, 1314, '2021-08-01 22:30:00-07', NULL,'IXB', 'OG127');



INSERT into Seat values('A23', 'GF611', 'f', 'Window','Business');
INSERT into Seat values('B15', 'GF611' ,'f', 'Window','Business');
INSERT into Seat values('C8', 'IG751', 'f', 'Aisle','Business');
INSERT into Seat values('D4', 'JA617' ,'f', 'Window','Business');
INSERT into Seat values('A24', 'JA617', 'f', 'Aisle','Business');
INSERT into Seat values('A10', 'JA617', 'FALSE', 'Window','Business');
INSERT into Seat values('A12', 'JA617', 't', 'Window','Business');
INSERT into Seat values('A10', 'IG751', 't', 'Aisle','Business');
INSERT into Seat values('B15', 'TJ785' ,'t', 'Window','Business');
INSERT into Seat values('B12', 'TJ785' ,'t', 'Window','Business');
INSERT into Seat values('B10', 'OG230' ,'t', 'Window','Business');

INSERT into USER1 values('Aman', 'Singh', 'amans1122@gmail.com', '+911202516171');
INSERT into USER1 values('Preeti', 'S', 'preet1s6@yahoo.com', '+912224307018');
INSERT into USER1 values('Kalam', 'Agarwal', 'kalamtia@gmail.com', '+91226634901');
INSERT into USER1 values('Maria', 'DSouza', 'mkdsouza12@gmail.com', '+9125586048');
INSERT into USER1 values('Aditi', 'Hasyagar', 'aditi.hasyagar@gmail.com', '+918026706971');

INSERT into Flight_Trip values('aditi.hasyagar@gmail.com', 'TRV', '2021-10-12 12:30:00-07', 'IMF', '2021-10-12 20:00:00-07', 'adihas12oct', 3, '2750', '50', '10159', 'Rs.', '3000', '300', 'GF611');
INSERT into Flight_Trip values('mkdsouza12@gmail.com', 'KIA', '2021-06-27 12:10:25-07', 'IXE', '2021-06-27 13:00:00-07', 'mkdsou27jun', 1, '3000', '100', '10110', 'Rs.', '3000', '100', 'IG751');
INSERT into Flight_Trip values('preet1s6@yahoo.com', 'JRG', '2021-08-02 17:30:00-07', 'KIA', '2021-08-02 21:10:00-07', 'preet02aug', 2, '2500', '100', '10111', 'Rs.', '2400', '0', 'JA617');
INSERT into Flight_Trip values('preet1s6@yahoo.com', 'CNN', '2021-07-14 08:00:00-07', 'IXE', '2021-07-14 15:30:00-07', 'preet14jul', 2, '3100', '82', '10112', 'Rs.', '3100', '82','OG230');
INSERT into Flight_Trip values('kalamtia@gmail.com', 'AMD', '2021-09-17 16:30:00-07', 'STV', '2021-09-17 17:45:30-07', 'kalam17sept', 1, '2197', '97', '10113', 'Rs.', '2100', '0', 'TJ785');

INSERT into Traveller values('Piya', 'Arora', 'pa1', 'adihas12oct', '+919511267854');
INSERT into Traveller values('Pilar', 'S', 'ps2', 'adihas12oct', '+918564891549');
INSERT into Traveller values('Srishti', 'Agarwal', 'sa1', 'adihas12oct', '+919658556478');
INSERT into Traveller values('Maria', 'DSouza', 'md1', 'mkdsou27jun', '+9125586048');
INSERT into Traveller values('Preeti', 'S', 'ps1', 'preet02aug', '+912224307018');
INSERT into Traveller values('Marish', 'S', 'ps2', 'preet02aug', '+918661755377');
INSERT into Traveller values('Manish', 'Qureshi', 'mq1', 'preet14jul', '+918881101099');
INSERT into Traveller values('Fathima', 'Qureshi', 'mq2', 'preet14jul', '+918881213321');
INSERT into Traveller values('Meera', 'Kamath', 'mk1', 'kalam17sept', '+911231234511');

INSERT into Reserved values('pa1', 'adihas12oct', 'A23', 'GF611');
INSERT into Reserved values('sa1', 'adihas12oct', 'B15', 'GF611');
INSERT into Reserved values('md1', 'mkdsou27jun', 'C8', 'IG751');
INSERT into Reserved values('ps1', 'preet02aug', 'D4', 'JA617');
INSERT into Reserved values('ps2', 'preet02aug', 'A24', 'JA617');

