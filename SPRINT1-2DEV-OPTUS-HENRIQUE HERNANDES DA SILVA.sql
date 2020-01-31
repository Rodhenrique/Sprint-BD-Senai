--DDL LINGUAGEM DE DEFINIÇÃO DE DADOS

--CRIAR BANCO DE DADOS

CREATE DATABASE Optus_Albuns_Tarde;

--USAR BANCO DE DADOS OPTUS
USE Optus_Albuns_Tarde;

--CRIADO TABELAS DA OPTUS
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
	Nome VARCHAR(100) NOT NULL UNIQUE,
	QtdMinutos BIGINT,
	Visualizacao BIGINT,
	DataLancamento DATE,
	IdEstilo INT FOREIGN KEY REFERENCES Estilo(IdEstilo),
	IdArtista INT FOREIGN KEY REFERENCES Artista(IdArtista)
);

CREATE TABLE TipoUsuario (
	IdUsuario INT PRIMARY KEY IDENTITY,
	Tipo VARCHAR(30) NOT NULL
);

CREATE TABLE Usuario(
	IdUsuario INT PRIMARY KEY IDENTITY,
	Nome VARCHAR(100) NOT NULL,
	Email VARCHAR(50) NOT NULL,
	Senha VARCHAR(30) NOT NULL,
	IdATipoUsuario INT FOREIGN KEY REFERENCES TipoUsuario(IdUsuario)
);

--VISUALIZAR TABELAS

SELECT * FROM Artista;
SELECT * FROM Estilo;
SELECT * FROM Album;
SELECT * FROM Usuario;
SELECT * FROM TipoUsuario;


--EXCLUIR TABELAS 

DROP TABLE Usuario;
DROP TABLE TipoUsuario;
DROP TABLE Album;
DROP TABLE Artista;
DROP TABLE Estilo;

--TEM QUE USAR OUTRA TABELA PARA EXCLUIR O BANCO DE DADOS

USE DbScribd;

--EXCLUIR BANCO DE DADOS

DROP DATABASE Optus_Albuns_Tarde;


--DML LINGUAGEM DE MANIPULAÇÃO DE DAODS. INSERIDO DADOS NA TABELA

--ADICIONA DADOS NA TABELA
INSERT INTO TipoUsuario(Tipo)
VALUES ('Administrador'),
		('Cliente');	

INSERT INTO Estilo(NomeEstilo)
VALUES ('Sertanejo'),
		('Rock'),
		('Eletronica'),
		('Samba'),
		('Pop');
	
INSERT INTO Usuario(Nome,Email,Senha,IdATipoUsuario)
	VALUES ('Pedro alves da silva','pedro123@gmail.com','123434356',1),
	('maria alves da optus','pedro123@gmail.com','12653456',2),
	('Joao alves da max','pedro123@gmail.com','12376456',2),
	('diego alves da silva','pedro123@gmail.com','123467756',2),
	('joaquina alves da pedroso','pedro123@gmail.com','123767456',2);

	INSERT INTO Artista(Nome,IdEstilo)
	VALUES ('pablo do aroucha',2),
	('Pearl jam',1),
	('titas',4),
	('anita',3),
	('iron man',5);

	INSERT INTO Album(Nome,QtdMinutos,Visualizacao,DataLancamento,IdEstilo,IdArtista)
	VALUES ('barco e os bares',300,49999,'12/03/1017',4,5),
	       ('OLHA EU AQUI DENOVO',532,4033000, '13/07/2017',5,5);
	
--ALTERANDO CAMPOS NO TABELA 

ALTER TABLE Album 
ADD Localizacao varchar(40);

	UPDATE Album
	SET Localizacao = 'SP'
	Where IdAlbum = 6;

	UPDATE Album
	SET Localizacao = 'SA'
	Where IdAlbum = 23;

	UPDATE Album
	SET Localizacao = 'SP'
	Where IdAlbum = 41;

	UPDATE Album
	SET Localizacao = 'MT'
	Where IdAlbum = 46;

	UPDATE Album
	SET Localizacao = 'RJ'
	Where IdAlbum = 48;



DELETE FROM Album
WHERE IdAlbum = 10;

--DELETAR MAIS DE UMA LINHA 
	DELETE FROM Autores
	WHERE IdAutor IN (1,2);

	--ALTERAR MAIS DE UMA LINHA
	UPDATE Genero
	SET NomeAutor = 'Oscar Wilde'
	Where IdArtista IN 5,3;

	TRUNCATE TABLE Album;


--DQL LINGUAGEM DE CONSULTA

--SELECIONANDO ALBUNS DO MESMO ARTISTA

SELECT * FROM Album WHERE IdArtista = 2;

--SELECIONANDO ALBUNS DO MESMO DATA

SELECT * FROM Album WHERE DataLancamento = '2020/04/20';

--SELECIONANDO ARTISTAS DO MESMO ESTILO

SELECT * FROM Artista WHERE	IdEstilo = 1;

--SELECIONANDO ORDENAR A DATA DO LANÇAMENTO

SELECT IdAlbum,IdArtista,DataLancamento FROM Album
ORDER BY DataLancamento DESC;


--DQL LINGUAGEM DE CONSULTA

	SELECT * FROM Generos;



	
SELECT NomeAlbum,Minutos FROM Album;

SELECT * FROM Album WHERE IdAlbum = 9;

--PEGAR DEPOIS DESSE NUMERO
SELECT * FROM Album WHERE IdAlbum > 11;

--PEGAR ANTES DESSE DE NUMERO
SELECT * FROM Album WHERE IdAlbum < 11;


--OR OU

SELECT Minutos,NomeAlbum FROM Album
WHERE (IdEstilo IS NULL) OR (NomeAlbum IS NULL);

--LIKE COMPARAÇÃO DE TEXTO

 --COMEÇO DA FRASE
SELECT IdAlbum,NomeAlbum FROM Album 
WHERE NomeAlbum LIKE 'barco%'

--FINAL DA FRASE
SELECT IdAlbum,NomeAlbum FROM Album 
WHERE NomeAlbum LIKE '%barco' 

 --MEIO DA FRASE
SELECT IdAlbum,NomeAlbum FROM Album 
WHERE NomeAlbum LIKE '&barco%'

--ORDENAÇÃO 

SELECT NomeAlbum From Album
ORDER BY NomeAlbum;

SELECT IdAlbum,NomeAlbum From Album
ORDER BY IdAlbum;

--ORDENAÇÃO DESCRESCENTE

SELECT IdAlbum,NomeAlbum From Album
ORDER BY IdAlbum DESC;

-- ORDENAÇÃO DO MENOR PARA O MAIOR
SELECT IdAlbum,NomeAlbum From Album
ORDER BY IdAlbum ASC;

--COUNT CONTAR QUANTAS LINHAS TEM NA TABELA
SELECT COUNT(IdAlbum) FROM Album;


