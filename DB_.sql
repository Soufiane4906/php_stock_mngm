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

-- Création de la base de données
DROP DATABASE IF EXISTS `projet_gestion_stock`;
CREATE DATABASE IF NOT EXISTS `projet_gestion_stock` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;

USE `projet_gestion_stock`;

-- Table administrateurs
DROP TABLE IF EXISTS `administrateurs`;
CREATE TABLE IF NOT EXISTS `administrateurs` (
  `idAdmin` int NOT NULL AUTO_INCREMENT,
  `login` varchar(50) NOT NULL UNIQUE,
  `password` varchar(255) NOT NULL,
  `created_at` timestamp DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`idAdmin`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Données pour administrateurs (mot de passe hashé recommandé en production)
INSERT INTO `administrateurs` (`idAdmin`, `login`, `password`) VALUES
	(1, 'admin', 'admin');

-- Table categorie
DROP TABLE IF EXISTS `categorie`;
CREATE TABLE IF NOT EXISTS `categorie` (
  `idCategorie` varchar(10) NOT NULL,
  `nomCategorie` varchar(100) NOT NULL,
  `description` text,
  `created_at` timestamp DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`idCategorie`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Données pour categorie
INSERT INTO `categorie` (`idCategorie`, `nomCategorie`) VALUES
	('DE1', 'Dell Electro'),
	('TV1', 'LG10221');

-- Table client
DROP TABLE IF EXISTS `client`;
CREATE TABLE IF NOT EXISTS `client` (
  `idClient` int NOT NULL AUTO_INCREMENT,
  `nom` varchar(100) NOT NULL,
  `adresse` varchar(255) NOT NULL,
  `telephone` varchar(20) NOT NULL,
  `email` varchar(100) NOT NULL,
  `created_at` timestamp DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`idClient`),
  UNIQUE KEY `email_unique` (`email`),
  INDEX `idx_nom` (`nom`),
  INDEX `idx_telephone` (`telephone`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Données pour client (suppression des doublons)
INSERT INTO `client` (`idClient`, `nom`, `adresse`, `telephone`, `email`) VALUES
	(1, 'Youness', 'mohammed', '627594239', 'youness@test.com'),
	(12, 'Mohammed JADIR', 'rue 20 numero 9', '66666666', 'mjadir@test.com'),
	(13, 'Abdelmoughit ELOUMARI', 'hay eljadid, 162', '627585858', 'moughit@gmail.com'),
	(16, 'Oussama Idrissi', 'Salmia 2, Rue 18, Imm 52, Apprt 5', '627594239', 'oidrissi44@gmail.com'),
	(20, 'Hala', 'Adresse Hala', '627000002', 'hala@hala.com');

-- Table fournisseur
DROP TABLE IF EXISTS `fournisseur`;
CREATE TABLE IF NOT EXISTS `fournisseur` (
  `idFournisseur` int NOT NULL AUTO_INCREMENT,
  `nom` varchar(100) NOT NULL,
  `adresse` varchar(255) NOT NULL,
  `telephone` varchar(20) NOT NULL,
  `email` varchar(100) NOT NULL,
  `created_at` timestamp DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`idFournisseur`),
  UNIQUE KEY `email_unique` (`email`),
  INDEX `idx_nom` (`nom`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Données pour fournisseur
INSERT INTO `fournisseur` (`idFournisseur`, `nom`, `adresse`, `telephone`, `email`) VALUES
	(12, 'Danone', 'Casablanca', '0522000040', 'danone@maroc.com');

-- Table produit
DROP TABLE IF EXISTS `produit`;
CREATE TABLE IF NOT EXISTS `produit` (
  `reference` varchar(50) NOT NULL,
  `libelle` varchar(100) NOT NULL,
  `description` text,
  `prixUnitaire` decimal(10,2) NOT NULL,
  `quantiteStock` int NOT NULL DEFAULT 0,
  `prixAchat` decimal(10,2) NOT NULL,
  `seuilStock` int DEFAULT 5,
  `image` varchar(255) DEFAULT 'default.png',
  `idCategorie` varchar(10) NOT NULL,
  `created_at` timestamp DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`reference`),
  KEY `fk_produit_categorie` (`idCategorie`),
  INDEX `idx_libelle` (`libelle`),
  INDEX `idx_prix` (`prixUnitaire`),
  CONSTRAINT `fk_produit_categorie` FOREIGN KEY (`idCategorie`) REFERENCES `categorie` (`idCategorie`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Données pour produit
INSERT INTO `produit` (`reference`, `libelle`, `prixUnitaire`, `quantiteStock`, `prixAchat`, `image`, `idCategorie`) VALUES
	('AZ10', 'Azib', 20.00, 13, 7.00, 'azib_der3y.png', 'TV1'),
	('DDE001', 'Lenovo ThinkPad', 199.00, 1, 11.00, 'default.png', 'DE1'),
	('FR001', 'Lenovo IdeaPad', 199.00, 6, 11.00, 'MAROC.jpg', 'DE1'),
	('ONG001', 'Lenovo Legion', 199.00, 5, 11.00, 'default.png', 'DE1'),
	('T440', 'Lenovo ThinkPad T440', 199.00, 10, 11.00, 'default.png', 'DE1'),
	('T440P', 'Lenovo ThinkPad T440p', 200.00, 9, 11.00, 'Lenovo.jpg', 'DE1');

-- Table commande
DROP TABLE IF EXISTS `commande`;
CREATE TABLE IF NOT EXISTS `commande` (
  `numeroCmd` int NOT NULL AUTO_INCREMENT,
  `date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `statut` enum('en_attente','confirmee','expediee','livree','annulee') DEFAULT 'en_attente',
  `montantTotal` decimal(10,2) DEFAULT 0.00,
  `idClient` int NOT NULL,
  `created_at` timestamp DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`numeroCmd`),
  KEY `fk_commande_client` (`idClient`),
  INDEX `idx_date` (`date`),
  INDEX `idx_statut` (`statut`),
  CONSTRAINT `fk_commande_client` FOREIGN KEY (`idClient`) REFERENCES `client` (`idClient`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Données pour commande (quelques exemples seulement)
INSERT INTO `commande` (`numeroCmd`, `date`, `idClient`) VALUES
	(1, '2022-12-14 00:41:32', 1),
	(2, '2022-12-18 14:33:43', 12),
	(3, '2022-12-22 17:04:29', 13),
	(4, '2022-12-23 01:16:00', 16),
	(5, '2022-12-23 03:14:00', 20);

-- Table approvisionnement
DROP TABLE IF EXISTS `approvisionnement`;
CREATE TABLE IF NOT EXISTS `approvisionnement` (
  `numeroAppro` int NOT NULL AUTO_INCREMENT,
  `date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `statut` enum('en_attente','confirmee','recue','annulee') DEFAULT 'en_attente',
  `montantTotal` decimal(10,2) DEFAULT 0.00,
  `idFournisseur` int NOT NULL,
  `created_at` timestamp DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`numeroAppro`),
  KEY `fk_appro_fournisseur` (`idFournisseur`),
  INDEX `idx_date` (`date`),
  INDEX `idx_statut` (`statut`),
  CONSTRAINT `fk_appro_fournisseur` FOREIGN KEY (`idFournisseur`) REFERENCES `fournisseur` (`idFournisseur`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Données pour approvisionnement
INSERT INTO `approvisionnement` (`numeroAppro`, `date`, `idFournisseur`) VALUES
	(1, '2022-12-23 03:03:00', 12),
	(2, '2022-12-23 03:15:00', 12);

-- Table lignecmd
DROP TABLE IF EXISTS `lignecmd`;
CREATE TABLE IF NOT EXISTS `lignecmd` (
  `numeroCmd` int NOT NULL,
  `reference` varchar(50) NOT NULL,
  `quantite` int NOT NULL CHECK (`quantite` > 0),
  `prixVente` decimal(10,2) NOT NULL,
  `sousTotal` decimal(10,2) GENERATED ALWAYS AS (`quantite` * `prixVente`) STORED,
  PRIMARY KEY (`numeroCmd`, `reference`),
  KEY `fk_lignecmd_produit` (`reference`),
  CONSTRAINT `fk_lignecmd_commande` FOREIGN KEY (`numeroCmd`) REFERENCES `commande` (`numeroCmd`) ON DELETE CASCADE,
  CONSTRAINT `fk_lignecmd_produit` FOREIGN KEY (`reference`) REFERENCES `produit` (`reference`) ON DELETE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Table ligneappro
DROP TABLE IF EXISTS `ligneappro`;
CREATE TABLE IF NOT EXISTS `ligneappro` (
  `numeroAppro` int NOT NULL,
  `reference` varchar(50) NOT NULL,
  `quantite` int NOT NULL CHECK (`quantite` > 0),
  `prixAchat` decimal(10,2) NOT NULL,
  `sousTotal` decimal(10,2) GENERATED ALWAYS AS (`quantite` * `prixAchat`) STORED,
  PRIMARY KEY (`numeroAppro`, `reference`),
  KEY `fk_ligneappro_produit` (`reference`),
  CONSTRAINT `fk_ligneappro_appro` FOREIGN KEY (`numeroAppro`) REFERENCES `approvisionnement` (`numeroAppro`) ON DELETE CASCADE,
  CONSTRAINT `fk_ligneappro_produit` FOREIGN KEY (`reference`) REFERENCES `produit` (`reference`) ON DELETE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Création des triggers pour mise à jour automatique des montants
DELIMITER $$

CREATE TRIGGER `update_commande_total_after_insert` 
AFTER INSERT ON `lignecmd` 
FOR EACH ROW 
BEGIN
    UPDATE `commande` 
    SET `montantTotal` = (
        SELECT COALESCE(SUM(`sousTotal`), 0) 
        FROM `lignecmd` 
        WHERE `numeroCmd` = NEW.`numeroCmd`
    ) 
    WHERE `numeroCmd` = NEW.`numeroCmd`;
END$$

CREATE TRIGGER `update_commande_total_after_update` 
AFTER UPDATE ON `lignecmd` 
FOR EACH ROW 
BEGIN
    UPDATE `commande` 
    SET `montantTotal` = (
        SELECT COALESCE(SUM(`sousTotal`), 0) 
        FROM `lignecmd` 
        WHERE `numeroCmd` = NEW.`numeroCmd`
    ) 
    WHERE `numeroCmd` = NEW.`numeroCmd`;
END$$

CREATE TRIGGER `update_commande_total_after_delete` 
AFTER DELETE ON `lignecmd` 
FOR EACH ROW 
BEGIN
    UPDATE `commande` 
    SET `montantTotal` = (
        SELECT COALESCE(SUM(`sousTotal`), 0) 
        FROM `lignecmd` 
        WHERE `numeroCmd` = OLD.`numeroCmd`
    ) 
    WHERE `numeroCmd` = OLD.`numeroCmd`;
END$$

CREATE TRIGGER `update_appro_total_after_insert` 
AFTER INSERT ON `ligneappro` 
FOR EACH ROW 
BEGIN
    UPDATE `approvisionnement` 
    SET `montantTotal` = (
        SELECT COALESCE(SUM(`sousTotal`), 0) 
        FROM `ligneappro` 
        WHERE `numeroAppro` = NEW.`numeroAppro`
    ) 
    WHERE `numeroAppro` = NEW.`numeroAppro`;
END$$

CREATE TRIGGER `update_appro_total_after_update` 
AFTER UPDATE ON `ligneappro` 
FOR EACH ROW 
BEGIN
    UPDATE `approvisionnement` 
    SET `montantTotal` = (
        SELECT COALESCE(SUM(`sousTotal`), 0) 
        FROM `ligneappro` 
        WHERE `numeroAppro` = NEW.`numeroAppro`
    ) 
    WHERE `numeroAppro` = NEW.`numeroAppro`;
END$$

CREATE TRIGGER `update_appro_total_after_delete` 
AFTER DELETE ON `ligneappro` 
FOR EACH ROW 
BEGIN
    UPDATE `approvisionnement` 
    SET `montantTotal` = (
        SELECT COALESCE(SUM(`sousTotal`), 0) 
        FROM `ligneappro` 
        WHERE `numeroAppro` = OLD.`numeroAppro`
    ) 
    WHERE `numeroAppro` = OLD.`numeroAppro`;
END$$

DELIMITER ;

-- Restauration des paramètres MySQL
/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
