# Estudo-de-Caso-Database-Modeling-SQL-UniFecaf-

# Código SQL do Modelo Físico do Estudo de Caso do Módulo Database Modeling & SQL do curso de Análise e Desenvolvimento de Sistemas na UniFecaf

create database db_estudo_de_caso;

use db_estudo_de_caso;

show tables;

create table tbl_cliente (
	id_cliente int primary key not null unique auto_increment,
    nome varchar (100) not null,
    cpf varchar (11) not null unique
);

create table tbl_telefone_cliente (
	id_telefone_cliente int primary key not null unique auto_increment,
    numero varchar (15) not null,
    id_cliente int not null,
		  foreign key (id_cliente)
			  references tbl_cliente(id_cliente)
);

create table tbl_email_cliente (
	id_email_cliente int primary key not null unique auto_increment,
    email varchar (320) not null,
    id_cliente int not null,
		  foreign key (id_cliente)
			  references tbl_cliente(id_cliente)
);

create table tbl_endereco (
	id_endereco int primary key not null unique auto_increment,
    logradouro varchar (200) not null,
    bairro varchar (200) not null,
    cep varchar (8) not null,
    cidade varchar (100) not null,
    estado varchar (100) not null,
    pais varchar (100) not null,
    id_cliente int not null,
		  foreign key (id_cliente)
			  references tbl_cliente(id_cliente)
);
    
create table tbl_colaborador (
	id_colaborador int primary key not null unique auto_increment,
    nome varchar (100) not null,
    cpf varchar (11) not null unique,
    cargo varchar (45) not null
);
    
create table tbl_telefone_colaborador (
	id_telefone_colaborador int primary key not null unique auto_increment,
  numero varchar (15) not null,
  id_colaborador int not null,
		foreign key (id_colaborador)
			references tbl_colaborador(id_colaborador)
);

create table tbl_email_colaborador (
	id_email_colaborador int primary key not null unique auto_increment,
  email varchar (320) not null,
  id_colaborador int not null,
		foreign key (id_colaborador)
			references tbl_colaborador(id_colaborador)
);

create table tbl_produto (
	id_produto int primary key not null unique auto_increment,
  nome varchar (100) not null,
  categoria varchar (100) not null,
  preco decimal (10,2) not null,
  marca varchar (100) not null,
  cod_barras varchar (128) not null unique,
  qtde_estoque int not null,
  data_validade date
);

create table tbl_venda (
	id_venda int primary key not null unique auto_increment,
  data_venda datetime not null,
  preco_total decimal (10,2) not null,
  desconto decimal (10,2) not null,
  forma_pagamento varchar (20) not null,
  id_colaborador int not null,
	  foreign key (id_colaborador)
		  references tbl_colaborador(id_colaborador),
	id_cliente int not null,
		foreign key (id_cliente)
			references tbl_cliente(id_cliente)
);

create table tbl_item_venda (
	id_item_venda int primary key not null unique auto_increment,
  qtde_vendida int not null,
  preco_unitario decimal (10,2) not null,
  id_venda int not null,
		foreign key (id_venda)
			references tbl_venda(id_venda),
	id_produto int not null,
		foreign key (id_produto)
			references tbl_produto(id_produto)
);
