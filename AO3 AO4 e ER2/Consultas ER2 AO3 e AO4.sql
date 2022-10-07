--DDL -- CRIA A ESTRUTURA

CREATE DATABASE RpgOnlineBD

USE RpgOnlineBD

CREATE TABLE Usuarios(
	UsuarioID INT PRIMARY KEY IDENTITY
	,Email VARCHAR(100) UNIQUE NOT NULL
	,Senha VARCHAR(255) NOT NULL
)

CREATE TABLE Classes(
	ClasseID INT PRIMARY KEY IDENTITY
	,Nome VARCHAR(50) UNIQUE NOT NULL
	,Descricao VARCHAR(255)
)

CREATE TABLE Personagens(
	PersonagemID INT PRIMARY KEY IDENTITY
	,NomePersonagem VARCHAR(15) UNIQUE NOT NULL
	,UsuarioID INT UNIQUE FOREIGN KEY REFERENCES Usuarios(UsuarioID)
	,ClasseID INT FOREIGN KEY REFERENCES Classes(ClasseID)
)

CREATE TABLE Habilidades(
	HabilidadeID INT PRIMARY KEY IDENTITY
	,Nome VARCHAR(100) UNIQUE NOT NULL
)

CREATE TABLE ClasseHabilidade(
	ClasseID INT FOREIGN KEY REFERENCES Classes(ClasseID)
	,HabilidadeID INT FOREIGN KEY REFERENCES Habilidades(HabilidadeID)
)

ALTER TABLE Personagens
ALTER COLUMN NomePersonagem VARCHAR(100);

--DML - INSERE OS DADOS

INSERT INTO Usuarios VALUES ('CAIQUE@CAIQUE.COM', '123456')
INSERT INTO Classes VALUES ('Barbaro','Ele e realmente barbaro')
INSERT INTO Usuarios (Email, Senha) VALUES ('manoel@manoel.com', HASHBYTES('SHA2_512','123456'))
INSERT INTO Habilidades VALUES ('Muquetada na Costela'), ('Dedo molhado no ouvido'), ('Cuecao'), ('Pedala Robinho') 
INSERT INTO Personagens (NomePersonagem, UsuarioID, ClasseID) VALUES ('Klebin', 1, 2)
INSERT INTO Personagens (NomePersonagem, UsuarioID, ClasseID) VALUES ('Klebin_Cabeca_de_Lampada', 3, 2)
INSERT INTO ClasseHabilidade (ClasseID, HabilidadeID) VALUES (2,3), (2, 2), (2, 1)

UPDATE Usuarios
SET Senha = '987456321'
WHERE UsuarioID = 1

-- DQL - FAZ CONSULTAS

SELECT * FROM Usuarios
SELECT * FROM Classes
SELECT * FROM Habilidades
SELECT * FROM Personagens
SELECT * FROM ClasseHabilidade

SELECT * FROM Personagens
INNER JOIN Classes
ON Personagens.ClasseID = Classes.ClasseID

--Exemplos de JOIN

CREATE DATABASE ExemplosJOIN

USE ExemplosJOIN

--DDL

CREATE TABLE TabelaA(
	Nome VARCHAR(50) NULL
)

CREATE TABLE TabelaB(
	Nome VARCHAR(50) NULL
)

--DML

INSERT INTO TabelaA VALUES ('Fernanda')
INSERT INTO TabelaA VALUES ('Josefa')
INSERT INTO TabelaA VALUES ('Luiz')
INSERT INTO TabelaA VALUES ('Fernando')

INSERT INTO TabelaB VALUES ('Carlos'), ('Manoel'), ('Luiz'), ('Fernando')

--DQL

SELECT * FROM TabelaA
SELECT * FROM TabelaB

SELECT TabelaA.Nome AS TabelaA, TabelaB.Nome AS TabelaB FROM TabelaA
INNER JOIN TabelaB
ON TabelaA.Nome = TabelaB.Nome

SELECT TabelaA.Nome AS TabelaA, TabelaB.Nome AS TabelaB FROM TabelaA
LEFT JOIN TabelaB
ON TabelaA.Nome = TabelaB.Nome

SELECT TabelaA.Nome AS TabelaA, TabelaB.Nome AS TabelaB FROM TabelaA
RIGHT JOIN TabelaB
ON TabelaA.Nome = TabelaB.Nome

SELECT TabelaA.Nome AS TabelaA, TabelaB.Nome AS TabelaB FROM TabelaA
FULL OUTER JOIN TabelaB
ON TabelaA.Nome = TabelaB.Nome