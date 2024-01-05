create database trabalho4;

use trabalho4;

create table transacoes (
idTransacao int auto_increment primary key,
produto varchar(45),
marca varchar(45),
categoriaProduto varchar(45),
dataTransacao date,
valorTransacao decimal(10,2)
);
insert into transacoes(produto, marca, categoriaProduto, dataTransacao, valorTransacao) values
('relógio', 'cássio', 'eletrônicos', '2012-1-15', 300),
('geladeira', 'eletrolux', 'eletrodomésticos', '2013-5-20', 2600),
('cama box', 'ortobom', 'móveis', '2022-12-12', 1099),
('sofá seis lugares', 'toronto', 'móveis', '2023-6-15', 950),
('microsystem', 'JBL', 'eletrônicos', '2016-5-20', 380),
('smart tv 65"', 'LG', 'eletrônicos', '2023-12-25', 2900),
('mesa de jantar', 'toronto', 'móveis', '2008-1-15', 400),
('liquidificador', 'mondial', 'eletrodomésticos', '2023-5-19', 90),
('fogão 4 bocas', 'esmaltec', 'eletrodomésticos', '2016-06-28', 778),
('guarda-roupa', 'araplac', 'móveis', '2021-9-23', 380),
('ventilador', 'mondial', 'eletrodomésticos', '2023-6-6', 145);

#########

-- 1)
select * from transacoes;

-- 2)
select 
idTransacao as 'Transação ID',
produto as 'Produto',
categoriaProduto as 'Categoria',
dataTransacao as 'Data da Transação',
valorTransacao as 'Valor(R$)'
from transacoes;

-- 3)
select
idTransacao as 'Transação ID',
produto as 'Produto',
categoriaProduto as 'Categoria',
dataTransacao as 'Data da Transação',
valorTransacao as 'Valor(R$)'
from transacoes
where valorTransacao > 100;

-- 4)
select
idTransacao as 'Transação ID',
produto as 'Produto',
categoriaProduto as 'Categoria',
dataTransacao as 'Data da Transação',
valorTransacao as 'Valor(R$)'
from transacoes
order by valorTransacao desc;

-- 5)
select
avg(valorTransacao) as 'Média das Transações',
max(valorTransacao) as 'Valor máximo',
min(valorTransacao) as 'Valor mínimo',
count(*) as 'Total de Transações'
from transacoes;

-- 6)
select
produto as 'Produto',
categoriaProduto as 'Categoria',
avg(valorTransacao) as 'Média Valor'
from transacoes
group by produto;

-- 7)
select
categoriaProduto as 'Categoria',
count(*) as 'Total de produtos vendidos',
sum(valorTransacao) as 'Valor total das vendas',
avg(valorTransacao) as 'Média de valor por transação'
from transacoes
group by categoriaProduto
order by count(categoriaProduto) desc;