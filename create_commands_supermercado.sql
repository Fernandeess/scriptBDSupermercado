
CREATE TABLE Supermercado (
  nro_int_id_supermercado_seq serial NOT NULL,
  txt_nome_supermercado varchar(100) NOT NULL,
  txt_cnpj_supermercado char(14) NOT NULL,
  PRIMARY KEY (nro_int_id_supermercado_seq)
);

-- Create table Endereco
CREATE TABLE Endereco(
  nro_int_id_endereco_seq serial NOT NULL,
  txt_rua varchar(100) NOT NULL,
  txt_numero varchar(4) NOT NULL,
  txt_bairro varchar(100) NOT NULL,
  txt_cidade varchar(100) NOT NULL,
  txt_estado varchar(2) NOT NULL,
  txt_cep char(8) NOT NULL,
  nro_int_id_supermercado INT,
  CONSTRAINT fk_endereco_supermercado FOREIGN KEY (nro_int_id_supermercado) REFERENCES Supermercado (nro_int_id_supermercado_seq) ON DELETE CASCADE ON UPDATE CASCADE,
  nro_int_id_fornecedor INT,
  CONSTRAINT fk_endereco_fornecedor FOREIGN KEY (nro_int_id_fornecedor) REFERENCES Fornecedor (nro_int_id_fornecedor_seq) ON DELETE CASCADE ON UPDATE CASCADE,
  PRIMARY KEY (nro_int_id_endereco_seq),
);

-- Create table Supervisor
CREATE TABLE Supervisor(
  nro_id_supervisor_seq serial NOT NULL,
  txt_nome_supervisor varchar(100) NOT NULL,
  txt_cpf_supervisor char(11) NOT NULL,
  txt_email_supervisor varchar(100) NOT NULL,
  txt_telefone_supervisor char(11) NOT NULL,
  nro_int_id_supermercado INT NOT NULL,
  CONSTRAINT fk_supervisor_supermercado FOREIGN KEY (nro_int_id_supermercado) REFERENCES Supermercado (nro_int_id_supermercado_seq) ON DELETE CASCADE ON UPDATE CASCADE,
  PRIMARY KEY (nro_id_supervisor_seq)
);

-- Create table Funcionario
CREATE TABLE Funcionario(
  nro_id_funcionario_seq serial NOT NULL,
  txt_nome_funcionario varchar(100) NOT NULL,
  txt_cpf_funcionario char(11) NOT NULL,
  txt_telefone_funcionario char(11) NOT NULL,
  txt_email_funcionario varchar(100) NOT NULL,
  nro_id_int_supervisor INT NOT NULL,
  nro_int_id_supermercado INT NOT NULL,
  CONSTRAINT fk_funcionario_supermercado FOREIGN KEY (nro_int_id_supermercado) REFERENCES Supermercado (nro_int_id_supermercado_seq) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT fk_funcionario_supervisor FOREIGN KEY (nro_id_int_supervisor) REFERENCES Supervisor (nro_id_supervisor_seq) ON DELETE CASCADE ON UPDATE CASCADE,
  PRIMARY KEY (nro_id_funcionario_seq)
);

-- Create table Caixa
CREATE TABLE Caixa (
  nro_int_id_caixa_seq serial NOT NULL,
  nro_tipo_caixa INT NOT NULL,
  nro_int_id_supermercado INT NOT NULL,
  CONSTRAINT fk_caixa_supermercado FOREIGN KEY (nro_int_id_supermercado) REFERENCES Supermercado (nro_int_id_supermercado_seq) ON DELETE CASCADE ON UPDATE CASCADE,
  PRIMARY KEY (nro_id_caixa_seq)
);

-- Create table turno_caixa
CREATE TABLE Turno_caixa(
  nro_id_turno_caixa_seq serial NOT NULL,
  dt_date_time_abertura TIMESTAMP NOT NULL,
  dt_date_time_fechamento TIMESTAMP,
  nro_saldo_caixa DECIMAL(10,2) NOT NULL,
  nro_id_caixa INT NOT NULL,
  nro_id_funcionario INT NOT NULL,
  CONSTRAINT fk_turno_caixa_caixa FOREIGN KEY (nro_id_caixa) REFERENCES Caixa (nro_id_caixa_seq) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT fk_turno_caixa_funcionario FOREIGN KEY (nro_id_funcionario) REFERENCES Funcionario (nro_id_funcionario_seq) ON DELETE CASCADE ON UPDATE CASCADE,
  PRIMARY KEY (nro_id_turno_caixa_seq)
);

-- Create table Cliente
CREATE TABLE Cliente (
  nro_int_id_cliente_seq serial NOT NULL,
  txt_nome_cliente varchar(100) NOT NULL,
  txt_cpf_cliente char(11) NOT NULL,
  PRIMARY KEY (nro_int_id_cliente_seq)
);

-- Create table Categoria
CREATE TABLE Categoria (
  nro_int_id_categoria_seq serial NOT NULL,
  txt_nome_categoria varchar(255) NOT NULL,
  PRIMARY KEY (nro_int_id_categoria_seq)
);

-- Create table Pacote
CREATE TABLE Pacote (
  nro_int_id_pacote_seq serial NOT NULL,
  txt_nome_pacote varchar(255) NOT NULL,
  nro_desconto_pacote DECIMAL(10,2) NOT NULL,
  nro_qntd_itens INT NOT NULL
  PRIMARY KEY (nro_int_id_pacote_seq)
);

-- Create table Produto
CREATE TABLE Produto (
  nro_int_id_produto_seq serial,
  txt_nome_produto varchar(255) NOT NULL,
  nro_preco_produto DECIMAL(10,2) NOT NULL,
  nro_int_id_pacote INT,
  nro_int_id_categoria INT NOT NULL,
  CONSTRAINT fk_produto_categoria FOREIGN KEY (nro_int_id_categoria) REFERENCES Categoria (nro_int_id_categoria_seq) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT fk_produto_pacote FOREIGN KEY (nro_int_id_pacote) REFERENCES Pacote (nro_int_id_pacote_seq) ON DELETE CASCADE ON UPDATE CASCADE,
  PRIMARY KEY (nro_int_id_produto_seq)
);

-- Create table Estoque
CREATE TABLE Estoque_produto (
  nro_int_id_estoque_seq serial NOT NULL,
  nro_int_id_produto INT NOT NULL,
  nro_qtd_produto INT NOT NULL,
  CONSTRAINT fk_estoque_produto FOREIGN KEY (nro_int_id_produto) REFERENCES Produto (nro_int_id_produto_seq) ON DELETE CASCADE ON UPDATE CASCADE,
  PRIMARY KEY (nro_int_id_estoque_seq)
);

-- Create table Compra
CREATE TABLE Compra (
  nro_int_id_compra_seq serial NOT NULL,
  nro_int_id_produto INT NOT NULL,
  nro_int_id_cliente INT NOT NULL,
  nro_int_id_caixa INT NOT NULL,
  dt_date_time_compra TIMESTAMP NOT NULL,
  CONSTRAINT fk_compra_produto FOREIGN KEY (nro_int_id_produto) REFERENCES Produto (nro_int_id_produto_seq) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT fk_compra_cliente FOREIGN KEY (nro_int_id_cliente) REFERENCES Cliente (nro_int_id_cliente_seq) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT fk_compra_caixa FOREIGN KEY (nro_int_id_caixa) REFERENCES Caixa (nro_id_caixa_seq) ON DELETE CASCADE ON UPDATE CASCADE,
  PRIMARY KEY (nro_int_id_compra_seq)
);

-- Create table Nota_fiscal
CREATE TABLE Nota_fiscal(
  nro_int_id_nota_fiscal INT,
  nro_int_id_turno_caixa INT NOT NULL,
  nro_int_price_total DECIMAL(10,2) NOT NULL,
  dt_date_time_nota_fiscal TIMESTAMP,
  CONSTRAINT fk_nota_fiscal_turno_caixa FOREIGN KEY (nro_int_id_turno_caixa) REFERENCES turno_caixa (nro_id_turno_caixa_seq),
  PRIMARY KEY (nro_int_id_nota_fiscal)
);

-- Create table Fornecedor
CREATE TABLE Fornecedor (
  nro_int_id_fornecedor_seq serial NOT NULL,
  txt_razao_social_fornecedor varchar(100) NOT NULL,
  txt_cnpj_fornecedor char(14) NOT NULL,
  txt_telefone_fornecedor char(11) NOT NULL,
  txt_email_fornecedor varchar(100) NOT NULL,
  PRIMARY KEY (nro_int_id_fornecedor_seq)
);

-- Create table Lote
CREATE TABLE Lote (
  nro_int_id_lote_seq serial NOT NULL,
  nro_id_fornecedor INT NOT NULL,
  nro_int_id_produto INT NOT NULL,
  nro_preco_lote DECIMAL(10,2) NOT NULL,
  CONSTRAINT fk_lote_fornecedor FOREIGN KEY (nro_id_fornecedor) REFERENCES Fornecedor (nro_int_id_fornecedor_seq),
  CONSTRAINT fk_lote_produto FOREIGN KEY (nro_int_id_produto) REFERENCES Produto (nro_int_id_produto_seq),
  PRIMARY KEY (nro_int_id_lote_seq)
);