CREATE INDEX IF NOT EXISTS subject_id_index
    ON public.subject USING btree
    (id ASC NULLS LAST)
    INCLUDE(id)
    TABLESPACE pg_default;
	
CREATE INDEX IF NOT EXISTS student_id_index
    ON public.student USING btree
    (id ASC NULLS LAST)
    INCLUDE(id)
    TABLESPACE pg_default;
	
CREATE INDEX IF NOT EXISTS exam_result_subject_id_index
    ON public.exam_result USING btree
    (subject_id ASC NULLS LAST)
    INCLUDE(subject_id)
    TABLESPACE pg_default;
	
CREATE INDEX IF NOT EXISTS exam_result_student_id_index
    ON public.exam_result USING btree
    (student_id ASC NULLS LAST)
    INCLUDE(student_id)
    TABLESPACE pg_default;