CREATE TABLE IF NOT EXISTS `User` (
    `user_id` INT AUTO_INCREMENT,
    `names` VARCHAR(25) NOT NULL,
    lastnames VARCHAR(25) NOT NULL,
    doi VARCHAR(8) NOT NULL,
    email VARCHAR(50) NOT NULL,
    mobile_number VARCHAR(9) NOT NULL,
    CONSTRAINT Pk_User_UserId PRIMARY KEY (`user_id`),
    CONSTRAINT Uq_User_Doi UNIQUE doi
);

CREATE TABLE IF NOT EXISTS `Role` (
    role_id INT AUTO_INCREMENT,
    role_name VARCHAR(25),
    CONSTRAINT Pk_Role_RoleId PRIMARY KEY (role_id)
);

CREATE TABLE IF NOT EXISTS Office (
    office_id INT AUTO_INCREMENT,
    office_location VARCHAR(25) NOT NULL,
    CONSTRAINT Pk_Office_OfficeId PRIMARY KEY (office_id)
);

CREATE TABLE IF NOT EXISTS `Account` (
    account_id INT AUTO_INCREMENT,
    nickname VARCHAR(25) NOT NULL,
    `password` VARCHAR(60) NOT NULL,
    is_active TINYINT(1) DEFAULT 1,
    `user_id` INT NOT NULL,
    role_id INT NOT NULL,
    office_id INT NOT NULL,
    CONSTRAINT Pk_Account_AccountId PRIMARY KEY (account_id),
    CONSTRAINT Fk_Account_UserId FOREIGN KEY `user_id` REFERENCES `User` (`user_id`),
    CONSTRAINT Fk_Account_OfficeId FOREIGN KEY office_id REFERENCES Office ()
);

CREATE TABLE IF NOT EXISTS `Application` (
    `application_id` INT AUTO_INCREMENT,
    application_name VARCHAR(25) NOT NULL,
    CONSTRAINT Pk_Application_ApplicationId PRIMARY KEY (`application_id`)
);

CREATE TABLE IF NOT EXISTS `Permission` (
    `application_id` INT NOT NULL,
    account_id INT NOT NULL,
    committed_at DATETIME DEFAULT NOW(),
    CONSTRAINT Pk_Permission_ApplicationId_AccountId PRIMARY KEY (`application_id`, account_id),
    CONSTRAINT Fk_Permission_ApplicationId FOREIGN KEY `application_id` REFERENCES `Application` (`application_id`),
    CONSTRAINT Fk_Permission_AccountId FOREIGN KEY account_id REFERENCES `Account` (account_id)
);