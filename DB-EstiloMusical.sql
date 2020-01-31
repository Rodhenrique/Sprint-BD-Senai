CREATE DATABASE Optus_Albuns_Tarde;

USE Optus_Albuns_Tarde;

CREATE TABLE Estilo(
	IdEstilo INT PRIMARY KEY IDENTITY,
	NomeEstilo VARCHAR(30) NOT NULL
);

CREATE TABLE Artista(
	IdArtista INT PRIMARY KEY IDENTITY,
	Nome VARCHAR(100) NOT NULL,
	IdEstilo INT FOREIGN KEY REFERENCES Estilo(IdEstilo)
);

CREATE TABLE Album(
	IdAlbum INT PRIMARY KEY IDENTITY,
	NomeAlbum VARCHAR(100) NOT NULL UNIQUE,
	IdEstilo INT FOREIGN KEY REFERENCES Estilo(IdEstilo),
	IdArtista INT FOREIGN KEY REFERENCES Artista(IdArtista)
);


CREATE TABLE Usuario(
	IdUsuario INT PRIMARY KEY IDENTITY,
	Nome VARCHAR(100) NOT NULL,
	Email VARCHAR(50) NOT NULL,
	Senha VARCHAR(20),
	IdATipoUsuario INT FOREIGN KEY REFERENCES TipoUsuario(IdUsuario)
);
CREATE TABLE TipoUsuario (
	IdUsuario INT PRIMARY KEY IDENTITY,
	Tipo VARCHAR(10) NOT NULL
);
ALTER TABLE Album
ADD Visualizacao BIGINT;

ALTER TABLE Album
ADD DataLancamento DATE;

SELECT * FROM Artista;
SELECT * FROM Estilo;
SELECT * FROM Album;
SELECT * FROM Usuario;
SELECT * FROM TipoUsuario;


ALTER TABLE Album 
ADD Minutos BIGINT;

DROP TABLE Estilo;
DROP TABLE Artista;
DROP TABLE Album;
DROP TABLE Usuario;

USE DbScribd;

DROP DATABASE Albuns;

--INSERIDO DADOS NA TABELA

INSERT INTO TipoUsuario(Tipo)
VALUES ('ADM'),
	('Cliente');	

INSERT INTO Estilo(NomeEstilo)
VALUES ('Sertanejo'),
	('Rock'),
	('Eletronica'),
	('Samba'),
	('Pop');
	
INSERT INTO Usuario(Nome,Email,Senha,IdATipoUsuario)
	VALUES ('Pedro alves da silva','pedro123@gmail.com','123434356',3),
	('maria alves da optus','pedro123@gmail.com','12653456',3),
	('Joao alves da max','pedro123@gmail.com','12376456',3),
	('diego alves da silva','pedro123@gmail.com','123467756',3),
	('joaquina alves da pedroso','pedro123@gmail.com','123767456',3);

	INSERT INTO Artista(Nome,IdEstilo)
	VALUES ('pablao',2),
	('anita',1),
	('titas',4),
	('lagores',3),
	('combos',5);

	INSERT INTO Album(NomeAlbum,IdEstilo,IdArtista)
	VALUES ('todos unidos pelo mundo',2,3),
	('todos na lua',4,2),
	('barco e os bares',1,4),
	('LORDES PELA TERRA',3,1),
	('OLHA EU AQUI DENOVO',2,3);

UPDATE Album
SET Minutos = 124
Where IdAlbum = 9;

UPDATE Album
SET Minutos = 1232
Where IdAlbum = 10;

UPDATE Album
SET Minutos = 424
Where IdAlbum = 11;

UPDATE Album
SET Minutos = 323
Where IdAlbum = 12;

UPDATE Album
SET Minutos = 224
Where IdAlbum = 13;

UPDATE Album
SET Visualizacao = 224343
Where IdAlbum = 9;

UPDATE Album
SET Visualizacao = 224
Where IdAlbum = 10;

UPDATE Album
SET Visualizacao = 223434
Where IdAlbum = 11;

UPDATE Album
SET Visualizacao = 223234
Where IdAlbum = 12;

UPDATE Album
SET Visualizacao = 323233
Where IdAlbum = 13;



DELETE FROM Album
WHERE IdAlbum = 10;


