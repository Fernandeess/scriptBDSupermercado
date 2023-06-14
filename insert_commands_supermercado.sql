
INSERT INTO Supermercado (txt_nome_supermercado, txt_cnpj_supermercado)
VALUES ('Carrefour', '12345678901234'),
('Extra', '98765432109876');

INSERT INTO Endereco (txt_rua, txt_numero, txt_bairro, txt_cidade, txt_estado, txt_cep, nro_id_fornecedor)
VALUES ('Rua A', '123', 'Bairro A', 'Cidade A', 'AA', '12345678', 1),
('Rua B', '456', 'Bairro B', 'Cidade B', 'BB', '87654321', 2);

INSERT INTO Endereco (txt_rua, txt_numero, txt_bairro, txt_cidade, txt_estado, txt_cep, nro_int_id_supermercado)
VALUES ('Rua A', '123', 'Bairro A', 'Cidade A', 'AA', '12345678', 1),
('Rua B', '456', 'Bairro B', 'Cidade B', 'BB', '87654321', 2);

INSERT INTO Supervisor (txt_nome_supervisor, txt_cpf_supervisor, txt_telefone_supervisor, txt_email_supervisor, nro_id_supermercado)
VALUES ('Paulo matias', '12345678901', '987654321', 'paulomatias@example.com', 1),
('Ana Paula', '09876543210', '123456789', 'anaPaula@example.com', 2);

INSERT INTO Funcionario (txt_nome_funcionario, txt_cpf_funcionario, txt_telefone_funcionario, txt_email_funcionario, nro_id_supervisor, nro_id_supermercado)
VALUES ('Jorge Lucas', '11111111111', '111111111', 'funcionarioA@example.com', 1, 1),
('Pedro loots', '22222222222', '222222222', 'funcionarioB@example.com', 2, 2);

INSERT INTO Caixa (nro_tipo_caixa, nro_id_supermercado)
VALUES (1, 1),
(2, 2);

INSERT INTO turno_caixa (dt_date_time_abertura, dt_date_time_fechamento, nro_saldo_caixa, nro_id_caixa, nro_id_funcionario)
VALUES ('2023-06-09 09:00:00', null, 0.00, 1, 1),
('2023-06-09 10:00:00', null, 0000.00, 2, 2);

INSERT INTO Cliente (txt_nome_cliente, txt_cpf_cliente)
VALUES ('Matheus', '33333333333'),
('Maria', '44444444444');

INSERT INTO Categoria (txt_nome_categoria)
VALUES ('Bebidas'),
       ('Alimentos'),
       ('Limpeza'),
       ('Higiene'),
       ('Eletrônicos');
SELECT * FROM Pacote;

INSERT INTO Pacote (txt_nome_pacote,nro_qntd_itens, nro_desconto_pacote)
VALUES ('Fardo Skol',6, 0.4),
('Fardo Brahma',6, 0.3),
('Fardo Guaraná',6, 0.2),
('Fardo Pepsi',6, 0.2),
('Fardo Coca-Cola',6, 0.3);

INSERT INTO Produto (txt_nome_produto, nro_preco_produto, nro_id_pacote, nro_id_categoria)
VALUES ('Skol', 3.00, 3, 1),
('Brahma', 2.50, 4, 2),
('Guaraná', 4.00, 5, 1),
('Pepsi', 3.00, 6, 1),
('Coca-Cola', 5.00, 7, 1);

INSERT INTO Lote (nro_id_fornecedor,nro_int_id_produto,nro_preco_lote) VALUES 
(1,5,  )


INSERT INTO Nota_fiscal (nro_int_id_nota_fiscal, nro_int_id_turno_caixa, nro_int_price_total, dt_date_time_nota_fiscal)
VALUES (1, 1, 10.00, '2023-06-09 10:30:00'),
(2, 2, 20.00, '2023-06-09 11:30:00');

INSERT INTO Fornecedor (txt_razao_social_fornecedor, txt_cnpj_fornecedor, txt_telefone_fornecedor, txt_email_fornecedor)
VALUES ('Fornecedor A', '12345678901234', '111111111', 'fornecedorA@example.com'),
('Fornecedor B', '98765432109876', '222222222', 'fornecedorB@example.com');

SELECT * FROM Fornecedor

INSERT INTO Lote (nro_id_fornecedor, nro_int_id_produto, nro_preco_lote)
VALUES (1, 1, 1500.00),
(2, 2, 170.00);