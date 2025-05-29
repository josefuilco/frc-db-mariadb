-- Tablas para el módulo de comisiones y facturación

CREATE TABLE IF NOT EXISTS Currency (
    currency_id INT AUTO_INCREMENT,
    currency_type VARCHAR(25) NOT NULL,
    CONSTRAINT Pk_Currency_CurrencyId PRIMARY KEY (currency_id),
    CONSTRAINT Uq_Currency_CurrencyType UNIQUE (currency_type)
);

CREATE TABLE IF NOT EXISTS CiaCompany (
    cia_company_id INT AUTO_INCREMENT,
    company_name VARCHAR(25) NOT NULL,
    CONSTRAINT Pk_CiaCompany_CiaCompanyId PRIMARY KEY (cia_company_id),
    CONSTRAINT Uq_CiaCompany_CompanyName UNIQUE (company_name)
);

CREATE TABLE IF NOT EXISTS InsuranceLineSbs (
    insurance_line_sbs_id INT AUTO_INCREMENT,
    insurance_name VARCHAR(25) NOT NULL,
    CONSTRAINT Pk_InsuranceLineSbs_Id PRIMARY KEY (insurance_line_sbs_id),
    CONSTRAINT Uq_InsuranceLineSbs_Name UNIQUE (insurance_name)
);

CREATE TABLE IF NOT EXISTS InsuranceLineCia (
    insurance_line_cia_id INT AUTO_INCREMENT,
    insurance_name VARCHAR(25) NOT NULL,
    CONSTRAINT Pk_InsuranceLineCia_Id PRIMARY KEY (insurance_line_cia_id),
    CONSTRAINT Uq_InsuranceLineCia_Name UNIQUE (insurance_name)
);

CREATE TABLE IF NOT EXISTS InsuranceLineCode (
    insurance_line_code_id INT AUTO_INCREMENT,
    insurance_name VARCHAR(25) NOT NULL,
    CONSTRAINT Pk_InsuranceLineCode_Id PRIMARY KEY (insurance_line_code_id),
    CONSTRAINT Uq_InsuranceLineCode_Name UNIQUE (insurance_name)
);

CREATE TABLE IF NOT EXISTS Invoice (
    invoice_id INT AUTO_INCREMENT,
    invoice_date DATE,
    invoice_number VARCHAR(25),
    policy_number VARCHAR(50),
    receipt_number VARCHAR(25),
    liquidation DECIMAL(10,2),
    net_amount DECIMAL(10,2),
    commission_amount DECIMAL(10,2),
    currency_id INT,
    cia_company_id INT,
    insurance_line_sbs_id INT,
    insurance_line_cia_id INT,
    insurance_line_code_id INT,
    costumer_id INT NOT NULL,
    account_id INT,
    CONSTRAINT Pk_Invoice_InvoiceId PRIMARY KEY (invoice_id),
    CONSTRAINT Fk_Invoice_CurrencyId FOREIGN KEY (currency_id) REFERENCES Currency (currency_id),
    CONSTRAINT Fk_Invoice_CiaCompanyId FOREIGN KEY (cia_company_id) REFERENCES CiaCompany (cia_company_id),
    CONSTRAINT Fk_Invoice_InsuranceLineSbsId FOREIGN KEY (insurance_line_sbs_id) REFERENCES InsuranceLineSbs (insurance_line_sbs_id),
    CONSTRAINT Fk_Invoice_InsuranceLineCiaId FOREIGN KEY (insurance_line_cia_id) REFERENCES InsuranceLineCia (insurance_line_cia_id),
    CONSTRAINT Fk_Invoice_InsuranceLineCodeId FOREIGN KEY (insurance_line_code_id) REFERENCES InsuranceLineCode (insurance_line_code_id),
    CONSTRAINT Fk_Invoice_CostumerId FOREIGN KEY (costumer_id) REFERENCES Costumer (costumer_id),
    CONSTRAINT Fk_Invoice_AccountId FOREIGN KEY (account_id) REFERENCES `Account` (account_id)
);
