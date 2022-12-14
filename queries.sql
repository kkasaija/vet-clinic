/*Queries that provide answers to the questions from all projects.*/
/*Project one*/

SELECT * FROM animals WHERE name LIKE '%mon';
SELECT name FROM animals WHERE date_of_birth BETWEEN '2016-01-01' AND '2019-12-31';
SELECT name FROM animals WHERE neutered = 'true' AND escape_attempts < 3;
SELECT date_of_birth FROM animals WHERE name = 'Agumon' OR name = 'Pikachu';
SELECT name, escape_attempts FROM animals WHERE weight_kg > 10.5;
SELECT * FROM animals WHERE neutered = true;
SELECT * FROM animals WHERE name != 'Gabumon';
SELECT * FROM animals WHERE weight_kg BETWEEN 10.3 AND 17.4;

/*PROJECT TWO*/

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

 /*PROJECT THREE*/

SELECT name FROM animals JOIN owners ON animals.owners_id= owners.id WHERE owners.full_name = 'Melody Pond';
SELECT animals.name FROM animals JOIN species ON animals.species_id = species.id WHERE species.name = 'Pokemon';
SELECT owners.full_name, name FROM owners LEFT JOIN animals ON animals.owners_id = owners.id;
SELECT species.name, COUNT(animals.name) FROM species JOIN animals ON species.id = animals.species_id GROUP BY species.name;
SELECT animals.name AS Animal, species.name AS Species FROM animals
JOIN owners ON animals.owners_id= owners.id JOIN species ON species.id = animals.species_id
WHERE owners.full_name = 'Jennifer Orwell' AND species.name='Digimon';
SELECT animals.name, animals.escape_attempts FROM animals
JOIN owners ON animals.owners_id= owners.id 
WHERE owners.full_name = 'Dean Winchester' AND animals.escape_attempts = 0;
SELECT owners.full_name, COUNT(animals.name) FROM owners 
JOIN animals ON animals.owners_id = owners.id GROUP BY owners.full_name ORDER BY count DESC;