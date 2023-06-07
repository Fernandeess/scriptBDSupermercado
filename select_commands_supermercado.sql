
--SELECT na tabela Supermercado:
SELECT * FROM Supermercado;

--SELECT na tabela Endereco:
SELECT * FROM Endereco;

--SELECT na tabela Supervisor:
SELECT * FROM Supervisor;

--SELECT na tabela Funcionario:
SELECT * FROM Funcionario;

SELECT * FROM Funcionario f JOIN Supervisor s ON f.nro_id_int_supervisor = s.nro_id_supervisor_seq;

--SELECT na tabela Caixa:
SELECT * FROM Caixa;

--SELECT na tabela turno_caixa:
SELECT * FROM turno_caixa;

--SELECT na tabela Cliente:
SELECT * FROM Cliente;

--SELECT na tabela Pacote:
SELECT * FROM Pacote;

--SELECT na tabela Categoria:
SELECT * FROM Categoria;

--SELECT na tabela Produto:
SELECT * FROM Produto;

--SELECT na tabela Estoque:
SELECT * FROM Estoque;

--SELECT na tabela Compra:
SELECT * FROM Compra;

--SELECT na tabela Lote:
SELECT * FROM Lote;

--SELECT na tabela Fornecedor:
SELECT * FROM Fornecedor;

--SELECTs com JOIN entre as tabelas:
--15. SELECT com JOIN entre a tabela Compra, Cliente e Produto:
SELECT c.nro_int_id_compra_seq, c.dt_date_time_compra, cl.txt_nome_cliente, p.txt_nome_produto
FROM Compra c
JOIN Cliente cl ON c.nro_int_id_cliente = cl.nro_int_id_cliente_seq
JOIN Produto p ON c.nro_int_id_produto = p.nro_int_id_produto_seq;

--SELECT com JOIN entre a tabela Estoque, Produto e Categoria:
SELECT e.nro_int_id_estoque_seq, p.txt_nome_produto, c.txt_nome_categoria
FROM Estoque e
JOIN Produto p ON e.nro_int_id_produto = p.nro_int_id_produto_seq
JOIN Categoria c ON p.nro_int_id_categoria = c.nro_int_id_categoria_seq;

--SELECT com JOIN entre a tabela Lote, Fornecedor e Produto:
SELECT l.nro_int_id_lote_seq, f.txt_razao_social_fornecedor, p.txt_nome_produto
FROM Lote l
JOIN Fornecedor f ON l.nro_id_fornecedor = f.nro_int_id_fornecedor_seq
JOIN Produto p ON l.nro_int_id_produto = p.nro_int_id_produto_seq;