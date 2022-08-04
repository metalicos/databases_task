CREATE OR REPLACE FUNCTION average_mark_for_input_subject_name(subject_name VARCHAR)
RETURNS INTEGER AS $$
    DECLARE avg_mark INTEGER;
    BEGIN
        SELECT AVG(r.mark) INTO avg_mark FROM subject s JOIN exam_result r ON s.id = r.subject_id WHERE s.name = subject_name;
        RETURN avg_mark;
    END;
$$ LANGUAGE 'plpgsql';