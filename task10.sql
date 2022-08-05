CREATE OR REPLACE FUNCTION red_user(userid INTEGER)
RETURNS INTEGER AS $$
	DECLARE 
		user_id INTEGER;
        red_marks_conter INTEGER;
	BEGIN
		SELECT count(s.id) INTO red_marks_conter FROM student s 
        JOIN exam_result r ON r.student_id = s.id 
        WHERE s.id = 1003
        AND r.mark <= 3;
        IF red_marks_conter > 2 
            THEN RETURN userid;
        ELSE
            RETURN NULL;
        END IF;
	END;
$$ LANGUAGE 'plpgsql';