-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : mer. 29 mars 2023 à 11:04
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
('DoctrineMigrations\\Version20230327094218', '2023-03-27 09:49:49', 67);

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
  `user_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_done` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_527EDB25A76ED395` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=186 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `task`
--

INSERT INTO `task` (`id`, `user_id`, `created_at`, `title`, `content`, `is_done`) VALUES
(156, 72, '2023-03-29 10:52:28', 'Réunion 17/03', 'L\'Étranger, Sapiens, Le Pouvoir du Moment Présent, Les quatre accords toltèques', 1),
(157, 70, '2023-03-29 10:52:28', '29/04', 'Sortir les poubelles <br> Promener le chien', 0),
(158, 69, '2023-03-29 10:52:28', 'Médecin', 'Nicolas Jaar, Rival Consoles, Weval, Max Cooper, Daniel Avery, Boards of Canada, The Chemical Brothers, Todd Terje, Daniel Avery, The XX, Moderat, Superpoze, Rone, LCD Soundsystem...', 0),
(159, 72, '2023-03-29 10:52:28', 'Métro', 'Aniversaire de Grégory', 0),
(160, 70, '2023-03-29 10:52:28', '29/04', 'L\'Étranger, Sapiens, Le Pouvoir du Moment Présent, Les quatre accords toltèques', 0),
(161, 69, '2023-03-29 10:52:28', 'Musique', 'www.senscritique.com <br> www.allocine.com <br> www.last.fm', 1),
(162, NULL, '2023-03-29 10:52:28', 'Livres à lire', 'Éric Roulhac <br> 141 Bis Av. de Limoges <br> 87270 Couzeix <br> 05 55 39 32 98', 1),
(163, 69, '2023-03-29 10:52:28', 'Liste de courses', '06 89 70 46 99 </br> 05 55 03 42 29 </br> 04 56 23 32 17', 1),
(164, 70, '2023-03-29 10:52:28', 'Médecin', 'Saint-Germain-les-Prés <br> Ligne 3', 0),
(165, 72, '2023-03-29 10:52:28', 'Métro', 'Saint-Germain-les-Prés <br> Ligne 3', 1),
(166, 72, '2023-03-29 10:52:28', 'Métro', 'Préparer la soutenance <br>', 1),
(167, 71, '2023-03-29 10:52:28', 'Médecin', '06 89 70 46 99 </br> 05 55 03 42 29 </br> 04 56 23 32 17', 1),
(168, NULL, '2023-03-29 10:52:28', 'Réunion 17/03', 'Nicolas Jaar, Rival Consoles, Weval, Max Cooper, Daniel Avery, Boards of Canada, The Chemical Brothers, Todd Terje, Daniel Avery, The XX, Moderat, Superpoze, Rone, LCD Soundsystem...', 1),
(169, 72, '2023-03-29 10:52:28', 'Numéro de téléphone', 'Éric Roulhac <br> 141 Bis Av. de Limoges <br> 87270 Couzeix <br> 05 55 39 32 98', 0),
(170, 72, '2023-03-29 10:52:28', '5 mai 2023', 'Nicolas Jaar, Rival Consoles, Weval, Max Cooper, Daniel Avery, Boards of Canada, The Chemical Brothers, Todd Terje, Daniel Avery, The XX, Moderat, Superpoze, Rone, LCD Soundsystem...', 0),
(171, 69, '2023-03-29 10:52:28', 'Musique', 'Sortir les poubelles <br> Promener le chien', 1),
(172, 72, '2023-03-29 10:52:28', '5 mai 2023', 'Sortir les poubelles <br> Promener le chien', 0),
(173, 70, '2023-03-29 10:52:28', 'Musique', '- Beurre </br> - Endives </br> - Poireau </br> - Bananes <br> - Carottes <br> - Champignons <br>', 0),
(174, 70, '2023-03-29 10:52:28', 'Numéro de téléphone', 'www.senscritique.com <br> www.allocine.com <br> www.last.fm', 0),
(175, 72, '2023-03-29 10:52:28', 'Rappels', '- Beurre </br> - Endives </br> - Poireau </br> - Bananes <br> - Carottes <br> - Champignons <br>', 1),
(176, 70, '2023-03-29 10:52:28', 'Numéro de téléphone', 'Nicolas Jaar, Rival Consoles, Weval, Max Cooper, Daniel Avery, Boards of Canada, The Chemical Brothers, Todd Terje, Daniel Avery, The XX, Moderat, Superpoze, Rone, LCD Soundsystem...', 0),
(177, 71, '2023-03-29 10:52:28', '5 mai 2023', '- Beurre </br> - Endives </br> - Poireau </br> - Bananes <br> - Carottes <br> - Champignons <br>', 1),
(178, 71, '2023-03-29 10:52:28', 'Musique', 'www.senscritique.com <br> www.allocine.com <br> www.last.fm', 0),
(179, 70, '2023-03-29 10:52:28', 'Musique', 'Saint-Germain-les-Prés <br> Ligne 3', 1),
(180, NULL, '2023-03-29 10:52:28', 'Rappels', 'Aniversaire de Grégory', 0),
(181, 71, '2023-03-29 10:52:28', 'Médecin', 'Préparer la soutenance <br>', 1),
(182, 72, '2023-03-29 10:52:28', 'Numéro de téléphone', 'Saint-Germain-les-Prés <br> Ligne 3', 0),
(183, 70, '2023-03-29 10:52:28', 'Rappels', 'Nicolas Jaar, Rival Consoles, Weval, Max Cooper, Daniel Avery, Boards of Canada, The Chemical Brothers, Todd Terje, Daniel Avery, The XX, Moderat, Superpoze, Rone, LCD Soundsystem...', 1),
(184, 70, '2023-03-29 10:52:28', '5 mai 2023', 'Aniversaire de Grégory', 1),
(185, 71, '2023-03-29 10:52:28', '5 mai 2023', '06 89 70 46 99 </br> 05 55 03 42 29 </br> 04 56 23 32 18', 1);

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
) ENGINE=InnoDB AUTO_INCREMENT=73 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`id`, `email`, `roles`, `password`, `username`) VALUES
(69, 'admin@todoandco.com', '[\"ROLE_ADMIN\", \"ROLE_USER\"]', '$2y$13$bWSwN/nlBXsoLXKmqu15V.nMdIuyXIvtfq2CVyAn/kN3bhWWvWRf2', 'Admin'),
(70, 'user1@todoandco.com', '[\"ROLE_USER\", \"ROLE_ADMIN\"]', '$2y$13$54gL5ABCxW2wkiadwt6s/OFJaLtML2hFNRJT1KdUEpB69KE.Wbcfu', 'Utilisateur1'),
(71, 'user2@todoandco.com', '[\"ROLE_USER\"]', '$2y$13$k9BBHh3wQbwGDm1/whzuX.clAB1UOvLeJW53Tt9/FFDobRV6A/6U2', 'Utilisateur2'),
(72, 'user3@todoandco.com', '[\"ROLE_USER\"]', '$2y$13$f13Xjjz1X5tcJHqwUjZDP..1CLdbiA5onQBARIhgCa.LonKC25Yri', 'Utilisateur3');

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
