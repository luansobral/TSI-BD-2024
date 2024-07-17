-- CRIAR O BANCO DE DADOS
CREATE DATABASE IFSP;

-- SELECIONAR O BANCO DE DADOS
USE IFSP;

-- CRIAR TABELA CIDADE
CREATE TABLE CIDADE(id INT NOT NULL AUTO_INCREMENT, nome VARCHAR(45) NOT NULL, estado CHAR(2) NOT NULL, PRIMARY KEY (id));

-- CRIAR TABELA CLIENTE
CREATE TABLE CLIENTE(
    id INT NOT NULL AUTO_INCREMENT, 
    nome VARCHAR(45) NOT NULL, 
    email VARCHAR(55) NOT NULL,
    endereco VARCHAR(45),
    bairro VARCHAR(45),
    numero INT,
    data_nasc DATETIME,
    PRIMARY KEY (id),
    CONSTRAINT fk_cliente_cidade FOREIGN KEY(id_cidade) REFERENCES CIDADE(id)
    );

-- INSERIR DADOR NA TABELA CIDADE
INSERT INTO CIDADE(id, nome, estado) VALUES (1, 'Birigui', 'SP');
INSERT INTO CIDADE(id, nome, estado) VALUES (2, 'Aracatuba', 'SP');
INSERT INTO CIDADE(nome, estado) VALUES ('Guararapes', 'SP'); -- Nâo precisa falar o valor do id quando é auto_increment
INSERT INTO CIDADE(nome, estado) VALUES ('Rio de Janeiro', 'RJ');

-- MOSTRA REGISTROS NA TABELA CIDADE
SELECT * FROM CIDADE;

-- INSERIR DADOS NA TABELA CLIENTE
INSERT INTO CLIENTE(nome, email, id_cidade, endereco, bairro, numero, data_nasc) VALUES ('Luan Sobral', 'luan@mail.com', 1, 'Rua Bonita', 'Jandaia 6', 180, '2004/08/16');

INSERT INTO CLIENTE(nome, email, id_cidade, endereco, bairro, numero, data_nasc) VALUES ('Dono da blaze', 'blaze@mail.com', 4,
'Rua Estanha', 'Belford Roxo', 10, '1804/08/16');

-- MOSTRA REGISTROS NA TABELA CLIENTE
SELECT * FROM CLIENTE;