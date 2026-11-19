create database db_memMoradias;
use db_memMoradias;
create table tb_admin(
    id_adm int primary key,
    nome varchar(50) not null,
    CPF varchar(14) not null unique,
    email varchar(50) not null unique,
    senha varchar(255) not null
);
create table tb_clientes(
    id_cliente int primary key auto_increment,
    nome_completo varchar(100) not null,
    CPF varchar(14) not null unique,
    email varchar(100) not null unique,
    senha varchar(255) not null,
    telefone varchar(15) not null
);
create table tb_kitnets(
    id_kitnet int primary key auto_increment,
    endereco varchar(100) not null,
    bairro varchar(50) not null,
    numero int not null,
    valor_aluguel decimal(10,2) not null,
    disponibilidade varchar(20) not null
);
create table tb_reservas(
    id_reserva int primary key auto_increment,
    id_cliente int not null,
    id_kitnet int not null,
    data_entrada date not null,
    data_saida date not null,
    valor_total decimal(10,2) not null,
    status_reserva varchar(20) not null,
    foreign key (id_cliente) references tb_clientes(id_cliente),
    foreign key (id_kitnet) references tb_kitnets(id_kitnet)
);
create table tb_contratos(
    id_contrato int primary key auto_increment,
    id_reserva int not null unique,
    numero_contrato varchar(20) not null unique,
    data_assinatura date not null,
    status_contrato varchar(20) not null,
    foreign key (id_reserva) references tb_reservas(id_reserva)
);
create table tb_pagamentos(
    id_pagamento int primary key auto_increment,
    id_reserva int not null,
    valor_pagamento decimal(10,2) not null,
    data_vencimento date not null,
    status_pagamento varchar(20) not null,
    foreign key (id_reserva) references tb_reservas(id_reserva)
);
insert into tb_admin (id_adm, nome, CPF, email, senha) values
(1, 'Thais Martin Martin', '442.340.498-22', 'thaismmartin@gmail.com', '140877'),
(2, 'Vitor Martin Amaro', '442.340.498-24', 'vitor.mamaro@outlook.com', '140872');
use db_memMoradias;
select * from tb_admin;