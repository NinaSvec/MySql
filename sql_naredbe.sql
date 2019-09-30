
cd .\xampp\mysql\bin
.\mysql -u root
show databases;
USE test;
SHOW tables;
CREATE DATABASE tvrtka;
DROP DATABASE IF EXISTS tvrtka;
CREATE DATABASE IF NOT EXISTS tvrtka DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
