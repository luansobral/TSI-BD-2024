CREATE DATABASE BANCO;

USE BANCO;

CREATE TABLE caixa_postal(
    codigo_postal VARCHAR(8) NOT NULL,
    localidade VARCHAR(45) NOT NULL,
    PRIMARY KEY (codigo_postal)
);

CREATE TABLE pessoa(
    codigo INT NOT NULL AUTO_INCREMENT,
    cpf VARCHAR(11) NOT NULL UNIQUE,
    nome VARCHAR(60) NOT NULL,
    idade INT CHECK (idade > 0),
    codigo_postal VARCHAR(8) NOT NULL,
    PRIMARY KEY (codigo),
    FOREIGN KEY (codigo_postal) REFERENCES caixa_postal (codigo_postal)
);

CREATE TABLE telefone(
    codigo INTEGER not null,
    tel_residencial VARCHAR(15),
);