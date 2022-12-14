/*Queries that provide answers to the questions from all projects.*/

SELECT * FROM animals WHERE name LIKE '%mon';
SELECT name FROM animals WHERE date_of_birth BETWEEN '2016-01-01' AND '2019-12-31';
SELECT name FROM animals WHERE neutered = 'true' AND escape_attempts < 3;
SELECT date_of_birth FROM animals WHERE name = 'Agumon' OR name = 'Pikachu';
SELECT name, escape_attempts FROM animals WHERE weight_kg > 10.5;
SELECT * FROM animals WHERE neutered = true;
SELECT * FROM animals WHERE name != 'Gabumon';
SELECT * FROM animals WHERE weight_kg BETWEEN 10.3 AND 17.4;

SELECT * FROM animals;
BEGIN;
UPDATE animals SET species = 'unspecified';
ROLLBACK;

BEGIN;
UPDATE animals SET species = 'digimon' WHERE name LIKE '%mon';
UPDATE animals SET species = 'pokemon' WHERE species = '';
COMMIT;
SELECT * FROM animals;
ROLLBACK;

SELECT * FROM animals;
BEGIN;
SAVEPOINT original;
DELETE FROM animals;
SELECT * FROM animals;
ROLLBACK TO original;
SELECT * FROM animals;

BEGIN;
SAVEPOINT dob;
DELETE FROM animals WHERE date_of_birth > '2022-01-01';
SELECT * FROM animals;

BEGIN;
SAVEPOINT mul;
UPDATE animals SET weight_kg = weight_kg*(-1);
SELECT * FROM animals;
ROLLBACK TO mul;

SELECT * FROM animals;
/*convert those id's to their original neg weights*/
UPDATE animals SET weight_kg = weight_kg*(-1) WHERE id IN (5, 6, 7, 8);
SELECT * FROM animals;
BEGIN;
UPDATE animals SET weight_kg = weight_kg*(-1) WHERE id IN (5, 6, 7, 8);
SELECT * FROM animals;
COMMIT;

SELECT COUNT(name) FROM animals;
SELECT COUNT(name) FROM animals WHERE escape_attempts = 0;
SELECT AVG(weight_kg) as avg_weight_kg FROM animals;
SELECT neutered, MAX(escape_attempts) FROM animals GROUP BY neutered;
SELECT species, MIN(weight_kg),MAX(weight_kg) FROM animals  GROUP BY species;
 SELECT species, AVG(escape_attempts) FROM animals  WHERE date_of_birth >= '1990-01-01' AND date_of_birth <= '2000-01-01' GROUP BY species;