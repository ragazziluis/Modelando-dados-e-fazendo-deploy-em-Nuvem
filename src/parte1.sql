-- Tabela para Pacientes
CREATE TABLE Pacientes (
    PacienteID INT PRIMARY KEY,
    Nome VARCHAR(255),
    DataNascimento DATE,
    Sexo CHAR(1),
    Endereco VARCHAR(255)
);

-- Tabela para Veículos Médico
CREATE TABLE Veiculos (
    VeiculoID INT PRIMARY KEY,
    Placa VARCHAR(15),
    Modelo VARCHAR(50),
    Capacidade INT
);

-- Tabela para Unidades Saúde
CREATE TABLE UnidadesDeSaude (
    UnidadeID INT PRIMARY KEY,
    Nome VARCHAR(100),
    Tipo VARCHAR(50),
    Endereco VARCHAR(255)
);

-- Tabela para Produtos Médicos
CREATE TABLE ProdutosMedicos (
    ProdutoID INT PRIMARY KEY,
    Nome VARCHAR(100),
    Tipo VARCHAR(50),
    EstoqueAtual INT
);

-- Tabela para Rotas de Transporte
CREATE TABLE Rotas (
    RotaID INT PRIMARY KEY,
    OrigemUnidadeID INT,
    DestinoUnidadeID INT,
    DistanciaKm DECIMAL(10, 2),
    PRIMARY KEY (OrigemUnidadeID, DestinoUnidadeID),
    FOREIGN KEY (OrigemUnidadeID) REFERENCES UnidadesDeSaude(UnidadeID),
    FOREIGN KEY (DestinoUnidadeID) REFERENCES UnidadesDeSaude(UnidadeID)
);

-- Tabela para Registros de Transporte de Pacientes
CREATE TABLE Transportes (
    TransporteID INT PRIMARY KEY,
    PacienteID INT,
    VeiculoID INT,
    Data DATE,
    RotaID INT,
    PRIMARY KEY (PacienteID, Data),
    FOREIGN KEY (PacienteID) REFERENCES Pacientes(PacienteID),
    FOREIGN KEY (VeiculoID) REFERENCES Veiculos(VeiculoID),
    FOREIGN KEY (RotaID) REFERENCES Rotas(RotaID)
);
