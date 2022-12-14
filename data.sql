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

/*Project two*/

INSERT INTO animals (id, name, date_of_birth, escape_attempts, neutered, weight_kg, species)
VALUES ('Charmander', '2020-02-08', 0, false, -11, 'Animal'),
('Plantmon', '2021-11-15', 2, true, -5.7, 'Animal'),
('Squirtle', '1993-04-02', 3, false, -12.13, 'Animal'),
('Angemon', '2005-06-12', 1, true, -45, 'Animal'),
('Boarmon', '2005-06-07', 7, true, 20.4, 'Animal'),
('Blossom', '1998-06-13', 3, true, 17, 'Animal'),
('Ditto', '2022-05-14', 4, true, 22, 'Animal');
