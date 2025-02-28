-- apagando banco de dados se existir
drop database dbpadaria;
-- criando banco de dados 
create database dbpadaria;
-- acessar o banco de dados
use dbpadaria;
--criando as tabelas no banco de dados

create table tbFornecedores(
codForn int not null auto_increment,
nome varchar(100),
email varchar(100) unique,
telCel char(10),
primary key(codForn));



create table tbClientes(
codCli int not null auto_increment,
nome varchar (100) not null,
cpf char (14) not null unique,
email varchar (100) unique,
primary key	(codCli));




create table tbFuncionarios(
codFunc int not null auto_increment,
nome varchar(100),
email varchar(100),
telCel char(10),
dataNasc datetime,
salario decimal(9,2) default 0 check(salario >= 0),
sexo char(1) default "F" check(sexo in("F","M")),
primary key(codFunc)
);


create table tbUsuarios(
codUsu int not null auto_increment,
nome varchar(50) not null,
senha varchar(12) not null,
codFunc int not null,
primary key(codUsu),
foreign key(codFunc)references tbFuncionarios(codFunc));



create table tbProdutos(
codProd int not null auto_increment,
descricao varchar(100),
quantidade int,
preco decimal(9,2),
dataVal datetime,
lote char(10),
codForn int not null,
primary key(codProd),
foreign key(codForn)references tbFornecedores(codForn));


create table tbVendas(
codVend int not null auto_increment,
dataVenda date,
horaVenda time,
quantidade decimal (9,2) default 0 check (quantidade >= 0),
valor decimal (9,2) default 0 check(valor >= 0),
codProd int not null,
codUsu int not null,
codCli int not null,
primary key (codVend),
foreign key(codProd) references tbProdutos (codProd),
foreign key(codUsu) references tbUsuarios (codUsu),
foreign key (codCli) references tbClientes (codCli));

-- visualizando as tabelas
show tables;
-- visualizando a estrutura das tabelas
desc tbUsuarios;
desc tbFornecedores;
desc tbFuncionarios;
desc tbClientes;
desc tbProdutos;
desc tbVendas;

-- Inserindo Registros das tabelas
insert into tbClientes(nome,cpf,email)
	values('Manuel Ribeiro','454.435.346-00','ribeiro.manu@hotmail.com');
insert into tbClientes(nome,cpf,email)
	values('Manuela','123.456.789-00','manu@hotmail.com');
insert into tbClientes(nome,cpf,email)
	values('Kafe','123.456.789-10','Kafezin@hotmail.com');






insert into tbFornecedores(nome,email,telCel)
	values('Panco','panco@sac.com.br','9968743108');

insert into tbFornecedores(nome,email,telCel)
	values('Visconti','Visc@sac.com.br','1234567890');







insert into tbFuncionarios (nome,email,telCel,dataNasc,salario,sexo)
	values ('Rogerio','jerinho@gmail.com','1234567890','1980-02-20','8000,35','M');

insert into tbFuncionarios (nome,email,telCel,dataNasc,salario,sexo)
	values ('Fernanda','fernanda.guedes@gmail.com','1234567891','1981-02-20','5000,35','F');







insert into tbUsuarios(nome,senha,codFunc)
	values('rogerio','1234567891011',1);


insert into tbUsuarios(nome,senha,codFunc)
	values('rogeria','1234567891001',2);







insert into tbProdutos(descricao,quantidade,preco,dataVal,lote,codForn)
	values ('Pao de forma', 1,4.99, '07/03/2026', 'A123456789', 1);


insert into tbProdutos(descricao,quantidade,preco,dataVal,lote,codForn)
	values ('Pao Frances', 11,0.99, '07/03/2026', 'B123456789', 2);


insert into tbProdutos(descricao,quantidade,preco,dataVal,lote,codForn)
	values ('Pao De Queijo', 5,8.99, '07/03/2026', 'C123456789',2);


insert into tbProdutos(descricao,quantidade,preco,dataVal,lote,codForn)
	values ('Geleia', 7,21.99, '07/03/2026', 'D123456789',1);


insert into tbProdutos(descricao,quantidade,preco,dataVal,lote,codForn)
	values ('Bolo de Laranja', 1,15.99, '07/03/2026', 'E123456789',2);


insert into tbProdutos(descricao,quantidade,preco,dataVal,lote,codForn)
	values ('Sonho', 5,27.99, '07/03/2026', 'F123456789',1);


insert into tbProdutos(descricao,quantidade,preco,dataVal,lote,codForn)
	values ('Cafezinho', 1,50.99, '07/03/2026', 'G123456789',1);

insert into tbProdutos(descricao,quantidade,preco,dataVal,lote,codForn)
	values ('Coxinha', 1,5.99, '28/02/2026', 'H123456789',2);

-- Visualizando os registros nas tabelas

Select * from tbClientes;
Select * from tbFornecedores;
Select * from tbFuncionarios;
Select * from tbUsuarios;
Select * from tbProdutos;