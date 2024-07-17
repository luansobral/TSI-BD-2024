CREATE DATABASE clube;

USE clube;

CREATE TABLE socio(
    codigo INT NOT NULL AUTO_INCREMENT, 
    nome VARCHAR(60) NOT NULL, 
    endereco VARCHAR(50),
    cidade VARCHAR(30) DEFAULT 'BIRIGUI',
    estado VARCHAR(30) DEFAULT 'SP',
    cep VARCHAR(9),
    fone VARCHAR(13),
    data DATE NOT NULL,
    PRIMARY KEY (codigo)
);

CREATE TABLE dependente(
    codigo_socio INT NOT NULL,
    sequencial INT NOT NULL,
    nome VARCHAR(60) NOT NULL,
    parentesco VARCHAR(15),
    data_nasc DATE
    PRIMARY KEY (sequencial),
    FOREIGN KEY (codigo_socio) REFERENCES socio (codigo_socio)
);