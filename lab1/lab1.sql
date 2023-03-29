CREATE TABLE Location(
    location_id SERIAL PRIMARY KEY,
    name VARCHAR(20) NOT NULL
);

CREATE TABLE Person(
    person_id SERIAL PRIMARY KEY,
    name VARCHAR(20) NOT NULL,
    gender VARCHAR(6) NOT NULL,
    current_location INTEGER NOT NULL REFERENCES Location(location_id) ON DELETE CASCADE
);

CREATE TABLE Corporation(
    corporation_id SERIAL PRIMARY KEY,
    name VARCHAR(20) NOT NULL,
    location INTEGER NOT NULL REFERENCES Location(location_id) ON DELETE CASCADE
);

CREATE TABLE Government(
    government_id SERIAL PRIMARY KEY,
    name VARCHAR(20) NOT NULL,
    location INTEGER NOT NULL REFERENCES Location(location_id) ON DELETE CASCADE
);

CREATE TABLE Farm(
    farm_id SERIAL PRIMARY KEY,
    name VARCHAR(20) NOT NULL,
    location INTEGER NOT NULL REFERENCES Location(location_id) ON DELETE CASCADE
);


CREATE TABLE Disease(
    disease_id SERIAL PRIMARY KEY,
    name VARCHAR(20) NOT NULL
);

CREATE TABLE Vaccine(
    vaccine_id SERIAL PRIMARY KEY,
    name VARCHAR(20) NOT NULL,
    disease INTEGER NOT NULL REFERENCES Disease(disease_id) ON DELETE CASCADE,
    production_method VARCHAR(30) NOT NULL

);

CREATE TABLE Composition_of_the_government(
    id SERIAL PRIMARY KEY,
    person_id INTEGER NOT NULL REFERENCES Person(person_id) ON DELETE CASCADE,
    government_id INTEGER NOT NULL REFERENCES Government(government_id) ON DELETE CASCADE
);

CREATE TABLE Farm_workers(
    id SERIAL PRIMARY KEY,
    person_id INTEGER NOT NULL REFERENCES Person(person_id) ON DELETE CASCADE,
    farm_id INTEGER NOT NULL REFERENCES Farm(farm_id) ON DELETE CASCADE
);

CREATE TABLE Corporate_staff(
    id SERIAL PRIMARY KEY,
    person_id INTEGER NOT NULL REFERENCES Person(person_id) ON DELETE CASCADE,
    corporation_id INTEGER NOT NULL REFERENCES Corporation(corporation_id) ON DELETE CASCADE
);

CREATE TABLE Vaccine_trial(
    id SERIAL PRIMARY KEY,
    corporation_id INTEGER NOT NULL REFERENCES Corporation(corporation_id) ON DELETE CASCADE,
    vaccine_id INTEGER NOT NULL REFERENCES Vaccine(vaccine_id) ON DELETE CASCADE,
    time DATE NOT NULL,
    farm_id INTEGER NOT NULL REFERENCES Farm(farm_id) ON DELETE CASCADE,
    government_notification BOOLEAN NOT NULL,
    farm_workers_notification BOOLEAN NOT NULL
);


INSERT INTO Location(name) VALUES('Купертино'),('Чили');
INSERT INTO Person(name,gender,current_location) VALUES('Владимир','муж',2),('Алексей','муж',2),('Максим','муж',1),('Дмитрий','муж',1);
INSERT INTO Disease(name) VALUES ('бешенство');
INSERT INTO Vaccine(name,disease,production_method) VALUES('вакцина №1', 1, 'бионженерия');
INSERT INTO Farm(name,location) VALUES ('Ферма №1',2);
INSERT INTO Farm_workers(person_id,farm_id) VALUES (3,1);
INSERT INTO Corporation(name,location) VALUES ('Ген-ая(биосинтеза)',1);
INSERT INTO Corporate_staff(person_id,corporation_id) VALUES(1,1),(2,1);
INSERT INTO Government(name,location) VALUES ('Правительство 1',2);
INSERT INTO Composition_of_the_government(person_id,government_id) VALUES (4,1);
INSERT INTO Vaccine_trial(corporation_id,vaccine_id,time,farm_id,government_notification,
farm_workers_notification) VALUES (1,1,'1986-03-28',1,FALSE,FALSE);



SELECT * FROM Location;
SELECT * FROM Corporation;
SELECT * FROM Person;
SELECT * FROM Farm;
SELECT * FROM Farm_workers;
SELECT * FROM Government;
SELECT * FROM Composition_of_the_government;
SELECT * FROM Vaccine;
SELECT * FROM Disease;
SELECT * FROM Vaccine_trial;
SELECT * FROM Corporate_staff;

DROP TABLE Location CASCADE;
DROP TABLE Corporation CASCADE;
DROP TABLE Person CASCADE;
DROP TABLE Farm CASCADE;
DROP TABLE Farm_workers CASCADE;
DROP TABLE Government CASCADE;
DROP TABLE Composition_of_the_government CASCADE;
DROP TABLE Vaccine CASCADE;
DROP TABLE Disease CASCADE;
DROP TABLE Vaccine_trial CASCADE;
DROP TABLE Corporate_staff CASCADE;