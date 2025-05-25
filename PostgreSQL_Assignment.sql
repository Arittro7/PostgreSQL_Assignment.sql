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

