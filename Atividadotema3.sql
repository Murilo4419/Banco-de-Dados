use PeixeBom_Sao_Francisco;


-- Desbloquear o modo de segurança para execurtar comandos sem a chave primária na cláusula WHERE
SET SQL_SAFE_UPDATES = 0;


-- Tabela 1: Fornecedores
CREATE TABLE Fornecedores (
    id_fornecedor INT PRIMARY KEY,
    nome VARCHAR(100),
    telefone VARCHAR(20),
    cidade VARCHAR(60),
    produto_fornecido VARCHAR(80)
);


-- Tabela 2: Tanques
CREATE TABLE Tanques (
    id_tanque INT PRIMARY KEY,
    identificacao VARCHAR(100),
    capacidade INT,
    localizacao VARCHAR(80),
    status VARCHAR(30)
);


-- Tabela 3: Produção
CREATE TABLE Producao (
    id_producao INT PRIMARY KEY,
    id_tanque INT,
    especie VARCHAR(60),
    quantidade_peixe INT,
    peso_medio DECIMAL(10,2),
    data_registro DATE,
    FOREIGN KEY (id_tanque) REFERENCES Tanques(id_tanque)
);


-- Tabela 4: Clientes
CREATE TABLE Clientes (
    id_cliente INT PRIMARY KEY,
    nome VARCHAR(100),
    telefone VARCHAR(20),
    cidade VARCHAR(60),
    tipo_cliente VARCHAR(40)
);


-- Tabela 5: Vendas
CREATE TABLE Vendas (
    id_venda INT PRIMARY KEY,
    id_cliente INT,
    especie VARCHAR(60),
    quantidade_kg DECIMAL(10,2),
    preco_kg DECIMAL(10,2),
    valor_total DECIMAL(10,2),
    data_venda DATE,
    FOREIGN KEY (id_cliente) REFERENCES Clientes(id_cliente)
);


-- 4 Fornecedores
INSERT INTO Fornecedores VALUES 
(1, 'Ração Vale do Chico Ltda', '(74) 98811-1111', 'Juazeiro', 'Ração para peixes'),
(2, 'Alevinos São Francisco', '(87) 99922-2222', 'Petrolina', 'Alevinos de Tilápia e Tambaqui'),
(3, 'BioEquipamentos Ribeirinhos', '(74) 98833-3333', 'Juazeiro', 'Bombas e Areadores'),
(4, 'Distribuidora de Gelo Velho Chico', '(87) 99944-4444', 'Petrolina', 'Gelo em escamas');


-- 5 Tanques de criação
INSERT INTO Tanques VALUES 
(1, 'Tanque 01', 5000, 'Setor Norte - Margem do Rio', 'Disponível'),
(2, 'Tanque 02', 4000, 'Setor Norte - Margem do Rio', 'Disponível'),
(3, 'Tanque 03', 6000, 'Setor Sul - Baixada', 'Disponível'),
(4, 'Tanque 04', 3500, 'Setor Sul - Baixada', 'Disponível'),
(5, 'Tanque 05', 5000, 'Setor Leste - Canal Principal', 'Disponível');


-- 8 Registros de produção
INSERT INTO Producao VALUES 
(1, 1, 'Tilápia', 4500, 0.85, '2026-01-10'),
(2, 1, 'Tambaqui', 400, 1.50, '2026-01-15'),
(3, 2, 'Tilápia', 3800, 0.90, '2026-02-01'),
(4, 3, 'Piau', 2500, 0.60, '2026-02-10'),
(5, 3, 'Tilápia', 3000, 0.80, '2026-02-20'),
(6, 4, 'Tambaqui', 3200, 1.40, '2026-03-05'),
(7, 5, 'Tilápia', 4800, 0.95, '2026-03-12'),
(8, 5, 'Surubim', 1200, 2.10, '2026-03-18');


-- 6 Clientes
INSERT INTO Clientes VALUES 
(1, 'Supermercado Grande Rio', '(87) 3861-1234', 'Petrolina', 'Supermercado'),
(2, 'Restaurante Velho Chico', '(74) 3611-5678', 'Juazeiro', 'Restaurante'),
(3, 'Mercado do Açu', '(87) 98855-6677', 'Petrolina', 'Mercado'),
(4, 'João da Silva', '(87) 99966-5544', 'Petrolina', 'Consumidor Individual'),
(5, 'Peixaria Ribeirinha', '(74) 98877-8899', 'Juazeiro', 'Peixaria'),
(6, 'Restaurante Recanto da Ilha', '(87) 99988-9900', 'Petrolina', 'Restaurante');


-- 8 Vendas
INSERT INTO Vendas VALUES 
(1, 1, 'Tilápia', 300.00, 18.50, 5550.00, '2026-04-01'),
(2, 2, 'Tambaqui', 150.00, 22.00, 3300.00, '2026-04-02'),
(3, 3, 'Tilápia', 80.00, 18.50, 1480.00, '2026-04-05'),
(4, 4, 'Tilápia', 10.00, 20.00, 200.00, '2026-04-06'),
(5, 5, 'Piau', 120.00, 25.00, 3000.00, '2026-04-10'),
(6, 6, 'Surubim', 90.00, 35.00, 3150.00, '2026-04-12'),
(7, 1, 'Tilápia', 400.00, 18.50, 7400.00, '2026-04-15'),
(8, 2, 'Tilápia', 50.00, 19.00, 950.00, '2026-04-18');


-- 1. Um fornecedor mudou de telefone. Atualize seu cadastro.
UPDATE Fornecedores 
SET telefone = '(74) 98899-0000' 
WHERE id_fornecedor = 1;


-- 2. Um tanque passou por manutenção. Altere seu status para "Em manutenção".
UPDATE Tanques 
SET status = 'Em manutenção' 
WHERE id_tanque = 2;


-- 3. A quantidade de peixes de um tanque foi atualizada após uma contagem. Corrija o registro de produção.
UPDATE Producao 
SET quantidade_peixe = 4650 
WHERE id_producao = 1;


-- 4. O preço do quilo da tilápia sofreu reajuste. Atualizando o preço nas informações de vendas correspondentes.
UPDATE Vendas 
SET preco_kg = 19.50, valor_total = quantidade_kg * 19.50
WHERE especie = 'Tilápia';


-- 5. Um cliente alterou seu tipo de cadastro de consumidor individual para restaurante. Atualize a informação.
UPDATE Clientes 
SET tipo_cliente = 'Restaurante'
WHERE id_cliente = 4;


-- 1. Quais fornecedores estão cadastrados?
SELECT * FROM Fornecedores;


-- 2. Quantos tanques estão disponíveis?
SELECT COUNT(*) AS tanques_disponiveis 
FROM Tanques 
WHERE status = 'Disponível';


-- 3. Quais tanques estão em manutenção?
SELECT * FROM Tanques 
WHERE status = 'Em manutenção';


-- 4. Quais espécies de peixes aparecem nos registros de produção?
SELECT DISTINCT especie 
FROM Producao;


-- 5. Quais clientes realizam compras?
SELECT DISTINCT c.* 
FROM Clientes c 
JOIN Vendas v ON c.id_cliente = v.id_cliente;


-- 6. Quais vendas tiveram valor superior a R$ 1.000,00?
SELECT * FROM Vendas 
WHERE valor_total > 1000.00;


-- 7. Qual foi a quantidade total de quilos comercializados?
SELECT SUM(quantidade_kg) AS total_quilos_comercializados 
FROM Vendas;


-- Reativar o modo de segurança
SET SQL_SAFE_UPDATES = 1;

