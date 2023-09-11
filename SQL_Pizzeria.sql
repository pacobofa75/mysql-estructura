-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`Client`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Client` (
  `Id_Cliente` INT NOT NULL AUTO_INCREMENT,
  `Nombre` VARCHAR(45) NULL,
  `Apellido` VARCHAR(45) NULL,
  `Direccion` VARCHAR(45) NULL,
  `codigo_postal` INT NULL,
  `Localidad` VARCHAR(45) NULL,
  `Provicnia` VARCHAR(45) NULL,
  `Telefono` INT NULL,
  PRIMARY KEY (`Id_Cliente`))
ENGINE = InnoDB
COMMENT = '					';


-- -----------------------------------------------------
-- Table `mydb`.`Botiga`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Botiga` (
  `Id_botiga` INT NOT NULL AUTO_INCREMENT,
  `Direccion` VARCHAR(45) NULL,
  `Codigo_postal` INT NULL,
  `Localitat` VARCHAR(45) NULL,
  `Provincia` VARCHAR(45) NULL,
  PRIMARY KEY (`Id_botiga`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Empleat`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Empleat` (
  `Id_empleat` INT NOT NULL AUTO_INCREMENT,
  `Nombre` VARCHAR(45) NULL,
  `Apellido_1` VARCHAR(45) NULL,
  `Apellido_2` VARCHAR(45) NULL,
  `NIF` INT NULL,
  `Telefon` INT NULL,
  `Tipus` ENUM('cuiner', 'repartidor') NULL,
  PRIMARY KEY (`Id_empleat`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Producte`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Producte` (
  `ID_Producte` INT NOT NULL AUTO_INCREMENT,
  `Nombre` VARCHAR(45) NULL,
  `Descripcion` VARCHAR(45) NOT NULL,
  `Imagen` VARCHAR(45) NULL,
  `Precio` INT NULL,
  `Tipo` ENUM('pizza', 'hamburguesa', 'beguda') NULL,
  PRIMARY KEY (`ID_Producte`, `Descripcion`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Comanda`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Comanda` (
  `Id_comanda` INT NOT NULL AUTO_INCREMENT,
  `Fecha` DATE NULL,
  `Tipo1` ENUM('reparto', 'recoger') NULL,
  `Cantidad_productos` INT NULL,
  `Precio` INT NULL,
  `ID_cliente` INT NULL,
  `Tipo_Productos` ENUM('pizza', 'hamburguesa', 'beguda') NULL,
  `ID_botiga` INT NULL,
  `Id_empleado` INT NULL,
  `Producte_ID_Producte` INT NOT NULL,
  PRIMARY KEY (`Id_comanda`),
  INDEX `ID_Ccliente_idx` (`ID_cliente` ASC) VISIBLE,
  INDEX `ID_botiga_idx` (`ID_botiga` ASC) VISIBLE,
  INDEX `Id_empleado_idx` (`Id_empleado` ASC) VISIBLE,
  INDEX `fk_Comanda_Producte1_idx` (`Producte_ID_Producte` ASC) VISIBLE,
  CONSTRAINT `ID_Ccliente`
    FOREIGN KEY (`ID_cliente`)
    REFERENCES `mydb`.`Client` (`Id_Cliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `ID_botiga`
    FOREIGN KEY (`ID_botiga`)
    REFERENCES `mydb`.`Botiga` (`Id_botiga`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Id_empleado`
    FOREIGN KEY (`Id_empleado`)
    REFERENCES `mydb`.`Empleat` (`Id_empleat`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Comanda_Producte1`
    FOREIGN KEY (`Producte_ID_Producte`)
    REFERENCES `mydb`.`Producte` (`ID_Producte`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Categoria`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Categoria` (
  `Id_categoria` INT NOT NULL AUTO_INCREMENT,
  `Nombre` VARCHAR(45) NULL,
  PRIMARY KEY (`Id_categoria`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Pizza`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Pizza` (
  `Id_Pizza` INT NOT NULL AUTO_INCREMENT,
  `Nombre` VARCHAR(45) NULL,
  `Categoria` INT NULL,
  PRIMARY KEY (`Id_Pizza`),
  INDEX `Categoria_idx` (`Categoria` ASC) VISIBLE,
  CONSTRAINT `Categoria`
    FOREIGN KEY (`Categoria`)
    REFERENCES `mydb`.`Categoria` (`Id_categoria`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `mydb`.`Client`
-- -----------------------------------------------------
START TRANSACTION;
USE `mydb`;
INSERT INTO `mydb`.`Client` (`Id_Cliente`, `Nombre`, `Apellido`, `Direccion`, `codigo_postal`, `Localidad`, `Provicnia`, `Telefono`) VALUES (1, 'Paco', 'Bofa', 'Calle 1', 08001, 'Barcelona', 'Barcelona', 111111111);
INSERT INTO `mydb`.`Client` (`Id_Cliente`, `Nombre`, `Apellido`, `Direccion`, `codigo_postal`, `Localidad`, `Provicnia`, `Telefono`) VALUES (2, 'Luis', 'Garcia ', 'Calle 2', 08002, 'Barcelona', 'Barcelona', 222222222);
INSERT INTO `mydb`.`Client` (`Id_Cliente`, `Nombre`, `Apellido`, `Direccion`, `codigo_postal`, `Localidad`, `Provicnia`, `Telefono`) VALUES (3, 'Marco', 'Martin', 'Calle 3', 08003, 'Girona', 'Girona', 333333333);

COMMIT;


-- -----------------------------------------------------
-- Data for table `mydb`.`Botiga`
-- -----------------------------------------------------
START TRANSACTION;
USE `mydb`;
INSERT INTO `mydb`.`Botiga` (`Id_botiga`, `Direccion`, `Codigo_postal`, `Localitat`, `Provincia`) VALUES (1, 'Calle 21', 08001, 'Barcelona', 'Barcelona');
INSERT INTO `mydb`.`Botiga` (`Id_botiga`, `Direccion`, `Codigo_postal`, `Localitat`, `Provincia`) VALUES (2, 'Calle 32', 08002, 'Girona', 'Girona');
INSERT INTO `mydb`.`Botiga` (`Id_botiga`, `Direccion`, `Codigo_postal`, `Localitat`, `Provincia`) VALUES (3, 'Calle 43', 08001, 'Barcelona', 'Barcelona');

COMMIT;


-- -----------------------------------------------------
-- Data for table `mydb`.`Empleat`
-- -----------------------------------------------------
START TRANSACTION;
USE `mydb`;
INSERT INTO `mydb`.`Empleat` (`Id_empleat`, `Nombre`, `Apellido_1`, `Apellido_2`, `NIF`, `Telefon`, `Tipus`) VALUES (1, 'Luis', 'Garcia', 'Perez', 12312312A, 9301010101010, 'cuiner');
INSERT INTO `mydb`.`Empleat` (`Id_empleat`, `Nombre`, `Apellido_1`, `Apellido_2`, `NIF`, `Telefon`, `Tipus`) VALUES (2, 'Pedro', 'Marquez', 'Lopez', 52453456B, 9312312343, 'repartidor');
INSERT INTO `mydb`.`Empleat` (`Id_empleat`, `Nombre`, `Apellido_1`, `Apellido_2`, `NIF`, `Telefon`, `Tipus`) VALUES (3, 'Maria', 'Galindo', 'Fernandez', 12312312E, 9312312333, 'cuiner');

COMMIT;


-- -----------------------------------------------------
-- Data for table `mydb`.`Producte`
-- -----------------------------------------------------
START TRANSACTION;
USE `mydb`;
INSERT INTO `mydb`.`Producte` (`ID_Producte`, `Nombre`, `Descripcion`, `Imagen`, `Precio`, `Tipo`) VALUES (1, 'hawaiana', 'pizza de jamon y piña', NULL, 20, 'pìzza');
INSERT INTO `mydb`.`Producte` (`ID_Producte`, `Nombre`, `Descripcion`, `Imagen`, `Precio`, `Tipo`) VALUES (2, 'completa', 'hamburguesa con todo', NULL, 12, 'hamburguesa');
INSERT INTO `mydb`.`Producte` (`ID_Producte`, `Nombre`, `Descripcion`, `Imagen`, `Precio`, `Tipo`) VALUES (3, 'con gas', 'bebida con gas', NULL, 2, 'beguda');

COMMIT;


-- -----------------------------------------------------
-- Data for table `mydb`.`Comanda`
-- -----------------------------------------------------
START TRANSACTION;
USE `mydb`;
INSERT INTO `mydb`.`Comanda` (`Id_comanda`, `Fecha`, `Tipo1`, `Cantidad_productos`, `Precio`, `ID_cliente`, `Tipo_Productos`, `ID_botiga`, `Id_empleado`, `Producte_ID_Producte`) VALUES (1, '2022-06-12', 'reparto', 3, 30, 2, 'pizza', 2, 2, 1);
INSERT INTO `mydb`.`Comanda` (`Id_comanda`, `Fecha`, `Tipo1`, `Cantidad_productos`, `Precio`, `ID_cliente`, `Tipo_Productos`, `ID_botiga`, `Id_empleado`, `Producte_ID_Producte`) VALUES (2, '2021-08-05', 'recoger', 4, 25, 1, 'hamburguesa', 1, 1, 2);
INSERT INTO `mydb`.`Comanda` (`Id_comanda`, `Fecha`, `Tipo1`, `Cantidad_productos`, `Precio`, `ID_cliente`, `Tipo_Productos`, `ID_botiga`, `Id_empleado`, `Producte_ID_Producte`) VALUES (3, '2020-11-23', 'recoger', 1, 20, 3, 'beguda', 3, 3, 3);

COMMIT;


-- -----------------------------------------------------
-- Data for table `mydb`.`Categoria`
-- -----------------------------------------------------
START TRANSACTION;
USE `mydb`;
INSERT INTO `mydb`.`Categoria` (`Id_categoria`, `Nombre`) VALUES (1, 'Primavera');
INSERT INTO `mydb`.`Categoria` (`Id_categoria`, `Nombre`) VALUES (2, 'Verano');
INSERT INTO `mydb`.`Categoria` (`Id_categoria`, `Nombre`) VALUES (3, 'Otoño');
INSERT INTO `mydb`.`Categoria` (`Id_categoria`, `Nombre`) VALUES (4, 'Invierno');

COMMIT;


-- -----------------------------------------------------
-- Data for table `mydb`.`Pizza`
-- -----------------------------------------------------
START TRANSACTION;
USE `mydb`;
INSERT INTO `mydb`.`Pizza` (`Id_Pizza`, `Nombre`, `Categoria`) VALUES (1, 'Margarita', Basica);
INSERT INTO `mydb`.`Pizza` (`Id_Pizza`, `Nombre`, `Categoria`) VALUES (2, 'Barbacoa', Compuesta);
INSERT INTO `mydb`.`Pizza` (`Id_Pizza`, `Nombre`, `Categoria`) VALUES (3, 'Peperoni', Compuesta);

COMMIT;

