CREATE FUNCTION update_datetime()
RETURNS TRIGGER AS $$
BEGIN
    NEW.updated_datetime = now();
    RETURN NEW;
END;
$$ language 'plpgsql';

CREATE TRIGGER auto_update_datetime_in_student_table
    BEFORE UPDATE ON student FOR EACH ROW
EXECUTE PROCEDURE update_datetime();

CREATE TRIGGER auto_update_datetime_in_subject_table
    BEFORE UPDATE ON subject FOR EACH ROW
EXECUTE PROCEDURE update_datetime();
