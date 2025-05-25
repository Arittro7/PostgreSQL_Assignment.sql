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

SELECT * FROM rangers


-- inserting data into species table
INSERT INTO species (common_name, scientific_name, discovery_date, conservation_status) VALUES
('Snow Leopard', 'Panthera uncia','1775-01-01', 'Endangered' ),
('Bangle Tiger', 'Panthera tigris','1758-01-01', 'Endangered' ),
('Red Panda', 'Ailurus fulgens','1825-01-01', 'Vulnerable' ),
('Asiatic Elephant', 'Elephas maximus indicus','1758-01-01', 'Endangered' );

SELECT * FROM species

-- inserting data into sighting table
INSERT INTO sightings (sighting_id, species_id, ranger_id, location, sighting_time, notes) VALUES
(1, 1, 1, 'Peak Ridge', '2024-05-10 07:45:00', 'Camera trap image captured'),
(2, 2, 2, 'Bankwood Area', '2024-05-12 16:20:00', 'Juvenile seen'),
(3, 3, 3, 'Bamboo Grove East', '2024-05-15 09:10:00', 'Feeding observed'),
(4, 1, 2, 'Snowfall Pass', '2024-05-18 18:30:00', NULL);

SELECT * FROM sightings

-- Problem 1: 
INSERT INTO rangers (name, region) VALUES
('Derek Fox', 'Costal Plains');

-- Problem 2: 
SELECT count(DISTINCT species_id) as unique_species_count FROM sightings;

-- Problem 3: 
SELECT * FROM sightings
WHERE location ILIKE '%pass%' ;

-- Problem 4: 
SELECT name, count(*) as total_sightings from sightings
JOIN rangers ON sightings.ranger_id = rangers.ranger_id
GROUP BY rangers.ranger_id;

-- Problem 5:
SELECT common_name FROM species
WHERE species_id NOT IN (
  SELECT species_id FROM sightings
)


-- Problem 6:
SELECT common_name, sighting_time, name FROM sightings
JOIN rangers ON sightings.ranger_id = rangers.ranger_id
JOIN species ON sightings.species_id = species.species_id
ORDER BY sighting_time DESC
LIMIT 2

-- Problem 7:
UPDATE species
SET conservation_status = 'Historic'
WHERE (EXTRACT(YEAR FROM discovery_date) < 1800) 

SELECT * FROM species

-- Problem 8:
SELECT sighting_id,
CASE 
  WHEN extract(HOUR FROM sighting_time) < 12 THEN 'Morning'  
  WHEN extract(HOUR FROM sighting_time) BETWEEN 12 AND 16 THEN 'Afternoon'  
  ELSE 'Evening'
END as time_of_day FROM sightings

-- Problem 9:
DELETE FROM rangers
WHERE ranger_id NOT IN (
  SELECT ranger_id FROM sightings
)