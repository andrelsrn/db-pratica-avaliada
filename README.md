# Exercícios Práticos de Banco de Dados (MySQL) 🗄️

Este repositório contém as soluções desenvolvidas para as atividades práticas de modelagem e manipulação de banco de dados relacional utilizando o **MySQL**.

## 🚀 Tecnologias Utilizadas
* **Banco de Dados:** MySQL
* **Ferramenta de Administração (SGBD):** DBeaver / MySQL Workbench
* **Linguagem:** SQL

## 📂 Estrutura do Repositório
O projeto está organizado da seguinte forma:
* `/scripts` (ou a raiz do projeto): Arquivos `.sql` com os comandos de DDL e DML de cada exercício.
* `/prints`: Capturas de tela que comprovam a execução bem-sucedida das consultas e relacionamentos.

---

## 📝 Exercícios Desenvolvidos

### Exercício 1: Gestão de Cursos e Alunos
* **Banco de Dados:** `db_gestao_cursos`
* **Principais Conceitos:** Criação de tabelas com chaves estrangeiras (`FK`), relacionamento `1:N` entre Alunos e Cursos, comandos de filtros (`WHERE`), atualizações (`UPDATE`), deleções (`DELETE`) e junção de dados (`INNER JOIN`).

### Exercício 2: Sistema de Funcionários e Departamentos
* **Banco de Dados:** `db_empresa`
* **Principais Conceitos:** Criação de tabelas, uso do tipo de dado `DECIMAL` para salários, filtros condicionais de valores numéricos, atualização e deleção pontual através de chaves primárias (`PK`), e consulta de relacionamento formatada.

### Exercício 3: Sistema de Produtos e Categorias
* **Banco de Dados:** `db_loja`
* **Principais Conceitos:** Modelagem de e-commerce básico conectando produtos às suas categorias de mercado, formatação de preços no retorno das consultas (`CONCAT`) e verificação de integridade referencial.

---

## 🛠️ Como Executar os Scripts
1. Instale um SGBD de sua preferência (como o MySQL Workbench ou DBeaver).
2. Conecte-se ao seu servidor local do MySQL.
3. Abra e execute os arquivos `.sql` na ordem indicada.
4. Os bancos de dados e tabelas serão gerados automaticamente junto com a carga inicial de dados (massa de testes).
