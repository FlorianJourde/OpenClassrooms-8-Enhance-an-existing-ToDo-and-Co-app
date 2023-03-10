-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : ven. 10 mars 2023 à 16:46
-- Version du serveur : 5.7.36
-- Version de PHP : 7.4.26

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
) ENGINE=InnoDB AUTO_INCREMENT=186 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `task`
--

INSERT INTO `task` (`id`, `created_at`, `title`, `content`, `is_done`, `user_id`) VALUES
(156, '2023-03-10 16:46:23', 'Site web', 'Préparer la soutenance <br>', 1, 52),
(157, '2023-03-10 16:46:23', 'Livres à lire', 'Nicolas Jaar, Rival Consoles, Weval, Max Cooper, Daniel Avery, Boards of Canada, The Chemical Brothers, Todd Terje, Daniel Avery, The XX, Moderat, Superpoze, Rone, LCD Soundsystem...', 0, 52),
(158, '2023-03-10 16:46:23', 'Liste de courses', 'Saint-Germain-les-Prés <br> Ligne 3', 0, 55),
(159, '2023-03-10 16:46:23', 'Rappels', 'L\'Étranger, Sapiens, Le Pouvoir du Moment Présent, Les quatre accords toltèques', 1, 52),
(160, '2023-03-10 16:46:23', 'Musique', 'Aniversaire de Grégory', 1, NULL),
(161, '2023-03-10 16:46:23', 'Médecin', 'Aniversaire de Grégory', 0, 54),
(162, '2023-03-10 16:46:23', 'Liste de courses', 'Préparer la soutenance <br>', 1, NULL),
(163, '2023-03-10 16:46:23', 'Rappels', 'Préparer la soutenance <br>', 0, NULL),
(164, '2023-03-10 16:46:23', '29/04', 'www.senscritique.com <br> www.allocine.com <br> www.last.fm', 1, 55),
(165, '2023-03-10 16:46:23', 'Liste de courses', 'Aniversaire de Grégory', 0, 54),
(166, '2023-03-10 16:46:23', 'Site web', 'Éric Roulhac <br> 141 Bis Av. de Limoges <br> 87270 Couzeix <br> 05 55 39 32 98', 0, 55),
(167, '2023-03-10 16:46:23', 'Réunion 17/03', '06 89 70 46 99 </br> 05 55 03 42 29 </br> 04 56 23 32 17', 1, 52),
(168, '2023-03-10 16:46:23', 'Livres à lire', 'Saint-Germain-les-Prés <br> Ligne 3', 0, NULL),
(169, '2023-03-10 16:46:23', '5 mai 2023', 'L\'Étranger, Sapiens, Le Pouvoir du Moment Présent, Les quatre accords toltèques', 0, NULL),
(170, '2023-03-10 16:46:23', 'Livres à lire', 'Éric Roulhac <br> 141 Bis Av. de Limoges <br> 87270 Couzeix <br> 05 55 39 32 98', 0, 54),
(171, '2023-03-10 16:46:23', 'Livres à lire', 'Sorti les poubelles <br> Promener le chien', 0, NULL),
(172, '2023-03-10 16:46:23', '29/04', 'Préparer la soutenance <br>', 0, 52),
(173, '2023-03-10 16:46:23', 'Liste de courses', 'Saint-Germain-les-Prés <br> Ligne 3', 1, 55),
(174, '2023-03-10 16:46:23', 'Métro', 'Nicolas Jaar, Rival Consoles, Weval, Max Cooper, Daniel Avery, Boards of Canada, The Chemical Brothers, Todd Terje, Daniel Avery, The XX, Moderat, Superpoze, Rone, LCD Soundsystem...', 0, 53),
(175, '2023-03-10 16:46:23', 'Médecin', 'L\'Étranger, Sapiens, Le Pouvoir du Moment Présent, Les quatre accords toltèques', 1, 55),
(176, '2023-03-10 16:46:23', 'Métro', 'Nicolas Jaar, Rival Consoles, Weval, Max Cooper, Daniel Avery, Boards of Canada, The Chemical Brothers, Todd Terje, Daniel Avery, The XX, Moderat, Superpoze, Rone, LCD Soundsystem...', 0, 52),
(177, '2023-03-10 16:46:23', '5 mai 2023', 'Sorti les poubelles <br> Promener le chien', 1, 54),
(178, '2023-03-10 16:46:23', 'Livres à lire', 'Éric Roulhac <br> 141 Bis Av. de Limoges <br> 87270 Couzeix <br> 05 55 39 32 98', 1, 53),
(179, '2023-03-10 16:46:23', 'Site web', '06 89 70 46 99 </br> 05 55 03 42 29 </br> 04 56 23 32 17', 0, 55),
(180, '2023-03-10 16:46:23', '29/04', 'Éric Roulhac <br> 141 Bis Av. de Limoges <br> 87270 Couzeix <br> 05 55 39 32 98', 1, 55),
(181, '2023-03-10 16:46:23', '5 mai 2023', 'Éric Roulhac <br> 141 Bis Av. de Limoges <br> 87270 Couzeix <br> 05 55 39 32 98', 1, 52),
(182, '2023-03-10 16:46:23', 'Site web', 'Éric Roulhac <br> 141 Bis Av. de Limoges <br> 87270 Couzeix <br> 05 55 39 32 98', 1, NULL),
(183, '2023-03-10 16:46:23', 'Liste de courses', 'Saint-Germain-les-Prés <br> Ligne 3', 1, 55),
(184, '2023-03-10 16:46:23', 'Rappels', 'Nicolas Jaar, Rival Consoles, Weval, Max Cooper, Daniel Avery, Boards of Canada, The Chemical Brothers, Todd Terje, Daniel Avery, The XX, Moderat, Superpoze, Rone, LCD Soundsystem...', 0, 52),
(185, '2023-03-10 16:46:23', 'Numéro de téléphone', 'Nicolas Jaar, Rival Consoles, Weval, Max Cooper, Daniel Avery, Boards of Canada, The Chemical Brothers, Todd Terje, Daniel Avery, The XX, Moderat, Superpoze, Rone, LCD Soundsystem...', 0, 53);

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
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`id`, `email`, `roles`, `password`, `username`) VALUES
(52, 'admin@todoandco.com', '[\"ROLE_ADMIN\", \"ROLE_USER\"]', '$2y$13$BB3jWyfbmEbgjOCiZTZyHuaEX0j78iECZzKNVX9.bMDNCCtTlOjFO', 'Admin'),
(53, 'user1@todoandco.com', '[\"ROLE_USER\"]', '$2y$13$ru83VymDaNkWKpSQ2CCGdef2doyf.Xjr/xScM3M6itRqjn0BsEbte', 'Utilisateur1'),
(54, 'user2@todoandco.com', '[\"ROLE_USER\"]', '$2y$13$J/lOi5MHELVeBj56KJ9jJO3SiAF1azVSCXVFePp4VlfRUy0ZA5VXy', 'Utilisateur2'),
(55, 'user3@todoandco.com', '[\"ROLE_USER\"]', '$2y$13$e8bpUQrFW.MZydTQZ0Ckbe2.4UvIEPhtL0A7gMle4C2BgXsBUL7RC', 'Utilisateur3');

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
