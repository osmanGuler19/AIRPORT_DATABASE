SELECT flights.* FROM leg_instances
INNER JOIN flight_legs ON leg_instances.flight_leg_id = flight_legs.id
INNER JOIN flights ON flight_legs.flight_id = flights.id 
WHERE date_at = '2021-06-06' 
