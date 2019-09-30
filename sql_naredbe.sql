
cd .\xampp\mysql\bin
.\mysql -u root
show databases;
USE test;
SHOW tables;
CREATE DATABASE tvrtka;
DROP DATABASE IF EXISTS tvrtka;
CREATE DATABASE IF NOT EXISTS tvrtka DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;

CREATE TABLE IF NOT EXISTS grad(
    id INT UNSIGNED AUTO_INCREMENT NOT NULL PRIMARY KEY,
    ime VARCHAR(50) NOT NULL
) ENGINE = InnoDB;

DESCRIBE grad;

CREATE TABLE IF NOT EXISTS poslovnica(
    id INT UNSIGNED AUTO_INCREMENT NOT NULL PRIMARY KEY,
    naziv VARCHAR(255) NOT NULL
) ENGINE = InnoDB;

ALTER TABLE poslovnica ADD (grad_id INT UNSIGNED NOT NULL);
ALTER TABLE poslovnica ADD FOREIGN KEY(grad_id) REFERENCES grad(id);

CREATE TABLE IF NOT EXISTS zaposlenici(
    id INT UNSIGNED AUTO_INCREMENT NOT NULL PRIMARY KEY,
    ime VARCHAR(255) NOT NULL,
    prezime VARCHAR(255) NOT NULL,
    poslovnica_id INT UNSIGNED NOT NULL,
    FOREIGN KEY (poslovnica_id) REFERENCES poslovnica (id)
) ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS voditelj_poslovnice(
    zaposlenik_id INT UNSIGNED NOT NULL,
    FOREIGN KEY(zaposlenik_id) REFERENCES zaposlenici(id),
    poslovnica_id INT UNSIGNED NOT NULL,
    FOREIGN KEY (poslovnica_id) REFERENCES poslovnica (id)
) ENGINE = InnoDB;