\c airres
--All the flights that fly more that 1500 kms
select distinct on (aplaneno) aplaneno, dist, acode from stops_at where dist>1500;

--All the states whose airports are in the system
select staete from airport group by staete;

--Flight details for all flights flying to bangalore
select * from stops_at where acode='KIA';

--Trips where there are more than 1 travellers
select * from flight_trip where no_trav>1;

--All the travellers who got a discount
select * from flight_trip where discount>'0';

--COMPLEX SQL Queries

--all trips where the user who booked it are the ppl that travelled
select t.trip_id, t.fname, t.lname, u.email, f.aplaneno, f.ft_dep_airp, f.ft_arr_airp from flight_trip F, user1 U, traveller T where U.email=F.email and F.trip_id=T.trip_id and U.fname=T.fname and U.lname=T.lname;

--all the trips where ppl that booked weren't the people that travelled

select * from flight_trip F where f.trip_id not in (select f.trip_id from flight_trip F, user1 U, traveller T where U.email=F.email and F.trip_id=T.trip_id and U.fname=T.fname and U.lname=T.lname);

--All the companies that dont have flights to bangalore
select * from airline_company where cid in (select cid from aeroplane where aplaneno in (select aplaneno from stops_at where aplaneno not in (select aplaneno from stops_at where acode='KIA')));


--A count of the flights chartered by each company and the total seats
select cname, count(distinct aplaneno), sum(tot_seats) from airline_company natural join aeroplane group by cname;

-- details of all the seats that on IG751 that have not been reserved
select * from seat where seatno not in (select seatno from reserved where aplaneno='IG751') and aplaneno='IG751';

-- details of all the flights flying from blore to bom without layover on the 27th of Jun
select * from arrives_at a, stops_at s where a.aplaneno=s.aplaneno and a.acode='KIA' and s.acode='IXE' and stop_no=1 and date(a_dep_time)='2021-06-27';

--QUERY EXECUTION PLAN 

--Simple Query
explain analyze verbose select distinct on (aplaneno) aplaneno, dist, acode from stops_at where dist>1500;

explain analyze verbose select staete from airport group by staete;

explain analyze verbose select * from stops_at where acode='KIA';

explain analyze verbose select * from flight_trip where no_trav>1;

explain analyze verbose select * from flight_trip where discount>'0';

--Complex Queries

explain analyze verbose select t.trip_id, t.fname, t.lname, u.email, f.aplaneno, f.ft_dep_airp, f.ft_arr_airp from flight_trip F, user1 U, traveller T where U.email=F.email and F.trip_id=T.trip_id and U.fname=T.fname and U.lname=T.lname;

explain analyze verbose select * from flight_trip F where f.trip_id not in (select f.trip_id from flight_trip F, user1 U, traveller T where U.email=F.email and F.trip_id=T.trip_id and U.fname=T.fname and U.lname=T.lname);

explain analyze verbose select * from airline_company where cid in (select cid from aeroplane where aplaneno in (select aplaneno from stops_at where aplaneno not in (select aplaneno from stops_at where acode='KIA')));

explain analyze verbose select cname, count(distinct aplaneno), sum(tot_seats) from airline_company natural join aeroplane group by cname;

explain analyze verbose select * from seat where seatno not in (select seatno from reserved where aplaneno='IG751') and aplaneno='IG751';

explain analyze verbose select * from arrives_at a, stops_at s where a.aplaneno=s.aplaneno and a.acode='KIA' and s.acode='IXE' and stop_no=1 and date(a_dep_time)='2021-06-27';

drop owned by admin ;
drop owned by tester;
drop owned by developer;
drop owned by client;
drop owned by acomp;
drop user admin;
drop user developer;
drop user tester;
drop user client;
drop user acomp;
create user Admin;
grant all privileges on database airres to Admin;
create user Tester;
grant select, update, insert, delete on table stops_at to Tester;
grant select, update, insert, delete on table arrives_at to Tester;
grant select, update, insert, delete on table flight_trip to Tester;
grant select, update, insert, delete on table reserved to Tester;
grant select, update, insert, delete on table seat to Tester;
create user Developer;
GRANT SELECT,update, insert, delete ON ALL TABLES IN SCHEMA public TO Developer;
grant create on database airres to Developer;
grant references on all tables in schema public to Developer;
create user Client;
grant select on all tables in schema public to Client;
create user AComp;
grant all privileges on table aeroplane, arrives_at, stops_at, seat to Acomp;

