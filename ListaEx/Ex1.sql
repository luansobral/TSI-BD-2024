CREATE DATABASE MERCADO_LUAN;

USE MERCADO_LUAN;

CREATE TABLE FORNECEDOR(
    cod_fornec INTEGER NOT NULL,
    nome VARCHAR(40) NOT NULL,
    fone VARCHAR(20),
    endereco VARCHAR(40),
    cidade VARCHAR(30) DEFAULT 'Birigui',
    estado VARCHAR(2) DEFAULT 'SP',
    PRIMARY KEY (cod_fornec)
);

CREATE TABLE PRODUTO(
    cod_produto INTEGER NOT NULL AUTO_INCREMENT,
    nome VARCHAR(40) NOT NULL,
    CONSTRAINT fk_fornec_produto FOREIGN KEY(cod_fornec) REFERENCES CIDADE(cod_fornec),
    preco_unitario
);