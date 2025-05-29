-- Tablas para el módulo de clientes

CREATE TABLE IF NOT EXISTS DocumentType (
    document_type_id INT AUTO_INCREMENT,
    document_name VARCHAR(25) NOT NULL,
    CONSTRAINT Pk_DocumentType_DocumentTypeId PRIMARY KEY (document_type_id),
    CONSTRAINT Uq_DocumentType_DocumentName UNIQUE (document_name)
);

CREATE TABLE IF NOT EXISTS Location (
    location_id INT AUTO_INCREMENT,
    address VARCHAR(25),
    department VARCHAR(25),
    province VARCHAR(25),
    district VARCHAR(25),
    CONSTRAINT Pk_Location_LocationId PRIMARY KEY (location_id)
);

CREATE TABLE IF NOT EXISTS Costumer (
    costumer_id INT AUTO_INCREMENT,
    full_name VARCHAR(25) NOT NULL,
    doi VARCHAR(9),
    phone_number VARCHAR(9),
    mobile_number VARCHAR(9),
    document_type_id INT NOT NULL,
    location_id INT,
    CONSTRAINT Pk_Costumer_CostumerId PRIMARY KEY (costumer_id),
    CONSTRAINT Uq_Costumer_Doi UNIQUE (doi),
    CONSTRAINT Fk_Costumer_DocumentTypeId FOREIGN KEY (document_type_id) REFERENCES DocumentType (document_type_id),
    CONSTRAINT Fk_Costumer_LocationId FOREIGN KEY (location_id) REFERENCES Location (location_id)
);
