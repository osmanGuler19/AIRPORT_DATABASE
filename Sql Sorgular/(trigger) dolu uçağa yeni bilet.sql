CREATE 
	OR REPLACE FUNCTION seat_control ( ) RETURNS TRIGGER AS $$ BEGIN
	
	
	
	IF(
	SELECT no_of_avail_seats
	FROM leg_instances INNER JOIN flight_legs ON leg_instances.flight_leg_id=flight_legs."id"
	
	WHERE NEW.flight_id = flight_legs.flight_id
	
	
	)=0
	THEN
	
	RAISE EXCEPTION 'UCAK DOLMUSTUR';
	
		
	END IF	;
	

	
	RETURN NEW;
	
END;
$$ LANGUAGE'plpgsql';
CREATE TRIGGER seat_control AFTER UPDATE 
OR INSERT 
	OR DELETE ON fares FOR EACH ROW
	EXECUTE PROCEDURE seat_control ();
