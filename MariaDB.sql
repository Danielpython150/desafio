-- Criação do banco de dados
CREATE DATABASE EmpresaVendas;

-- Selecionar o banco de dados
USE EmpresaVendas;

-- Criação da tabela de clientes
CREATE TABLE Clientes (
    ClienteID INT PRIMARY KEY AUTO_INCREMENT,
    Nome VARCHAR(100) NOT NULL,
    Email VARCHAR(100) NOT NULL UNIQUE,
    Telefone VARCHAR(15),
    Endereco VARCHAR(255),
    DataCadastro TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Criação da tabela de produtos
CREATE TABLE Produtos (
    ProdutoID INT PRIMARY KEY AUTO_INCREMENT,
    Nome VARCHAR(100) NOT NULL,
    Descricao TEXT,
    Preco DECIMAL(10, 2) NOT NULL,
    Estoque INT NOT NULL
);

-- Criação da tabela de vendas
CREATE TABLE Vendas (
    VendaID INT PRIMARY KEY AUTO_INCREMENT,
    ClienteID INT,
    DataVenda TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    ValorTotal DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (ClienteID) REFERENCES Clientes(ClienteID)
);

-- Criação da tabela de itens de venda
CREATE TABLE ItensVenda (
    ItemID INT PRIMARY KEY AUTO_INCREMENT,
    VendaID INT,
    ProdutoID INT,
    Quantidade INT NOT NULL,
    PrecoUnitario DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (VendaID) REFERENCES Vendas(VendaID),
    FOREIGN KEY (ProdutoID) REFERENCES Produtos(ProdutoID)
);

-- Exemplo de inserção de dados
INSERT INTO Clientes (Nome, Email, Telefone, Endereco) VALUES ('João Silva', 'joao.silva@example.com', '31999999999', 'Rua A, 123');
INSERT INTO Produtos (Nome, Descricao, Preco, Estoque) VALUES ('Produto A', 'Descrição do Produto A', 50.00, 100);
INSERT INTO Vendas (ClienteID, ValorTotal) VALUES (1, 100.00);
INSERT INTO ItensVenda (VendaID, ProdutoID, Quantidade, PrecoUnitario) VALUES (1, 1, 2, 50.00);
