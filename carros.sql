-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 15-Out-2020 às 00:43
-- Versão do servidor: 10.4.14-MariaDB
-- versão do PHP: 7.4.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `carros`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `marca`
--

CREATE TABLE `marca` (
  `codigo` int(11) NOT NULL,
  `nome` varchar(200) NOT NULL,
  `pais` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `marca`
--

INSERT INTO `marca` (`codigo`, `nome`, `pais`) VALUES
(1, 'Volkswagen', 'Alemanha'),
(2, 'Ford', 'EUA'),
(3, 'Fiat', 'Itália'),
(4, 'GM', 'EUA');

-- --------------------------------------------------------

--
-- Estrutura da tabela `modelo`
--

CREATE TABLE `modelo` (
  `codigo` int(11) NOT NULL,
  `nome` varchar(200) NOT NULL,
  `categoria` varchar(200) NOT NULL,
  `cor` varchar(200) NOT NULL,
  `codigo_marca` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `modelo`
--

INSERT INTO `modelo` (`codigo`, `nome`, `categoria`, `cor`, `codigo_marca`) VALUES
(1, 'Gol', 'Hatch', 'preto', 1),
(2, 'Palio', 'Hatch', 'vermelho', 3),
(3, 'Ecosport', 'SUV', 'azul', 2),
(4, 'Fox', 'Família', 'cinza', 1);

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `marca`
--
ALTER TABLE `marca`
  ADD PRIMARY KEY (`codigo`);

--
-- Índices para tabela `modelo`
--
ALTER TABLE `modelo`
  ADD PRIMARY KEY (`codigo`),
  ADD KEY `FK_marca` (`codigo_marca`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `marca`
--
ALTER TABLE `marca`
  MODIFY `codigo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `modelo`
--
ALTER TABLE `modelo`
  MODIFY `codigo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `modelo`
--
ALTER TABLE `modelo`
  ADD CONSTRAINT `FK_marca` FOREIGN KEY (`codigo_marca`) REFERENCES `marca` (`codigo`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

Atividade 2 
a)

	CREATE DATABASE carros;
	USE carros;
	CREATE TABLE marca (
		codigo INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
		nome VARCHAR (200) NOT NULL,
		pais VARCHAR (200) NOT NULL
	);    
	CREATE TABLE modelo (
		codigo INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
		nome VARCHAR (200) NOT NULL,
		categoria VARCHAR (200) NOT NULL,
		cor VARCHAR (200) NOT NULL,
		codigo_marca INT NOT NULL,
		CONSTRAINT FK_marca FOREIGN KEY (codigo_marca) REFERENCES marca (codigo)
	);    


b)	INSERT INTO marca (codigo, nome, pais) VALUES
		('Volkswagen', 'Alemanha'),
		('Ford', 'EUA'),
		('Fiat', 'Itália'),
		('GM', 'EUA');

	INSERT INTO modelo (nome, categoria, cor, codigo_marca) VALUES
		('Gol', 'Hatch', 'preto', '1'),
		('Palio', 'Hatch', 'vermelho', '3'),
		('Ecosport', 'SUV', 'azul', '2'),
		('Fox', 'Família', 'cinza', '1');



c) UPDATE modelo SET cor = 'cinza' WHERE codigo = 4;


d) SELECT a.nome, a.pais, COUNT(m.codigo_marca) AS qtd_carros 
	FROM modelo AS m
	INNER JOIN marca AS a 
	ON m.codigo_marca = a.codigo
	GROUP BY a.nome;


e) DELETE FROM marca WHERE codigo = 4;