Para garantir a segurança de dados no novo banco de dados, é essencial seguir os pilares fundamentais da segurança da informação. Esses pilares são:

    Confidencialidade: Garantir que os dados sejam acessíveis apenas por pessoas autorizadas. Isso pode ser alcançado através de criptografia e controle de acesso rigoroso.
    Integridade: Assegurar que os dados não sejam alterados ou corrompidos de maneira não autorizada. Isso envolve o uso de checksums, hashes e controles de versão.
    Disponibilidade: Garantir que os dados estejam disponíveis para os usuários autorizados sempre que necessário. Isso pode ser feito através de backups regulares, redundância e planejamento de recuperação de desastres1.

Além desses três pilares principais, outros aspectos importantes incluem:

    Autenticidade: Verificar a identidade dos usuários e garantir que os dados sejam genuínos.
    Irretratabilidade: Garantir que uma transação ou comunicação não possa ser negada posteriormente.
    Conformidade: Assegurar que o sistema esteja em conformidade com as leis e regulamentos aplicáveis, como a Lei Geral de Proteção de Dados (LGPD) no Brasil23.



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
