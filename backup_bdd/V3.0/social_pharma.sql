-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : jeu. 29 août 2024 à 22:02
-- Version du serveur : 10.4.32-MariaDB
-- Version de PHP : 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `social_pharma`
--

-- --------------------------------------------------------

--
-- Structure de la table `client`
--

CREATE TABLE `client` (
  `id` int(14) NOT NULL,
  `nom_complet` varchar(25) DEFAULT NULL,
  `sexe` varchar(1) DEFAULT NULL,
  `telephone` varchar(15) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `adresse` varchar(255) DEFAULT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Déchargement des données de la table `client`
--

INSERT INTO `client` (`id`, `nom_complet`, `sexe`, `telephone`, `email`, `adresse`, `date`) VALUES
(1, 'inconnue', NULL, NULL, NULL, NULL, '2024-07-18 13:59:56');

-- --------------------------------------------------------

--
-- Structure de la table `commande`
--

CREATE TABLE `commande` (
  `id` int(11) NOT NULL,
  `client` varchar(100) NOT NULL,
  `reglement` varchar(100) NOT NULL,
  `username` varchar(100) NOT NULL,
  `pt` int(11) NOT NULL,
  `red` int(11) NOT NULL,
  `net` int(11) NOT NULL,
  `dates` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Structure de la table `com_proforma`
--

CREATE TABLE `com_proforma` (
  `id` int(11) NOT NULL,
  `client` varchar(100) NOT NULL,
  `username` varchar(100) NOT NULL,
  `pt` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `com_proforma`
--

INSERT INTO `com_proforma` (`id`, `client`, `username`, `pt`, `date`) VALUES
(1, 'inconnue', 'lema', 5012, '2024-07-18 14:33:44'),
(2, 'inconnue', 'jonathanlema', 7572, '2024-08-22 18:44:33');

-- --------------------------------------------------------

--
-- Structure de la table `detail_commande`
--

CREATE TABLE `detail_commande` (
  `id` int(14) NOT NULL,
  `code_commande` varchar(15) DEFAULT NULL,
  `plat` varchar(25) DEFAULT NULL,
  `qte_com` int(14) DEFAULT NULL,
  `prix` int(11) NOT NULL,
  `pa` int(11) NOT NULL,
  `benef` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Structure de la table `detail_proforma`
--

CREATE TABLE `detail_proforma` (
  `id` int(11) NOT NULL,
  `code` int(11) NOT NULL,
  `plat` varchar(100) NOT NULL,
  `qte_com` int(11) NOT NULL,
  `prix` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `detail_proforma`
--

INSERT INTO `detail_proforma` (`id`, `code`, `plat`, `qte_com`, `prix`) VALUES
(1, 1, 'maltina', 2, 2500),
(2, 1, 'sprite', 1, 12),
(3, 2, 'maltina', 3, 2500),
(4, 2, 'sprite', 6, 12);

-- --------------------------------------------------------

--
-- Structure de la table `facture`
--

CREATE TABLE `facture` (
  `id` int(11) NOT NULL,
  `entreprise` varchar(100) NOT NULL,
  `num_facture` varchar(15) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `facture`
--

INSERT INTO `facture` (`id`, `entreprise`, `num_facture`, `date`) VALUES
(1, 'VODACOM', '1001255@@', '2024-08-26 08:15:11'),
(3, 'VODACOM', '10000005', '2024-08-26 15:55:28'),
(4, 'VODACOM', '2022', '2024-08-29 15:20:59'),
(5, 'VODACOM', '2020123', '2024-08-29 19:49:42');

-- --------------------------------------------------------

--
-- Structure de la table `fournisseur`
--

CREATE TABLE `fournisseur` (
  `id` int(11) NOT NULL,
  `nom_complet` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `telephone` varchar(100) DEFAULT NULL,
  `email` varchar(200) NOT NULL,
  `adresse` varchar(255) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `fournisseur`
--

INSERT INTO `fournisseur` (`id`, `nom_complet`, `type`, `telephone`, `email`, `adresse`, `date`) VALUES
(1, 'VODACOM', 'Entreprise', '0817767378', 'jonathan@gmail.com', 'kindecohhhhhhh00000', '2024-08-22 16:41:54');

-- --------------------------------------------------------

--
-- Structure de la table `parametre`
--

CREATE TABLE `parametre` (
  `id` int(11) NOT NULL,
  `nom` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `adresse` varchar(255) NOT NULL,
  `rccm` varchar(100) NOT NULL,
  `telephone` varchar(20) NOT NULL,
  `img` varchar(500) NOT NULL,
  `monaie` varchar(100) NOT NULL,
  `taux` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `parametre`
--

INSERT INTO `parametre` (`id`, `nom`, `email`, `adresse`, `rccm`, `telephone`, `img`, `monaie`, `taux`) VALUES
(1, 'SOCIAL PHARMA', 'jonathanlema01@gmail.com', 'kin', 'Non disponible', '243817767357', '66956db9c4ad27.90930243.jpg', 'CDF', 2900);

-- --------------------------------------------------------

--
-- Structure de la table `plat`
--

CREATE TABLE `plat` (
  `id` int(14) NOT NULL,
  `type` varchar(100) NOT NULL,
  `designation` varchar(25) DEFAULT NULL,
  `qte_stock` int(14) DEFAULT NULL,
  `pa` int(15) DEFAULT NULL,
  `pv` int(15) DEFAULT NULL,
  `date_exp` varchar(255) DEFAULT NULL,
  `date_entree` varchar(255) DEFAULT NULL,
  `provenance` varchar(255) DEFAULT NULL,
  `depositaire` varchar(255) DEFAULT NULL,
  `user` varchar(255) DEFAULT NULL,
  `etat` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `plat`
--

INSERT INTO `plat` (`id`, `type`, `designation`, `qte_stock`, `pa`, `pv`, `date_exp`, `date_entree`, `provenance`, `depositaire`, `user`, `etat`) VALUES
(1, '1001255@@', 'COCA', 10, 1500, 2500, '2024-08-26', '2024-08-26', 'RAS', 'RAS', 'jonathanlema', 1),
(3, '2020123', 'ASPIRIN', 8, 200, 400, '2024-09-22', '2024-08-29', 'RAS', 'AXEL', 'jonathanlema', 1),
(4, '2020123', 'SOCOMOL', 10, 1000, 1500, '2025-01-29', '2024-08-29', 'RAS', 'AXEL', 'jonathanlema', 1);

-- --------------------------------------------------------

--
-- Structure de la table `stock`
--

CREATE TABLE `stock` (
  `code` int(15) NOT NULL,
  `designation` varchar(100) NOT NULL,
  `qte_stock` int(11) NOT NULL,
  `pu` int(11) NOT NULL,
  `date_enreg` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `stock`
--

INSERT INTO `stock` (`code`, `designation`, `qte_stock`, `pu`, `date_enreg`) VALUES
(1, 'coca', 16, 2500, '2024-08-27 17:07:09'),
(2, 'sprite', 15, 1500, '2024-08-27 17:07:09'),
(3, 'ASPIRIN', 8, 400, '2024-08-29 19:51:29'),
(4, 'SOCOMOL', 10, 1500, '2024-08-29 19:53:03');

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

CREATE TABLE `user` (
  `id` int(14) NOT NULL,
  `username` varchar(25) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `role` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`id`, `username`, `password`, `role`) VALUES
(1, 'jonathanlema', 'ea3dc49e04ffdd8e1b4a1628e16e341e', 'admin-1'),
(2, 'lema', '827ccb0eea8a706c4c34a16891f84e7b', 'Vendeur');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `client`
--
ALTER TABLE `client`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `commande`
--
ALTER TABLE `commande`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `com_proforma`
--
ALTER TABLE `com_proforma`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `detail_commande`
--
ALTER TABLE `detail_commande`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `detail_proforma`
--
ALTER TABLE `detail_proforma`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `facture`
--
ALTER TABLE `facture`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `fournisseur`
--
ALTER TABLE `fournisseur`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `parametre`
--
ALTER TABLE `parametre`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `plat`
--
ALTER TABLE `plat`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `stock`
--
ALTER TABLE `stock`
  ADD PRIMARY KEY (`code`);

--
-- Index pour la table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `client`
--
ALTER TABLE `client`
  MODIFY `id` int(14) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `commande`
--
ALTER TABLE `commande`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `com_proforma`
--
ALTER TABLE `com_proforma`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `detail_commande`
--
ALTER TABLE `detail_commande`
  MODIFY `id` int(14) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT pour la table `detail_proforma`
--
ALTER TABLE `detail_proforma`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `facture`
--
ALTER TABLE `facture`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT pour la table `fournisseur`
--
ALTER TABLE `fournisseur`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `parametre`
--
ALTER TABLE `parametre`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `plat`
--
ALTER TABLE `plat`
  MODIFY `id` int(14) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `stock`
--
ALTER TABLE `stock`
  MODIFY `code` int(15) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(14) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
