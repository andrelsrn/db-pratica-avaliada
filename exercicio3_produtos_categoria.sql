-- =====================================================================
-- EXERCÍCIO 3 – Sistema de Produtos e Categorias
-- =====================================================================

-- 1. Criação do Banco de Dados
-- O comando CREATE DATABASE inicializa o banco db_loja.
CREATE DATABASE IF NOT EXISTS db_loja;
USE db_loja;


-- 2. Criação das Tabelas
-- Tabela de categorias (deve ser criada primeiro por ser a chave primária referenciada)
CREATE TABLE tb_categoria (
    id_categoria INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL
);

-- Tabela de produtos com relacionamento (FK) referenciando as categorias
CREATE TABLE tb_produto (
    id_produto INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    preco DECIMAL(10, 2) NOT NULL, -- Armazena o preço com duas casas decimais
    id_categoria INT,
    CONSTRAINT fk_produto_categoria FOREIGN KEY (id_categoria) REFERENCES tb_categoria(id_categoria) ON DELETE SET NULL
);


-- 3. Inserção de Registros
-- Inserindo categorias
INSERT INTO tb_categoria (nome) VALUES
('Informática'),
('Eletrônicos'),
('Escritório'),
('Games'),
('Áudio');

-- Inserindo produtos associados às categorias criadas
INSERT INTO tb_produto (nome, preco, id_categoria) VALUES
('Teclado Mecânico', 120.00, 1),
('Mouse Sem Fio', 89.90, 1),
('Monitor 24 Polegadas', 899.00, 1),
('Smart TV 55', 2499.99, 2),
('Cadeira Ergonômica', 650.00, 3),
('Console PlayStation 5', 3800.00, 4),
('Headset Gamer', 250.00, 5),
('Caixa de Som Bluetooth', 180.00, 5);


-- 4. Listar todos os Produtos
-- Retorna todas as colunas e registros da tabela de produtos.
SELECT * FROM tb_produto;


-- 5. Filtrar produtos por preço (ex: produtos com preço menor que R$ 200,00)
-- O operador < filtra os registros que atendem ao teto de preço estipulado.
SELECT * FROM tb_produto WHERE preco < 200.00;


-- 6. Atualizar o preço de um produto específico
-- Altera o preço especificamente do produto com ID 2 (Mouse Sem Fio).
UPDATE tb_produto 
SET preco = 79.90 
WHERE id_produto = 2;


-- 7. Remover um produto específico
-- Remove o produto com ID 5 (Cadeira Ergonômica) utilizando a chave primária.
DELETE FROM tb_produto 
WHERE id_produto = 5;


-- 8. Consulta relacionando as Tabelas (JOIN)
-- Usa INNER JOIN para cruzar os dados de produtos e categorias, formatando a saída conforme o exemplo.
SELECT 
    CONCAT('Produto: ', p.nome, ' | Preço: ', p.preco, ' | Categoria: ', c.nome) AS 'Informações do Produto'
FROM 
    tb_produto p
INNER JOIN 
    tb_categoria c ON p.id_categoria = c.id_categoria;