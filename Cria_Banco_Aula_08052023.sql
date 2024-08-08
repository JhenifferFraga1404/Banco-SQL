
CREATE DATABASE dbAds2023_Jheniffer
USE dbAds2023_Jheniffer

CREATE TABLE tbUf
(
	uf char(2),
	nome varchar(30) not null,
	PRIMARY KEY(uf)
)

CREATE TABLE tbMunicipio
(
	id smallint identity,
	nome varchar(30) not null,
	uf char(2) not null,
	PRIMARY KEY(id),
	FOREIGN KEY(uf) REFERENCES tbUf(uf)
)

CREATE TABLE tbCliente
(
	id int identity,
	nome varchar(50) not null,
	cnpj char(14) not null,
	id_municipio smallint not null,
	rua varchar(40) not null,
	nro varchar(6) not null,
	bairro varchar(30),
	cep char(8),
	PRIMARY KEY(id),
	FOREIGN KEY(id_municipio) REFERENCES tbMunicipio(id)
)

CREATE TABLE tbFornecedor
(
	id int identity,
	nome varchar(50) not null,
	cnpj char(14) not null,
	id_municipio smallint not null,
	rua varchar(40) not null,
	nro varchar(6) not null,
	bairro varchar(30),
	cep char(8),
	PRIMARY KEY(id),
	FOREIGN KEY(id_municipio) REFERENCES tbMunicipio(id)
)

CREATE TABLE tbProduto
(
	id int identity,
	descricao varchar(50) not null,
	id_fornecedor int not null,
	saldo int not null,
	valor decimal(9,2),
	PRIMARY KEY(id),
	FOREIGN KEY(id_fornecedor) REFERENCES tbFornecedor(id)
)

CREATE TABLE tbNfEnt
(
	data date not null,
	numero int identity,
	id_fornecedor int not null,
	valor_total decimal(9,2) not null,
	PRIMARY KEY(numero),
	FOREIGN KEY(id_fornecedor) REFERENCES tbFornecedor(id)
)

CREATE TABLE tbNfSai
(
	data date not null,
	numero int identity,
	id_cliente int not null,
	valor_total decimal(9,2) not null,
	PRIMARY KEY(numero),
	FOREIGN KEY(id_cliente) REFERENCES tbCliente(id)
)

CREATE TABLE tbItNfEnt
(
	num_nota int,
	id_produto int,
	val_unit decimal(7,2) not null,
	qtde int not null,
	PRIMARY KEY(num_nota, id_produto),
	FOREIGN KEY(num_nota) REFERENCES tbNfEnt(numero),
	FOREIGN KEY(id_produto) REFERENCES tbProduto(id)
)

CREATE TABLE tbItNfSai
(
	num_nota int,
	id_produto int,
	val_unit decimal(7,2) not null,
	qtde int not null,
	PRIMARY KEY(num_nota, id_produto),
	FOREIGN KEY(num_nota) REFERENCES tbNfEnt(numero),
	FOREIGN KEY(id_produto) REFERENCES tbProduto(id)
)
