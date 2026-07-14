-- =====================================================================
-- EXERCÍCIO 2 – Sistema de Funcionários e Departamentos
-- =====================================================================

-- 1. Criação do Banco de Dados
-- O comando CREATE DATABASE inicializa o banco db_empresa.
CREATE DATABASE IF NOT EXISTS db_empresa;
USE db_empresa;


-- 2. Criação das Tabelas
-- Tabela de departamentos (deve ser criada primeiro por ser a chave estrangeira pai)
CREATE TABLE tb_departamento (
    id_departamento INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL
);

-- Tabela de funcionários com relacionamento (FK) referenciando os departamentos
CREATE TABLE tb_funcionario (
    id_funcionario INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    salario DECIMAL(10, 2) NOT NULL, -- DECIMAL armazena valores monetários com precisão
    id_departamento INT,
    CONSTRAINT fk_funcionario_departamento FOREIGN KEY (id_departamento) REFERENCES tb_departamento(id_departamento) ON DELETE SET NULL
);


-- 3. Inserção de Dados
-- Inserindo departamentos
INSERT INTO tb_departamento (nome) VALUES
('Tecnologia'),
('Recursos Humanos'),
('Financeiro'),
('Marketing'),
('Vendas');

-- Inserindo funcionários associados aos departamentos criados
INSERT INTO tb_funcionario (nome, salario, id_departamento) VALUES
('Carlos Oliveira', 3500.00, 1),
('Mariana Costa', 4200.00, 1),
('Roberto Silva', 2800.00, 2),
('Juliana Santos', 5100.00, 3),
('Daniel Souza', 2300.00, 4),
('Amanda Lima', 3100.00, 5),
('Felipe Dias', 6000.00, 1);


-- 4. Listar todos os Funcionários
-- Retorna todas as colunas e registros da tabela de funcionários.
SELECT * FROM tb_funcionario;


-- 5. Filtrar funcionários com salário maior que um valor definido (ex: R$ 3.000,00)
-- O operador > filtra apenas registros que cumprem a condição estipulada.
SELECT * FROM tb_funcionario WHERE salario > 3000.00;


-- 6. Atualizar o salário de um funcionário específico
-- O UPDATE altera o salário especificamente do funcionário com ID 3 (Roberto).
UPDATE tb_funcionario 
SET salario = 3200.00 
WHERE id_funcionario = 3;


-- 7. Remover um funcionário específico
-- Remove o funcionário com ID 5 (Daniel) utilizando a chave primária na condição.
DELETE FROM tb_funcionario 
WHERE id_funcionario = 5;


-- 8. Consulta relacionando as Tabelas (JOIN)
-- Usa INNER JOIN para cruzar as informações e CONCAT para estruturar a saída exatamente no padrão solicitado.
SELECT 
    CONCAT('Funcionário: ', f.nome, ' | Salário: ', CAST(f.salario AS UNSIGNED), ' | Departamento: ', d.nome) AS 'Informações do Funcionário'
FROM 
    tb_funcionario f
INNER JOIN 
    tb_departamento d ON f.id_departamento = d.id_departamento;