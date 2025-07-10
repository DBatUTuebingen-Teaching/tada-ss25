DROP TABLE IF EXISTS student;
DROP TYPE  IF EXISTS degree;
DROP TYPE  IF EXISTS subject;
DROP TABLE IF EXISTS staff;
DROP TABLE IF EXISTS class;
DROP TYPE  IF EXISTS room;
DROP TABLE IF EXISTS enrolled;
DROP TABLE IF EXISTS department;

CREATE TYPE degree AS ENUM (
	'M.Sc.',
	'B.Sc.'
);

CREATE TYPE subject AS ENUM (
	'Animal Science',
	'Law',
	'Psychology',
	'Kinesiology',
	'Architecture',
	'Civil Engineering',
	'Computer Science',
	'Economics',
	'Accounting',
	'History',
	'Mechanical Engineering',
	'Computer Engineering',
	'Finance',
	'Veterinary Medicine',
	'Education',
	'English',
	'Electrical Engineering'
);

CREATE TABLE student (
	student_id     int,
	student_name   text,
	major          subject,
	pursued_degree degree,
	age            int
);

ALTER TABLE student ADD PRIMARY KEY (student_id);
ALTER TABLE student ALTER COLUMN student_name   SET NOT NULL;
ALTER TABLE student ALTER COLUMN major          SET NOT NULL;
ALTER TABLE student ALTER COLUMN pursued_degree SET NOT NULL;
ALTER TABLE student ALTER COLUMN age            SET NOT NULL;

CREATE TABLE staff (
	staff_id            int,
	staff_name          text,
	staff_department_id int,
	age                 int
);

ALTER TABLE staff ADD PRIMARY KEY (staff_id);
ALTER TABLE staff ALTER COLUMN staff_name SET NOT NULL;
ALTER TABLE staff ALTER COLUMN age        SET NOT NULL;

CREATE TYPE room AS ENUM (
	'Q3',
	'R15',
	'R128',
	'R12',
	'1320 DCL',
	'20 AVW'
);

CREATE TABLE class (
	class_id       int,
	class_name     text,
	meets_at       text,
	room           room,
	class_staff_id int
);

ALTER TABLE class ADD PRIMARY KEY (class_id);
ALTER TABLE class ALTER COLUMN meets_at       SET NOT NULL;
ALTER TABLE class ALTER COLUMN class_name     SET NOT NULL;
ALTER TABLE class ALTER COLUMN room           SET NOT NULL;
ALTER TABLE class ALTER COLUMN class_staff_id SET NOT NULL;

CREATE TABLE enrolled (
	enrolled_student_id int,
	enrolled_class_id   int
);

ALTER TABLE enrolled ADD PRIMARY KEY (enrolled_student_id, enrolled_class_id);

CREATE TABLE department (
	department_id   int,
	department_name text
);

ALTER TABLE department ADD PRIMARY KEY (department_id);
ALTER TABLE department ALTER COLUMN department_name SET NOT NULL;
