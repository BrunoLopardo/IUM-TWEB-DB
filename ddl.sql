BEGIN;

DROP TABLE IF EXISTS Utente CASCADE;
DROP TABLE IF EXISTS Corso CASCADE;
DROP TABLE IF EXISTS Docente CASCADE;
DROP TABLE IF EXISTS Prenotazione CASCADE;
DROP TABLE IF EXISTS Docenza CASCADE;
DROP TYPE IF EXISTS DAY_NAME;
DROP TYPE IF EXISTS STATO_PRENOTAZIONE;
DROP INDEX IF EXISTS prenotazione_utente_giorno_ora_key;
DROP INDEX IF EXISTS prenotazione_docente_giorno_ora_key;


CREATE TYPE DAY_NAME AS ENUM ('Lun', 'Mar', 'Mer', 'Gio', 'Ven');
CREATE TYPE STATO_PRENOTAZIONE AS ENUM ('Attiva', 'Effettuata', 'Disdetta');

CREATE TABLE Utente (
    ID SERIAL PRIMARY KEY,
    Username VARCHAR(20) UNIQUE NOT NULL,
    Password VARCHAR(128) NOT NULL,
    isAdmin BOOLEAN NOT NULL DEFAULT false
);

CREATE TABLE Corso (
    ID SERIAL PRIMARY KEY,
    Titolo VARCHAR(100) UNIQUE NOT NULL
);

CREATE TABLE Docente (
    ID SERIAL PRIMARY KEY,
    Nome VARCHAR(20) NOT NULL,
    Cognome VARCHAR(20) NOT NULL,
    UNIQUE(Nome, Cognome)
);

CREATE TABLE Prenotazione (
    ID SERIAL PRIMARY KEY,
    Corso INTEGER NOT NULL REFERENCES Corso(ID),
    Docente INTEGER NOT NULL REFERENCES Docente(ID),
    Utente INTEGER NOT NULL REFERENCES Utente(ID) ON DELETE CASCADE,
    Stato STATO_PRENOTAZIONE NOT NULL DEFAULT 'Attiva',
    Giorno DAY_NAME NOT NULL,
    Ora_inizio SMALLINT NOT NULL,
    Created_at DOUBLE PRECISION NOT NULL,
    CHECK (Ora_inizio >= 15 AND Ora_inizio <= 18)
);

CREATE TABLE Docenza (
    Corso INTEGER NOT NULL REFERENCES Corso(ID),
    Docente INTEGER NOT NULL REFERENCES Docente(ID),
    PRIMARY KEY(Corso, Docente)
);

CREATE UNIQUE INDEX prenotazione_utente_giorno_ora_key ON Prenotazione(Utente, Giorno, Ora_inizio) WHERE Stato = 'Attiva';
CREATE UNIQUE INDEX prenotazione_docente_giorno_ora_key ON Prenotazione(Docente, Giorno, Ora_inizio) WHERE Stato = 'Attiva';

ALTER TABLE Utente OWNER TO "ium-tweb-app";
ALTER TABLE Corso OWNER TO "ium-tweb-app";
ALTER TABLE Docente OWNER TO "ium-tweb-app";
ALTER TABLE Prenotazione OWNER TO "ium-tweb-app";
ALTER TABLE Docenza OWNER TO "ium-tweb-app";

COMMIT;
