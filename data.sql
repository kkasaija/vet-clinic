/* Populate database with sample data. */

INSERT INTO animals (id, name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES (1, 'Agumon', '2020-02-03', 0, true, 10.23);

INSERT INTO animals (id, name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES (2, 'Gabumon', '2018-11-15', 2, true, 8);

INSERT INTO animals (id, name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES (3, 'Pikachu', '2021-01-07', 1, false, 15.04);

INSERT INTO animals (id, name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES (4, 'Devimon', '2017-05-12', 5, true, 15.04);

/*newly inserted records*/

INSERT INTO animals (id, name, date_of_birth, escape_attempts, neutered, weight_kg, species)
VALUES (5, 'Charmander', '2020-02-08', 0, false, 11, 'Animal'),
(6, 'Plantmon', '2021-11-15', 2, true, 5.7, 'Animal'),
(7, 'Squirtle', '1993-04-02', 3, false, 12.13, 'Animal'),
(8, 'Angemon', '2005-06-12', 1, true, 45, 'Animal'),
(9, 'Boarmon', '2005-06-07', 7, true, 20.4, 'Animal'),
(10, 'Blossom', '1998-06-13', 3, true, 17, 'Animal'),
(11, 'Ditto', '2022-05-14', 4, true, 22, 'Animal');
