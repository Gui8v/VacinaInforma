-- --------------------------------------------------------
-- Servidor:                     127.0.0.1
-- Versão do servidor:           8.0.25 - MySQL Community Server - GPL
-- OS do Servidor:               Win64
-- HeidiSQL Versão:              11.2.0.6213
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Copiando estrutura do banco de dados para bdvacinf
DROP DATABASE IF EXISTS `bdvacinf`;
CREATE DATABASE IF NOT EXISTS `bdvacinf` /*!40100 DEFAULT CHARACTER SET utf8 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `bdvacinf`;

-- Copiando estrutura para tabela bdvacinf.administrador
DROP TABLE IF EXISTS `administrador`;
CREATE TABLE IF NOT EXISTS `administrador` (
  `adm_id` int NOT NULL AUTO_INCREMENT,
  `adm_nome` varchar(45) NOT NULL,
  `adm_email` varchar(45) NOT NULL,
  `adm_senha` varchar(45) NOT NULL,
  `adm_permicao` enum('S','N') DEFAULT NULL,
  PRIMARY KEY (`adm_id`),
  UNIQUE KEY `adm_id_UNIQUE` (`adm_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;

-- Copiando dados para a tabela bdvacinf.administrador: ~1 rows (aproximadamente)
/*!40000 ALTER TABLE `administrador` DISABLE KEYS */;
INSERT INTO `administrador` (`adm_id`, `adm_nome`, `adm_email`, `adm_senha`, `adm_permicao`) VALUES
	(1, 'ADM', 'adm@a.com', 'adm123', 'S');
/*!40000 ALTER TABLE `administrador` ENABLE KEYS */;

-- Copiando estrutura para tabela bdvacinf.empresa
DROP TABLE IF EXISTS `empresa`;
CREATE TABLE IF NOT EXISTS `empresa` (
  `emp_id` int NOT NULL AUTO_INCREMENT,
  `emp_nome` varchar(45) NOT NULL,
  `emp_local` varchar(45) NOT NULL,
  `emp_qtdPfizer` int DEFAULT NULL,
  `emp_qtdAstrazeneca` int DEFAULT NULL,
  `est_id` int NOT NULL,
  PRIMARY KEY (`emp_id`),
  UNIQUE KEY `emp_id_UNIQUE` (`emp_id`),
  KEY `fk_Empresa_Estados_idx` (`est_id`),
  CONSTRAINT `fk_Empresa_Estados` FOREIGN KEY (`est_id`) REFERENCES `estado` (`est_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Copiando dados para a tabela bdvacinf.empresa: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `empresa` DISABLE KEYS */;
/*!40000 ALTER TABLE `empresa` ENABLE KEYS */;

-- Copiando estrutura para tabela bdvacinf.estado
DROP TABLE IF EXISTS `estado`;
CREATE TABLE IF NOT EXISTS `estado` (
  `est_id` int NOT NULL AUTO_INCREMENT,
  `est_nome` varchar(45) NOT NULL,
  `est_qtdHabitantes` int DEFAULT NULL,
  `est_sigla` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`est_id`),
  UNIQUE KEY `est_id_UNIQUE` (`est_id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb3;

-- Copiando dados para a tabela bdvacinf.estado: ~28 rows (aproximadamente)
/*!40000 ALTER TABLE `estado` DISABLE KEYS */;
INSERT INTO `estado` (`est_id`, `est_nome`, `est_qtdHabitantes`, `est_sigla`) VALUES
	(1, 'Acre', 906876, 'AC'),
	(2, 'Alagoas', 3365351, 'AL'),
	(3, 'Amapá', 877613, 'AP'),
	(4, 'Amazonas', 4269995, 'AM'),
	(5, 'Bahia', 14985284, 'BA'),
	(6, 'Ceará', 9240580, 'CE'),
	(7, 'Distrito Federal', 3094325, 'DF'),
	(8, 'Espírito Santo', 4108508, 'ES'),
	(9, 'Goiás', 7206589, 'GO'),
	(10, 'Maranhão', 7153262, 'MA'),
	(11, 'Mato Grosso', 3567234, 'MT'),
	(12, 'Mato Grosso do Sul', 2839188, 'MS'),
	(13, 'Minas Gerais', 2141923, 'MG'),
	(14, 'Pará', 8777124, 'PA'),
	(15, 'Paraíba', 4059905, 'PB'),
	(16, 'Paraná', 11597484, 'PR'),
	(17, 'Pernambuco', 9674793, 'PE'),
	(18, 'Piauí', 3289290, 'PI'),
	(19, 'Rio de Janeiro', 17463349, 'RJ'),
	(20, 'Rio Grande do Norte', 3560903, 'RN'),
	(21, 'Rio Grande do Sul', 11466630, 'RS'),
	(22, 'Rondônia', 1815278, 'RO'),
	(23, 'Roraima', 652713, 'RR'),
	(24, 'Santa Catarina', 7338473, ' SC'),
	(25, 'São Paulo', 46649132, 'SP'),
	(26, 'Sergipe', 2338474, 'SE'),
	(27, 'Tocantins', 1607363, 'TO'),
	(28, 'Fictício', 100, 'FC');
/*!40000 ALTER TABLE `estado` ENABLE KEYS */;

-- Copiando estrutura para tabela bdvacinf.vacinados
DROP TABLE IF EXISTS `vacinados`;
CREATE TABLE IF NOT EXISTS `vacinados` (
  `vac_id` int NOT NULL AUTO_INCREMENT,
  `vac_nome` varchar(45) NOT NULL,
  `vac_cpf` varchar(45) NOT NULL,
  `vac_idade` int NOT NULL,
  `vac_dataregistro` date DEFAULT NULL,
  `vac_qtdDose` int DEFAULT NULL,
  `est_id` int NOT NULL,
  `van_id` int NOT NULL,
  PRIMARY KEY (`vac_id`),
  KEY `fk_Vacinado_Estados1_idx` (`est_id`),
  KEY `fk_Vacinados_Vacinas1_idx` (`van_id`),
  CONSTRAINT `fk_Vacinado_Estados1` FOREIGN KEY (`est_id`) REFERENCES `estado` (`est_id`),
  CONSTRAINT `fk_Vacinados_Vacinas1` FOREIGN KEY (`van_id`) REFERENCES `vacinas` (`van_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Copiando dados para a tabela bdvacinf.vacinados: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `vacinados` DISABLE KEYS */;
/*!40000 ALTER TABLE `vacinados` ENABLE KEYS */;

-- Copiando estrutura para tabela bdvacinf.vacinas
DROP TABLE IF EXISTS `vacinas`;
CREATE TABLE IF NOT EXISTS `vacinas` (
  `van_id` int NOT NULL AUTO_INCREMENT,
  `van_nome` varchar(45) NOT NULL,
  PRIMARY KEY (`van_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;

-- Copiando dados para a tabela bdvacinf.vacinas: ~2 rows (aproximadamente)
/*!40000 ALTER TABLE `vacinas` DISABLE KEYS */;
INSERT INTO `vacinas` (`van_id`, `van_nome`) VALUES
	(1, 'Pfizer'),
	(2, 'Astrazeneca');
/*!40000 ALTER TABLE `vacinas` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
