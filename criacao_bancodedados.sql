DROP DATABASE IF EXISTS sistema_ead_universidade;

/*criação do banco de dados*/
CREATE DATABASE sistema_ead_universidade;
USE sistema_ead_universidade;

/*criação de tabelas*/
CREATE TABLE cadastro_curso (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(45) NOT NULL
);

CREATE TABLE cadastro_professor (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(45) NOT NULL,
    curso_id INT NOT NULL,
    CONSTRAINT fk_professor_curso
        FOREIGN KEY (curso_id)
        REFERENCES cadastro_curso(id)
);

CREATE TABLE cadastro_turma (
    id INT AUTO_INCREMENT PRIMARY KEY,
    codigo_turma VARCHAR(3) NOT NULL,
    curso_id INT NOT NULL,
    CONSTRAINT fk_turma_curso
        FOREIGN KEY (curso_id)
        REFERENCES cadastro_curso(id)
);

CREATE TABLE cadastro_material (
    id INT AUTO_INCREMENT PRIMARY KEY,
    conteudo VARCHAR(45) NOT NULL,
    curso_id INT NOT NULL,
    CONSTRAINT fk_material_curso
        FOREIGN KEY (curso_id)
        REFERENCES cadastro_curso(id)
);

CREATE TABLE cadastro_matricula (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(45) NOT NULL,
    turma_id INT NOT NULL,
    data_cadastro DATE NOT NULL,
    CONSTRAINT fk_matricula_turma
        FOREIGN KEY (turma_id)
        REFERENCES cadastro_turma(id)
);

/*inserção de dados*/

INSERT INTO cadastro_curso (nome)
VALUES
('Técnico em Desenvolvimento de Sistemas'),
('Engenharia da Computação'),
('Ciência de Dados'),
('Tecnologia da Informação'),
('IA e Machine Learning');

INSERT INTO cadastro_professor (nome, curso_id)
VALUES
('Alfredo Tavares',1),
('Bruno Machado',2),
('Maria César',3),
('Marcos Rocha',4),
('Luiza Paixão',5);

INSERT INTO cadastro_turma (codigo_turma, curso_id)
VALUES
('001',1),
('002',2),
('003',3),
('004',4),
('005',5);

INSERT INTO cadastro_material (conteudo, curso_id)
VALUES
('TDS material',1),
('EdC material',2),
('CeD material',3),
('TI material',4),
('IA&M',5);

INSERT INTO cadastro_matricula (nome, turma_id, data_cadastro)
VALUES
('Pedro Santos', 1, '2025-05-12'),
('Marisa Peixoto',2,'2025-06-8'),
('Edsón Pereira',3,'2025-04-25'),
('Michael Gonçalves',4,'2025-04-2'),
('Eliane Siqueira',5,'2025-05-14');

/*selecionando todos os dados*/

SELECT * FROM cadastro_curso;
SELECT * FROM cadastro_professor;
SELECT * FROM cadastro_turma;
SELECT * FROM cadastro_material;
SELECT * FROM cadastro_matricula;

/*selecionando dados específicos*/
SELECT * FROM cadastro_curso
WHERE nome = 'Engenharia da Computação';

SELECT * FROM cadastro_professor
WHERE curso_id = 5;

SELECT * FROM cadastro_turma
WHERE codigo_turma = 2;

SELECT * FROM cadastro_material
WHERE conteudo = 'TDS material';

SELECT * FROM cadastro_matricula
WHERE turma_id = 4;

/*atualizando dados*/

UPDATE cadastro_curso
SET nome = 'Tecnologia da Informação e Comunicação'
WHERE id = 2;

UPDATE cadastro_professor
SET curso_id = 1
WHERE id = 3;

UPDATE cadastro_turma
SET curso_id = 5
WHERE id = 1;

UPDATE cadastro_material
SET conteudo = 'TIC material atualizado'
WHERE id = 4;

UPDATE cadastro_matricula
SET turma_id = 4
WHERE id = 2;

/*deletando de dados*/

DELETE FROM cadastro_matricula
WHERE id = 2;

DELETE FROM cadastro_material
WHERE id = 2;

DELETE FROM cadastro_turma
WHERE id = 2;

DELETE FROM cadastro_professor
WHERE id = 2;

DELETE FROM cadastro_curso
WHERE id = 2;









