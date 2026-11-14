use loja_informatica;

-- Tabela 1: Clientes
CREATE TABLE Clientes (
    id_cliente INT PRIMARY KEY,
    nome VARCHAR(100),
    cpf VARCHAR(14),
    telefone VARCHAR(20),
    email VARCHAR(100),
    cidade VARCHAR(60)
);

-- Tabela 2: Produtos
CREATE TABLE Produtos (
    id_produto INT PRIMARY KEY,
    nome_produto VARCHAR(100),
    categoria VARCHAR(50),
    marca VARCHAR(50),
    preco DECIMAL(10,2),
    quantidade_estoque INT
);

-- Tabela 3: Funcionários
CREATE TABLE Funcionarios (
    id_funcionario INT PRIMARY KEY,
    nome VARCHAR(100),
    cargo VARCHAR(50),
    telefone VARCHAR(20),
    salario DECIMAL(10,2)
);

-- Tabela 4: Vendas
CREATE TABLE Vendas (
    id_venda INT PRIMARY KEY,
    id_cliente INT,
    id_funcionario INT,
    data_venda DATE,
    valor_total DECIMAL(10,2),
    FOREIGN KEY (id_cliente) REFERENCES Clientes(id_cliente),
    FOREIGN KEY (id_funcionario) REFERENCES Funcionarios(id_funcionario)
);

-- Inserindo Clientes
INSERT INTO Clientes VALUES (1, 'Ana Souza', '111.222.333-44', '(87) 98888-1111', 'ana@email.com', 'Petrolina');
INSERT INTO Clientes VALUES (2, 'Bruno Lima', '222.333.444-55', '(87) 98888-2222', 'bruno@email.com', 'Juazeiro');
INSERT INTO Clientes VALUES (3, 'Carla Dias', '333.444.555-66', '(87) 98888-3333', 'carla@email.com', 'Petrolina');
INSERT INTO Clientes VALUES (4, 'Daniel Alves', '444.555.666-77', '(87) 98888-4444', 'daniel@email.com', 'Recife');
INSERT INTO Clientes VALUES (5, 'Elisa Mendes', '555.666.777-88', '(87) 98888-5555', 'elisa@email.com', 'Salvador');

-- Inserindo Produtos
INSERT INTO Produtos VALUES (1, 'Mouse Gamer RGB', 'Periféricos', 'Redragon', 120.00, 25);
INSERT INTO Produtos VALUES (2, 'Teclado Mecânico', 'Periféricos', 'HyperX', 350.00, 8);
INSERT INTO Produtos VALUES (3, 'Monitor 24 Pol.', 'Monitores', 'LG', 850.00, 5);
INSERT INTO Produtos VALUES (4, 'Headset Gamer', 'Áudio', 'JBL', 220.00, 15);
INSERT INTO Produtos VALUES (5, 'SSD 480GB', 'Armazenamento', 'Kingston', 280.00, 30);
INSERT INTO Produtos VALUES (6, 'Placa de Vídeo RTX', 'Hardware', 'Nvidia', 2500.00, 3);
INSERT INTO Produtos VALUES (7, 'Notebook Core i5', 'Computadores', 'Dell', 3400.00, 4);
INSERT INTO Produtos VALUES (8, 'Pendrive 64GB', 'Armazenamento', 'SanDisk', 45.00, 50);

-- Inserindo Funcionários
INSERT INTO Funcionarios VALUES (1, 'Marcos Pereira', 'Vendedor', '(87) 99999-1000', 2200.00);
INSERT INTO Funcionarios VALUES (2, 'Juliana Rocha', 'Gerente', '(87) 99999-2000', 3800.00);
INSERT INTO Funcionarios VALUES (3, 'Lucas Santos', 'Atendente', '(87) 99999-3000', 1800.00);

-- Inserindo Vendas
INSERT INTO Vendas VALUES (1, 1, 1, '2026-11-01', 470.00);
INSERT INTO Vendas VALUES (2, 2, 1, '2026-11-02', 850.00);
INSERT INTO Vendas VALUES (3, 3, 3, '2026-11-03', 325.00);
INSERT INTO Vendas VALUES (4, 4, 2, '2026-11-04', 2500.00);
INSERT INTO Vendas VALUES (5, 5, 1, '2026-11-05', 3400.00);


-- 1. Alterando o telefone de um dos clientes cadastrados
UPDATE Clientes SET telefone = '(87) 97777-0000' WHERE id_cliente = 1;

-- 2. Atualizando o preço de pelo menos dois produtos
UPDATE Produtos SET preco = 110.00 WHERE id_produto = 1;
UPDATE Produtos SET preco = 899.00 WHERE id_produto = 3;

-- 3. Alterando o cargo de um funcionário
UPDATE Funcionarios SET cargo = 'Supervisor de Vendas' WHERE id_funcionario = 1;

-- 4. Atualizando a quantidade em estoque de três produtos
UPDATE Produtos SET quantidade_estoque = 20 WHERE id_produto = 1;
UPDATE Produtos SET quantidade_estoque = 12 WHERE id_produto = 2;
UPDATE Produtos SET quantidade_estoque = 45 WHERE id_produto = 5;

-- 5. Alterando a cidade de um cliente
UPDATE Clientes SET cidade = 'Lagoa Grande' WHERE id_cliente = 5;


-- 1. Excluindo um produto que não será mais comercializado (Produto 8)
DELETE FROM Produtos WHERE id_produto = 8;

-- 2. Excluindo um cliente que ainda não possua nenhuma venda registrada (Cliente 6)
DELETE FROM Clientes WHERE id_cliente = 6;


-- 1. Listar todos os clientes cadastrados
SELECT * FROM Clientes;

-- 2. Listar todos os produtos da loja
SELECT * FROM Produtos;

-- 3. Exibir os produtos com preço superior a R$ 500,00
SELECT * FROM Produtos WHERE preco > 500.00;

-- 4. Listar os funcionários cadastrados
SELECT * FROM Funcionarios;

-- 5. Exibir todas as vendas realizadas
SELECT * FROM Vendas;

-- 6. Consultar os produtos que possuem menos de 10 unidades em estoque
SELECT * FROM Produtos WHERE quantidade_estoque < 10;