INSERT INTO `User`
(`names`, lastnames, doi, email, mobile_number)
VALUES
('Jose Armando', 'Fuilco Galindo', '78984596', 'josefuilco@hotmail.com', '945688922');

INSERT INTO `Role`
(role_name)
VALUES
('Administrador'), ('Colaborador');

INSERT INTO Office
(office_location)
VALUES
('Ica'), ('Pisco'), ('Lima');

INSERT INTO `Account`
(nickname, `password`, `user_id`, role_id, office_id)
VALUES
('jfuilco', '$2a$10$0ruKB2xy7n3pJOc9RhG/Q.6T2iz0p5yFWjkzXXh96cIm4o/GGg5rK', 1, 1, 1); 

INSERT INTO `Application`
(application_name)
VALUES
('Producción'), ('Facturación'), ('Facturación Temporal'), ('Usuarios');

INSERT INTO `Permission`
(`application_id`, account_id)
VALUES
(1, 1), (2, 1), (3, 1), (4, 1);