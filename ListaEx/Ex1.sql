CREATE DATABASE MERCADO_LUAN;

USE MERCADO_LUAN;

-- CRIANDO AS TABELAS
CREATE TABLE FORNECEDOR(
    cod_fornec INTEGER NOT NULL,
    nome VARCHAR(40) NOT NULL,
    fone VARCHAR(20),
    endereco VARCHAR(40),
    cidade VARCHAR(30) DEFAULT 'Birigui',
    estado CHAR(2) DEFAULT 'SP',
    PRIMARY KEY (cod_fornec)
);

CREATE TABLE PRODUTO(
    cod_produto INTEGER NOT NULL AUTO_INCREMENT,
    cod_fornecedor INTEGER NOT NULL,
    nome VARCHAR(40) NOT NULL,
    preco_unitario NUMERIC(10,2),
    qtde INTEGER,
    PRIMARY KEY(cod_produto),
    CONSTRAINT fk_fornecedor FOREIGN KEY(cod_fornecedor) REFERENCES FORNECEDOR(cod_fornec)
);

-- INSERINDO VALORES NAS TABELAS
INSERT INTO FORNECEDOR(cod_fornec, nome, fone, endereco, cidade, estado) 
VALUES (344, 'Alimentos do bem', 3345666, 'Rua Fundadores', 'São Paulo', 'SP');

INSERT INTO FORNECEDOR(cod_fornec, nome, fone, endereco, cidade, estado) 
VALUES (78, 'Comidas', 8664545, 'Av do Estados', 'Araçatuba', 'SP');

INSERT INTO FORNECEDOR(cod_fornec, nome, fone, endereco, cidade, estado) 
VALUES (952, 'Rango Quente', 1327790, 'Rua Aclimação', 'Birigui', 'SP');

INSERT INTO FORNECEDOR(cod_fornec, nome, fone, endereco, cidade, estado) 
VALUES (111, 'Quentinhas', 5644234, 'Rua Teste', 'Belo Horizonte', 'MG');

INSERT INTO PRODUTO(nome, cod_fornecedor, preco_unitario, qtde) 
VALUES ('arroz', 344, 20, 55);

INSERT INTO PRODUTO(nome, cod_fornecedor, preco_unitario, qtde) 
VALUES ('feijão', 78, 16.5, 60);

INSERT INTO PRODUTO(nome, cod_fornecedor, preco_unitario, qtde) 
VALUES ('macarrão', 78, 5, 15);

INSERT INTO PRODUTO(nome, cod_fornecedor, preco_unitario, qtde) 
VALUES ('leite', 344, 3.5, 20);

INSERT INTO PRODUTO(nome, cod_fornecedor, preco_unitario, qtde) 
VALUES ('farinha', 952, 5, 8);

-- FAZENDO AS ALTERAÇÕES
UPDATE FORNECEDOR SET nome = 'Foods' WHERE nome = 'Comidas';

ALTER TABLE FORNECEDOR ADD email VARCHAR(30);

UPDATE FORNECEDOR SET email = 'aabbcc@gmail.com' WHERE cod_fornec = 344;
UPDATE FORNECEDOR SET email = 'ddeeff@gmail.com' WHERE cod_fornec = 111;

ALTER TABLE FORNECEDOR DROP endereco;

UPDATE PRODUTO SET qtde = 15 WHERE nome = 'arroz';

-- FAZENDO AS CONSULTAS
SELECT * FROM FORNECEDOR;
SELECT nome FROM PRODUTO WHERE preco_unitario > 15;
SELECT nome, cod_fornec FROM FORNECEDORES WHERE estado = 'SP';
SELECT nome, preco_unitario * qtde AS total FROM PRODUTO;
SELECT cod_produto, nome FROM FORNECEDOR WHERE cod_fornecedor = 78;
SELECT cod_fornec, nome FROM FORNECEDOR WHERE cod_fornec < 100 AND estado = 'SP';

UPDATE PRODUTO SET nome = 'leite desnatado' WHERE nome = 'leite';
UPDATE PRODUTO SET qtde = qtde-1;

ALTER TABLE FORNECEDOR ADD pais VARCHAR(30);

INSERT INTO FORNECEDOR(pais) VALUES ('Brasil');

INSERT INTO FORNECEDOR(cod_fornec, nome, fone, endereco, cidade, estado, pais) 
VALUES (989, 'Ferbeschauschen', 9595959, 'Morro do Alemão', 'Munique', 'MO', 'Alemanha');

DELETE FROM FORNECEDOR WHERE pais = 'Brasil' AND estado != 'SP';

SELECT * FROM FORNECEDOR;