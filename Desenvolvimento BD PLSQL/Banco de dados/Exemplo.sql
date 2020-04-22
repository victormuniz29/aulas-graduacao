CREATE DATABASE Escola
GO
USE ExemploCurso
GO
CREATE TABLE UnidadeFederativa (
	ID INT IDENTITY(1,1) NOT NULL,
	UF CHAR(2) NOT NULL,
	Descricao VARCHAR(25) NOT NULL,
	CONSTRAINT PK_ID_UF PRIMARY KEY (ID)
);
GO
-- Cria��o de disciplina
CREATE TABLE Disciplina (
	ID INT IDENTITY (1,1) NOT NULL,
	Disciplina NVARCHAR(120) NOT NULL,
	CargaHoraria INT	NOT NULL,
	CONSTRAINT PK_ID_Disciplina PRIMARY KEY (ID)
);
GO
CREATE TABLE Curso (
	ID INT IDENTITY (1,1) NOT NULL,
	Curso NVARCHAR(50) NOT NULL,
	CONSTRAINT PK_ID_Curso PRIMARY KEY (ID)
);
GO
CREATE TABLE CursoDisciplina (
	ID INT IDENTITY (1,1) NOT NULL,
	ID_Curso	INT	NOT NULL,
	ID_Disciplina	INT	NOT NULL,
	CONSTRAINT PK_ID_CursoDisciplina	PRIMARY KEY (ID),
	CONSTRAINT FK_CursoDisciplina_Curso	FOREIGN KEY (ID_Curso)
		REFERENCES Curso (ID),
	CONSTRAINT FK_CursoDisciplina_Disciplina	FOREIGN KEY (ID_Disciplina)
		REFERENCES Disciplina	(ID)
)
GO

CREATE TABLE Aluno (
	ID INT IDENTITY(1,1)	NOT NULL,
	RA CHAR(11)		NOT NULL,
	PrimeiroNome	NVARCHAR(50) NOT NULL,
	UltimoNome	NVARCHAR(50) NOT NULL,
	RG	CHAR(11)	NOT NULL,
	CPF CHAR(11)	NOT NULL,
	Genero	NVARCHAR(30)	NOT NULL,
	Logradouro	NVARCHAR(120) NOT NULL,
	Descricao	NVARCHAR(120) NOT NULL,
	CEP		CHAR(6) NOT NULL,
	UF	CHAR(2)	NOT NULL,
	Pais	NVARCHAR(50)	NOT NULL,
	ID_Curso	INT	NOT NULL,
	ID_Disciplina INT NOT NULL,
	-- Define a chave prim�ria da tabela
	CONSTRAINT PK_ID_Aluno PRIMARY KEY (ID),
	CONSTRAINT FK_Aluno_Curso	FOREIGN KEY	(ID_Curso)
		REFERENCES	Curso(ID),
	CONSTRAINT FK_Aluno_Disciplina	FOREIGN KEY (ID_Disciplina)
		REFERENCES	Disciplina(ID)
);