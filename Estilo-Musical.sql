CREATE DATABASE EstilosMusicais;

USE EstilosMusicais;

CREATE TABLE EstiloMusical(
	IdEstilo INT PRIMARY KEY IDENTITY,
	NomeEstilo VARCHAR(30) NOT NULL
);
CREATE TABLE Artista(
	IdArtista INT PRIMARY KEY IDENTITY,
	Nome VARCHAR(100) NOT NULL,
	IdEstilo INT FOREIGN KEY REFERENCES EstiloMusical(IdEstilo)
);
SELECT * FROM Artista;
SELECT * FROM EstiloMusical;
 
    DROP TABLE EstiloMusical;
	DROP TABLE Artista;

	USE Albuns;

	DROP DATABASE EstilosMusicais;