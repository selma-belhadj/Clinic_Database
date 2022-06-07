/* Database schema to keep the structure of entire database. */

CREATE TABLE patients (
    id INT not null primary key,
    name varchar(100) not null,          
    date_of_birth  date not null           
);

CREATE TABLE invoices (
    id INT not null primary key,
    total_amount decimal not null,
    generated_at timestamp not null,
    payed_at timestamp not null,
    medical_history_id int not null
);

CREATE TABLE treatments (
    id int not null primary key,
    type varchar(100) not null, 
    name varchar(100) not null          
);