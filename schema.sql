/* Database schema to keep the structure of entire database. */

/*Project one*/

CREATE DATABASE vet_clinic;
CREATE TABLE animals (
    id BIGSERIAL NOT NULL,
    name varchar(100) NOT NULL,
    date_of_birth date NOT NULL,
    escape_attempts int NOT NULL,
    neutered boolean NOT NULL,
    weight_kg float NOT NULL,
    PRIMARY KEY (id)
);

/*PROJECT TWO*/

ALTER TABLE animals 
ADD COLUMN species VARCHAR(255);

/*PROJECT THREE*/

CREATE TABLE owners(
  id SERIAL PRIMARY KEY,
  full_name VARCHAR(255) NOT NULL,
  age INT NOT NULL
);

CREATE TABLE species(
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) NOT NULL
);

ALTER TABLE animals DROP COLUMN species;
ALTER TABLE animals ADD COLUMN species_id INT;
ALTER TABLE animals ADD CONSTRAINT fk_animals_species FOREIGN KEY (species_id) REFERENCES species(id);
ALTER TABLE animals ADD COLUMN owners_id INT;
ALTER TABLE animals ADD CONSTRAINT fk_animals_owners FOREIGN KEY (owners_id) REFERENCES owners(id);

-----------------------------------------------------------------------

/*PROJECT FOUR*/

CREATE TABLE vets(
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  age INT NOT NULL,
  date_of_graduation date NOT NULL
);

CREATE TABLE specializations(
  species_id INT,
  vets_id INT,
  CONSTRAINT fk_species FOREIGN KEY(species_id) REFERENCES species(id) ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT fk_vets FOREIGN KEY(vets_id) REFERENCES vets(id) ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT fk_species_vets PRIMARY KEY (species_id, vets_id)
);

CREATE TABLE visits(
  id SERIAL PRIMARY KEY,
  animals_id INT,
  vets_id INT,
  date_of_visit date NOT NULL,
  CONSTRAINT fk_animals FOREIGN KEY(animals_id) REFERENCES animals(id) ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT fk_vets FOREIGN KEY(vets_id) REFERENCES vets(id) ON UPDATE CASCADE ON DELETE CASCADE
);

/*PERFORMANCE AUDIT*/

CREATE INDEX all_animals_id ON visits(animals_id);

