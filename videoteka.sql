cd .\xampp\mysql\bin
.\mysql -u root

CREATE DATABASE IF NOT EXISTS videoteka DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE videoteka;

CREATE TABLE filmovi(
    id_filma INT UNSIGNED AUTO_INCREMENT NOT NULL PRIMARY KEY,
    naziv VARCHAR(50) NOT NULL
) ENGINE = InnoDB;

CREATE TABLE clanovi(
    id_clana INT UNSIGNED AUTO_INCREMENT NOT NULL PRIMARY KEY,
    ime VARCHAR(20) NOT NULL,
    prezime VARCHAR(20) NOT NULL
) ENGINE = InnoDB;

CREATE TABLE posudba(
    id_clana INT UNSIGNED NOT NULL,
    FOREIGN KEY (id_clana) REFERENCES clanovi(id_clana),
    id_filma INT UNSIGNED NOT NULL,
    FOREIGN KEY (id_filma) REFERENCES filmovi(id_filma),
    datum_posudbe DATETIME DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (datum_posudbe),
    datum_povrata DATETIME ON UPDATE CURRENT_TIMESTAMP
) ENGINE = InnoDB;

INSERT INTO filmovi (naziv) VALUES('Predator'),('Terminator'),('Rambo');

INSERT INTO clanovi (ime,prezime) VALUES ('Nina','Ninic'),('Maja','Majic'),('Dino','Dinic');

INSERT INTO posudba (id_clana,id_filma,datum_posudbe,datum_povrata) VALUES (2,1, '','');

DROP TABLE posudba;

CREATE TABLE posudba(
    id_clana INT UNSIGNED NOT NULL,
    FOREIGN KEY (id_clana) REFERENCES clanovi(id_clana),
    id_filma INT UNSIGNED NOT NULL,
    FOREIGN KEY (id_filma) REFERENCES filmovi(id_filma),
    datum_posudbe DATE,
    PRIMARY KEY (datum_posudbe),
    datum_povrata DATETIME ON UPDATE CURRENT_TIMESTAMP
) ENGINE = InnoDB;

INSERT INTO posudba (id_clana,id_filma,datum_posudbe,datum_povrata) VALUES (2,1, '2019-10-09', CURRENT_TIMESTAMP);
INSERT INTO posudba (id_clana,id_filma,datum_posudbe,datum_povrata) VALUES (1,3, '2019-10-07', NULL);
INSERT INTO posudba (id_clana,id_filma,datum_posudbe,datum_povrata) VALUES (3,2, '2019-10-08', NULL);

SELECT c.ime, c.prezime
 FROM clanovi c
 JOIN posudba p ON c.id_clana = p.id_clana
 WHERE datum_povrata IS NULL;

 SELECT c.ime, c.prezime, f.naziv
 FROM clanovi c
  JOIN posudba p ON c.id_clana = p.id_clana
  JOIN filmovi f ON p.id_filma = f.id_filma
  WHERE datum_povrata IS NULL;

