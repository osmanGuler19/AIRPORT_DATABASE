CREATE OR REPLACE FUNCTION "public"."ffc_degree_function"()
  RETURNS "pg_catalog"."trigger" AS $BODY$
BEGIN
	IF(NEW.mileage_sum) <= 5000 THEN
	UPDATE ffcs SET ffc_degree =1 WHERE NEW.id = ffcs.customer_id;

	
	ELSIF(NEW.mileage_sum) >5000 AND (NEW.mileage_sum) <= 10000 THEN
	UPDATE ffcs SET ffc_degree =2 WHERE NEW.id = ffcs.customer_id;

	
	ELSE 
	UPDATE ffcs SET ffc_degree =3 WHERE NEW.id = ffcs.customer_id;
	END IF;


RETURN NEW;
END;
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100


CREATE TRIGGER ffc_degree_consistency
AFTER INSERT OR UPDATE
ON customers
FOR EACH ROW 
EXECUTE PROCEDURE ffc_degree_function()