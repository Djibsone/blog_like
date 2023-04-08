-- phpMyAdmin SQL Dump
-- version 5.1.1deb5ubuntu1
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost:3306
-- Généré le : jeu. 23 mars 2023 à 18:04
-- Version du serveur : 8.0.32-0ubuntu0.22.04.2
-- Version de PHP : 8.1.2-1ubuntu2.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `blog`
--

-- --------------------------------------------------------

--
-- Structure de la table `comment`
--

CREATE TABLE `comment` (
  `id` int NOT NULL,
  `body` text COLLATE utf8mb4_swedish_ci NOT NULL,
  `author` int NOT NULL,
  `post` int NOT NULL,
  `is_reply` tinyint(1) NOT NULL DEFAULT '0',
  `comment` int DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_swedish_ci;

--
-- Déchargement des données de la table `comment`
--

INSERT INTO `comment` (`id`, `body`, `author`, `post`, `is_reply`, `comment`, `created_at`) VALUES
(1, 'je suis un programmeur', 2, 1, 0, NULL, '2023-03-22 16:59:33'),
(3, 'dolotytuio', 2, 1, 0, NULL, '2023-03-23 17:28:24'),
(4, 'je suis à la maison', 2, 1, 0, NULL, '2023-03-23 17:28:44');

-- --------------------------------------------------------

--
-- Structure de la table `like_post`
--

CREATE TABLE `like_post` (
  `id` int NOT NULL,
  `author` int NOT NULL,
  `post` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_swedish_ci;

-- --------------------------------------------------------

--
-- Structure de la table `post`
--

CREATE TABLE `post` (
  `id` int NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_swedish_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_swedish_ci NOT NULL,
  `body` text COLLATE utf8mb4_swedish_ci NOT NULL,
  `banner` varchar(255) COLLATE utf8mb4_swedish_ci NOT NULL,
  `author` int NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_swedish_ci;

--
-- Déchargement des données de la table `post`
--

INSERT INTO `post` (`id`, `title`, `slug`, `body`, `banner`, `author`, `created_at`) VALUES
(1, 'bienvenue sur le blog de l\'abassadeur', 'bienvenue-sur-le-blog-de-l-abassadeur', 'bienvenue sur le blog de l\'abassadeur\r\nbienvenue sur le blog de l\'abassadeur\r\nbienvenue sur le blog de l\'abassadeurbienvenue sur le blog de l\'abassadeurbienvenue sur le blog de l\'abassadeurbienvenue sur le blog de l\'abassadeurbienvenue sur le blog de l\'abassadeurbienvenue sur le blog de l\'abassadeurbienvenue sur le blog de l\'abassadeurbienvenue sur le blog de l\'abassadeur', 'app/media/0de1b2c5d4daba545722584b1d165bdf.jpg', 1, '2023-03-21 13:53:11'),
(2, 'bienvenue sur le blog de l\'abassadeur', 'bienvenue-sur-le-blog-de-l-abassadeur', 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Facilis qui placeat deleniti distinctio aut quisquam ab repudiandae dolorem exercitationem quo ipsa expedita, necessitatibus assumenda a, perspiciatis ullam minus? Nisi, repellendus.\r\nLorem ipsum dolor sit amet consectetur adipisicing elit. Neque, exercitationem. Tempora accusamus, praesentium excepturi ex nemo vel mollitia magnam inventore voluptatem facilis obcaecati delectus nihil dolor quia aliquam commodi laborum!', 'app/media/0de1b2c5d4daba545722584b1d165bdf.jpg', 1, '2023-03-21 13:56:01'),
(3, 'hdeqdioqd qeodjqodjqo oiqdlqwjdq sqoqdqn', 'hdeqdioqd-qeodjqodjqo-oiqdlqwjdq-sqoqdqn', 'hdeqdioqd qeodjqodjqo oiqdlqwjdq sqoqdqnhdeqdioqd qeodjqodjqo oiqdlqwjdq sqoqdqnhdeqdioqd qeodjqodjqo oiqdlqwjdq sqoqdqnhdeqdioqd qeodjqodjqo oiqdlqwjdq sqoqdqnhdeqdioqd qeodjqodjqo oiqdlqwjdq sqoqdqnhdeqdioqd qeodjqodjqo oiqdlqwjdq sqoqdqnhdeqdioqd qeodjqodjqo oiqdlqwjdq sqoqdqnhdeqdioqd qeodjqodjqo oiqdlqwjdq sqoqdqn', 'app/media/0b9ca181ad4bc1086509ff18a0772815.png', 1, '2023-03-21 14:17:32'),
(4, 'Diagramme de classe', 'Diagramme-de-classe', 'Un diagramme de classe pour les etudiants', 'app/media/diagr_Re.png', 2, '2023-03-22 12:00:42');

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

CREATE TABLE `user` (
  `id` int NOT NULL,
  `username` varchar(50) COLLATE utf8mb4_swedish_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_swedish_ci NOT NULL,
  `join_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_swedish_ci;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`id`, `username`, `password`, `join_at`) VALUES
(1, 'ptahemdjehuty', 'c6ffbf250f886ab82abcee9edede6f212946d9cd', '2023-03-21 11:34:23'),
(2, 'user', '40bd001563085fc35165329ea1ff5c5ecbdbbeef', '2023-03-22 11:45:44'),
(3, 'toni', '356a192b7913b04c54574d18c28d46e6395428ab', '2023-03-22 11:49:38');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `comment`
--
ALTER TABLE `comment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `post_comment` (`post`),
  ADD KEY `comment_author` (`author`),
  ADD KEY `comment_reply` (`comment`);

--
-- Index pour la table `like_post`
--
ALTER TABLE `like_post`
  ADD PRIMARY KEY (`id`),
  ADD KEY `post_like` (`post`),
  ADD KEY `like_author` (`author`);

--
-- Index pour la table `post`
--
ALTER TABLE `post`
  ADD PRIMARY KEY (`id`),
  ADD KEY `post_author` (`author`);

--
-- Index pour la table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `comment`
--
ALTER TABLE `comment`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `like_post`
--
ALTER TABLE `like_post`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `post`
--
ALTER TABLE `post`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `user`
--
ALTER TABLE `user`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `comment`
--
ALTER TABLE `comment`
  ADD CONSTRAINT `comment_author` FOREIGN KEY (`author`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `comment_reply` FOREIGN KEY (`comment`) REFERENCES `comment` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `post_comment` FOREIGN KEY (`post`) REFERENCES `post` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `like_post`
--
ALTER TABLE `like_post`
  ADD CONSTRAINT `like_author` FOREIGN KEY (`author`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `post_like` FOREIGN KEY (`post`) REFERENCES `like_post` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `post`
--
ALTER TABLE `post`
  ADD CONSTRAINT `post_author` FOREIGN KEY (`author`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
