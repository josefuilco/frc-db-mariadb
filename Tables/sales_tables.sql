-- Tablas para el módulo de ventas

CREATE TABLE IF NOT EXISTS ConditionSale (
    condition_sale_id INT AUTO_INCREMENT,
    condition_name VARCHAR(25) NOT NULL,
    CONSTRAINT Pk_ConditionSale_ConditionSaleId PRIMARY KEY (condition_sale_id),
    CONSTRAINT Uq_ConditionSale_ConditionName UNIQUE (condition_name)
);

CREATE TABLE IF NOT EXISTS InsuranceLineCiaSale (
    insurance_line_cia_sale_id INT AUTO_INCREMENT,
    insurance_name VARCHAR(25) NOT NULL,
    CONSTRAINT Pk_InsuranceLineCiaSale_Id PRIMARY KEY (insurance_line_cia_sale_id),
    CONSTRAINT Uq_InsuranceLineCiaSale_Name UNIQUE (insurance_name)
);

CREATE TABLE IF NOT EXISTS Sale (
    sale_id INT AUTO_INCREMENT,
    policy_number VARCHAR(50),
    start_sale_date DATE,
    end_sale_date DATE,
    net_amount DECIMAL(10,2),
    total_amount DECIMAL(10,2),
    costumer_id INT NOT NULL,
    account_id INT NOT NULL,
    condition_sale_id INT,
    currency_id INT,
    cia_company_id INT,
    insurance_line_cia_sale_id INT,
    CONSTRAINT Pk_Sale_SaleId PRIMARY KEY (sale_id),
    CONSTRAINT Fk_Sale_CostumerId FOREIGN KEY (costumer_id) REFERENCES Costumer (costumer_id),
    CONSTRAINT Fk_Sale_AccountId FOREIGN KEY (account_id) REFERENCES `Account` (account_id),
    CONSTRAINT Fk_Sale_ConditionSaleId FOREIGN KEY (condition_sale_id) REFERENCES ConditionSale (condition_sale_id),
    CONSTRAINT Fk_Sale_CurrencyId FOREIGN KEY (currency_id) REFERENCES Currency (currency_id),
    CONSTRAINT Fk_Sale_CiaCompanyId FOREIGN KEY (cia_company_id) REFERENCES CiaCompany (cia_company_id),
    CONSTRAINT Fk_Sale_InsuranceLineCiaSaleId FOREIGN KEY (insurance_line_cia_sale_id) REFERENCES InsuranceLineCiaSale (insurance_line_cia_sale_id)
);
