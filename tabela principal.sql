create database FungiSystem;

use FungiSystem;

create table Endereco (
	idEndereco int primary key auto_increment, -- CODIGO DO CLIENTE
	endereco varchar (100) not null, -- ENDEREÇO DO CLIENTE
	numero varchar (6) not null, -- NUMERO DA RESIDENCIA DO CLIENTE
	bairro varchar (20) not null, -- BAIRRO DO CLIENTE
	cidade varchar (30), -- CIDADE DO CLIENTE
    municipio varchar(30), -- MUNICIPIO DO CLIENTE
	uf char (2) not null, -- UF DO CLIENTE
	cep char(8) not null, -- CEP DO CLIENTE
	complemento varchar (20) -- COMPLEMENTO, CASO O CLIENTE PRECISE
);

create table Contato (
	idContato int primary key auto_increment,
	telefoneFixo char (10),
	celularUm char (11) not null,
	celularDois char (11)
 );

create table Cliente( -- AQUI CRIAMOS A TABELA CLIENTE
	idCliente int primary key auto_increment, -- CODIGO DO CLIENTE
    nome varchar (100) not null, -- NOME DO CLIENTE
    cpf char (11), -- CPF DO USUARIO, CASO FOR PESSOA FISICA
    cnpj char (14), -- CNPJ DO USUARIO, CASO FOR PESSOA JURIDICA
    rg varchar (20), --  RG DO USUARIO, CASO FOR PESSOA FISICA
    email varchar (40) not null, -- EMAIL DO CLIENTE
	idEndereco int,
	idContato int,
	foreign key (idEndereco) references Endereco(idEndereco),
	foreign key (idContato) references Contato(idContato)
);

-- ISSO SÓ PODERÁ OCORRER QUANDO OCORRER A CONFIRMAÇÃO DO PAGAMENTO DO CLIENTE 
create table Usuario (
	idLogin int primary key auto_increment, -- CODIGO DO USUARIO APÓS O CADASTRO
    login varchar(100) not null, -- LOGIN DO USUARIO APÓS O SISTEMA FORNECER SEU ACESSO
    senha varchar (100) not null, -- SENHA DO USUARIO APÓS O SISTEMA FORNECER SEU ACESSO
    idCliente int,
    foreign key(idCliente) references Cliente(idCliente)
);

create table Estufa (
	idEstufa int primary key auto_increment,
	idCliente int,
	foreign key (idCliente) references Cliente(idCliente)
);

create table Setor (
	idSetor int primary key auto_increment,
	idEstufa int,
	foreign key (idEstufa) references Estufa(idEstufa)
);

create table Sensor (
	idSensor int primary key auto_increment,
    numeracaoSensor int,
    idSetor int,
	foreign key (idSetor) references Setor(idSetor)
);
 
 create table Medicao (
	idMedi int primary key auto_increment,
	temperatura decimal(4,2),
	umidade decimal (4,2),
	luminosidade int,
	dtMedicao date,
	medTime time ,
    idSensor int,
    foreign key (idSensor) references Sensor(idSensor)
 );

