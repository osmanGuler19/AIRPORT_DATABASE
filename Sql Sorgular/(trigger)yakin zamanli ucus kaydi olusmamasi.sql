CREATE 
	OR REPLACE FUNCTION check_land_time ( ) RETURNS TRIGGER AS $$ BEGIN
SELECT
	flights.weekdays,
	flight_legs.arrival_airport_code,
	flight_legs.scheduled_arr_time 
FROM
	flight_legs
	INNER JOIN flights ON flight_legs.flight_id = flights."id" 
WHERE
	weekdays = NEW."weekdays"
	AND arrival_airport_code = NEW."arrival_airport_code"
	AND scheduled_arr_time > TO_TIMESTAMP(NEW."scheduled_arr_time", '%H:%i:%S') - INTERVAL '5 minutes'
	AND scheduled_arr_time < TO_TIMESTAMP(NEW."scheduled_arr_time", '%H:%i:%S') + INTERVAL '5 minutes';
	
	
		RETURN NEW;
	
END;
$$ LANGUAGE'plpgsql';
CREATE TRIGGER check_land_time AFTER UPDATE 
OR INSERT 
	OR DELETE ON fares FOR EACH ROW
	EXECUTE PROCEDURE check_land_time ( );
