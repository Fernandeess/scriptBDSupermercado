-- Active: 1686154801534@@127.0.0.1@5432@db_supermercado

-- Path: supermercado.sql

CREATE TABLE Supermercado (
  nro_int_id_supermercado_seq serial NOT NULL,
  txt_nome_supermercado varchar(100) NOT NULL,
  txt_cnpj_supermercado char(14) NOT NULL,
  PRIMARY KEY (nro_int_id_supermercado_seq)
)

CREATE TABLE Endereco(
nro_int_id_endereco_seq serial NOT NULL,
txt_rua varchar(100) NOT NULL,
txt_numero varchar(10) NOT NULL,
txt_bairro varchar(100) NOT NULL,
txt_cidade varchar(100) NOT NULL,
txt_estado varchar(2) NOT NULL,
txt_cep char(8) NOT NULL,
nro_int_id_supermercado int NOT NULL,
CONSTRAINT fk_supermercado FOREIGN KEY (nro_int_id_supermercado) REFERENCES Supermercado (nro_int_id_supermercado_seq)
ON DELETE CASCADE
ON UPDATE CASCADE,
PRIMARY KEY (nro_int_id_endereco_seq)
)

CREATE TABLE Supervisor(
  nro_id_supervisor_seq serial NOT NULL,
  txt_nome_supervisor varchar(100) NOT NULL,
  txt_cpf_supervisor char(11) NOT NULL,
  txt_telefone_supervisor char(11) NOT NULL,
  txt_email_supervisor varchar(100) NOT NULL,
  nro_int_id_supermercado int NOT NULL,
  CONSTRAINT fk_supermercado FOREIGN KEY (nro_int_id_supermercado) REFERENCES Supermercado (nro_int_id_supermercado_seq)
  ON DELETE CASCADE
  ON UPDATE CASCADE,
  PRIMARY KEY (nro_id_supervisor_seq)
)

-- ALTER TABLE Funcionario ADD nro_id_int_supervisor int;

-- ALTER TABLE Funcionario ADD CONSTRAINT fk_supervisor FOREIGN KEY (nro_id_int_supervisor) REFERENCES Supervisor (nro_id_supervisor_seq)

CREATE TABLE Funcionario(
  nro_id_funcionario_seq serial NOT NULL,
  txt_nome_funcionario varchar(100) NOT NULL,
  txt_cpf_funcionario char(11) NOT NULL,
  txt_telefone_funcionario char(11) NOT NULL,
  txt_email_funcionario varchar(100) NOT NULL,
  nro_int_id_supermercado int NOT NULL,
  CONSTRAINT fk_supermercado FOREIGN KEY (nro_int_id_supermercado) REFERENCES Supermercado (nro_int_id_supermercado_seq)
  ON DELETE CASCADE
  ON UPDATE CASCADE,
  CONSTRAINT fk_supervisor FOREIGN KEY (nro_id_funcionario_seq) REFERENCES Supervisor (nro_id_supervisor_seq)
  PRIMARY KEY (nro_id_funcionario_seq)
)

CREATE TABLE Caixa (
  nro_id_caixa_seq serial NOT NULL,
  nro_tipo_caixa int NOT NULL,
  nro_int_id_supermercado int NOT NULL,
  CONSTRAINT fk_supermercado FOREIGN KEY (nro_int_id_supermercado) REFERENCES Supermercado (nro_int_id_supermercado_seq)
  ON DELETE CASCADE
  ON UPDATE CASCADE,
  PRIMARY KEY (nro_id_caixa_seq)
)

CREATE TABLE turno_caixa(
  nro_id_turno_caixa_seq serial NOT NULL,
  dt_date_time_abertura TIMESTAMP NOT NULL,
  dt_date_time_fechamento TIMESTAMP  ,
  nro_salario_caixa decimal(10,2) NOT NULL,
  nro_id_caixa int NOT NULL,
  nro_id_funcionario int NOT NULL,
  CONSTRAINT fk_caixa FOREIGN KEY (nro_id_caixa) REFERENCES Caixa (nro_id_caixa_seq)
  ON DELETE CASCADE
  ON UPDATE CASCADE,
  CONSTRAINT fk_funcionario FOREIGN KEY (nro_id_funcionario) REFERENCES Funcionario (nro_id_funcionario_seq)
  ON DELETE CASCADE
  ON UPDATE CASCADE,
  PRIMARY KEY (nro_id_turno_caixa_seq)
)

CREATE TABLE Cliente (
nro_int_id_cliente_seq serial NOT NULL,
txt_nome_cliente varchar(100) NOT NULL,
txt_cpf_cliente char(11) NOT NULL,
PRIMARY KEY (nro_int_id_cliente_seq)
)

CREATE TABLE Pacote (
nro_int_id_pacote_seq serial NOT NULL,
txt_nome_pacote varchar(100) NOT NULL,
nro_desconto_pacote decimal(10,2) NOT NULL,
PRIMARY KEY (nro_int_id_pacote_seq)
)


CREATE TABLE Categoria (
nro_int_id_categoria_seq serial NOT NULL,
txt_nome_categoria varchar(100) NOT NULL,
PRIMARY KEY (nro_int_id_categoria_seq)
)

CREATE TABLE Produto (
nro_int_id_produto_seq serial,
txt_nome_produto varchar(100) NOT NULL,
dt_validade_produto TIMESTAMP NOT NULL,
nro_int_id_pacote INT,
nro_int_id_categoria int NOT NULL,
CONSTRAINT fk_categoria FOREIGN KEY (nro_int_id_categoria) REFERENCES Categoria (nro_int_id_categoria_seq)
ON DELETE CASCADE
ON UPDATE CASCADE,
CONSTRAINT fk_pacote FOREIGN KEY (nro_int_id_pacote) REFERENCES Pacote (nro_int_id_pacote_seq)
ON DELETE CASCADE
ON UPDATE CASCADE,
PRIMARY KEY (nro_int_id_produto_seq)
);

CREATE TABLE Estoque (
nro_int_id_estoque_seq serial NOT NULL,
nro_int_id_produto int NOT NULL,
nro_int_id_pacote int NOT NULL,
nro_qtd_produto int NOT NULL,
nro_qtd_pacote int NOT NULL,
CONSTRAINT fk_produto FOREIGN KEY (nro_int_id_produto) REFERENCES Produto (nro_int_id_produto_seq)
ON DELETE CASCADE
ON UPDATE CASCADE,
CONSTRAINT fk_pacote FOREIGN KEY (nro_int_id_pacote) REFERENCES Pacote (nro_int_id_pacote_seq)
ON DELETE CASCADE
ON UPDATE CASCADE,
PRIMARY KEY (nro_int_id_estoque_seq)
)


CREATE TABLE Compra (
  nro_int_id_compra_seq serial NOT NULL,
  nro_int_id_produto int NOT NULL,
  nro_int_id_cliente int NOT NULL,
  nro_int_id_caixa int NOT NULL,
  dt_date_time_compra TIMESTAMP NOT NULL,
  CONSTRAINT fk_cliente FOREIGN KEY (nro_int_id_cliente) REFERENCES Cliente (nro_int_id_cliente_seq)
  ON DELETE CASCADE
  ON UPDATE CASCADE,
  CONSTRAINT fk_caixa FOREIGN KEY (nro_int_id_caixa) REFERENCES Caixa (nro_id_caixa_seq)
  ON DELETE CASCADE
  ON UPDATE CASCADE,
  CONSTRAINT fk_produto FOREIGN KEY (nro_int_id_produto) REFERENCES Produto (nro_int_id_produto_seq)
  ON DELETE CASCADE
  ON UPDATE CASCADE,
  PRIMARY KEY (nro_int_id_compra_seq,nro_int_id_produto,nro_int_id_cliente,nro_int_id_caixa)
)

 
 CREATE TABLE Lote (
nro_int_id_lote_seq serial NOT NULL,
nro_id_fornecedor int NOT NULL,
nro_int_id_produto int NOT NULL,
nro_preco_lote decimal(10,2) NOT NULL,
CONSTRAINT fk_fornecedor FOREIGN KEY (nro_id_fornecedor) REFERENCES Fornecedor (nro_int_id_fornecedor_seq),
CONSTRAINT fk_produto FOREIGN KEY (nro_int_id_produto) REFERENCES Produto (nro_int_id_produto_seq),
PRIMARY KEY (nro_int_id_lote_seq)
 )

 CREATE TABLE Fornecedor (
nro_int_id_fornecedor_seq serial NOT NULL,
txt_razao_social_fornecedor varchar(100) NOT NULL,
txt_cnpj_fornecedor char(14) NOT NULL,
txt_telefone_fornecedor char(11) NOT NULL,
txt_email_fornecedor varchar(100) NOT NULL,
PRIMARY KEY (nro_int_id_fornecedor_seq)
)
