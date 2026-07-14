-- =====================================================================
-- EXERCÍCIO 1 – Gestão de Cursos e Alunos
-- =====================================================================

-- 1. Criação do Banco de Dados
-- O comando CREATE DATABASE cria o banco se ele não existir, e USE define-o como ativo.
CREATE DATABASE IF NOT EXISTS db_gestao_cursos;
USE db_gestao_cursos;


-- 2. Criação das Tabelas
-- Cria a tabela de cursos primeiro, pois a tabela de alunos dependerá dela (Chave Estrangeira).
CREATE TABLE tb_curso (
    id_curso INT AUTO_INCREMENT PRIMARY KEY, -- AUTO_INCREMENT gera os IDs automaticamente
    nome VARCHAR(100) NOT NULL,
    carga_horaria INT NOT NULL
);

-- Cria a tabela de alunos com relacionamento (FK) apontando para a tabela de cursos.
CREATE TABLE tb_aluno (
    id_aluno INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    idade INT NOT NULL,
    id_curso INT,
    -- CONSTRAINT cria a relação. Se o curso for deletado, a referência vira NULL (ON DELETE SET NULL)
    CONSTRAINT fk_aluno_curso FOREIGN KEY (id_curso) REFERENCES tb_curso(id_curso) ON DELETE SET NULL
);


-- 3. Inserção de Registros (Mínimo 10 em cada tabela)
-- Inserindo 10 cursos
INSERT INTO tb_curso (nome, carga_horaria) VALUES
('Java Completo', 400),
('Spring Boot & Docker', 120),
('SQL Avançado', 60),
('Desenvolvimento Web HTML/CSS', 80),
('JavaScript Moderno', 100),
('Estrutura de Dados em C', 90),
('TypeScript para Iniciantes', 50),
('Arquitetura de Software', 150),
('Segurança em APIs', 40),
('Linux e Redes', 80);

-- Inserindo 10 alunos (associados aos IDs de cursos de 1 a 10)
INSERT INTO tb_aluno (nome, idade, id_curso) VALUES
('Ana Souza', 20, 1),
('Bruno Lima', 17, 2),
('Carlos Eduardo', 22, 3),
('Daniela Martins', 16, 4),
('Eduardo Santos', 29, 1),
('Fernanda Costa', 18, 5),
('Gabriel Rocha', 25, 2),
('Helena Silva', 15, 6),
('Igor Gomes', 31, 7),
('Juliana Alves', 24, 8);


-- 4. Listagem de Todos os Registros
-- SELECT * seleciona todas as colunas de todas as linhas de uma tabela específica.
SELECT * FROM tb_curso;
SELECT * FROM tb_aluno;


-- 5. Filtragem de Alunos Maiores de Idade
-- O operador >= filtra apenas registros onde a coluna idade é igual ou superior a 18.
SELECT * FROM tb_aluno WHERE idade >= 18;


-- 6. Atualização de um Registro Especifico
-- O comando UPDATE altera dados existentes. O WHERE garante que apenas o aluno com id_aluno = 2 seja modificado.
UPDATE tb_aluno 
SET nome = 'Bruno Lima de Souza', idade = 18 
WHERE id_aluno = 2;


-- 7. Remoção de um Registro Especifico
-- O comando DELETE remove o registro da tabela baseado na condição lógica do WHERE.
DELETE FROM tb_aluno 
WHERE id_aluno = 10; -- Remove a aluna Juliana Alves


-- 8. Consulta Relacionando as Tabelas (INNER JOIN)
-- O INNER JOIN combina linhas de ambas as tabelas sempre que houver uma correspondência entre as chaves.
-- O comando CONCAT formata a saída conforme o exemplo solicitado.
SELECT 
    CONCAT('Aluno: ', a.nome, ' | Idade: ', a.idade, ' | Curso: ', c.nome, ' | Carga Horária: ', c.carga_horaria) AS 'Detalhes do Aluno'
FROM 
    tb_aluno a
INNER JOIN 
    tb_curso c ON a.id_curso = c.id_curso;