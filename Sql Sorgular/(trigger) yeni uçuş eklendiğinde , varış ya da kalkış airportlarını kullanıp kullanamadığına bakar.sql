CREATE 
	OR REPLACE FUNCTION control_airplane_can_land ( ) RETURNS TRIGGER AS $$ BEGIN
	IF
		(
		SELECT COUNT
			( * ) 
		FROM
			can_land
			INNER JOIN airports ON can_land.airport_code = airports.code
			INNER JOIN airplane_types ON can_land.airplane_type_id = airplane_types."id"
			INNER JOIN airplanes ON airplane_types."id" = airplanes.airplane_type_id 
		WHERE
			airplanes."id" = NEW."airplane_id" 
			AND can_land.airport_code IN ( NEW."leg_instances.arrival_airport_code" ) 
			) = 0 THEN
			RAISE EXCEPTION 'Bu airporta inemez';
		
	END IF;
	IF
		(
		SELECT COUNT
			( * ) 
		FROM
			can_land
			INNER JOIN airports ON can_land.airport_code = airports.codea
			INNER JOIN airplane_types ON can_land.airplane_type_id = airplane_types."id" 
		WHERE
			airplanes."id" = NEW."airplane_id" 
			AND can_land.airport_code IN ( NEW."leg_instances.departure_airport_code" ) 
			) = 0 THEN
			RAISE EXCEPTION 'Bu airporttan uçamaz';
		
	END IF;
	RETURN NEW;
	
END;
$$ LANGUAGE'plpgsql';
CREATE TRIGGER control_airplane_can_land BEFORE UPDATE 
OR INSERT ON leg_instances FOR EACH ROW
EXECUTE PROCEDURE control_airplane_can_land ( );
