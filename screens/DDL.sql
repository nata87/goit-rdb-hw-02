-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema RDB_GOIT
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema RDB_GOIT
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `RDB_GOIT` DEFAULT CHARACTER SET utf8 ;
USE `RDB_GOIT` ;

-- -----------------------------------------------------
-- Table `RDB_GOIT`.`Client`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `RDB_GOIT`.`Client` (
  `id` INT NOT NULL,
  `lastname` VARCHAR(45) NOT NULL,
  `address` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `RDB_GOIT`.`Order`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `RDB_GOIT`.`Order` (
  `id` INT NOT NULL,
  `order_number` INT NOT NULL,
  `order_date` DATE NOT NULL,
  `id_client` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_order_user_idx` (`id_client` ASC) VISIBLE,
  UNIQUE INDEX `client_id_UNIQUE` (`id_client` ASC) VISIBLE,
  CONSTRAINT `fk_order_user`
    FOREIGN KEY (`id_client`)
    REFERENCES `RDB_GOIT`.`Client` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `RDB_GOIT`.`Product`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `RDB_GOIT`.`Product` (
  `id` INT NOT NULL,
  `product_name` VARCHAR(45) NOT NULL,
  `product_quantity` VARCHAR(45) NOT NULL,
  `id_order` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_order_product_idx` (`id_order` ASC) VISIBLE,
  CONSTRAINT `fk_order_product`
    FOREIGN KEY (`id_order`)
    REFERENCES `RDB_GOIT`.`Order` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
