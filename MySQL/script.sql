-- MySQL dump 10.13  Distrib 8.0.30, for Win64 (x86_64)
--
-- Host: lasjoyasdb.cmkeurxfbwvg.us-east-1.rds.amazonaws.com    Database: lasjoyasdb
-- ------------------------------------------------------
-- Server version	8.0.28

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
SET @MYSQLDUMP_TEMP_LOG_BIN = @@SESSION.SQL_LOG_BIN;
SET @@SESSION.SQL_LOG_BIN= 0;

--
-- GTID state at the beginning of the backup 
--

SET @@GLOBAL.GTID_PURGED=/*!80000 '+'*/ '';

--
-- Table structure for table `administrador`
--

DROP TABLE IF EXISTS `administrador`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `administrador` (
  `id_usuario` int NOT NULL,
  `area` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_usuario`),
  CONSTRAINT `administrador_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `almacen`
--

DROP TABLE IF EXISTS `almacen`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `almacen` (
  `id_almacen` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) DEFAULT NULL,
  `direccion` varchar(200) DEFAULT NULL,
  `activo` tinyint DEFAULT NULL,
  PRIMARY KEY (`id_almacen`)
) ENGINE=InnoDB AUTO_INCREMENT=74 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cliente` (
  `id_cliente` int NOT NULL AUTO_INCREMENT,
  `categoria` varchar(100) DEFAULT NULL,
  `activo` tinyint DEFAULT NULL,
  PRIMARY KEY (`id_cliente`)
) ENGINE=InnoDB AUTO_INCREMENT=127 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `devolucion`
--

DROP TABLE IF EXISTS `devolucion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `devolucion` (
  `id_devolucion` int NOT NULL AUTO_INCREMENT,
  `fid_producto` int DEFAULT NULL,
  `fid_reclamo` int DEFAULT NULL,
  `activo` tinyint DEFAULT NULL,
  PRIMARY KEY (`id_devolucion`),
  KEY `fid_producto` (`fid_producto`),
  KEY `fid_reclamo` (`fid_reclamo`),
  CONSTRAINT `devolucion_ibfk_1` FOREIGN KEY (`fid_producto`) REFERENCES `producto` (`id_producto`),
  CONSTRAINT `devolucion_ibfk_2` FOREIGN KEY (`fid_reclamo`) REFERENCES `reclamo` (`id_reclamo`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `documentoCredito`
--

DROP TABLE IF EXISTS `documentoCredito`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `documentoCredito` (
  `id_documento_credito` int NOT NULL AUTO_INCREMENT,
  `fid_orden_de_compra` int DEFAULT NULL,
  `fid_documento_debito` int DEFAULT NULL,
  `fid_moneda` int DEFAULT NULL,
  `fecha_creacion` date DEFAULT NULL,
  `fecha_vencimiento` date DEFAULT NULL,
  `monto` double DEFAULT NULL,
  `anulado` tinyint(1) DEFAULT NULL,
  `activo` tinyint DEFAULT NULL,
  PRIMARY KEY (`id_documento_credito`),
  KEY `fid_orden_de_compra` (`fid_orden_de_compra`),
  KEY `fid_documento_debito` (`fid_documento_debito`),
  KEY `fid_moneda` (`fid_moneda`),
  CONSTRAINT `documentoCredito_ibfk_1` FOREIGN KEY (`fid_orden_de_compra`) REFERENCES `ordenDeCompra` (`id_orden_de_compra`),
  CONSTRAINT `documentoCredito_ibfk_2` FOREIGN KEY (`fid_documento_debito`) REFERENCES `documentoDebito` (`id_documento_debito`),
  CONSTRAINT `documentoCredito_ibfk_3` FOREIGN KEY (`fid_moneda`) REFERENCES `moneda` (`id_moneda`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `documentoDebito`
--

DROP TABLE IF EXISTS `documentoDebito`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `documentoDebito` (
  `id_documento_debito` int NOT NULL AUTO_INCREMENT,
  `fid_orden_de_compra` int DEFAULT NULL,
  `fid_moneda` int DEFAULT NULL,
  `fid_termino_de_pago` int DEFAULT NULL,
  `fecha_creacion` date DEFAULT NULL,
  `fecha_vencimiento` date DEFAULT NULL,
  `impuesto` double DEFAULT NULL,
  `monto` double DEFAULT NULL,
  `saldo` double DEFAULT NULL,
  `anulado` tinyint(1) DEFAULT NULL,
  `activo` tinyint DEFAULT NULL,
  PRIMARY KEY (`id_documento_debito`),
  KEY `fid_orden_de_compra` (`fid_orden_de_compra`),
  KEY `fid_moneda` (`fid_moneda`),
  KEY `fid_termino_de_pago` (`fid_termino_de_pago`),
  CONSTRAINT `documentoDebito_ibfk_1` FOREIGN KEY (`fid_orden_de_compra`) REFERENCES `ordenDeCompra` (`id_orden_de_compra`),
  CONSTRAINT `documentoDebito_ibfk_2` FOREIGN KEY (`fid_moneda`) REFERENCES `moneda` (`id_moneda`),
  CONSTRAINT `documentoDebito_ibfk_3` FOREIGN KEY (`fid_termino_de_pago`) REFERENCES `terminoDePago` (`id_termino_de_pago`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `empresa`
--

DROP TABLE IF EXISTS `empresa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `empresa` (
  `id_empresa` int NOT NULL,
  `RUC` varchar(100) DEFAULT NULL,
  `razon_social` varchar(100) DEFAULT NULL,
  `direccion` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id_empresa`),
  CONSTRAINT `empresa_ibfk_1` FOREIGN KEY (`id_empresa`) REFERENCES `cliente` (`id_cliente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `moneda`
--

DROP TABLE IF EXISTS `moneda`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `moneda` (
  `id_moneda` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) DEFAULT NULL,
  `abreviatura` varchar(10) DEFAULT NULL,
  `activo` tinyint DEFAULT NULL,
  PRIMARY KEY (`id_moneda`)
) ENGINE=InnoDB AUTO_INCREMENT=147 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ordenDeCompra`
--

DROP TABLE IF EXISTS `ordenDeCompra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ordenDeCompra` (
  `id_orden_de_compra` int NOT NULL AUTO_INCREMENT,
  `fid_cliente` int DEFAULT NULL,
  `fid_vendedor` int DEFAULT NULL,
  `fid_moneda` int DEFAULT NULL,
  `monto` double DEFAULT NULL,
  `direccion_de_entrega` varchar(200) DEFAULT NULL,
  `forma_de_entrega` varchar(50) DEFAULT NULL,
  `fecha_de_compra` date DEFAULT NULL,
  `fecha_de_entrega` date DEFAULT NULL,
  `pagado` tinyint(1) DEFAULT NULL,
  `activo` tinyint DEFAULT NULL,
  PRIMARY KEY (`id_orden_de_compra`),
  KEY `fid_moneda` (`fid_moneda`),
  KEY `fid_cliente` (`fid_cliente`),
  KEY `fid_vendedor` (`fid_vendedor`),
  CONSTRAINT `ordenDeCompra_ibfk_1` FOREIGN KEY (`fid_moneda`) REFERENCES `moneda` (`id_moneda`),
  CONSTRAINT `ordenDeCompra_ibfk_2` FOREIGN KEY (`fid_cliente`) REFERENCES `cliente` (`id_cliente`),
  CONSTRAINT `ordenDeCompra_ibfk_3` FOREIGN KEY (`fid_vendedor`) REFERENCES `vendedor` (`id_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=125 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pedido`
--

DROP TABLE IF EXISTS `pedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pedido` (
  `id_pedido` int NOT NULL AUTO_INCREMENT,
  `fid_producto` int DEFAULT NULL,
  `fid_orden_de_compra` int DEFAULT NULL,
  `descuento` double DEFAULT NULL,
  `activo` tinyint DEFAULT NULL,
  PRIMARY KEY (`id_pedido`),
  KEY `fid_producto` (`fid_producto`),
  KEY `fid_orden_de_compra` (`fid_orden_de_compra`),
  CONSTRAINT `pedido_ibfk_1` FOREIGN KEY (`fid_producto`) REFERENCES `producto` (`id_producto`),
  CONSTRAINT `pedido_ibfk_2` FOREIGN KEY (`fid_orden_de_compra`) REFERENCES `ordenDeCompra` (`id_orden_de_compra`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `persona`
--

DROP TABLE IF EXISTS `persona`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `persona` (
  `id_persona` int NOT NULL AUTO_INCREMENT,
  `tipo_de_documento` varchar(50) DEFAULT NULL,
  `numero_de_documento` varchar(50) DEFAULT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `apellido` varchar(100) DEFAULT NULL,
  `fecha_de_nacimiento` date DEFAULT NULL,
  `telefono` varchar(15) DEFAULT NULL,
  `direccion` varchar(200) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `activo` tinyint DEFAULT NULL,
  PRIMARY KEY (`id_persona`)
) ENGINE=InnoDB AUTO_INCREMENT=190 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `personaNatural`
--

DROP TABLE IF EXISTS `personaNatural`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `personaNatural` (
  `id_persona_natural` int NOT NULL,
  `tipo_de_documento` varchar(50) DEFAULT NULL,
  `numero_de_documento` varchar(50) DEFAULT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `apellido` varchar(100) DEFAULT NULL,
  `fecha_de_nacimiento` date DEFAULT NULL,
  `telefono` varchar(15) DEFAULT NULL,
  `direccion` varchar(200) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_persona_natural`),
  CONSTRAINT `personaNatural_ibfk_1` FOREIGN KEY (`id_persona_natural`) REFERENCES `cliente` (`id_cliente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `producto`
--

DROP TABLE IF EXISTS `producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `producto` (
  `id_producto` int NOT NULL AUTO_INCREMENT,
  `fid_almacen` int DEFAULT NULL,
  `codigo_lote` varchar(50) DEFAULT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `precio` double DEFAULT NULL,
  `costo` double DEFAULT NULL,
  `devuelto` tinyint(1) DEFAULT NULL,
  `fecha_ingreso` date DEFAULT NULL,
  `activo` tinyint DEFAULT NULL,
  PRIMARY KEY (`id_producto`),
  KEY `fid_almacen` (`fid_almacen`),
  CONSTRAINT `producto_ibfk_1` FOREIGN KEY (`fid_almacen`) REFERENCES `almacen` (`id_almacen`)
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `reclamo`
--

DROP TABLE IF EXISTS `reclamo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reclamo` (
  `id_reclamo` int NOT NULL AUTO_INCREMENT,
  `fid_orden_de_compra` int DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `atendido` tinyint(1) DEFAULT NULL,
  `justificacion` varchar(500) DEFAULT NULL,
  `activo` tinyint DEFAULT NULL,
  PRIMARY KEY (`id_reclamo`),
  KEY `fid_orden_de_compra` (`fid_orden_de_compra`),
  CONSTRAINT `reclamo_ibfk_1` FOREIGN KEY (`fid_orden_de_compra`) REFERENCES `ordenDeCompra` (`id_orden_de_compra`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `supervisorDeAlmacen`
--

DROP TABLE IF EXISTS `supervisorDeAlmacen`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `supervisorDeAlmacen` (
  `id_usuario` int NOT NULL,
  `fid_almacen` int DEFAULT NULL,
  PRIMARY KEY (`id_usuario`),
  KEY `fid_almacen` (`fid_almacen`),
  CONSTRAINT `supervisorDeAlmacen_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`),
  CONSTRAINT `supervisorDeAlmacen_ibfk_2` FOREIGN KEY (`fid_almacen`) REFERENCES `almacen` (`id_almacen`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `terminoDePago`
--

DROP TABLE IF EXISTS `terminoDePago`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `terminoDePago` (
  `id_termino_de_pago` int NOT NULL AUTO_INCREMENT,
  `fecha_limite` date DEFAULT NULL,
  `numero_cuota` int DEFAULT NULL,
  `monto_cuota` double DEFAULT NULL,
  `activo` tinyint DEFAULT NULL,
  PRIMARY KEY (`id_termino_de_pago`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tipoDeCambio`
--

DROP TABLE IF EXISTS `tipoDeCambio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipoDeCambio` (
  `id_tipo_de_cambio` int NOT NULL AUTO_INCREMENT,
  `fid_moneda` int DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `cambio` double DEFAULT NULL,
  `activo` tinyint DEFAULT NULL,
  PRIMARY KEY (`id_tipo_de_cambio`),
  KEY `fid_moneda` (`fid_moneda`),
  CONSTRAINT `tipoDeCambio_ibfk_1` FOREIGN KEY (`fid_moneda`) REFERENCES `moneda` (`id_moneda`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario` (
  `id_usuario` int NOT NULL,
  `username` varchar(100) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `fecha_de_ingreso` date DEFAULT NULL,
  PRIMARY KEY (`id_usuario`),
  CONSTRAINT `usuario_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `persona` (`id_persona`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `vendedor`
--

DROP TABLE IF EXISTS `vendedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vendedor` (
  `id_usuario` int NOT NULL,
  `cantidad_ventas` int DEFAULT NULL,
  PRIMARY KEY (`id_usuario`),
  CONSTRAINT `vendedor_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping routines for database 'lasjoyasdb'
--
/*!50003 DROP PROCEDURE IF EXISTS `ELIMINAR_ADMINISTRADOR` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`adminjoya`@`%` PROCEDURE `ELIMINAR_ADMINISTRADOR`(
	IN _id_usuario INT
)
BEGIN
	UPDATE persona SET activo = 0 WHERE id_persona = _id_usuario;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ELIMINAR_ALMACEN` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`adminjoya`@`%` PROCEDURE `ELIMINAR_ALMACEN`(
	IN _id_almacen INT
)
BEGIN
	UPDATE almacen SET activo = 0 WHERE id_almacen = _id_almacen;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ELIMINAR_DEVOLUCION` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`adminjoya`@`%` PROCEDURE `ELIMINAR_DEVOLUCION`(
	IN _id_devolucion INT
)
BEGIN
	UPDATE devolucion SET activo = 0 WHERE id_devolucion = _id_devolucion;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ELIMINAR_DOCUMENTO_CREDITO` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`adminjoya`@`%` PROCEDURE `ELIMINAR_DOCUMENTO_CREDITO`(
	IN _id_documento_credito INT
)
BEGIN
	UPDATE documentoCredito SET activo = 0 WHERE id_documento_credito = _id_documento_credito;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ELIMINAR_DOCUMENTO_DEBITO` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`adminjoya`@`%` PROCEDURE `ELIMINAR_DOCUMENTO_DEBITO`(
	IN _id_documento_debito INT
)
BEGIN
	UPDATE documentoDebito SET activo = 0 WHERE id_documento_debito = _id_documento_debito;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ELIMINAR_EMPRESA` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`adminjoya`@`%` PROCEDURE `ELIMINAR_EMPRESA`(
	IN _id_empresa INT
)
BEGIN
	UPDATE cliente SET activo = 0 WHERE id_cliente=_id_empresa;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ELIMINAR_MONEDA` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`adminjoya`@`%` PROCEDURE `ELIMINAR_MONEDA`(
	IN _id_moneda INT
)
BEGIN
	UPDATE moneda SET activo = 0 WHERE id_moneda=_id_moneda;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ELIMINAR_ORDEN_DE_COMPRA` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`adminjoya`@`%` PROCEDURE `ELIMINAR_ORDEN_DE_COMPRA`(
	IN _id_orden_de_compra INT
)
BEGIN
	UPDATE ordenDeCompra SET activo = 0 WHERE id_orden_de_compra=_id_orden_de_compra;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ELIMINAR_PEDIDOS` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`adminjoya`@`%` PROCEDURE `ELIMINAR_PEDIDOS`(
	IN _id_pedido INT
)
BEGIN
	UPDATE pedido SET activo = 0 WHERE id_pedido = _id_pedido;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ELIMINAR_PERSONA_NATURAL` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`adminjoya`@`%` PROCEDURE `ELIMINAR_PERSONA_NATURAL`(
	IN _id_persona_natural INT
)
BEGIN
	UPDATE cliente SET activo = 0 WHERE id_cliente = _id_persona_natural;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ELIMINAR_PRODUCTO` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`adminjoya`@`%` PROCEDURE `ELIMINAR_PRODUCTO`(
	IN _id_producto INT
)
BEGIN
	UPDATE producto SET activo = 0 WHERE id_producto = _id_producto;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ELIMINAR_RECLAMO` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`adminjoya`@`%` PROCEDURE `ELIMINAR_RECLAMO`(
	IN _id_reclamo INT
)
BEGIN
	UPDATE reclamo SET activo = 0 WHERE id_reclamo = _id_reclamo;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ELIMINAR_STOCK` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`adminjoya`@`%` PROCEDURE `ELIMINAR_STOCK`(
	IN _id_stock INT
)
BEGIN
	UPDATE stock SET id_stock = 0 WHERE id_stock = _id_stock;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ELIMINAR_SUPERVISOR_DE_ALMACEN` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`adminjoya`@`%` PROCEDURE `ELIMINAR_SUPERVISOR_DE_ALMACEN`(
	IN _id_usuario INT
)
BEGIN
	UPDATE persona SET activo = 0 WHERE id_persona = _id_usuario;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ELIMINAR_TERMINO_DE_PAGO` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`adminjoya`@`%` PROCEDURE `ELIMINAR_TERMINO_DE_PAGO`(
	IN _id_termino_de_pago INT
)
BEGIN
	UPDATE terminoDePago SET activo = 0 WHERE id_termino_de_pago=_id_termino_de_pago;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ELIMINAR_TIPO_DE_CAMBIO` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`adminjoya`@`%` PROCEDURE `ELIMINAR_TIPO_DE_CAMBIO`(
	IN _id_tipo_de_cambio INT
)
BEGIN
	UPDATE tipoDeCambio SET activo = 0 WHERE id_tipo_de_cambio=_id_tipo_de_cambio;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ELIMINAR_VENDEDOR` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`adminjoya`@`%` PROCEDURE `ELIMINAR_VENDEDOR`(
	IN _id_usuario INT
)
BEGIN
	UPDATE persona SET activo = 0 WHERE id_persona = _id_usuario;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `INSERTAR_ADMINISTRADOR` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`adminjoya`@`%` PROCEDURE `INSERTAR_ADMINISTRADOR`(
	OUT _id_usuario INT ,
    IN _area varchar(100),
	IN _username varchar(100),
	IN _password VARCHAR(50),     
	IN _fecha_de_ingreso date,       
	IN _tipo_de_documento varchar(50),
    IN _numero_de_documento varchar(50), 
    IN _nombre varchar(100),
    IN _apellido varchar(100),
    IN _fecha_de_nacimiento date,
    IN _telefono varchar(15),
    IN _direccion varchar(200),
    IN _email varchar(100)
)
BEGIN
	INSERT INTO persona(tipo_de_documento,numero_de_documento,nombre,apellido,fecha_de_nacimiento,telefono,direccion,email,activo) 
			VALUES(_tipo_de_documento,_numero_de_documento,_nombre,_apellido,_fecha_de_nacimiento,_telefono,_direccion,_email,1);
	SET _id_usuario = @@last_insert_id;
    INSERT INTO usuario(id_usuario, username,password,fecha_de_ingreso) VALUES(_id_usuario, _username,_password,_fecha_de_ingreso);
   
    INSERT INTO administrador(id_usuario, area) VALUES (_id_usuario,_area);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `INSERTAR_ALMACEN` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`adminjoya`@`%` PROCEDURE `INSERTAR_ALMACEN`(
	OUT _id_almacen INT,
    IN _nombre VARCHAR(100),
    IN _direccion VARCHAR(200),
    IN _activo TINYINT
)
BEGIN
	INSERT INTO almacen(id_almacen,nombre,direccion,activo) VALUES (_id_almacen,_nombre,_direccion,1);
    set _id_almacen=@@last_insert_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `INSERTAR_DEVOLUCION` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`adminjoya`@`%` PROCEDURE `INSERTAR_DEVOLUCION`(
	OUT _id_devolucion INT,
    IN _fid_producto INT,
    IN _fid_reclamo INT
)
BEGIN
	
    INSERT INTO devolucion(id_devolucion,fid_producto,fid_reclamo,activo) VALUES(_id_devolucion,_fid_producto,_fid_reclamo,1);
    SET _id_devolucion = @@last_insert_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `INSERTAR_DOCUMENTO_CREDITO` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`adminjoya`@`%` PROCEDURE `INSERTAR_DOCUMENTO_CREDITO`(
	OUT _id_documento_credito INT ,
    IN _fid_orden_de_compra INT,
    IN _fid_documento_debito INT,
    IN _fid_moneda INT,
    IN _fecha_creacion date,
    IN _fecha_vencimiento date,
    IN _monto double,
    IN _anulado boolean
)
BEGIN
    INSERT INTO documentoCredito(id_documento_credito,fid_orden_de_compra,fid_documento_debito,fid_moneda,fecha_creacion,fecha_vencimiento,monto,anulado,activo) 
    VALUES(_id_documento_credito,_fid_orden_de_compra,_fid_documento_debito,_fid_moneda,fecha_creacion,_fecha_vencimiento,_monto,_anulado,1);
    SET _id_documento_credito = @@last_insert_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `INSERTAR_DOCUMENTO_DEBITO` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`adminjoya`@`%` PROCEDURE `INSERTAR_DOCUMENTO_DEBITO`(
	OUT _id_documento_debito INT ,
    IN _fid_orden_de_compra INT,
    IN _fid_moneda INT,
    IN _fid_termino_de_pago INT,
    IN _fecha_creacion date,
    IN _fecha_vencimiento date,
    IN _impuesto double,
    IN _monto double,
    IN _saldo double,
    IN _anulado boolean
)
BEGIN
    INSERT INTO documentoDebito(id_documento_debito,fid_orden_de_compra,fid_moneda,fid_termino_de_pago,fecha_creacion,fecha_vencimiento,impuesto,monto,saldo,anulado,activo) 
			VALUES (_id_documento_debito,_fid_orden_de_compra,_fid_moneda,_fid_termino_de_pago,_fecha_creacion,_fecha_vencimiento,_impuesto,_monto,_saldo,_anulado,1);
            SET _id_documento_debito = @@last_insert_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `INSERTAR_EMPRESA` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`adminjoya`@`%` PROCEDURE `INSERTAR_EMPRESA`(
	OUT _id_empresa int,
    IN _RUC varchar(100),
    IN _razon_social varchar(100),
    IN _direccion varchar(200),
    IN _categoria varchar(100)
)
BEGIN
	INSERT INTO cliente(categoria,activo) VALUES(_categoria,1);
	SET _id_empresa = @@last_insert_id;
    INSERT INTO empresa(id_empresa,RUC,razon_social,direccion) VALUES(_id_empresa,_RUC,_razon_social,_direccion);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `INSERTAR_MONEDA` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`adminjoya`@`%` PROCEDURE `INSERTAR_MONEDA`(
	OUT _id_moneda INT ,
    IN _nombre varchar(50),
    IN _abreviatura varchar(10)
)
BEGIN
    INSERT INTO moneda(id_moneda,nombre,abreviatura,activo) VALUES(_id_moneda,_nombre,_abreviatura,1);
    SET _id_moneda = @@last_insert_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `INSERTAR_ORDEN_DE_COMPRA` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`adminjoya`@`%` PROCEDURE `INSERTAR_ORDEN_DE_COMPRA`(
	OUT _id_orden_de_compra INT ,
    IN _fid_cliente INT,
    IN _fid_vendedor INT,  
    IN _fid_moneda INT,
	IN _monto double,
    IN _direccion_de_entrega varchar(200),
    IN _forma_de_entrega varchar(50),
    IN _fecha_de_compra date,
    IN _fecha_de_entrega date,
    IN _pagado boolean
)
BEGIN
    INSERT INTO ordenDeCompra(id_orden_de_compra,fid_cliente,fid_vendedor,fid_moneda ,monto,direccion_de_entrega,forma_de_entrega,fecha_de_compra,fecha_de_entrega,pagado,activo) 
    VALUES(_id_orden_de_compra,_fid_cliente,_fid_vendedor,_fid_moneda,_monto,_direccion_de_entrega,_forma_de_entrega,_fecha_de_compra,_fecha_de_entrega,_pagado,1);
    SET _id_orden_de_compra = @@last_insert_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `INSERTAR_PEDIDO` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`adminjoya`@`%` PROCEDURE `INSERTAR_PEDIDO`(
	OUT _id_pedido INT ,
    IN _fid_producto INT,
    IN _fid_orden_de_compra INT,
    IN _descuento double
)
BEGIN
    INSERT INTO pedido(id_pedido,fid_producto,fid_orden_de_compra,descuento,activo) VALUES(_id_pedido,_fid_producto,_fid_orden_de_compra,_descuento,1);
	SET _id_pedido = @@last_insert_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `INSERTAR_PERSONA_NATURAL` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`adminjoya`@`%` PROCEDURE `INSERTAR_PERSONA_NATURAL`(
	OUT _id_persona_natural int,
    IN _categoria varchar(100),
    IN _tipo_de_documento varchar(50),
	IN _numero_de_documento varchar(50),
    IN _nombre varchar(100),
    IN _apellido varchar(100),
    IN _fecha_de_nacimiento date,
    IN _telefono varchar(15),
    IN _direccion varchar(200),
    IN _email varchar(100)
)
BEGIN
	INSERT INTO cliente(categoria,activo) VALUES(_categoria,1);
	SET _id_persona_natural = @@last_insert_id;
    INSERT INTO personaNatural(id_persona_natural,tipo_de_documento,numero_de_documento,nombre,apellido,fecha_de_nacimiento,telefono,direccion,email) 
		VALUES (_id_persona_natural,_tipo_de_documento,_numero_de_documento,_nombre,_apellido,_fecha_de_nacimiento,_telefono,_direccion,_email);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `INSERTAR_PRODUCTO` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`adminjoya`@`%` PROCEDURE `INSERTAR_PRODUCTO`(
	OUT _id_producto INT,
    IN _fid_almacen INT,
    IN _codigo_lote varchar(50),
    IN _nombre VARCHAR(100),
    IN _precio DOUBLE,
    IN _costo DOUBLE,
    IN _devuelto BOOLEAN,
    IN _fecha_ingreso date,
    IN _activo BOOLEAN
)
BEGIN

    INSERT INTO producto(id_producto,fid_almacen,codigo_lote,nombre,precio,costo,devuelto,fecha_ingreso,activo) 
			VALUES(_id_producto,_fid_almacen,_codigo_lote,_nombre,_precio,_costo,_devuelto,_fecha_ingreso,1);
	SET _id_producto = @@last_insert_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `INSERTAR_RECLAMO` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`adminjoya`@`%` PROCEDURE `INSERTAR_RECLAMO`(
	OUT _id_reclamo INT ,
    IN _fid_orden_de_compra INT,
    IN _fecha DATE,
    IN _atendido boolean,
    IN _justificacion varchar(500)
)
BEGIN
	
    INSERT INTO reclamo(id_reclamo,fid_orden_de_compra,fecha,atendido,justificacion,activo) 
			VALUES(_id_reclamo,_fid_orden_de_compra,_fecha,_atendido,_justificacion,1);
	SET _id_reclamo = @@last_insert_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `INSERTAR_STOCK` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`adminjoya`@`%` PROCEDURE `INSERTAR_STOCK`(
	IN _id_stock INT,
	IN _cantidad INT,
    IN _id_producto INT
)
BEGIN
	INSERT INTO stock(id_stock,cantidad,id_producto) VALUES (_id_stock,_cantidad,_id_producto);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `INSERTAR_SUPERVISOR_DE_ALMACEN` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`adminjoya`@`%` PROCEDURE `INSERTAR_SUPERVISOR_DE_ALMACEN`(
	OUT _id_usuario INT ,
    IN _fid_almacen INT,
    IN _username varchar(100),
	IN _password VARCHAR(50),     
	IN _fecha_de_ingreso date,       
	IN _tipo_de_documento VARCHAR(50),
    IN _numero_de_documento varchar(50),
    IN _nombre varchar(100),
    IN _apellido varchar(100),
    IN _fecha_de_nacimiento date,
    IN _telefono varchar(15),
    IN _direccion varchar(200),
    IN _email varchar(100)
)
BEGIN
	INSERT INTO persona(tipo_de_documento,numero_de_documento,nombre,apellido,fecha_de_nacimiento,telefono,direccion,email,activo) 
			VALUES(_tipo_de_documento,_numero_de_documento,_nombre,_apellido,_fecha_de_nacimiento,_telefono,_direccion,_email,1);
    SET _id_usuario = @@last_insert_id;
    INSERT INTO usuario(id_usuario,username,password,fecha_de_ingreso) VALUES(_id_usuario, _username,_password,_fecha_de_ingreso);
    INSERT INTO supervisorDeAlmacen(id_usuario,fid_almacen) VALUES (_id_usuario,_fid_almacen);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `INSERTAR_TERMINO_DE_PAGO` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`adminjoya`@`%` PROCEDURE `INSERTAR_TERMINO_DE_PAGO`(
	OUT _id_termino_de_pago INT,
    IN _fecha_limite DATE,
    IN _numero_cuota INT,
    IN _monto_cuota double
)
BEGIN
	INSERT INTO terminoDePago(id_termino_de_pago,fecha_limite,numero_cuota,monto_cuota,activo) 
		VALUES(_id_termino_de_pago,_fecha_limite,_numero_cuota,_monto_cuota,1);
	SET _id_termino_de_pago = @@last_insert_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `INSERTAR_TIPO_DE_CAMBIO` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`adminjoya`@`%` PROCEDURE `INSERTAR_TIPO_DE_CAMBIO`(
	OUT _id_tipo_de_cambio INT,
    IN _fid_moneda INT,
    IN _fecha date,
    IN _cambio double
)
BEGIN
	INSERT INTO tipoDeCambio(id_tipo_de_cambio,fid_moneda,fecha,cambio,activo) 
		VALUES(_id_tipo_de_cambio,_fid_moneda,_fecha,_cambio,1);
    SET _id_tipo_de_cambio = @@last_insert_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `INSERTAR_VENDEDOR` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`adminjoya`@`%` PROCEDURE `INSERTAR_VENDEDOR`(
	OUT _id_usuario INT ,
    IN _cantidad_ventas int,
    IN _username varchar(100),
	IN _password VARCHAR(50),     
	IN _fecha_de_ingreso date,       
	IN _tipo_de_documento VARCHAR(50),
    IN _numero_de_documento varchar(50), 
    IN _nombre varchar(100),
    IN _apellido varchar(100),
    IN _fecha_de_nacimiento date,
    IN _telefono varchar(15),
    IN _direccion varchar(200),
    IN _email varchar(100)
)
BEGIN
	INSERT INTO persona(tipo_de_documento,numero_de_documento,nombre,apellido,fecha_de_nacimiento,telefono,direccion,email,activo) 
			VALUES(_tipo_de_documento,_numero_de_documento,_nombre,_apellido,_fecha_de_nacimiento,_telefono,_direccion,_email,1);
    SET _id_usuario = @@last_insert_id;
    INSERT INTO usuario(id_usuario,username,password,fecha_de_ingreso) VALUES(_id_usuario,_username,_password,_fecha_de_ingreso);
    INSERT INTO vendedor(id_usuario, cantidad_ventas) VALUES (_id_usuario,_cantidad_ventas);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `LISTAR_ADMINISTRADORES` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`adminjoya`@`%` PROCEDURE `LISTAR_ADMINISTRADORES`()
BEGIN
	SELECT a.id_usuario, p.nombre, p.apellido, p.telefono, p.direccion, p.email, p.fecha_de_nacimiento, p.tipo_de_documento, p.numero_de_documento,
			u.username, u.password, u.fecha_de_ingreso, a.area
    FROM persona p INNER JOIN usuario u ON p.id_persona = u.id_usuario INNER JOIN administrador a ON u.id_usuario = a.id_usuario WHERE p.activo = 1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `LISTAR_ALMACENES` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`adminjoya`@`%` PROCEDURE `LISTAR_ALMACENES`()
BEGIN
	SELECT a.id_almacen, a.nombre, a.direccion
    FROM almacen a WHERE a.activo = 1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `LISTAR_DEVOLUCIONES` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`adminjoya`@`%` PROCEDURE `LISTAR_DEVOLUCIONES`()
BEGIN
	SELECT d.id_devolucion,d.fid_producto,p.nombre, d.fid_reclamo 
    FROM devolucion d INNER JOIN producto p ON d.fid_producto = p.id_producto WHERE d.activo=1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `LISTAR_DOCUMENTOS_CREDITO` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`adminjoya`@`%` PROCEDURE `LISTAR_DOCUMENTOS_CREDITO`()
BEGIN
	SELECT id_documento_credito,fid_orden_de_compra,fid_documento_debito,fid_moneda,fecha_creacion,fecha_vencimiento,monto,anulado,activo 
    FROM documentoCredito WHERE activo = 1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `LISTAR_DOCUMENTOS_DEBITO` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`adminjoya`@`%` PROCEDURE `LISTAR_DOCUMENTOS_DEBITO`()
BEGIN
	SELECT id_documento_debito,fid_orden_de_compra,fid_moneda,fid_termino_de_pago,fecha_creacion,fecha_vencimiento,impuesto,monto,saldo,anulado 
    FROM documentoDebito WHERE activo = 1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `LISTAR_EMPRESAS` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`adminjoya`@`%` PROCEDURE `LISTAR_EMPRESAS`()
BEGIN
    SELECT  e.id_empresa, e.RUC, e.razon_social, e.direccion ,c.categoria
    FROM cliente c INNER JOIN empresa e ON c.id_cliente = e.id_empresa 
    WHERE c.activo = 1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `LISTAR_MONEDAS` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`adminjoya`@`%` PROCEDURE `LISTAR_MONEDAS`()
BEGIN
	SELECT id_moneda,nombre,abreviatura FROM moneda WHERE activo =1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `LISTAR_ORDENES_DE_COMPRA` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`adminjoya`@`%` PROCEDURE `LISTAR_ORDENES_DE_COMPRA`()
BEGIN
	SELECT id_orden_de_compra,fid_cliente,fid_vendedor,fid_moneda ,monto,direccion_de_entrega,forma_de_entrega,fecha_de_compra,fecha_de_entrega,pagado
    FROM ordenDeCompra WHERE activo = 1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `LISTAR_PEDIDOS` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`adminjoya`@`%` PROCEDURE `LISTAR_PEDIDOS`()
BEGIN
	SELECT id_pedido,fid_producto,fid_orden_de_compra,descuento FROM pedido WHERE activo = 1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `LISTAR_PERSONAS_NATURALES` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`adminjoya`@`%` PROCEDURE `LISTAR_PERSONAS_NATURALES`()
BEGIN
	SELECT  p.id_persona_natural, p.nombre, p.apellido, p.fecha_de_nacimiento, p.telefono, p.direccion, p.email, p.tipo_de_documento, p.numero_de_documento ,c.categoria
    FROM cliente c INNER JOIN personaNatural p ON c.id_cliente = p.id_persona_natural WHERE c.activo = 1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `LISTAR_PRODUCTOS` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`adminjoya`@`%` PROCEDURE `LISTAR_PRODUCTOS`()
BEGIN
	SELECT id_producto,fid_almacen,nombre,codigo_lote,precio,costo,devuelto,fecha_ingreso
    FROM producto WHERE activo = 1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `LISTAR_RECLAMOS` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`adminjoya`@`%` PROCEDURE `LISTAR_RECLAMOS`()
BEGIN
	SELECT id_reclamo,fid_orden_de_compra,fecha,atendido,justificacion
    FROM reclamo WHERE activo = 1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `LISTAR_STOCKS` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`adminjoya`@`%` PROCEDURE `LISTAR_STOCKS`()
BEGIN
	SELECT s.id_stock, s.cantidad, p.id_producto
    FROM stock s INNER JOIN producto p ON s.id_producto = p.id_producto;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `LISTAR_SUPERVISORES_DE_ALMACEN` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`adminjoya`@`%` PROCEDURE `LISTAR_SUPERVISORES_DE_ALMACEN`()
BEGIN
	SELECT s.id_usuario, p.nombre, p.apellido, p.telefono, p.direccion, p.email, p.fecha_de_nacimiento, p.tipo_de_documento, p.numero_de_documento,
			u.username, u.password, u.fecha_de_ingreso, s.fid_almacen
    FROM persona p INNER JOIN usuario u ON p.id_persona = u.id_usuario INNER JOIN supervisorDeAlmacen s ON u.id_usuario = s.id_usuario WHERE p.activo = 1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `LISTAR_TERMINOS_DE_PAGO` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`adminjoya`@`%` PROCEDURE `LISTAR_TERMINOS_DE_PAGO`()
BEGIN
	SELECT id_termino_de_pago,fecha_limite,numero_cuota,monto_cuota
    FROM terminoDePago WHERE activo=1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `LISTAR_TIPOS_DE_CAMBIO` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`adminjoya`@`%` PROCEDURE `LISTAR_TIPOS_DE_CAMBIO`()
BEGIN
	SELECT id_tipo_de_cambio,fid_moneda,fecha,cambio 
    FROM tipoDeCambio WHERE activo=1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `LISTAR_VENDEDORES` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`adminjoya`@`%` PROCEDURE `LISTAR_VENDEDORES`()
BEGIN
	SELECT v.id_usuario, p.nombre, p.apellido, p.telefono, p.direccion, p.email, p.fecha_de_nacimiento, p.tipo_de_documento, p.numero_de_documento,
			u.username, u.fecha_de_ingreso, v.cantidad_ventas,u.password
    FROM persona p INNER JOIN usuario u ON p.id_persona = u.id_usuario INNER JOIN vendedor v ON u.id_usuario = v.id_usuario WHERE p.activo = 1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `MODIFICAR_ADMINISTRADOR` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`adminjoya`@`%` PROCEDURE `MODIFICAR_ADMINISTRADOR`(
	IN _id_usuario INT ,
    IN _area varchar(100),
	IN _username varchar(100),
	IN _password VARCHAR(50),     
	IN _fecha_de_ingreso date,       
	IN _tipo_de_documento varchar(50),
    IN _numero_de_documento varchar(50), 
    IN _nombre varchar(100),
    IN _apellido varchar(100),
    IN _fecha_de_nacimiento date,
    IN _telefono varchar(15),
    IN _direccion varchar(200),
    IN _email varchar(100),
    IN _activo TINYINT
)
BEGIN
	UPDATE persona SET tipo_de_documento=_tipo_de_documento,numero_de_documento=_numero_de_documento, nombre=_nombre,apellido=_apellido,
		fecha_de_nacimiento=_fecha_de_nacimiento,telefono=_telefono,direccion=_direccion,email=_email,activo = _activo WHERE id_persona =_id_usuario;
    UPDATE usuario SET username = _username,password=_password,fecha_de_ingreso=_fecha_de_ingreso WHERE id_usuario=_id_usuario;
    UPDATE administrador SET area=_area WHERE id_usuario=_id_usuario;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `MODIFICAR_ALMACEN` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`adminjoya`@`%` PROCEDURE `MODIFICAR_ALMACEN`(
	IN _id_almacen INT,
    IN _nombre VARCHAR(100),
    IN _direccion VARCHAR(200),
    IN _activo TINYINT
)
BEGIN
	UPDATE almacen SET nombre = _nombre, direccion = _direccion, activo = _activo
    WHERE id_almacen = _id_almacen;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `MODIFICAR_DEVOLUCION` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`adminjoya`@`%` PROCEDURE `MODIFICAR_DEVOLUCION`(
	IN _id_devolucion INT,
    IN _fid_producto INT,
    IN _fid_reclamo INT,
    IN _activo TINYINT
)
BEGIN
	UPDATE devolucion SET fid_producto = _fid_producto, fid_reclamo = _fid_reclamo, activo = _activo WHERE id_devolucion = _id_devolucion;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `MODIFICAR_DOCUMENTO_CREDITO` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`adminjoya`@`%` PROCEDURE `MODIFICAR_DOCUMENTO_CREDITO`(
    IN _id_documento_credito INT ,
    IN _fid_orden_de_compra INT,
    IN _fid_documento_debito INT,
    IN _fid_moneda INT,
    IN _fecha_creacion date,
    IN _fecha_vencimiento date,
    IN _monto double,
    IN _anulado boolean,
    IN _activo tinyint
)
BEGIN
	UPDATE documentoCredito SET fid_orden_de_compra=_fid_orden_de_compra, fid_documento_debito=_fid_documento_debito, fid_moneda=_fid_moneda,
			fecha_creacion = _fecha_creacion, fecha_vencimiento= _fecha_vencimiento, monto = _monto, anulado = _anulado, activo=_activo
    WHERE id_documento_credito = _id_documento_credito;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `MODIFICAR_DOCUMENTO_DEBITO` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`adminjoya`@`%` PROCEDURE `MODIFICAR_DOCUMENTO_DEBITO`(
	IN _id_documento_debito INT ,
    IN _fid_orden_de_compra INT,
    IN _fid_moneda INT,
    IN _fid_termino_de_pago INT,
    IN _fecha_creacion date,
    IN _fecha_vencimiento date,
    IN _impuesto double,
    IN _monto double,
    IN _saldo double,
    IN _anulado boolean,
    IN _activo tinyint
)
BEGIN
	UPDATE documentoDebito SET fid_orden_de_compra= _fid_orden_de_compra,fid_moneda=_fid_moneda, fid_termino_de_pago=_fid_termino_de_pago ,fecha_creacion = _fecha_creacion, 
			fecha_vencimiento = _fecha_vencimiento,impuesto=_impuesto, monto=_monto, saldo=_saldo, anulado=_anulado, activo=_activo
    WHERE id_documento_debito = _id_documento_debito;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `MODIFICAR_EMPRESA` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`adminjoya`@`%` PROCEDURE `MODIFICAR_EMPRESA`(
	IN _id_empresa int,
	IN _RUC varchar(100),
    IN _razon_social varchar(100),
    IN _direccion varchar(200),
    IN _categoria varchar(100),
    IN _activo TINYINT
)
BEGIN
	UPDATE cliente SET categoria = _categoria, activo = _activo WHERE id_cliente = _id_empresa;
    UPDATE empresa SET RUC = _RUC, razon_social = _razon_social, direccion = _direccion WHERE id_empresa=_id_empresa;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `MODIFICAR_MONEDA` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`adminjoya`@`%` PROCEDURE `MODIFICAR_MONEDA`(
	IN _id_moneda INT ,
    IN _nombre varchar(50),
    IN _abreviatura varchar(10),
    IN _activo tinyint
)
BEGIN
	UPDATE moneda SET nombre=_nombre, abreviatura=_abreviatura, activo=_activo
    WHERE id_moneda = _id_moneda;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `MODIFICAR_ORDEN_DE_COMPRA` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`adminjoya`@`%` PROCEDURE `MODIFICAR_ORDEN_DE_COMPRA`(
	IN _id_orden_de_compra INT ,
    IN _fid_cliente INT,
    IN _fid_vendedor INT,  
    IN _fid_moneda INT,
	IN _monto double,
    IN _direccion_de_entrega varchar(200),
    IN _forma_de_entrega varchar(50),
    IN _fecha_de_compra date,
    IN _fecha_de_entrega date,
    IN _pagado boolean,
    IN _activo tinyint
)
BEGIN
	UPDATE ordenDeCompra SET fid_cliente=_fid_cliente,fid_vendedor=_fid_vendedor,fid_moneda=_fid_moneda,monto=_monto,direccion_de_entrega=_direccion_de_entrega,
			forma_de_entrega=_forma_de_entrega, fecha_de_compra=_fecha_de_compra, fecha_de_entrega=_fecha_de_entrega, pagado=_pagado,activo=_activo
    WHERE id_orden_de_compra=_id_orden_de_compra;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `MODIFICAR_PEDIDOS` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`adminjoya`@`%` PROCEDURE `MODIFICAR_PEDIDOS`(
	IN _id_pedido INT ,
    IN _fid_producto INT,
    IN _fid_orden_de_compra INT,
    IN _descuento double,
    IN _activo TINYINT
)
BEGIN
	UPDATE pedido SET fid_producto = _fid_producto, fid_orden_de_compra = _fid_orden_de_compra, descuento = _descuento,  activo = _activo 
	WHERE id_pedido = _id_pedido;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `MODIFICAR_PERSONA_NATURAL` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`adminjoya`@`%` PROCEDURE `MODIFICAR_PERSONA_NATURAL`(
	IN _id_persona_natural int,
    IN _categoria varchar(100),
    IN _tipo_de_documento varchar(50),
	IN _numero_de_documento varchar(50),
    IN _nombre varchar(100),
    IN _apellido varchar(100),
    IN _fecha_de_nacimiento date,
    IN _telefono varchar(15),
    IN _direccion varchar(200),
    IN _email varchar(100),
    IN _activo TINYINT
)
BEGIN
	UPDATE cliente SET categoria = _categoria, activo = _activo WHERE id_cliente = _id_persona_natural;
    UPDATE personaNatural SET nombre = _nombre, apellido = _apellido, fecha_de_nacimiento = _fecha_de_nacimiento, telefono=_telefono, direccion = _direccion, 
			email= _email, tipo_de_documento = _tipo_de_documento, numero_de_documento = _numero_de_documento
				WHERE id_persona_natural=_id_persona_natural;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `MODIFICAR_PRODUCTO` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`adminjoya`@`%` PROCEDURE `MODIFICAR_PRODUCTO`(
    IN _id_producto INT,
    IN _fid_almacen INT,
    IN _codigo_lote varchar(50),
    IN _nombre VARCHAR(100),
    IN _precio DOUBLE,
    IN _costo DOUBLE,
    IN _devuelto BOOLEAN,
    IN _fecha_ingreso date,
    IN _activo TINYINT
)
BEGIN
	UPDATE producto SET fid_almacen = _fid_almacen, codigo_lote=_codigo_lote,nombre = _nombre, precio = _precio, costo = _costo,devuelto =_devuelto,
						fecha_ingreso = _fecha_ingreso, activo = _activo
    WHERE id_producto = _id_producto;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `MODIFICAR_RECLAMO` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`adminjoya`@`%` PROCEDURE `MODIFICAR_RECLAMO`(
    IN _id_reclamo INT ,
    IN _fid_orden_de_compra int,
    IN _fecha DATE,
    IN _atendido boolean,
    IN _justificacion varchar(500),
    IN _activo tinyint
)
BEGIN
	UPDATE reclamo SET fid_orden_de_compra = _fid_orden_de_compra, fecha = _fecha, atendido = _atendido, justificacion = _justificacion, activo = _activo 
    WHERE id_reclamo = _id_reclamo;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `MODIFICAR_STOCK` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`adminjoya`@`%` PROCEDURE `MODIFICAR_STOCK`(
	IN _id_stock INT,
	IN _cantidad INT,
    IN _id_producto INT
)
BEGIN
	UPDATE stock SET id_stock = _id_stock, cantidad = _cantidad, id_producto = _id_producto;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `MODIFICAR_SUPERVISOR_DE_ALMACEN` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`adminjoya`@`%` PROCEDURE `MODIFICAR_SUPERVISOR_DE_ALMACEN`(
	IN _id_usuario INT ,
    IN _fid_almacen INT,
    IN _username varchar(100),
	IN _password VARCHAR(50),     
	IN _fecha_de_ingreso date,       
	IN _tipo_de_documento varchar(50),
    IN _numero_de_documento varchar(50),
    IN _nombre varchar(100),
    IN _apellido varchar(100),
    IN _fecha_de_nacimiento date,
    IN _telefono varchar(15),
    IN _direccion varchar(200),
    IN _email varchar(100),
    IN _activo TINYINT
)
BEGIN
	UPDATE persona SET tipo_de_documento=_tipo_de_documento,numero_de_documento=_numero_de_documento, nombre=_nombre,apellido=_apellido,
		fecha_de_nacimiento=_fecha_de_nacimiento,telefono=_telefono,direccion=_direccion,email=_email,activo = _activo WHERE id_persona =_id_usuario;
    UPDATE usuario SET username = _username,password=_password,fecha_de_ingreso=_fecha_de_ingreso WHERE id_usuario=_id_usuario;
    UPDATE supervisorDeAlmacen SET fid_almacen=_fid_almacen WHERE id_usuario=_id_usuario;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `MODIFICAR_TERMINO_DE_PAGO` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`adminjoya`@`%` PROCEDURE `MODIFICAR_TERMINO_DE_PAGO`(
	IN _id_termino_de_pago INT,
    IN _fecha_limite DATE,
    IN _numero_cuota INT,
    IN _monto_cuota double,
    IN _activo tinyint
)
BEGIN
	UPDATE terminoDePago SET fecha_limite=_fecha_limite,numero_cuota=_numero_cuota,monto_cuota=_monto_cuota,activo=_activo
    WHERE id_termino_de_pago=_id_termino_de_pago;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `MODIFICAR_TIPO_DE_CAMBIO` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`adminjoya`@`%` PROCEDURE `MODIFICAR_TIPO_DE_CAMBIO`(
	IN _id_tipo_de_cambio INT,
    IN _fid_moneda INT,
    IN _fecha date,
    IN _cambio double,
    IN _activo tinyint
)
BEGIN
	UPDATE tipoDeCambio SET fid_moneda=_fid_moneda,fecha=_fecha,cambio=_cambio, activo=_activo
    WHERE id_tipo_de_cambio=_id_tipo_de_cambio;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `MODIFICAR_USUARIO` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`adminjoya`@`%` PROCEDURE `MODIFICAR_USUARIO`(
	IN _id_usuario INT,
    IN _password Varchar(100),
    IN _fecha_de_ingreso date
)
BEGIN
	UPDATE usuario SET password=_password,fechaIngreso=_fechaIngreso WHERE id_usuario=_id_usuario;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `MODIFICAR_VENDEDOR` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`adminjoya`@`%` PROCEDURE `MODIFICAR_VENDEDOR`(
	IN _id_usuario INT ,
    IN _cantidad_ventas int,
    IN _username varchar(100),
	IN _password VARCHAR(50),     
	IN _fecha_de_ingreso date,       
	IN _tipo_de_documento VARCHAR(50),
    IN _numero_de_documento varchar(50), 
    IN _nombre varchar(100),
    IN _apellido varchar(100),
    IN _fecha_de_nacimiento date,
    IN _telefono varchar(15),
    IN _direccion varchar(200),
    IN _email varchar(100),
    IN _activo TINYINT
)
BEGIN
	UPDATE persona SET tipo_de_documento=_tipo_de_documento,numero_de_documento=_numero_de_documento, nombre=_nombre,apellido=_apellido,
		fecha_de_nacimiento=_fecha_de_nacimiento,telefono=_telefono,direccion=_direccion,email=_email,activo = _activo WHERE id_persona =_id_usuario;
    UPDATE usuario SET username = _username,password=_password,fecha_de_ingreso=_fecha_de_ingreso WHERE id_usuario=_id_usuario;
    UPDATE vendedor SET cantidad_ventas = _cantidad_ventas WHERE id_usuario=_id_usuario;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
SET @@SESSION.SQL_LOG_BIN = @MYSQLDUMP_TEMP_LOG_BIN;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-09-29  5:40:53
