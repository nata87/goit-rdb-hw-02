-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema rbd_goit
-- -----------------------------------------------------
-- This schema was created for a stub table

-- -----------------------------------------------------
-- Schema rbd_goit
--
-- This schema was created for a stub table
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `rbd_goit` ;
-- -----------------------------------------------------
-- Schema rbd_goit_hw
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema rbd_goit_hw
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `rbd_goit_hw` DEFAULT CHARACTER SET utf8 ;
USE `rbd_goit` ;

-- -----------------------------------------------------
-- Table `rbd_goit`.`product`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `rbd_goit`.`product` (
  `id_product` INT NOT NULL,
  `product_name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_product`))
ENGINE = InnoDB;

USE `rbd_goit_hw` ;

-- -----------------------------------------------------
-- Table `rbd_goit_hw`.`client`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `rbd_goit_hw`.`client` (
  `id` INT NOT NULL,
  `lastname` VARCHAR(45) NOT NULL,
  `address` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `rbd_goit_hw`.`order`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `rbd_goit_hw`.`order` (
  `id` INT NOT NULL,
  `order_number` INT NOT NULL,
  `order_date` DATE NOT NULL,
  `id_client` INT NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `client_id_UNIQUE` (`id_client` ASC) VISIBLE,
  INDEX `fk_order_user_idx` (`id_client` ASC) VISIBLE,
  CONSTRAINT `fk_order_client`
    FOREIGN KEY (`id_client`)
    REFERENCES `rbd_goit_hw`.`client` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `rbd_goit_hw`.`product`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `rbd_goit_hw`.`product` (
  `id` INT NOT NULL,
  `id_product` INT NOT NULL,
  `product_name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `rbd_goit_hw`.`orderItem`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `rbd_goit_hw`.`orderItem` (
  `id` INT NOT NULL,
  `product_name` VARCHAR(45) NOT NULL,
  `product_quantity` INT NOT NULL,
  `id_order` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_order_product_idx` (`id_order` ASC) VISIBLE,
  CONSTRAINT `fk_order_product`
    FOREIGN KEY (`id_order`)
    REFERENCES `rbd_goit_hw`.`order` (`id`),
  CONSTRAINT `fk_orderItem_product`
    FOREIGN KEY (`id_order`)
    REFERENCES `rbd_goit_hw`.`product` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
