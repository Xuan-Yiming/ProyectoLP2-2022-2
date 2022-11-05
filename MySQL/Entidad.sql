-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema DBProyectoLP2
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema DBProyectoLP2
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `DBProyectoLP2` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `DBProyectoLP2` ;

-- -----------------------------------------------------
-- Table `DBProyectoLP2`.`persona`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `DBProyectoLP2`.`persona` ;
CREATE TABLE IF NOT EXISTS `DBProyectoLP2`.`persona` (
  `id_persona` INT NOT NULL AUTO_INCREMENT,
  `tipo_de_documento` VARCHAR(50) NULL DEFAULT NULL,
  `numero_de_documento` VARCHAR(50) NULL DEFAULT NULL,
  `nombre` VARCHAR(100) NULL DEFAULT NULL,
  `apellido` VARCHAR(100) NULL DEFAULT NULL,
  `fecha_de_nacimiento` DATE NULL DEFAULT NULL,
  `sexo` VARCHAR(100) NULL DEFAULT NULL,
  `telefono` VARCHAR(15) NULL DEFAULT NULL,
  `direccion` VARCHAR(200) NULL DEFAULT NULL,
  `email` VARCHAR(100) NULL DEFAULT NULL,
  `activo` TINYINT NULL DEFAULT NULL,
  PRIMARY KEY (`id_persona`))
ENGINE = InnoDB
AUTO_INCREMENT = 248
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `DBProyectoLP2`.`usuario`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `DBProyectoLP2`.`usuario` ;
CREATE TABLE IF NOT EXISTS `DBProyectoLP2`.`usuario` (
  `id_usuario` INT NOT NULL,
  `username` VARCHAR(100) NULL DEFAULT NULL,
  `password` VARCHAR(100) NULL DEFAULT NULL,
  `fecha_de_ingreso` DATE NULL DEFAULT NULL,
  `foto_de_perfil` BLOB NULL DEFAULT NULL,
  `activo` TINYINT NULL DEFAULT NULL,
  PRIMARY KEY (`id_usuario`),
  CONSTRAINT `usuario_ibfk_1`
    FOREIGN KEY (`id_usuario`)
    REFERENCES `DBProyectoLP2`.`persona` (`id_persona`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `DBProyectoLP2`.`administrador`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `DBProyectoLP2`.`administrador` ;
CREATE TABLE IF NOT EXISTS `DBProyectoLP2`.`administrador` (
  `id_usuario` INT NOT NULL,
  `area` VARCHAR(100) NULL DEFAULT NULL,
  PRIMARY KEY (`id_usuario`),
  CONSTRAINT `administrador_ibfk_1`
    FOREIGN KEY (`id_usuario`)
    REFERENCES `DBProyectoLP2`.`usuario` (`id_usuario`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `DBProyectoLP2`.`supervisorDeAlmacen`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `DBProyectoLP2`.`supervisorDeAlmacen` ;
CREATE TABLE IF NOT EXISTS `DBProyectoLP2`.`supervisorDeAlmacen` (
  `id_usuario` INT NOT NULL,
  PRIMARY KEY (`id_usuario`),
  CONSTRAINT `supervisorDeAlmacen_ibfk_1`
    FOREIGN KEY (`id_usuario`)
    REFERENCES `DBProyectoLP2`.`usuario` (`id_usuario`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `DBProyectoLP2`.`almacen`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `DBProyectoLP2`.`almacen` ;
CREATE TABLE IF NOT EXISTS `DBProyectoLP2`.`almacen` (
  `id_almacen` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(100) NULL DEFAULT NULL,
  `direccion` VARCHAR(200) NULL DEFAULT NULL,
  `activo` TINYINT NULL DEFAULT NULL,
  `fid_supervisor` INT NOT NULL,
  PRIMARY KEY (`id_almacen`),
  INDEX `fk_almacen_supervisorDeAlmacen1_idx` (`fid_supervisor` ASC) VISIBLE,
  CONSTRAINT `fk_almacen_supervisorDeAlmacen1`
    FOREIGN KEY (`fid_supervisor`)
    REFERENCES `DBProyectoLP2`.`supervisorDeAlmacen` (`id_usuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 87
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `DBProyectoLP2`.`cliente`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `DBProyectoLP2`.`cliente` ;
CREATE TABLE IF NOT EXISTS `DBProyectoLP2`.`cliente` (
  `id_cliente` INT NOT NULL AUTO_INCREMENT,
  `categoria` VARCHAR(100) NULL DEFAULT NULL,
  `activo` TINYINT NULL DEFAULT NULL,
  PRIMARY KEY (`id_cliente`))
ENGINE = InnoDB
AUTO_INCREMENT = 150
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `DBProyectoLP2`.`producto`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `DBProyectoLP2`.`producto` ;
CREATE TABLE IF NOT EXISTS `DBProyectoLP2`.`producto` (
  `id_producto` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(100) NULL DEFAULT NULL,
  `precio` DOUBLE NULL DEFAULT NULL,
  `costo` DOUBLE NULL DEFAULT NULL,
  `devuelto` TINYINT NULL DEFAULT NULL,
  `fecha_ingreso` DATE NULL DEFAULT NULL,
  `activo` TINYINT NULL DEFAULT NULL,
  PRIMARY KEY (`id_producto`))
ENGINE = InnoDB
AUTO_INCREMENT = 166
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `DBProyectoLP2`.`moneda`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `DBProyectoLP2`.`moneda` ;
CREATE TABLE IF NOT EXISTS `DBProyectoLP2`.`moneda` (
  `id_moneda` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(50) NULL DEFAULT NULL,
  `abreviatura` VARCHAR(10) NULL DEFAULT NULL,
  `activo` TINYINT NULL DEFAULT NULL,
  PRIMARY KEY (`id_moneda`))
ENGINE = InnoDB
AUTO_INCREMENT = 162
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `DBProyectoLP2`.`vendedor`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `DBProyectoLP2`.`vendedor` ;
CREATE TABLE IF NOT EXISTS `DBProyectoLP2`.`vendedor` (
  `id_usuario` INT NOT NULL,
  `cantidad_ventas` INT NULL DEFAULT NULL,
  PRIMARY KEY (`id_usuario`),
  CONSTRAINT `vendedor_ibfk_1`
    FOREIGN KEY (`id_usuario`)
    REFERENCES `DBProyectoLP2`.`usuario` (`id_usuario`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `DBProyectoLP2`.`terminoDePago`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `DBProyectoLP2`.`terminoDePago` ;
CREATE TABLE IF NOT EXISTS `DBProyectoLP2`.`terminoDePago` (
  `id_termino_de_pago` INT NOT NULL AUTO_INCREMENT,
  `fecha_limite` DATE NULL DEFAULT NULL,
  `numero_cuota` INT NULL DEFAULT NULL,
  `monto_cuota` DOUBLE NULL DEFAULT NULL,
  `activo` TINYINT NULL DEFAULT NULL,
  PRIMARY KEY (`id_termino_de_pago`))
ENGINE = InnoDB
AUTO_INCREMENT = 63
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `DBProyectoLP2`.`ordenDeCompra`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `DBProyectoLP2`.`ordenDeCompra` ;
CREATE TABLE IF NOT EXISTS `DBProyectoLP2`.`ordenDeCompra` (
  `id_orden_de_compra` INT NOT NULL AUTO_INCREMENT,
  `fid_cliente` INT NULL DEFAULT NULL,
  `fid_vendedor` INT NULL DEFAULT NULL,
  `fid_moneda` INT NULL DEFAULT NULL,
  `fid_termino_de_pago` INT NULL,
  `monto` DOUBLE NULL DEFAULT NULL,
  `Saldo` DOUBLE NULL,
  `direccion_de_entrega` VARCHAR(200) NULL DEFAULT NULL,
  `forma_de_entrega` VARCHAR(50) NULL DEFAULT NULL,
  `fecha_de_compra` DATE NULL DEFAULT NULL,
  `fecha_de_entrega` DATE NULL DEFAULT NULL,
  `pagado` TINYINT(1) NULL DEFAULT NULL,
  `activo` TINYINT NULL DEFAULT NULL,
  PRIMARY KEY (`id_orden_de_compra`),
  INDEX `fid_moneda` (`fid_moneda` ASC) VISIBLE,
  INDEX `fid_cliente` (`fid_cliente` ASC) VISIBLE,
  INDEX `fid_vendedor` (`fid_vendedor` ASC) VISIBLE,
  INDEX `fk_ordenDeCompra_terminoDePago1_idx` (`fid_termino_de_pago` ASC) VISIBLE,
  CONSTRAINT `ordenDeCompra_ibfk_1`
    FOREIGN KEY (`fid_moneda`)
    REFERENCES `DBProyectoLP2`.`moneda` (`id_moneda`),
  CONSTRAINT `ordenDeCompra_ibfk_2`
    FOREIGN KEY (`fid_cliente`)
    REFERENCES `DBProyectoLP2`.`cliente` (`id_cliente`),
  CONSTRAINT `ordenDeCompra_ibfk_3`
    FOREIGN KEY (`fid_vendedor`)
    REFERENCES `DBProyectoLP2`.`vendedor` (`id_usuario`),
  CONSTRAINT `fk_ordenDeCompra_terminoDePago1`
    FOREIGN KEY (`fid_termino_de_pago`)
    REFERENCES `DBProyectoLP2`.`terminoDePago` (`id_termino_de_pago`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 141
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `DBProyectoLP2`.`reclamo`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `DBProyectoLP2`.`reclamo` ;
CREATE TABLE IF NOT EXISTS `DBProyectoLP2`.`reclamo` (
  `id_reclamo` INT NOT NULL AUTO_INCREMENT,
  `fid_orden_de_compra` INT NULL DEFAULT NULL,
  `fecha` DATE NULL DEFAULT NULL,
  `atendido` TINYINT(1) NULL DEFAULT NULL,
  `justificacion` VARCHAR(500) NULL DEFAULT NULL,
  `activo` TINYINT NULL DEFAULT NULL,
  PRIMARY KEY (`id_reclamo`),
  INDEX `fid_orden_de_compra` (`fid_orden_de_compra` ASC) VISIBLE,
  CONSTRAINT `reclamo_ibfk_1`
    FOREIGN KEY (`fid_orden_de_compra`)
    REFERENCES `DBProyectoLP2`.`ordenDeCompra` (`id_orden_de_compra`))
ENGINE = InnoDB
AUTO_INCREMENT = 33
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `DBProyectoLP2`.`devolucion`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `DBProyectoLP2`.`devolucion` ;
CREATE TABLE IF NOT EXISTS `DBProyectoLP2`.`devolucion` (
  `id_devolucion` INT NOT NULL AUTO_INCREMENT,
  `fid_producto` INT NULL DEFAULT NULL,
  `fid_reclamo` INT NULL DEFAULT NULL,
  `cantidad` INT NULL,
  `activo` TINYINT NULL DEFAULT NULL,
  PRIMARY KEY (`id_devolucion`),
  INDEX `fid_producto` (`fid_producto` ASC) VISIBLE,
  INDEX `fid_reclamo` (`fid_reclamo` ASC) VISIBLE,
  CONSTRAINT `devolucion_ibfk_1`
    FOREIGN KEY (`fid_producto`)
    REFERENCES `DBProyectoLP2`.`producto` (`id_producto`),
  CONSTRAINT `devolucion_ibfk_2`
    FOREIGN KEY (`fid_reclamo`)
    REFERENCES `DBProyectoLP2`.`reclamo` (`id_reclamo`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `DBProyectoLP2`.`documentoCredito`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `DBProyectoLP2`.`documentoCredito` ;
CREATE TABLE IF NOT EXISTS `DBProyectoLP2`.`documentoCredito` (
  `id_documento_credito` INT NOT NULL AUTO_INCREMENT,
  `fid_orden_de_compra` INT NULL DEFAULT NULL,
  `fecha_creacion` DATE NULL DEFAULT NULL,
  `fecha_vencimiento` DATE NULL DEFAULT NULL,
  `monto` DOUBLE NULL DEFAULT NULL,
  `anulado` TINYINT(1) NULL DEFAULT NULL,
  `activo` TINYINT NULL DEFAULT NULL,
  PRIMARY KEY (`id_documento_credito`),
  INDEX `fid_orden_de_compra` (`fid_orden_de_compra` ASC) VISIBLE,
  CONSTRAINT `documentoCredito_ibfk_1`
    FOREIGN KEY (`fid_orden_de_compra`)
    REFERENCES `DBProyectoLP2`.`ordenDeCompra` (`id_orden_de_compra`))
ENGINE = InnoDB
AUTO_INCREMENT = 42
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `DBProyectoLP2`.`documentoDebito`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `DBProyectoLP2`.`documentoDebito` ;
CREATE TABLE IF NOT EXISTS `DBProyectoLP2`.`documentoDebito` (
  `id_documento_debito` INT NOT NULL AUTO_INCREMENT,
  `fid_orden_de_compra` INT NULL DEFAULT NULL,
  `fecha_creacion` DATE NULL DEFAULT NULL,
  `impuesto` DOUBLE NULL DEFAULT NULL,
  `monto` DOUBLE NULL DEFAULT NULL,
  `anulado` TINYINT(1) NULL DEFAULT NULL,
  `activo` TINYINT NULL DEFAULT NULL,
  PRIMARY KEY (`id_documento_debito`),
  INDEX `fid_orden_de_compra` (`fid_orden_de_compra` ASC) VISIBLE,
  CONSTRAINT `documentoDebito_ibfk_1`
    FOREIGN KEY (`fid_orden_de_compra`)
    REFERENCES `DBProyectoLP2`.`ordenDeCompra` (`id_orden_de_compra`))
ENGINE = InnoDB
AUTO_INCREMENT = 53
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `DBProyectoLP2`.`empresa`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `DBProyectoLP2`.`empresa` ;
CREATE TABLE IF NOT EXISTS `DBProyectoLP2`.`empresa` (
  `id_empresa` INT NOT NULL,
  `RUC` VARCHAR(100) NULL DEFAULT NULL,
  `razon_social` VARCHAR(100) NULL DEFAULT NULL,
  `direccion` VARCHAR(200) NULL DEFAULT NULL,
  PRIMARY KEY (`id_empresa`),
  CONSTRAINT `empresa_ibfk_1`
    FOREIGN KEY (`id_empresa`)
    REFERENCES `DBProyectoLP2`.`cliente` (`id_cliente`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `DBProyectoLP2`.`pedido`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `DBProyectoLP2`.`pedido` ;
CREATE TABLE IF NOT EXISTS `DBProyectoLP2`.`pedido` (
  `id_pedido` INT NOT NULL AUTO_INCREMENT,
  `fid_producto` INT NULL DEFAULT NULL,
  `fid_orden_de_compra` INT NULL DEFAULT NULL,
  `cantidad` INT NULL,
  `descuento` DOUBLE NULL DEFAULT NULL,
  `activo` TINYINT NULL DEFAULT NULL,
  PRIMARY KEY (`id_pedido`),
  INDEX `fid_producto` (`fid_producto` ASC) VISIBLE,
  INDEX `fid_orden_de_compra` (`fid_orden_de_compra` ASC) VISIBLE,
  CONSTRAINT `pedido_ibfk_1`
    FOREIGN KEY (`fid_producto`)
    REFERENCES `DBProyectoLP2`.`producto` (`id_producto`),
  CONSTRAINT `pedido_ibfk_2`
    FOREIGN KEY (`fid_orden_de_compra`)
    REFERENCES `DBProyectoLP2`.`ordenDeCompra` (`id_orden_de_compra`))
ENGINE = InnoDB
AUTO_INCREMENT = 4
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `DBProyectoLP2`.`personaNatural`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `DBProyectoLP2`.`personaNatural` ;
CREATE TABLE IF NOT EXISTS `DBProyectoLP2`.`personaNatural` (
  `id_persona_natural` INT NOT NULL,
  `tipo_de_documento` VARCHAR(50) NULL DEFAULT NULL,
  `numero_de_documento` VARCHAR(50) NULL DEFAULT NULL,
  `nombre` VARCHAR(100) NULL DEFAULT NULL,
  `apellido` VARCHAR(100) NULL DEFAULT NULL,
  `fecha_de_nacimiento` DATE NULL DEFAULT NULL,
  `sexo` VARCHAR(100) NULL DEFAULT NULL,
  `telefono` VARCHAR(15) NULL DEFAULT NULL,
  `direccion` VARCHAR(200) NULL DEFAULT NULL,
  `email` VARCHAR(100) NULL DEFAULT NULL,
  PRIMARY KEY (`id_persona_natural`),
  CONSTRAINT `personaNatural_ibfk_1`
    FOREIGN KEY (`id_persona_natural`)
    REFERENCES `DBProyectoLP2`.`cliente` (`id_cliente`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `DBProyectoLP2`.`tipoDeCambio`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `DBProyectoLP2`.`tipoDeCambio` ;
CREATE TABLE IF NOT EXISTS `DBProyectoLP2`.`tipoDeCambio` (
  `id_tipo_de_cambio` INT NOT NULL AUTO_INCREMENT,
  `fid_moneda` INT NULL DEFAULT NULL,
  `fecha` DATE NULL DEFAULT NULL,
  `cambio` DOUBLE NULL DEFAULT NULL,
  `activo` TINYINT NULL DEFAULT NULL,
  PRIMARY KEY (`id_tipo_de_cambio`),
  INDEX `fid_moneda` (`fid_moneda` ASC) VISIBLE,
  CONSTRAINT `tipoDeCambio_ibfk_1`
    FOREIGN KEY (`fid_moneda`)
    REFERENCES `DBProyectoLP2`.`moneda` (`id_moneda`))
ENGINE = InnoDB
AUTO_INCREMENT = 28
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `DBProyectoLP2`.`stock`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `DBProyectoLP2`.`stock` ;
CREATE TABLE IF NOT EXISTS `DBProyectoLP2`.`stock` (
  `id_almacen` INT NOT NULL,
  `id_producto` INT NOT NULL,
  `cantidad` INT NULL,
  INDEX `fk_stock_almacen1_idx` (`id_almacen` ASC) VISIBLE,
  INDEX `fk_stock_producto1_idx` (`id_producto` ASC) VISIBLE,
  CONSTRAINT `fk_stock_almacen1`
    FOREIGN KEY (`id_almacen`)
    REFERENCES `DBProyectoLP2`.`almacen` (`id_almacen`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_stock_producto1`
    FOREIGN KEY (`id_producto`)
    REFERENCES `DBProyectoLP2`.`producto` (`id_producto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
