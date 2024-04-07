CREATE DATABASE MountainClimb;
CREATE SCHEMA PublicSchemas;

CREATE TABLE PublicSchemas.Climber (
    climber_id SERIAL PRIMARY KEY NOT NULL,
    first_name VARCHAR(50) NOT null,
    last_name VARCHAR(50) NOT NULL,
    gender BIT NOT NULL CHECK (gender IN ('Male', 'Female')),
    birthdate DATE NOT NULL CHECK (birthdate > '2000-01-01')
);

CREATE TABLE PublicSchemas.ClimbStatistics (
    record_id SERIAL PRIMARY KEY NOT NULL,
    climber_id INT REFERENCES PublicSchemas.Climber(climber_id),
    measured_value NUMERIC NOT NULL CHECK (measured_value >= 0),
    record_date DATE NOT NULL CHECK (record_date > '2000-01-01')
);

INSERT INTO PublicSchemas.Climber(first_name, last_name, gender, birthdate)
VALUES 
    ('Landon', 'Mccarthy', 'Male', '2000-03-14'),
    ('Kamryn', 'James', 'Female', '2004-02-28'),
    ('Lila', 'Garcia', 'Female', '2002-05-19'),
    ('John', 'Sullivan', 'Male', '2008-11-15'),
    ('Will', 'Hill', 'Male', '2001-02-03'),
    ('Michael', 'Phelps', 'Male', '2009-04-22'),
    ('Anna', 'Daugherty', 'Female', '2001-09-13'),
    ('Lewis', 'Gibson', 'Male', '2000-12-03'),
    ('Taylor', 'Swift', 'Female', '2007-03-18'),
    ('Ashley', 'Mora', 'Female', '2003-06-12'),
    ('Tom', 'Henderson', 'Male', '2004-08-24'),
    ('Liza', 'Bennett', 'Female', '2006-08-17'),
    ('Jack', 'Eaton', 'Male', '2002-10-22'),
    ('Valeria', 'Bowers', 'Female', '2005-02-27'),
    ('Suzy', 'Mckinney', 'Female', '2001-05-27'),
    ('Juan', 'Lopez', 'Male', '2000-11-13'),
    ('Ryan', 'Wick', 'Male', '2002-04-24'),
    ('Candise', 'Padilla', 'Female', '2007-02-15'),
    ('George', 'Russell', 'Male', '2004-01-28'),
    ('Fernando', 'Alonso', 'Male', '2009-07-22');
    
INSERT INTO PublicSchemas.ClimberStatistics(climber_id, measured_value, record_date)
VALUES
    (1, 3062, '2023-08-23'),
    (4, 2344, '2023-07-12'),
    (12, 3223, '2023-08-16'),
    (3, 3110, '2023-05-04'),
    (5, 4025, '2023-10-23'),
    (14, 2764, '2023-06-28'),
    (18, 3550, '2023-07-11'),
    (15, 4654, '2023-08-29'),
    (20, 4230, '2023-05-03'),
    (11, 3715, '2023-06-11'),
    (9, 2965, '2023-10-17'),
    (2, 4510, '2023-06-05'),
    (16, 3780, '2023-07-23'),
    (17, 3780, '2023-09-22'),
    (6, 3326, '2023-07-12'),
    (10, 4520, '2023-08-30'),
    (8, 4788, '2023-07-06'),
    (13, 2515, '2023-09-26'),
    (19, 4840, '2023-05-03'),
    (7, 4990, '2023-06-11');
    
   
ALTER TABLE PublicSchemas.Climber
ADD COLUMN record_ts TIMESTAMP DEFAULT current_date;

ALTER TABLE PublicSchemas.ClimbStatistics
ADD COLUMN record_ts TIMESTAMP DEFAULT current_date;


UPDATE PublicSchemas.Climber
SET record_ts = current_date
WHERE record_ts IS NULL;

UPDATE PublicSchemas.ClimbStatistics
SET record_ts = current_date
WHERE record_ts IS NULL;
