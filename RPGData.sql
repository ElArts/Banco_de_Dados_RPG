--DDL
CREATE DATABASE RpgData
GO

USE RpgData
GO

CREATE TABLE Usuarios
(
	IdUsuario INT PRIMARY KEY IDENTITY,
	Email VARCHAR (100) UNIQUE NOT NULL,
	Senha VARCHAR(20) NOT NULL,
	DataNasc INT NOT NULL
)
GO

CREATE TABLE Classes
(
	IdClasse INT PRIMARY KEY IDENTITY,
	Nome VARCHAR(50) NOT NULL,
	Descricao VARCHAR (300) NOT NULL,
	HabilidadesUnicas VARCHAR (50) NOT NULL
)
GO

CREATE TABLE Personagens
(
	IdPersonagem INT PRIMARY KEY IDENTITY NOT NULL,
	Nome VARCHAR (30) UNIQUE NOT NULL,
	Raca VARCHAR (20) UNIQUE NOT NULL,
	IdUsuario INT UNIQUE FOREIGN KEY REFERENCES Usuarios (IdUsuario),
	IdClasse INT FOREIGN KEY REFERENCES Classes (IdClasse)
)
GO

CREATE TABLE Habilidades
(
	IdHabilidade INT PRIMARY KEY IDENTITY,
	Nome VARCHAR (50) UNIQUE NOT NULL,
	Descricao VARCHAR (100) UNIQUE NOT NULL,
	CustoDeMana NUMERIC NOT NULL
)
GO 

CREATE TABLE ClasseHabilidade
(
	IdClasse INT FOREIGN KEY REFERENCES Classes (IdClasse),
	IdHabilidade INT FOREIGN KEY REFERENCES Habilidades (IdHabilidade)
)
GO

--DML
INSERT INTO Usuarios (Email, Senha, DataNasc) VALUES ('example@email.com', '0000', 01/01/2001)
INSERT INTO Classes (Nome, Descricao, HabilidadesUnicas) VALUES('Barbaro', 'mb1 4 the win', 'hit')
INSERT INTO Habilidades (Nome, Descricao, CustoDeMana) VALUES ('Lança Mortal', 'Lança que leva os oponentes a morte', '50'), ('Escudo Supremo', 'Escudo top', '50')
INSERT INTO Personagens (Nome, Raca, IdUsuario, IdClasse) VALUES ('DeuBug', 'Dark Elf', 6, 1)
INSERT INTO ClasseHabilidade VALUES (1, 1), (1, 2)

INSERT INTO Usuarios VALUES('example2@email', '1111', 02/02/2002)
INSERT INTO Classes VALUES ('Monge', 'healer', 'big heal')
INSERT INTO Habilidades VALUES ('Recuperar Vida', 'recupera vida', '70')
INSERT INTO Personagens VALUES ('BitBug', 'humano', 7, 6)
INSERT INTO ClasseHabilidade VALUES (6, 5), (6, 6)

UPDATE Usuarios 
SET Senha = 123456 
WHERE IdUsuario = 1


--DQL
SELECT * FROM Usuarios
SELECT Senha, Email FROM Usuarios
SELECT * FROM Classes
SELECT * FROM Habilidades


--Seleciona todos os elementos
SELECT * FROM Personagens 
INNER JOIN Classes
ON Personagens.IdClasse = Classes.IdClasse

--Seleciona elementos pontuais
SELECT Personagens.Nome, Classes.Nome, Classes.Descricao FROM Personagens
INNER JOIN Classes
ON Personagens.IdClasse = Classes.IdClasse


--Exemplo Join

CREATE DATABASE ExemploJoin
GO

USE ExemploJoin
GO

CREATE TABLE NomeA
(
	Nome VARCHAR(50) NOT NULL
)
GO

CREATE TABLE NomeB
(
	Nome VARCHAR(50) NOT NULL
)
GO

INSERT INTO NomeA VALUES ('Nome 1'), ('Nome 2'), ('Nome 3'), ('Nome 4')
INSERT INTO NomeA VALUES ('Nome 3'), ('Nome 4'), ('Nome 5'), ('Nome 6')

--JOIN (INNER JOIN) - SOMENTE ONDE EXISTE EQUIVALENCIA
SELECT * FROM NomeA
JOIN NomeB
ON NomeA.Nome = NomeB.Nome

--LEFT JOIN - SOMENTE ELEMENTOS DA PRIMEIRA TABELA SITADA E SUA EQUIVALENCIA NA SEGUNDA TABELA
SELECT * FROM NomeA
LEFT JOIN NomeB
ON NomeA.Nome = NomeB.Nome

--RIGHT JOIN - ELEMENTOS DA SEGUNDA TABELA SITADA E SUA EQUIVALENCIA NA PRIMEIRA TABELA 
SELECT * FROM NomeA
RIGHT JOIN NomeB
ON NomeA.Nome = NomeB.Nome

--FULL OUTER JOIN - TRÁS TODOS OS ELEMENTOS
SELECT * FROM NomeA
FULL OUTER JOIN NomeB
ON NomeA.Nome = NomeB.Nome