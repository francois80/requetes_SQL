-- EXERCICES SQL PARTIE 1 à 3
-- ===========================

--  PARTIE 1
--  Créer une base de données languages.
CREATE DATABASE `languages`;
-- Créer une base de données webDevelopment avec l’encodage UTF-8.
CREATE DATABASE `webDevelopment` CHARACTER SET 'utf8';
-- Créer une base de données frameworks avec l’encodage UTF-8 si elle n’existe pas.
CREATE DATABASE IF NOT EXISTS `frameworks` CHARACTER SET 'utf8';
-- Créer une base de données languages avec l’encodage UTF-8 si elle n’existe pas.
CREATE DATABASE IF NOT EXISTS `languages` CHARACTER SET 'utf8';
-- Supprimer la base de données languages.
DROP DATABASE `languages`;
-- Supprimer la base de données frameworks si elle existe.
DROP DATABASE IF EXISTS `frameworks`;
-- Supprimer la base de données languages si elle existe.
DROP DATABASE IF EXISTS `languages`;

--  PARTIE 2
-- Dans la base de données webDevelopment, créer la table languages avec les colonnes :
-- id (type INT, auto-incrémenté, clé primaire)
-- language (type VARCHAR)
USE webDevelopment;
CREATE TABLE IF NOT EXISTS `languages` (
    `id` INT  UNSIGNED NOT NULL AUTO_INCREMENT,
    `language` VARCHAR(60) NOT NULL,
    -- PRIMARY KEY(`id`)
    CONSTRAINT PK_id PRIMARY KEY(`id`) -- contrainte de la clé primaire (obligayion de respecter)
);
-- Dans la base de données webDevelopment, créer la table tools avec les colonnes suivantes :
-- id (type INT, auto-incrémenté, clé primaire)
-- tool (type VARCHAR)
CREATE TABLE IF NOT EXISTS `tools`(
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `tool` VARCHAR(60) NOT NULL,
  CONSTRAINT PK_id PRIMARY KEY(`id`)
);
-- Dans la base de données webDevelopment, créer la table frameworks avec les colonnes suivantes :
-- id (type INT, auto-incrémenté, clé primaire)
-- name (type VARCHAR)
CREATE TABLE IF NOT EXISTS `frameworks`(
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(60),
  CONSTRAINT PK_id PRIMARY KEY(`id`)
);
-- Dans la base de données webDevelopment, créer la table libraries avec les colonnes suivantes :
-- id (type INT, auto-incrémenté, clé primaire)
-- library (type VARCHAR)
CREATE TABLE IF NOT EXISTS `libraries`(
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `library` VARCHAR(60),
  CONSTRAINT PK_id PRIMARY KEY(`id`)
);
-- Dans la base de données webDevelopment, créer la table ide avec les colonnes suivantes :
-- id (type INT, auto-incrémenté, clé primaire)
-- ideName (type VARCHAR)
CREATE TABLE IF NOT EXISTS `ide`(
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `ideName` VARCHAR(60),
  CONSTRAINT PK_id PRIMARY KEY(`id`)
);
-- Dans la base de données webDevelopment, créer, si elle n' existe pas, la table frameworks avec les colonnes suivantes :
-- id (type INT, auto-incrémenté, clé primaire)
-- name (type VARCHAR)
CREATE TABLE IF NOT EXISTS `frameworks`(
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(60),
  CONSTRAINT PK_id PRIMARY KEY(`id`)
);
-- Supprimer la table tools si elle existe
DROP TABLE IF EXISTS `tools`;
-- Supprimer la table libraries
DROP TABLE IF EXISTS `libraries`;
-- Supprimer la table ide
DROP TABLE IF EXISTS `ide`;

--  TP
-- Créer la base codex. Y créer une table clients qui aura comme colonnes :
-- id 	INT 	Auto-incrémenté, clé primaire
-- lastname 	VARCHAR
-- firstname 	VARCHAR
-- birthDate 	DATE
-- address 	VARCHAR
-- firstPhoneNumber 	INT
-- secondPhoneNumber 	INT
-- mail 	VARCHAR
CREATE DATABASE IF NOT EXISTS `codex` CHARACTER SET "utf8"; -- na pas oublier l'encodage de la table
USE codex;
CREATE TABLE IF NOT EXISTS `clients`(
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `lastname` VARCHAR(60),
  `firstname` VARCHAR(60),
  `birthDate` DATE,
  `address` VARCHAR(100),
  `firstPhoneNumber` INT,
  `secondPhoneNumber` INT,
  `mail` VARCHAR(100),
  CONSTRAINT PK_id PRIMARY KEY(`id`)
)
ENGINE = INNODB; -- moteur de table MyISAM ou INNODB

--  PARTIE 3
-- Dans la base de données webDevelopment, ajouter à la table languages une colonne versions (VARCHAR)
ALTER TABLE `webDevelopment`.`languages` ADD (`versions` VARCHAR(5));
-- Dans la base de données webDevelopment, ajouter à la table frameworks une colonne version (INT).
ALTER TABLE `webDevelopment`.`frameworks` ADD (`version` INT);
-- Dans la base de données webDevelopment, dans la table languages renommer la colonne versions en version.
ALTER TABLE `webDevelopment`.`languages` CHANGE `versions` `version` VARCHAR(5);
-- Dans la base de données webDevelopment, dans la table frameworks, renommer la colonne name en framework.
ALTER TABLE `webDevelopment`.`frameworks` CHANGE `name` `framework` VARCHAR(60);
-- Dans la base de données webDevelopment, dans la table frameworks changer le type de la colonne version en VARCHAR de taille 10.
ALTER TABLE `webDevelopment`.`frameworks` MODIFY `version` VARCHAR(10);

--  TP
-- Dans la base codex, dans la table clients :
-- supprimer la colonne secondPhoneNumber
-- renommer la colonne firstPhoneNumber en phoneNumber
-- changer le type de la colonne phoneNumber en VARCHAR
-- ajouter les colonnes zipCode(VARCHAR) et city(VARCHAR)
USE `codex`;
ALTER TABLE `clients` DROP COLUMN `secondPhoneNumber`;
ALTER TABLE `clients` CHANGE `firstPhoneNumber` `phoneNumber` INT;
-- ALTER TABLE `clients` RENAME COLUMN `firstPhoneNumber` TO `phoneNumber`; -- autre façon de renommer une colonne
ALTER TABLE `clients` MODIFY `phoneNumber` VARCHAR(10);
ALTER TABLE `clients` ADD (`zipCode` VARCHAR(6), `city` VARCHAR(40));
