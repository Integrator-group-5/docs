-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema luxury_wear_db_v2
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema luxury_wear_db_v2
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `luxury_wear_db_v2` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `luxury_wear_db_v2` ;

-- -----------------------------------------------------
-- Table `luxury_wear_db_v2`.`category`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `luxury_wear_db_v2`.`category` (
  `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(100) NOT NULL,
  `description` TEXT NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id` (`id` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `luxury_wear_db_v2`.`product`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `luxury_wear_db_v2`.`product` (
  `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(100) NOT NULL,
  `description` TEXT NULL DEFAULT NULL,
  `material` VARCHAR(100) NULL DEFAULT NULL,
  `color` VARCHAR(50) NULL DEFAULT NULL,
  `designer` VARCHAR(100) NULL DEFAULT NULL,
  `rental_price` DECIMAL(10,2) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id` (`id` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `luxury_wear_db_v2`.`image`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `luxury_wear_db_v2`.`image` (
  `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `url` VARCHAR(255) NOT NULL,
  `product_id` BIGINT UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id` (`id` ASC) VISIBLE,
  INDEX `fk_imagen_producto_idx` (`product_id` ASC) VISIBLE,
  CONSTRAINT `fk_imagen_producto`
    FOREIGN KEY (`product_id`)
    REFERENCES `luxury_wear_db_v2`.`product` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `luxury_wear_db_v2`.`size`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `luxury_wear_db_v2`.`size` (
  `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `size` VARCHAR(10) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id` (`id` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `luxury_wear_db_v2`.`product_has_category`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `luxury_wear_db_v2`.`product_has_category` (
  `product_id` BIGINT UNSIGNED NOT NULL,
  `category_id` BIGINT UNSIGNED NOT NULL,
  PRIMARY KEY (`product_id`, `category_id`),
  INDEX `fk_producto_has_categoria_categoria1_idx` (`category_id` ASC) VISIBLE,
  INDEX `fk_producto_has_categoria_producto1_idx` (`product_id` ASC) VISIBLE,
  CONSTRAINT `fk_producto_has_categoria_producto1`
    FOREIGN KEY (`product_id`)
    REFERENCES `luxury_wear_db_v2`.`product` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_producto_has_categoria_categoria1`
    FOREIGN KEY (`category_id`)
    REFERENCES `luxury_wear_db_v2`.`category` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `luxury_wear_db_v2`.`product_has_size`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `luxury_wear_db_v2`.`product_has_size` (
  `product_id` BIGINT UNSIGNED NOT NULL,
  `size_id` BIGINT UNSIGNED NOT NULL,
  PRIMARY KEY (`product_id`, `size_id`),
  INDEX `fk_producto_has_talla_talla1_idx` (`size_id` ASC) VISIBLE,
  INDEX `fk_producto_has_talla_producto1_idx` (`product_id` ASC) VISIBLE,
  CONSTRAINT `fk_producto_has_talla_producto1`
    FOREIGN KEY (`product_id`)
    REFERENCES `luxury_wear_db_v2`.`product` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_producto_has_talla_talla1`
    FOREIGN KEY (`size_id`)
    REFERENCES `luxury_wear_db_v2`.`size` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
