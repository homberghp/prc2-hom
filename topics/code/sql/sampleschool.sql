
drop database if exists sampleschool;
create database sampleschool;

\c sampleschool

BEGIN WORK;

CREATE TABLE public.students (
    student_id INTEGER PRIMARY KEY GENERATED BY DEFAULT AS IDENTITY, -- <1>
    firstname TEXT NOT NULL,  -- <2>
    lastname TEXT NOT NULL,
    dob DATE NOT NULL,
    cohort integer NOT NULL DEFAULT  EXTRACT('year' from now()), -- <3>
    email TEXT NOT NULL,
    gender CHARACTER(1) NOT NULL check (gender in ('F','M','U')), -- <4>
    student_grp TEXT NOT NULL,
    active BOOLEAN DEFAULT false NOT NULL
);

INSERT INTO students
       (firstname,lastname,dob         , email                   ,gender,student_grp, active)
VALUES ('Piet'   ,'Puk'   ,'2000-01-13','p.puk@student.fontys.nl','M'   , 'TIPA'    ,true);
COMMIT;
