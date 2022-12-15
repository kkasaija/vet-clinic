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

--------------------------------------------------------------------------------

/*PROJECT FOUR*/

/* Last animal seen by William Tatcher */
SELECT animals.name, visits.date_of_visit 
  FROM animals 
  JOIN visits ON visits.animals_id = animals.id 
  JOIN vets ON vets.id = visits.vets_id 
  WHERE vets.name = 'William Tatcher' 
  ORDER BY visits.date_of_visit DESC LIMIT 1;

/* Animals that Stephanie Mendez saw */
SELECT COUNT(DISTINCT animals.name) AS Animals_Seen
  FROM animals 
  JOIN visits ON visits.animals_id = animals.id 
  JOIN vets ON vets.id = visits.vets_id 
  WHERE vets.name = 'Stephanie Mendez';

/* All vets with their speciality */
SELECT vets.name, species.name AS species_name
  FROM vets 
  LEFT JOIN specializations ON vets.id = specializations.vets_id 
  LEFT JOIN species ON species.id = specializations.species_id;

/* All animals that visited Stephanie Mendez between '2020-04-01' & '2020-08-30' */
SELECT DISTINCT animals.name, visits.date_of_visit AS Animals_Seen
  FROM animals 
  JOIN visits ON visits.animals_id = animals.id 
  JOIN vets ON vets.id = visits.vets_id 
  WHERE vets.name = 'Stephanie Mendez'
  AND date_of_visit BETWEEN '2020-04-01' AND '2020-08-30';

/* Animal with most visits to the vets */
SELECT animals.name, COUNT(visits.date_of_visit) AS visit_count
  FROM animals JOIN visits ON visits.animals_id = animals.id 
  GROUP BY animals.name 
  ORDER BY visit_count 
  DESC LIMIT 1;

/* Maisy Smith's first visit */
SELECT animals.name, visits.date_of_visit AS visit_date
  FROM animals JOIN visits ON visits.animals_id = animals.id
  JOIN vets ON vets.id = visits.vets_id
  WHERE vets.name = 'Maisy Smith'
  ORDER BY visit_date ASC LIMIT 1;


/* Details for most recent visit: animal information, vet information, and date of visit.*/
SELECT 
  animals.name As animal,
  animals.date_of_birth,
  animals.weight_kg,
  animals.neutered,
  vets.name AS veterinary,
  vets.date_of_graduation,
  visits.date_of_visit AS visit_date
  FROM animals JOIN visits ON visits.animals_id = animals.id
  JOIN vets ON vets.id = visits.vets_id
  ORDER BY visit_date DESC LIMIT 1;


/* How many visits were with a vet that did not specialize in that animal's species */
SELECT COUNT(visits.animals_id) AS visits_with_vets_not_specialized
  FROM visits
  JOIN vets ON vets.id = visits.vets_id
  JOIN animals ON animals.id = visits.animals_id
  JOIN specializations ON specializations.species_id = vets.id
  WHERE specializations.species_id != animals.species_id;

/* What specialty should Maisy Smith consider getting? Look for the species she gets the most. */
/*** Digimon ***/
SELECT species.name, COUNT(visits.animals_id) AS visits
  FROM visits
  JOIN vets ON vets.id = visits.vets_id
  JOIN animals ON animals.id = visits.animals_id
  JOIN species ON species.id = animals.species_id
  WHERE vets.name = 'Maisy Smith'
  GROUP BY species.name
  ORDER BY visits DESC LIMIT 1;
