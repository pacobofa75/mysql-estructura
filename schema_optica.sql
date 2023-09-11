-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema OPTICA_CUL_DAMPOLLA
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema OPTICA_CUL_DAMPOLLA
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `OPTICA_CUL_DAMPOLLA` DEFAULT CHARACTER SET utf8 ;
USE `OPTICA_CUL_DAMPOLLA` ;

-- -----------------------------------------------------
-- Table `OPTICA_CUL_DAMPOLLA`.`Marcas_Gafas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `OPTICA_CUL_DAMPOLLA`.`Marcas_Gafas` (
  `id_marca` INT NOT NULL AUTO_INCREMENT,
  `Nombre` VARCHAR(45) NULL,
  PRIMARY KEY (`id_marca`),
  CONSTRAINT `id_marca`
    FOREIGN KEY (`id_marca`)
    REFERENCES `OPTICA_CUL_DAMPOLLA`.`Gafas` (`id_marca`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `OPTICA_CUL_DAMPOLLA`.`Gafas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `OPTICA_CUL_DAMPOLLA`.`Gafas` (
  `id_gafas` INT NOT NULL AUTO_INCREMENT,
  `id_proveedor` INT NULL,
  `id_marca` INT NULL,
  `graduacion` VARCHAR(45) NULL,
  `tipo:montura` ENUM('flotante', ' pasta', 'metalica') NULL,
  `color_motura` VARCHAR(45) NULL,
  `color_cristales` VARCHAR(45) NULL,
  `precio` VARCHAR(45) NULL,
  PRIMARY KEY (`id_gafas`),
  INDEX `id_proveedor_idx` (`id_proveedor` ASC) VISIBLE,
  INDEX `id_marca_idx` (`id_marca` ASC) VISIBLE,
  CONSTRAINT `id_proveedor`
    FOREIGN KEY (`id_proveedor`)
    REFERENCES `OPTICA_CUL_DAMPOLLA`.`Proveedores` (`id_Proveedor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `id_marca`
    FOREIGN KEY (`id_marca`)
    REFERENCES `OPTICA_CUL_DAMPOLLA`.`Marcas_Gafas` (`id_marca`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `OPTICA_CUL_DAMPOLLA`.`Proveedores`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `OPTICA_CUL_DAMPOLLA`.`Proveedores` (
  `id_Proveedor` INT NOT NULL AUTO_INCREMENT,
  `nombre_proveedor` VARCHAR(45) NULL,
  `direccion_proveedor` VARCHAR(45) NULL,
  `telefono_proveedor` INT NULL,
  `fax_proveedor` INT NULL,
  `NIF_proveedor` INT NULL,
  `Gafas_id_gafas` INT NOT NULL,
  PRIMARY KEY (`id_Proveedor`, `Gafas_id_gafas`),
  INDEX `fk_PROVEEDORES_Gafas_idx` (`Gafas_id_gafas` ASC) VISIBLE,
  CONSTRAINT `fk_PROVEEDORES_Gafas`
    FOREIGN KEY (`Gafas_id_gafas`)
    REFERENCES `OPTICA_CUL_DAMPOLLA`.`Gafas` (`id_gafas`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `OPTICA_CUL_DAMPOLLA`.`Clientes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `OPTICA_CUL_DAMPOLLA`.`Clientes` (
  `id_cliente` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NULL,
  `direccion` VARCHAR(45) NULL,
  `telefono` INT NULL,
  `email` VARCHAR(45) NULL,
  `fecha_registro` DATE NULL,
  `ventas_id_ventas` INT NOT NULL,
  PRIMARY KEY (`id_cliente`, `ventas_id_ventas`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `OPTICA_CUL_DAMPOLLA`.`Ventas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `OPTICA_CUL_DAMPOLLA`.`Ventas` (
  `id_ventas` INT NOT NULL AUTO_INCREMENT,
  `id_gafas` INT NULL,
  `id_cliente` INT NULL,
  `id_empleado` INT NULL,
  `fecha_venta` DATE NULL,
  PRIMARY KEY (`id_ventas`),
  INDEX `id_cliente_idx` (`id_cliente` ASC) VISIBLE,
  INDEX `id_empleado_idx` (`id_empleado` ASC) VISIBLE,
  INDEX `id_gafas_idx` (`id_gafas` ASC) VISIBLE,
  CONSTRAINT `id_cliente`
    FOREIGN KEY (`id_cliente`)
    REFERENCES `OPTICA_CUL_DAMPOLLA`.`Clientes` (`id_cliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `id_gafas`
    FOREIGN KEY (`id_gafas`)
    REFERENCES `OPTICA_CUL_DAMPOLLA`.`Gafas` (`id_gafas`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `id_empleado`
    FOREIGN KEY (`id_empleado`)
    REFERENCES `OPTICA_CUL_DAMPOLLA`.`Empleados` (`id_empleado`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `OPTICA_CUL_DAMPOLLA`.`Empleados`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `OPTICA_CUL_DAMPOLLA`.`Empleados` (
  `id_empleado` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NULL,
  `ventas_id_ventas` INT NOT NULL,
  PRIMARY KEY (`id_empleado`, `ventas_id_ventas`),
  INDEX `fk_empleados_ventas1_idx` (`ventas_id_ventas` ASC) VISIBLE,
  CONSTRAINT `fk_empleados_ventas1`
    FOREIGN KEY (`ventas_id_ventas`)
    REFERENCES `OPTICA_CUL_DAMPOLLA`.`Ventas` (`id_ventas`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

INSERT INTO Clientes VALUES ('1','Juan', 'Calle 1', '1234567890', 'juan@example.com', '2020' );
INSERT INTO Clientes VALUES ('2','Pedro', 'Calle 2', '3456789012', 'pedro@example.com', '2021' );
INSERT INTO Clientes VALUES ('3','Maria', 'Calle 3', '2343456789', 'mariaexample.com', '2022' );

INSERT INTO Gafas values ('1', '3', 'metal', 'rojo', 'oscuros', '50€');
INSERT INTO Gafas values ('2', '2', 'metal', 'verde', 'oscuros', '40€');
INSERT INTO Gafas values ('3', '4', 'metal', 'amarillo', 'normales', '70€');

INSERT INTO Empleados values ('1', 'Paco');
INSERT INTO Empleados values ('2', 'Luis');
INSERT INTO Empleados values ('3', 'Pedro');

INSERT INTO Proveedores VALUES ('1', 'Gafas Buenas', 'Calle 11', '2343236345', '123451345', 'A123123123' );
INSERT INTO Proveedores VALUES ('2', 'Gafas Mejores', 'Calle 22', '23498976345', '122345345', 'A123123456' );
INSERT INTO Proveedores VALUES ('3', 'Gafas Super', 'Calle 33', '23430900945', '123452342', 'A12312309090' );

INSERT INTO Marcas_Gafas VALUES ('1', 'Ray-Ban' );
INSERT INTO Marcas_Gafas VALUES ('2', 'Hugo Boss' );
INSERT INTO Marcas_Gafas VALUES ('3', 'Nike' );

