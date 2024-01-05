create database trabalho5;
use trabalho5;

create table Autores (
AutorID int auto_increment primary key,
Nome varchar(45) not null,
Nacionalidade varchar(45)
);

create table Livros (
LivroID int auto_increment primary key,
Titulo varchar(100) not null,
AnoPublicacao int,
AutorID int not null default null,
foreign key (AutorID) references Autores(AutorID)
);

#
# -- 1) Inserção de dados:
#
# Os dados foram inseridos com "insert to" e "values", com vários na mesma chamada.

insert into Autores(Nome, Nacionalidade) values
('Ariano Suassuna', 'Brasil'),
('Ziraldo', 'Brasil'),
('J.R.R. Tolkien', 'Africa do Sul'),
('Autor sem livros', 'Equador');

insert into Livros(Titulo, AnoPublicacao, AutorID) values
('O Alto da Compadecida', 1955, 1), 
('Fernando e Isaura', 1994, 1),
('O Rico Avarento', 1954, 1),
('O Menino Maluquinho', 1980, 2), 
('Chapeuzinho Amarelo', 1970, 2),
('Meninas', 2016, 2),
('O Senhor dos Anéis', 1954, 3), 
('O Hobbit', 1937, 3),
('O Silmarillion', 1977, 3);

#
# -- 2) Consultas simples:
#
# Aqui temos consultas simples das tabelas individualmente, 
# mostrando todas as linhas e colunas de cada uma.

select
AutorID as 'Autor ID',
Nome as 'Autor',
Nacionalidade as 'País'
from Autores;

select
LivroID as 'Livro ID',
Titulo as 'Título',
AnoPublicacao as 'Ano'
from Livros;

# Para juntar as colunas das duas tabelas foi utilizado o "join", mas dessa forma, 
# o autor que não tem livros não aparece nos resultados.

select
Autores.AutorID as 'Autor ID',
Autores.Nome as 'Autor',
Autores.Nacionalidade as 'País',
Livros.LivroID as 'Livro ID',
Livros.Titulo as 'Título',
Livros.AnoPublicacao as 'Ano'
from Autores
join Livros on Autores.AutorID = Livros.AutorID;

#
# -- 3) Consulta com inner join:
#
# Com o "inner join" obtemos o mesmo resultado que o "join"

select
Autores.AutorID as 'Autor ID',
Autores.Nome as 'Autor',
Autores.Nacionalidade as 'País',
Livros.LivroID as 'Livro ID',
Livros.Titulo as 'Título',
Livros.AnoPublicacao as 'Ano'
from Autores
inner join Livros on Autores.AutorID = Livros.AutorID;

#
# -- 4) Consulta com left join:
#
# Utilizando o "left join", a tabela de autores, que está a esquerda, será mostrada por inteiro.
# Então até o autor sem livros é mostrado.

select
Autores.AutorID as 'Autor ID',
Autores.Nome as 'Autor',
Autores.Nacionalidade as 'País',
Livros.LivroID as 'Livro ID',
Livros.Titulo as 'Título',
Livros.AnoPublicacao as 'Ano'
from Autores
left join Livros on Autores.AutorID = Livros.AutorID;

#
# -- 5) Consulta com filtro por nacionalidade:
#
# O filtro por nacionalidade usa o "where", junto com o "left join" para mostrar o autor 
# que não tem livros também, se for o caso. 

select
Autores.AutorID as 'Autor ID',
Autores.Nome as 'Autor',
Autores.Nacionalidade as 'País',
Livros.LivroID as 'Livro ID',
Livros.Titulo as 'Título',
Livros.AnoPublicacao as 'Ano'
from Autores
left join Livros on Autores.AutorID = Livros.AutorID
where Autores.Nacionalidade = 'Equador' or
Autores.Nacionalidade = 'Colombia';

#
# -- 6) Consulta agregada - quantidade de livros:
#
# A consulta agregada junta as tabelas com o left join porque quero mostrar todos os autores
# Adiciona uma coluna chamada Quantidade de livros, que faz a contagem de quantos livros tem
# em cada AutorID (conforme o group by no final).

select
Autores.AutorID as 'Autor ID',
Autores.Nome as 'Autor',
Autores.Nacionalidade as 'País',
count(Livros.LivroID) as 'Quantidade de livros'
from Autores
left join Livros on Autores.AutorID = Livros.AutorID
group by Autores.AutorID;