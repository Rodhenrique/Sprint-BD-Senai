--CRIAR BANCO DE DADOS
CREATE DATABASE Biblioteca_Tarde;

--APONTAR PARA O BANCO DE DADOS QUE VAI USAR
USE Biblioteca_Tarde;

--CRIAR TABELAS

CREATE TABLE Autores(
	IdAutor INT PRIMARY KEY IDENTITY,
	NomeAutor VARCHAR(200) NOT NULL
);

CREATE TABLE Generos (
	IdGenero INT PRIMARY KEY IDENTITY,
	Nome VARCHAR(200) NOT NULL
);

CREATE TABLE Livros(
	IdLivro INT PRIMARY KEY IDENTITY,
	Titulo VARCHAR(255) NOT NULL,
	IdAutor INT FOREIGN KEY REFERENCES Autores(IdAutor),
	IdGenero INT FOREIGN KEY REFERENCES Generos(IdGenero)
);
SELECT * FROM Generos;
SELECT * FROM Autores;
SELECT * FROM Livros;



--ALTERAR ADICIONAR UMA NOVA COLUNA

ALTER TABLE Generos
ADD Descricao VARCHAR(255);

--ALTERAR TIPO DE DADO

ALTER TABLE Generos 
ALTER COLUMN Descricao CHAR(100);

--ALTERAR EXCLUIR COLUNA 

ALTER TABLE Generos 
DROP COLUMN Descricao;

USE DbScribd;

--EXCLUIR TABELA

DROP TABLE Livros;
DROP TABLE Generos;
DROP TABLE Autores;

--EXCLUIR BANCO DE DADOS

DROP DATABASE Biblioteca_Tarde;

INSERT INTO Generos(Nome)
VALUES('Romance'),
	('Adventure'),
	('Action'),
	('History'),
	('Space');

	INSERT INTO Autores(NomeAutor)
VALUES 
	('Henry David Thoreau'),
	('Dante Alighieri'),
	('Oscar Wilde'),
	('Ovídio Naso'),
	('Edgar Allan Poe');


	INSERT INTO Livros(Titulo,IdAutor,IdGenero)
VALUES 
	('Walden',1,2),
	('Divina comédia',2,3),
	('O corvo',3,4),
	('O retrato de Dorian Gray',3,5),
	('A arte de amar',2,1);

	UPDATE Generos
	SET Nome = 'Passeata'
	WHERE IdGenero=  1;

	UPDATE Livros
	SET Titulo = 'Apenas um teste'
	Where IdLivro = 2;

	DELETE FROM Autores
	WHERE IdAutor IN (1,2);

	--ALTERAR MAIS DE UMA LINHA
	UPDATE Genero
	SET NomeAutor = 'Oscar Wilde'
	Where IdArtista IN 5,3;

--SELECIONA TODOS OS AUTORES

SELECT NomeAutor,IdAutor From Autores;

--SELECIONA TODOS OS generos

SELECT Nome,IdGenero From Generos;

--SELECIONA TODOS OS livros

SELECT Titulo,IdLivro From Livros;

--SELECIONA TODOS OS LIVROS E SEUS AUTORES

SELECT Titulo,IdLivro,IdAutor From Livros;

--SELECIONA TODOS OS LIVROS E SEUS GENEROS

SELECT Titulo,IdGenero From Livros;

--SELECIONA TODOS OS LIVROS E SEUS GENEROS E O AUTOR

SELECT Titulo,IdGenero,IdAutor From Livros;


SELECT NomeAutor, Titulo
FROM Autores as A
INNER JOIN Livros as B
 on NomeAutor = Titulo;









