/* Database schema to keep the structure of entire database. */

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

ALTER TABLE animals 
ADD COLUMN species VARCHAR(255);
