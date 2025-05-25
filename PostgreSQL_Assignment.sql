CREATE DATABASE conservation_db;

-- creating table rangers
CREATE Table rangers(
  ranger_id SERIAL PRIMARY KEY,
  name VARCHAR(150),
  region VARCHAR(150)
)

-- creating species table
CREATE TABLE species(
  species_id SERIAL PRIMARY KEY,
  common_name VARCHAR(150),
  scientific_name VARCHAR(150),
  discovery_date DATE,
  conservation_status VARCHAR(80)
)

--  creating table for sightings
CREATE TABLE sightings(
  sighting_id SERIAL PRIMARY KEY,
  ranger_id INTEGER REFERENCES rangers(ranger_id),
  species_id INTEGER REFERENCES species(species_id),
  sighting_time TIMESTAMP,
  location VARCHAR(300),
  notes TEXT
)

-- inserting data into rangers table
INSERT INTO rangers (name, region) VALUES
('Alice Green', 'Northern Hills'),
('Bob White', 'River Delta'),
('Carlo King', 'Mountain Range');

-- SELECT * FROM rangers