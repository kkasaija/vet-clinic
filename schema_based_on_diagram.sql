CREATE DATABASE clinic;

CREATE TABLE patients (
    id serial primary key,
    name varchar(100),
    date_of_birth date
);

CREATE TABLE medical_histories(
    id serial primary key,
    admitted_at timestamp,
    patient_id int,
    status varchar(50)
);

CREATE TABLE treatments(
  id serial primary key,
  type varchar(100),
  name VARCHAR(100)
);

CREATE TABLE invoices(
  id serial primary key,
  total_amount decimal,
  generated_at timestamp,
  payed_at timestamp,
  medical_history_id int
);

CREATE TABLE invoice_items(
  id serial primary key,
  unit_price decimal,
  quantity int,
  invoice_id int,
  treatment_id int
);

-- ALTER TABLE animals DROP COLUMN species;
-- ALTER TABLE animals ADD COLUMN species_id INT;
-- ALTER TABLE animals ADD CONSTRAINT fk_animals_species FOREIGN KEY (species_id) REFERENCES species(id);
-- ALTER TABLE animals ADD COLUMN owners_id INT;
-- ALTER TABLE animals ADD CONSTRAINT fk_animals_owners FOREIGN KEY (owners_id) REFERENCES owners(id);

-- redo this 
-- CREATE TABLE specializations( 
--   species_id INT,
--   vets_id INT,
--   CONSTRAINT fk_species FOREIGN KEY(species_id) REFERENCES species(id) ON UPDATE CASCADE ON DELETE CASCADE,
--   CONSTRAINT fk_vets FOREIGN KEY(vets_id) REFERENCES vets(id) ON UPDATE CASCADE ON DELETE CASCADE,
--   CONSTRAINT fk_species_vets PRIMARY KEY (species_id, vets_id)
-- );

-- CREATE TABLE visits(
--   id SERIAL PRIMARY KEY,
--   animals_id INT,
--   vets_id INT,
--   date_of_visit date NOT NULL,
--   CONSTRAINT fk_animals FOREIGN KEY(animals_id) REFERENCES animals(id) ON UPDATE CASCADE ON DELETE CASCADE,
--   CONSTRAINT fk_vets FOREIGN KEY(vets_id) REFERENCES vets(id) ON UPDATE CASCADE ON DELETE CASCADE
-- );

