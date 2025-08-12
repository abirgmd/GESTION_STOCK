-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 12, 2025 at 09:17 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `projet_gestion_stock`
--

-- --------------------------------------------------------

--
-- Table structure for table `administrateurs`
--

CREATE TABLE `administrateurs` (
  `idAdmin` int(11) NOT NULL,
  `login` varchar(10) NOT NULL,
  `password` varchar(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `administrateurs`
--

INSERT INTO `administrateurs` (`idAdmin`, `login`, `password`) VALUES
(1, 'admin', 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `approvisionnement`
--

CREATE TABLE `approvisionnement` (
  `numeroAppro` int(11) NOT NULL,
  `date` datetime NOT NULL,
  `idFournisseur` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `approvisionnement`
--

INSERT INTO `approvisionnement` (`numeroAppro`, `date`, `idFournisseur`) VALUES
(1, '2025-07-14 09:00:00', 1),
(2, '2025-07-14 13:30:00', 2),
(5, '2025-08-12 16:22:00', 1);

-- --------------------------------------------------------

--
-- Table structure for table `categorie`
--

CREATE TABLE `categorie` (
  `idCategorie` varchar(10) NOT NULL,
  `nomCategorie` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `categorie`
--

INSERT INTO `categorie` (`idCategorie`, `nomCategorie`) VALUES
('CAT01', 'Épicerie'),
('CAT02', 'Boissons');

-- --------------------------------------------------------

--
-- Table structure for table `client`
--

CREATE TABLE `client` (
  `idClient` int(11) NOT NULL,
  `nom` varchar(45) NOT NULL,
  `adresse` varchar(45) NOT NULL,
  `telephone` int(11) NOT NULL,
  `email` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `client`
--

INSERT INTO `client` (`idClient`, `nom`, `adresse`, `telephone`, `email`) VALUES
(1, 'Restaurant', 'Av.', 71223344, 'chezali@resto.tn'),
(2, 'Snack BonGoût', 'Rue des Saveurs, Sousse', 73556677, 'bongout@snack.tn');

-- --------------------------------------------------------

--
-- Table structure for table `commande`
--

CREATE TABLE `commande` (
  `numeroCmd` int(11) NOT NULL,
  `date` datetime NOT NULL,
  `idClient` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci COMMENT='			';

--
-- Dumping data for table `commande`
--

INSERT INTO `commande` (`numeroCmd`, `date`, `idClient`) VALUES
(1, '2025-07-15 10:00:00', 1),
(2, '2025-07-15 15:45:00', 2),
(63, '2025-07-16 16:57:00', 2);

-- --------------------------------------------------------

--
-- Table structure for table `fournisseur`
--

CREATE TABLE `fournisseur` (
  `idFournisseur` int(11) NOT NULL,
  `nom` varchar(45) NOT NULL,
  `adresse` varchar(45) NOT NULL,
  `telephone` int(11) NOT NULL,
  `email` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `fournisseur`
--

INSERT INTO `fournisseur` (`idFournisseur`, `nom`, `adresse`, `telephone`, `email`) VALUES
(1, 'Tunisie Épices', 'Rue Ibn Khaldoun, Tunis', 71456789, 'contact@tunepices.tn'),
(2, 'BoissonPlus', 'Zone industrielle, Sfax', 73345678, 'info@boissonplus.tn');

-- --------------------------------------------------------

--
-- Table structure for table `ligneappro`
--

CREATE TABLE `ligneappro` (
  `numeroAppro` int(11) NOT NULL,
  `quantite` int(11) DEFAULT NULL,
  `reference` varchar(50) NOT NULL,
  `prixAchat` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `ligneappro`
--

INSERT INTO `ligneappro` (`numeroAppro`, `quantite`, `reference`, `prixAchat`) VALUES
(1, 500, 'REF001', 0.85),
(1, 600, 'REF002', 0.7),
(1, 400, 'REF003', 0.95),
(2, 1000, 'REF005', 0.5),
(2, 300, 'REF007', 1.6),
(5, 1, 'REF006', 7);

-- --------------------------------------------------------

--
-- Table structure for table `lignecmd`
--

CREATE TABLE `lignecmd` (
  `numeroCmd` int(11) NOT NULL,
  `quantite` int(11) DEFAULT NULL,
  `reference` varchar(50) NOT NULL,
  `prixVente` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `lignecmd`
--

INSERT INTO `lignecmd` (`numeroCmd`, `quantite`, `reference`, `prixVente`) VALUES
(1, 50, 'REF001', 1.1),
(1, 60, 'REF002', 0.95),
(1, 100, 'REF005', 0.7),
(2, 80, 'REF003', 1.2),
(2, 70, 'REF006', 2.4),
(63, 1, 'REF003', 1.2),
(63, 1, 'REF004', 1.25);

-- --------------------------------------------------------

--
-- Table structure for table `produit`
--

CREATE TABLE `produit` (
  `reference` varchar(50) NOT NULL,
  `libelle` varchar(45) NOT NULL,
  `prixUnitaire` float NOT NULL,
  `quantiteStock` int(11) NOT NULL,
  `prixAchat` float NOT NULL,
  `image` varchar(45) DEFAULT NULL,
  `idCategorie` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `produit`
--

INSERT INTO `produit` (`reference`, `libelle`, `prixUnitaire`, `quantiteStock`, `prixAchat`, `image`, `idCategorie`) VALUES
('REF001', 'Sucre blanc 1kg', 1.1, 500, 0.85, 'sucre.jpeg', 'CAT01'),
('REF002', 'Farine type 55 - 1kg', 0.95, 600, 0.7, 'farine.jpeg', 'CAT01'),
('REF003', 'Pâtes Spaghetti 500g', 1.2, 799, 0.95, 'spa.jpeg', 'CAT01'),
('REF004', 'Pâtes Macaroni 500g', 1.25, 749, 1, 'mac.jpeg', 'CAT01'),
('REF005', 'Eau minérale 1.5L', 0.7, 1000, 0.5, 'eau.jpeg', 'CAT02'),
('REF006', 'Jus d’orange bouteille 1L', 2.4, 401, 1.9, 'jus.jpeg', 'CAT02'),
('REF007', 'Soda citron 1.5L', 2, 300, 1.6, 'sodac.jpeg', 'CAT02');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `administrateurs`
--
ALTER TABLE `administrateurs`
  ADD PRIMARY KEY (`idAdmin`);

--
-- Indexes for table `approvisionnement`
--
ALTER TABLE `approvisionnement`
  ADD PRIMARY KEY (`numeroAppro`),
  ADD KEY `fk20` (`idFournisseur`);

--
-- Indexes for table `categorie`
--
ALTER TABLE `categorie`
  ADD PRIMARY KEY (`idCategorie`);

--
-- Indexes for table `client`
--
ALTER TABLE `client`
  ADD PRIMARY KEY (`idClient`);

--
-- Indexes for table `commande`
--
ALTER TABLE `commande`
  ADD PRIMARY KEY (`numeroCmd`),
  ADD KEY `fk1_idx` (`idClient`);

--
-- Indexes for table `fournisseur`
--
ALTER TABLE `fournisseur`
  ADD PRIMARY KEY (`idFournisseur`);

--
-- Indexes for table `ligneappro`
--
ALTER TABLE `ligneappro`
  ADD PRIMARY KEY (`numeroAppro`,`reference`),
  ADD KEY `po_idx` (`reference`);

--
-- Indexes for table `lignecmd`
--
ALTER TABLE `lignecmd`
  ADD PRIMARY KEY (`numeroCmd`,`reference`),
  ADD KEY `fk3_idx` (`reference`);

--
-- Indexes for table `produit`
--
ALTER TABLE `produit`
  ADD PRIMARY KEY (`reference`),
  ADD KEY `fk5_idx` (`idCategorie`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `administrateurs`
--
ALTER TABLE `administrateurs`
  MODIFY `idAdmin` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `approvisionnement`
--
ALTER TABLE `approvisionnement`
  MODIFY `numeroAppro` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `client`
--
ALTER TABLE `client`
  MODIFY `idClient` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `commande`
--
ALTER TABLE `commande`
  MODIFY `numeroCmd` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=64;

--
-- AUTO_INCREMENT for table `fournisseur`
--
ALTER TABLE `fournisseur`
  MODIFY `idFournisseur` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `approvisionnement`
--
ALTER TABLE `approvisionnement`
  ADD CONSTRAINT `fk20` FOREIGN KEY (`idFournisseur`) REFERENCES `fournisseur` (`idFournisseur`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `commande`
--
ALTER TABLE `commande`
  ADD CONSTRAINT `fk1` FOREIGN KEY (`idClient`) REFERENCES `client` (`idClient`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `ligneappro`
--
ALTER TABLE `ligneappro`
  ADD CONSTRAINT `ap` FOREIGN KEY (`numeroAppro`) REFERENCES `approvisionnement` (`numeroAppro`),
  ADD CONSTRAINT `po` FOREIGN KEY (`reference`) REFERENCES `produit` (`reference`);

--
-- Constraints for table `lignecmd`
--
ALTER TABLE `lignecmd`
  ADD CONSTRAINT `fk2` FOREIGN KEY (`numeroCmd`) REFERENCES `commande` (`numeroCmd`),
  ADD CONSTRAINT `fk3` FOREIGN KEY (`reference`) REFERENCES `produit` (`reference`);

--
-- Constraints for table `produit`
--
ALTER TABLE `produit`
  ADD CONSTRAINT `fk5` FOREIGN KEY (`idCategorie`) REFERENCES `categorie` (`idCategorie`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
