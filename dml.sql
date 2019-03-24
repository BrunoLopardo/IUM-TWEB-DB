BEGIN;

INSERT INTO Utente(Username, Password, isAdmin) VALUES
( 'Admin', 'admin', true),
( 'Utente1', 'Password', false),
( 'Utente2', 'Qwerty', false),
( 'Utente3', '123456', false),
( 'Pippo12', 'letmein', false);

INSERT INTO Corso(Titolo) VALUES
('Sistemi Operativi'),
('Programmazione II'),
('Calcolo matriciale e ricerca operativa'),
('Algoritmi e strutture dati'),
('Fisica'),
('Corso che non esiste piu');

INSERT INTO Docente(Nome, Cognome) VALUES
('Ferruccio','Damiani'),
('Claudio','Schifanella'),
('Viviana','Bono'),
('Igor','Pesando'),
('Roberto','Aringhieri'),
('Cristina','Baroglio'),
('Enrico','Bini'),
('Ugo','De Liguoro'),
('Gianluca','Pozzato'),
('Mario','Rossi');

INSERT INTO Docenza(Corso, Docente) VALUES
(4,1),
(1,2),
(2,3),
(5,4),
(3,5),
(1,6),
(1,7),
(4,8),
(4,9);

INSERT INTO Prenotazione(Corso, Docente, Utente, Stato, Giorno, Ora_inizio, Created_at) VALUES
(1,6,5,'Attiva','Mar',15,(SELECT EXTRACT(EPOCH FROM (SELECT NOW() AT TIME ZONE 'UTC')) * 1000)),
(2,3,3,'Attiva','Mar',16,(SELECT EXTRACT(EPOCH FROM (SELECT NOW() AT TIME ZONE 'UTC')) * 1000)),
(3,5,4,'Attiva','Mer',17,(SELECT EXTRACT(EPOCH FROM (SELECT NOW() AT TIME ZONE 'UTC')) * 1000)),
(4,8,2,'Attiva','Gio',17,(SELECT EXTRACT(EPOCH FROM (SELECT NOW() AT TIME ZONE 'UTC')) * 1000)),
(6,10,3,'Disdetta','Mar',17,(SELECT EXTRACT(EPOCH FROM (SELECT NOW() AT TIME ZONE 'UTC')) * 1000)),
(4,10,3,'Disdetta','Mer',16,(SELECT EXTRACT(EPOCH FROM (SELECT NOW() AT TIME ZONE 'UTC')) * 1000)),
(1,6,2,'Effettuata','Mar',15,(SELECT EXTRACT(EPOCH FROM (SELECT NOW() AT TIME ZONE 'UTC')) * 1000)),
(4,1,4,'Effettuata','Ven',17,(SELECT EXTRACT(EPOCH FROM (SELECT NOW() AT TIME ZONE 'UTC')) * 1000)),
(4,10,3,'Effettuata','Mer',16,(SELECT EXTRACT(EPOCH FROM (SELECT NOW() AT TIME ZONE 'UTC')) * 1000));

COMMIT;
