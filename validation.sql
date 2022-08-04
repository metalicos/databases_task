CREATE OR REPLACE FUNCTION validate_name()
RETURNS TRIGGER AS $$
BEGIN
  IF NEW.name ~ '^[^@#$]*$'
	THEN RETURN NEW;
  ELSE
     RAISE EXCEPTION 'Error: Validation failed. Forbidden charracters found (@#$).';
  END IF;
END ;
$$ LANGUAGE 'plpgsql';

CREATE OR REPLACE TRIGGER check_name_trigger
    BEFORE INSERT OR UPDATE ON student FOR EACH ROW
EXECUTE PROCEDURE validate_name();