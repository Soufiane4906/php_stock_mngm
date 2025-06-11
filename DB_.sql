-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               8.0.30 - MySQL Community Server - GPL
-- Server OS:                    Win64
-- HeidiSQL Version:             12.6.0.6765
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for projet_gestion_stock
DROP DATABASE IF EXISTS `projet_gestion_stock`;
CREATE DATABASE IF NOT EXISTS `projet_gestion_stock` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `projet_gestion_stock`;

-- Dumping structure for table projet_gestion_stock.administrateurs
DROP TABLE IF EXISTS `administrateurs`;
CREATE TABLE IF NOT EXISTS `administrateurs` (
  `idAdmin` int NOT NULL AUTO_INCREMENT,
  `login` varchar(10) NOT NULL,
  `password` varchar(8) NOT NULL,
  PRIMARY KEY (`idAdmin`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- Dumping data for table projet_gestion_stock.administrateurs: ~1 rows (approximately)
INSERT INTO `administrateurs` (`idAdmin`, `login`, `password`) VALUES
	(1, 'admin', 'admin');

-- Dumping structure for table projet_gestion_stock.approvisionnement
DROP TABLE IF EXISTS `approvisionnement`;
CREATE TABLE IF NOT EXISTS `approvisionnement` (
  `numeroAppro` int NOT NULL AUTO_INCREMENT,
  `date` datetime NOT NULL,
  `idFournisseur` int DEFAULT NULL,
  PRIMARY KEY (`numeroAppro`),
  KEY `fk20` (`idFournisseur`),
  CONSTRAINT `fk20` FOREIGN KEY (`idFournisseur`) REFERENCES `fournisseur` (`idFournisseur`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

-- Dumping data for table projet_gestion_stock.approvisionnement: ~4 rows (approximately)
INSERT INTO `approvisionnement` (`numeroAppro`, `date`, `idFournisseur`) VALUES
	(1, '2022-12-23 03:03:00', 12),
	(2, '2022-12-23 03:15:00', 12),
	(3, '2022-12-23 03:15:00', 12),
	(4, '2022-12-23 03:15:00', 12);

-- Dumping structure for table projet_gestion_stock.categorie
DROP TABLE IF EXISTS `categorie`;
CREATE TABLE IF NOT EXISTS `categorie` (
  `idCategorie` varchar(10) NOT NULL,
  `nomCategorie` varchar(50) NOT NULL,
  PRIMARY KEY (`idCategorie`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table projet_gestion_stock.categorie: ~2 rows (approximately)
INSERT INTO `categorie` (`idCategorie`, `nomCategorie`) VALUES
	('DE1', 'Dell Electro'),
	('TV1', 'LG10221');

-- Dumping structure for table projet_gestion_stock.client
DROP TABLE IF EXISTS `client`;
CREATE TABLE IF NOT EXISTS `client` (
  `idClient` int NOT NULL AUTO_INCREMENT,
  `nom` varchar(45) NOT NULL,
  `adresse` varchar(45) NOT NULL,
  `telephone` int NOT NULL,
  `email` varchar(50) NOT NULL,
  PRIMARY KEY (`idClient`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;

-- Dumping data for table projet_gestion_stock.client: ~10 rows (approximately)
INSERT INTO `client` (`idClient`, `nom`, `adresse`, `telephone`, `email`) VALUES
	(1, 'Wissal', 'mohammed', 627594239, 'test@tgogod'),
	(12, 'Mohammed JADIR', 'rue 20 numero 9', 66666666, 'test@test'),
	(13, 'Abdelmoughit ELOUMARI', 'hay eljadid, 162', 627585858, 'moughit@gmail.com'),
	(14, 'Abdelmoughit ELOUMARI', 'hay eljadid, 162', 627585858, 'moughit@gmail.com'),
	(15, 'Abdelmoughit ELOUMARI', 'hay eljadid, 162', 627585858, 'moughit@gmail.com'),
	(16, 'oussama idrissi', 'Salmia 2, Rue 18, Imm 52, Apprt 5,', 627594239, 'oidrissi44@gmail.com'),
	(17, 'oussama idrissi', 'Salmia 2, Rue 18, Imm 52, Apprt 5,', 627594239, 'oidrissi44@gmail.com'),
	(18, 'oussama idrissi', 'Salmia 2, Rue 18, Imm 52, Apprt 5,', 627594239, 'oidrissi44@gmail.com'),
	(19, 'oussama idrissi', 'Salmia 2, Rue 18, Imm 52, Apprt 5,', 627594239, 'oidrissi44@gmail.com'),
	(20, 'hala', 'hala', 2, 'hala@hala');

-- Dumping structure for table projet_gestion_stock.commande
DROP TABLE IF EXISTS `commande`;
CREATE TABLE IF NOT EXISTS `commande` (
  `numeroCmd` int NOT NULL AUTO_INCREMENT,
  `date` datetime NOT NULL,
  `idClient` int DEFAULT NULL,
  PRIMARY KEY (`numeroCmd`),
  KEY `fk1_idx` (`idClient`),
  CONSTRAINT `fk1` FOREIGN KEY (`idClient`) REFERENCES `client` (`idClient`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=latin1 COMMENT='			';

-- Dumping data for table projet_gestion_stock.commande: ~62 rows (approximately)
INSERT INTO `commande` (`numeroCmd`, `date`, `idClient`) VALUES
	(1, '2002-04-21 00:00:00', 1),
	(2, '2022-12-14 00:41:32', 1),
	(3, '2022-12-14 00:43:07', 1),
	(4, '2022-12-14 00:43:22', 1),
	(5, '2022-12-14 00:43:22', 1),
	(6, '2022-12-14 00:46:32', 1),
	(7, '2022-12-14 01:10:56', 1),
	(8, '2022-12-14 01:11:09', 1),
	(9, '2022-12-14 01:11:24', 1),
	(10, '2022-12-18 14:33:43', 1),
	(11, '2022-12-18 14:41:15', 1),
	(12, '2022-12-18 14:46:07', 1),
	(13, '2022-12-18 14:47:16', 1),
	(14, '2022-12-18 14:48:15', 1),
	(15, '2022-12-18 15:59:33', 1),
	(16, '2022-10-18 22:32:08', 1),
	(17, '2022-12-18 22:33:11', 1),
	(18, '2022-12-18 22:33:45', 1),
	(19, '2022-12-18 22:34:50', 1),
	(20, '2022-12-18 22:34:50', 1),
	(21, '2022-12-18 22:34:50', 1),
	(22, '2022-12-18 22:34:50', 1),
	(23, '2022-12-18 22:38:22', 1),
	(24, '2022-12-18 22:38:22', 1),
	(25, '2022-12-18 22:40:02', 1),
	(26, '2022-03-18 22:41:26', 1),
	(27, '2022-12-22 01:11:54', 1),
	(28, '2022-12-22 01:12:15', 1),
	(29, '2022-12-22 01:13:28', 1),
	(30, '2022-11-22 01:14:59', 1),
	(31, '2022-12-22 01:15:23', 1),
	(32, '2022-12-22 01:17:52', 1),
	(33, '2022-12-22 01:24:29', 1),
	(34, '2022-12-22 03:57:39', 1),
	(35, '2022-12-22 17:04:29', 1),
	(36, '2022-12-22 17:05:27', 1),
	(37, '2022-12-22 17:05:36', 1),
	(38, '2022-12-22 17:25:15', 1),
	(39, '2022-12-22 17:25:43', 1),
	(40, '2022-12-22 17:27:33', 1),
	(41, '2022-12-22 17:27:36', 1),
	(42, '2022-12-22 17:27:38', 1),
	(43, '2022-12-22 17:29:27', 1),
	(44, '2022-12-22 17:29:30', 1),
	(45, '2022-12-22 17:29:31', 1),
	(46, '2022-12-22 17:29:33', 1),
	(47, '2022-12-22 17:33:47', 1),
	(48, '2022-12-22 17:33:50', 1),
	(49, '2022-12-22 17:33:51', 1),
	(50, '2022-12-22 17:33:53', 1),
	(51, '2022-12-22 17:33:55', 1),
	(52, '2022-12-23 01:16:00', 1),
	(53, '2022-12-23 01:16:00', 1),
	(54, '2022-12-23 01:19:00', 1),
	(55, '2022-12-23 01:21:00', 1),
	(56, '2022-12-23 01:23:00', 1),
	(57, '2022-12-23 01:37:00', 1),
	(58, '2022-12-23 01:37:00', 1),
	(59, '2022-12-23 03:06:00', 1),
	(60, '2022-12-23 03:09:00', 1),
	(61, '2022-12-23 03:11:00', 1),
	(62, '2022-12-23 03:14:00', 1);

-- Dumping structure for table projet_gestion_stock.fournisseur
DROP TABLE IF EXISTS `fournisseur`;
CREATE TABLE IF NOT EXISTS `fournisseur` (
  `idFournisseur` int NOT NULL AUTO_INCREMENT,
  `nom` varchar(45) NOT NULL,
  `adresse` varchar(45) NOT NULL,
  `telephone` int NOT NULL,
  `email` varchar(50) NOT NULL,
  PRIMARY KEY (`idFournisseur`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

-- Dumping data for table projet_gestion_stock.fournisseur: ~0 rows (approximately)
INSERT INTO `fournisseur` (`idFournisseur`, `nom`, `adresse`, `telephone`, `email`) VALUES
	(12, 'Danone', 'casa', 40, 'danone@maroc');

-- Dumping structure for table projet_gestion_stock.ligneappro
DROP TABLE IF EXISTS `ligneappro`;
CREATE TABLE IF NOT EXISTS `ligneappro` (
  `numeroAppro` int NOT NULL,
  `quantite` int DEFAULT NULL,
  `reference` varchar(50) NOT NULL,
  `prixAchat` float NOT NULL,
  PRIMARY KEY (`numeroAppro`,`reference`),
  KEY `po_idx` (`reference`),
  CONSTRAINT `ap` FOREIGN KEY (`numeroAppro`) REFERENCES `approvisionnement` (`numeroAppro`),
  CONSTRAINT `po` FOREIGN KEY (`reference`) REFERENCES `produit` (`reference`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table projet_gestion_stock.ligneappro: ~0 rows (approximately)

-- Dumping structure for table projet_gestion_stock.lignecmd
DROP TABLE IF EXISTS `lignecmd`;
CREATE TABLE IF NOT EXISTS `lignecmd` (
  `numeroCmd` int NOT NULL,
  `quantite` int DEFAULT NULL,
  `reference` varchar(50) NOT NULL,
  `prixVente` float NOT NULL,
  PRIMARY KEY (`numeroCmd`,`reference`),
  KEY `fk3_idx` (`reference`),
  CONSTRAINT `fk2` FOREIGN KEY (`numeroCmd`) REFERENCES `commande` (`numeroCmd`),
  CONSTRAINT `fk3` FOREIGN KEY (`reference`) REFERENCES `produit` (`reference`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table projet_gestion_stock.lignecmd: ~0 rows (approximately)

-- Dumping structure for table projet_gestion_stock.produit
DROP TABLE IF EXISTS `produit`;
CREATE TABLE IF NOT EXISTS `produit` (
  `reference` varchar(50) NOT NULL,
  `libelle` varchar(45) NOT NULL,
  `prixUnitaire` float NOT NULL,
  `quantiteStock` int NOT NULL,
  `prixAchat` float NOT NULL,
  `image` varchar(45) DEFAULT NULL,
  `idCategorie` varchar(45) NOT NULL,
  PRIMARY KEY (`reference`),
  KEY `fk5_idx` (`idCategorie`),
  CONSTRAINT `fk5` FOREIGN KEY (`idCategorie`) REFERENCES `categorie` (`idCategorie`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table projet_gestion_stock.produit: ~6 rows (approximately)
INSERT INTO `produit` (`reference`, `libelle`, `prixUnitaire`, `quantiteStock`, `prixAchat`, `image`, `idCategorie`) VALUES
	('AZ10', 'azib', 20, 13, 7, 'azib der3y.png', 'TV1'),
	('dde', 'Lenovo', 199, 1, 11, 'default.png', 'DE1'),
	('fr', 'Lenovo', 199, 6, 11, 'MAROC.jpg', 'DE1'),
	('ong', 'Lenovo', 199, 5, 11, 'default.png', 'DE1'),
	('T440', 'Lenovo', 199, 10, 11, 'default.png', 'DE1'),
	('T440p', 'Lenovo', 200, 9, 11, 'Lenovo.jpg', 'DE1');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
