-- Vinicius da Silva Santana 

CREATE DATABASE Oficina;

-- Seleciona o banco de dados "Oficina" para utilização
USE Oficina;

-- Tabela Cliente
CREATE TABLE Cliente (
    CPF VARCHAR(17) PRIMARY KEY,
    Nome VARCHAR(100) NOT NULL
);

-- Tabela Endereco do Cliente (Tabela Composta)
CREATE TABLE Endereco (
    Cidade VARCHAR(100) NOT NULL,
    Estado CHAR(2) NOT NULL,
    CEP VARCHAR(15) NOT NULL,
    ID_Cliente VARCHAR(17) NOT NULL, -- Chave estrangeira para a tabela Cliente
    FOREIGN KEY (ID_Cliente) REFERENCES Cliente(CPF)
);

-- Tabela Telefone do Cliente (Tabela Multivalorada)
CREATE TABLE Telefone (
    CPF_Cliente VARCHAR(17) NOT NULL, -- Chave estrangeira para Cliente
    TipoTelefone VARCHAR(20) NOT NULL, -- Por exemplo, "Celular", "Residencial", etc.
    Numero VARCHAR(20) NOT NULL,
    FOREIGN KEY (CPF_Cliente) REFERENCES Cliente(CPF)
);

-- Tabela Veiculo
CREATE TABLE Veiculo (
    Renavan VARCHAR(17) PRIMARY KEY,
    Chassi VARCHAR(17) NOT NULL,
    Modelo VARCHAR(50) NOT NULL,
    Cor VARCHAR(20) NOT NULL,
    ID_CPF VARCHAR(11) NOT NULL, -- Chave estrangeira para a tabela Cliente
    FOREIGN KEY (ID_CPF) REFERENCES Cliente(CPF)
);

-- Tabela Relato
CREATE TABLE Relato (
    ID INT PRIMARY KEY,
    Problema VARCHAR(500) NOT NULL,
    Dataa DATE NOT NULL,
    ID_Renavan VARCHAR(17) NOT NULL, -- Chave estrangeira para a tabela Veiculo
    FOREIGN KEY (ID_Renavan) REFERENCES Veiculo(Renavan)
);

-- Tabela Orcamento
CREATE TABLE Orcamento (
    ID INT PRIMARY KEY,
    Valor DECIMAL(10, 2) NOT NULL,
    Situacao VARCHAR(30) NOT NULL,
    PrevisaoEntrega DATE NOT NULL,
    FormaPagamento VARCHAR(30) NOT NULL,
    Dataa DATE NOT NULL,
    ID_Renavan VARCHAR(17) NOT NULL, -- Chave estrangeira para a tabela Veiculo
    FOREIGN KEY (ID_Renavan) REFERENCES Veiculo(Renavan)
);

-- Tabela Servico
CREATE TABLE Servico (
    ID INT PRIMARY KEY,
    Descricao VARCHAR(500) NOT NULL,
    TempoRealizacao VARCHAR NOT NULL,
    Custo DECIMAL(10, 2) NOT NULL
);

-- Tabela Produto
CREATE TABLE Produto (
    ID INT PRIMARY KEY,
    Custo DECIMAL(10, 2) NOT NULL,
    Descricao VARCHAR(500) NOT NULL
);

-- Tabela ItemServico
CREATE TABLE ItemServico (
    Situacao VARCHAR(20) NOT NULL,
    ID_Orcamento INT NOT NULL, -- Chave estrangeira para a tabela Orcamento
    ID_Servico INT NOT NULL, -- Chave estrangeira para a tabela Servico
    FOREIGN KEY (ID_Orcamento) REFERENCES Orcamento(ID),
    FOREIGN KEY (ID_Servico) REFERENCES Servico(ID)
);

-- Tabela ItemProduto
CREATE TABLE ItemProduto (
    Situacao VARCHAR(20) NOT NULL,
    Custo DECIMAL(10, 2) NOT NULL,
    Quantidade INT NOT NULL,
    ID_Orcamento INT NOT NULL, -- Chave estrangeira para a tabela Orcamento
    ID_Produto INT NOT NULL, -- Chave estrangeira para a tabela Produto
    FOREIGN KEY (ID_Orcamento) REFERENCES Orcamento(ID),
    FOREIGN KEY (ID_Produto) REFERENCES Produto(ID)
);
