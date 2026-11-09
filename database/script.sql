-- Script gerado automaticamente por gerar-script.js
-- Nao edite o CPF ou a senha a mao: use "npm run gerar-script"

CREATE DATABASE IF NOT EXISTS oficina;
USE oficina;

CREATE TABLE usuarios (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nome VARCHAR(100) NOT NULL,
  email VARCHAR(100) NOT NULL UNIQUE,
  senha VARCHAR(255) NOT NULL
);

CREATE TABLE clientes (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nome VARCHAR(100) NOT NULL,
  cpf VARCHAR(255) NOT NULL,
  telefone VARCHAR(20),
  email VARCHAR(100)
);

CREATE TABLE veiculos (
  id INT AUTO_INCREMENT PRIMARY KEY,
  cliente_id INT NOT NULL,
  placa VARCHAR(10) NOT NULL,
  marca VARCHAR(50),
  modelo VARCHAR(50),
  ano INT,
  FOREIGN KEY (cliente_id) REFERENCES clientes(id)
);

CREATE TABLE agendamentos (
  id INT AUTO_INCREMENT PRIMARY KEY,
  veiculo_id INT NOT NULL,
  data_agendamento DATETIME NOT NULL,
  servico VARCHAR(100),
  FOREIGN KEY (veiculo_id) REFERENCES veiculos(id)
);

-- RN01: pelo menos 3 registros em cada tabela

-- Usuario de teste: admin@oficina.com / 123456
INSERT INTO usuarios (nome, email, senha) VALUES
  ('Administrador', 'admin@oficina.com', '$2a$10$3jLjOS4/vbPxxrSOttbC6uDgmSSbhOu8QS/.iW5Ik4uyUhEvi8CFq'),
  ('Carlos Mecanico', 'carlos@oficina.com', '$2a$10$3jLjOS4/vbPxxrSOttbC6uDgmSSbhOu8QS/.iW5Ik4uyUhEvi8CFq'),
  ('Fernanda Atendente', 'fernanda@oficina.com', '$2a$10$3jLjOS4/vbPxxrSOttbC6uDgmSSbhOu8QS/.iW5Ik4uyUhEvi8CFq');

-- CPF salvo criptografado [RN03]
INSERT INTO clientes (nome, cpf, telefone, email) VALUES
  ('Joao da Silva', 'b9332f3140efaf757e4d684975ef3365', '(11) 90000-1111', 'joao.silva@email.com'),
  ('Maria Souza', 'be4f639df4cd927594a5e3084b540dc1', '(11) 90000-2222', 'maria.souza@email.com'),
  ('Pedro Oliveira', '65eea67226931d6bc95e431330183923', '(11) 90000-3333', 'pedro.oliveira@email.com');

-- Cada veiculo associado a um cliente [RN09]
INSERT INTO veiculos (cliente_id, placa, marca, modelo, ano) VALUES
  (1, 'ABC1D23', 'Volkswagen', 'Gol', 2018),
  (2, 'DEF4E56', 'Fiat', 'Palio', 2015),
  (3, 'GHI7F89', 'Chevrolet', 'Onix', 2021);

-- Datas fora de ordem para provar que a ordenacao funciona [RN07]
INSERT INTO agendamentos (veiculo_id, data_agendamento, servico) VALUES
  (2, '2026-11-05 09:00:00', 'Troca de oleo'),
  (1, '2026-10-20 14:30:00', 'Alinhamento e balanceamento'),
  (3, '2026-10-28 08:00:00', 'Revisao dos freios');
