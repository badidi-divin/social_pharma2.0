-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : dim. 21 juil. 2024 à 04:27
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

--
-- Déchargement des données de la table `commande`
--

INSERT INTO `commande` (`id`, `client`, `reglement`, `username`, `pt`, `red`, `net`, `dates`) VALUES
(1, 'inconnue', 'Cash', 'jonathanlema', 25024, 0, 25024, '2024-07-18 14:00:28'),
(2, 'inconnue', 'Cash', 'jonathanlema', 25024, 0, 25024, '2024-07-18 14:03:07');

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
(1, 'inconnue', 'lema', 5012, '2024-07-18 14:33:44');

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

--
-- Déchargement des données de la table `detail_commande`
--

INSERT INTO `detail_commande` (`id`, `code_commande`, `plat`, `qte_com`, `prix`, `pa`, `benef`, `date`) VALUES
(1, '2', 'sprite', 2, 12, 10, 4, '2024-07-18 14:03:07'),
(2, '2', 'maltina', 10, 2500, 1500, 10000, '2024-07-18 14:03:07');

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
(2, 1, 'sprite', 1, 12);

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
(1, 'SOCIAL PHARMA', 'jonathanlema01@gmail.com', 'kin', 'Non disponible', '243817767357', '66956db9c4ad27.90930243.jpg', 'USD', 2900);

-- --------------------------------------------------------

--
-- Structure de la table `plat`
--

CREATE TABLE `plat` (
  `id` int(14) NOT NULL,
  `designation` varchar(25) DEFAULT NULL,
  `qte_stock` int(14) DEFAULT NULL,
  `pa` int(15) DEFAULT NULL,
  `pv` int(15) DEFAULT NULL,
  `date_exp` varchar(255) DEFAULT NULL,
  `date_entree` varchar(255) DEFAULT NULL,
  `provenance` varchar(255) DEFAULT NULL,
  `depositaire` varchar(255) DEFAULT NULL,
  `user` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `plat`
--

INSERT INTO `plat` (`id`, `designation`, `qte_stock`, `pa`, `pv`, `date_exp`, `date_entree`, `provenance`, `depositaire`, `user`) VALUES
(1, 'sprite', 11, 10, 12, '2024-07-15', '2024-07-10', 'RAS', 'RAS', 'jonathanlema'),
(2, 'tembo', 10, 1100, 1500, '2024-07-15', '2024-07-11', 'RAS', 'RAS', 'jonathanlema'),
(8, 'sprite', 5, 1500, 20, '2024-07-15', '2024-07-10', 'RAS', 'RAS', 'jonathanlema'),
(9, 'maltina', 10, 1500, 2500, '2024-07-15', '2024-08-04', 'KIKWIT', 'RAS', 'jonathanlema'),
(10, 'maltina', 10, 1500, 2500, '2024-07-15', '2024-08-04', 'KIKWIT', 'RAS', 'jonathanlema'),
(11, 'Maltina', 25, 1500, 2500, '2024-11-11', '2024-11-12', 'RAS', 'RAS2', 'jonathanlema');

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
(1, 'sprite', 33, 12, '2024-07-18 14:03:07'),
(3, 'maltina', 25, 2500, '2024-07-18 14:03:07');

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
(2, 'lema', '6486c7f1f1f6f47176198e1a107203e0', 'Vendeur');

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `com_proforma`
--
ALTER TABLE `com_proforma`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `detail_commande`
--
ALTER TABLE `detail_commande`
  MODIFY `id` int(14) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `detail_proforma`
--
ALTER TABLE `detail_proforma`
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
  MODIFY `id` int(14) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT pour la table `stock`
--
ALTER TABLE `stock`
  MODIFY `code` int(15) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(14) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
