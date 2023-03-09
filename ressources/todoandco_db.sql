-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : jeu. 09 mars 2023 à 17:57
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
('DoctrineMigrations\\Version20230303130937', '2023-03-03 13:09:40', 84);

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
  `author_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_527EDB25F675F31B` (`author_id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `task`
--

INSERT INTO `task` (`id`, `created_at`, `title`, `content`, `is_done`, `author_id`) VALUES
(69, '2023-03-04 16:35:32', '5/28', 'Nicolas Jaar, Rival Consoles, Weval, Max Cooper, Daniel Avery, Boards of Canada, The Chemical Brothers, Todd Terje, Daniel Avery, The XX, Moderat, Superpoze, Rone, LCD Soundsystem....', 1, 24),
(70, '2023-03-04 16:35:32', 'Livres à lire', 'Sorti les poubelles <br> Promener le chien', 0, 25),
(71, '2023-03-04 16:35:32', 'Médecin', '06 89 70 46 99 </br> 05 55 03 42 29 </br> 04 56 23 32 17', 0, 24),
(72, '2023-03-04 16:35:32', 'Site web', '- Beurre </br> - Endives </br> - Poireau </br> - Bananes <br> - Carottes <br> - Champignons <br>', 0, 25),
(73, '2023-03-04 16:35:32', 'Rappels', 'L\'Étranger, Sapiens, Le Pouvoir du Moment Présent, Les quatre accords toltèques', 1, NULL),
(74, '2023-03-04 16:35:32', 'Numéro de téléphone', 'Aniversaire de Grégory !', 0, NULL),
(75, '2023-03-04 16:35:32', 'Musique', 'Préparer la soutenance <br>', 0, 24),
(76, '2023-03-04 16:35:32', 'Métro', 'www.senscritique.com <br> www.allocine.com <br> www.last.fm', 0, 26),
(77, '2023-03-04 16:35:32', 'Numéro de téléphone', 'Aniversaire de Grégory', 0, 26),
(78, '2023-03-04 16:35:32', 'Liste de courses', 'Aniversaire de Grégory', 0, 26),
(79, '2023-03-04 16:35:32', 'Site web', 'Sorti les poubelles <br> Promener le chien', 0, NULL),
(80, '2023-03-04 16:35:32', 'Numéro de téléphone', 'Sorti les poubelles <br> Promener le chien', 0, 26),
(81, '2023-03-04 16:35:32', 'Réunion 03/23', 'L\'Étranger, Sapiens, Le Pouvoir du Moment Présent, Les quatre accords toltèques', 0, 24),
(82, '2023-03-04 16:35:32', 'Réunion 03/23', 'Éric Roulhac <br> 141 Bis Av. de Limoges <br> 87270 Couzeix <br> 05 55 39 32 98', 0, NULL),
(83, '2023-03-04 16:35:32', 'Rappels', 'Préparer la soutenance <br>', 0, NULL),
(84, '2023-03-04 16:35:32', 'Liste de courses', 'Saint-Germain-les-Prés <br> Ligne 3', 0, 24),
(87, '2023-03-04 16:35:32', 'Métro', 'Préparer la soutenance <br>', 0, 24),
(88, '2023-03-04 16:35:32', 'Réunion 03/23', '- Beurre </br> - Endives </br> - Poireau </br> - Bananes <br> - Carottes <br> - Champignons <br>', 0, 24),
(89, '2023-03-04 16:35:32', 'Numéro de téléphone', 'www.senscritique.com <br> www.allocine.com <br> www.last.fm', 0, 26),
(90, '2023-03-04 16:35:32', 'Site web', '- Beurre </br> - Endives </br> - Poireau </br> - Bananes <br> - Carottes <br> - Champignons <br>', 0, 23),
(91, '2023-03-04 16:35:32', 'Réunion 03/23', 'Aniversaire de Grégory', 0, 23),
(92, '2023-03-04 16:35:32', 'Médecin', 'Préparer la soutenance <br>', 0, 23),
(93, '2023-03-04 16:35:32', 'Rappels', '- Beurre </br> - Endives </br> - Poireau </br> - Bananes <br> - Carottes <br> - Champignons <br>', 0, 26),
(94, '2023-03-04 16:35:32', 'Livres à lire', 'L\'Étranger, Sapiens, Le Pouvoir du Moment Présent, Les quatre accords toltèques', 0, 24),
(95, '2023-03-04 16:35:32', 'Site web', '- Beurre </br> - Endives </br> - Poireau </br> - Bananes <br> - Carottes <br> - Champignons <br>', 0, 25),
(96, '2023-03-04 16:35:32', 'Réunion 03/23', 'Préparer la soutenance <br>', 0, 23),
(98, '2023-03-04 16:35:32', 'Métro', 'www.senscritique.com <br> www.allocine.com <br> www.last.fm <br> www.openclassrooms.com', 1, NULL),
(99, '2023-03-05 18:22:59', 'Titre de la tâche !', 'Contenu de la tâche ! <br> Le HTML est-il interprété ici ?', 0, 23),
(100, '2023-03-06 17:10:23', 'Tâches ménagères !', '- Laver le linge <br> - Faire la vaisselle <br> - Passer l\'aspirateur', 1, 27);

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
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`id`, `email`, `roles`, `password`, `username`) VALUES
(23, 'admin@todoandco.com', '[\"ROLE_ADMIN\", \"ROLE_USER\"]', '$2y$13$LICbsVwgf022U0tCW.NNxOF7Ar8aymXuRKAKLF4W0i/QU40UkOIyK', 'Admin'),
(24, 'user1@todoandco.com', '[\"ROLE_USER\", \"ROLE_ADMIN\"]', '$2y$13$sLkhrkPArzWEuVqFR/IzruTbkVC16gxyzM1v2avxbfcfXiTv32tom', 'User1'),
(25, 'user2@todoandco.com', '[\"ROLE_ADMIN\"]', '$2y$13$Yv4njFC/frw5OmCP9qSD2OMS4cpRfnVeMXfd7XIpaKnj5ZirSNnLO', 'Utilisateur2'),
(26, 'user3@todoandco.com', '[\"ROLE_USER\"]', '$2y$13$0ILfUD5RlL.QLga6tL6eBO8CsJ.BHmsg8fcEcvND/b0ypzNHJBovW', 'Utilisateur3'),
(27, 'user4@todoandco.com', '[\"ROLE_USER\"]', '$2y$13$6qEkxmqsDSX/l2NmOL4YE.TunV70Txd7iEYgXQTm.jnNMY59Enmse', 'Utilisateur4'),
(28, 'user5@todoandco.com', '[\"ROLE_USER\", \"ROLE_ADMIN\"]', '$2y$13$APGRpGTMesfXvK8X2yFeaeE2R4FSZMrgU6M3SIMaoNWUu8tws3VBa', 'Utilisateur5');

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `task`
--
ALTER TABLE `task`
  ADD CONSTRAINT `FK_527EDB25F675F31B` FOREIGN KEY (`author_id`) REFERENCES `user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
