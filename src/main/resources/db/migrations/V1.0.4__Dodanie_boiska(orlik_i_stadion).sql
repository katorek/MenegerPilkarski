CREATE TABLE orliki
(
  ID     INT PRIMARY KEY AUTO_INCREMENT,
  BOISKO INT
);

CREATE TABLE boiska
(
  ID           INT PRIMARY KEY AUTO_INCREMENT,
  NAZWA        VARCHAR(50) NOT NULL UNIQUE,
  ILOSC_MIEJSC INT         NOT NULL,
  MIEJSCOWOSC  VARCHAR(20) NOT NULL
);

CREATE TABLE stadiony
(
  ID                    INT PRIMARY KEY AUTO_INCREMENT,
  CHRONI_PRZED_DESZCZEM TINYINT(1) NOT NULL,
  BOISKO                INT
);

INSERT INTO boiska (NAZWA, ILOSC_MIEJSC, MIEJSCOWOSC) VALUES
  ('Stadion Miejski w Poznaniu', 43269, 'Poznań'),
  ('Camp Nou', 99354, 'Barcelona'),
  ('Młodzieżowy Ośrodek Sportowy', 100, 'Poznań'),
  ('Stadion Towarzystwa Sportowego Polonia', 100, 'Poznań');

INSERT INTO stadiony (CHRONI_PRZED_DESZCZEM, BOISKO) VALUES
  (0,(SELECT ID FROM boiska WHERE NAZWA='Stadion Miejski w Poznaniu')),
  (1,(SELECT ID FROM boiska WHERE NAZWA='Camp Nou'));

INSERT INTO orliki(BOISKO) VALUES
  ((SELECT ID FROM boiska WHERE NAZWA='Młodzieżowy Ośrodek Sportowy')),
  ((SELECT ID FROM boiska WHERE NAZWA='Stadion Towarzystwa Sportowego Polonia'));