Napraviti bazu algebra_contacts

sa entitetima KORISNICI, SADRŽAJ, TIP SASTANKA

CREATE TABLE IF NOT EXISTS korisnici(
    id INT UNSIGNED AUTO_INCREMENT NOT NULL PRIMARY KEY,
    ime VARCHAR(50) NOT NULL,
    prezime VARCHAR(50) NOT NULL
) ENGINE = InnoDB;

INSERT INTO TABLE korisnici