-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : lun. 27 mars 2023 à 13:31
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
) ENGINE=InnoDB AUTO_INCREMENT=95 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `task`
--

INSERT INTO `task` (`id`, `user_id`, `created_at`, `title`, `content`, `is_done`) VALUES
(65, 15, '2023-03-27 11:30:20', 'Numéro de téléphone', '- Beurre </br> - Endives </br> - Poireau </br> - Bananes <br> - Carottes <br> - Champignons <br>', 0),
(66, 15, '2023-03-27 11:30:20', 'Réunion 17/03', 'Nicolas Jaar, Rival Consoles, Weval, Max Cooper, Daniel Avery, Boards of Canada, The Chemical Brothers, Todd Terje, Daniel Avery, The XX, Moderat, Superpoze, Rone, LCD Soundsystem...', 1),
(67, NULL, '2023-03-27 11:30:20', 'Musique', 'L\'Étranger, Sapiens, Le Pouvoir du Moment Présent, Les quatre accords toltèques', 0),
(68, 14, '2023-03-27 11:30:20', 'Numéro de téléphone', 'www.senscritique.com <br> www.allocine.com <br> www.last.fm', 1),
(69, 14, '2023-03-27 11:30:20', 'Liste de courses', 'www.senscritique.com <br> www.allocine.com <br> www.last.fm', 0),
(70, 13, '2023-03-27 11:30:20', 'Métro', 'Saint-Germain-les-Prés <br> Ligne 3', 0),
(71, 16, '2023-03-27 11:30:20', 'Métro', 'Aniversaire de Grégory', 0),
(72, NULL, '2023-03-27 11:30:20', 'Médecin', 'www.senscritique.com <br> www.allocine.com <br> www.last.fm', 1),
(73, 15, '2023-03-27 11:30:20', 'Site web', '- Beurre </br> - Endives </br> - Poireau </br> - Bananes <br> - Carottes <br> - Champignons <br>', 1),
(74, 14, '2023-03-27 11:30:20', '5 mai 2023', '- Beurre </br> - Endives </br> - Poireau </br> - Bananes <br> - Carottes <br> - Champignons <br>', 1),
(75, 15, '2023-03-27 11:30:20', 'Site web', '- Beurre </br> - Endives </br> - Poireau </br> - Bananes <br> - Carottes <br> - Champignons <br>', 0),
(76, 13, '2023-03-27 11:30:20', 'Liste de courses', 'Préparer la soutenance <br>', 0),
(77, NULL, '2023-03-27 11:30:20', 'Rappels', 'Saint-Germain-les-Prés <br> Ligne 3', 1),
(78, 16, '2023-03-27 11:30:20', '5 mai 2023', 'Préparer la soutenance <br>', 0),
(79, 15, '2023-03-27 11:30:20', 'Métro', 'Sorti les poubelles <br> Promener le chien', 1),
(80, 15, '2023-03-27 11:30:20', 'Réunion 17/03', 'Nicolas Jaar, Rival Consoles, Weval, Max Cooper, Daniel Avery, Boards of Canada, The Chemical Brothers, Todd Terje, Daniel Avery, The XX, Moderat, Superpoze, Rone, LCD Soundsystem...', 1),
(81, 14, '2023-03-27 11:30:20', 'Livres à lire', 'Nicolas Jaar, Rival Consoles, Weval, Max Cooper, Daniel Avery, Boards of Canada, The Chemical Brothers, Todd Terje, Daniel Avery, The XX, Moderat, Superpoze, Rone, LCD Soundsystem...', 1),
(82, 16, '2023-03-27 11:30:20', '29/04', 'Aniversaire de Grégory', 1),
(83, 15, '2023-03-27 11:30:20', 'Numéro de téléphone', 'Éric Roulhac <br> 141 Bis Av. de Limoges <br> 87270 Couzeix <br> 05 55 39 32 98', 0),
(84, 13, '2023-03-27 11:30:20', 'Liste de courses', 'L\'Étranger, Sapiens, Le Pouvoir du Moment Présent, Les quatre accords toltèques', 0),
(85, 16, '2023-03-27 11:30:20', 'Site web', 'Nicolas Jaar, Rival Consoles, Weval, Max Cooper, Daniel Avery, Boards of Canada, The Chemical Brothers, Todd Terje, Daniel Avery, The XX, Moderat, Superpoze, Rone, LCD Soundsystem...', 1),
(86, NULL, '2023-03-27 11:30:20', 'Livres à lire', 'Aniversaire de Grégory', 1),
(87, 13, '2023-03-27 11:30:20', 'Musique', 'Éric Roulhac <br> 141 Bis Av. de Limoges <br> 87270 Couzeix <br> 05 55 39 32 98', 1),
(88, 13, '2023-03-27 11:30:20', 'Réunion 17/03', '06 89 70 46 99 </br> 05 55 03 42 29 </br> 04 56 23 32 17', 1),
(89, NULL, '2023-03-27 11:30:20', 'Musique', '- Beurre </br> - Endives </br> - Poireau </br> - Bananes <br> - Carottes <br> - Champignons <br>', 1),
(90, 15, '2023-03-27 11:30:20', 'Livres à lire', '06 89 70 46 99 </br> 05 55 03 42 29 </br> 04 56 23 32 17', 0),
(91, 14, '2023-03-27 11:30:20', 'Métro', '06 89 70 46 99 </br> 05 55 03 42 29 </br> 04 56 23 32 17', 1),
(92, 15, '2023-03-27 11:30:20', 'Site web', '- Beurre </br> - Endives </br> - Poireau </br> - Bananes <br> - Carottes <br> - Champignons <br>', 1),
(93, 14, '2023-03-27 11:30:20', 'Site web', 'Éric Roulhac <br> 141 Bis Av. de Limoges <br> 87270 Couzeix <br> 05 55 39 32 98', 0),
(94, 13, '2023-03-27 11:30:20', 'Site web', 'Aniversaire de Grégory', 0);

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
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`id`, `email`, `roles`, `password`, `username`) VALUES
(13, 'admin@todoandco.com', '[\"ROLE_ADMIN\", \"ROLE_USER\"]', '$2y$13$J/bUYvhpwZMlNdIuuYv1huiq.c/CWN2uGAjiidCbSpJpYgxl.P4zO', 'Admin'),
(14, 'user1@todoandco.com', '[\"ROLE_USER\"]', '$2y$13$YyLCvyJ16D6F6Ojc4trISeLcipqRbgN3Jty67Vvy6VOZgRRTeWVP2', 'Utilisateur1'),
(15, 'user2@todoandco.com', '[\"ROLE_USER\"]', '$2y$13$aeLRjqs0hmGWD1QQgwKYa.qTniVpWOaujf0LPzGT.JWUXoIJeLzy2', 'Utilisateur2'),
(16, 'user3@todoandco.com', '[\"ROLE_USER\"]', '$2y$13$xv6l6KN83NAPUe2fx/ZsyuhKZAOo1wX.m35U2p2f6NWaWb.aRb4ey', 'Utilisateur3');

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
