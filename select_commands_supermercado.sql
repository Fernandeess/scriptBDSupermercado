
-- Tabela Supermercado
SELECT *
FROM Supermercado;

-- Tabela Endereco
SELECT *
FROM Endereco;

-- Tabela Supervisor
SELECT *
FROM Supervisor;

-- Tabela Funcionario
SELECT *
FROM Funcionario;

-- Tabela Caixa
SELECT *
FROM Caixa;

-- Tabela turno_caixa
SELECT *
FROM turno_caixa;

-- Tabela Cliente
SELECT *
FROM Cliente;

-- Tabela Categoria
SELECT *
FROM Categoria;

-- Tabela Pacote
SELECT *
FROM Pacote;

-- Tabela Produto
SELECT *
FROM Produto;

-- Tabela Estoque
SELECT *
FROM Estoque;

-- Tabela Compra
SELECT *
FROM Compra;

-- Tabela Nota_fiscal
SELECT *
FROM Nota_fiscal;

-- Tabela Fornecedor
SELECT *
FROM Fornecedor;

-- Tabela Lote
SELECT *
FROM Lote;

-- Selecionar todos os registros da tabela Supermercado com seus respectivos Endereços
SELECT *
FROM Supermercado
JOIN Endereco ON Supermercado.nro_int_id_supermercado_seq = Endereco.nro_int_id_supermercado;

-- Selecionar todos os registros da tabela Supervisor com seus respectivos Supermercados
SELECT *
FROM Supervisor
JOIN Supermercado ON Supervisor.nro_int_id_supermercado = Supermercado.nro_int_id_supermercado_seq;

-- Selecionar todos os registros da tabela Funcionario com seus respectivos Supermercados e Supervisores
SELECT *
FROM Funcionario
JOIN Supermercado ON Funcionario.nro_int_id_supermercado = Supermercado.nro_int_id_supermercado_seq
JOIN Supervisor ON Funcionario.nro_id_int_supervisor = Supervisor.nro_id_supervisor_seq;

-- Selecionar todos os registros da tabela Caixa com seus respectivos Supermercados
SELECT *
FROM Caixa
JOIN Supermercado ON Caixa.nro_int_id_supermercado = Supermercado.nro_int_id_supermercado_seq;

-- Selecionar todos os registros da tabela turno_caixa com seus respectivos Caixas e Funcionarios
SELECT *
FROM turno_caixa
JOIN Caixa ON turno_caixa.nro_id_caixa = Caixa.nro_id_caixa_seq
JOIN Funcionario ON turno_caixa.nro_id_funcionario = Funcionario.nro_id_funcionario_seq;

-- Selecionar todos os registros da tabela Cliente
SELECT *
FROM Cliente;

-- Selecionar todos os registros da tabela Categoria
SELECT *
FROM Categoria;

-- Selecionar todos os registros da tabela Pacote
SELECT *
FROM Pacote;

-- Selecionar todos os registros da tabela Produto com suas respectivas Categorias e Pacotes
SELECT *
FROM Produto
JOIN Categoria ON Produto.nro_int_id_categoria = Categoria.nro_int_id_categoria_seq
JOIN Pacote ON Produto.nro_int_id_pacote = Pacote.nro_int_id_pacote_seq;

-- Selecionar todos os registros da tabela Estoque com seus respectivos Produtos
SELECT *
FROM Estoque
JOIN Produto ON Estoque.nro_int_id_produto = Produto.nro_int_id_produto_seq;

-- Selecionar todos os registros da tabela Compra com seus respectivos Produtos, Clientes e Caixas
SELECT *
FROM Compra
JOIN Produto ON Compra.nro_int_id_produto = Produto.nro_int_id_produto_seq
JOIN Cliente ON Compra.nro_int_id_cliente = Cliente.nro_int_id_cliente_seq
JOIN Caixa ON Compra.nro_int_id_caixa = Caixa.nro_id_caixa_seq;

-- Selecionar todos os registros da tabela Nota_fiscal com seus respectivos Turnos de Caixa
SELECT *
FROM Nota_fiscal
JOIN turno_caixa ON Nota_fiscal.nro_int_id_turno_caixa = turno_caixa.nro_id_turno_caixa_seq;

-- Selecionar todos os registros da tabela Fornecedor
SELECT *
FROM Fornecedor;

-- Selecionar todos os registros da tabela Lote com seus respectivos Fornecedores e Produtos
SELECT *
FROM Lote
JOIN Fornecedor ON Lote.nro_id_fornecedor = Fornecedor.nro_int_id_fornecedor_seq
JOIN Produto ON Lote.nro_int_id_produto = Produto.nro_int_id_produto_seq;

SELECT *
FROM Cliente
JOIN Compra ON Cliente.nro_int_id_cliente_seq = Compra.nro_int_id_cliente
JOIN Nota_fiscal ON Compra.nro_int_id_compra_seq = Nota_fiscal.nro_int_id_nota_fiscal;
