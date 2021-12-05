\c airres
alter table stops_at
add column availability int;
update stops_at
set availability= 10;
alter table stops_at
alter column availability set not null;

alter table airline_company
add column tariff_per_km int;

update airline_company
set tariff_per_km=100;

alter table airline_company
alter column tariff_per_km set not null;

alter table airport rename staete to state;

alter table flight_trip 
alter column tot_amt type decimal(10,2),
alter column tax type decimal(10,2),
alter column base_amt type decimal(10,2),
alter column discount type decimal(10,2);
