-- Active: 1687301206054@@127.0.0.1@5432@supermercado
SELECT * FROM Supermercado;
-- Tabela Fornecedor:

SELECT * FROM Fornecedor;
-- Tabela Endereco:

SELECT * FROM Endereco;
-- Tabela Supervisor:

SELECT * FROM Supervisor;
-- Tabela Funcionario:

SELECT * FROM Funcionario;
-- Tabela Caixa:

SELECT * FROM Caixa;
-- Tabela Turno_caixa:

SELECT * FROM Turno_caixa;
-- Tabela Cliente:

SELECT * FROM Cliente;
-- Tabela Categoria:

SELECT * FROM Categoria;
-- Tabela Lote:

SELECT * FROM Lote;
-- Tabela Produto:

SELECT * FROM Produto;
-- Tabela Estoque_produto:

SELECT * FROM Estoque_produto;
-- Tabela Nota_fiscal:

SELECT * FROM Nota_fiscal;
-- Tabela Venda:

SELECT * FROM Venda;
-- Tabela Itens_venda:

SELECT * FROM Itens_venda;
--Aqui estão exemplos de SELECTs com JOINs para cada -- Tabela:

-- SELECT com JOIN para a -- Tabela Endereco e Supermercado:

SELECT e.*, s.txt_nome_supermercado
FROM Endereco e
JOIN Supermercado s ON e.nro_id_supermercado = s.nro_int_id_supermercado_seq;
-- SELECT com JOIN para a -- Tabela Funcionario, Supervisor e Supermercado:

SELECT f.*, s.txt_nome_supervisor, su.txt_nome_supermercado
FROM Funcionario f
JOIN Supervisor s ON f.nro_id_supervisor = s.nro_int_id_supervisor_seq
JOIN Supermercado su ON f.nro_id_supermercado = su.nro_int_id_supermercado_seq;
-- SELECT com JOIN para a -- Tabela Turno_caixa, Caixa e Funcionario:

SELECT t.*, c.nro_numero_caixa, f.txt_nome_funcionario
FROM Turno_caixa t
JOIN Caixa c ON t.nro_id_caixa = c.nro_int_id_caixa_seq
JOIN Funcionario f ON t.nro_id_funcionario = f.nro_int_id_funcionario_seq;
-- SELECT com JOIN para a -- Tabela Lote e Fornecedor:

SELECT l.*, f.txt_razao_social_fornecedor
FROM Lote l
JOIN Fornecedor f ON l.nro_id_fornecedor = f.nro_int_id_fornecedor_seq;
-- SELECT com JOIN para a -- Tabela Produto e Categoria:

SELECT p.*, c.txt_nome_categoria
FROM Produto p
JOIN Categoria c ON p.nro_id_categoria = c.nro_int_id_categoria_seq;
-- SELECT com JOIN para a -- Tabela Estoque_produto, Produto e Lote:

SELECT e.*, p.txt_nome_produto, l.txt_numero_lote
FROM Estoque_produto e
JOIN Produto p ON e.nro_id_produto = p.nro_int_id_produto_seq
JOIN Lote l ON e.nro_id_lote = l.nro_int_id_lote_seq;
-- SELECT com JOIN para a -- Tabela Venda, Turno_caixa e Cliente:

SELECT v.*, t.date_turno_caixa, c.txt_nome_cliente
FROM Venda v
JOIN Turno_caixa t ON v.nro_id_turno_caixa = t.nro_int_id_turno_caixa_seq
JOIN Cliente c ON v.nro_id_cliente = c.nro_int_id_cliente_seq;
-- SELECT com JOIN para a tabela Itens_venda e Estoque_produto:
SELECT i.*, e.nro_qntd_produto, e.nro_preco_venda, e.nro_itens_pacote
FROM Itens_venda i
JOIN Estoque_produto e ON i.nro_id_estoque_produto = e.nro_int_id_estoque_produto_seq;

select * from turno_caixa;
SELECT * FROM Itens_venda;
SELECT calcular_total_dinheiro_turno(2);

SELECT * FROM venda;
SELECT * FROM nota_fiscal;

SELECT * FROM Itens_venda;

SELECT * FROM Cliente JOIN Venda ON Cliente.nro_int_id_cliente_seq = Venda.nro_id_cliente JOIN Nota_fiscal ON Venda.nro_id_nota_fiscal = Nota_fiscal.nro_int_id_nota_fiscal_seq;
SELECT * FROM cliente c JOIN venda v on c.nro_int_id_cliente_seq = v.nro_id_cliente JOIN nota_fiscal nf on v.nro_id_nota_fiscal = nf.nro_int_id_nota_fiscal_seq;

SELECT * FROM Produto WHERE txt_codigo_barra LIKE '5%';

SELECT * FROM Produto WHERE txt_codigo_barra like '47%';

SELECT * FROM Produto;

SELECT * FROM Produto WHERE txt_codigo_barra = '544545956654'

SELECT * FROM  vw_total_vendas_cliente;
SELECT * FROM itensComprados;

SELECT * FROM vw_vendas_por_categoria;
SELECT * FROM vw_vendas_por_cliente;
SELECT calcular_total_dinheiro_turno(2);

SELECT calcular_total_vendas_cliente_atualizar_nf(2,2);

SELECT * FROM Venda;
SELECT * FROM Turno_caixa;
SELECT * FROM Cliente;
SELECt * FROM Itens_venda;
SELECT * FROM Cliente;
SELECT * FROM Nota_fiscal;
SELECT * FROM ;
SELECT * FROM ITEN VENDA

SELECT  
p.txt_codigo_barra,
p.txt_nome_produto,
ep.nro_qntd_produto_estoque,
ep.nro_preco_venda_estoque,
it.nro_qntd_itens,
it.nro_preco_venda_unidade,
ep.nro_itens_pacote_estoque,
ep.is_pacote_estoque,
it.nro_int_id_itens_venda_seq,
it.is_atualizado
FROM Produto p JOIN Estoque_produto ep ON p.nro_int_id_produto_seq = ep.nro_id_produto JOIN Itens_venda it on ep.nro_int_id_estoque_produto_seq = it.nro_id_estoque_produto;
SELECT * FROM Produto p JOIN Estoque_produto ep ON p.nro_int_id_produto_seq = ep.nro_id_produto JOIN Itens_venda it on ep.nro_int_id_estoque_produto_seq = it.nro_id_estoque_produto;

SELECT * FROM Venda;
SELECT * FROM Itens_venda;
SELECT * FROM Nota_fiscal;

SELECT ep.nro_int_id_estoque_produto_seq,
p.txt_nome_produto,
ep.nro_qntd_produto,
ep.nro_itens_pacote,
ep.nro_preco_venda,
ep.is_pacote, 
l.nro_preco_compra,
l.txt_numero_lote
FROM Estoque_produto ep JOIN Produto p on ep.nro_id_produto = p.nro_int_id_produto_seq join lote l on ep.nro_id_lote = l.nro_int_id_lote_seq; 
 
--  SELECT * FROM Produto;

 SELECT * FROM Estoque_produto;

--  SELECT * FROM Lote;

-- INSERTS
INSERT INTO Supermercado (txt_nome_supermercado, txt_cnpj_supermercado)
VALUES ('Supermercado ABC', '12345678901234'),
       ('Supermercado XYZ', '56789012345678'),
       ('Mercado 123', '90123456789012');

INSERT INTO Fornecedor (txt_razao_social_fornecedor, txt_cnpj_fornecedor, txt_telefone_fornecedor, txt_email_fornecedor)
VALUES ('Fornecedor A', '12345678901234', '1234567890', 'fornecedor_a@example.com'),
       ('Fornecedor B', '56789012345678', '9876543210', 'fornecedor_b@example.com'),
       ('Fornecedor C', '90123456789012', '5555555555', 'fornecedor_c@example.com');

INSERT INTO Categoria (txt_nome_categoria)
VALUES ('Alimentos'),
       ('Bebidas'),
       ('Limpeza'),
       ('Higiene'),
       ('Eletrônicos'),
       ('Roupas'),
       ('Acessórios'),
       ('Utensílios Domésticos');
INSERT INTO Produto (txt_codigo_barra, txt_nome_produto, nro_id_categoria) VALUES
('789123456840', 'Requeijão Cremoso Catupiry 250g', 1),
('789123456841', 'Iogurte Natural Vigor 170g', 1),
('789123456842', 'Suco de Laranja Natural One 900ml', 2),
('789123456843', 'Pipoca de Micro-ondas Yoki 100g', 1),
('789123456844', 'Molho Shoyu Sakura 500ml', 1),
('789123456845', 'Biscoito Cream Cracker Marilan 400g', 1),
('789123456846', 'Refrigerante Guaraná Antarctica 2L', 2),
('789123456847', 'Cerveja Brahma 600ml', 2),
('789123456848', 'Água de Coco Ducoco 1L', 2),
('789123456849', 'Café Solúvel Nescafé 100g', 1),
('789123456850', 'Bolacha Passatempo Chocolate 130g', 1),
('789123456851', 'Macarrão Instantâneo Nissin Lámen 85g', 1),
('789123456852', 'Margarina Qualy 500g', 1),
('789123456853', 'Salgadinho Doritos Queijo 55g',1),
('789123456854', 'Creme Dental Colgate Total 90g', 4),
('789123456855', 'Papel Higiênico Personal Vip Folha Dupla 4 rolos', 4),
('789123456856', 'Sabonete em Barra Dove 90g', 4),
('789123456857', 'Desodorante Rexona Aerosol Men 150ml', 4),
('789123456858', 'Shampoo Pantene Hidro-Cauterização 400ml', 4),
('789123456859', 'Condicionador Elseve Reparação Total 300ml', 4),
('789123456860', 'Absorvente Sempre Livre Adapt Plus Suave com Abas 8 unidades', 4),
('789123456861', 'Pasta de Dente Close Up 90g', 4),
('789123456862', 'Detergente Limpol Neutro 500ml', 3),
('789123456863', 'Amaciante de Roupas Downy Flores Silvestres 1L', 3),
('789123456864', 'Sabão em Pó Omo Multiação 1kg', 3),
('789123456865', 'Esponja de Aço Assolan 8 unidades',3),
('789123456866', 'Desinfetante Pinho Sol Original 500ml', 3),
('789123456867', 'Álcool Gel Antisséptico 70% 500ml', 4),
('789123456868', 'Limpador Multiuso Veja Perfumes 500ml', 3),
('789123456869', 'Molho de Pimenta Tabasco Original 60ml', 1),
('789123456870', 'Leite em Pó Ninho Instantâneo 400g', 1),
('789123446840', 'Coca-Cola 500ml', 2),
('123456789012', 'Guaraná Antarctica 2L', 2),
('987654321098', 'Água Mineral sem gás 500ml', 2),
('456789012345', 'Suco de Laranja 1L', 2),
('567890123456', 'Vinho Tinto Merlot 750ml', 2),
('012345678901', 'Cerveja IPA 355ml', 2),
('111111111111', 'Refrigerante de Limão 350ml', 2),
('226222222222', 'Suco de Uva Integral 1L', 2),
('333333333333', 'Chá Gelado de Pêssego 500ml', 2),
('444444444444', 'Água de Coco 200ml', 2),
('555555555555', 'Vodka Absolut 1L', 2),
('666666666666', 'Whisky Johnnie Walker Black Label 750ml', 2),
('777777777777', 'Refrigerante de Laranja 350ml', 2),
('888888888888', 'Suco de Maracujá Concentrado 500ml', 2),
('999999999999', 'Chá Verde 300ml', 2),
('101010101010', 'Água Mineral com gás 500ml', 2),
('121212121212', 'Vinho Branco Chardonnay 750ml', 2),
('131313131313', 'Cerveja Pilsen 500ml', 2),
('141414141414', 'Refrigerante de Cola 350ml', 2),
('151515151515', 'Suco de Abacaxi 1L', 2),
('161616161616', 'Tequila Jose Cuervo 750ml', 2),
('171717171717', 'Gin Bombay Sapphire 750ml', 2),
('181818181818', 'Refrigerante de Guaraná 350ml', 2),
('191919191919', 'Suco de Morango 500ml', 2),
('202020202020', 'Chá de Hibisco 300ml', 2),
('212121212121', 'Água Mineral sem gás 1L',2),
('222222222222', 'Vinho Rosé 750ml', 2),
('232323232323', 'Cerveja Stout 500ml', 2),
('242424242424', 'Refrigerante de Limão Siciliano 350ml', 2),
('252525252525', 'Suco de Maçã 1L', 2);
INSERT INTO Lote (nro_id_fornecedor, nro_preco_compra, date_validade,txt_numero_lote)
VALUES
  (1, 2.20, '2024-12-31', '001'),
  (1, 0.30, '2024-11-30', '002'),
  (1, 5.45, '2024-10-31', '003'),
  (1, 1.50, '2024-09-30', '004'),
  (1, 2.49, '2024-08-31', '005'),
  (1, 1.49, '2024-07-31', '006'),
  (1, 0.99, '2024-06-30', '007'),
  (1, 0.99, '2024-05-31', '008'),
  (1, 1.99, '2024-04-30', '009'),
  (2, 0.30, '2024-03-31', '010'),
  (2, 0.15, '2024-12-31', '011'),
  (2, 0.29, '2024-11-30', '012'),
  (2, 1.15, '2024-10-31', '013'),
  (2, 1.15, '2024-09-30', '014'),
  (2, 1.10, '2024-08-31', '015'),
  (2, 0.95, '2024-07-31', '016'),
  (2, 1.99, '2024-06-30', '017'),
  (2, 0.99, '2024-05-31', '018'),
  (3, 0.15, '2024-04-30', '019'),
  (3, 0.20, '2024-03-31', '020'),
  (3, 1.99, '2024-12-31', '021'),
  (3, 1.49, '2024-11-30', '022'),
  (3, 2.99, '2024-10-31', '023'),
  (3, 1.99, '2024-09-30', '024'),
  (3, 2.99, '2024-08-31', '025'),
  (3, 0.99, '2024-07-31', '026'),
  (3, 0.89, '2024-06-30', '027'),
  (2, 0.69, '2024-05-31', '028'),
  (1, 1.99, '2024-04-30', '029'),
  (1, 0.49, '2024-12-31', '030'),
  (1, 0.99, '2024-11-30', '031'),
  (1, 1.49, '2024-10-31', '032'),
  (1, 2.99, '2024-09-30', '033'),
  (1, 1.99, '2024-08-31', '034'),
  (1, 2.99, '2024-07-31', '035'),
  (1, 0.99, '2024-06-30', '036'),
  (1, 0.99, '2024-05-31', '037'),
  (1, 0.49, '2024-04-30', '038'),
  (2, 1.99, '2024-03-31', '039'),
  (2, 1.49, '2024-12-31', '040'),
  (2, 2.99, '2024-11-30', '041'),
  (2, 1.99, '2024-10-31', '042'),
  (2, 2.99, '2024-09-30', '043'),
  (2, 2.99, '2024-09-30', '044'),
  (2, 0.99, '2024-08-31', '045'),
  (2, 0.45, '2024-07-31', '046'),
  (2, 1.29, '2024-06-30', '047'),
  (2, 1.79, '2024-05-31', '048'),
  (3, 2.49, '2024-04-30', '049'),
  (3, 3.99, '2024-03-31', '050'),
  (3, 2.99, '2024-12-31', '051'),
  (3, 4.99, '2024-11-30', '052'),
  (3, 1.99, '2024-10-31', '053'),
  (3, 5.99, '2024-09-30', '054'),
  (3, 5.99, '2024-08-31', '055'),
  (3, 3.99, '2024-07-31', '056'),
  (3, 2.99, '2024-06-30', '057'),
  (2, 4.49, '2024-05-31', '058'),
  (1, 7.99, '2024-04-30', '059'),
  (3, 5.49, '2024-07-31', '060'),
  (3, 6.99, '2024-06-30', '061');

INSERT INTO Estoque_produto (nro_qntd_produto_estoque, nro_preco_venda_estoque, nro_itens_pacote_estoque, is_pacote_estoque, nro_id_produto, nro_id_lote)
VALUES
  (200, 4.20, 0, 'F', 1, 1),
  (120, 2.30, 0, 'F', 2, 2),
  ( 80, 13.45,0, 'F', 3, 3),
  (100, 4.50, 0, 'F', 4, 4),
  (150, 5.49, 0, 'F', 5, 5),
  (200, 2.49, 0, 'F', 6, 6),
  (100, 3.99, 0, 'F', 7, 7),
  (150, 2.99, 0, 'F', 8, 8),
  (200, 4.99, 0, 'F', 9, 9),
  (120, 1.99, 0, 'F', 10, 10),
  ( 80, 0.99, 0, 'F', 11, 11),
  (100, 1.49, 0, 'F', 12, 12),
  (150, 2.99, 0, 'F', 13, 13),
  (200, 2.49, 0, 'F', 14, 14),
  (100, 3.99, 0, 'F', 15, 15),
  (150, 2.99, 0, 'F', 16, 16),
  (200, 4.99, 0, 'F', 17, 17),
  (120, 1.99, 0, 'F', 18, 18),
  ( 80, 0.99, 0, 'F', 19, 19),
  (100, 1.49, 0, 'F', 20, 20),
  (150, 2.99, 0, 'F', 21, 21),
  (200, 2.49, 0, 'F', 22, 22),
  (100, 3.99, 0, 'F', 23, 23),
  (150, 2.99, 0, 'F', 24, 24),
  (200, 4.99, 0, 'F', 25, 25),
  (120, 1.99, 0, 'F', 26, 26),
  ( 80, 0.99, 0, 'F', 27, 27),
  (100, 1.49, 0, 'F', 28, 28),
  (150, 2.99, 0, 'F', 29, 29),
  (200, 2.49, 0, 'F', 30, 30),
  (100, 3.99, 0, 'F', 31, 31),
  (150, 2.99, 0, 'F', 32, 32),
  (200, 4.99, 0, 'F', 33, 33),
  (120, 1.99, 0, 'F', 34, 34),
  (80,  0.99, 0, 'F', 35, 35),
  (100, 1.49, 0, 'F', 36, 36),
  (150, 2.99, 0, 'F', 37, 37),
  (200, 2.49, 0, 'F', 38, 38),
  (100, 3.99, 0, 'F', 39, 39),
  (150, 2.99, 0, 'F', 40, 40),
  (200, 4.99, 0, 'F', 41, 41),
  (120, 1.99, 0, 'F', 42, 42),
  ( 80, 0.99, 0, 'F', 43, 43),
  (100, 1.49, 0, 'F', 44, 44),
  (150, 2.99, 0, 'F', 45, 45),
  (200, 2.49, 0, 'F', 46, 46),
  (100, 3.99, 0, 'F', 47, 47),
  (150, 2.99, 0, 'F', 48, 48),
  (200, 4.99, 0, 'F', 49, 49),
  (120, 1.99, 0, 'F', 50, 50),
  (50,  5.99, 0, 'F', 51, 2),
  (80,  8.99, 0, 'F', 52, 3),
  (200, 3.99, 0, 'F', 53, 4),
  (150, 2.99, 0, 'F', 54, 5),
  (120, 4.99, 0, 'F', 55, 6),
  (90,  3.49, 0, 'F', 56, 7),
  (70,  6.99, 0, 'F', 57, 8),
  (60,  4.49, 0, 'F', 58, 9),
  (40,  7.99, 0, 'F', 59, 10),
  (30,  5.49, 0, 'F', 60, 11),
  (50,  6.99, 0, 'F', 61, 12);
 INSERT INTO Estoque_produto (nro_qntd_produto_estoque, nro_preco_venda_estoque, nro_itens_pacote_estoque, is_pacote_estoque, nro_id_produto, nro_id_lote)
VALUES (50,3.99,6,'T',7,7);

INSERT INTO Endereco (txt_rua, txt_numero, txt_bairro, txt_cidade, txt_estado, txt_cep, nro_id_supermercado, nro_id_fornecedor)
VALUES
('Rua dos Lírios', '123', 'Jardim das Flores', 'Cidade A', 'SP', '12345678', 1, null),
('Avenida das Palmeiras', '456', 'Centro', 'Cidade B', 'RJ', '56789012', null, 1),
('Rua das Acácias', '789', 'Vila Esperança', 'Cidade C', 'MG', '90123456', 2, null),
('Rua das Violetas', '321', 'Centro', 'Cidade D', 'RS', '65432109', null, 2),
('Avenida dos Ipês', '654', 'Bairro Novo', 'Cidade E', 'BA', '98765432',null, 3),
('Rua das Rosas', '987', 'Jardim das Flores', 'Cidade F', 'SC', '32109876', 3, null);

INSERT INTO Supervisor (txt_nome_supervisor, txt_cpf_supervisor, txt_email_supervisor, txt_telefone_supervisor, nro_id_supermercado)
VALUES ('João Silva', '12345678901', 'joao.silva@example.com', '1111111111', 1),
       ('Maria Santos', '23456789012', 'maria.santos@example.com', '2222222222', 2),
       ('Carlos Oliveira', '34567890123', 'carlos.oliveira@example.com', '3333333333', 3);

INSERT INTO Funcionario (txt_nome_funcionario, txt_cpf_funcionario, txt_telefone_funcionario, txt_email_funcionario, nro_id_supervisor, nro_id_supermercado)
VALUES ('Pedro Almeida', '12345678901', '4444444444', 'pedro.almeida@example.com', 1, 1),
       ('Ana Pereira', '23456789012', '5555555555', 'ana.pereira@example.com', 2, 2),
       ('Luiza Carvalho', '34567890123', '6666666666', 'luiza.carvalho@example.com', 3, 3);     

INSERT INTO Caixa (nro_numero_caixa, nro_tipo_caixa, nro_id_supermercado)
VALUES (1, 1, 1),
       (2, 1, 1),
       (3, 2, 2);

INSERT INTO Turno_caixa (date_turno_caixa, time_abertura, time_fechamento, nro_saldo_caixa, nro_id_caixa, nro_id_funcionario)
VALUES ('2023-06-20', '08:00:00', '18:00:00', 1000.00, 1, 1),
       ('2023-06-20', '09:00:00', '17:00:00', 1500.00, 2, 2),
       ('2023-06-20', '10:00:00', '16:00:00', 2000.00, 3, 3);



INSERT INTO Nota_fiscal (nro_preco_total)
VALUES 
  (100.50),
  (75.20),
  (50.75),
  (120.90),
  (80.40),
  (60.25);




INSERT INTO Cliente (txt_nome_cliente, txt_cpf_cliente)
VALUES
  ('João Silva', '12345678901'),
  ('Maria Santos', '23456789012'),
  ('Pedro Oliveira', '34567890123'),
  ('Ana Souza', '45678901234');

INSERT INTO Nota_fiscal (nro_preco_total)
VALUES
  (100.50),
  (250.75),
  (75.20),
  (150.80);

INSERT INTO Venda (nro_id_turno_caixa, nro_id_cliente,nro_id_nota_fiscal, date_venda, time_venda) VALUES
(1, 1,1, '2023-06-20', '08:00:00'),
(2, 2,2, '2023-06-20', '09:00:00'),
(3, 3,3, '2023-06-20', '10:00:00'),
(1, 2,4, '2023-06-20', '08:00:00'),
(2, 1,5, '2023-06-20', '07:00:00'),
(1, 3,6, '2023-06-20', '11:00:00');
Insert into Itens_venda (nro_id_estoque_produto,nro_id_venda,nro_qntd_itens,nro_preco_venda_unidade) VALUES 
(1,1,10,4.20),
(2,1,2,2.30),
(3,1,3,13.45),
(4,2,1,4.50),
(5,2,2,5.49),
(6,2,4,2.49),
(7,3,6,3.99),
(8,3,7,2.99),
(9,3,8,4.99),
(10,4,9,1.99),
(11,4,5,0.99),
(12,4,5,1.49),
(13,5,1,2.99),
(14,5,20,2.49),
(15,5,3,3.99),
(16,6,4,2.99),
(17,6,5,4.99),
(18,6,6,1.99);