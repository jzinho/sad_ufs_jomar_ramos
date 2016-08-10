CREATE TABLE usuario (
  id_usuario serial PRIMARY KEY,
  senha text NOT NULL,
  ativo boolean DEFAULT false,
  nome varchar(60) NOT NULL,
  email varchar(60) NOT NULL,
  is_gestor boolean default false,
  cpf varchar(11),
  telefone text
);

CREATE TABLE endereco (
  id_endereco serial PRIMARY KEY,
  id_usuario integer REFERENCES usuario (id_usuario) NOT NULL,
  logradouro text NOT NULL,
  numero smallint NOT NULL,
  complemento text,
  cep char(9),
  cidade text,
  estado text
);

CREATE TABLE produto (
  id_produto serial PRIMARY KEY,
  nome varchar(50),
  descricao text,
  preco numeric(14,2),
  quantidade integer
);

CREATE TABLE pedido (
  id_pedido serial PRIMARY KEY,
  id_usuario integer REFERENCES usuario (id_usuario),
  data_abertura timestamp with time zone DEFAULT now(),
  preco_total numeric(14,2),
  data_finalizacao timestamp with time zone
);

CREATE TABLE item (
  id_item serial PRIMARY KEY,
  id_pedido integer REFERENCES pedido (id_pedido),
  id_produto integer REFERENCES produto (id_produto),
  quantidade integer
);

CREATE TABLE funcionario (
   id_funcionario serial PRIMARY KEY,
  senha text NOT NULL,
  ativo boolean DEFAULT false,
  nome varchar(60) NOT NULL,
  email varchar(60) NOT NULL,
  is_gestor boolean default false,
  cpf varchar(11),
  telefone text
);

CREATE TABLE gestor (
   id_gestor serial PRIMARY KEY,
  senha text NOT NULL,
  ativo boolean DEFAULT false,
  nome varchar(60) NOT NULL,
  email varchar(60) NOT NULL,
  is_gestor boolean default false,
  cpf varchar(11),
  telefone text
);

CREATE TABLE vendedor (
   id_vendedor serial PRIMARY KEY,
  senha text NOT NULL,
  ativo boolean DEFAULT false,
  nome varchar(60) NOT NULL,
  email varchar(60) NOT NULL,
  is_gestor boolean default false,
  cpf varchar(11),
  telefone text
);