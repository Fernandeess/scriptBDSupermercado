
INSERT INTO Supermercado (txt_nome_supermercado, txt_cnpj_supermercado)
VALUES ('Carrefour', '12345678901234'),
('Extra', '98765432109876');

INSERT INTO Endereco (txt_rua, txt_numero, txt_bairro, txt_cidade, txt_estado, txt_cep, nro_int_id_supermercado)
VALUES ('Rua A', '123', 'Bairro A', 'Cidade A', 'AA', '12345678', 1),
('Rua B', '456', 'Bairro B', 'Cidade B', 'BB', '87654321', 2);

INSERT INTO Supervisor (txt_nome_supervisor, txt_cpf_supervisor, txt_telefone_supervisor, txt_email_supervisor, nro_int_id_supermercado)
VALUES ('Paulo matias', '12345678901', '987654321', 'paulomatias@example.com', 1),
('Ana Paula', '09876543210', '123456789', 'anaPaula@example.com', 2);

INSERT INTO Funcionario (txt_nome_funcionario, txt_cpf_funcionario, txt_telefone_funcionario, txt_email_funcionario, nro_id_int_supervisor, nro_int_id_supermercado)
VALUES ('Jorge Lucas', '11111111111', '111111111', 'funcionarioA@example.com', 1, 1),
('Pedro loots', '22222222222', '222222222', 'funcionarioB@example.com', 2, 2);

INSERT INTO Caixa (nro_tipo_caixa, nro_int_id_supermercado)
VALUES (1, 1),
(2, 2);

INSERT INTO turno_caixa (dt_date_time_abertura, dt_date_time_fechamento, nro_salario_caixa, nro_id_caixa, nro_id_funcionario)
VALUES ('2023-06-09 09:00:00', '2023-06-09 17:00:00', 1000.00, 1, 1),
('2023-06-09 10:00:00', '2023-06-09 18:00:00', 1200.00, 2, 2);

INSERT INTO Cliente (txt_nome_cliente, txt_cpf_cliente)
VALUES ('Matheus', '33333333333'),
('Maria', '44444444444');

INSERT INTO Categoria (txt_nome_categoria)
VALUES ('Bebidas'),
       ('Alimentos'),
       ('Limpeza'),
       ('Higiene'),
       ('Eletrônicos');


INSERT INTO Pacote (txt_nome_pacote, nro_desconto_pacote)
VALUES ('Fardo Skol', 0.4),
('Fardo Brahma', 0.3),
('Fardo Guaraná', 0.2),
('Fardo Pepsi', 0.2),
('Fardo Coca-Cola', 0.3);

INSERT INTO Produto (txt_nome_produto, dt_validade_produto, nro_preco_produto, nro_int_id_pacote, nro_int_id_categoria)
VALUES ('Skol', '2023-12-31', 3.00, 1, 1),
('Brahma', '2023-12-31', 2.50, 2, 2),
('Guaraná', '2023-12-31', 4.00, 3, 1),
('Pepsi', '2023-12-31', 3.00, 4, 1),
('Coca-Cola', '2023-12-31', 5.00, 5, 1);

INSERT INTO Estoque (nro_int_id_produto, nro_qtd_produto)
VALUES (1, 100),
(2, 200);

INSERT INTO Compra (nro_int_id_produto, nro_int_id_cliente, nro_int_id_caixa, dt_date_time_compra)
VALUES (1, 1, 1, '2023-06-09 10:30:00'),
(2, 2, 2, '2023-06-09 11:30:00');

INSERT INTO Nota_fiscal (nro_int_id_nota_fiscal, nro_int_id_turno_caixa, nro_int_price_total, dt_date_time_nota_fiscal)
VALUES (1, 1, 10.00, '2023-06-09 10:30:00'),
(2, 2, 20.00, '2023-06-09 11:30:00');

INSERT INTO Fornecedor (txt_razao_social_fornecedor, txt_cnpj_fornecedor, txt_telefone_fornecedor, txt_email_fornecedor)
VALUES ('Fornecedor A', '12345678901234', '111111111', 'fornecedorA@example.com'),
('Fornecedor B', '98765432109876', '222222222', 'fornecedorB@example.com');

INSERT INTO Lote (nro_id_fornecedor, nro_int_id_produto, nro_preco_lote)
VALUES (1, 1, 50.00),
(2, 2, 70.00);