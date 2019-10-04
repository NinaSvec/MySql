DROP DATABASE IF EXISTS tvrtka;
CREATE DATABASE IF NOT EXISTS tvrtka DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE tvrtka;
CREATE TABLE IF NOT EXISTS grad(
    id INT UNSIGNED AUTO_INCREMENT NOT NULL PRIMARY KEY,
    ime VARCHAR(50) NOT NULL
)ENGINE = InnoDB;

DESCRIBE grad;

CREATE TABLE IF NOT EXISTS poslovnica(
    id INT UNSIGNED AUTO_INCREMENT NOT NULL PRIMARY KEY,
    naziv VARCHAR(255) NOT NULL,
    grad_id INT UNSIGNED NOT NULL,
    FOREIGN KEY (grad_id) REFERENCES grad(id)
)ENGINE = InnoDB;


CREATE TABLE IF NOT EXISTS zaposlenici(
    id INT UNSIGNED AUTO_INCREMENT NOT NULL PRIMARY KEY,
    ime VARCHAR(255) NOT NULL,
    prezime VARCHAR(255) NOT NULL,
    poslovnica_id INT UNSIGNED NOT NULL,
    FOREIGN KEY (poslovnica_id) REFERENCES poslovnica(id)
)ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS voditelj_poslovnice(
    zaposlenik_id INT UNSIGNED NOT NULL,
    FOREIGN KEY (zaposlenik_id) REFERENCES zaposlenici(id),
    poslovnica_id INT UNSIGNED NOT NULL,
    FOREIGN KEY (poslovnica_id) REFERENCES poslovnica(id)
)ENGINE = InnoDB;

INSERT INTO grad (ime) VALUES ('Zagreb');
INSERT INTO grad (ime) VALUES ('Split');
INSERT INTO grad (ime) VALUES ('Varaždin'), ('Osijek');

SELECT * FROM grad;

INSERT INTO poslovnica (naziv, grad_id) VALUES ('12-105', 1);
INSERT INTO poslovnica (naziv, grad_id) VALUES ('12-106', 2), ('12-107', 3), ('12-108', 1);

SELECT * FROM poslovnica;

INSERT INTO zaposlenici (ime, prezime, poslovnica_id) VALUES ('Pero', 'Perić', 1);
INSERT INTO zaposlenici (ime, prezime, poslovnica_id) VALUES ('Marko', 'Markić', 2), ('Ana', 'Anić', 3), ('Iva', 'Ivić', 4);

SELECT * FROM zaposlenici;

INSERT INTO voditelj_poslovnice (zaposlenik_id, poslovnica_id) VALUES (2,2), (4,1);

ALTER TABLE zaposlenici ADD COLUMN created_at DATETIME DEFAULT CURRENT_TIMESTAMP;

INSERT INTO zaposlenici (ime, prezime, poslovnica_id) VALUES ('Zoran', 'Zoranić', 4);

ALTER TABLE zaposlenici ADD COLUMN updated_at DATETIME ON UPDATE CURRENT_TIMESTAMP;

INSERT INTO zaposlenici (ime, prezime, poslovnica_id) VALUES ('Mijo', 'Mijić', 4);