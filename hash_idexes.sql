CREATE INDEX IF NOT EXISTS hash_index_1 
ON public.subject 
USING hash(id);

CREATE INDEX IF NOT EXISTS hash_index_3 
ON public.student 
USING hash(id);

CREATE INDEX IF NOT EXISTS hash_index_4 
ON public.exam_result 
USING hash(subject_id);

CREATE INDEX IF NOT EXISTS hash_index_5 
ON public.exam_result 
USING hash(subject_id);