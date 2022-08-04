-- Begin transaction
BEGIN;

DROP TABLE IF EXISTS public.exam_result;
DROP TABLE IF EXISTS public.student;
DROP TABLE IF EXISTS public.subject;

CREATE TABLE IF NOT EXISTS public.student
(
    id bigint NOT NULL,
    name character(30) NOT NULL,
    surname character(30) NOT NULL,
    date_of_birth date,
    phone_numbers character(15),
    primary_skill character(100) NOT NULL,
    created_datetime timestamp with time zone NOT NULL,
    updated_datetime timestamp with time zone NOT NULL,
    PRIMARY KEY (id),
    CONSTRAINT unique_phone_number UNIQUE (phone_numbers)
);

CREATE TABLE IF NOT EXISTS public.subject
(
    id bigint NOT NULL,
    name character(30) NOT NULL,
    tutor character(30),
    created_datetime timestamp with time zone NOT NULL,
    updated_datetime timestamp with time zone NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS public.exam_result
(
    student_id bigint NOT NULL,
    subject_id bigint NOT NULL,
    mark integer NOT NULL
);

ALTER TABLE IF EXISTS public.exam_result
    ADD CONSTRAINT student_id_fkey FOREIGN KEY (student_id)
    REFERENCES public.student (id) MATCH SIMPLE
    ON UPDATE CASCADE
    ON DELETE CASCADE
    NOT VALID;

ALTER TABLE IF EXISTS public.exam_result
    ADD CONSTRAINT subject_id_fkey FOREIGN KEY (subject_id)
    REFERENCES public.subject (id) MATCH SIMPLE
    ON UPDATE CASCADE
    ON DELETE CASCADE
    NOT VALID;
	
CREATE INDEX subject_id_index
    ON public.subject USING btree
    (id ASC NULLS LAST)
    INCLUDE(id)
    TABLESPACE pg_default;
	
CREATE INDEX student_id_index
    ON public.student USING btree
    (id ASC NULLS LAST)
    INCLUDE(id)
    TABLESPACE pg_default;

-- To make custerized index: ALTER TABLE IF EXISTS public.subject CLUSTER ON subject_id_index;

-- To make custerized index: ALTER TABLE IF EXISTS public.student CLUSTER ON student_id_index;

-- Commit transaction or rollback on error
COMMIT;