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

CREATE TABLE medical_history_treatment(
  medical_history_id int,
  treatment_id int,
  CONSTRAINT fk_medical_history FOREIGN KEY(medical_history_id) REFERENCES medical_histories(id);
  CONSTRAINT fk_treatments FOREIGN KEY(treatment_id) REFERENCES treatments(id);
);

ALTER TABLE medical_histories ADD CONSTRAINT fk_medical_histories FOREIGN KEY (patient_id) REFERENCES patients(id);
ALTER TABLE invoice_items ADD CONSTRAINT fk_invoice_item_id FOREIGN KEY (invoice_id) REFERENCES invoices(id);
ALTER TABLE invoice_items ADD CONSTRAINT fk_treatment_id FOREIGN KEY (treatment_id) REFERENCES treatments(id);
