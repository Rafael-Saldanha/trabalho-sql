create database db_revenda_Rafael_Saldanha;

create table tipo_garrafa(
	id serial primary key,
	tipo varchar(30) not null
);

create table produto_garrafa(
	id serial primary key,
	nome varchar (100) not null default 'Garrafa',
	preco numeric (10,2) not null default 40,
	descricao text not null,
	tipo_garrafa_id int, foreign key (id) references tipo_garrafa(id),
	avaliacao numeric (2,1) default 0
);

create table usuario(
	id serial primary key,
	nome varchar(50) not null,
	sobrenome varchar(50) not null unique,
	cpf char(11) not null,
	genero varchar (40) not null,
	email varchar (100) not null,
	endereco_id int, foreign key (id) references endereco(id)
);

create table cartao(
	id serial primary key,
	cartao varchar(20) not null
);

create table pagamento(
	id serial primary key,
	boleto varchar(255),
	pix varchar(100),
	cartao_id int, foreign key (id) references cartao(id) 
);

create table endereco(
	id serial primary key,
	cep char(8) not null unique,
	bairro varchar(50) not null,
	cidade varchar(50) not null,
	numero numeric(10,0) not null,
	estado varchar(50) not null
);

create table pedido(
	id serial primary key,
	data_pedido timestamp,
	status varchar (50) not null,
	valor_total numeric (10,2) not null,
	endereco_id int,
	usuario_id int, 
	foreign key (endereco_id) references endereco(id),
	foreign key (usuario_id) references usuario(id)
);

create view atl as
select cpf from usuario
where id = 1;

create view tpd as
select avaliacao from produto_garrafa
where avaliacao = 5.0;

INSERT INTO tipo_garrafa (tipo) VALUES 
('Vidro'),
('Plástico'),
('Alumínio'),
('PET'),
('Tetra Pak'),
('Aço'),
('Cerâmica'),
('Madeira'),
('Cimento'),
('Fibra de vidro');

INSERT INTO produto_garrafa (nome, preco, descricao, tipo_garrafa_id, avaliacao) VALUES 
('Garrafa de Água', 10.50, 'Garrafa de água PET de 500ml', 4, 4.5),
('Garrafa de Suco', 15.00, 'Garrafa de suco de laranja em vidro de 1L', 1, 4.7),
('Garrafa Térmica', 30.00, 'Garrafa térmica de aço inox', 6, 4.8),
('Garrafa de Chá', 12.00, 'Garrafa de chá verde em plástico', 4, 4.2),
('Garrafa de Vinho', 80.00, 'Garrafa de vinho em vidro escuro', 1, 4.9),
('Garrafa de Refrigerante', 5.00, 'Garrafa de refrigerante em PET de 2L', 4, 3.8),
('Garrafa de Café', 25.00, 'Garrafa térmica para café', 6, 4.6),
('Garrafa de Água Mineral', 7.00, 'Garrafa de água mineral de 1L', 4, 4.4),
('Garrafa de Óleo', 20.00, 'Garrafa de óleo de cozinha em plástico', 4, 3.9),
('Garrafa de Leite', 6.50, 'Garrafa de leite de 1L em vidro', 1, 4.3);

INSERT INTO endereco (cep, bairro, cidade, numero, estado) VALUES 
('12345678', 'Centro', 'São Paulo', 100, 'SP'),
('23456789', 'Jardim das Flores', 'Rio de Janeiro', 200, 'RJ'),
('34567890', 'Vila Nova', 'Belo Horizonte', 300, 'MG'),
('45678901', 'Morumbi', 'São Paulo', 400, 'SP'),
('56789012', 'Itaim Bibi', 'São Paulo', 500, 'SP'),
('67890123', 'Botafogo', 'Rio de Janeiro', 600, 'RJ'),
('78901234', 'Copacabana', 'Rio de Janeiro', 700, 'RJ'),
('89012345', 'Jardim Paulista', 'São Paulo', 800, 'SP'),
('90123456', 'Barra da Tijuca', 'Rio de Janeiro', 900, 'RJ'),
('01234567', 'Santo Amaro', 'São Paulo', 1000, 'SP');

INSERT INTO usuario (nome, sobrenome, cpf, genero, email, endereco_id) VALUES 
('Rafael', 'Saldanha', '12345678901', 'Masculino', 'rafael@exemplo.com', 1),
('Ana', 'Costa', '23456789012', 'Feminino', 'ana@exemplo.com', 2),
('Carlos', 'Oliveira', '34567890123', 'Masculino', 'carlos@exemplo.com', 3),
('Mariana', 'Pereira', '45678901234', 'Feminino', 'mariana@exemplo.com', 4),
('Pedro', 'Silva', '56789012345', 'Masculino', 'pedro@exemplo.com', 5),
('Fernanda', 'Santos', '67890123456', 'Feminino', 'fernanda@exemplo.com', 6),
('Joaquim', 'Sousa', '78901234567', 'Masculino', 'joaquim@exemplo.com', 7),
('Beatriz', 'Alves', '89012345678', 'Feminino', 'beatriz@exemplo.com', 8),
('Juliano', 'Moura', '90123456789', 'Masculino', 'juliano@exemplo.com', 9),
('Isabela', 'Martins', '01234567890', 'Feminino', 'isabela@exemplo.com', 10);

INSERT INTO cartao (cartao) VALUES 
('1234 5678 9876 5432'),
('2345 6789 8765 4321'),
('3456 7890 7654 3210'),
('4567 8901 6543 2109'),
('5678 9012 5432 1098'),
('6789 0123 4321 0987'),
('7890 1234 3210 9876'),
('8901 2345 2109 8765'),
('9012 3456 1098 7654'),
('0123 4567 0987 6543');

INSERT INTO pagamento (boleto, pix, cartao_id) VALUES 
('123456789012', 'https://pix.com/1234567890', 1),
('234567890123', 'https://pix.com/2345678901', 2),
('345678901234', 'https://pix.com/3456789012', 3),
('456789012345', 'https://pix.com/4567890123', 4),
('567890123456', 'https://pix.com/5678901234', 5),
('678901234567', 'https://pix.com/6789012345', 6),
('789012345678', 'https://pix.com/7890123456', 7),
('890123456789', 'https://pix.com/8901234567', 8),
('901234567890', 'https://pix.com/9012345678', 9),
('012345678901', 'https://pix.com/0123456789', 10);

INSERT INTO pedido (data_pedido, status, valor_total, endereco_id, usuario_id) VALUES 
('2025-08-01 12:00:00', 'Em Processamento', 100.00, 1, 1),
('2025-08-02 13:30:00', 'Enviado', 50.00, 2, 2),
('2025-08-03 14:45:00', 'Entregue', 150.00, 3, 3),
('2025-08-04 15:00:00', 'Cancelado', 200.00, 4, 4),
('2025-08-05 16:30:00', 'Em Processamento', 80.00, 5, 5),
('2025-08-06 17:00:00', 'Em Processamento', 120.00, 6, 6),
('2025-08-07 18:15:00', 'Enviado', 70.00, 7, 7),
('2025-08-08 19:45:00', 'Entregue', 140.00, 8, 8),
('2025-08-09 20:00:00', 'Cancelado', 60.00, 9, 9),
('2025-08-10 21:30:00', 'Em Processamento', 90.00, 10, 10);

SELECT * FROM atl;

SELECT * FROM tpd;

-----------------------------dia 28--------------------------------------------------------------

SELECT * FROM usuario u 
WHERE nome LIKE 'R%';

explain select cep
from endereco e
where cep like '8';

create index index_endereco on endereco(cep);

explain select cep
from endereco
where cep like '8';

alter table pedido
alter column status type int;

alter table pedido
alter column endereco_id type varchar(50);

create user Rafael_Saldanha;

grant all privileges on database db_revenda_Rafael_Saldanha 
to Rafael_Saldanha;

create user rrikpeddabjglcguirafacdvmll password '123';

grant select on table produto_garrafa to rikpeddabjglcguirafacdvmll;

-- CONSULTA 1: Usuario com Endereco

-- INNER JOIN
SELECT u.nome, u.email, e.cidade
FROM usuario u
INNER JOIN endereco e ON u.endereco_id = e.id;

-- LEFT JOIN
SELECT u.nome, u.email, e.cidade
FROM usuario u
LEFT JOIN endereco e ON u.endereco_id = e.id;

-- RIGHT JOIN
SELECT u.nome, u.email, e.cidade
FROM usuario u
RIGHT JOIN endereco e ON u.endereco_id = e.id;

-- CONSULTA 2: Pedido com Usuario

-- INNER JOIN
SELECT p.id AS pedido_id, p.data_pedido, u.nome
FROM pedido p
INNER JOIN usuario u ON p.usuario_id = u.id;

-- LEFT JOIN
SELECT p.id AS pedido_id, p.data_pedido, u.nome
FROM pedido p
LEFT JOIN usuario u ON p.usuario_id = u.id;

-- RIGHT JOIN
SELECT p.id AS pedido_id, p.data_pedido, u.nome
FROM pedido p
RIGHT JOIN usuario u ON p.usuario_id = u.id;

-- CONSULTA 3: Produto com Tipo de Garrafa

-- INNER JOIN
SELECT pg.nome, pg.preco, tg.tipo
FROM produto_garrafa pg
INNER JOIN tipo_garrafa tg ON pg.tipo_garrafa_id = tg.id;

-- LEFT JOIN
SELECT pg.nome, pg.preco, tg.tipo
FROM produto_garrafa pg
LEFT JOIN tipo_garrafa tg ON pg.tipo_garrafa_id = tg.id;

-- RIGHT JOIN
SELECT pg.nome, pg.preco, tg.tipo
FROM produto_garrafa pg
RIGHT JOIN tipo_garrafa tg ON pg.tipo_garrafa_id = tg.id;

-- CONSULTA 4: Pagamento com Cartao

-- INNER JOIN
SELECT pg.id AS pagamento_id, c.cartao
FROM pagamento pg
INNER JOIN cartao c ON pg.cartao_id = c.id;

-- LEFT JOIN
SELECT pg.id AS pagamento_id, c.cartao
FROM pagamento pg
LEFT JOIN cartao c ON pg.cartao_id = c.id;

-- RIGHT JOIN
SELECT pg.id AS pagamento_id, c.cartao
FROM pagamento pg
RIGHT JOIN cartao c ON pg.cartao_id = c.id;

update pagamento set pix = null where pix = 'https://pix.com/1234567890';

update pagamento set boleto = null where pix = '123456789012';


