-- Inserção na tabela Supermercado
INSERT INTO Supermercado (txt_nome_supermercado, txt_cnpj_supermercado)
VALUES ('Supermercado A', '12345678901234');

-- Inserção na tabela Endereco
INSERT INTO Endereco (txt_rua, txt_numero, txt_bairro, txt_cidade, txt_estado, txt_cep, nro_int_id_supermercado)
VALUES ('Rua A', '123', 'Bairro X', 'Cidade Y', 'ZZ', '12345678', 1);

-- Inserção na tabela Supervisor
INSERT INTO Supervisor (txt_nome_supervisor, txt_cpf_supervisor, txt_telefone_supervisor, txt_email_supervisor, nro_int_id_supermercado)
VALUES ('Supervisor A', '12345678901', '9876543210', 'supervisorA@example.com', 1);

-- Inserção na tabela Funcionario
INSERT INTO Funcionario (txt_nome_funcionario, txt_cpf_funcionario, txt_telefone_funcionario, txt_email_funcionario, nro_int_id_supermercado,nro_id_int_supervisor)
VALUES ('Funcionário B', '98765432109', '0123456789', 'funcionarioA@example.com', 1,1);

-- Inserção na tabela Caixa
INSERT INTO Caixa (nro_tipo_caixa, nro_int_id_supermercado)
VALUES (1, 1);

-- Inserção na tabela turno_caixa
INSERT INTO turno_caixa (dt_date_time_abertura, dt_date_time_fechamento, nro_salario_caixa, nro_id_caixa, nro_id_funcionario)
VALUES ('2023-06-07 09:00:00', '2023-06-07 17:00:00', 100.00, 1, 1);

-- Inserção na tabela Cliente
INSERT INTO Cliente (txt_nome_cliente, txt_cpf_cliente)
VALUES ('Cliente A', '01234567890');

-- Inserção na tabela Pacote
INSERT INTO Pacote (txt_nome_pacote, nro_desconto_pacote)
VALUES ('Pacote A', 10.00);

-- Inserção na tabela Categoria
INSERT INTO Categoria (txt_nome_categoria)
VALUES ('Categoria A');

-- Inserção na tabela Produto
INSERT INTO Produto (txt_nome_produto, dt_validade_produto, nro_int_id_pacote, nro_int_id_categoria)
VALUES ('Produto A', '2023-06-30', 1, 1);

-- Inserção na tabela Estoque
INSERT INTO Estoque (nro_int_id_produto, nro_int_id_pacote, nro_qtd_produto, nro_qtd_pacote)
VALUES (1, 1, 100, 10);

-- Inserção na tabela Compra
INSERT INTO Compra (nro_int_id_produto, nro_int_id_cliente, nro_int_id_caixa, dt_date_time_compra)
VALUES (1, 1, 1, '2023-06-07 10:00:00');

-- Inserção na tabela Lote

-- Inserção na tabela Fornecedor
-- Inserção na tabela Fornecedor
INSERT INTO Fornecedor (txt_razao_social_fornecedor, txt_cnpj_fornecedor, txt_telefone_fornecedor, txt_email_fornecedor)
VALUES ('Fornecedor A', '12345678901234', '9876543210', 'fornecedorA@example.com');

-- Inserção na tabela Pacote
INSERT INTO Pacote (txt_nome_pacote, nro_desconto_pacote)
VALUES ('Pacote A', 10.00);

-- Inserção na tabela Categoria
INSERT INTO Categoria (txt_nome_categoria)
VALUES ('Categoria A');

-- Inserção na tabela Produto
INSERT INTO Produto (txt_nome_produto, dt_validade_produto, nro_int_id_pacote, nro_int_id_categoria)
VALUES ('Produto A', '2023-06-30', 1, 1);

-- Inserção na tabela Estoque
INSERT INTO Estoque (nro_int_id_produto, nro_int_id_pacote, nro_qtd_produto, nro_qtd_pacote)
VALUES (1, 1, 100, 10);

-- Inserção na tabela Lote
INSERT INTO Lote (nro_id_fornecedor, nro_int_id_produto, nro_preco_lote)
VALUES (1, 1, 50.00);

