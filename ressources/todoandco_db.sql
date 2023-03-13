-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : lun. 13 mars 2023 à 13:59
-- Version du serveur : 5.7.36
-- Version de PHP : 8.1.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `todoandco_db`
--

-- --------------------------------------------------------

--
-- Structure de la table `doctrine_migration_versions`
--

DROP TABLE IF EXISTS `doctrine_migration_versions`;
CREATE TABLE IF NOT EXISTS `doctrine_migration_versions` (
  `version` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `executed_at` datetime DEFAULT NULL,
  `execution_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `doctrine_migration_versions`
--

INSERT INTO `doctrine_migration_versions` (`version`, `executed_at`, `execution_time`) VALUES
('DoctrineMigrations\\Version20230303124106', '2023-03-03 12:41:09', 139),
('DoctrineMigrations\\Version20230303130937', '2023-03-03 13:09:40', 84),
('DoctrineMigrations\\Version20230310160543', '2023-03-10 16:05:49', 120);

-- --------------------------------------------------------

--
-- Structure de la table `messenger_messages`
--

DROP TABLE IF EXISTS `messenger_messages`;
CREATE TABLE IF NOT EXISTS `messenger_messages` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `body` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `headers` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue_name` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `available_at` datetime NOT NULL,
  `delivered_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_75EA56E0FB7336F0` (`queue_name`),
  KEY `IDX_75EA56E0E3BD61CE` (`available_at`),
  KEY `IDX_75EA56E016BA31DB` (`delivered_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `task`
--

DROP TABLE IF EXISTS `task`;
CREATE TABLE IF NOT EXISTS `task` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_at` datetime NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_done` tinyint(1) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_527EDB25A76ED395` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=281 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `task`
--

INSERT INTO `task` (`id`, `created_at`, `title`, `content`, `is_done`, `user_id`) VALUES
(251, '2023-03-13 13:58:12', 'Rappels', '06 89 70 46 99 </br> 05 55 03 42 29 </br> 04 56 23 32 17', 0, 77),
(252, '2023-03-13 13:58:12', 'Numéro de téléphone', '- Beurre </br> - Endives </br> - Poireau </br> - Bananes <br> - Carottes <br> - Champignons <br>', 1, 79),
(253, '2023-03-13 13:58:12', 'Médecin', 'Nicolas Jaar, Rival Consoles, Weval, Max Cooper, Daniel Avery, Boards of Canada, The Chemical Brothers, Todd Terje, Daniel Avery, The XX, Moderat, Superpoze, Rone, LCD Soundsystem...', 1, 79),
(254, '2023-03-13 13:58:12', 'Site web', 'www.senscritique.com <br> www.allocine.com <br> www.last.fm', 0, NULL),
(255, '2023-03-13 13:58:12', '29/04', 'Saint-Germain-les-Prés <br> Ligne 3', 0, NULL),
(256, '2023-03-13 13:58:12', '5 mai 2023', 'Saint-Germain-les-Prés <br> Ligne 3', 1, NULL),
(257, '2023-03-13 13:58:12', 'Musique', '- Beurre </br> - Endives </br> - Poireau </br> - Bananes <br> - Carottes <br> - Champignons <br>', 0, NULL),
(258, '2023-03-13 13:58:12', 'Liste de courses', 'Saint-Germain-les-Prés <br> Ligne 3', 1, 78),
(259, '2023-03-13 13:58:12', 'Métro', 'Saint-Germain-les-Prés <br> Ligne 3', 0, NULL),
(260, '2023-03-13 13:58:12', 'Livres à lire', 'Préparer la soutenance <br>', 0, 76),
(261, '2023-03-13 13:58:12', 'Musique', 'Aniversaire de Grégory', 0, 79),
(262, '2023-03-13 13:58:12', 'Métro', 'Préparer la soutenance <br>', 0, 76),
(263, '2023-03-13 13:58:12', '29/04', 'www.senscritique.com <br> www.allocine.com <br> www.last.fm', 0, NULL),
(264, '2023-03-13 13:58:12', 'Réunion 17/03', 'Nicolas Jaar, Rival Consoles, Weval, Max Cooper, Daniel Avery, Boards of Canada, The Chemical Brothers, Todd Terje, Daniel Avery, The XX, Moderat, Superpoze, Rone, LCD Soundsystem...', 0, 76),
(265, '2023-03-13 13:58:12', 'Site web', 'Nicolas Jaar, Rival Consoles, Weval, Max Cooper, Daniel Avery, Boards of Canada, The Chemical Brothers, Todd Terje, Daniel Avery, The XX, Moderat, Superpoze, Rone, LCD Soundsystem...', 1, 78),
(266, '2023-03-13 13:58:12', 'Musique', 'Aniversaire de Grégory', 1, NULL),
(267, '2023-03-13 13:58:12', 'Numéro de téléphone', 'Saint-Germain-les-Prés <br> Ligne 3', 0, 77),
(268, '2023-03-13 13:58:12', 'Métro', 'Éric Roulhac <br> 141 Bis Av. de Limoges <br> 87270 Couzeix <br> 05 55 39 32 98', 1, 77),
(269, '2023-03-13 13:58:12', 'Rappels', 'Saint-Germain-les-Prés <br> Ligne 3', 1, 77),
(270, '2023-03-13 13:58:12', '5 mai 2023', 'Préparer la soutenance <br>', 1, 76),
(271, '2023-03-13 13:58:12', 'Liste de courses', 'L\'Étranger, Sapiens, Le Pouvoir du Moment Présent, Les quatre accords toltèques', 0, 79),
(272, '2023-03-13 13:58:12', 'Médecin', '06 89 70 46 99 </br> 05 55 03 42 29 </br> 04 56 23 32 17', 1, 79),
(273, '2023-03-13 13:58:12', 'Liste de courses', 'L\'Étranger, Sapiens, Le Pouvoir du Moment Présent, Les quatre accords toltèques', 0, 77),
(274, '2023-03-13 13:58:12', 'Métro', '- Beurre </br> - Endives </br> - Poireau </br> - Bananes <br> - Carottes <br> - Champignons <br>', 0, 77),
(275, '2023-03-13 13:58:12', '29/04', 'Éric Roulhac <br> 141 Bis Av. de Limoges <br> 87270 Couzeix <br> 05 55 39 32 98', 1, 79),
(276, '2023-03-13 13:58:12', 'Réunion 17/03', '06 89 70 46 99 </br> 05 55 03 42 29 </br> 04 56 23 32 17', 1, 78),
(277, '2023-03-13 13:58:12', 'Numéro de téléphone', 'Aniversaire de Grégory', 0, 76),
(278, '2023-03-13 13:58:12', 'Musique', 'Préparer la soutenance <br>', 0, 79),
(279, '2023-03-13 13:58:12', 'Musique', 'Nicolas Jaar, Rival Consoles, Weval, Max Cooper, Daniel Avery, Boards of Canada, The Chemical Brothers, Todd Terje, Daniel Avery, The XX, Moderat, Superpoze, Rone, LCD Soundsystem...', 1, 77),
(280, '2023-03-13 13:58:12', 'Site web', 'Sorti les poubelles <br> Promener le chien', 1, 76);

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(180) COLLATE utf8mb4_unicode_ci NOT NULL,
  `roles` json NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_8D93D649E7927C74` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=80 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`id`, `email`, `roles`, `password`, `username`) VALUES
(76, 'admin@todoandco.com', '[\"ROLE_ADMIN\", \"ROLE_USER\"]', '$2y$13$YP.zPS7Nmq/BVRyuSQJWeeZmT/u79Jq5K6rKvU9/Xjb9IJ5KehX02', 'Admin'),
(77, 'user1@todoandco.com', '[\"ROLE_USER\"]', '$2y$13$f8rdEtUOqCPITKS2nh2bs.Ixudm6wRL3nm4xtX9upwxSOuXeV2ajO', 'Utilisateur1'),
(78, 'user2@todoandco.com', '[\"ROLE_USER\"]', '$2y$13$etEm5zyz5rdPfTEo/5d50uaaNobwbAiErZs4XbbjITKAxE0RwrHiy', 'Utilisateur2'),
(79, 'user3@todoandco.com', '[\"ROLE_USER\"]', '$2y$13$.ycOCdPBKSxiB.igZRjpreffbmqtAv7eGOLsET8xgYwwgftV4y686', 'Utilisateur3');

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `task`
--
ALTER TABLE `task`
  ADD CONSTRAINT `FK_527EDB25A76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
