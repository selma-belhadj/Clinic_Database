/* Database schema to keep the structure of entire database. */

CREATE TABLE patients (
    id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    name varchar(100),          
    date_of_birth  date            
);

CREATE TABLE medical_histories (
    id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    admitted_at timestamp,
    patient_id INT,
    status varchar(100),
    FOREIGN KEY (patient_id) REFERENCES patients (id)
);

CREATE TABLE invoices (
    id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    total_amount decimal,
    generated_at timestamp,
    payed_at timestamp,
    medical_history_id int UNIQUE, 
    FOREIGN KEY (medical_history_id) REFERENCES medical_histories (id)
);

CREATE TABLE treatments (
    id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    type varchar(100), 
    name varchar(100)           
);

CREATE TABLE invoice_items (
    id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    unit_price decimal,
    quantity int,
    total_price decimal,
    invoice_id int,
    treatment_id int,
    FOREIGN KEY (invoice_id) REFERENCES invoices (id),
    FOREIGN KEY (treatment_id) REFERENCES treatments (id)
);

CREATE TABLE medical_histories_treatments (
    id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    treatment_id int,
    medical_history_id INT,
    FOREIGN KEY (treatment_id) REFERENCES treatments (id),
    FOREIGN KEY (medical_history_id) REFERENCES medical_histories (id)
);