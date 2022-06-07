/* Database schema to keep the structure of entire database. */

CREATE TABLE patients (
    id INT not null primary key,
    name varchar(100),          
    date_of_birth  date            
);

CREATE TABLE invoices (
    id INT not null primary key,
    total_amount decimal,
    generated_at timestamp,
    payed_at timestamp,
    medical_history_id int,
    FOREIGN KEY (medical_history_id) REFERENCES medical_histories (id)
);

CREATE TABLE treatments (
    id int not null primary key,
    type varchar(100), 
    name varchar(100)           
);

CREATE TABLE medical_histories (
    id INT not null primary key,
    admitted_at timestamp,
    patient_id INT,
    status varchar(100),
    FOREIGN KEY (patient_id) REFERENCES patients (id)
)

CREATE TABLE invoice_items (
    id INT not null primary key,
    unit_price decimal,
    quantity int,
    total_price decimal,
    invoice_id int,
    treatment_id int,
    FOREIGN KEY (invoice_id) REFERENCES invoices (id),
    FOREIGN KEY (treatment_id) REFERENCES treatments (id)
)