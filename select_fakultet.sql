-- zadatak 2.17

SELECT n.imeNastavnik Ime, n.prezNastavnik Prezime, m.nazMjesto Mjesto
FROM nastavnik n
JOIN mjesto m ON n.pbrStan = m.pbr;
    
-- 2.18

SELECT s.imeStud, s.prezStud, i.ocjena, p.nazPred
FROM stud s
LEFT JOIN ispit i ON s.mbrStud = i.mbrStud
LEFT JOIN pred p ON i.sifPred = p.sifPred;

SELECT p.*, d.*
FROM pred p
LEFT JOIN rezervacija r ON p.sifPred = r.sifPred
LEFT JOIN dvorana d ON d.oznDvorana = r.oznDvorana;
