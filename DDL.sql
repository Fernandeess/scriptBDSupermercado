-- Active: 1687301206054@@127.0.0.1@5432@supermercado
DROP TABLE IF EXISTS Itens_venda CASCADE;

-- Drop table Supermercado
DROP TABLE IF EXISTS Supermercado CASCADE;

-- Drop table Pacote
DROP TABLE IF EXISTS Pacote CASCADE;

-- Drop table Turno_caixa
DROP TABLE IF EXISTS Venda CASCADE;

-- Drop table Estoque_produto
DROP TABLE IF EXISTS Turno_caixa CASCADE;

-- Drop table Caixa
DROP TABLE IF EXISTS Estoque_produto CASCADE;

-- Drop table Funcionario
DROP TABLE IF EXISTS Caixa CASCADE;

-- Drop table Supervisor
DROP TABLE IF EXISTS Funcionario CASCADE;

-- Drop table Endereco
DROP TABLE IF EXISTS Supervisor CASCADE;

-- Drop table Cliente
DROP TABLE IF EXISTS Endereco CASCADE;

-- Drop table Nota_fiscal
DROP TABLE IF EXISTS Cliente CASCADE;

-- Drop table Lote
DROP TABLE IF EXISTS Nota_fiscal CASCADE;

-- Drop table Fornecedor
DROP TABLE IF EXISTS Lote CASCADE;

-- Drop table Produto
DROP TABLE IF EXISTS Fornecedor CASCADE;

-- Drop table Categoria
DROP TABLE IF EXISTS Produto CASCADE;

-- Drop table Supermercado
DROP TABLE IF EXISTS Categoria CASCADE;
-- Create table Supermercado
CREATE TABLE Supermercado (
  nro_int_id_supermercado_seq serial,
  txt_nome_supermercado varchar(255) NOT NULL,
  txt_cnpj_supermercado char(14) NOT NULL UNIQUE,
  PRIMARY KEY (nro_int_id_supermercado_seq)
);

-- Create table Fornecedor
CREATE TABLE Fornecedor (
  nro_int_id_fornecedor_seq serial,
  txt_razao_social_fornecedor varchar(255) NOT NULL,
  txt_cnpj_fornecedor char(14) NOT NULL UNIQUE,
  txt_telefone_fornecedor char(11) NOT NULL,
  txt_email_fornecedor varchar(100) NOT NULL,
  PRIMARY KEY (nro_int_id_fornecedor_seq)
);

-- create table Endereco
CREATE TABLE Endereco(
  nro_int_id_endereco_seq serial NOT NULL,
  txt_rua varchar(255) NOT NULL,
  txt_numero char(4) NOT NULL,
  txt_bairro varchar(100) NOT NULL,
  txt_cidade varchar(255) NOT NULL,
  txt_estado char(2) NOT NULL,
  txt_cep char(8) NOT NULL,
  nro_id_supermercado INT UNIQUE ,
  CONSTRAINT fk_endereco_supermercado 
	FOREIGN KEY (nro_id_supermercado) 
	REFERENCES Supermercado (nro_int_id_supermercado_seq) 
	ON DELETE CASCADE 
	ON UPDATE CASCADE,
  nro_id_fornecedor INT UNIQUE,
  CONSTRAINT fk_endereco_fornecedor 
	FOREIGN KEY (nro_id_fornecedor) 
	REFERENCES Fornecedor (nro_int_id_fornecedor_seq) 
	ON DELETE CASCADE 
	ON UPDATE CASCADE,
  PRIMARY KEY (nro_int_id_endereco_seq)
);

-- create table Supervisor
CREATE TABLE Supervisor(
  nro_int_id_supervisor_seq serial NOT NULL,
  txt_nome_supervisor varchar(255) NOT NULL,
  txt_cpf_supervisor char(11) NOT NULL,
  txt_email_supervisor varchar(255) NOT NULL UNIQUE,
  txt_telefone_supervisor char(11) NOT NULL,
  nro_id_supermercado INT NOT NULL,
  CONSTRAINT fk_supervisor_supermercado 
	FOREIGN KEY (nro_id_supermercado) 
	REFERENCES Supermercado (nro_int_id_supermercado_seq) 
	ON DELETE CASCADE 
	ON UPDATE CASCADE,
  PRIMARY KEY (nro_int_id_supervisor_seq)
);

-- create table Funcionario
CREATE TABLE Funcionario(
  nro_int_id_funcionario_seq serial NOT NULL,
  txt_nome_funcionario varchar(255) NOT NULL,
  txt_cpf_funcionario char(11) NOT NULL UNIQUE,
  txt_telefone_funcionario char(11) NOT NULL,
  txt_email_funcionario varchar(255) NOT NULL,
  nro_id_supervisor INT NOT NULL,
  nro_id_supermercado INT NOT NULL,
  CONSTRAINT fk_funcionario_supermercado 
	FOREIGN KEY (nro_id_supermercado) 
	REFERENCES Supermercado (nro_int_id_supermercado_seq) 
	ON DELETE CASCADE 
	ON UPDATE CASCADE,
  CONSTRAINT fk_funcionario_supervisor 
	FOREIGN KEY (nro_id_supervisor) 
	REFERENCES Supervisor (nro_int_id_supervisor_seq) 
	ON DELETE CASCADE 
	ON UPDATE CASCADE,
  PRIMARY KEY (nro_int_id_funcionario_seq)
);

-- create table Caixa
CREATE TABLE Caixa (
  nro_int_id_caixa_seq SERIAL NOT NULL,
  nro_numero_caixa INT NOT NULL UNIQUE,
  nro_tipo_caixa INT NOT NULL,
  nro_id_supermercado INT NOT NULL,
  CONSTRAINT fk_caixa_supermercado 
	FOREIGN KEY (nro_id_supermercado) 
	REFERENCES Supermercado (nro_int_id_supermercado_seq) 
	ON DELETE CASCADE 
	ON UPDATE CASCADE,
  PRIMARY KEY (nro_int_id_caixa_seq)
);

-- create table turno_caixa
CREATE TABLE Turno_caixa(
  nro_int_id_turno_caixa_seq serial,
  date_turno_caixa DATE NOT NULL,
  time_abertura TIME NOT NULL,
  time_fechamento TIME ,
  nro_saldo_caixa DECIMAL(10,2) NOT NULL,
  nro_id_caixa INT NOT NULL,
  nro_id_funcionario INT NOT NULL,
  CONSTRAINT fk_turno_caixa_caixa 
	FOREIGN KEY (nro_id_caixa) 
	REFERENCES Caixa (nro_int_id_caixa_seq) 
	ON DELETE CASCADE 
	ON UPDATE CASCADE,
  CONSTRAINT fk_turno_caixa_funcionario 
	FOREIGN KEY (nro_id_funcionario) 
	REFERENCES Funcionario (nro_int_id_funcionario_seq) 
	ON DELETE CASCADE 
	ON UPDATE CASCADE,
  PRIMARY KEY (nro_int_id_turno_caixa_seq)
);

-- create table Cliente
CREATE TABLE Cliente (
  nro_int_id_cliente_seq serial ,
  txt_nome_cliente varchar(255) NOT NULL,
  txt_cpf_cliente char(11) NOT NULL UNIQUE,
  PRIMARY KEY (nro_int_id_cliente_seq)
);

-- create table Categoria
CREATE TABLE Categoria (
  nro_int_id_categoria_seq serial ,
  txt_nome_categoria varchar(255) NOT NULL,
  PRIMARY KEY (nro_int_id_categoria_seq)
);

-- create table Lote
CREATE TABLE Lote (
  nro_int_id_lote_seq serial ,
  nro_id_fornecedor INT NOT NULL,
  nro_preco_compra DECIMAL(10,2) NOT NULL,
  date_validade DATE NOT NULL,
  txt_numero_lote VARCHAR(20) NOT NULL, 
  CONSTRAINT fk_lote_fornecedor 
	FOREIGN KEY (nro_id_fornecedor) 
	REFERENCES Fornecedor (nro_int_id_fornecedor_seq),
  PRIMARY KEY (nro_int_id_lote_seq)
);

-- create table Produto
CREATE TABLE Produto (
  nro_int_id_produto_seq serial,
  txt_codigo_barra CHAR(12) NOT NULL UNIQUE,
  txt_nome_produto VARCHAR(255) NOT NULL UNIQUE,
  nro_id_categoria INT NOT NULL,
  CONSTRAINT fk_produto_categoria 
	FOREIGN KEY (nro_id_categoria) 
	REFERENCES Categoria (nro_int_id_categoria_seq) 
	ON DELETE CASCADE 
	ON UPDATE CASCADE,
  PRIMARY KEY (nro_int_id_produto_seq)
);

-- create table Estoque
CREATE TABLE Estoque_produto (
  nro_int_id_estoque_produto_seq SERIAL,
  nro_qntd_produto_estoque INT NOT NULL,
  nro_preco_venda_estoque DECIMAL(10,2) NOT NULL,
  nro_itens_pacote_estoque INT NOT NULL,
  is_pacote_estoque CHAR(1) NOT NULL,
  nro_id_produto INT NOT NULL,
  nro_id_lote INT NOT NULL,
  CONSTRAINT fk_estoque_produto 
	FOREIGN KEY (nro_id_produto) 
	REFERENCES Produto (nro_int_id_produto_seq) 
	ON DELETE CASCADE 
	ON UPDATE CASCADE,
	CONSTRAINT fk_estoque_lote 
	FOREIGN KEY (nro_id_lote) 
	REFERENCES Lote (nro_int_id_lote_seq) 
	ON DELETE CASCADE 
	ON UPDATE CASCADE,
  PRIMARY KEY (nro_int_id_estoque_produto_seq)
);

-- create table Nota_fiscal
CREATE TABLE Nota_fiscal(
  nro_int_id_nota_fiscal_seq SERIAL,
  nro_preco_total DECIMAL(10,2),
  date_nota_fiscal DATE NOT NULL DEFAULT CURRENT_DATE,
  time_nota_fiscal TIME NOT NULL DEFAULT CURRENT_TIME,
  PRIMARY KEY (nro_int_id_nota_fiscal_seq)
);

-- create table Venda
CREATE TABLE Venda (
  nro_int_id_venda_seq SERIAL, 
  nro_id_turno_caixa INT NOT NULL,
  nro_id_cliente INT,
  nro_id_nota_fiscal INT NOT NULL,
  date_venda DATE NOT NULL,
  time_venda TIME NOT NULL,
  CONSTRAINT fk_venda_turno_caixa 
	FOREIGN KEY (nro_id_turno_caixa) 
	REFERENCES Turno_caixa (nro_int_id_turno_caixa_seq) 
	ON DELETE CASCADE 
	ON UPDATE CASCADE,
  CONSTRAINT fk_venda_cliente 
	FOREIGN KEY (nro_id_cliente) 
	REFERENCES Cliente (nro_int_id_cliente_seq) 
	ON DELETE CASCADE 
	ON UPDATE CASCADE,
  CONSTRAINT fk_venda_nota_fiscal
  FOREIGN KEY (nro_id_nota_fiscal)
  REFERENCES Nota_fiscal (nro_int_id_nota_fiscal_seq)
  ON DELETE CASCADE
  ON UPDATE CASCADE,
  PRIMARY KEY (nro_int_id_venda_seq)
);

-- create table Itens_venda
CREATE TABLE Itens_venda (
	nro_int_id_itens_venda_seq SERIAL ,
	nro_id_estoque_produto INT NOT NULL,
	nro_id_venda INT NOT NULL,
  nro_qntd_itens INT NOT NULL,
  is_atualizado CHAR(1) DEFAULT 'F',
  nro_preco_venda_unidade DECIMAL(10,2) NOT NULL,
  CONSTRAINT fk_itens_venda_id_estoque_produto 
	FOREIGN KEY (nro_id_estoque_produto) 
	REFERENCES Estoque_produto (nro_int_id_estoque_produto_seq) 
	ON DELETE CASCADE 
	ON UPDATE CASCADE,
  CONSTRAINT fk_itens_venda_id_venda 
	FOREIGN KEY (nro_id_venda) 
	REFERENCES Venda (nro_int_id_venda_seq) 
	ON DELETE CASCADE 
	ON UPDATE CASCADE,
	PRIMARY KEY (nro_int_id_itens_venda_seq)
);
-- View


CREATE OR REPLACE VIEW vw_total_vendas_cliente AS
SELECT
  venda.nro_id_cliente,
  SUM(itens.nro_qntd_itens * estoque.nro_preco_venda_estoque) AS total_vendas,
  venda.nro_int_id_venda_seq AS id_venda,
  itens.is_atualizado
FROM
  venda
JOIN
  itens_venda itens ON venda.nro_int_id_venda_seq = itens.nro_id_venda
JOIN
  estoque_produto estoque ON itens.nro_id_estoque_produto = estoque.nro_int_id_estoque_produto_seq
GROUP BY
  venda.nro_id_cliente,
  venda.nro_int_id_venda_seq,
  itens.is_atualizado;



--View "itensComprados":


CREATE OR REPLACE VIEW itensComprados AS
SELECT
  c.txt_nome_cliente AS "Nome cliente",
  v.nro_int_id_venda_seq AS "ID Venda",
  iv.nro_qntd_itens AS "Qtd Vendida",
  po.txt_codigo_barra AS "Codigo de barras",
  po.txt_nome_produto AS "Nome produto",
  ep.nro_qntd_produto_estoque AS "Qntd Estoque",
  ep.is_pacote_estoque AS "Pacote"
FROM
  Produto po
LEFT JOIN
  Estoque_produto ep ON po.nro_int_id_produto_seq = ep.nro_id_produto
LEFT JOIN
  Itens_venda iv ON ep.nro_int_id_estoque_produto_seq = iv.nro_id_estoque_produto
LEFT JOIN
  Venda v ON iv.nro_id_venda = v.nro_int_id_venda_seq
LEFT JOIN
  Cliente c ON v.nro_id_cliente = c.nro_int_id_cliente_seq;


--view de vendas por categoria:

CREATE OR REPLACE VIEW vw_vendas_por_categoria AS
SELECT
  c.txt_nome_categoria AS categoria,
  COUNT(*) AS total_vendas
FROM
  venda v
JOIN
  itens_venda iv ON v.nro_int_id_venda_seq = iv.nro_id_venda
JOIN
  estoque_produto ep ON iv.nro_id_estoque_produto = ep.nro_int_id_estoque_produto_seq
JOIN
  produto p ON ep.nro_id_produto = p.nro_int_id_produto_seq
JOIN
  categoria c ON p.nro_id_categoria = c.nro_int_id_categoria_seq
GROUP BY
  c.txt_nome_categoria;

--Essa view retorna o total de vendas por categoria de produtos.

CREATE OR REPLACE VIEW vw_vendas_por_turno_caixa AS
SELECT
  tc.nro_int_id_turno_caixa_seq AS id_turno_caixa,
  COUNT(*) AS total_vendas
FROM
  venda v
JOIN
  turno_caixa tc ON v.nro_id_turno_caixa = tc.nro_int_id_turno_caixa_seq
GROUP BY
  id_turno_caixa;

Select * from vw_vendas_por_turno_caixa;

--Essa view retorna o total de vendas por turno de caixa.

--View de vendas por cliente:

CREATE OR REPLACE VIEW vw_vendas_por_cliente AS
SELECT
  c.txt_nome_cliente AS cliente,
  COUNT(*) AS total_vendas
FROM
  venda v
JOIN
  cliente c ON v.nro_id_cliente = c.nro_int_id_cliente_seq
GROUP BY
  cliente;



--Indices

CREATE INDEX idx_codigo_barra ON Produto (txt_codigo_barra);
CREATE INDEX idx_numero_lote ON Lote (txt_numero_lote);

-- Procedures

CREATE OR REPLACE PROCEDURE atualizar_quantidade_estoque()
AS $$
DECLARE
  item Itens_venda; -- Declaração de uma variável para armazenar os registros da tabela Itens_venda
BEGIN
  FOR item IN SELECT * FROM Itens_venda -- Loop que percorre os registros da tabela Itens_venda
  LOOP
    -- Imprime os valores antes da verificação
    RAISE NOTICE 'ID do produto: %', item.nro_id_estoque_produto;
    RAISE NOTICE 'Quantidade de itens: %', item.nro_qntd_itens;
    RAISE NOTICE 'Estoque atual: %', (SELECT nro_qntd_produto_estoque FROM Estoque_produto WHERE nro_int_id_estoque_produto_seq = item.nro_id_estoque_produto);
    
    -- Verifica se o item não foi atualizado
    IF item.is_atualizado = 'F' AND item.nro_qntd_itens <= (SELECT nro_qntd_produto_estoque FROM Estoque_produto WHERE nro_int_id_estoque_produto_seq = item.nro_id_estoque_produto)  THEN 
      -- Se o item não foi atualizado e a quantidade de itens vendidos for maior que a quantidade em estoque 
      -- Atualiza a quantidade de estoque do produto subtraindo a quantidade de itens vendidos
      RAISE NOTICE 'Atualizando estoque... qntd Itens: %', item.nro_qntd_itens;
      UPDATE Estoque_produto
      SET nro_qntd_produto_estoque = nro_qntd_produto_estoque - item.nro_qntd_itens
      WHERE nro_int_id_estoque_produto_seq = item.nro_id_estoque_produto;
      -- Atualiza o campo is_atualizado para 'T'
      UPDATE Itens_venda
          SET is_atualizado = 'T'
          WHERE nro_int_id_itens_venda_seq = item.nro_int_id_itens_venda_seq;
      -- A condição WHERE CURRENT OF item garante que apenas o registro corrente em Itens_venda seja atualizado

      -- Registro de log
      RAISE NOTICE 'Estoque atualizado para o produto com ID: %', item.nro_id_estoque_produto;
    ELSE
      RAISE NOTICE 'NÃO ENTROU NO IF';
    END IF;
    
  END LOOP; -- Fim do loop FOR
END;
$$ LANGUAGE plpgsql;

CALL atualizar_quantidade_estoque();

--functions
CREATE OR REPLACE FUNCTION calcular_total_vendas_cliente_atualizar_nf(nro_id_cliente INTEGER, nro_id_venda INTEGER)
    RETURNS NUMERIC AS
$$
DECLARE
    total_vendas NUMERIC;
BEGIN
    -- Obter o total de vendas do cliente a partir da view
    SELECT vw.total_vendas
    INTO total_vendas
    FROM vw_total_vendas_cliente vw
    WHERE vw.is_atualizado = 'T' AND vw.nro_id_cliente = calcular_total_vendas_cliente_atualizar_nf.nro_id_cliente
    AND vw.id_venda = calcular_total_vendas_cliente_atualizar_nf.nro_id_venda;

    -- Atualizar o valor da nota fiscal da venda específica do cliente
    UPDATE nota_fiscal
    SET nro_preco_total = total_vendas
    WHERE nro_int_id_nota_fiscal_seq = nro_id_venda;

    RAISE NOTICE 'ID do cliente: %', nro_id_cliente;
    RAISE NOTICE 'ID da venda: %', nro_id_venda;
    RAISE NOTICE 'Total de vendas: %', total_vendas;
    RETURN total_vendas;
END;
$$
LANGUAGE plpgsql;


UPDATE nota_fiscal
    SET nro_preco_total = 0
    WHERE nro_int_id_nota_fiscal_seq <> 1000;


-- testes




-- testes
DROP FUNCTION IF EXISTS calcular_total_dinheiro_turno(nro_id_turno_caixa INTEGER);

CREATE OR REPLACE FUNCTION calcular_total_dinheiro_turno(nro_id_turno_caixa INTEGER)
    RETURNS NUMERIC AS
$$
DECLARE
    total_dinheiro NUMERIC;
BEGIN
    SELECT SUM(iv.nro_qntd_itens * iv.nro_preco_venda_unidade)
    INTO total_dinheiro
    FROM venda v
    JOIN itens_venda iv ON v.nro_int_id_venda_seq = iv.nro_id_venda
    WHERE v.nro_id_turno_caixa = calcular_total_dinheiro_turno.nro_id_turno_caixa; -- Specify the table name for the column
    
    IF total_dinheiro IS NOT NULL THEN
        UPDATE turno_caixa
        SET nro_saldo_caixa = total_dinheiro
        WHERE nro_int_id_turno_caixa_seq = nro_id_turno_caixa;
    
        RAISE NOTICE 'Total de dinheiro: %', total_dinheiro;
    ELSE
        RAISE NOTICE 'Não há vendas para o turno de caixa %', nro_id_turno_caixa;
    END IF;
    
    RETURN total_dinheiro;
END;
$$
LANGUAGE plpgsql;
 


-- testes