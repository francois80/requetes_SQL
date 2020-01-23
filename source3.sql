-- SQL - Partie 7
-- ===============
-- Suppression et modification de données

-- Dans la table languages, supprimer toutes les lignes parlant de HTML.
USE `webDevelopment`;
-- DELETE FROM `languages` WHERE `language` = 'HTML';
DELETE FROM `languages` WHERE `language` LIKE '%HTML%';

-- Dans la table frameworks, modifier toutes les lignes ayant le framework Symfony par Symfony2
UPDATE `frameworks` SET `framework` = 'Symfony2' WHERE framework = 'Symfony';

-- Dans la table languages, modifier la ligne du langage JavaScript version 5 par la version 5.1
ALTER TABLE `webDevelopment`.`languages` MODIFY `version` DECIMAL(5,2);
UPDATE `languages` SET `version` = '5.1' WHERE `language` = 'JavaScript' AND `version` = '5';


-- SQL - PARTIE 8
-- ==============
--  Les jointures
-- Effaace la base
DROP DATABASE IF EXISTS `development`;
-- Création de la base
CREATE DATABASE IF NOT EXISTS `development`;
-- On se positione dans la base nouvellement créé
USE `development`;
-- Création de la table languages
CREATE TABLE IF NOT EXISTS `languages` (
`id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
`name` VARCHAR(40) NOT NULL,
PRIMARY KEY (`id`)
)ENGINE=INNODB;
-- Création de la table frameworks qui contient une clé étrangère
CREATE TABLE IF NOT EXISTS `frameworks` (
`id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
`name` VARCHAR(40) NOT NULL,
`languagesId` INT UNSIGNED NOT NULL,
PRIMARY KEY (`id`),
-- ajout cle etrangere
CONSTRAINT k_languages_id FOREIGN KEY(`languagesId`) REFERENCES `languages`(`id`)
)ENGINE=INNODB;
-- Insertion des données dans la table languages
INSERT INTO `languages` (`name`) VALUES ('Assembleur');
INSERT INTO `languages` (`name`) VALUES ('C');
INSERT INTO `languages` (`name`) VALUES ('C++');
INSERT INTO `languages` (`name`) VALUES ('Java');
INSERT INTO `languages` (`name`) VALUES ('HTML');
INSERT INTO `languages` (`name`) VALUES ('CSS');
INSERT INTO `languages` (`name`) VALUES ('JavaScript');
INSERT INTO `languages` (`name`) VALUES ('PHP');
INSERT INTO `languages` (`name`) VALUES ('C#');
INSERT INTO `languages` (`name`) VALUES ('VB');
INSERT INTO `languages` (`name`) VALUES ('Python');
INSERT INTO `languages` (`name`) VALUES ('Ruby');
INSERT INTO `languages` (`name`) VALUES ('Swift');
-- Insertion des données dans la table frameworks
INSERT INTO `frameworks` (`name`,`languagesId`) VALUES ('Qt',3);
INSERT INTO `frameworks` (`name`,`languagesId`) VALUES ('SDK Android',4);
INSERT INTO `frameworks` (`name`,`languagesId`) VALUES ('Bootstrap',6);
INSERT INTO `frameworks` (`name`,`languagesId`) VALUES ('Foundation',6);
INSERT INTO `frameworks` (`name`,`languagesId`) VALUES ('KNACSS',6);
INSERT INTO `frameworks` (`name`,`languagesId`) VALUES ('Avalanche',6);
INSERT INTO `frameworks` (`name`,`languagesId`) VALUES ('Miligram',6);
INSERT INTO `frameworks` (`name`,`languagesId`) VALUES ('Skeleton',6);
INSERT INTO `frameworks` (`name`,`languagesId`) VALUES ('Hoisin',6);
INSERT INTO `frameworks` (`name`,`languagesId`) VALUES ('Inuit',6);
INSERT INTO `frameworks` (`name`,`languagesId`) VALUES ('Mimic',6);
INSERT INTO `frameworks` (`name`,`languagesId`) VALUES ('Ministrap',6);
INSERT INTO `frameworks` (`name`,`languagesId`) VALUES ('Lotus',6);
INSERT INTO `frameworks` (`name`,`languagesId`) VALUES ('Jquery',7);
INSERT INTO `frameworks` (`name`,`languagesId`) VALUES ('Angular',7);
INSERT INTO `frameworks` (`name`,`languagesId`) VALUES ('ReactJS',7);
INSERT INTO `frameworks` (`name`,`languagesId`) VALUES ('Vue.js',7);
INSERT INTO `frameworks` (`name`,`languagesId`) VALUES ('Ember.js',7);
INSERT INTO `frameworks` (`name`,`languagesId`) VALUES ('Meteor.js',7);
INSERT INTO `frameworks` (`name`,`languagesId`) VALUES ('Laravel',8);
INSERT INTO `frameworks` (`name`,`languagesId`) VALUES ('Symfony',8);
INSERT INTO `frameworks` (`name`,`languagesId`) VALUES ('CodeIgniter',8);
INSERT INTO `frameworks` (`name`,`languagesId`) VALUES ('Yii',8);
INSERT INTO `frameworks` (`name`,`languagesId`) VALUES ('Phalcon',8);
INSERT INTO `frameworks` (`name`,`languagesId`) VALUES ('Lumen',8);
INSERT INTO `frameworks` (`name`,`languagesId`) VALUES ('Silex',8);
INSERT INTO `frameworks` (`name`,`languagesId`) VALUES ('Slim',8);
INSERT INTO `frameworks` (`name`,`languagesId`) VALUES ('.NET',9);
INSERT INTO `frameworks` (`name`,`languagesId`) VALUES ('.NET',10);
INSERT INTO `frameworks` (`name`,`languagesId`) VALUES ('Django',11);
INSERT INTO `frameworks` (`name`,`languagesId`) VALUES ('Ruby On Rails',12);

-- Afficher tous les frameworks associés à leurs langages. Si un langage n'a pas de framework l'afficher aussi.
SELECT f.name nom_framework, l.name language FROM `frameworks` f RIGHT JOIN `languages` l ON l.id = f.languagesId;

-- Afficher tous les frameworks associés à leurs langages. Si un langage n'a pas de framework ne pas l'afficher.
SELECT f.name nom_framework, l.name language FROM `frameworks` f INNER JOIN `languages` l ON  l.id = f.languagesId;

-- Afficher le nombre de framework qu'a un langage.
SELECT languages.name AS `language`, COUNT(frameworks.Id) AS `number_framework`
FROM `languages`
LEFT JOIN `frameworks`
ON languages.id = `languagesId`
GROUP BY languages.name;

-- Afficher les langages ayant plus de 3 frameworks.
SELECT l.name AS `language`
FROM `languages` AS `l`
RIGHT JOIN `frameworks` AS `f`
ON l.id = f.`languagesId`
GROUP BY l.name
HAVING COUNT(f.id) > 3;
