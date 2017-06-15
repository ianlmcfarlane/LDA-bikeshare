/*MySQL*/

select
fact_trips.id as "Trip ID",
fact_trips.duration as "Duration",
fact_trips.start_date as "Start Date",
start_station.station_name as "Start Station",
start_station.id as "Start Terminal",/*tables provided say this should be str, but ids int*/
fact_trips.end_date as "End Date",
end_station.station_name as "End Station",
end_station.id as "End Terminal", /*tables provided say this should be str, but ids int*/
fact_trips.bike_id as "Bike #",
dim_entity.entity_type as "Subscriber Type",
dim_entity_zip.zip_code as "Zip Code"

from fact_trips

join dim_stations start_station on start_station.id = fact_trips.start_station_id
join dim_stations end_station on end_station.id = fact_trips.end_station_id

join dim_entity on dim_entity.id = fact_trips.entity_id
left join dim_entity_zip on dim_entity_zip.entity_id = fact_trips.entity_id

where fact_trips.start_date between str_to_date('03/01/14', '%m/%d/%Y') and str_to_date('08/31/14', '%m/%d/%Y')
