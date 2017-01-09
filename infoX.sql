-- comentários
-- a linha a abaixo cria um banco de dados

create database dbinfox;

-- a linha a baixo escolhe o banco de dados a ser utilizado

use dbinfox;

-- o bloco de instruções a baixo cria uma tabela

create table tbusuarios(
	iduser int primary key,
	usuario varchar(50) not null,
	fone varchar(15),
	login varchar(15) not null unique,
	senha varchar(15) not null
);

-- o comando a baixo descreve a tabela

describe tbusuarios;

-- a linha a baixo insere dados na tabela (CRUD)

-- create 

insert into tbusuarios(iduser, usuario, fone, login, senha)
values(1, 'André Santos', '9999-9999', 'andre', '123456');

-- a linha a baixo exibe os dados da tabela (CRUD)
-- read

select * from tbusuarios;

insert into tbusuarios(iduser, usuario, fone, login, senha)
values(2, 'Administrador', '9999-9999', 'admin', 'admin');

insert into tbusuarios(iduser, usuario, fone, login, senha)
values(3, 'Bill Gates', '9999-9999', 'bill', '123456');

-- a linha a baixo modifica dados na tabela (CRUD)
-- update

update tbusuarios set fone='8888-8888' where iduser=2;

-- a linha a baixo apaga um registro da tabela (CRUD)
-- delete

delete from tbusuarios where iduser=3;

create table tbclientes(
	idcli int primary key auto_increment,
    nomecli varchar(50) not null,
    endcli varchar(100),
    fonecli varchar(50) not null,
    emailcli varchar(50)
);

describe tbclientes;

insert into tbclientes(nomecli, endcli, fonecli, emailcli)
values('Linus Torvalds', 'Rua Tux, 2017', '9999-9999', 'linus@linux.com');

select * from tbclientes;

use dbinfox;

-- tabela os (ordem de serviços)
create table tbos(
	os int primary key auto_increment,
    data_os timestamp default current_timestamp,
    equipamento varchar(150) not null,
    defeito varchar(150) not null,
    servico varchar(150),
    tecnico varchar(30),
    valor decimal(10,2),
    idcli int not null,
    foreign key(idcli) references tbclientes(idcli)
);

describe tbos;


insert into tbos (equipamento, defeito, servico, tecnico, valor, idcli)
values ('Notebook', 'não liga', 'troca da fonte', 'Zé', 87.50, 1);

select * from tbos;

-- o código a baixo traz informações de duas tabelas.

select
O.os, equipamento, defeito, servico, valor,
C.nomecli, fonecli
from tbos as O inner join tbclientes as C on (O.idcli = C.idcli);
