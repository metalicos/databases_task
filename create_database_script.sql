-- Begin transaction
BEGIN;

DROP TABLE IF EXISTS public.student;

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

DROP TABLE IF EXISTS public.subject;

CREATE TABLE IF NOT EXISTS public.subject
(
    id bigint NOT NULL,
    name character(30) NOT NULL,
    tutor character(30),
    created_datetime timestamp with time zone NOT NULL,
    updated_datetime timestamp with time zone NOT NULL,
    PRIMARY KEY (id)
);

DROP TABLE IF EXISTS public.exam_result;

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

-- Commit transaction or rollback on error
COMMIT;