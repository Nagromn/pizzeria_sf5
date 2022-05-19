-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : jeu. 19 mai 2022 à 07:30
-- Version du serveur :  5.7.31
-- Version de PHP : 7.4.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `pizzeria`
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
('DoctrineMigrations\\Version20210910120801', '2021-09-10 12:12:21', 100),
('DoctrineMigrations\\Version20210910122419', '2021-09-10 12:24:40', 151),
('DoctrineMigrations\\Version20210914080317', '2021-09-14 08:13:52', 807),
('DoctrineMigrations\\Version20210914085246', '2021-09-14 08:52:59', 293),
('DoctrineMigrations\\Version20210914085529', '2021-09-14 08:55:43', 258),
('DoctrineMigrations\\Version20210917103056', '2021-09-17 10:31:15', 559),
('DoctrineMigrations\\Version20210917125241', '2021-09-17 12:52:52', 584);

-- --------------------------------------------------------

--
-- Structure de la table `order`
--

DROP TABLE IF EXISTS `order`;
CREATE TABLE IF NOT EXISTS `order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `tva` double NOT NULL,
  `total` double NOT NULL,
  `discount` double NOT NULL,
  `delivery` double DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_F5299398A76ED395` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `order`
--

INSERT INTO `order` (`id`, `date`, `tva`, `total`, `discount`, `delivery`, `user_id`) VALUES
(1, '2021-09-17', 10, 40, 5, NULL, 4),
(2, '2021-09-17', 10, 40, 5, NULL, 4),
(3, '2021-09-17', 10, 40, 5, NULL, 4),
(4, '2021-09-17', 10, 40, 5, NULL, 4),
(5, '2021-09-17', 10, 40, 5, NULL, 4),
(6, '2021-09-17', 10, 40, 5, 10, 4),
(7, '2021-09-19', 10, 40, 5, 10, 4);

-- --------------------------------------------------------

--
-- Structure de la table `order_product`
--

DROP TABLE IF EXISTS `order_product`;
CREATE TABLE IF NOT EXISTS `order_product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_order_id` int(11) NOT NULL,
  `id_product_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_2530ADE6DD4481AD` (`id_order_id`),
  KEY `IDX_2530ADE6E00EE68D` (`id_product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `product`
--

DROP TABLE IF EXISTS `product`;
CREATE TABLE IF NOT EXISTS `product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `is_famous` tinyint(1) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` double NOT NULL,
  `quantity` int(11) NOT NULL,
  `photo` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `categorie` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `product`
--

INSERT INTO `product` (`id`, `is_famous`, `name`, `description`, `price`, `quantity`, `photo`, `categorie`) VALUES
(1, 0, 'Salmone', 'Crème mascarpone citronnée, mozzarella, saumon fumé, coulis de basilic, feuilles de basilic', 14.9, 0, '1_salmone.png', 'pizza'),
(18, NULL, 'Vesuvio', 'Sauce tomate, mozzarella, merguez de bœuf et mouton, spianata piccante*, poivrons marinés, œuf', 11.9, 0, '3_vesuvio.png', 'pizza'),
(19, NULL, 'Pizza Nutella', 'Crème mascarpone, Nutella', 5.9, 0, '11_pizza_nutella.png', 'dessert'),
(20, NULL, 'Tiramisù Nutella', 'Biscuits imbibés de liqueur de café, crème mascarpone parfumée au marsala (alcool italien)', 6.9, 0, '12_tiramisu_nutella.png', 'dessert'),
(21, NULL, 'Café gourmand', 'Quatre mini-douceurs à déguster avec un espresso (existe aussi avec un thé ou un café décaféiné)', 6.9, 0, '13_café_gourmand.png', 'dessert'),
(22, NULL, 'Trio de panna cotta', 'Coulis de fruits rouges, lait caramélisé et sauce au chocolat', 5.5, 0, '14_trio_panna_cotta.png', 'dessert'),
(23, NULL, 'Tarte au citron meringuée', 'Au citron de Sicile', 6.5, 0, '15_tarte_citron.png', 'dessert'),
(24, NULL, 'Tiramisù abricot', 'Biscuits imbibés de miel, mousse mascarpone à la coco, purée d\'abricot, abricot', 6.9, 0, '17_tiramisu_abricotpng.png', 'dessert'),
(25, NULL, 'Moelleux au chocolat', 'Accompagné de lait caramélisé', 4.6, 0, '16_moelleux_chocolat.png', 'dessert');

-- --------------------------------------------------------

--
-- Structure de la table `product_order`
--

DROP TABLE IF EXISTS `product_order`;
CREATE TABLE IF NOT EXISTS `product_order` (
  `product_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  PRIMARY KEY (`product_id`,`order_id`),
  KEY `IDX_5475E8C44584665A` (`product_id`),
  KEY `IDX_5475E8C48D9F6D38` (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(180) COLLATE utf8mb4_unicode_ci NOT NULL,
  `roles` longtext COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '(DC2Type:json)',
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lastname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `firstname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` int(11) NOT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_8D93D649E7927C74` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`id`, `email`, `roles`, `password`, `lastname`, `firstname`, `phone`, `address`) VALUES
(2, 'marwagbs1@gmail.com', ' [\"ROLE_ADMIN\"]', '$2y$13$npmH3VM.cExTJxXjqXfZ1OmIsJ15PsKRcOTNExmA6ZnZjQ/h8Kn2i', 'GHEDAMSSI', 'Marwa', 0, '7 rue du souvenir'),
(4, 'anthodov@hotmail.fr', '[]', '$2y$13$LM3j/aREW9IC.dYPxl.CVuZ61kKJyAlfX0vATs30/lXi7uWQGDOCW', 'DOVETTA', 'Anthony', 0, 'dfbhddddsjkwdkslfh'),
(5, 'rudy@gmail.com', '[]', '$2y$13$TXJ9E00puO3cEulG9HXF5.jh7VxLHERHmqO6NKnBZ3ETSgIF7g0t6', 'starck', 'rudy', 0, 'dsgqsfhwh');

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `order`
--
ALTER TABLE `order`
  ADD CONSTRAINT `FK_F5299398A76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Contraintes pour la table `order_product`
--
ALTER TABLE `order_product`
  ADD CONSTRAINT `FK_2530ADE6DD4481AD` FOREIGN KEY (`id_order_id`) REFERENCES `order` (`id`),
  ADD CONSTRAINT `FK_2530ADE6E00EE68D` FOREIGN KEY (`id_product_id`) REFERENCES `product` (`id`);

--
-- Contraintes pour la table `product_order`
--
ALTER TABLE `product_order`
  ADD CONSTRAINT `FK_5475E8C44584665A` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_5475E8C48D9F6D38` FOREIGN KEY (`order_id`) REFERENCES `order` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
