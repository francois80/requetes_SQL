-- RAPPEL --
-- ==========
-- SHOW DATABASES -> pour afficher les bases de données
-- USE nom_databbse -> pour utiliser une base de données
-- SHOW TABLES -> pour afficher les tables de la base de données
-- SHOW COLUMNS FROM nom_table -> pour afficher les colonnes d'une table
-- DESCRIBE nom_table -> description de la table (idem SHOW COLUMNS FROM nom_table)
-- DESC nom_table -> description de la table (idem SHOW COLUMNS FROM nom_table)
-- SHOW WARNIGS -> pour afficher les messages d'erreurs
-- RENAME TABLE table1 TO table2; -> renommer une table
-- CREATE -> Créer
-- ALTER -> modifier
-- DROP -> Supprimer
-- TRUNCATE -> pour vider une table

-- EXERCICES SQL PARTIE 4 à 6
-- ============================

-- PARTIE 4
-- Insérez les données suivantes dans la table languages de la base webDevelopment :
-- JavaScript, version 5
-- PHP, version 5.2
-- PHP, version 5.4
-- HTML, version 5.1
-- JavaScript, version 6
-- JavaScript, version 7
-- JavaScript, version 8
-- PHP, version 7
USE webDevelopment;
INSERT INTO `languages` (`language`, `version`) VALUES ('JavaScript', '5'),('PHP', '5.2'),('PHP', '5.4'),
('HTML', '5.1'),('JavaScript', '6'),('JavaScript', '7'),
('JavaScript', '8'),('PHP', '7');

-- Insérez les données suivantes dans la table frameworks de la base webDevelopment :
-- Symfony, version 2.8
-- Symfony, version 3
-- Jquery, version 1.6
-- Jquery, version 2.10
INSERT INTO `frameworks` (`framework`, `version`) VALUES ('Symfony', '2.8'), ('Symfony', '3'),
('Jquery', '1.6'), ('Jquery', '2.10');

-- PARTIE 5
-- Pour cette partie, utiliser la base de données webDevelopment
USE `webDevelopment`;

-- Dans la table languages, afficher toutes les données de la table.
SELECT * FROM `languages`;

-- Dans la table languages, afficher toutes les versions de PHP.
SELECT `language`, `version` FROM `languages` WHERE `language` = 'PHP';

-- Dans la table languages, afficher toutes les versions de PHP et de JavaScript.
SELECT `version` FROM `languages` WHERE `language`='PHP' OR `language`='JavaScript';

-- Dans la table languages, afficher toutes les lignes ayant pour id 3,5,7.
SELECT * FROM `languages` WHERE id='3' OR id='5' OR id='7';

-- Dans la table languages,afficher les deux première entrées de JavaScript.
SELECT * FROM `languages` WHERE `language` = 'JavaScript' LIMIT 2;

-- Dans la table languages, afficher toutes les lignes qui ne sont pas du PHP
SELECT `language`, `version` FROM `languages` WHERE `language`!='PHP';
-- WHERE `language` NOT 'PHP';
-- WHERE  `language` <> 'PHP';

-- Dans la table languages,afficher toutes les données par ordre alphabétique.
SELECT * FROM `languages` ORDER BY `language` ASC;

-- PARTIE 6
-- =========
-- SQL - Partie 6 : Sélection de données - Élargir les possibilités de la clause WHERE
-- Avant de commencer, exécutez le fichier SQL.
/*
CREATE TABLE `webDevelopment`.`ide` (
`id` SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
`name` VARCHAR(40) NOT NULL,
`version` VARCHAR(10) NOT NULL,
`date` DATE NOT NULL,
PRIMARY KEY (`id`)
)
ENGINE=INNODB;

INSERT INTO `webDevelopment`.`ide` (`name`, `version`, `date`) VALUES ('Eclipse', '3.3', '2007-06-01');
INSERT INTO `webDevelopment`.`ide` (`name`, `version`, `date`) VALUES ('Eclipse', '3.5', '2009-06-01');
INSERT INTO `webDevelopment`.`ide` (`name`, `version`, `date`) VALUES ('Eclipse', '3.6', '2010-06-01');
INSERT INTO `webDevelopment`.`ide` (`name`, `version`, `date`) VALUES ('Eclipse', '3.7', '2011-06-01');
INSERT INTO `webDevelopment`.`ide` (`name`, `version`, `date`) VALUES ('Eclipse', '4.3', '2013-06-13');
INSERT INTO `webDevelopment`.`ide` (`name`, `version`, `date`) VALUES ('NetBeans', '7', '2011-04-01');
INSERT INTO `webDevelopment`.`ide` (`name`, `version`, `date`) VALUES ('NetBeans', '8.2', '2016-10-03');
*/
USE webDevelopment;
-- Dans la table frameworks, afficher toutes les données de la table ayant une version 2.x (x étant un numéro quelconque).
SELECT * FROM `frameworks` WHERE `version` LIKE '2.%';

--  Dans la table frameworks, afficher toutes les lignes ayant pour id 1 et 3.
-- SELECT * FROM `frameworks` WHERE id = '1' OR id = '3';
SELECT * FROM `frameworks` WHERE `id` IN (1,3);

-- Dans la table ide, afficher toutes les lignes ayant une date comprise entre le premier janvier 2010 et le 31 decembre 2011.
-- SELECT `name`, `version`, `date` ,  FROM `ide` WHERE `date` BETWEEN '2010-01-01' AND '2011-12-31';
SELECT `name` AS 'IDE', DATE_FORMAT(`date`,'%d/%m/%Y') AS 'date de sortie' FROM `ide` WHERE `date` BETWEEN '2010-01-01' AND '2011-12-31';
