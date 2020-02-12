-- INCIO DDL
create database Clinicaprojeto_manha;
use Clinicaprojeto_manha;

create table Especialidade(
	IDEspecialidade int primary key identity,
	Especialidade varchar (60)
);

create table TipoUsuario(
	IDTipoUsuario int primary key identity,
	Titulo varchar (60)
);

create table Situacao(
	IDSituacao int primary key identity,
	Titulo varchar (60)
)

create table Usuario(
	IDUsuario int primary key identity,
	Email varchar (60),
	Senha varchar (60),
	IdTipoUsuario int foreign key references TipoUsuario (IDTipoUsuario)
);

create table Prontuario (
	IDProntuario int primary key identity,
	NomePaciente varchar (60),
	Telefone varchar(60),
	RG char (9),
	CPF char (11),
	Endereco varchar (120),
	DataNascimento date,
	IdUsuario int foreign key references Usuario (IDUsuario)
	
);

create table Clinica (
	IDClinica int primary key identity,
	CNPJ char (14),
	Endereco varchar (120),
	NomeFantasia varchar (70),
	RazaoSocial varchar (70),
	HorarioFuncionamento varchar(30)
);

create table Medico(
	IDMedico int primary key identity,
	CRM char (7),
	Nome varchar (60),
	IdClinica int foreign key references Clinica (IDClinica),
	IdUsuario int foreign key references Usuario (IDUsuario),
	IdEspecialidade int foreign key references Especialidade (IDEspecialidade)
);

create table Consulta (
	IDConsulta int primary key identity,
	DataConsulta datetime,
	Descricao varchar (80),
	IdMedico int foreign key references Medico (IDMedico),
	IdSituacao int foreign key references Situacao (IDSituacao),
	IdProntuario int foreign key references Prontuario (IDProntuario)
);

--FIM DDL