/* Populate database with sample data. */
/*Project one*/
INSERT INTO animals (id, name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES ('Agumon', '2020-02-03', 0, true, 10.23);

INSERT INTO animals (id, name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES ('Gabumon', '2018-11-15', 2, true, 8);

INSERT INTO animals (id, name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES ('Pikachu', '2021-01-07', 1, false, 15.04);

INSERT INTO animals (id, name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES ('Devimon', '2017-05-12', 5, true, 15.04);

/*PROJECT TWO*/

INSERT INTO animals (id, name, date_of_birth, escape_attempts, neutered, weight_kg, species)
VALUES ('Charmander', '2020-02-08', 0, false, -11, 'Animal'),
('Plantmon', '2021-11-15', 2, true, -5.7, 'Animal'),
('Squirtle', '1993-04-02', 3, false, -12.13, 'Animal'),
('Angemon', '2005-06-12', 1, true, -45, 'Animal'),
('Boarmon', '2005-06-07', 7, true, 20.4, 'Animal'),
('Blossom', '1998-06-13', 3, true, 17, 'Animal'),
('Ditto', '2022-05-14', 4, true, 22, 'Animal');

/*PROJECT THREE*/
/*Owners table*/

INSERT INTO owners(full_name,age)
VALUES ('Sam Smith', 34),
('Jennifer Orwell', 19),
('Bob', 45),
('Melody Pond', 77),
('Dean Winchester', 14),
('Jodie Whittaker', 38);

/*Species table*/

INSERT INTO species(name) 
VALUES('Pokemon'),('Digimon');

/*Update species in animals table*/

UPDATE animals SET species_id=2 WHERE name LIKE '%mon';
UPDATE animals SET species_id=1 WHERE species_id IS NULL;

/*Update owners in animals table*/

UPDATE animals SET owners_id = 1 WHERE name='Agumon';
UPDATE animals SET owners_id = 2 WHERE name='Gabumon' OR name='Pikachu';
UPDATE animals SET owners_id = 3 WHERE name='Devimon' OR name='Plantmon';
UPDATE animals SET owners_id = 4 WHERE name='Charmander' OR name='Squirtle' OR name='Blossom';
UPDATE animals SET owners_id = 5 WHERE name='Angemon' OR name='Boarmon';

-----------------------------------------------------------------------
/*PROJECT FOUR*/

INSERT INTO vets(name,age,date_of_graduation)
VALUES('William Thatcher', 45, '2000-04-23'),
('Maisy Smith', 26, '2019-01-17'),
('Stephanie Mendez', 64, '1981-05-04'),
('Jack Harkness', 38, '2008-06-08');

/* Agumon visits William Tatcher on 2020-05-24 */
INSERT INTO visits(animals_id, vets_id, date_of_visit) VALUES (
  (
    SELECT id
    FROM animals
    WHERE name = 'Agumon'
  ),
  
  (
    SELECT id
    FROM vets
    WHERE name = 'William Tatcher'
  ),
  '2020-05-24' 
);

/* Agumon visits Stephanie Mendez on 2020-07-22 */
INSERT INTO visits(animals_id, vets_id, date_of_visit) VALUES (
  (
    SELECT id
    FROM animals
    WHERE name = 'Agumon'
  ),
  
  (
    SELECT id
    FROM vets
    WHERE name = 'Stephanie Mendez'
  ),
  '2020-07-22' 
);

/* Gabumon visits Jack Harkness on 2021-02-02 */
INSERT INTO visits(animals_id, vets_id, date_of_visit) VALUES (
  (
    SELECT id
    FROM animals
    WHERE name = 'Gabumon'
  ),
  
  (
    SELECT id
    FROM vets
    WHERE name = 'Jack Harkness'
  ),
  '2021-02-02' 
);

/* Pikachu visits Maisy Smith on 2020-05-01 */
INSERT INTO visits(animals_id, vets_id, date_of_visit) VALUES (
  (
    SELECT id
    FROM animals
    WHERE name = 'Pikachu'
  ),
  
  (
    SELECT id
    FROM vets
    WHERE name = 'Maisy Smith'
  ),
  '2020-05-01' 
);

/* Pikachu visits Maisy Smith on 2020-03-08 */
INSERT INTO visits(animals_id, vets_id, date_of_visit) VALUES (
  (
    SELECT id
    FROM animals
    WHERE name = 'Pikachu'
  ),
  
  (
    SELECT id
    FROM vets
    WHERE name = 'Maisy Smith'
  ),
  '2020-03-08' 
);

/* Pikachu visits Maisy Smith on 2020-03-14 */
INSERT INTO visits(animals_id, vets_id, date_of_visit) VALUES (
  (
    SELECT id
    FROM animals
    WHERE name = 'Pikachu'
  ),
  
  (
    SELECT id
    FROM vets
    WHERE name = 'Maisy Smith'
  ),
  '2020-03-14' 
);

/* Devimon visits Stephanie Mendez on 2021-05-04 */
INSERT INTO visits(animals_id, vets_id, date_of_visit) VALUES (
  (
    SELECT id
    FROM animals
    WHERE name = 'Devimon'
  ),
  
  (
    SELECT id
    FROM vets
    WHERE name = 'Stephanie Mendez'
  ),
  '2021-05-04' 
);

/* Charmander visits Jack Harkness on 2021-02-24 */
INSERT INTO visits(animals_id, vets_id, date_of_visit) VALUES (
  (
    SELECT id
    FROM animals
    WHERE name = 'Charmander'
  ),
  
  (
    SELECT id
    FROM vets
    WHERE name = 'Jack Harkness'
  ),
  '2021-02-24' 
);

/* Plantmon visits Maisy Smith on 2019-12-21 */
INSERT INTO visits(animals_id, vets_id, date_of_visit) VALUES (
  (
    SELECT id
    FROM animals
    WHERE name = 'Plantmon'
  ),
  
  (
    SELECT id
    FROM vets
    WHERE name = 'Maisy Smith'
  ),
  '2019-12-21' 
);


/* Plantmon visits William Tatcher on 2020-08-10 */
INSERT INTO visits(animals_id, vets_id, date_of_visit) VALUES (
  (
    SELECT id
    FROM animals
    WHERE name = 'Plantmon'
  ),
  
  (
    SELECT id
    FROM vets
    WHERE name = 'William Tatcher'
  ),
  '2020-08-10' 
);


/* Plantmon visits Maisy Smith on 2021-04-07 */
INSERT INTO visits(animals_id, vets_id, date_of_visit) VALUES (
  (
    SELECT id
    FROM animals
    WHERE name = 'Plantmon'
  ),
  
  (
    SELECT id
    FROM vets
    WHERE name = 'Maisy Smith'
  ),
  '2021-04-07' 
);


/* Squirtle visits Stephanie Mendez on 2019-09-29 */
INSERT INTO visits(animals_id, vets_id, date_of_visit) VALUES (
  (
    SELECT id
    FROM animals
    WHERE name = 'Squirtle'
  ),
  
  (
    SELECT id
    FROM vets
    WHERE name = 'Stephanie Mendez'
  ),
  '2019-09-29' 
);

/* Angemon visits Jack Harkness on 2020-10-03 */
INSERT INTO visits(animals_id, vets_id, date_of_visit) VALUES (
  (
    SELECT id
    FROM animals
    WHERE name = 'Angemon'
  ),
  
  (
    SELECT id
    FROM vets
    WHERE name = 'Jack Harkness'
  ),
  '2020-10-03' 
);

/* Angemon visits Jack Harkness on 2020-11-04 */
INSERT INTO visits(animals_id, vets_id, date_of_visit) VALUES (
  (
    SELECT id
    FROM animals
    WHERE name = 'Angemon'
  ),
  
  (
    SELECT id
    FROM vets
    WHERE name = 'Jack Harkness'
  ),
  '2020-11-04' 
);

/* Boarmon visits Maisy Smith on 2019-01-24 */
INSERT INTO visits(animals_id, vets_id, date_of_visit) VALUES (
  (
    SELECT id
    FROM animals
    WHERE name = 'Boarmon'
  ),
  
  (
    SELECT id
    FROM vets
    WHERE name = 'Maisy Smith'
  ),
  '2019-01-24' 
);

/* Boarmon visits Maisy Smith on 2019-05-15 */
INSERT INTO visits(animals_id, vets_id, date_of_visit) VALUES (
  (
    SELECT id
    FROM animals
    WHERE name = 'Boarmon'
  ),
  
  (
    SELECT id
    FROM vets
    WHERE name = 'Maisy Smith'
  ),
  '2019-05-15' 
);

/* Boarmon visits Maisy Smith on 2020-02-27 */
INSERT INTO visits(animals_id, vets_id, date_of_visit) VALUES (
  (
    SELECT id
    FROM animals
    WHERE name = 'Boarmon'
  ),
  
  (
    SELECT id
    FROM vets
    WHERE name = 'Maisy Smith'
  ),
  '2020-02-27' 
);

/* Boarmon visits Maisy Smith on 2020-08-03 */
INSERT INTO visits(animals_id, vets_id, date_of_visit) VALUES (
  (
    SELECT id
    FROM animals
    WHERE name = 'Boarmon'
  ),
  
  (
    SELECT id
    FROM vets
    WHERE name = 'Maisy Smith'
  ),
  '2020-08-03' 
);

/* Blossom visits Stephanie Mendez */
INSERT INTO visits(animals_id, vets_id, date_of_visit) VALUES (
  (
    SELECT id
    FROM animals
    WHERE name = 'Blossom'
  ),
  
  (
    SELECT id
    FROM vets
    WHERE name = 'Stephanie Mendez'
  ),
  '2020-05-24' 
);

/* Blossom visits William Tatcher */
INSERT INTO visits(animals_id, vets_id, date_of_visit) VALUES (
  (
    SELECT id
    FROM animals
    WHERE name = 'Blossom'
  ),
  
  (
    SELECT id
    FROM vets
    WHERE name = 'William Tatcher'
  ),
  '2021-01-11' 
);
