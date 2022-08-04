CREATE OR REPLACE FUNCTION average_mark_for_input_user(username varchar)
RETURNS INTEGER AS $$
	DECLARE avg_mark INTEGER;
	BEGIN
		SELECT AVG(r.mark) INTO avg_mark FROM student s JOIN exam_result r ON r.student_id = s.id WHERE s.name = username;
		RETURN avg_mark;
	END;
$$ LANGUAGE 'plpgsql'