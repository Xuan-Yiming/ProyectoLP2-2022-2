-- MySQL dump 10.13  Distrib 8.0.30, for Win64 (x86_64)
--
-- Host: dbproyectolp2.cq8hlrdo5fgj.us-east-1.rds.amazonaws.com    Database: DBProyectoLP2
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
-- Dumping data for table `administrador`
--

LOCK TABLES `administrador` WRITE;
/*!40000 ALTER TABLE `administrador` DISABLE KEYS */;
INSERT INTO `administrador` VALUES (1,'Logistica'),(2,'Logistica'),(3,'Contabilidad'),(11,'Contabilidad'),(14,'Logistica');
/*!40000 ALTER TABLE `administrador` ENABLE KEYS */;
UNLOCK TABLES;

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
  `fid_supervisor` int NOT NULL,
  PRIMARY KEY (`id_almacen`),
  KEY `fk_almacen_supervisorDeAlmacen1_idx` (`fid_supervisor`),
  CONSTRAINT `fk_almacen_supervisorDeAlmacen1` FOREIGN KEY (`fid_supervisor`) REFERENCES `supervisorDeAlmacen` (`id_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `almacen`
--

LOCK TABLES `almacen` WRITE;
/*!40000 ALTER TABLE `almacen` DISABLE KEYS */;
INSERT INTO `almacen` VALUES (2,'Almacen Proceres','Avenida Proceres 204',1,4),(3,'Almacen Faustino Sanchez','Jiron Faustino Sanchez 930',1,5),(4,'Almacen Cachinita','San Vigil 250',1,4),(5,'Almacen Tamaleros','Av Los Tamales 403',1,15);
/*!40000 ALTER TABLE `almacen` ENABLE KEYS */;
UNLOCK TABLES;

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
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES (1,'C',1),(2,'A',1),(3,'A',1),(4,'A',1),(5,'B',1),(6,'E',1),(7,'A',1),(8,'C',1),(9,'C',1),(10,'B',1),(11,'D',1),(12,'A',1),(13,'D',1),(14,'A',1),(15,'A',1),(16,'A',1);
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

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
  `cantidad` int DEFAULT NULL,
  `activo` tinyint DEFAULT NULL,
  PRIMARY KEY (`id_devolucion`),
  KEY `fid_producto` (`fid_producto`),
  KEY `fid_reclamo` (`fid_reclamo`),
  CONSTRAINT `devolucion_ibfk_1` FOREIGN KEY (`fid_producto`) REFERENCES `producto` (`id_producto`),
  CONSTRAINT `devolucion_ibfk_2` FOREIGN KEY (`fid_reclamo`) REFERENCES `reclamo` (`id_reclamo`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `devolucion`
--

LOCK TABLES `devolucion` WRITE;
/*!40000 ALTER TABLE `devolucion` DISABLE KEYS */;
/*!40000 ALTER TABLE `devolucion` ENABLE KEYS */;
UNLOCK TABLES;

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
-- Dumping data for table `empresa`
--

LOCK TABLES `empresa` WRITE;
/*!40000 ALTER TABLE `empresa` DISABLE KEYS */;
INSERT INTO `empresa` VALUES (1,'20492092313','Panchito Supermayorista','Jiron Faustino Perez 120'),(2,'20107458889','Sabanero Supermayorista','Jiron Carlos Alfajer 502'),(4,'20454713061','Almohadería Pedrito S.A.C','Avenida Francisco Javier Mariátegui 101'),(6,'20601208416','Galvaza S.R.L.','Avenida Zoey 101'),(7,'27895508416','La Casita S.A.C','Jiron Timoteo Perez 502'),(9,'25898665470','La TecnoTextileria','Jiron Ricardo Palma 901'),(10,'20494331315','EMCA Waori','Jiron Alberto Prada 201'),(11,'21589631005','Ripleysa S.A.C.','Avenida Faustino Sanchez 201'),(14,'20517905454','Cencosud Retail S.A.','Avenida Juan Pardo de Zela 315'),(15,'20337564373','Tiendas Ripley S.A.C.','Avenida Jose Luis Ramirez 115'),(16,'20345346543','Happy inc.','av.principal 1021');
/*!40000 ALTER TABLE `empresa` ENABLE KEYS */;
UNLOCK TABLES;

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
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `moneda`
--

LOCK TABLES `moneda` WRITE;
/*!40000 ALTER TABLE `moneda` DISABLE KEYS */;
INSERT INTO `moneda` VALUES (1,'Soles','PEN',1),(2,'Dolares Estadounidenses','USD',1),(3,'Yuan Renminbi','CNY',1),(4,'Euro','EUR',1);
/*!40000 ALTER TABLE `moneda` ENABLE KEYS */;
UNLOCK TABLES;

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
  `fecha_limite` date DEFAULT NULL,
  PRIMARY KEY (`id_orden_de_compra`),
  KEY `fid_moneda` (`fid_moneda`),
  KEY `fid_cliente` (`fid_cliente`),
  KEY `fid_vendedor` (`fid_vendedor`),
  CONSTRAINT `ordenDeCompra_ibfk_1` FOREIGN KEY (`fid_moneda`) REFERENCES `moneda` (`id_moneda`),
  CONSTRAINT `ordenDeCompra_ibfk_2` FOREIGN KEY (`fid_cliente`) REFERENCES `cliente` (`id_cliente`),
  CONSTRAINT `ordenDeCompra_ibfk_3` FOREIGN KEY (`fid_vendedor`) REFERENCES `vendedor` (`id_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=210 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ordenDeCompra`
--

LOCK TABLES `ordenDeCompra` WRITE;
/*!40000 ALTER TABLE `ordenDeCompra` DISABLE KEYS */;
INSERT INTO `ordenDeCompra` VALUES (3,1,7,1,1419.25,'Av Cerros de Camacho 102','EnAlmacen','2022-11-21','2022-11-23',0,1,'2022-12-02'),(4,15,7,2,598.08,'Av Gorriones 644','ADestino','2022-11-21','2022-11-24',0,1,'2022-12-06'),(5,2,7,2,312.82,'Av Los Perritos 100','ADestino','2022-11-21','2022-11-17',0,1,'2022-12-02'),(6,14,9,1,4407.5,'Jirón Camino Ainara 85','EnAlmacen','2022-11-21','2022-11-24',1,1,'2022-11-30'),(7,3,10,1,2632.5,'Av Camino Real 104','ADestino','2022-11-21','2022-11-19',0,1,'2022-11-20'),(8,7,10,1,3403.5,'Av Las Gaviotas 1002','ADestino','2022-11-17','2022-11-24',1,1,'2022-11-23'),(9,7,6,2,872.69,'Av Las Gaviotas 1002','EnAlmacen','2022-11-18','2022-11-22',0,1,'2022-11-23'),(10,7,13,2,1324.62,'Av Las Gaviotas 1002','ADestino','2022-11-21','2022-11-24',0,1,'2022-11-29'),(11,2,6,1,1489,'Av Los Perritos 100','EnAlmacen','2022-11-18','2022-11-24',1,1,'2022-11-21'),(12,4,8,1,2729.5,'Av Carlos Arias Araguez 75','ADestino','2022-11-23','2022-11-23',0,1,'2022-11-30'),(13,14,13,2,816.54,'Jirón Camino Ainara 85','EnAlmacen','2022-11-09','2022-11-23',0,1,'2022-11-23'),(14,13,12,2,1655.38,'Av Las Palomitas 100','EnAlmacen','2022-11-08','2022-11-10',0,1,'2022-11-22'),(15,3,7,2,1655.38,'Av Camino Real 104','ADestino','2022-11-09','2022-11-12',0,1,'2022-11-22'),(16,7,9,1,4535.5,'Av Las Gaviotas 1002','ADestino','2022-11-08','2022-11-13',0,1,'2022-11-19'),(17,5,8,2,758.85,'Jirón Andrés Calamaro 402','EnAlmacen','2022-10-12','2022-10-14',1,1,'2022-10-27'),(18,11,9,1,2515,'Av Pedro Ruiz Gallo 102','EnAlmacen','2022-10-19','2022-10-22',1,1,'2022-10-24'),(19,12,12,1,2515,'Av Faustino Sanchez Carrion 930','ADestino','2022-11-15','2022-11-17',0,1,'2022-11-20'),(20,12,12,1,1146,'Av Faustino Sanchez Carrion 930','EnAlmacen','2022-11-17','2022-11-19',0,1,'2022-11-20'),(21,1,6,2,570.77,'Av Cerros de Camacho 102','ADestino','2022-11-20','2022-11-24',0,1,'2022-11-27'),(22,6,9,2,596.54,'Av Joaquin Corrales 222','ADestino','2022-11-13','2022-11-15',1,1,'2022-11-20'),(23,12,12,2,337.95,'Av Faustino Sanchez Carrion 930','ADestino','2022-11-14','2022-11-16',1,1,'2022-11-21'),(24,1,6,2,344.1,'Av Cerros de Camacho 102','ADestino','2022-11-08','2022-11-11',0,1,'2022-11-18'),(25,2,6,2,651.15,'Av Los Perritos 100','EnAlmacen','2022-11-09','2022-11-12',0,1,'2022-11-19'),(26,3,7,2,662.56,'Av Camino Real 104','ADestino','2022-11-10','2022-11-13',0,1,'2022-11-20'),(27,12,9,2,392.44,'Av Faustino Sanchez Carrion 930','ADestino','2022-11-03','2022-11-05',0,1,'2022-11-15'),(28,6,8,1,1659.5,'Av Joaquin Corrales 222','ADestino','2022-11-04','2022-11-06',0,1,'2022-11-16'),(29,3,7,1,1740,'Av Camino Real 104','EnAlmacen','2022-11-06','2022-11-08',0,1,'2022-11-18'),(30,5,8,1,1307.5,'Jirón Andrés Calamaro 402','ADestino','2022-11-03','2022-11-05',0,1,'2022-11-15'),(31,9,10,1,1307.5,'Av Las Lomas 702','ADestino','2022-11-03','2022-11-05',0,1,'2022-11-15'),(32,3,7,1,1160,'Av Camino Real 104','ADestino','2022-11-03','2022-11-05',0,1,'2022-11-15'),(33,14,13,1,1972.5,'Jirón Camino Ainara 85','ADestino','2022-11-07','2022-11-09',0,1,'2022-11-19'),(34,5,8,1,701.5,'Jirón Andrés Calamaro 402','ADestino','2022-11-08','2022-11-10',1,1,'2022-11-20'),(35,4,8,1,633.5,'Av Carlos Arias Araguez 75','ADestino','2022-11-10','2022-11-12',1,1,'2022-11-22'),(36,14,13,1,677.5,'Jirón Camino Ainara 85','ADestino','2022-11-14','2022-11-15',1,1,'2022-11-22'),(37,11,9,1,1638.5,'Av Pedro Ruiz Gallo 102','ADestino','2022-11-14','2022-11-15',1,1,'2022-11-22'),(38,7,9,1,1589.5,'Av Las Gaviotas 1002','EnAlmacen','2022-11-15','2022-11-17',1,1,'2022-11-20'),(39,6,8,2,407.56,'Av Joaquin Corrales 222','EnAlmacen','2022-11-15','2022-11-17',1,1,'2022-11-20'),(40,9,10,2,369.1,'Av Las Lomas 702','EnAlmacen','2022-11-20','2022-11-22',1,1,'2022-11-23'),(41,10,9,2,318.33,'Calle Mariano Valdelomar 12','EnAlmacen','2022-11-20','2022-11-22',1,1,'2022-11-23'),(42,1,6,1,1762,'Av Cerros de Camacho 102','EnAlmacen','2022-11-21','2022-11-23',1,1,'2022-11-24'),(43,6,9,1,1270,'Av Joaquin Corrales 222','ADestino','2022-11-17','2022-11-19',1,1,'2022-11-25'),(44,8,9,1,2522,'Av Primavera 505','ADestino','2022-11-19','2022-11-21',1,1,'2022-11-28'),(45,7,9,2,427.56,'Av Las Gaviotas 1002','ADestino','2022-11-17','2022-11-18',1,1,'2022-11-24'),(46,2,6,2,345.26,'Av Los Perritos 100','ADestino','2022-11-17','2022-11-18',1,1,'2022-11-24'),(47,11,9,2,345.51,'Av Pedro Ruiz Gallo 102','ADestino','2022-11-18','2022-11-19',1,1,'2022-11-27'),(48,13,12,2,345.51,'Av Las Palomitas 100','EnAlmacen','2022-11-15','2022-11-19',1,1,'2022-11-29'),(49,6,9,2,338.97,'Av Joaquin Corrales 222','EnAlmacen','2022-11-16','2022-11-19',1,1,'2022-11-27'),(50,9,10,2,428.46,'Av Las Lomas 702','EnAlmacen','2022-11-14','2022-11-18',1,1,'2022-11-30'),(51,15,13,1,943,'Av Los Gorriones 644','EnAlmacen','2022-11-14','2022-11-17',1,1,'2022-11-27'),(52,13,12,1,2016,'Av Las Palomitas 100','EnAlmacen','2022-11-14','2022-11-18',1,1,'2022-11-22'),(53,14,12,2,452.69,'Jirón Camino Ainara 85','EnAlmacen','2022-11-16','2022-11-19',1,1,'2022-11-24'),(54,7,9,1,1248,'Av Las Gaviotas 1002','EnAlmacen','2022-11-16','2022-11-17',0,1,'2022-11-24'),(55,15,13,1,1281.5,'Av Los Gorriones 644','EnAlmacen','2022-11-13','2022-11-14',0,1,'2022-11-18'),(56,14,13,1,2425.5,'Jirón Camino Ainara 85','EnAlmacen','2022-11-13','2022-11-14',0,1,'2022-11-18'),(57,2,6,1,2964.5,'Av Los Perritos 100','EnAlmacen','2022-11-13','2022-11-14',0,1,'2022-11-18'),(58,10,9,1,1210,'Calle Mariano Valdelomar 12','EnAlmacen','2022-11-13','2022-11-14',0,1,'2022-11-18'),(59,2,6,2,443.46,'Av Los Perritos 100','EnAlmacen','2022-11-16','2022-11-18',0,1,'2022-11-20'),(60,14,13,2,501.03,'Jirón Camino Ainara 85','EnAlmacen','2022-11-16','2022-11-18',1,1,'2022-11-20'),(61,2,6,2,156.92,'Av Los Perritos 100','EnAlmacen','2022-11-14','2022-11-15',1,1,'2022-11-19'),(62,2,6,2,320.38,'Av Los Perritos 100','EnAlmacen','2022-11-14','2022-11-15',1,1,'2022-11-19'),(63,3,7,2,329.87,'Av Camino Real 104','EnAlmacen','2022-11-14','2022-11-15',0,1,'2022-11-19'),(64,5,8,2,418.72,'Jirón Andrés Calamaro 402','EnAlmacen','2022-11-14','2022-11-15',0,1,'2022-11-17'),(65,15,13,2,509.74,'Av Los Gorriones 644','EnAlmacen','2022-11-14','2022-11-15',0,1,'2022-11-17'),(66,7,9,2,410.38,'Av Las Gaviotas 1002','EnAlmacen','2022-11-16','2022-11-17',0,1,'2022-11-19'),(67,9,10,1,1032.5,'Av Las Lomas 702','EnAlmacen','2022-11-16','2022-11-17',1,1,'2022-11-19'),(68,12,12,1,1770,'Av Faustino Sanchez Carrion 930','ADestino','2022-11-16','2022-11-17',1,1,'2022-11-24'),(69,15,13,2,362.82,'Av Los Gorriones 644','ADestino','2022-11-21','2022-11-23',1,1,'2022-11-25'),(70,8,10,2,404.87,'Av Primavera 505','ADestino','2022-11-19','2022-11-25',1,1,'2022-11-29'),(71,8,10,1,1579,'Av Primavera 505','ADestino','2022-11-19','2022-11-20',1,1,'2022-11-22'),(72,13,12,2,446.28,'Av Las Palomitas 100','ADestino','2022-11-19','2022-11-20',0,1,'2022-11-23'),(73,14,13,2,194.49,'Jirón Camino Ainara 85','ADestino','2022-11-19','2022-11-20',0,1,'2022-11-25'),(74,3,7,2,323.85,'Av Camino Real 104','EnAlmacen','2022-11-15','2022-11-17',0,1,'2022-11-20'),(75,1,6,1,1113,'Av Cerros de Camacho 102','EnAlmacen','2022-11-14','2022-11-17',0,1,'2022-11-21'),(76,2,7,1,2304.5,'Av Los Perritos 100','EnAlmacen','2022-11-14','2022-11-17',0,1,'2022-11-21'),(77,8,9,1,709,'Av Primavera 505','ADestino','2022-11-13','2022-11-16',0,1,'2022-11-19'),(78,2,6,1,1996.5,'Av Los Perritos 100','ADestino','2022-11-14','2022-11-17',0,1,'2022-11-19'),(79,15,13,1,2023,'Av Los Gorriones 644','ADestino','2022-11-14','2022-11-17',0,1,'2022-11-20'),(80,11,9,1,1345,'Av Pedro Ruiz Gallo 102','ADestino','2022-11-08','2022-11-10',0,1,'2022-11-15'),(81,15,13,1,1455.5,'Av Los Gorriones 644','ADestino','2022-11-08','2022-11-10',0,1,'2022-11-17'),(82,11,9,1,2018.5,'Av Pedro Ruiz Gallo 102','ADestino','2022-11-08','2022-11-10',0,1,'2022-11-15'),(83,12,12,1,2101,'Av Faustino Sanchez Carrion 930','ADestino','2022-11-08','2022-11-12',0,1,'2022-11-16'),(84,10,9,2,606.41,'Calle Mariano Valdelomar 12','EnAlmacen','2022-11-10','2022-11-12',0,1,'2022-11-16'),(85,14,12,2,416.41,'Jirón Camino Ainara 85','EnAlmacen','2022-10-18','2022-10-21',0,1,'2022-10-25'),(86,8,9,2,271.15,'Av Primavera 505','EnAlmacen','2022-10-18','2022-10-21',0,1,'2022-10-25'),(87,7,9,2,858.72,'Av Las Gaviotas 1002','EnAlmacen','2022-10-18','2022-10-21',0,1,'2022-10-25'),(88,3,7,1,1372.5,'Av Camino Real 104','EnAlmacen','2022-10-20','2022-10-24',0,1,'2022-10-27'),(90,9,10,1,2242.5,'Av Las Lomas 702','EnAlmacen','2022-10-20','2022-10-24',0,1,'2022-10-27'),(91,1,6,1,1260.5,'Av Cerros de Camacho 102','EnAlmacen','2022-09-28','2022-09-30',0,1,'2022-10-05'),(92,8,9,1,1040.5,'Av Primavera 505','ADestino','2022-09-28','2022-09-30',0,1,'2022-10-05'),(93,4,7,1,1313.5,'Av Carlos Arias Araguez 75','ADestino','2022-09-28','2022-09-30',0,1,'2022-10-05'),(94,5,8,1,2570.5,'Jirón Andrés Calamaro 402','ADestino','2022-09-28','2022-09-30',0,1,'2022-10-05'),(95,13,12,1,3349,'Av Las Palomitas 100','ADestino','2022-09-30','2022-10-04',1,1,'2022-10-20'),(96,9,10,1,1057.5,'Av Las Lomas 702','ADestino','2022-09-30','2022-10-04',1,1,'2022-10-20'),(97,9,10,1,1306.5,'Av Las Lomas 702','ADestino','2022-09-30','2022-10-04',1,1,'2022-10-20'),(98,4,8,1,1884,'Av Carlos Arias Araguez 75','ADestino','2022-09-30','2022-10-04',1,1,'2022-10-20'),(99,8,9,1,1465.5,'Av Primavera 505','ADestino','2022-09-09','2022-11-12',1,1,'2022-11-18'),(100,2,6,2,319.49,'Av Los Perritos 100','EnAlmacen','2022-09-09','2022-11-12',1,1,'2022-11-18'),(101,12,12,2,411.92,'Av Faustino Sanchez Carrion 930','EnAlmacen','2022-09-09','2022-11-12',1,1,'2022-11-20'),(102,1,6,2,410.77,'Av Cerros de Camacho 102','EnAlmacen','2022-09-09','2022-11-12',0,1,'2022-11-20'),(103,13,12,2,271.15,'Av Las Palomitas 100','EnAlmacen','2022-09-07','2022-11-15',0,1,'2022-11-20'),(104,15,13,2,498.72,'Av Los Gorriones 644','EnAlmacen','2022-09-07','2022-11-15',0,1,'2022-11-20'),(105,6,8,2,453.21,'Av Joaquin Corrales 222','EnAlmacen','2022-09-07','2022-11-15',0,1,'2022-11-20'),(106,5,8,2,234.62,'Jirón Andrés Calamaro 402','EnAlmacen','2022-09-07','2022-11-15',0,1,'2022-11-20'),(107,7,9,2,234.62,'Av Las Gaviotas 1002','EnAlmacen','2022-11-09','2022-11-15',0,1,'2022-11-20'),(108,9,10,2,271.15,'Av Las Lomas 702','EnAlmacen','2022-11-09','2022-11-15',0,1,'2022-11-20'),(109,13,12,2,345.9,'Av Las Palomitas 100','EnAlmacen','2022-11-08','2022-11-12',0,1,'2022-11-17'),(110,13,12,1,1702,'Av Las Palomitas 100','EnAlmacen','2022-11-08','2022-11-12',0,1,'2022-11-17'),(111,13,12,1,2184,'Av Las Palomitas 100','ADestino','2022-11-08','2022-11-12',0,1,'2022-11-17'),(112,2,6,1,862,'Av Los Perritos 100','ADestino','2022-11-08','2022-11-12',0,1,'2022-11-17'),(113,12,9,1,1345.5,'Av Faustino Sanchez Carrion 930','ADestino','2022-11-08','2022-11-12',0,1,'2022-11-17'),(114,4,7,1,1600.5,'Av Carlos Arias Araguez 75','ADestino','2022-11-10','2022-11-13',0,1,'2022-11-16'),(115,6,8,1,3984.5,'Av Joaquin Corrales 222','ADestino','2022-11-10','2022-11-13',0,1,'2022-11-16'),(116,14,13,1,471.5,'Jirón Camino Ainara 85','ADestino','2022-11-10','2022-11-13',0,1,'2022-11-16'),(117,14,13,1,2083,'Jirón Camino Ainara 85','ADestino','2022-11-10','2022-11-13',0,1,'2022-11-16'),(118,5,8,1,2083,'Jirón Andrés Calamaro 402','ADestino','2022-11-14','2022-11-17',0,1,'2022-11-20'),(119,6,9,1,1796,'Av Joaquin Corrales 222','ADestino','2022-11-14','2022-11-17',0,1,'2022-11-20'),(120,3,7,1,1943.5,'Av Camino Real 104','ADestino','2022-11-14','2022-11-17',0,1,'2022-11-20'),(121,9,10,1,1943.5,'Av Las Lomas 702','EnAlmacen','2022-11-14','2022-11-17',0,1,'2022-11-20'),(122,6,8,2,276.28,'Av Joaquin Corrales 222','EnAlmacen','2022-11-10','2022-11-12',1,1,'2022-11-29'),(123,14,13,2,327.69,'Jirón Camino Ainara 85','EnAlmacen','2022-11-10','2022-11-12',1,1,'2022-11-29'),(124,13,12,2,237.82,'Av Las Palomitas 100','ADestino','2022-11-10','2022-11-12',1,1,'2022-11-29'),(125,11,9,2,1022.18,'Av Pedro Ruiz Gallo 102','ADestino','2022-11-10','2022-11-12',1,1,'2022-11-29'),(126,12,12,2,310.26,'Av Faustino Sanchez Carrion 930','ADestino','2022-11-18','2022-11-19',1,1,'2022-11-27'),(127,8,9,2,858.72,'Av Primavera 505','ADestino','2022-11-18','2022-11-19',1,1,'2022-11-27'),(128,11,9,2,305.9,'Av Pedro Ruiz Gallo 102','ADestino','2022-11-18','2022-11-20',1,1,'2022-11-27'),(129,3,7,2,338.46,'Av Camino Real 104','ADestino','2022-11-18','2022-11-20',1,1,'2022-11-27'),(130,4,7,2,255.77,'Av Carlos Arias Araguez 75','ADestino','2022-11-18','2022-11-22',1,1,'2022-11-27'),(131,14,13,2,477.82,'Jirón Camino Ainara 85','ADestino','2022-11-18','2022-11-22',1,1,'2022-11-27'),(132,10,9,2,321.92,'Calle Mariano Valdelomar 12','ADestino','2022-11-18','2022-11-22',1,1,'2022-11-27'),(133,10,9,2,461.54,'Calle Mariano Valdelomar 12','ADestino','2022-11-18','2022-11-22',1,1,'2022-11-27'),(134,6,9,2,359.74,'Av Joaquin Corrales 222','ADestino','2022-11-07','2022-11-10',1,1,'2022-11-15'),(135,7,9,2,324.62,'Av Las Gaviotas 1002','ADestino','2022-11-07','2022-11-10',1,1,'2022-11-15'),(136,14,13,2,335.9,'Jirón Camino Ainara 85','ADestino','2022-11-07','2022-11-10',1,1,'2022-11-15'),(137,8,10,2,293.85,'Av Primavera 505','ADestino','2022-11-07','2022-11-10',1,1,'2022-11-15'),(138,8,10,2,336.41,'Av Primavera 505','EnAlmacen','2022-11-07','2022-11-10',1,1,'2022-11-15'),(139,3,7,1,1873.5,'Av Camino Real 104','EnAlmacen','2022-11-09','2022-11-10',1,1,'2022-11-18'),(140,1,6,1,946.5,'Av Cerros de Camacho 102','EnAlmacen','2022-11-09','2022-11-10',1,1,'2022-11-18'),(141,6,8,1,734,'Av Joaquin Corrales 222','EnAlmacen','2022-11-09','2022-11-10',1,1,'2022-11-18'),(142,15,13,1,943,'Av Los Gorriones 644','EnAlmacen','2022-11-09','2022-11-10',1,1,'2022-11-18'),(143,5,8,1,2295,'Jirón Andrés Calamaro 402','EnAlmacen','2022-11-09','2022-11-10',1,1,'2022-11-18'),(144,4,7,2,253.97,'Av Carlos Arias Araguez 75','ADestino','2022-11-03','2022-11-05',1,1,'2022-11-14'),(145,5,8,2,408.72,'Jirón Andrés Calamaro 402','ADestino','2022-11-03','2022-11-05',1,1,'2022-11-14'),(146,3,7,2,305,'Av Camino Real 104','ADestino','2022-11-03','2022-11-05',1,1,'2022-11-14'),(147,11,9,2,297.18,'Av Pedro Ruiz Gallo 102','ADestino','2022-11-03','2022-11-05',1,1,'2022-11-14'),(148,10,10,2,164.62,'Calle Mariano Valdelomar 12','ADestino','2022-11-03','2022-11-05',0,1,'2022-11-14'),(149,9,10,2,452.56,'Av Las Lomas 702','ADestino','2022-11-03','2022-11-05',0,1,'2022-11-14'),(150,4,7,2,302.95,'Av Carlos Arias Araguez 75','ADestino','2022-11-06','2022-11-08',0,1,'2022-11-17'),(151,6,9,2,199.74,'Av Joaquin Corrales 222','ADestino','2022-11-06','2022-11-08',0,1,'2022-11-17'),(152,9,10,1,2392,'Av Las Lomas 702','ADestino','2022-11-06','2022-11-08',0,1,'2022-11-17'),(153,8,10,1,2469,'Av Primavera 505','ADestino','2022-11-06','2022-11-08',0,1,'2022-11-17'),(154,14,13,1,1245.5,'Jirón Camino Ainara 85','ADestino','2022-11-06','2022-11-08',0,1,'2022-11-17'),(155,9,10,1,1146,'Av Las Lomas 702','ADestino','2022-11-07','2022-11-09',0,1,'2022-11-19'),(156,2,7,1,2688,'Av Los Perritos 100','ADestino','2022-11-08','2022-11-09',0,1,'2022-11-19'),(157,13,12,1,1310,'Av Las Palomitas 100','ADestino','2022-11-10','2022-11-15',0,1,'2022-11-19'),(158,1,6,1,2227.5,'Av Cerros de Camacho 102','ADestino','2022-11-10','2022-11-15',0,1,'2022-11-19'),(159,6,8,1,1742,'Av Joaquin Corrales 222','ADestino','2022-11-12','2022-11-15',0,1,'2022-11-19'),(160,10,9,1,1246,'Calle Mariano Valdelomar 12','ADestino','2022-11-13','2022-11-15',0,1,'2022-11-19'),(161,12,12,1,2392,'Av Faustino Sanchez Carrion 930','ADestino','2022-11-14','2022-11-15',0,1,'2022-11-18'),(162,13,12,1,1529,'Av Las Palomitas 100','ADestino','2022-11-14','2022-11-15',0,1,'2022-11-18'),(163,12,12,1,2609,'Av Faustino Sanchez Carrion 930','ADestino','2022-11-14','2022-11-15',0,1,'2022-11-18'),(164,2,7,1,1629.5,'Av Los Perritos 100','ADestino','2022-11-14','2022-11-15',0,1,'2022-11-18'),(165,12,12,1,1629.5,'Av Faustino Sanchez Carrion 930','ADestino','2022-10-28','2022-11-03',0,1,'2022-11-14'),(166,5,8,1,1330.5,'Jirón Andrés Calamaro 402','ADestino','2022-10-28','2022-11-03',0,1,'2022-11-14'),(167,6,8,1,2101,'Av Joaquin Corrales 222','ADestino','2022-10-28','2022-11-03',0,1,'2022-11-14'),(168,3,7,1,2425.5,'Av Camino Real 104','ADestino','2022-10-28','2022-11-03',0,1,'2022-11-14'),(169,4,7,1,1294.5,'Av Carlos Arias Araguez 75','ADestino','2022-10-28','2022-11-03',0,1,'2022-11-14'),(170,13,12,1,1278,'Av Las Palomitas 100','ADestino','2022-10-31','2022-11-03',0,1,'2022-11-14'),(171,5,8,1,1950,'Jirón Andrés Calamaro 402','ADestino','2022-10-30','2022-11-03',0,1,'2022-11-14'),(172,6,8,1,1107,'Av Joaquin Corrales 222','ADestino','2022-11-04','2022-11-08',0,1,'2022-11-10'),(173,14,13,1,1586,'Jirón Camino Ainara 85','ADestino','2022-11-04','2022-11-08',0,1,'2022-11-10'),(174,2,7,1,1802.5,'Av Los Perritos 100','ADestino','2022-11-04','2022-11-08',0,1,'2022-11-10'),(175,12,9,1,1318,'Av Faustino Sanchez Carrion 930','ADestino','2022-11-04','2022-11-08',0,1,'2022-11-10'),(176,13,12,1,1278,'Av Las Palomitas 100','EnAlmacen','2022-11-05','2022-11-09',0,1,'2022-11-11'),(177,10,10,1,1909.5,'Calle Mariano Valdelomar 12','EnAlmacen','2022-11-05','2022-11-09',0,1,'2022-11-11'),(178,14,13,1,1246.5,'Jirón Camino Ainara 85','EnAlmacen','2022-11-05','2022-11-09',0,1,'2022-11-11'),(179,14,13,1,1606,'Jirón Camino Ainara 85','EnAlmacen','2022-11-05','2022-11-09',0,1,'2022-11-11'),(180,14,13,1,734.5,'Jirón Camino Ainara 85','EnAlmacen','2022-11-05','2022-11-09',0,1,'2022-11-11'),(181,13,12,2,399.36,'Av Las Palomitas 100','ADestino','2022-11-09','2022-11-11',0,1,'2022-11-14'),(182,5,8,2,263.08,'Jirón Andrés Calamaro 402','ADestino','2022-11-09','2022-11-11',0,1,'2022-11-14'),(183,14,13,2,560,'Jirón Camino Ainara 85','ADestino','2022-11-09','2022-11-11',0,1,'2022-11-14'),(184,12,12,1,1560,'Av Faustino Sanchez Carrion 930','ADestino','2022-11-09','2022-11-11',0,1,'2022-11-14'),(185,5,8,1,3862.5,'Jirón Andrés Calamaro 402','ADestino','2022-11-09','2022-11-11',1,1,'2022-11-14'),(186,6,8,1,758,'Av Joaquin Corrales 222','ADestino','2022-11-09','2022-11-11',1,1,'2022-11-14'),(187,5,8,1,2273,'Jirón Andrés Calamaro 402','ADestino','2022-11-09','2022-11-11',1,1,'2022-11-14'),(188,3,7,1,1624,'Av Camino Real 104','EnAlmacen','2022-11-09','2022-11-11',0,1,'2022-11-14'),(189,15,13,1,1313.5,'Av Los Gorriones 644','EnAlmacen','2022-11-12','2022-11-14',1,1,'2022-11-16'),(190,8,10,1,518.5,'Av Primavera 505','EnAlmacen','2022-11-12','2022-11-14',1,1,'2022-11-16'),(191,7,9,1,1624.5,'Av Las Gaviotas 1002','EnAlmacen','2022-11-12','2022-11-14',1,1,'2022-11-16'),(192,9,10,1,1017.5,'Av Las Lomas 702','EnAlmacen','2022-11-12','2022-11-14',1,1,'2022-11-16'),(193,9,10,1,1531,'Av Las Lomas 702','EnAlmacen','2022-11-12','2022-11-16',1,1,'2022-11-18'),(194,5,8,1,1104,'Jirón Andrés Calamaro 402','EnAlmacen','2022-11-12','2022-11-16',1,1,'2022-11-18'),(195,14,13,1,1742.5,'Jirón Camino Ainara 85','ADestino','2022-11-14','2022-11-15',0,1,'2022-11-17'),(196,5,8,1,1529,'Jirón Andrés Calamaro 402','ADestino','2022-11-14','2022-11-15',0,1,'2022-11-17'),(197,6,8,2,571.54,'Av Joaquin Corrales 222','ADestino','2022-11-14','2022-11-15',1,1,'2022-11-17'),(198,6,8,2,247.56,'Av Joaquin Corrales 222','ADestino','2022-11-14','2022-11-15',1,1,'2022-11-17'),(199,4,7,2,302.95,'Av Carlos Arias Araguez 75','ADestino','2022-11-14','2022-11-15',1,1,'2022-11-17'),(200,9,10,2,424.49,'Av Las Lomas 702','ADestino','2022-10-11','2022-10-14',1,1,'2022-10-19'),(201,13,12,2,424.49,'Av Las Palomitas 100','EnAlmacen','2022-10-11','2022-10-14',1,1,'2022-10-19'),(202,3,7,2,692.31,'Av Camino Real 104','EnAlmacen','2022-10-11','2022-10-14',1,1,'2022-10-19'),(203,7,9,1,2713,'Av Las Gaviotas 1002','EnAlmacen','2022-10-11','2022-10-14',1,1,'2022-10-19'),(204,7,9,1,1228.5,'Av Las Gaviotas 1002','EnAlmacen','2022-10-11','2022-10-14',1,1,'2022-10-19'),(205,13,12,1,1082,'Av Las Palomitas 100','EnAlmacen','2022-11-18','2022-10-19',1,1,'2022-11-23'),(206,5,8,1,3680.5,'Jirón Andrés Calamaro 402','EnAlmacen','2022-11-18','2022-10-19',1,1,'2022-11-23'),(207,15,13,1,1156,'Av Los Gorriones 644','EnAlmacen','2022-11-18','2022-10-19',1,1,'2022-11-23'),(208,10,9,1,1616.5,'Calle Mariano Valdelomar 12','ADestino','2022-11-18','2022-10-19',1,1,'2022-11-23'),(209,16,7,4,365.14,'-','EnAlmacen','2022-11-22','2022-11-22',1,1,'2022-11-22');
/*!40000 ALTER TABLE `ordenDeCompra` ENABLE KEYS */;
UNLOCK TABLES;

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
  `cantidad` int DEFAULT NULL,
  `descuento` double DEFAULT NULL,
  `activo` tinyint DEFAULT NULL,
  PRIMARY KEY (`id_pedido`),
  KEY `fid_producto` (`fid_producto`),
  KEY `fid_orden_de_compra` (`fid_orden_de_compra`),
  CONSTRAINT `pedido_ibfk_1` FOREIGN KEY (`fid_producto`) REFERENCES `producto` (`id_producto`),
  CONSTRAINT `pedido_ibfk_2` FOREIGN KEY (`fid_orden_de_compra`) REFERENCES `ordenDeCompra` (`id_orden_de_compra`)
) ENGINE=InnoDB AUTO_INCREMENT=480 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedido`
--

LOCK TABLES `pedido` WRITE;
/*!40000 ALTER TABLE `pedido` DISABLE KEYS */;
INSERT INTO `pedido` VALUES (6,1,3,10,0,1),(7,13,3,5,0,1),(8,8,3,20,0,1),(9,17,3,15,10,1),(10,11,4,10,0,1),(11,4,4,15,0,1),(12,17,4,15,0,1),(13,15,4,25,0,1),(14,4,5,15,0,1),(15,17,5,15,0,1),(16,15,5,10,0,1),(17,7,6,20,0,1),(18,16,6,15,0,1),(19,12,6,30,0,1),(20,8,6,50,0,1),(21,7,7,20,0,1),(22,16,7,15,0,1),(23,12,7,30,0,1),(24,11,8,10,0,1),(25,12,8,60,0,1),(26,8,8,47,0,1),(27,11,9,10,0,1),(28,12,9,60,0,1),(29,8,9,47,0,1),(30,11,10,10,0,1),(31,12,10,60,0,1),(32,8,10,47,0,1),(33,7,10,25,0,1),(34,2,11,11,0,1),(35,1,11,11,0,1),(36,6,11,16,0,1),(37,3,12,13,0,1),(38,9,12,21,0,1),(39,11,12,24,0,1),(40,17,12,31,0,1),(41,2,13,12,0,1),(42,6,13,17,0,1),(43,3,13,12,0,1),(44,15,13,28,0,1),(45,18,14,32,0,1),(46,1,14,10,0,1),(47,1,14,11,0,1),(48,19,14,34,0,1),(49,15,14,28,0,1),(50,3,14,13,0,1),(51,18,15,32,0,1),(52,1,15,10,0,1),(53,1,15,11,0,1),(54,19,15,34,0,1),(55,15,15,28,0,1),(56,3,15,13,0,1),(57,6,16,17,0,1),(58,5,16,15,0,1),(59,5,16,16,0,1),(60,7,16,19,0,1),(61,11,16,24,0,1),(62,5,17,16,0,1),(63,7,17,19,0,1),(64,11,17,24,0,1),(65,7,18,18,0,1),(66,17,18,31,0,1),(67,2,18,11,0,1),(68,7,19,18,0,1),(69,17,19,31,0,1),(70,2,19,11,0,1),(71,8,20,19,0,1),(72,11,20,23,0,1),(73,11,21,23,0,1),(74,15,21,29,0,1),(75,7,22,18,0,1),(76,5,22,15,0,1),(77,13,23,26,0,1),(78,16,23,30,0,1),(79,10,24,22,0,1),(80,10,24,22,0,1),(81,9,25,21,0,1),(82,7,25,18,0,1),(83,1,26,10,0,1),(84,14,26,27,0,1),(85,9,26,21,0,1),(86,17,27,32,0,1),(87,11,27,23,0,1),(88,13,27,26,0,1),(89,1,28,11,0,1),(90,7,28,18,0,1),(91,5,29,16,0,1),(92,12,29,24,0,1),(93,17,30,31,0,1),(94,18,30,32,0,1),(95,18,30,32,0,1),(96,17,31,31,0,1),(97,18,31,32,0,1),(98,18,31,32,0,1),(99,18,32,32,0,1),(100,18,32,32,0,1),(101,6,32,16,0,1),(102,16,33,30,0,1),(103,5,33,15,0,1),(104,1,34,10,0,1),(105,18,34,33,0,1),(106,18,35,33,0,1),(107,4,35,14,0,1),(108,4,36,14,0,1),(109,1,36,11,0,1),(110,10,37,23,0,1),(111,13,37,27,0,1),(112,6,37,17,0,1),(113,8,38,19,0,1),(114,16,38,30,0,1),(115,16,39,30,0,1),(116,8,39,19,0,1),(117,8,40,19,0,1),(118,13,40,27,0,1),(119,18,40,33,0,1),(120,18,41,33,0,1),(121,13,41,26,0,1),(122,11,41,24,0,1),(123,11,42,24,0,1),(124,16,42,30,0,1),(125,1,42,10,0,1),(126,16,43,30,0,1),(127,1,43,10,0,1),(128,3,44,12,0,1),(129,16,44,31,0,1),(130,9,44,21,0,1),(131,3,45,12,0,1),(132,14,45,27,0,1),(133,13,45,26,0,1),(134,3,46,12,0,1),(135,13,46,26,0,1),(136,12,46,25,0,1),(137,12,47,25,0,1),(138,8,47,20,0,1),(139,12,48,25,0,1),(140,8,48,20,0,1),(141,8,49,20,0,1),(142,12,49,24,0,1),(143,3,50,13,0,1),(144,7,50,19,0,1),(145,4,51,14,0,1),(146,17,51,32,0,1),(147,5,52,15,0,1),(148,14,52,27,0,1),(149,5,53,16,0,1),(150,12,53,25,0,1),(151,12,54,25,0,1),(152,2,54,11,0,1),(153,2,55,11,0,1),(154,10,55,22,0,1),(155,10,56,22,0,1),(156,15,56,29,0,1),(157,15,57,29,0,1),(158,9,57,20,0,1),(159,9,58,20,0,1),(160,13,59,25,0,1),(161,10,59,21,0,1),(162,10,59,23,0,1),(163,10,60,21,0,1),(164,10,60,23,0,1),(165,12,60,24,0,1),(166,12,61,24,0,1),(167,12,62,24,0,1),(168,12,62,25,0,1),(169,12,63,24,0,1),(170,8,63,19,0,1),(171,8,64,19,0,1),(172,14,64,27,0,1),(173,8,65,19,0,1),(174,14,65,27,0,1),(175,1,65,10,0,1),(176,14,66,27,0,1),(177,1,66,10,0,1),(178,4,66,14,0,1),(179,1,67,10,0,1),(180,4,67,14,0,1),(181,1,67,11,0,1),(182,1,68,10,0,1),(183,4,68,14,0,1),(184,5,68,16,0,1),(185,4,69,14,0,1),(186,5,69,16,0,1),(187,4,70,14,0,1),(188,13,70,27,0,1),(189,6,70,17,0,1),(190,1,70,10,0,1),(191,13,71,27,0,1),(192,6,71,17,0,1),(193,1,71,10,0,1),(194,4,71,14,0,1),(195,7,72,18,0,1),(196,11,72,23,0,1),(197,11,73,23,0,1),(198,4,73,14,0,1),(199,3,74,12,0,1),(200,2,74,11,0,1),(201,18,74,33,0,1),(202,8,75,20,0,1),(203,13,75,26,0,1),(204,2,76,11,0,1),(205,15,76,28,0,1),(206,13,77,26,0,1),(207,3,77,12,0,1),(208,17,78,32,0,1),(209,8,78,19,0,1),(210,2,78,12,0,1),(211,1,79,10,0,1),(212,5,79,15,0,1),(213,2,79,11,0,1),(214,6,80,17,0,1),(215,1,80,10,0,1),(216,11,80,23,0,1),(217,11,81,23,0,1),(218,18,81,33,0,1),(219,12,81,25,0,1),(220,13,82,26,0,1),(221,7,82,18,0,1),(222,18,82,33,0,1),(223,18,83,33,0,1),(224,15,83,29,0,1),(225,15,84,29,0,1),(226,2,84,11,0,1),(227,7,85,18,0,1),(228,1,85,10,0,1),(229,5,86,15,0,1),(230,19,87,34,0,1),(231,10,88,22,0,1),(232,10,88,23,0,1),(233,15,90,29,0,1),(234,6,90,16,0,1),(235,4,91,13,0,1),(236,14,91,28,0,1),(237,12,92,25,0,1),(238,13,92,26,0,1),(239,1,93,10,0,1),(240,14,93,27,0,1),(241,17,94,31,0,1),(242,2,94,12,0,1),(243,7,94,18,0,1),(244,19,95,34,0,1),(245,5,96,15,0,1),(246,10,97,22,0,1),(247,17,97,31,0,1),(248,13,98,27,0,1),(249,14,98,28,0,1),(250,11,98,23,0,1),(251,14,99,28,0,1),(252,11,99,23,0,1),(253,17,100,31,0,1),(254,2,100,11,0,1),(255,18,101,32,0,1),(256,9,101,21,0,1),(257,9,102,21,0,1),(258,3,102,13,0,1),(259,5,103,15,0,1),(260,9,104,21,0,1),(261,8,104,19,0,1),(262,8,105,20,0,1),(263,5,105,15,0,1),(264,16,106,30,0,1),(265,16,107,30,0,1),(266,5,108,15,0,1),(267,14,109,28,0,1),(268,1,109,10,0,1),(269,9,110,20,0,1),(270,11,110,24,0,1),(271,16,111,30,0,1),(272,7,111,18,0,1),(273,11,112,23,0,1),(274,1,112,11,0,1),(275,10,113,22,0,1),(276,8,113,19,0,1),(277,3,114,13,0,1),(278,7,114,18,0,1),(279,19,115,34,0,1),(280,17,115,31,0,1),(281,11,116,23,0,1),(282,4,117,14,0,1),(283,18,117,32,0,1),(284,3,117,12,0,1),(285,6,117,16,0,1),(286,2,117,12,0,1),(287,4,118,14,0,1),(288,18,118,32,0,1),(289,3,118,12,0,1),(290,6,118,16,0,1),(291,2,118,12,0,1),(292,18,119,32,0,1),(293,3,119,12,0,1),(294,6,119,16,0,1),(295,2,119,12,0,1),(296,7,120,18,0,1),(297,8,120,19,0,1),(298,7,121,18,0,1),(299,8,121,19,0,1),(300,8,122,19,0,1),(301,13,122,26,0,1),(302,2,123,12,0,1),(303,12,123,24,0,1),(304,4,124,14,0,1),(305,10,124,21,0,1),(306,19,125,34,0,1),(307,12,125,25,0,1),(308,9,126,20,0,1),(309,19,127,34,0,1),(310,6,128,17,0,1),(311,8,128,19,0,1),(312,18,129,33,0,1),(313,2,129,12,0,1),(314,4,129,15,0,1),(315,4,130,15,0,1),(316,13,130,26,0,1),(317,4,130,14,0,1),(318,4,131,14,0,1),(319,7,131,18,0,1),(320,4,131,15,0,1),(321,4,132,15,0,1),(322,12,132,24,0,1),(323,18,132,32,0,1),(324,18,133,32,0,1),(325,5,133,16,0,1),(326,18,133,32,0,1),(327,16,134,29,0,1),(328,6,134,17,0,1),(329,4,135,15,0,1),(330,14,135,27,0,1),(331,17,136,31,0,1),(332,8,136,19,0,1),(333,11,137,23,0,1),(334,8,137,19,0,1),(335,8,138,19,0,1),(336,12,138,25,0,1),(337,14,139,27,0,1),(338,16,139,30,0,1),(339,2,140,11,0,1),(340,18,140,32,0,1),(341,13,141,25,0,1),(342,18,141,33,0,1),(343,17,142,31,0,1),(344,4,142,15,0,1),(345,1,143,10,0,1),(346,10,143,22,0,1),(347,7,143,18,0,1),(348,1,144,10,0,1),(349,17,144,31,0,1),(350,17,145,31,0,1),(351,14,145,27,0,1),(352,6,146,17,0,1),(353,10,146,22,0,1),(354,10,147,22,0,1),(355,6,147,16,0,1),(356,4,148,14,0,1),(357,1,148,10,0,1),(358,11,149,24,0,1),(359,12,149,25,0,1),(360,17,149,31,0,1),(361,8,150,20,0,1),(362,11,150,23,0,1),(363,11,151,23,0,1),(364,4,151,15,0,1),(365,15,152,29,0,1),(366,12,152,25,0,1),(367,9,153,21,0,1),(368,7,153,17,0,1),(369,14,154,27,0,1),(370,4,154,14,0,1),(371,8,155,19,0,1),(372,11,155,23,0,1),(373,14,156,28,0,1),(374,15,156,28,0,1),(375,17,157,31,0,1),(376,8,157,19,0,1),(377,14,158,27,0,1),(378,7,158,18,0,1),(379,11,159,23,0,1),(380,9,159,21,0,1),(381,2,160,11,0,1),(382,17,160,31,0,1),(383,15,161,29,0,1),(384,12,161,25,0,1),(385,11,162,23,0,1),(386,5,162,15,0,1),(387,16,163,30,0,1),(388,15,163,28,0,1),(389,14,164,28,0,1),(390,17,164,31,0,1),(391,14,165,28,0,1),(392,17,165,31,0,1),(393,17,166,32,0,1),(394,8,166,19,0,1),(395,15,167,29,0,1),(396,18,167,33,0,1),(397,10,168,22,0,1),(398,15,168,29,0,1),(399,14,169,27,0,1),(400,18,169,32,0,1),(401,12,170,24,0,1),(402,2,170,12,0,1),(403,2,171,11,0,1),(404,7,171,19,0,1),(405,17,172,31,0,1),(406,11,172,23,0,1),(407,10,173,22,0,1),(408,16,173,30,0,1),(409,8,174,19,0,1),(410,5,174,16,0,1),(411,16,175,30,0,1),(412,13,175,26,0,1),(413,12,176,25,0,1),(414,10,176,21,0,1),(415,10,177,21,0,1),(416,7,177,18,0,1),(417,16,178,30,0,1),(418,3,178,13,0,1),(419,14,179,28,0,1),(420,12,179,24,0,1),(421,3,180,13,0,1),(422,13,180,26,0,1),(423,4,181,14,0,1),(424,9,181,21,0,1),(425,10,182,22,0,1),(426,1,182,10,0,1),(427,16,183,30,0,1),(428,7,183,18,0,1),(429,18,184,32,0,1),(430,12,184,24,0,1),(431,12,184,24,0,1),(432,12,185,24,0,1),(433,19,185,33,0,1),(434,1,186,10,0,1),(435,13,186,26,0,1),(436,6,187,17,0,1),(437,15,187,29,0,1),(438,1,188,10,0,1),(439,7,188,18,0,1),(440,1,189,10,0,1),(441,14,189,27,0,1),(442,6,190,17,0,1),(443,2,191,12,0,1),(444,14,191,27,0,1),(445,4,192,15,0,1),(446,8,192,20,0,1),(447,5,193,16,0,1),(448,13,193,26,0,1),(449,11,194,24,0,1),(450,12,194,24,0,1),(451,13,195,26,0,1),(452,7,195,19,0,1),(453,5,196,15,0,1),(454,11,196,23,0,1),(455,14,197,27,0,1),(456,9,197,21,0,1),(457,1,198,10,0,1),(458,2,198,11,0,1),(459,11,199,23,0,1),(460,8,199,20,0,1),(461,8,200,20,0,1),(462,16,200,31,0,1),(463,8,201,20,0,1),(464,16,201,31,0,1),(465,16,202,31,0,1),(466,15,202,29,0,1),(467,15,203,29,0,1),(468,14,203,27,0,1),(469,8,204,20,0,1),(470,6,204,17,0,1),(471,11,205,23,0,1),(472,2,205,11,0,1),(473,19,206,34,0,1),(474,3,206,13,0,1),(475,6,207,17,0,1),(476,12,207,25,0,1),(477,16,208,31,0,1),(478,10,208,22,0,1),(479,4,209,100,30,1);
/*!40000 ALTER TABLE `pedido` ENABLE KEYS */;
UNLOCK TABLES;

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
  `sexo` varchar(100) DEFAULT NULL,
  `telefono` varchar(15) DEFAULT NULL,
  `direccion` varchar(200) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `activo` tinyint DEFAULT NULL,
  PRIMARY KEY (`id_persona`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `persona`
--

LOCK TABLES `persona` WRITE;
/*!40000 ALTER TABLE `persona` DISABLE KEYS */;
INSERT INTO `persona` VALUES (1,'DNI','78443939','Jose','Marquez Lopez','1996-05-25','Masculino','943076603','Avenida Caminos del Inca 504','josemar27@gmail.com',0),(2,'DNI','75896625','Andrea','Mejia','1998-12-05','Femenino','958695224','Jiron Julio Vega Solis 504','andream99@gmail.com',1),(3,'DNI','78443939','Jose','Marquez Lopez','1996-05-25','Masculino','943076603','Avenida Caminos del Inca 504','josemar27@gmail.com',1),(4,'DNI','77895315','Joel','Aquino','2000-10-10','Masculino','984522681','Avenida José Larco 201','joelaquino18@gmail.com',1),(5,'DNI','75426855','Jarumy','Novoa','1996-12-26','Femenino','958475226','Avenida Manuel Vivanco 615','jarumynovoa25@gmail.com',1),(6,'DNI','76338475','Omar','Ruiz','2000-07-26','Masculino','943078555','Avenida Tomás Valle 102','omarruiz05@gmail.com',1),(7,'CE','001077238','Yiming','Xuan','2001-12-05','Masculino','913777985','Avenida Fernando Wiesse 204','xuamyiming@gmail.com',1),(8,'DNI','74882569','Pedro','Perez','2001-09-21','Masculino','914002568','Avenida Salazar Araguez 155','pedroperez02@gmail.com',1),(9,'DNI','77845699','Marina','Salazar','1990-03-01','Femenino','900145687','Avenida Lamar 504','marinasalaz27@hotmail.com',1),(10,'DNI','78569958','Alberto','Rivera','1995-12-01','Masculino','987556235','Avenida La Cruz 102','albertorivera01@gmail.com',1),(11,'DNI','78226532','Andrea','Pacheco','2001-12-05','Femenino','996584256','Jiron Mariscal Caceres 201','andreapach@gmail.com',1),(12,'DNI','78569958','Gerardo','Ramirez','1997-02-01','Masculino','987554128','Avenida Pedro Rico 555','gerardoramirez12@gmail.com',1),(13,'DNI','78995814','David','Llanos','1999-07-05','Masculino','987557098','Avenida Arias Araguez 503','davidllanos17@gmail.com',1),(14,'DNI','75889689','Omar','Palomino','2002-10-05','Masculino','94859837','Avenida Las Banderas','omarpalomino55@gmail.com',1),(15,'DNI','78935868','Lionel','Perez','2000-07-15','Masculino','998857998','Av Joaquin Corrales 102','lionelperez2001@hotmail.com',1);
/*!40000 ALTER TABLE `persona` ENABLE KEYS */;
UNLOCK TABLES;

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
  `sexo` varchar(100) DEFAULT NULL,
  `telefono` varchar(15) DEFAULT NULL,
  `direccion` varchar(200) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_persona_natural`),
  CONSTRAINT `personaNatural_ibfk_1` FOREIGN KEY (`id_persona_natural`) REFERENCES `cliente` (`id_cliente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personaNatural`
--

LOCK TABLES `personaNatural` WRITE;
/*!40000 ALTER TABLE `personaNatural` DISABLE KEYS */;
INSERT INTO `personaNatural` VALUES (3,'Pasaporte','119058769','Carlos','Guanira Del Mar','1980-12-15','Masculino','958665224','Avenida Óscar R. Benavides 124','carlosguanira@almohadaspepe.com'),(5,'Pasaporte','154889652','Fabiana','Cueva','1987-02-28','Femenino','958665478','Jiron Honorio Delgado 502','fabicueva10@camasac.com'),(8,'DNI','78559835','Armando','Lama','1987-06-28','Masculino','958696632','Jiron Hector Delgado 502','armandolama@gmail.com'),(12,'DNI','00211258','Leslie','Barreto','1990-04-18','Femenino','958956610','Avenida Gregorio Escobedo 502','lesliebarreto@gmail.com'),(13,'DNI','76882105','Franco','Leyva','1995-04-20','Masculino','994568225','Avenida Armendáriz 101','franleyva@fransac.com');
/*!40000 ALTER TABLE `personaNatural` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `producto`
--

DROP TABLE IF EXISTS `producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `producto` (
  `id_producto` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) DEFAULT NULL,
  `precio` double DEFAULT NULL,
  `costo` double DEFAULT NULL,
  `devuelto` tinyint DEFAULT NULL,
  `fecha_ingreso` date DEFAULT NULL,
  `foto` longblob,
  `activo` tinyint DEFAULT NULL,
  PRIMARY KEY (`id_producto`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `producto`
--

LOCK TABLES `producto` WRITE;
/*!40000 ALTER TABLE `producto` DISABLE KEYS */;
INSERT INTO `producto` VALUES (1,'Almohada de plumas',35.5,25.65,0,'2021-05-09',_binary '�\��\�\0JFIF\0\0\0\0\0\0�\�\0�\0	\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r( \Z%!1!%)+...383-7(-.+\n\n\n\r\r\r+++-++-+++-77---++++7-+-7+++----+++-++7+++++-++++++��\0\0�\"\0�\�\0\Z\0\0\0\0\0\0\0\0\0\0\0\0\0�\�\0-\0\0\0\0\0\0\0\0Qq!1Aa����\"R�\�2br�\�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0�\�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0�\�\0\0\0?\0�\��\�>�\0\00p \0��\�F	=>d��V�@�z *JM�T��\0\0\010O>�s\��\�\�$��s���/_#\�\�ۿYvǉ/�:a\�\'�d\��\0\'8�%�,\�\�\�/(��G#	\�>\"�G�~ҍ\�6�|}�\�2{_�)\�\�\��<F??�j\�ӏ\�\������5gjÕ�B�x�E�3�\����\�����W�\��\��\�\r�L/k��O���(\�2��r��e{FV�j@tXU\�\�\�e}�\0h�qA՗���e3\�\�O�\��\�6\�:\�\0�\�e��y��P�_���9�R\�\��\0\��iŖ:��\�4۞\�*6bC�؅�@�U*P�U�V��H0��U�&-5�=�=\�\��ZM��|L�<L\���\r\�\�F\��V��\0��5\�\�fYe\�$m�ԝf\0\�\��\�p��0W�S��\Z\�p�\0\�:Xڃ,�,�o�,Q�t���]\����ѠD\�\�+���V4�\�J�J&\�\��*\�񇢰g�\�p\�\Z^��&�ך���Xc\�VLq����vn�K��X����\�z�\�i�w�\���I\�e��}\�S�\�z�a\�:��V|6�EqV�J3\�Ŧ��=���J\�\� �_t�A껪Ҍ�4\�\�\�ΦֺFX�=+G� 	ī�3�h2�\��\�kΞ9h\'??%\�1�\'�:��\'z\��C\�֫/)��\0�j��12\��<��>���ݢ;?�Z�$�,����J\�h�\�Ɓb���g!\�z==\��4�ƺ\Z71m�\�˺s�\�b�\�h\�\0`\n�Ϳu�\��A��L�0+����۳�ލ�ǳzލ\�L�OB�l-+J\�-�\\J�F���\�\'E��-tp�rl-/C@\�G�\�h\���@��$\0�\r/C@�\r/I\�9r�[\� �GH&X�\'�UD�ު�\�\�\��o�\'�\�uc�\�P\�C��0g`�z+\0��X4f	\ZV���\��#J\�\��\�B\�#CK\�Q�h��9��\�\�κr�~$�R�U��&	\�\�˟S�\�\�p�7y�6��	�\')�wTN� \�@\Z\���\0F�\�`\�\ZU�J#G�hl\ZP�\r\0`F!�\0E\�:jV(\�\'7:�~>>W\�\�\�4\�T,LϫN\�]<\��\�\�\�yo\��\0�uc�\0\0\0\0\0\0\Z0\0\0\0�\0���x�7NpU%�&�\�<L�0O>�O�\�\�뤟�̾�^\�\0\0\0�ߜ\�\�\�c�\��a��8�\�ǟ\�5|F?#\�NW\�>\"r�\�\'*\r\�99`\��\�/��y\����<G\�\�6|G\�\�^\���\rß\�^P�M\���\��S���\�X�\�\��\�s�ʯ\�\���\�\�$\�6ݏ\�\r\��WX\�\�\�p�W\�\���&	\�ն�9$\�\�\�ǟP�\�r��\�^ۗ��\�\�\�{V|\�\�#<��\�\�\�Pҩ@\�*)��F�� � 2\�Z@v�\" �@Z@�/�\�\�ONWј�N6Yz�\0,@� \0�\0\"�\0`\0P�\�\0@\0�\0\0\0@\0`H\0*\0��\0\0\0�\�',1),(2,'Cubrecama Finisimo',55.5,34,0,'2021-08-09',_binary '�\��\�\0JFIF\0\0\0\0\0\0�\�\0�\0\n\Z\Z!.%#+!\Z\'8&+/1555\Z$;@;3?.4514!!!144444?64444144411414144444414444444144444444?4111��\0\0\�\"\0�\�\0\0\0\0\0\0\0\0\0\0\0\0\0\0�\�\0K\0\n\0\0\0!1AQ\"aq��2���B\��Rr\��#34bs���\�t�\�%CS\�$T���\��\�\0\0\0\0\0\0\0\0\0\0\0\0�\�\0%\0\0\0\0\0\0\0\01!AQ2�\"q�a�\�\0\0\0?\0\�qn\�%A�$�\�EJ�}\�]�ݼ�$\�Q�oU�djKMg�\�`�\�r\��t\�d\�h\�\���*����d,\�����áf?�)�\�\�\�{\�b?\��\0�\�hEy\�\n��lCaqV\�\'\��G��,,ږ͔�AQ\�C�7\Z]�7��a�Z�gM��\�j\�\�\�\�\��\0\�>��\�\�2k�oٸ\�\�\�4�y/�_\�\��\0x>KV��\�Q���n(G.3(2��<\�g\'~��S�4S�.�\�O�]�Q(�\n�5;5E�\�\rriSJ��҂`��\'��\0KQ�\�J����\'\�k�/\�t�/ц���\��\�~`?F\\G���נ]3\\hkñZc�^?D�q�t�\�\�\�q>#�)E^CR-B��Z�\�\�{��\�?\�\'\�\�-n}�=���>U�O\���\0�kq\�I����\�Wn>�?\��\0&�T��F*E�\�\�\�#\n\�{#�5\��V�\Z\�{,\"�\�?�\Z�1굔�M*��\�U\�*d\�A�F�\�\�\�C\�f\�\�FP6�\�\�#r~�h� �\Z\�g�-z\�<U�=�$\�uٹm߱\�5\�/�\\u\�\��̃�\��\�f9i\'_�Z�r�2��D\�\��\�nu_l�\\��\�4��w6\�<�\�kv\�\�s֮>�\�\�G���1?��,V�\n\��{8����+B\Z�W��\�j\�je\�Ң�w����\�\�>���U=�?��\�\�>��Mg\'~�I�\�G5\�k.\�H\rt\Z�\Zpj<S\�DT�ӵF�I\\&�`�>\"�����VI\�KMY>\�\��[�\��\0\�MS\��K�PL7����\Z\�\��W\�nzƀ\��oj\�\�-\�Pub�(\�\�XHu�c\�͔�ҽ+�`ݫ��o^���\��]\�\�?e>o^�+�\�\�+\�8�\�8�/�\Z�[�W�qU�\0ı�\�9PԷ^�&֔\�\�U�J�����\�\�\�8�ҧ�\�ko\�9�����Xq�\"x�V�^\�!\�$\�\�׏��\��\0?���\nz\�h�d~X�\��:���\�\�\�5�5�\��\�/�4�=V��v�\�d\�%Γ�\�\�^��r�\����ؓ\�g�®f��,p��*\"γ굋���x\�\�\�$�þ)\�\�Tm\�?O\rZd\�\�\�\�\�?\�X�\�j:�Z�\����Ջ��V*2�V�\�w����{Ã*َ��4��joM�bS�\�\�T7qi��\Zȯ�4\�nc\�\�\\>\�p\��E�X�@�W2��\�֦�o.\�:\�����g5��9���\�\�R\�%�K�l�L{�|h��\�\�\�\�>!4K\"�H$�CΙJ\�ǖ8˺ƃN��\��\�6\�V\�\�{.db@R\�Ĭh�\�w�\�倀�\�\�\�A�\�k�\�\����U\�b���6Ap#��$\�\�\�bF�dyG�G�8�\�d�\�f��A\�ͮ��k\�\�\�X�\�\�\�fw0�G{w��\�/��1�+�b|2\�zN��\�BS\rbN�1�^\�$P65��amY���DT#����]����^o	����fݰL+��:\�\���\Z�t\�\�\"#\�\���\�w�]�\�r2�dn�J\�\�\�<���\�\�Ǵ��;#w�1#�\�;�,����\�y/�ۏk�� d\�� �Hw?\�O�����a\�}���3H\�\�WH\�$׆�ԺC)�Ax�4��\�\�qϩ\'�\�a}�\�\�s5����3\�6�m��ߵ\�s�5#\��\0\�^�m\�\�߽�&�\�\r\��V�&2�)\�|�H\�O�PC\�\"\�$^wFb\�Om5��!Z��=�K�\Z�\�SsU\�q���\�|�\r\�eU��YKFҤ�Нj���\�\�.�L\n�r��\�C\n�ƀb\���\��=|_S<��Mcm\�\���zs�^-�VT\�\�\��/\�w\�DF\�\�x��u���\�良��H0\�\����G�|�\��l��\�Q�2\�K6F}d�D\�B�\�\Z\�\�\����2f\�ԍXΓ\�[�^\�\�]��)�m�1e+$s��:��#�A�A\"�dH;�cM]\�V�\�\�yL��\�G7\�y`\����0\�l=�\�v\�*\�\Z\�\\\�;LW1�e\0\�^z��{\�gg���\��^\�\n(I\n\��\�\Z\�+O\���B�8��\�J���8���ݲ\�u,@$\�v\�5Y�.�=�b\�!�[`	�A�s�\0U3�]p\��.���E\Z;�o�x�7ٗ��\\B3\�V]~�k8\�\�f!VI(\�=�<\��?\��\�P\n�\�\�m��Hd?�\�\�=�h��\0�@rt\0x\�]�ho\�\�w��\0��5g��B��Q\�q��{-\�N�\�\�Y.\�Za�\�3���X�\\�gm<N�~.3\�k��!\r���Jj\�w5�,F��\ZFdb$t$m\�U�\�,Z6v$�\�,v\�\�..\�\�E\�:v\\��\�#�\��Pe\�+�\�e\�\n \�\"[q\�U�ۼE�B bH\�S\�e��\�\�Mt�Z%ˆ%\�DFP���\�\�V?��Uk�ŉ,2��Ȍ@��ĝ\�S\�E\�<�Am���ѨP$�<\�\�A�\�߹h�u\�t�̣�y\Z�n=��o�K6\\@7QSD\�\��<�\�xV\��p\�����\0��V$i����<8]¾S�[��\�\�+	\�&	�\�gL\'\�\"�KN\�2�\�Na#C��Ǯ�\�k�l9�|\�\�BA��&Y1�\��\r�Wf�3�\�J\�\�j;�@S�%�ߘ;Q\Z\�\�\�9�GW\Z�F\�;Ɋ<8��dV���`��\�\�v�:Ʀ$=��\n\�IG]���$�h�\�`�n6f\���~yh4�< �\�r�t,��c\�\�\�Yon}�[����\\p��˲�h\�`OE\ZiW.�a���B\�|�\�O\�(�m�#�f����S��@0T�\�r畗O*\�p\�[+��t\�:�\rҡ��\�	YD\�̍v�\����5���f1��:�Ɂ�\�*3�de=G\�O*:c�\�@a-��N�\�­\"�i47�]\�`\�\��\�?�\�Za\"\"�r�e�\n\�IU\') ��c�����XEr�\� 9H	Ԉ\�PdK+<8����\�X}k\��3�mf�\0:��\�:%\�y$\�_�!HdVa�F<\�\�_���¥ℳ�\�d\�@5��\�\'�\�?�č�	\ZoSp\��\0ē�\�klߣ�\�r(�xю!q+u/\"��}\���:DDmάL�\�\��)�O�Ia��`.���殯\�\��\0\�F6�l\�X���ʪ\��\0P���Sӆ�\�p菛\Z&\��Ҫ\��\��?\ZT6�\�b\�\�f�(\��޵��A:\�\�3\�\�f\�C����ǭ\07 \�V�%\�\�]wL�\Zݴ\�,�y$��s\�Z�N\�\�l8`]*��&�䩝\�\�u�Y\�%����\�w#�͑-�\�8ڴ8�i\�\�LH�׈�	L�>@��\�\�m��jH��\\O��7-�9Q\�Rbc�\�\�U�8\�\�]MX��\�._g\�\��L�\�\0yF՗knw\'�\�U\Z^�/��4\�\�f�kIg�D���@*@\������\��Pu���G�ZS/��B%�7o�\�{L�f\nG12\��\�0\�[*�\�]\�\�Vc���A��bQv�Ls4Ҟ8�ѠEQд��4���\�9�\�&\�{�Q\�J+�x�:�s#\�d 6݈y��\�\�D`�6�\�\�|OƉp�\r�tc:0V�y� J�iA�����r\�%�\�\�\�6�\'��Oz����Y\�\�\��r��\0�\�\n%�\�\�o[�?�K�:\�S\�MMc\�\�9X\"B�\0\�L�\�٠�\0\�V�{!\�#�,B\0���v+��pˆ�QT�%B.���4\�E,\�\�\�q	@O٦�\�K\0ޞts	�F\�C�``\� J�$h	\�u��w��;T	v�v@cj�\�n��\"ކtv\�\�[�\"Ӝ��\�2�25�؟A�\r����I,\�KI\'/d�]\r6h\'�\�)L\�[*�Q\'sk��5^\�\rGPt]gC�;\�ץ^��ko��9Ci2��9�V\�\"��挼�\���%\�J�}�r����(\0\���՜6+w@�S�7\�9��\n\�ٕ�`\�%�j՛��\�}\�0} L\�\�Wg�;{\�\��\�z�\��8%��k�z�\��h�\��0<7=\�1�W\r�G�u��k\�5�\0M�\�\����[HFc�K@�\'�X��U\n:҂;2�d�\�F�52y\�-b\��\��\'\�O\Z��\�\�\�/�\��c\�x\�?\Zr\��\'����4\�\�]\�B�����G\�~F�8���/\�*j����Bn�B4T�`>f�8���ܣ\�&��zf\��=�c�\��4���\�%�\�\�e*]agR;�\�B�\�0�[>l�\�j�p�-u�\�&TE�Ag$�\0⫃�a�\0�S�\"�	\�q\�m)e\�&ٍ�\�n�\r\�7�\�\�w�0 \�Tr:��7�p\�%$\�BC�\�E\'�q\�jG@(�8p��(\02�\0=�\0~\��\�`\���\�\�\�%I\\�1�\�`�!Y>)�`s��\�Kv�\rOgo*�ݰ_�$�΢�[�җ\r\0�S��\�| P2��\�E�:�S��\�⿟\�\\\"(+����v5\�V\�wxoR�v�jA=5\� �\0�\�\�8��r4>m��]}\�\�;�˘�h\���k74�o*��k\�+*;��c_\�R\�\�Rwb�Dω�\�3�$\\h	�\�؂s2�\�cA�[�\0KȷR䧺���\�Y�.�>��q��%T\�\�9�Ц=/�d�\�n�\nU�V\���*\�}\�\�k*�c�=�@��\�I�J\�O\Z%�\�+�\��	 2�`uMc���\�r\�g:\r3[2�i$\��>U\�|#=�\�\�l\���\�I�h�wp�\�U=\�\�F�ք\���\�%0;��x4��Z��HF^&@@\�\�a\�\�΋\�\nô �ۍ;����� ��*z:��~4˶\�F�����5ֶ�iXv�4���K{��\� k��u�\�Fs1\"L��S�9?�H�yL\r���(<���\�͔�\�Xo�\\i�HI2�$�t<�Ҡ��\�)h߸�ur\�;��\ZRu�@u\�\�R��\�*���^R4\"�E�͇�\�a1\�InQ�~�|�M\Z\�]�X\�\�u*z�G��U�wUī:ՖTI�I�\�X�\"��\�D�+�\�Ty°���@\�\�G>ʜ�}:&�1͏��̷�ym\�A����Q�m\�T�q�K\���Q�~545�+\n�\�\'-\���C���\��q�\�\0��#�A\�hM�\'}Ky�c��Φ\0�\��S\���C��* ��<M4]\�\�V�\�Oq�UW\��՜#h<j��5{k\��Ҵ�`\�\�ȝ4��I_:?�\�\�A\�?\n��\�\�\�4=9r�\�a��\�Q�O�G\�¬[\0\�#]\�uY��*\�َ�)�\�\�֨�G\�\"#�u�����\���\"\��@y�>�-�#�\���s�@�k�s��=\�\�\�@g�\�U\�%\�rn\�P�\�2zEpl�\'\�m\�\�F���0|G:\�[0eL�B<\"�[\��@h\�:�\"�F�;COf}f��\\I\�/�\�@9I;L���\0@��	̍\�$��\�&`��|*��:\�\��\�7�KnÜ\�ɶ���+�b<�\n\�v�cߕ]�w\�O�U$Q\\?F\0꜁\"\�\�\�*,GDr�a5�o��m�\�\�\�\\Ǧ����H\\ġ\�\�ᦴAD24�Nc���E�\���\�z�VV\���H�e\"\'�\Zs�2\�|�sx�>��\��s�\�è\�\�\Z���IS��<\�ց\�V$�w5�\�bV\��\0��\�H�V�V<�\�CD�cx�\��\�\�\\\�ǯ�E\�P[�\�\�V �\�=\�U\�2ym�\�5t,�)��_\�y4\��m�\�cq=��B*�\� r_\��\�\r�z\�OƢ=K�[���0�;|\r8�Փ�/�C����\�ta\�0?\�Z\�\�V\�-*T�<����A\�a\�\�>�����\0\��\02~5\�&\�1�\�;<\�b��Te�4\�\�\�\��5��js$�먑\����6\n\�v�VD#ug�\�FW�T\�Ǆ\�҃ʆ\�Ըf��G\n�\�\�\�9�\0	X`�\�Y/.SA�#r렣\�f巂�\0Y���\n\�\��\�h���N\�$x\�O|�\�S-\�<�zT(��r\�\�L}jbQ�C\�h�=ʹ��SQ\\���$�iI��~c�\\m\0�`�Ph*���bv�\����,\�Z\"O�\��\�?\�Ɵ���j�w\"K\���\\(�1$\�y\�\�h-�!W��\r~TӋ?u}j�ڠ��zN�w\�8��~@𠙮\�;��|\�od`\��S;�^]\�\�\�=�\�L�y�\�?s\�r5��2�\���+3\�S{;��L:,�R�N�f=�H���pa�0�f\�C\�\Z��v\�1,\�3s\��0eT1̖n�\�ᘨ=�F�\�ŵb\'E\ZN\�\�\�f\�f?y\�\�}�o��\�<rwV�\��G+p,h	A>\�\�K)\0�ì&C�����zI\�kg1%�\0,y\0�VO��\�bY���u\�\Z�<��\�+_iN\�F�$Z�5�\�X���ضLK1%�\":�9o\Z\�T�\�\\q܉\�Ĩ��=��\�6�̤�Ӥ맩�\�q�3̑$ym=\�\�h\�9�|��c	\�H:��\��ڠ��i\0\��¥7�\�}g\�M����ס\�zȭ\"�\0\�22��T��\�\�z}��¸ـa\�� �>�s*�_d�9�d\'T0?e�\�ʑ\Z:U\�\�P9�Uw�W\�\�sc\�\0��5\0)!L\Z\�\�Q��L\�G\�J��\�(ۯ��_�#\��j7\�\��鸟em9S�\�g`dDY򮧲\�\���G�\�-2�r \�ZL1�z�������p{@FE �\"k;\�x1�K����T�\�;�jU�\�� u1㜏�Ԭ\�I�F�\�ERS*\�\�\�K��\n��F�~\Z��S�\�y~~�\�~\�ӕHhߟ\�\�w�\���k���\�J�\�YA�\�J	\�y�W�����\��=��z�\�\�Ƒ\�\�ʬD\�$N�hc�h|\�=�t���;�\\#J�\����	׾�\�^g^zμ\�ւaq��\��\�]K�l�N��\�ʣ�nt\n;��\0\"���\�@�\0)��\�F�s#�S�4�?x�\�3\�9\�Τ\�\�\n����>��5\�gn�I�\�a\�\r�\�-l\�Uq���Q\�7Ҥ\�8Aj\�a�\���`y�0\�\�\�k��a�!E\�{�@4P6�Zd��d\�\r,�,�<�ǗJϱ\�\�b�w.]�R۸Ӕ������\�d+ĒFY.\�K\�H\�y\�D\��\�r�p�\�F%�� \�D�8`�!	\�,�5-*z�Ƃ\�\�c\�i\���5��.%\�I\�f\��\���O!�)�=kO��X#1bys�:\�\"�\��m\�i\�\������k\�\�\Z~�I\�TX鮑\�o\�\�\�r0\0@\�\��-Br\�<?}5\���C��p�u��\�\�|Kvd�\'�C\�\�=+���\�=`wT8�\��\�A\Z<4\�\�\�LfK\��\�C\�\�㧝a\�\\\�F0�4�|�P{\r*øջ��\��b;BF�4>R\r*�2R�R�+K\��\�\n��%]\�)2��{%F\�W/(\�\�TbzP0�1\��\�\�\����W������\'\�A�Nr�F�r�Q���o\�5�5�\� �7,�wt\�\�J�=\��r\�P��s\�n��cʣ/ړ�\�\�5ĺt=\�������Anco\�E\r\�\�\�\�O=\�{NR	\�@�Ut1$�\�\�\Z�53\��D\\��R$\�\0�~M5�M\�U�.\�Ѓ�\�Mv!�jy�ȩ.[�>�� \�~\�փ�rt\0\����k�\��В;�\r4[<�\�|E=l��\�:\�/3@�k\�\�\�5waJ�\�\\ʜ�\�s9T�J\0$�\�T\�y\�\�ӝ^\�9�+ Oh;��ϓ\�kcփOƮ�b\�eT@\�n�C¤�~�X@T�,V09��\��ҙ\�1-n\�d�ݑ%U��ha\�GZ�Qr��&��I�c��\�׸��\�L�\�E\�\\>br1\�*�\�Q���ـ�\�#`3��\�\r\�b�\�*��\�eDpydox���śJ�\�\00�%Dl�_)\�Vĕlړ�ԟ����n;�PUDp	�bG\�bd�rq��\"�\�n\�U\�[@\��xf\�\���\�\�𤅠-Y�\n�շ}Ǆ,�\��^�[O���n\��\�<�\�\�֙e,�;�\�!A���\�\�|\�\���x�4�[\�\�1�9;��/����ᠭ/\�՜�FÙ�f\�E_\�렏t�j|\�V�\�\0.\��,�\�\�ƚX��,\�\�\�����k�h?:�\�I�\�ܹU��w�j�h\"&�M=\�U\�\�9��Ƹ\�Q�\���\�M\�z?1�\\t=}d��\�DARL;\�\�ko�\�\�Fc\�i\�ʼ\�x�\�O�\��\�EGe}\���>u:4I�?h����\�#�;w���x�\�\�\�\�\�@\����jL��\'^깂Pɑ�#�\�ʨ\�1\�?\�*n\�.c��>:\�J\�$w�:z\� r׼�=\��“\�Y\�Y���a\�\�\�B|}X�4�\�=\�~�J\�a\�#\�D�\�ˡ,�yG�*\�=\�:�z\���\�\�\�/\��\r>4o\r\���e�9ܖ<�O�\�G\�x��ڛ��)\n�&�#p\"\'Zfqn����\03>�cMA�H�\r�: �EQ\�\0�\�qܢ\�\�\����\�R\��0p\�^�׸\�x\�xf�\"�a�6\������o�j\�(��\�\�j��\\\�KR\�H-gw\�Cf�Re��ʥ�R\�S��jż-je�*\�|!snu�\�\�B,P\�.�i\��9$o�w\�kr\�\�iZ\�I�c�M*�o�֗ڎ�ւܹ*�ǸOu=�{��#�q��\�\��3\�_\�GQ\�R\�q\�z\�O�\�\�\rA�ҤK��\�\�龀�\r\�9o��\'\�\�;O�:�rX\"�\�J\�^Sn9\�\�t�\�P�~��iF�΀�\�}6\��m�X�F\�W�\�!2�|�U\�e\�~{\�\"\�S�\�1�\�OƳ(5\�_/Ǝ�^�=�Aܯ.�?J\�%\�=�QWS����Ӡ�k �ΣKé���\'Rz\�\��W�$z�k�56\�:^���Q\�\�a�{���c�p+����ս�\Z�v�\�4\���\�[T�T7í\��V[�������\���\�\�u5*�*h_�>�v��\rT�Y[\�N���6a\�*e7U�k�\�0\�fZ��+�F\nr�Ք�*uJ���~�:\��QNCU)\�k�ڃ�V�7`\�;��U�Y0�cuJ/��>)WvlX\�:�\��U���\�\�8֕*���s�\�\�\'e���\0P��y��R�N�����9\���&;��x}�\�ן�*U\�ç���Y\�봫�����ԩT�V��G��?�6T9��J�\0;Z\�\�\�ۏq\�)R��m\0\Z\0<*\�R�A2T\�J��S�r�¥Z\�*�K\�\ZHƒu֏[�Ү9v\�\�%=k��)\�J�E*\�J���a=\�J�\\{f�ҥJ���\�',1),(3,'Funda Infantil',25.5,10.05,0,'2022-01-09',NULL,1),(4,'Sabana Seda',20.5,7.05,0,'2021-07-07',_binary '�\��\�\0JFIF\0\0\0\0\0\0��\0<CREATOR: gd-jpeg v1.0 (using IJG JPEG v62), quality = 100\n�\�\0C\0�\�\0C��\0\"\�\"\0�\�\0\0\0\0\0\0\0\0\0\0\0	\n�\�\0�\0\0\0}\0!1AQa\"q2���#B��R\��$3br�	\n\Z%&\'()*456789:CDEFGHIJSTUVWXYZcdefghijstuvwxyz�����������������������������������\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\������������\�\0\0\0\0\0\0\0\0	\n�\�\0�\0\0w\0!1AQaq\"2�B����	#3R�br\�\n$4\�%�\Z&\'()*56789:CDEFGHIJSTUVWXYZcdefghijstuvwxyz������������������������������������\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�����������\�\0\0\0?\0��4ټ�\�\�\�\�h�1\�\�\�5\�rni�۔\��}>����H\�ǮXɸ�\0\�\�ѿ���\0?ҽ&\�b\�#�\�?\�OCҽ\0:y�g�W�ϧ���gν�\��\��~5�@����jH�m\�\�w\��\0�ϧ���H|���\0|�����/ƛZ6f�	���\0\�>���⺉��c�\��~Y�\0?�r�,\�\����^s�_N\��\0��\�\�um\Z\���\0���nB�x���hd\�^���t����rZM�\��\0J\�tY����\0�Ï�\�\�\�;\�f\��\0g\���\0\�Zզ�{��f̪\�\��\��ֲu)��wE�@<\���}OZе���\�\�\�ۿ_�b\�\r���\�\�ɿ�?\�t\�}zc�i��S2M�\�_\��	\�x�M\�\n�������+�V��u�\0\�\�\��\�\Z\�5\�ݧ.\�\�?��\0�o��p\�K7\�g\�s��\�G\�M�}\�}\�\�77�\�\��\0;��h�ᙝ[�J|�\�O\\�+�\�[�$�}�\'\��n?ϧ\�\�țQ��\��z秭t\�)ƙl[��q�\0��?ւ\r�q���\0\���_�\0Ǔ��4̮�\���\0\�\��y\�[\�6\�|\�\�?�\�\��\0�\�@�\�\�R��\0,\��\0=?�x�\�J�Vo�\��u�\0?��[\��)�\��U�����q�o��\�w���7��\�\��{��y\�<G#3v\���\09�&��in:���\�_ǽF�0�}8\���h\�\�\�\�I�\0>\���|\����\�l\�\�\���L\�s\�\�\�p\�\�\Z��\�\�\�F\�o~y\�&\�M�Wo�K�龂J\�.\�\�k\�\�Wo��\�\���*�-���ݾ�\��Z\�u�\Zh��-�=�\�g\����\����\�|DԷ�\�\�gf�<�\�\�\��s\�\�^>\'8˨I�bIixЋ�m��IS�����۶�=}����OuZ\��z\�\�\�o^�v~U��q߷^��ۤ�t�}s\�;g�cڼ\�\�Z\�\�\�U��\�	�/���\0�YM�_H\�d��\��\0߹�z���y\�\�|3�aB�\���(C�\�\�\�\�\�։|�[Y�z��\�i\��m�U�zz\\��kwڡUߜy��\����\�\��\��\0ǯ_�\���V���y�z��\�\��\0�\�\�_���帙y�\�\�\�\��\0\�?\\\�_SrR������k\�\�\�ݶ\�W�l�U�\�ˑ�\0�G�)e<�1�?�luǵQԷ(�m���F�O?��\0#^7��|��\�}y����y�߇\��\�S��&��c�T�e�&�nS\���ߧ��t.#\�\�1R\�\�M�RR�\�ٵ���udK.��\�R]S��\�\���\�\�Zg\�\�\��~G\��?\�\�]T?\�\��3�?��x��/�\�f�[M\�~\���\�㧿>\�x\�t\�-c;o4�U\�1���}\�\�\�>�\0λ(\�yt⓬\�I����K^��<V�9\�\�F\\\�<\�+�z%�Ͽs�\�\�\�H\�r��\�\�\�i��ܶ\�\���_��=Gׯ_:��F��yg�Dn�y�������\0��Jm\�\�I�; ��s��t?�j��֥Y\�TjS��-�9\�Kn�-\�\�k\�٘J��<e�\�\�Y\�f\�1,ޥ3��LW1#~�O˿�\��\��\�C�I�7\�UJ�\�u\��t\�r�h\��G\�\�៯\�\�޶�jٞ�\�?\�\�?Z�#6wr����=�\0�\�Y�\����\�\�\�\�\�@s��\�\�`[\�\��g\�΋\�\�\��\'���oϫ[\��\0��\Z\�n�`\�w�\0Y\�n�\�\�\��\0�������L�c�\��9X\�\�l��\����\�N���.��\�\��\0�4�mq\'ݏg\��\0M3�sןֹ8N?\�?�p+�֕���Y���\0�Oo��rv�>n���\��\�U7\�z+~��\Z�4j����\0�\��\0��K\�Xh\�5Wf}3\�\��\�\\_4�(\�4?^\'\���+CŒyjͷsl1��\0�޿\����\�ˀ\�\�\�����\0��k\�>@\���y}r?\�>��\�&\��Z������\�߽i_`�_���_\�~���^Z�T՘6�ﾳ�~�\0�\'\�v�\0?ִ5銇�C3\�7\��\0תzHi5�]Ý�c�\���\��\0\�\�\�R^n��Y\�\�\�o�\08�����2G\�#/ޑ\�̚?�\�\�����q�\�\�\�\\\�\'\���\0?\��\�j�yv\�30�����\0�s\\\�䴛x\��X�\0?S@Z�;�\�߾�\0=�?�UV��\�9\�\��\�®/\�\�]ˏ���?\��\�P¥ݾ_�?\���������\�L\�\�\�\�\��\0�\��\�^�\�|�ͻ���=�\��ּ��3\�8�\�8��ϟj�\�.%�ûs�O^���f�J\\\�\�\�<�����\0\��c��\0?�y���l���\0{\�O��\�L�>�ץ^\�\���\0\'���1�Y5�E���\0�\����\0\0\�_��\�\�\�0>y�0qE^�\0\�\�Q\�\��\0O/?���}\�ywP\�\�T�\�?����\�\�Ѭd���\���q�}�W�j\�\'��o3�\0�\�\��Ww�͸�\��\�\��\09�\0�t\�=:V�]�F?�m�g9\�y���?\�Z�9�f�\0\�G\�\��\�\�YѰ]���v{�\0�������}���\0W�\0_��B\�L^��\0?Oîk\�M\�i3\"\��&�N}s�{\�\��~#�\0>�\�zt�]r\�\�:\�\\\\%�n�ۣ\���θ\��\0\�\��\�W\�}H\�����h�\Z�\�-צe�\�]\�wt\���\0�k��n\�ן\\�Z�\�,|\�D7^wٞ�$3\�o���O�|�\0��z\�\�\���o\�j\�\�l�l\�\�0\�a\�E�Ǒ�kc������|R�\��y�\�\�wܲkV۹~�On��\Z\�\���d_��6R\�i�\0\�?�Mgt��\��_���۟�^*��\��Vm\�|��\��\�J�\�����Z�nϮ��\���]�V��N�n\���\��3\��5ưV۹�\���\���k\�3ag�\�\��\��}���K2�n\��>��\0\�4M\�ݯv�\�\�I�I&\�[�满\�.\�U��=�?Q]&�\��-��o���q���\�3�w\�~���q\�޶�vŊ�\�i���l�q�5�����=���z��\��K��\��\0�N�\�֧\�y�\�\���\n�|��\�\����Iv۠UP���\��9�}*�I��F�\�\���O�c\�Xjq���\0׷��R��Z|��3?�?\�s\�\�׭\�?\�Hw\\\�mߏ�\��\�G\�ڦI�e\�\�mP\�$�[\����N$�\���\07\���\���\0\Zl������Ϩ�\0?\�W�C\��\"ݿ\�i��c\�\����\'�\�\�\��Ef\��{=SZO\�\�r�\�_\�\�st�\0���y�\�ֹ��\�6��\�jƔɿ~rMZ\�\�\�\�h�k�\�kKR��)E\�m������OH��\�\�Ե+=.\�\�WҤ1\��\��\0���\0˿o�\�χ��ƳjS\�\��\��\0�\���\0J1�u\�ߊ\��\�kP֮f���{\�\��\�\��\0u\�O���s�\0hVUo�\�_O\��=8���5\�\�e\�\�G�qR��v�5YGݔZzA7mo\'s\�y[��\�iTz�[H�d�]\�v\�\�\�dj\�k2\�j�\�l����\0_j�\�y�ZL��\0\�ӟo�\���M��\�\�\��_σ/��\0>柝i�f2/��߁\��\�\��\�k\�\�2:{\����\��l�!�V\�8��I���\��v۲�5�v*\�G�\�Oݧ�^�\�\�ߚ��\�>_��?է8�\0�s�5�\r\�v�G\�Ϳ\�\'^��\�U\�\�̸X\�\�gI�t�\0�#\��^q\�\��\�*~���ֶ�\�\�-:6Z\�&\�i�E��}7\�\�ڒhw+4\�\\�\�7�\�\�\��x\�N�t�#U_-��7q_\����}��\����\���\�䚒K\�\�ʒo�<��l�\����\�\�\�JI5m�\����𶵮\��\�>]u���[˸�Eo:+��%\'\���\0 ג;��uy\����?٠�)?N\�沼\�Z?9\�m�\0�\��\\�\��?\�]�afX为�g���^\�\��\�=�\0\�14\�k4���\�\�S\�\�\r\���߯Oį~זi\Z��;�\�ߚ�}�\�\���:w�6�mB�孜ɳ\��&�y\�{\n\�5\r>\�G�u��o\�\�͏��\0\��W�(�-�y_\�\��\'���/=��\�v��\�\����zě�U^5\�\�\���\����+�\��$j�!_�\�\�Ư�\�\�\�\�V�?\�\�\�\���ߥy}\�\�\�0��e\�\��3[����?�{��\�u�h�\�Vq<�w�}�>\����\0Q\�d�5p\�S�9\�q\�P��_m�\0G����X�\�QQn\�MFI\�\�\�\�e��V�\�ZW\�\�=YBj\�\�k\';\�l�͵�\0���\0�\�\����˚H\������;\��\�\��_�$h���[�O.dN7���>\'�뎟\�鴟�\�xFI&�i��\�}��m$��^\'��\0�n?\�\�}]\�N*+j���~��X_y8�\nu7VN*\�\�\\\�\�\�򼽂i�����.�tik\��\�C\�o�����C��[��nz����ָ_x��Mf5f\�nt�\�&;��|���\�[�\0ӯ\�3}\�\'�\����k\�hV�zq�M�N�R�q�[�JϖIIm�H�gS��K�-�%(\�\'�ڋ�^\�f\�o4G��5(}�a�g\��ǧ�\�]�\�mi����\0#\��~u\�z|�\��\�>Q��}���^:\��&_2O�=GN��\0\�?�]V���-�����\0\�5\��T�o��\���\�X�\�\�\�\�\�\�\�\�\�5��2\�\�y\�\�C�#�ǧ��\0�)\Z�(���\0~Jc.BW\�\��\"hs\�\�\���}jo�$��d?\'\�\�?�\�Af��-A�\0�������e&\�U\��1�\��(�\��aT��ݳ�\�\��\0����\�*��\�\��_\����j\�ϑ6;���\0�+\�}\�I���\�`*\�.��O	gy�\0�=�\0\�5bee\\\�\�\���_�Z���ۋ�\�\�\�c�\��^>���\�5�\"��w.\�<\��{�\0^�\0�;�\��\�{_\����fQ\r��\�\��_\��\0>�\�\�v\�\Z�>w��\0\�\�\�\��mk\�,��7\�v���?OZś\�{u\\�����\0N��(m%w�@:l*��\��\0\�Q\����_��L\�ߥ\�f\r�j�\0|\�\�߷OlW}ះ~&�,\�\���\��\0\�\�j_���\�o�\0w?��\�������_\�y�ٳ��\0\�^�\�:ãH��\�1\��\0��o��^�\�g\�߁\�M�\�\�kך�\�\�O&�[X\��_\�+\���\0\�1�N���?�\�͛\��>~��\�Nޟտ\�\�Lz-\�K��\�}��\�äj���o�\�:�\��\0\�\�\�y}?.�{\�>�پ\n�\�\��u-jm\��o��ڷ�j���?\�_�~ʾ�����x�\�\�d pv~?���x~�\�+�JY$��\����6^�\�-��\0\��\0�\�R�U\��J�W��F\�֊W��O�\�\�)\�\��5�\0��Qm��\�xw��@\��\0H\�q�+]]��\���\0���>�V>\�\��\�\��\����\�+z\�\�[\�C\��\0?�Z\�[�\�o�\�\�pk����n\�݋�y��Qϛ$?�\�n?\�\�}�\��$~\�\��鶺���ׯ-`�&��\�\��j�C���\��\0\�#\�?\��\��?�WF#C	\�1aJ�(9U�6�)\�>�\�6��c�\�Uc\nt\�V�\ZT�\�RmF���\'�c\�R�I-/v寧\�&\�\�?�\�t��EM.\�|��\��~��W��į�K2��\�\��C�Ĺ\��,�g�G���\�\�칻�_\�zֵ���!s7��M�\�̅\�\�1I?��:�k���\���\0?˹\�\�\�\�\�ͻg��\�\��y\�ް5�Yu-R�Y<��\�̶�ɖ;\��y�\�\�O�g\�\�\�\r\�\�y:\�+o�\0�\��\��\0��M��ɳ\�\�,$W??�d\��_q����9;��]\Z���{�n�f�\�\�<\�\�i�kپ	c�ӽ\��}\�\�cߥt\Zl\�ʿl��\�\�\�\�!�Κa�:\�f\��\�\�������\�~e���<��\�M7�֟gqsq���\��bv��h\��\�j�F�_2\�4\��\�\�\�\�<����D����}�\0\�\�o����b�\�ͭyu�u٭?SCkO\�vЪ�\�\��=�\0\�ϵ6����q�rq���\0>�sF�gp�Ekkgs$v�\�\Z\'�>?\��\��g���qđ��n�g�\�_�\0_�N<\�5\�\�m\��S�\�D�n-+\�\��(�y�N�7�\�?(:��\0>+�,\��\0/ƽ*\��~]�6w�O2\�\�\�O�\�\�\�n\�x_I�;�\�$n��{/�_�\�Qr�����)ٶ�v\�\�y\"\�\�]/�=�\�7�	��\���+�\��J;e�h\��io\�\�G��\�\�>�����4�?\�{��\�{\�vb\�V6E\�\�,�\�\�=iF..\�_��(%���\�`\��i�$m\�\�.\��\�Vռ0\�?%/�\�7�\���\��Єo�t\��\��\0[\�s\�qX�6]WV\�l\��x�\�m׹�=��_���6�\�)$�\���Vսo�o�*\�l�:Hd�k.\�c�\���\�\�J˼��eܲ\��˝\����o�ׯQ\�^c�|\\���o4�����h���ym>��\�ӭ\�\��\0I\��|�ھs���GVפ�\�\�\�\���/\�\�^C\�ȷ��\0�����|�2\�0\�m7)O\�V�\�І�N\�\��k�z\'&�\�=N\�.�*|�����I{�-\�\�^[뷩\�\�>1[ͥ\�\�\�\�;]���R\�a�կ�?\�\�\�\��>�\0��<\Z�\�Ft�\�2��?\�f�\0��?�r�\�M��J�\�\�o&\�m\"`���2��>.?\�\�\����\�a���\�?��Y����\��T;\��E\�\�~\�������\�\��\�^�W幖o[1�:\�\�\�yB�n�#[|�<\�fӺ\�\�_\�0y|0\�\�]��\'&�\�)^ͻ��k_6h�Y7G�H\��O~?ϯ\�Y�\�Gw-�\"mkϱ̟�\�I��[���c�\�Yz��%ǆa�\�\�\�\�\�\�\��,��{���\�ױ�\�j\�\�\��2ڮ\��\'��K=�̖~ �<��\0��y2�\'$��\�\�\�\�߿�\�vgr�\r=\�V\���-U��~eMB�m\�\�m\�_\�ç\��\0�Q��\0H�\�g�\�\���\�\�#�\�\��\�\�\�^y���\�g�\�W7?�o\��\0\�\�s���m	#v���R�\��~\�;\�x?\����^n��G~���y\�	.�kּ�{�lt�\0�y�.t����\��x��\�\')]��\�\�\�׵\�\��z:vIj�\'d�\0�\�m<�\�W�+\�U�I>M�C4��L��\0�|���5��Ջuk�\r\�7�o\�5�\�y�~\�\��5i�iWG\�\��\�\n\�ͳ�\�\\hV\�J��\�}�Y\�o�d�\�Oٝ�\0u�\�m\�.t�?\��\0��浓v�^��\�\�wUk+\�9uVZY\��\�D�}:���1o���.$\�)7��\0�\���_\�5N?.k�6x�\�\�허���x-�-\��*\��C\��\0~�\"�5\�_\�\Z[\��\0=?��\0�m\�\'\�\�\�qZ�Xy7\�\�Ż|\�>\�?\�\�\�\��u�\��ҧ��4������\�z�\rA;_[�K[M��[2��\�/\�\�|ͫ3\�\'\���η\�h�\0�/o\�M�2\�3[̍%��{\��V|���vǮ?�6��\�/�}�\�\rcy�\�\�\���g�\��\�\�\���\0�\�\�z�=j���Gguc�\���\�\�-�n�͟�\�m}��C?��i��\�z~\�\�.n\\�)\'d�\�(\�7\�yI-;�Y�J3i(�;\�[ik6�yS��\0�\�Y�VH�\�\�\\<�\0~g�D�\��\�o�\0�^���C�\�G%\�\�A$n\�XO\'\��\�\�Ϸ�+���bK�u��\�\�>Ə\ny�ɦ\�\�\\�\��\�>\�mhq\�\�_C\�\�ֵ=/G�G�w�,�I�[M�z\�\�x~�~�j�\0D��\�KV2P\\�\"ڏ+Vm\�mn\�}zm\�\�\�W	NQrjQ�i��Vv\�ki\�~��\�v+f\�\"�\0��\0�.���\��A�\�\'#2�n�n�\0\�ͽϕ\�����^��xa�\"[B�n�y�\\\�����\0�\��{{o�z�\0���_Ƽ�V�k5�g\�\"��<\��ӑ\����W\�\'>T�I]j��\�m�M�*�\�\'/�+J/K����Z\�NcR��#z�7���\�Mq�\�O6+{\�s�s��?\�\�\���\0˟\�\�p�5\�5Hd񗋴_.=Wɓ\�\���l�c��\�\\\�-�\0\�\�\�W��\0@\�\�\�\�\�־)�uo-�?�ٽ��m��\0�i�ڢ�\�?\��P�\��%v�\��A���7�|#\�}[\�\�\�_<A�\�O��w7�\�\�\�	\��kc\��\0�\�p\�(\�\�ʼ�\�1~\�2�(7\nxhUvN�iTNS\�\�5\nn\�|�办9���\�Jt�KFR��^pVp�9i\�$�\�\����\�~��լR\�E��\�M��\�0��N�\���K o.T�`���\���\0W\�>ѭV\�\�\�K�ܳ~\��z�\��q^���7T�sqqx,7�ԇ��\�1�>��F\�b\�M\':Q�n\�3m/�\���~V�>N�8\�N1�{Z\�\�ߺ�巛w�CЬf\�{��C\���\0\�\�\�+\�u)�{q����\0N\�\��u�/\�ږ�oc�\�>�t�}�i����8\��\0������V?�Z�)<3\�X\�My�����\0�;;�Zɏ�oqpO�7�\�\�]���ݞ��Z�~\�]�OԿx��$��}{�����s37���\���Z�\rZ�\�6��xWXK�O-\�\��\0\�|\�\��\�k���K\�u+}FVh\�,\�{k�\�o\��\0ǿ�E\��%\�\��5[�\�I\�\�*\�1�6\�\�u+�VN\�=�\�\��\00\�q��g��{~��ұ|e.\�XW��i\�\��\�\�]���o3$ֺ�|�s��\�QJ?�+\�\��\�\\��\�T�U�\�\�h\�}WRҥ�q����==��&3���\�n\�Ҍ��ky%�K���-Z���[{l�\��\�\�Ko�\r�6��\�y֤�fX$\��q�_��U[y�6\��Ɵ}yb�\�\�\��\�Jmđ\�yr#�Λ��z֗��\�Qv�i�\�^��)\���\'\��CO\��\0��q\�r*y&\�3o\�\�ӯON\�&�g}qax\�vw7>m\�6�\�O\�}~\�Ϸ��u���Eup���?\�p�0I���Ru�\0�}>\�\��\�R�\��\�/�\�׭�x�۵��}�Ƙ\�\�>�Oz\�7�\��\"����}\'M\�\�=\��yR۾��/9\�M}9ῆ:�|\�BhF�\�K�Ž\��0y��?q�\�t�\���һ\�\�\�8�\�|�?�y7^\�\�\\t�\0\�U^\�,�{\�{\��\�i_忧W�\�\���-�\�*\����и�\0L��\0J�Y��\0ǿ�z[~?�z��[\�?\��\�\��}���s�]���8\�\�ڽ]\��l�?�Jҳ�U^�7^�~������\�yJv��W}4\��Exl\�~f�\�4A��\0�o�ץp�/�DzlrF�7\"a�?\�ד�\�}���V��e\"�\'���c�A\��\n�gX\�.�\�\�70����\�_�\0^?�:�\�\�]��+�\�kr��\�n�}y�\\\�#��\�??���\0�\�~�3i�\��\�忁6q۸�\0\'\�V�5�.\�1�\�+\'t\�\�\��;W�x�\�M\�vku}x\����;��;w�:r:�ͮd�׮�����\�st��;OF���W��\0\"U�%�ј\�\�pz\��U�_�����\�\�x�N�\�kxe��θ�\��F�4}?�B\��QZ}_��\��\���\��O?7�y���3ៅ�%\�6��Gyg�i�3^x{\��%\��_��/�g?n\��o�]�\0\����x\��\�\�7\�\�x¾>�[�b\�\�\�~9\�l�/\��\0�\��#��\�5\rsL�\0�~�P�5�\�����[[\�}��\�7\�\�?�1\�/�\��\��x��V�\�s!w��\�?\��Ǿk�����\'�_M�֭c\�s\���5����$�f��:\�\�6�\�<=q�_�\�b��ϻ�m�\�o�u\����\0h\�\����xl��\�i\�a��a�\�\�\�^\n�*��,}*�I\�-P\�c�\�\�jR�*��\��\\)Yb3L6_�t\'E\���_n\�Pī4�ui�mh�N�N4��V����NW��/��\0\�o�~��n�צ����Q�៌&���|�\0\nO\��^��x�U�ض�\0KԵ\�\"\�\�\�\�\��\�=4�C�?\�\�\�\�v�����P\�\�[\�ggl�~\�\�\�\���\0�\�jz�ng�\0�\�\r��\��\0�o�_\Z\�~x~\��\��/\�t?�\0nkz�\'\�5��}�S\�?�4���&\�\�X\�xV\��&:�����c�b/\���;\�\rcC\�.�<U�\�n��}KO�Ң�\�/\r��џY��\0�o�����\0?^�p��\04��\�q��޶\"��y|��?w	C\r�TㅥFj�MV\�֪�\�\�O\Z��(r(\�\�\���=\Z�(\��\�%Q��\�\�U�T�Rq\�挣\�N�rv�E=.�s��WN�[H\�\�l�\����\0>�k�\��\0gko#[\��\0\���\'�\��ϲ���\0g��\0K��\�\�W\�W^>�S\�{y�\�����y�\"�\�I�m\�\�7\�Y�\0=k�\�>$hz��}\'�dҬ\�>V\�U�n��\0\�\��\�\�N\�>���NN6��5\�rF�\�h\�-�\0=�䕹�]�������\�\�yۙ\��|#\�R\�R�3^<6~�M�\�<\�C�%V\�n\����?l���P��-\�JX\�\�D��=�l�Y\����\�jGA��Z>![\�\�-\�d���o����\��\�\��\�\�a��\�?��k��_���M[K\�k���[B�yg�oxS�.[;;}W\��\�\�\�\�o�\0W5M�Q�\�6�WvVi[��_�􇆯\"��\�u7�<�iV~r9�o���\0H����̲ܫ��|�?\�Ҽ[ú����[xt=/A[[/:\��C�\�\�\�\\M��y�}��_�\�?.sޖo��Tu�\�/7�\�o�t߲\��\�\�>\��\0�wU/nXM\�okE=.��k[k\�X�Z\���\�\�:���������/^G��?Z\�o~(x^\�\�L���\���\�\�y��\�\��\�~��\���\�\�M�\�\�\��y\�//����ӭwVz~��\�\��6�gc�܆+�\��l\�~\�\���]\�\�ʴo�[\���v.x\�\\}�?�\�\�m�\0��\���T�\��\0 �o\���N�E��3��f���\'\���������rk\�#�E«4����\0<�a\�����\�:M��ߏ~ߏ~=ӏ-��RO\�\\�\�\�f	_\�ݺn\�wgऺ��\\񇊵)�|6װhֲ۽��_\�\�\��%\�}v�O\�\�\�nd{\�\���_��x�\��zq���\�m\�\�\'\�\�{�{�}\�6�\�#ls2�؟�\�\���\0<�O-5.e\�wv\�\�[w\�\�6w����\�\�\��\0�^4�j^��ێ\��\�|+ywo�\�g������\�\�?���־\�,�&x}n�\�4;�P�O-\�5��/���}�\�\�d��\0��5�8n�!U��\0o��{\�5�h�*�M?P���\���o�Cט?\�\�\�\��\0�_+��0�SK_\r��v��\�(JwI77Z\�J\�\�\�ڌog\�`s�\�H�R�NZ<�\�\��=��IJog)t�<�\��E���\����ڴ\�&�\��\�\'�\�;\�?qo�_����#\��\0�Cj�\"�\�X�\0�?�\��\0�m��\�e�\������\����\�\�9\�~�x\��P�Ԛ�\�\�7\�\�ɳ̶\�o\�ʊI�\�\�㭷\��\�|\�O\�\�o4�\0iw:n�yg\r��7/P\�}��#Ϸ��\0�K���\��\�2\�q�l\�\�i\�S�a��\�\�M�YK\�%\�[���\Zr��ˣ>\��\�񑏱\�\�J.T�\�ՊIJܜ\�ҵڼS�KK�ݼ�דi�C7?����\�\�O�z�\0�_\�\�o[\����\�\�εap\�죶�_EƟ\�\�\��6��\0�v�\�=?\Z��㵶\�a���M\��ؼ���~��7Z�vf\�Y\��\��=$�w�5\�0_ʼWh��J�]s=4]\��7�\�)4�\�K\�Q\�l�omo\�\�Աn�$�-umJɞ\�\��\�Mj\�,s�\�\�O��ǯ�E\�^=\�k�x\�\�?��h-�,���KU򼛘1q�z�k��q\���\�\�b\�6p�\�{d�B�\�\��u\�ǩ9�\�h���\�-^6\�\�C\�ɓ�\0-�\�\�=�\�\�\'\�St����V���+\�\n�\0+\�[���Z�r��\�\�u��\�Z\��\�[\�7\����\�\�O	,���\�c}\�<�\'O��\0�}�����\��\�x\�%Z\����\�WQ\�\�\�H��Ⱦ\����a�\06���~=몳\�<��9�\"�\�\�\�	L���O��#�?�\�q��j\���m�Kk���\�v\��s�\0\�(�\0��_��~=�\�ߚ�T����ߚ\�j\�vk\���&�M҃��Q�j˚\�O�/��\�\�n��#Mr]\�~��ߩl�|I<QIy���\�O�k��_���\�\�r{\��r4�{��l�xu�\�I�?\�\�\�..����\0�\0`5�u\�!o\�\�\�yv\�ΞP�Dh����x��\0\"�\��U\�B���F��gl�\0�\��>o�~8���K|�r�$�/.�n�\�u��\�\�N\��r�e	+�֪\�(\�]I^\�m�\�u2l|M�Z��irxN�\�Ma\�I8$�;\�<��Ϸ�5\�\��\��\�d�O\�%\�t}b\�F��MJ�\�ґ\�_�\�\\\\}�\�U���/�U՟��zՇ\�-\�Ѭ��!�\��\0R\�,\�f�\0��f��\��|q�\0/6�\0d\�ձ�kI\�\����K�\Z�K7G\�6z���o�׶?\�8\�1s�P��Q��$Ԕ\�ܭ+]_��M��E9*Vj\�V���\�\�n\�\�m߶�|@\�\�\�O�\�o\�\�i�>�Ww�g���и�/�O\�3�{�\�fֶ��xb\�X�[mb>?\r\�x~\�\�i��\�K�\�/�n5�}�\�\\}��\0�W\'x�/\�\�Yt\�x�-Ğ��3y���O�\�O��\���~\��{���k\�^*\�#��g�n4m7T\�|C��\0nY�\�G�g>��[\\\\\�\�\�\��\'�;V��\�/zQ\��\�\�rq�\�Msm(J<\�\�\�\�e\�a+r\�J��mZT�;SK\�\�++jھ\�5�{�mf��\�\�/\�I?\�d�\��\0Q��\0\�\��}�\0Ǎy?\�\r\�\�]\�\r\�.\�~\�m���m�\�.���\0������\�g�]\�};ǟ�t�_X\�.,\�{mWG�%ѭ\�\�\�5�b\�\�Vzm\��=\�ܟO��طR���q�3\�I�\�m7\�L�zA�j��\�\�Xԭ~\�m�\0_vv7�\�\�\�2W\�\�\�T�$��\�~\�NNQWU%%�\�\�4�\�\'kEu�3	\��zV\�\�5bԣJ��;r���etӼ��#\�Z\��\��G��\�\�OkW\�\�淯^j�_�?\�῟\�:}���\��_��\�\�+\�/�\�\�\r>\�t?\��m\�p�\�n\��\Z�C\�\����خ\�O�t\�}�\���~�7\����o�\���ēox�I�~u\rl�\0�۝���n�\�\�\�>Ѯ�H����O\�\�\�\\���9�\0����}�\��W\�\\��ԝ*T\�\�ߍ;B\r\�.ugR�\�o)ZRmE���o\�+מ*���ʓ�%\�ϼV��\�;Ekm^����\'�2��`7^&�X\��\0��\�A��[��\\�\0Ƿ��\�\�9��\�K�\'��x�-K�Ճ�\�|\�!\�/\'\�.�\�n �\0����?b���o�9\�qcޮY�B�W��X\�,\�!���̇\�Z=�e�����qk����\�+SP𾃨XEq�k̽�>\�\�ϸ�/�]\��\�\�[\�ӝ(�$S��U-4���\�9\��{����e̝��)h��\�\��/t�\�\�\�\�\�\Z͵\�Ň�t�O\����\�3jP�b�����?\�\� �����cY�xoĚ�\��\0kx�\�MI\�o�>�n.?\�٭�\�\��\0O~zWa$���M�5圎��C`~ߨM\��#X�����@\�Z\�y�j�\�nmXs�\�Yd�����\�(ԯ^r���8k\�\�Q�\�e��R���\�\�gx\�)Y/�7��\�i�\�\�;ke}�Ͼ�w�Y\�G%׈\'�=�:M(�\��\�\�?^��c\�\�}BᤇW�y#�w\����g�1�\0���m�\�_D\�h�\0\��\0hշ\�cdK4�\0Y\'���s^j׍�j1\�z=�Z\�\��_��:�\���5\�\Z�f��VN\�\�][\�&\�\�\�\�\�.�]�\���hz^���֡�x�X�O�l��\0e���\0�b/j�y5m6���\��\�7C�\�}ϓ��RN?\�\�R�o\��8\�џ\Z��C�6j\�$\� \�/���\�\�\�rP\�\�\���r:u\��\�Ҝ�ֹtv\�W׵���N�]�Sծ5O鱫^Ms�O�ǚ{���\�\�]\�:?��\�:\�\�,\�\�կ\�\�~�d/Zα���X\���t�\�_W3�\�\�:f�i}\�Y�ݞ�	�M\�&O�\njS\��}>�\0跗^\��\�Ug�X׵o\�^#�{{t��oaO:k�s�\�z=�8��\0�K���\0��s\�Z�n��zY_^e�۲������ҽ��OK��\'{|�\�\�Ǌ<]�\��\�m\Z\��Cq��0Xxs\���\0˿\�>\�>\�k�\0o�\�\�W\�Z-���ͯ�/\�\�g���2�\�7��\0.�\�l�\0�\�\�\�>\�\�\�W�C}�\0��Z	��J\�\�o\�\���A����k\�\�\�k��q_Vh��\�~Ѧ\�lSO�R�k=6\�8�\�M��Ǟ?\�\����\�\')F�����n6w���]՝\��+jI8r\�.Yj�\�ir\�\�\�l��I5-R\�\�?�;o�{g<�x���kq�\���\0\�\��\0\�1Wll㳁a�\�a߿\�\���i�_1X׷\��\���Z\�[]\�޿zZ�2I�dg\�Ǹ�u�s�?�<t\�\�V/&�O��i�\��\0>��\�\�]��?0�\�鎝O�Ҽ\�\�\Z�,2Gn\���\���}���&��\�Z�Y�_\�yW�u���!�_\�gO��?_j�Z\�=&\�O-q&\�q�\0\�\��\0��\��\�\�j\�̑\�\��G=k\��]\�)\Z\�e��Ʌ�N�.�Lt�:���[\�E|I����s�	;\�/W��}?\�\�%y}y�jKl�4�uu�\�p������u��y�����֋���.-]_R�\0�U�\'�Q�ߋ}V\��}�o?\�>���\�\nx^�T�\�T�X\�4K8\�J\'\�Ḹ�G��\0_W���\�޾�\�|:�*k\\\�\�\�\�}��\��=��\�\�\�\�Za\�F旽>gv�ih�}.\�}\�e~�\�R�r��\�\�\�n\�ӫ]��3\�֯��m��g�3u\�4W\�o��tҝ�˟�6;�5�\�x�\0�-$�\�&\�T�>\��\�x\�w�\03ފ�i��\0��7�\����\0�\�\�\�_����\0\��\�_�\�\��\�\�~���s#\�\�\�\�Ϳ�>oڥ�\0\�g�qׯ\��\�\��<e�\�N�φu�{K�Εs\���U\�u�VO�@\�\�n>Ϯ¿\��O�?\�$\�.4�\'�?�\��\'�GO�ӿӬ@�Y�ExOD�\�mI\�<H���=���y��\�\�[\�\��\�\�\�]�XY�\0\�B�\�}|�ƿ�s�x�\�i��\��,xA\�?�����\0a�\'�� h~���iz/�tO�\���\0�N��ĖZ友|U���GO��X�_\��\�5\\\�\�\�_V�)EG\�Bq�uq^찮�U*�yjK�0�)M%\�p�,JͰغJ0����V�E\�x�(\�{ѫ���\�)\�\�7��5\n<��suO�<��Zo����.��z��\���!��ci�\�o\�\Z�\�\��\�\n\�\�\�\n\�4}W\�\�\��ֵ�\��t/��	?\��¿�~�c�<xE�W�R\�Z�o��\�|N�>��Ϭ\�x�\�\Z\�h��\�\�>\�{w�\0}.\�\�\�\���\�cm�\�\�\�v~�f�\��?\�?4߄?n~\'|@�\�}U\�\�|I�Y\���\r\��\0��H\��Iu{wm\�}c�?O��m���_k�n��\�<=�\���\�_v��\�\�=\�O�� �\�\�\�xne�\��D\�!\�b\�o,\�>\�q��q�����\0G��\�ؿ\�>\�h:�\�\�+Ĵ�ڵc�ue����b.4\�\�:��ㅠ�4\�ƌo�\�\�e:R�jU�}\�e�\ZX*Μ��YR�\�R8��\�*�W4=��!R>˝F�)�\�.?��\�0\�7wMx��4\�4i5\�>o\�zn�\�矦z�y�\�z[5՝��\'\��K��c�\0<9=��zՉ<m���K\��E�\�Cy�\�vj\�7����>\�\��]Y�\0ǡ�\'R�\�l\���s��O�\�0\�U���v\�Q���	F2��&�\�(٧e�Oc�j\�i�QII>YE��\�%\��\�\�}\�\��z\�\�|+\�mV���k\rT\�o&I\�\�渰�G�m\��}��\�=����\�P�����\�)�4\�d�\�c�[ɵ	\�\��x?\�\�R����\��x��\0�k?��u�c�i�S\�7\��Ξ\�\�\�Xx{G����\0]ocmoq�߿_�\0^�|Y\�}/\�\��!\�ymn����q�y��$���嶱�\�Z}Ƥ?\�Zl�A��Y���=�_�R�RSQ~�Wq\�;\'�\�i?�\�4ӵ�Z\'\�\�\���C�I\�~\�3<q\\��\�O�<���~���߭t�v�\�Q\�\�G1�\0\�y�\����\�j\�Z�~��מ&�ݬ7O\�[Ms�\�\�\�\��|y�\0\�_\�7_����i�\��\�_�8\�o�|C�\�]ϝ�\�\�\��_���\�u?\�V�\�w�Zפz;Y=Vګ��옔��\�\����\0V;\�ݳ��g���<��\�׿L\�\��\�Ymᶷ`r\�7\�e�\0=�ǵ|߯~\��\0�\�[[�/\�?�Ecs�\�?\��O\�Z\�\�6�|t\�i\�.5��}�\�g��\0C���\0���\�\�Ʃ#2\��(�s\�\�Z_o�\�Z�\�l�\�\Zu\�\�r�rۙ5m%d�ק5��{�����I6һ�����{9%�>�V[rZi�f��\��\�\�׎V\�|�y\�\����_lW\���\��\Zv��<>\0\��O�\���\�i���k�\���B\�\�\�\���\�_��~\�E\�\�_\\C\ZɭCo\'����g�2M\��Oo\��>�у�\0׫���t��OY\'��7\��\�K>�d\�\�J\�\\ϛ�Eo��}�\�g����D[hϙ��ٝ��F2{���\�[���\�\�\�m�g�4�_\�\��~}+��\��\0�����^j\�8\�|?�\�\�y���O��\0J�<����iywsj\�\�\�D_⼗\�>�{�xo$צ�D\�kz\�ٯ&�U�a�\0�o\��\�u��]\�\�e�\0K�]\�{�^�˥(sJ���yd\�V\�\�\��u���\�.\��m��n�\0\�s�:�Ş\n�mמ&\��\���ԧ���c�\�=���\n\�Ş�>*�_�\�\�ė\�\�\�%�>��\�<A��qs��\�h�]Žش�\0�\Z�V\�\�Z&ڨ�&�?�>T�\��\�.?\�\�\���\0m�M�\�\��h\�]\'\�\�\��[��\�\�\��M�\�J\�|?\���\0\�j\���\�\�ҥ�\�T\�U�q�\�S��c�cG�+Gያ\�\�飓k�N�;OJ\r\�t�5W.�\�\\5\\T��Fwz\�\�\�\�\��%u�\�v�\r�~d�<��g�\��U\��\��>���\�\�Fմ��\�X_\�\�\�\�u͵\��}\�]c�|�\0CӴ�o\�\�ö6z}���]���Y\"\�\���\0��\0\���\0��p�x�Q�\�ո�-���˟�]���j�\�\�S�\�C�8�JJT\�,�$�kit\�\�}u�]\�iӓ�+N.\r\�]>\�Z���4\�\�k!���\'�c�C\�x^\�ž�-��Y�1\�\�\��\0p}K\�#8\����>O\�O\�Dz\�\�g�QC=�׆\�\�\�\�_\r ���\�?qqq�\�\�V�5���j�4�2��\�zK\�v?�\�Rԓˋɮ#\\�¾�5�s\�-h�\0��Ҳ}\�~��\�\�xo)�%9`(s.U)r�%tӳT}�tw����J\��hg���]f�NQ�m::����o��kmc�\�\��@x\ra�K����\�\�3yc�\�^#Ѯ��\0�{k�߳}}���3w\�ec\r���\r�d6\�\�מ<�\�/\'�>\�\�R\�\���~���k?ĭi�\�\�:���\��R\�\�\��#x{\�o��\0�\��\0\�oZ�Y\�\�\r\�\'�.u����\0x��\\\���{�~\�\��\'�\�/}A\�^UN\n\�f\�8R�J:8�W�N0�YE\�խ6������\�\��Ta)P���t ܢ�h�S�qV\�\�����S���\�/t�\��\�kw��\�_�ߊ�9�\�\�\�B틛�/�����V���r\�\����I�~�\'�\�&�\0\�\�7��n \"\�\��\���/���{\�\�Ox�5��\�\�\�SN���\Z^�<˽�>�\0��\�深Q�Fvd\'\�\�_�+�pfWs��\�\�\�I֌`�5Ҳ���oz�5u��>\'\�I(�8Zi%�)\�M�.�������z\�\��i,`acc�kVog5���k�K\�c�%�\�\�\\id�\����ū[Ԏ\�\�\�\�+\��\�DЧ�\�\�\�q���[�{����������\���\�J\���hm��\��[���\�\�\�\���\0�z��\�}>9&�\�\Z\�>�7Y\���Y֤�\�O�c�9\��2�?�rT\�=i�S\�\�#e�pv\�\�\�\�RWKMﮧM>)�F�p\�\'{;˝u\�ܦ\��}��\�[\�SƖv\��j�|mj\�\��\0\�\�\�\�}����ꗿ��?�:o\�k��>?�E�RK\��\��\�=R\�Hn8���:e�\�ٿҿ\��=Ǩ�\�\�\�ζ��\�6}\�g\�I<�I�\0M\�\�\�\�?Ϸ~<W�xᾥ\�Hu�kא�q\��%��\�A�\�!�\0��\�߱��z��5\'Q_Y]\�N��|��G[\�\�{;\�\�\\�o�:M\�i*��N\�U\��\Z\�G\�\�_��\0\r�3xᡇO�\\>�}������R\�����\�G\�~\�w�\�\�ϥ\�\�8�\�\��ž���O▭�\0	����GI�oG��\�n?\�-�\��x\��<��4�}\'\��Q\�z�g�\�\'ܴ��ʊL\�|\�\�\��~u��M\���\0�_ȏc�\0\�5��	d\�IS�Z�\\uh_�X��HGk\�P��m4r��k�����\�\�B���+&��坴���s��������\�\�z=���\�7M\���4�\�\�I��O����\�\�\����M>�n$����%\��\0\�̐��\�?\�1�\0\���m&U��3\�����T�7M�}\�\���O\�ӟ�5�^\�R��\"�ʣm\"��>T��\�\�ն\�m�v\�\��m����\�C�ռ#�{b\�ǈ5[�k8f�L0��l�\0���\�ݵ�o��ɮ�ė\�^i�\�\�\�6o�i�;��-Rko��\�u���su�\0/v���\�l~\��\01\��oF\�i�B�\���\�z_��\���\���m�\�?\�\�5\�k��\�\Z\�\��p��\�\��\0-1߾=�\0Niӥ\�.jp�I99�~}4R\�\��SN\�Z�Wz\"�\�x��Qvkn�\�~[jp\Z�\�ڥ���[\�WG�Hl\�L�X\��\0�{{{ד����yokkn�\�:y�.�c�\0�\�\��t��I\�\�\���A\�����m�\0/\���\0ל\�VrC/\�}��_�\�85J��i\�I]Y\'��\�\�\\�볶\�I��2���ԯ-㷅\�7\�\�\����O�\0]}-g�\��O�k�\�\�\���\�\�\�\\��t\�O\rx^\rV�����\�4�\0�y?\��\0=kRK��x\��\�B�\�S�z\�\�=~�q��\�o����]�D5f\��\��\��c��\�/,dX�\�\�ɰ���\0>��\��\����\�\���������\�\�?�E�\�r$��gO-7�\0\�8}=\����\�|$־9׬a\��[�k\�\��\0W=�����\�K[�m+wm\�{z�Mn���9�Z,�$m>\�\�\�ɒ�t�\0�\\�\�~}�\0�3}\�_\�:u���.\�V�͙\�5\�kЛ�\0\�\�oͦ��~~�\�>#jZn��3\�?3\��C���_+�\�\��5\�?�<?c�Mu�^Ms߿����R\�c�{�\0\�����\�\�;EI\�MA4��\�\�K]#e���\��rI+\�>��_ϡ��ǩk\�^𜐤w�\�j:�٭��2g\�6�?\�-\�\�\�\�k�5\��\����櫠�gA���?�����\0u&��g\�\�\�\�7Gd=\�hi���/P\��i�\��CPԦ�KgG�\�+q�\0��\0��\�\�\�\��\nŵ����K\�]^o�Ho/\�\��m�\��\0>��֧�/<��ls�i��:�\�ˑ.�\�Tv\�\�\��-w/��\�$��\�v�>�\�+io?��Q\�\��>�º\\�4�ޱ�\��k�C����}?�~j��\0�ɯx��[->6�g�V��\�p�\��w�nuۭ\��\0[9��u������\�\�\�\Zn��`�\�gg�嵎y�\�\�g�\�\�.���\��\0h�[\�\�\�c᭻��簾�\�s�>\�׷�iN<�wJ1��c���u��\�\�}7\�^%$\�ݻ�\�\�{[Mmk?���Ws�\0s���G�����\0��|\�\�\�\��\0�_\��Hx�3�m\�w?��ֿ�ڿ\�N��o�R\�*�\�<f\�d���<C\��^mG���\�g��\'\�^\"Ֆ\�ݣW�?�ןN������u������\'�\�?Lq��wP�\�\��SsMc�\�>#�\����\0�n?�\�Zϱ�o\�֭VG�\0�\��Y@�\0��\��\0���7�O\�voMV�ޖ���go-i��m\�\�ݟ��#?\��\rkf�C&\�\�^�\��\���y\�\�[O\�\�\��f���=�\�&?��=\��:\�\�\�OӰ�\�\�Gi�ȓ+�\0\�h_�2\�\�Z�ς�\r�ǳ�\�0�\0�jI5���q�}�^5_��\�.��X\�t㙣\��U��\��\�ԟ*�i�\�v\�K��\�OS��\�\�m\�\�?\��wc��2�\�κ\�.\�?\�\��\����8�{㏙�\0h��\�Y�\r�i�nc��?��\��\0Ҵ�=B��\��v׵�o��\0��\0���\�~(½�\�۴�\�<M�\�͡�>\�r|��c\�\�\Z\��\0P�ڟ\�{�\��\�c\����\�g�\�\�$\�\�]\\\�\�yx�u���\\O��B�\�\��^n�.�\�����\�\��\�f`\���Z��y\�\�K\r��,ya$�\���\��NwR�f\�/\�p�T���&7\�ғ�K\�^6���P�̕��f�^\�\�\����pCzF��\�h�\�A�U��(�IM-v�\�?�v>�ڊ��\�r�?������X�u\�\��y\�۬�R�\���7�\�Ėv6:&�k-�\��\�\�=\�\�x~�H<�#\����\�5\�i\�\�\�V��\0��}�\0!��X_~)�U���|EO�ݏ�|s�\�\�~���\�U�xz�/���\�x�N��\�y�\r\�o\�~	׼u�\0?�5\���k\�ڏ��C�i�\�w\����y�S�}��\�\�\0��E��\0\�-K\�>6�\�o4����V��i�f��~�qq�\\�\0�}�Z\�q�\�\�\�\�\Zw�x�����j\�<]\�/]x^\�\�\Z/��_\�^4\�5�M\�ȵ\�\��}��\�}\�\�\Zŵ����[\�ߵ}��`�7\�\�?\����\�z�#VusxS�Yק�J��T�\�\�Ԍy�擕hѭ({8�\�\\eR5�����\�\�R��\rF�HJ~\�7�����e\�NЃ�I7���Rğ��j\�\�\�\�3<����57�>0x��p\�~#�\�4{K\�:��\0\�\\\�\��\�x\�G𾱣��ž\�쯼+�\�\�x{Pӿ\�c�\�|��]h���ƃ\�MK\�i�yz&��l��Z�7i\�-�\0�4�o�\�鶷�h�\��\0�\�\�\�]���k\�5�KK\�4u���3Ǩ�7}��\0<U\�\�=WK\��A�\0}��\�x\��b\�T�ǈ|7k\�MX�����\'�5ϰ\�?N�\�м\�^פԼ/\�}>�I�𝷃�y�\r!4M;D��\\�P\�5�c\����5\r7�&\�\�\��\0�5�K�V�X\�\�hcI��\��\0B���\�\�m��>YrF<�Nr��\�)NJm\�1�T����5eM9}l�8\�8�F3��n動�ݣ%�9\�\�R�>\��\r\�Ӽ	o��>�f�?\�z���A�5��[��\�}\�\�\��\Z\�\�_\�d�\0����-S\�ǃ\�t�5��t�;>Hb��\�Y{ǽ�\�����~�	\��u\�}Q���\�\rX\����\Z�\�H�Ayqc��B�G�Ծ\���kg�{O�ӷn+\�/�\�t��mKS\�5i���\�QI7�{\�u��\�8o+\�K+\�TQ�c(sC\�ϕ�.yr\�T\�N2\�ދ����nߗg�\��\0ibU\�\�<\�\�\�\�:R\�e��o\�\�ԟ�Eu�xN}yo�!�R�4��\�\�V�g��#��\0���ִ�\�Ͷ�\��]\�\�\�&�gkc�Y\�\'�\0I�\��J\��\�\�]�\�\�\�qY:[x{\�zV�\�\�\�\ZK=7\�0\�\�;?>\�\�O\�\�x?\��\�=����M�񱼙c\��0�\0����\0�\�iEap\�2\�c)�U�\�v��[\��*���$\�5ouj��n\�[��5o���&�\�/kP��\�\�\"��l�C�\�\'���\��6�������/[Z\��d���?\�\�ֽ�I\�\�tX�\�����9K;�\�\�\��:z\�\�7\�\�ړ\�E�\�O�^	�ռI��w\�*\�l�=s\�-6�k\�<)m�\��\�\Z��k�K��\���m�wۭ�4�\0\��^������\�<U�=SX{\�\��\��R�ͺ�ԭ���5�B\�\��\�\�\�˫��O\r�\0Ǉ�\'���ѫ�V2\�V��\�Ν�G\�ig\�}c\�5$�\0�o72�\�(ޯ���	IZ�r�.�M5����z-\�?�H\�\�\�\�?�\�s\��\0OQ\�Ӛ��-嶱g�\0b\��\0?�;w�\����<\��\�\�Y!y�t�X�iD\������W�~ߞ��k��^~wx%�\0қ�?+\�XZ�U8��\�C����:wק��\�x/���K��NW�K\�٦\�V?X>١�\�ڥ\��\�\�\�\���_��:��\�v\�}V\�۹�/��\0\�ɯğ�J<+.���1ku�\�[C�M\�\�\������r�_��º�\�\�7\�)���!\�m�\�\��\Z׹\��A,$���\�hƪR��\�1�M5ovպ\�s*R�ThԊ�N<�\0]o\�S�X�\��\�1\�\�x~�kxo!��-�U�\�\�RMo�\0�\0h\�4K�+����(���\�5�/\���\��O����fi��\rG���\��\��>/�-\�n�\���ϳ���\�����\08��\�_�?�\�|Q�\�\�Dw>0\�.>\�\r\�>O��G\����\�\��\0f\��\0\�\�\��z���@]jm\�|�F�m�e�\�x?U���_����\0�n��\0&�xd������՝��\\�u{�\'ki\�\�O\�%g\�۶��kmS\��\�\�m\�w\��\�\�L\�#i�s%\�\�\�Ҵ���\��{g\�ֿ�\����\0R�>�\�_�~>h:�\�\�O�ږ�-\�4��r9��kz�G��+_\�o�=�\0\�-/,�Ӈ_\��֏�?\��ȶ�\0�$\\4\�}�濳���?��Q\��?\�K�\�\�\�\�Ś��\�R\�\�O\�<+\���T��_G\�\�\��\��W�M\�\�\�\�q{�^^s�\�\�񪕡QPs��\�JT\�F0JJ���8�A�V�\�?s\"\�B9�\�J�<B�QU�aMC	\�9ʪt\�N�j\�u%Q8\�)ɵ\��{�V��⯏�w�/�Zǉ,4�|7�\�\�ɥBb�\�Q\�\��\�\�?\���7�M4���A_M[\�~�ݿ�֤���b^j_��B\�\�\��\0\�\��\0��\0�N��\�4�7�3\��O��&�ߊ�I�\0\�\�/ ֢��~�=��o��m7v\�_ڗ\Z��\�\�l���/�i�\�R��^\�K��c�����\0��\�\�\�\�^5:����z�M\�\�8�.H_��~}��+;w\�Aa�5\�FP�!^�i\���*jmBQ���-�\�w\�oM\�\�8��u�\�.��\�h�o���T�\0O��\0�~�l��\�5\�:~�k�]�\�\��\�c\�j^$\�&�~�\��\0\�\��i\��M\���\�\�\�@�\�l\�Ե)�w���T�M�\0_��Wiy�s\��3x�şf�o\'\�`�y�\���\�O�}��9JN\�ɭ\\�\�+M[\�u\�o�c�%\�\�t\�~�?C�վ>G�\�ɧ�\Z\�\�w\�\�\��X|\��\��~\�&\��\�\�_8j����\�M�j\�\�_]M\'\�5\��\0���j��2���\\���\�\��q\\�\�]�6\�\nq�\�_\��\��k���\�\�Ky�\Z(�\�[��\0/\�ֺ\�#Uh\�\\7�}=��|q\�\��Gy�G�\�\rRO\�.<ĶH~կj�\0ӽ��\0D\�m\�\����\���?엇\�\Z��̟���t�\�_�\���n��]�����y�p�G����\��\�(QR_�Zie}]{��\'9E�6ׯG�c\�\�\��#\�6~O�tm=�W:��\�Z��\�h\�.\���\�g�W��NՖ�\�+k5��I$0��\�<\�8� ��\0��^��\�\r\�qu%��1������\���{�+��\"L�\�\�A-\�u��ɷ\��\�\�ҷ�\�\ni\�\n)4��WV���\�}\�\�\�+�\�vWc�\�[\\֭|3c�Y�ul\�\�/\�\��4\�=>�\\��\0>�e��������N�k�M|=��\n�L�\�=)\r�ڗ�\�ͳ�\��Oq�\���V���\0���}��\�\�sܯ�5�{O\�伷\��ga��+\�	\�8���\�\�\�ǥɼ����\0�>?\�k\�?��\0��¿\�Zx�������>�\�h\�\��}�\�\r?�7\�7e��\0�O�\�߰�\0_6�|e\\BT(P�)��jT�,�\�Ҵ\\eQF�enx$՛�C�F~\�uY(�p�#.��$\�x�^0��|�n:\�{��|Ac�Gu-��!�d3\�yDB兽��}\�׾k��i��\�dC&<\�\�\�O\�\��޵�M\�ۭY��3aq\�\�\�-�-�+\rR\�n�o��KoA�s�\��7���\�lm{M\�\�x�>���c�\���6\��\�\����\0�\�uVq������.Vխy+\�7}\�㳵\�\�Γi���\�\�Z\�\�v�\�\�>��\����̙��\�>\�\�\�Ҫ\�\��\�\�7ΰ���\�?\���&�t�H�5\�\�6w��}�!�����\�\�\��[\��\�\�\��\'\�ڻ�6\��\�K\�hag�&ޟ��`?\�\�_��k\�˳���|\�rZogo�\���\�0鶗�\"46\��ro��\0\�\�\�6�\0�q�t�+R��;5U��w���u�3\�ץV�Ě��\�{\�t]Jo\�3^G����(�\�\�Bn\'��\��M���\�>�\�\�W<C\�5\�/\�\�~��0�\0uߵ�?�_ÓY(�E\'v���T\�\�\�n�yI��4<\���<̴)Ru\�5\�_\�\�\�b��D���8U<\��w��\��~x�5cV\�<7\�=>\�յ\�&\��\�y`���\�\�w�5���{}	\�^#�|TԮ�\�\�\�\���\0\�_͗��������J�Q�Z�\���\�6��n�_��ŭ�\��y�ަ�u�WF\�\�T��\�\�7\��<\��u\��\0׬|@���\�\�MI5	-�ƖzW�T��\0\��\��\�\�\��Υ�k\Z�a}�\\�?�\�\���ۯ\�˞u�c\���\��\0�}�?\��1i�y.i;蕒����J\�_5\�.uf��WZ=mw�\�\�m;���|`\�\ZY�\�\�m���\��>\��\0�?\�u�,\�<M�_M<\�׍$\�\�M�Q�{���}}�\nm߇�\0���\�ӵS�����˧\��\�7d��\��\�\�\�[�]��d\�].X��������f�\�w��\��{\�T3��?�\�\�����7v\�p&�´��Ǡ���FK�6�\0��;�\0��W��z�=�!�\��\0�j��7��C�\0׎ݻ\�Ēg\�\���\0?A\�Td���ힿ�\���\�2ͷ6\�\�}�\0\�\�I�w��~��}h\�I���\0_�\0�\�g\�#1\�\��϶;�YL};�\��\0\����߉\'��\0\�\�#�i�~O\���y\�Z2]7?\�A�?�\�l��G����I�\�_��a�{�\0��AJM[�W��ܱ�4%Ls\�\�\�?�\��~Y�Rо;|F\�\��\�&�h���mb\��\0.������\0B��\�\�\�z{׊țCzr?C��*�\����\0\'\�\���ѧf�s>�k�K�\�w�4���<Q�\0	N���Ҭ�}+H�I�\0��{8?\�5m����u�]�\�\��\0ӵ��޶|#�\�\Z��\�q�XG7�6Yܷ\�e\���\�\�\�^7$\�)\��\�ߑ\�1��l�׏˞1�}+\���\�\�\�9U����\�\'QԌ��\"���ʹb��(At��\�a3�^�:��F�yaNI\�+D�H5}�)\�Sz^N\�ܱxZ�EC�\Zc\�n�F;\�_�\��T���\�\�\�c��z�����J����O\���z}�z���\Z~\�]:\����\�\�\��Ӧ�7\�{\�mB[\�&�\�\�qnd��-\���W�\�s\�\�\�\�#��_��\0�`��ZO�//4?�~$��\��͟\�ớ|Y\�\��\0�\\A�i�n����ˮ�b�\0��T�|3Ԋ\�Ƥ\�v�\�\���{t5�7\�\�v��=B�\�~\�\� ���8��\�\�<�\�0q��T%~hΕH9E�[�ԥ>h�9��v\�9p|Q�`\�\�\�UIr�U�\�zi\n���ٓ\�ݖ��\0\��\0�>�\����\�|iƷ�}oGԼ	\���\�o��\��sm�Y]\�ie\��_\�~\��\Z\��߇��I��|?\�=oOӬ\�\�zm�\0�-��p���\�\�R�\0����y\�\�Ǐ\�_\�ԟ\ro�m���<$/m}O�z3�r:\���r\�\\h���ߙ,e�O�	�\�׷c^Nì��H\�y�/�աW\�Mi��4\���l�\�\�\���\�Z.1\�a���r��I\�M�YT����wӱ�s��2xw\�Z>�\�M6�amw\�ym~\�?\�\�}?\�?�\�ysϧ�\�\�麔v)�n�\0�\���\�پ5��F�{{>�\�\�o\��[\�\�/�\��D�q�����b\'\���\�ב\�}\�OӦ\�\�0���I+�[W��-~V�&U�\�ֲ�3m�6�l�\�t>R\�~\�x��]]j��\�U�=R��	n�\��:������\0\�f�l�\�{�[V�\�\��&|HԦ���=����\�s�ټ/{�z�W\�ǋ!�\�C�;Q�\�y/��Vp��\0>\��\�J��_\�\�\�d����\�o\r\�jO�\�\�5��\Z\�\��\��c\�^��z׷JU)҅�X�\�>\�>[$�sZ�\0kn\��9\�Ri������Kn\�?s�?\����^\r�\�x\�\�\�!\�n<U�\�q��⿌mb\�!��\0�K\�/���3�\�?\��Z����ݟ��\�\�\�\��_�K\��xR\�Z��\�6��x\�\�z]\�\��<�\�(\�u�W\�g����\�|7�\�\�v�\0k��\0�o�h\���$�,\�>)|A\�5c�w�\�\�o&\��\�\�kڬ�_\�:}�\�ǅ�]>\�Ğ2���\���R\�Qլ-2\�\�\��\0�8W+�A�Ə\��_��\�O/��+?\�O�\�\�WW�W��a=�\�\��\�Ŷ�{�o�����+\�\�X�������έ�V�X\�>ZXu\Z5�\�$[��5N[E�M�;�\�\�=l&_EJ�NTd\�W)U�F^�\�\�A-Tܛ�-%�=���o\��\n]kP\�~h��\�V��}z\��\�ZǬ\\Oq��>\��\0	E\�\�y���8�\0�i����U��\0�}�\�z\n�֛�\'\�\�j�\��ךl����3�\0\�\�Υu{\�\���t�jMk��0��C\�4?x�\�k\�\�\�\�g��\�\�K�qΟ��\0\�K���N��[}?�.���>�\Z~�^O\�\���ƞ)��\0\�	�<x\�\�\�G�-�^\��sm\��\�kR\� �Ϸ�\��{�S\�:������c����W�EF���������w���>~�\Z\nr\�z\�FJ�q\�T�N\�5e\�{\������\�\�\�m\���\���\0%\�\�\�G\�^���#�K\�\�+{]3῀�ն�\�e\�\�):}���\�\����^��w\�\�\�\���\�?��k\Z��S\�\�/\�X\�|P\�/>\��\0�+\��\0\�V�ׄ�O\�\�\�\�:N�����W\�_�\"�{\�\���\Zj\�ַ3?��\�\�R\�,\'�ټ��D�\0\��\0\�\�\�7Y����\0C�\0��qMʣ�ݻ_O\��\0$\�\�\�4\�T�7�Ӻ;[�\�i~	�ߊ�U�\��	���߆��rXl\�,e\�\�?�\�.n-���7�|��\�\��\0\��\0J����\0\��ex�\���P��\�\�\�\�h��\�_	o\�b�\�6�i�\0ٶ��z�\��\�g\�?\�c�^�O���K\�-|M\�Xmo!�\�\�\�U�%����\�B\�\�\��\�\��\�si�\0\���\0do麧�|]�isxKŶ�?��\�\�o�\�K�z+=KP��%�\0g�\�\��nn�\�\�?�\��\ns��~���Okw����\�mr�l�\�\���0pZy��]�;�E��>:|V���h?<}�\�R�{\�\�j^ �R���+�]SR��M\��4�cğؗw\"\�\�\�\�\�\�v_\��6߅}��V��ǆ|\'o�M�\�\Z�\�6\�\�\��\rR\�\�m\�3��\�[�\\�\0�}����\�|��\��W�\��k\�Z?�#�\"��%�\�5\�\�3\�ڑ\�>\���\��n�e�����ӎk\�4_�7^\�>�2\�/m�+�\rY��\�\Z���0Z\�y�j\�g3��\��~����J\�d�\�T�\�Q\��.nd�*B*^\�1�r\�v��\�kI\�\�RJ�\�\�B�.hJ2�䖩9�M�%\�6\��m7	KU��\�6���u-7�\�	xn\�O����M\���\0��\�\�\�\�\����\�zN��j�\�~\�\�u\�y����?u�\�\��\0/\�\��\�\�vּ\�\�v�\���\0&}?A\�\�\�umj�hm\�4\��n�\'�\0��\��־\���g�\�K]7X�\�Q�f��eΉ��ڭl\�\�\��j\Z���}]Y��?\�?J�b\�;\��]_�Γ\�4	�o\��Ũ8\"�O2\�o��k-\�\�����v�\��n�\�c��\�\�Jo\�+Y�8]�\0|��s�\0\��b���\�o5+y/5ɷH���fC\�Eoϡ\�\��\�/���\�\�\�X\�5-S\��k\�\�dɦ\�_\�C\�\��\0F�\0����~0\�~We�\�\�\���aV]\�}<\�C�G��\0\'?�{���ῇ�\�~(��j�\��ʹ7�\Z�m�\�?\�\�U�@�\0���{�\�s\�h\��a�n\�մ]7S�-�̰ԼOm�\�}2��]�[o���\�R���\0��^����W?\�+ɚ��V\�5	�-j�渼���͖I��?N�\���yi\�\�\�i}�\�T֒�֟>�?\�>*ׯ�I�My\"�0��\�\���\��\0�\�\�>�1�X��\�\�\���M��\�\�\�t�O�?f����\�\�\�N�\rƛ�\�\�\�Kq�|[\�j\��]�z�\���}}\�K.�\�m\�d�<�b���c�~q�u�\���/\���fg3�`�3�Ρ�I\Z-\�\�M�\�W��=J��Ֆ\�\�\�j+�^�\�\�x�ٯ�<]\�wǗP\�j�����ٿ��#��\�A�\0�V�{~U��I�����\'֖\�Cm�C�\\�g>}Ϳ����t���	�	O\�I(�Mo�[=�\�\r;4�;�#�w\�-�ڍ�\�oI��\�7�\"�\�_\�\�<G6q�\0�q�\0\�^\�-\��C�W�x\�X�.#\�|%�ߦ�l�g��\����\�\��\0N�?Q���ݖ;\�땛T�٤D�\�w����aom��[�<V\�?e\�\�$�C�o�\�ێ��)э8�\�f\�\'\�OK�\�\�`n\�\�Yy%�>G��+�]Ik\�%Ҭ\��l�~�,|ۗ�?Z\�4�\0�?��˩G�k\�\'\�{��-���=��_��pզ\�la�\�\�t�m�\���\��^\"�\�\�Ip�w1X�\0\�\�\�Z\�\'�{\�\��\0_\�Z(F\�Z\�\��_ר�/\�,�kq�=?\�z0�\�\�4��\��x�X#�\�e�x��w�_hzm��c<\�bU/��\�\��\0i��%��O�s�+�\�<e\�U��\��\'muq�\0,\����\�>\�\�\�\�\�_i�\0�\��{\�KPԙZ�\�I�3\�\�\�m\�\�\�\��>���\�E�f�2\�\\�˧W~�\�\�f\�]���\0?#\�,~;x�ks���\�Yɳ�0\�y�\0�>\�\�\�޹}{ⷌu���\�:]���J�\�R�\0=����\0�/��u\�\���̥�\�\���\0=j\�d�z$�6쭧\�\�\�s79y/��\�$�X�nv��\0x\��\0���?\�\�UY�Xu\��?\�\�\�\�?7A\��s��uo����.k��v\�ۦ���H$<6?\�l��^_\��?�L\�O�\�\��\0�����6ӷ8\�\��\0=k#t��\�U�s\�\�\��\��\0W4d]���\0\��\�W��\�\���\�~5NE\��r=?�\�\�3\�\\{\���?Z�&\��|�\�n���zք�1\�\0����\�V|�~nC�\���(>o\�뷷\\{~9�\�𬹕�}N�=�O�lH\�\�����5FD��\�\�\�\��\0\�{\0bȼ�\�\���˽g\�̡�\�\�\����V�\��\�}\�������6\��X\�?^x�\0\��\�\��\�`z~��\0��j�;1\�Ǒ�T\�+d�m��n�\�\�ڪɹB\�\�~�מ�\0\��\0\�|��n\'���\�S��\��~g\�R;v����\0��\��\0xc߯\�\�@\�n~��y\�?�\�\�VG�~S�\��\0�¦��:{~}};Ul���\���Ҁ �\�?\�\��\0\����\�\�ʻ�\��z�\0�\�\�{ՙ$U\�w\�s��\0�8\�k6\��\�q\�ۏ�\0VOj�J�v\���K\�#m^\���VR\�\r��v\�����=��f��:�l1ܺ\�\�\�\�\��\�\�����f\�\�X>h_w_��9\�5�\�\�\�ϊZ\�\�\��_A�\�{�h�\�\\jr�\0\�E\�l�{*��s�-ǉ�Q�\�\��\�kϲ\�\��>\��\�\�A\�v��~�n��\�\��0\�}l�w\��r����y���k\�V��\�\�A\��\0��+��Լ2����jz�\��\0�s�(�~?��J\�t?�~\�\�s\�W\Z��/���\��ï�|����H�\�n�/\'M\�ᰄ�\0�\���\0>��^��\��!\�\Z\�fi�\�\�\��W\�\��>�\�#\�\�4\�;}?Κ\�\��͹}�\0j1Coۧ����\�f\�\�w��m�Ck;�\�D72\����\0<�\�^G\�\�\��~ {[\�|@�U�[$\��jV:\r��i�]�\0/n��\'ԋ�qI\�\�s=<��2d��KW�[u>3�\�cu�i\�~�c�\�\�W�7�F�ږ��\r.̈?\�\�״_�\���\��\0\�_0\��\�d+�\�\��3�{$&I�>xs\���?�����\�z�\�_�\r�?�W\�f\�}�k\�\"�G?��[�X����k\��N\�\��\0~\0\�6�g\�\njL�\0�\�R}V]\�<�\0\�\�Z\�z7M{K\�\'�\�Y��2\�\�km�\�K\�S��h\��s\'.i4�{\�Q���z\�~5��\�%\'��u�?�\�\r<\'⋛m4M\�?��Z��\�7\�g��P\�.t\�k�#J��\0�O�\�����>\�\�τz�,n�i�|J�w�|g�x\�ž6�\0�&K�k\� �7\�?\�Qm���\�\�\�\�\�\�XZY�\0��\0׀�kc�3\��\�\�Ꮐ4��\0\�\�S\�\�\�\�\�\�_�\��$���\n��\��/ğ��i{<����퇕!\�\�����\�FJ\��V\\�b\�\\�iJ\n7哋\�\�\�.�7�Z�Jr��B�engN�a)(�\�r���!(\�E5{�{��&���\�\�k?h/�\�\����\�V�\���\0\�\���S\�\�\�s�����\\���\�?\��\�7\�\�tO���\�.�\�x�\�5\r?�?\�_f���\��^�����ֿ\���O�����,��]A7\�\�|7}-��\�Ɵ���;��\0藟\�=�\�%����\�\��O����w\�4�\��\�\Z�tx\���\�l�=�g\�\�\�SWp�ܿ�\�\�y_��vg��w�լ��Z����}4\��g�/��\�\�e�C\�U\�����;	A�>\���o�\�\�\��xOǏٷ\�|9��\�Z/\�/\�\�$�\�w��\'�n��\�t��{�[\�Z^�iskg��q��,�ϯ_�5\�[�\�\�\�m~�\\\��ޟ�O\�8\�\\}��\�\�O\�\�Z\�W\�;�\0\�?ʏ�c?�\�Y<t�eN\�}��Z\��\�\�]K�1[9�\�8�ox�\�[�+~y\�~ȧ�	<u�㭞������eu�\�o��\�i�\Zn��\��\0�����o�yĿ�5ꟳ_\�?�\�>	׼#�\�\���&����\�z��\�\�n��\�\��>\�\�\�k�\��\0/���\�ֿP<�6\�\�\�f�v�\r���\�\�\�r�{�o^�b�\��T��o.\��\Zn�\��\01-z*\�?�o\��qZGk�S��\�M\�^˭\�ܗFViTiI�I8\�ݯN[zkn�\����7���\�5�-\���O��\�{}k�o\n�P���CLԾ\��\�>��\����\�*\�\�\r��\�\�7}�\��/[\�1���h\�����y���U��\'�:2\�\�}\� LȖp\�Ok�\�͌��[���\'�\0\�\�qv�7��(j6�jMo�\���8>ˣi�\�\r?O��\0D��\0\�\���V�i4\�N\�W\�\�W\��\0U:n�\�����gv\�w�~�Ӽh\��d\����5T�?�~\"\�\��\�s�~,t{{o���t��\0N�\0���}Ҿ��[�\�o\r\���\�)>Ѯ^\'�����c\�\�\��=�WQ\�\�\�>	���Ѥ�\��\�7�\��\��z\�ӼI�x��6\��.��>zfm{R?\��c\�\Z~~׏��z\�{\�u�eu��\��}\�3S\�g\�-#º|��q��Jo�g�\�=9\�{����d�\��6�ח�4\�;�\�\���\�zWӖ?t6��\��\�\�mI�\0y3\�?\�m|\�\�\��\����ʽ\"\�E\��\�V\�M\�l\�aO\��\"��?^9?^\�\�Rz��i&�\��`>O��{\�\rJ5�\�O�\�a|�;U�ɗ�\0\�\�:��j��\����}[\\Ԯ��J\�\�D�].9�\�\��^{�\0\�\�\�q^\�$7طPƿ\���pNy\�>\�\n\�Ï�\�Ni�������\�뜿g����\0��\�坜~v�p������l9\�o��s�w�jv�]�sZ��I�\�X��\0.ޟ�zi�\��e�?9S�:y�\�\�é�ټQ�\�n�\�\��O��{U����ja�W�\\}�Iļ\��\�<�5z�O��\�\�\�o���r��4�Q�[\�>XO��\0���\0<\�\�\�|h�\�C�\��m&\��?j�֓�WU��@z�j��h[���{l�b\��ϯ�^jk�Z\�K���$�O��\����O�����tz�>�׊\��+\�W1\��!��\0r%�?��x\�r7ך��q�\�뉯.2>y���[�\0Ϸ4\�ݓ}��\�&�y \�\��\�ݽ�\�	n��\0�x?\�\���+\�n$�\�C$\�<\�ϗ\�?�\��\0���\0J��\�\��Q���\�\��\0��\0W�zJ\�k_�\���&�\�\�]7\�f�և��,�\0O\��{T2B\�~�\�?N�\0�tώ7\������͹\����?�\�\�\�D�֋����[��=��g2Е<\�����c�f�\�o����\0>���\0�WQ�5_\�O�?\�\�*�����\0[�����5�m\�\������\�ߍ\�nX[���\���?���|���\�u\����襷f\'j�ݿ�=}�8繪�Y�\�Q��\0\��\0\Z/\�w뭷}moŔ�[#\�\\m\�\��zz�\����\�\Z\�}��O��\�Z�[\�9�\0��\�Ӛ�\�\��w�\0���3E�\0g\�\�}{~y8�j���\���{�\��<�\�\�\�<\�\�׏\�9\�\�4x\�\�s��?�y�\0�P��|#�G\�T$F��\�o�\�\�\�[3\'Ga�\'�\rě�v��\�\�#��ǥ\0cȻy���O��\�\�\�Td�J\��O\�\�ڴ&�ſ�\�\�n��\08���}�\���\0#���(\�շ\����\0Y�ٗv\�\�?\�ۿ\�\�\�ptf\�ͷ�O^��\0���\0\nΕ�J�\0�g�\0��{\0g\�\�R>N�\0\�{�\0�\�|�\'Uݏ�����\�hM�6޸��?\�z�\�lۛ���\�\0���JI9?\���\0���\�i\�f\��\0�z{��O�\���{~=?�g\�\�I����\0Vf\��*�\�\�ӧ\��Ԟe\���\0\��~=>�I\'\�{��\�oQ�ɸ�h\�8\�\�Ϲ�(-\�\�w\�N��{�+\�&\�~o�\�\����\�\�p�|�\�0\�~]���\0\�u�\�\�v�}��8�\09�X3]�~~:l\��\��\�T���\�k_o\�\�\�R�W��G��}(��m��v��Z(+^\�\�\�K\�^����\�8m\�O�cim�\�����f\�\�z|\��\�\�ʋ�\�\���k\�5\Zx�R���7;\��BZ\��x�\0��\0�\�ׯo�k�\�<�\�E�\�0�8�\0\��?�p��\0.�\��U�ml��\�\�\�/�n&m[\�\Z=�O�mi\'���\�\�\���5\�~\"����-|9�\�\��\�\�X*.\�}�O\�}?\���Ú\��\0�~�#mRKٔ�3c\��\�f\�~q��s^��xG�z��=�x\�5\��\��<����އ\����\�\�H�\�\�><x\�CY�\0j\�ؿ܇M�\r\Z\��\0���\�h�\0����GK�k\�\Z�߇\�3\�\�\�A�\0���W\�\�jKU���\�D\���v\��T\�k�]\r\�y1�s��R_��%\�\����\0<�\��\0~�_k-�:�\�q���\�\��\�ۏZ�\�*äX��\0\��\�ׯ�\���V�:m�ݷΛ��3��s��U[\�mm\�,1��\'\��\���\�l�����F�5\�\�]\�\�M�\0��^{\�\�|@\�|8���j�\�\��\0-x1��{��\�Iu\�p�w\�a\�?_�\��\�f\��7��\�ԧ�\�N��\�\��\0�ߐ�\�o��F�\�\�k[W\�\�m��=\�q\��\0^�\�3\�o�5���դt�\�\�|\�x�\0\��r}�_aX�WE�h㳴���\0�����q�zWUzn��Eŵ��\0�b����\0���\0=:T(\�⿕\�\��|ۤ�#\�\�L+��\'?l�O���\��\0�^��׸h��\��;d�\0�6pAk\�\�\��c�j\\k\�e\�\������������\0�\\���ƴ<�[R����ZY\�\��N?\�\�\�c�;t�I-��&��\�\��\�`a�j�\�e��\�a?��q\�,W�\���\�g�G�\�7:F��\0s|?`�\���\0I\��}kجt\'K]�~�a��\0\�hm���\0\�\���\�W&6\���y���s�#\�ړWz�n\�O[���\�	\�~L\�?\�\Z֡\�g��1u\�\�q��{>��\�\�\�q�ͱ<�w�QG�\��G�Y��8F\�T���\0\�\�\�\�x\�O\\�\�z\�\�6�\�\���i��O\���\�G�+��\0]@\�o-p\�2/?>\�\�>�4c�rq��\0Q\�\�\�^S�|J\��\�\ZdF���\��\��\�q7\�/&\���wbp?�\��\0\�\�u\"�\�\�i7�>�kčwI41\��\��\�}01\\ƥ\�o\r顾ըy̟�\�\�?\�g��+\�\�k\��\�(\��o7��=}���[��\ZF�\�\�\�D�\0W��k9VZ�僚\�\�t��{�]��g�j�\Z��r\�c�Ku��\�f���.\�\���~\�\�zn�o�\0�\��\�����Oc\\d:1t��\�Oޟ\'\�$�\��\0׿�}�\0�\\ά�N�v�é[G3�~I��͸�\0��\0g��\0K�\0?�51p���T�4\�I\�q��j\�\�\�\�\�_\�ڕ\ZS�j1���e-�����o�\�v���<U}�\�\�!����Y\�_��~��s�u���\�_jW���\0\�\�.�ʺ���R�k;\�XL\�o �,����\0��\0˵�\�\��_�ȯC���\�G�ǵc\�ȉ���G5�6\�G�x�����VV�d�W\�\�Z�Bd�Ӫvz\�[/����]%d\�YA\��z~�}kR\�K\��\�\Z\"��\����c��\�\��3�\�q�c;\�~\�{�z�F���\�Q�Ha\��\��\0�nߕl�[E\'ݻ�K��$�;}%�C�\�|��O����i�1�+\��~c�\�y8��!�,q�\�\�H?��u�3�zU+�\n��D?zD!L��=3ϥ6�\�֖\�\��+m�\�\0]=�n\�\���\0<v㊵�Ӏ�����{�\0Z����B]<�ڝ�}zgׯ\�U\�4UfX�\�\�\'O�\�׷j�\�\��\�Z\�\�O��\��\0\�Ud�l2���1����\0#\�\�A�a�\�ܝK�\�ۯ8�~�Nm\r�r~�:���\�~���%f\�E��M��\�\��\0��]�[\�\�lz}}��\0�{V|�\�������\���\�\�M�3��%?�y㎜�\0�Zǒհ\�U���?\�Gn\rIG&\�\��\����~?��*�������]$�\�,r\���\�Ӟ�^K��\�\�\��?\n\0\�\�X}\�{g�\0\�뎕A��\���?\��\0[޺y!�x^�L\�O�߱5�4{Y�_��\�Ӷy\�Z\0榏\�o\�\�\�\�\�\�}k.h\�\0�\0\������eG*��\0��_OƱ\�#\��C�c�\��\�?4}��Ï\��\0묹����c���Zޑs\�\�?\��k&\�7q�\�t�~\�?P~\�W?w>޽=�\�>�e\��\��\�[�F\�7����Ƴ.hܫ�\0}�\0����ր1��\�\�_�ןA��Fh�n>o׿z\��n\�=O\��\0\�Y�|��\��\�;i6�\��3�\0��\�\�|�\�;�ӟ\�\��hM2e���\��}O\�߽cM\"�c�y\��\�\�\���f��}��\�X�,����]�2}�S]O�kr\�\�:~~_Z\�\�3�>W�\0#�\�ӊ\0&�\�[\����\n͞a�ql��?.���oμ\�|��\0\�?N���R1�ut�۔�\�\�~����\\�jͮ\�n.6���/�\0��\0�\�W?wy���?\���\\Ѩ^m�����O�\�~�\�\�_*�\�\�Q\�\���\0���-o\�\�\�o�:5��j�\'A�\�J+�]JM���\����\����.#Y\�T�W\�D�\�\�ӧ�\0�\Z˾Ԥ�_/M�����\�?u�\�I���^\�R�\�\�]�XQ�\0�_\�zT>tj�m�@�\�?�\�=�z\�]9N6���\�[C\'�������\�\�~ky��\�ȟ��\�g���ԋ7�\�\�w�1��=*B\�\�U�d\�ÿ=H�\0?�\0iFֶh�c��������^j��A�\�Ƕ�\0���\0*�\��#\�]\��\�\�ӿ\�U&la\�&ۿ�?\�\�\'��8\�\�~�\�bI��^\�l�O�\�5],\������۟�\��f���lm����\0�\�����\�o��\0\�j\�\�ͨ]Mu�ø�(�\�\0\�\�@�խ`-�h�T\�Ȟo��\0��Q[���¢\�\�._�W���\0?a\���6�il�]�\"�q:_�\0]r��\�M\'ʛq�\0�=x\��\0\��\�m6�$��Kɚ?�\���/\�۷�\�\rU[�c_1U#R��޽z�n�\�\�qpv�q��s�v�\0?ʭ-����g��\n~\�(���\�8\�\r\�\�\�\�|\����_O��\�k\�1�\��\�lO��\�Y�\�ƻv�_�?\��}8\�y}\"�\�~V���\0��\�=?JM�����\0\r+\�bVX\��\�0?�\0_��\�\�\�י�\������H�,�\\v��i�yf���\\p��mܟ\���\0�r�k\Z�\�\�\��W��Ǜ �?_\�1���\�ֽRw�����|��ݎ�V�L6�#Mu���#�n����3�\��MY\��\���\'\�f�?h�\�\�\�j\�\�9���\�J��t�\�\��>?�l��n�%���U䶖6��\0\����<\\�\0�o^Y׽ے�J�\�Vս-d\�\�\�.1���薭�%\��)��cvk��w�?{�\��5\�jV8c;���o u\�\�+\����\Z\r�\�\�_ڦ�ԡ��О\�\�\��\�˳?�\��\0ַ�j�\�ai׮kD�\�\�I�\�\n�m��w\��\0���_B𕄐���\0��S\�~���{\�?\��\���y��%:�[\�\�	Գ\��\�\�3�J��Gn\�DhN\�R����ڋ�\�;6������=\Z�\�\Z^�\�a},?y\�C�ۯ��sN\�uk�\�t�\��\�?&��M�X���\0���\��\0}�kh��?��\�<Q\�	�7\�h�\0oK�\0��ͭ��m��\0>vWߍv\�-�\�p\��\�ɨO>g���&�^�\��\���\�v�\0�.�\�Z\�4q��*�\�\�\nj1�M]Gy/%\�\�ukC�N6\�\\\�?��\�ҳ��\��g/k\�+]B9�5-SU�\0O\'\�\��\��\��EƠ9\�?��\�סxw�6�M\Z\�Z=���\�|�\�z�����»�\0\�\�ІMsPy-\��M�\�\"��\��]��o�Kn�ߠ��}c�\�5��~[l;߷_\�v�\0=��ap�y�E\�j+ߔy���\�\�-R\�ꞆR�9+^˴}\�\��\0.�\�{_Kkz6�\�t�n<ɳ���\��u\�\�\�g\Z������{v=�\�^8\��\�+4����\���\�\�ҩ\�\�ϖ8\�\�?�c�\��\�g�]S�k�_ס�\�\�]Z\�\�c�\0\�z�\03ִ�ciϙ\"��\����x���I\�M&\���\0c�*��o�\�}�ռ\�\��4(\�\�W̒M�Iۨ��kZn��M\"+!\'\�_\��\0֬�Y-\�c�2F�3��G������5}{W��K��\�o���\0�^\�\�3x�k��Y�vGc\�\�\��\�=9�U\�\�OרBZ\�\�\�LѤ���\�\��\�\�\�G�G�چ��di�?\"C����\��\�^Ce\�\�\�\�\Ze�̙\�)����u�\�Z��\�\�\Zԗ\��\�4���k\��\0\�\�֓�\�\�\�ߺ���Ӱ�q�\�\r�e\\3��\'�\�=z{W?}\���h$�E\�y\�\�����zdڝ�Ӭj\�\�\�<�OL�1\�R]C\rճ|�3�\�\�\�9\�\�\�UȺ��\0��_w�����\0M�S\��W�\�\�?\�\��W2\�pa&\��s��\0\����|\�t9f�h\�aD�=�\0�3\�=�\0\n\�u\r.;Z5�[�\����#\�\�q�\�i�\0\r�Z�\�X\���\�\�s埯\�Y7\"_���\��8\�\�^�\�?\�bue��6��}�Nk��6�\�0�\�q�?3\�O+�\�ZV�\�o�\��\�Z\�6ܻ=?��\0\��\�\�]۾a��\0�;������?Q�5b\�\�ͻ��y��q�Ɛ�\���x\��\0\�\�8\�YsD\�?ϯ\��\�5\�]Y\�-�\��\0\��c\�8�{�uS��\�?.���\0�j\0\�n!\�\�\�\�??\�8\�Y2[�9�\����\0_���hN[v�׌�=�\�\�\Zɸ�m\��^�\0�O_\�\��\0\�n�[�\�q\�\�?�\0U`\�n\�_�\������\�xo^�\\�\0���뗸U\�͖\�^I�P-\�\�ۗ\�\��?N���˚E#�����ӟJҺm�g���?\�j\�n�h\�\�\�߯�\�~\�\0S��\�}?Oo~9�~X7m}��y�~}�_­^\\.\�\��\�={N�\�\�]b��d�\0>�_�zu4b\�\�nn\�\��\\�\��\�\��\��\��~��\����P�<\�\��_���\�W3�j\\r6\�>�;��ր/-\�\��\��_��\0��\���[b��\0\�\��\�O_\�Y\�?4r�\0\��\��vҨ\�]|�4����o�\0=��\�\�R5�Zo�����}k�\�5��:�&\�>\���\��z/#�\�.V\�K�{�\���	��\�\�ۧ�O�_�$��]Y\�\�$�<\�\�-��%zd\��~.?\�%u�_���T�%u\�Z��V���f�VZm���\��g2���*���!�0\"�FA�\0�N\�\�\�\�f��p��6�(��\0\�\n*y��/??��#\�y~?�\���V�\�\'�gTs����\0?��p¬��|�P������\�x\�C3G\�n\��\��\�O��\0\��G\\Mk\�Q\��R_4/y3�\�M\�b�Оl\��#��{�\0�뭾T\�\�&\����\��Wg[�cVhc\�ػ�\0\�>�\�\���+�׾ hz?�ckp���r\�]���y��M\���ǥ���ּOP\�<Q\�\�JM6\��k��\0����\�tm>O�\��[Z\��\0\�\�\��Eu�,\��:Io�\���yb;�c\�\��\�ç\�m?LVj�6�\�Z\�u{\�\�o\��-\nq���Wi-��\������\0n4Ky�\\[i\�<bD\�l͊\���\\k?��u\����\�Ն\�-T3+n�\0m��\�Ͽ\�^O�/�E��4q���9>��\�\rJ=&\�a�L\�[���\0�_��_:\�٥ӻ\�oORM�S\�Q\�\�����O\�\�\��\���\�Mt\�i�b\����\0�j\���;�w�\�����\���U\�x\'�wZ�][VW�\��X\�\��\����J�g&�ӿ_\�\r-:+\�A����;�u\��\0\�\�~~�\�Z�~p�ܳ�\�\�w�zw\�\�\�\��1yp��4�\r����s�\�\�H\�ʻx�7�^�|篨�Xc�m�>_\��\0ןs�V}\�oj���2}�\0\�;�\�\�׵\�t�.�&�c|\��?{q7\�1��J�;\�[P\�\�0�\��\0��\0\�J\�uv��v\�_�i7�;mc\���46��M��\��P��\�ou�[Tܾs\�\�\�d?�\��\0�\�\�Y/�5&I7�\�\��\0[���\0��\Z�M]c^�\�\�\�5k�q���V���\0����s��m\�v\�rγ\�iK}��\�}��O\�Gn�\�\�A-��?R[{X\��|\�?�\��q\���c�5��x�I\�¬\�q3���zl?o��\�\��=��\0��\��fҾ\n�\�k\'�5뙙�x�?���>\�?�aq�\�\�\�9��x�\�\��?\Z�\0\�;\�O�>\�sm���\0�\������b�P\�Mo\ZI�\�%)Ku�\"��\�o�\�W=5�ܬ���{}�%�_e�^�U\�7\�m�3\�&i.u\��]\\Mq�\0>\�\�\�\�ֶ}?\����\0�����\�~�\�?��}\�Mo\�g�$�\��5�\\]X[g�X[\�j_�)\�m,�\0\��\�{���uh|+k!��&���\�\��|\�\��]��^z\�#u�KEҕ��?�C\�\�t�}}k7�\�Ա.x�v\�kNS����QN4⣧-\�o�{F�U�ZrTS��t�\�9%\�U.\�9>�\��z\��\�|��D|�h2���\��O�\�\�\�]�\�\�˾}kz�\�;\�^(H�\0�\�\\~\�?��\�\��1\�\\�\�\�/\Zj\�\�\�\��up\�\�<�Ӯq\��k-tk\�\�yqq4�ZB�y�\�?׿\��تTҌ#\��!\����\��W�S\�wm�\�\�\�\�[|;�Y��\�kW�֡66Y\�\�L�Oٿ\�\�z��|9�xF\�\�~\��y�6\�g_6/��\0��\\q�Ψ�g\�:_\��5���mr�����o���\��\0ӯ\����x�\��If\��&��\��ӥ]\�ݭ.ͷ�\�:\�SŚ��yY\�\�^\�\�\���ד\��.��f\�#��\0�;&9�\0>�\�\���Lͻ{{\�\�\�ӏ�k\nO�\�Z\�Rv�I�\�Z�-w����k�-\�F�O:/\���\�\�]��Ua�G\��<�ϧ\�ۮEx-\�\�FXG&\�\��?\�߿�\0��i�(ԭYGڦo�\�\�\���\�\�Y\�IZ6iyk\�\�\�נ�y�If\�6G����\��\�\�\�NMy��|�\�2H\��\0\�\�\�\��v\�\�\�+��\0�\�y\"�,l.��\0�\��\0N�\�s�c�Jɤ�?�\��\���\0]q�\0\�_�\�)\�7kZ\�\�\�۵�\�m�\�?#�6_ݷ�H��1�\��\�\��\�[˧d�\�yg\�wĿ\��t�t�J\�f�A�\0�\�7�&?_Oλ\��=���\�^�����r�e��\�~\�~�\�:q�+\�|Mh\�\�}��\�G�I*���\�^��\�zw��\��\rԯ4�%[P�n~�\0\��\�\�<z�5\�\�尿�fQ�x_\��YI�\0\��\�\�.c�\�\�[%��#�\0��\���`�S���m\�צ�\�)>nW��\�.\\�\0��;IwL��~}��ӯ_�\�Jط�Մ�8#�\�\�\�L~_\�+�\�)�\�8\�ugq��\0Q\����V���f�\��x\���u\nM]&ҽ\�\�\�;.ş]Y\�-���tȭ?\��\�?�j��h�����\�>X\�t\�\���\0�+\�]?\�\�\��ŶI����͊1�~���+\�4Z���\�rv����\0\�\���V\�i��Ѿϰ]5m\�5�������翯qT~4X\�\�\�\�:���ﳿ��\��\�i��\�2�r\"�\�\���3\�\�\�q?�R\ri�\��dԾA\�O\�\����	\�%\�\�\����=��Hj\�W\��\0\��\0?�+r;�\�\�\�t�\�v�\0=\�\���\�\�k�\�W\��\0Z\��}}?SW�E��!d�\�[��r3�q\�\���N1M6�\���Go��\0��\'�\�[���\0=:�\0\�Ұ\�-\�f[\��\��N9\�k\�u\r.Eu\��\��\0>�\�\�\�\�N[P�\�ȼ\�\��\0\��� q�n\�Kn������-\�k�\�\�\����Jź�\�o�����\0?�1]T�.\�]�\'���\��\�\�\�YUw��\��\�\0p�Ѷ��z~��\�\�to�i\��y�\�\�\�]\��e�\�\nN�θ\�Av��=�z~�OQ\�=(��c���8�\0=�\0��W�LW\�?����\08\�?\n\��	6�f�G�\��\�^�M\�n]\��\�����\0a\�]��\'��\�y\��ȯ?\�5&X\�\�y���\�s�ڼ�ړ)o\��O�\0V9��%ׯ$�=\�n��?��>�\��v\�@�x�����-\�?\��~�z\�R�\�͹�<�N�\��{s��k\r��3?�$��d\�\�~�\��\\�^j\Z���66�7ڕ\��\0�Y\�G\�\�/?L���I��v��\��+���\Z#Tڳ}�O\�B�Z\'��@u\�ڷ4�^�D���\0rS˚�\�X[��\0����y�\0�O϶:-\'��N��\�x\�4\�5WO14Kk�\�G�\0a����\0ץ�5\'�<y\"\���ç\�\���\�\�<���\��\�w\�\�\�=�k��&�]��\�\�\�\\�]�zuŶ�2\\k)��Xt�\�\�具{k_\���}pn5	nZB��\�\���\��?N�\�ڦ�%\�\�?67M��\0!�?�\��2�\�;��$�!�:I��o*\�\�����\��z�f��i�]�������鮩j�\��_\�\�V\�\�_�\�tw\�oJ+7���\�|[�\�~S�\�\�ex;\�y\\���4V֟�\��\0��\0\'\��=/�\�/��\���g���\\5�\�\�\r�]�y�\0H�\�;{w\��\�\Z}\�\�j��on�\�\�s�ǟ�{->\�\'�\0\'}��H��=�Ǉ�\�\��͇T��\�\�\�˷j\�� \\\�6�go�~�μ����\0*�%���WZ\'n��\�h|K\��3\�u\\}�=E��\�\�]\�hQ�\0ҵ	�\���\�\��O��\�S��m��\0H�?\����P�Gߞߟ��\�Y\�\�I{x�ƾk;�o\n\'�<p=��sX$\�\�M�Eh��.�ӯmM�~�g����y\�+�\�%\��\0�y�\�\��5�\�\rI�l1��\�\����\�åz�Ŋ\�z��ǲ(\�,!��\��p�\�\���^e�\�\�\�z�\�x�d0��/\�\�\�_�\�h\�\�l�\�v��\�d`\�\�}\�/�<���Xף�?奵��\�?��\�>��\0\Z�if\�Y��U\�DA�G�G\�\�+\�i.#^\���\0�}=�U���cY3\"C)�\��\0un;��\�֞\�K]��j\��\�\"\�i��oݧ\�\��?�u\��$�խ��Zد\�$����?t?\�\�\���\��>1����\�ƃ\�\�t�������kq�\��?�y\���\�»�丛�M�\�G\��\�5+\�\�|=ޝt\�ߓ\�\�_\�Zv\�\�\�5\rRK�چ�t�\"7�\n;����\\}�ۿ�e\�\�(��\�A\�\�.�gŵ��?\�1�\0-\�1\�\�}�\0\�Ƿz�\��\0	\�\�4\�|�%EhS�&\�\�\�\Z_��\��\0N���\��|-<�_bx7�\Z?����\�+x\�;��R\��Y�կk�w�P\�?\�\�\��|-,�\�cab?\�]�\�\�=8T\�;\�\nI\�\�\�sjܪ;\'\��tmk��j	[Wt��E�\�\�}[v}�?���>ԥ\�.?�/��\��u�\�\�\����\0?�\��\�{E����i��6\�}��|�\����\�����]G\�\�N�\Z\�\�_�?�\���}q7V�&�A-t\�gc�\�Kd�\�_\�}8�k�\�M5��{����v�0m�vt:����\�\�\���p��xs\�����\0^Y�x\�\�:�H�3\�\�\�u���^دB����c\Z\�J�i�?\�\�=�#\�\�\����\�\�\��H?>�\�\�\�`|\�wu#;y\�\�\�\��\0\�~>���\�FسG�\�\�e���A\�����\�\�k?��\�\�̸���o�y\�?\����\�}�\�ND[;U�\��\����~��>]���\�e�\�\�Kn�\�<\�0}�(��\'���q\�\�n<1�Ǭx���ė0��L?�\�\�qϑo�\0O_��\0w\�\�Εǈ!�\�m�-r\�M����\��\�\�\��?��\�\��|�8�+��\'��%E�={K�\������O����\�Q����j\�ͭo���\�|M�\\\\<ۖ`�}\�e\���b��\�o1�\���{�\0/�\�t�^*��-\r�\�\�\�E�O\�~_e\�֫ǥ���)u}[�\��\�}ʊ3�~�u\�Y�s6\�}��\�\�f\�ۼ�\��{�\0�܁NE�72��\��Y�\0�޽*\�5M7Z�������\��[M:A\��;��\�ߊn�\�__Z�\�[4�\�\�\���\�)|\��\0��\�>�\�\�\������\�sym�[l{\�\�ۯ׿\��rs[\�\�o�\0=3��n=��	���\��\�\�\�E�i�V\�\�\����U\�j_	�qk�}\�3��k\�<\�?\�\�����C\�\�\�\�-W{??/\�(�fa��\0���\0�Ղ6�\�Ͽ��\0��}�\�-�5M/R���\�\�\�q\�q\��\0֮�\�\�M�\�n�d��I���_��\�\�M;����\�\�L�v\�ݏ\�\��\���\�\�K{�e\�g\���x\�ӏ\�ڻ�4�{t�+i�\�\�R\���\�5�y\���#u�\���\0\�\�\�\��\0^�\�%eկ\���\�|3\�\�\�c�2\�hS�&�\�\�ӿ\��\�Q�x�\�7֫\r\�3G7��G�͏\�ӟ�0}\�\�m-d��\�\"�1\�`>oO�\�J\��	$���\0�\0����\��5��`���v��\��mE��?\�\�Y\�M�qu���}�\�r�\�:���Я�o\�·��I\�:�ǎOK�!�6\��\0o��_�\�\�v\Z?����ei<\�O>K��(\�jPJͻomm\�\�\�>���ξZ�\0\�O\�3؏�b�n�I\�\r2|����\0<�\�kԵh:\�+�i?7{�g�\��ǯ\�\�h>�y\�~��+�\0\��|�c\�q\�\�\�\�WwV߻\�o\�\�I֮���;+�D~\�Ӟ��ǯ�x�Y$�ׇ~gc\r\�\�����\��b�\���Giu\�K\�kK\�B��l�M\�O_��Ѯ4w\������\�\�3?A\��\�ME�9tn\��\�j�\0�\�\��[���Λ\�\�\�r\���vko18�\0G���}+�\�tպڥw|�g?�@?�_O�]\�CI�l��\�ðg�>?ɯe\�u�#��\��~\�/\���Ʈ\��v�Qn���em��\'�\�\�ּ�\\\�Z#m\���\��\�{�:W\�\�\�q�v\�Q�|\���\�\�|I��Ѝ��\�=x�\0\���\0\�\�{��\0_�\0�F�ݢfm���\�{t\��\�\r\�l��}}���νwZ\�\�\�\�\'��S��\�s\��\0\�޼��\�\�,\�׶�\0��O�����ݻ��\�:���?����Go�\�\��\�K����J�Av���\��?_\�^m�r�1\�g��X�\�5I6�f忹\�\��~}+\��˥��\��>\��\�y#�@׮#�&vm�\�>���\�b�\�\Z\�q�I+|\��\0,���n���i٧\�\�\nw\�ѯ�\�\�T\��s��ϸ\�\�u\�I���6ܲ?�\��U\��\�C\�\�n(�G���m���.w��\0�Ƭx\�7\�*H��Q�O\�a�\�\�˨}��Xi�\0����\�[��M\�ݴ\�n�\�\���� �E��|����\�[M��\�\��,ᷟ\��E\�\�\����\�⧅�+au��\�\�/�{�z\�1�\�\�\�f��\0�K>9ϱ\�O\�i$�歠\�ɷO���;G\�Qى\�`�w�+\�8���\�\�F�\�4\�\"��\0�?�JN�\���赾\�귾\�\Z\�*�wq\�g\�\�Y��u\�Jk���i���78\���\�\�\�Z�\�\"\�B���?�=���+��K���ce���\���\0�\�5\�Z}��\�]�\�j�\�F�O\�K�\\��.\���_@{\���(6ܹt\�ݻ\�w�\�Y���ܯ\�7#�\�\�L��\�ooJ��\�Zn��3\��\�w��\��\0��\��+Xԭ���WP=.ҿ\�,-�x}����t^\'�Ⱥ�\�h�\0m\�d�g�\��m巕,}\���\0\�\��=ޏ��t\�	|\'qkr̯$�\�I����I1�\0���\�ϯ\�Y�_q6\�v�[4��\�~�Z\�\��i�sZ\�>U���N�uMZ\�\�\�ٶ��Amn<�\���\�\Z�\�_`â��\�է��=���X�\0ϥ�?/\�\��\����K�_��z}\���n-\�A�\�\�n���������\0.�\0f�\�\�\��\��\0?z�G�=\�j\�m\�\��\0\�\�,OO\��f��R�MS\�^m\�di6�q1�\0�\�}�\��{{�׏�`վѪ�\'\��韧������F�\�a̖�\\���\�o\��\\妯%�o�\�x\�ƥ\�I\'�\���O_\������\��z�\�\�\�4^M�\0<��\�\��q\��=�Ȯ,$�|\�5\�\��\0�\���\��\0�|c��S_Y�f\�|3\�{{\�#��Ay~�\0N?±���\��\�h������~��7en�\0���>�5�Y\�\��\���}��\��\0�3\\���E��b��&I��\0�_\��\0�\�\\\�4�W�\�o����\��G?�\�\�\�v\�ko�i\�c�0�\��p�g���lC^\�|\���\�\�\�\�\�\�c\�\�\��\0\�`\��q_6�P��#3hz}\�\��\0\�\�\�y��\0����\�\�yp\��o\�\�g�4\�9�\0�\�\\����o�]\�$\�i#�Α�n��O�\��&��^F�a�\0O\�?�\�\�\�W�8\�~�\�}RQ�Sro]�Iu����Ҥ\�&\��9_.�\�\�EF�/��\�w]W�t9�[�SV�\���7�\0Lw����\�[�\0\�Ωx?��+�\��=Kź���ڳ\��\0j��B%���9�\���\�]6J\�\�\�\�lᵼ�?\��g�U��\�\�\�[�\0\�KT�\��}\���\�_PxgO��.�&��\�[R�ʆ\��Z\�\�|�y�\0L�\0�\���.�8�Q��Z��%e/{V\�N*�իپe(ĝKI\�\�\�ͧ�j\�\���iY]�\�^\�H\�|?\��\n;}�zU�\�<\��+P��\�\�/�?\�\�\��\�ץq~ �\�\��.��g�g�\�g�\0���|\�\�\�n/�m�}��yz]�\�<��e8\�x�\�Z\�\�X��2�vv����==z�\�Mz\n\�\�%��^V۵�\�\�\��\���\0Z�:�	�n\�;v\�5\\?(�x����t�\r,�^\�.=�B���\�z\�sj�I]���V=��k�mSιv�M\��\0��\��~��\0\�\�\��+\"����׌��7^$eV�\�]�?��۟\���\\�,�Vm�z�\0��z���[\��_��^�\��\��&�}\"4�\�\�Ww�\0�?\����\��s\�\�#Y\�K���\�\�g�\����ب�Q�2�F�\�\��O�_ǯNk̭\�Y.Y��\��\0\" \�:v��g);���\�сV�f�uoG6�70I%�Z��\�#�\0=\�-�}���\��[��n�}�;Lv[C�[_�w�1?f\�OҼ\�\�/\�K\�6�ou�R�<�\���\��\0���\0��u���>\Zx\�O\Z\�-��\�\�ZT\�i��3<l�\��$�\��7�{}�\���\0���\��5\�T����gyZ\�/U%ex�\�e[]viƓ\�\�q�R�}z=�\�\��mc���R�a4\��-u�>\�\�\�یq��F\�~#X��,n�o�\��\0ӯ\�?�rKk4r,�\��9\�ǅ��c?\�\�dT�k\�\�\�V6\�\��\0�\�\�\�^\��0��\0K\�y�����\�O\�i�g~�\��|�\�\�����?S\�5\r6\�\�\��\0�\�$_\����Ƿ\����<+�\�k�\�Y\�\�\�\���o�\0�>E�Q\��3\�Z�c�\��z�Oh\\\�ҼH�e�\0�}B\�\�M\�?�\�_I\�\�\�z}\�q÷R�\�Dxe�\��3��qm�\0?\��uA�^K���\0��\0\rb	�\�-��\�!�ض�\��;��{�뵤\�X\�Q�ʱ�q�\0�$��ȯ3��\�Z��v�ٛ\�>�\�I��\0W8�1Y~ּ�2\�VD\�\�\�l\�\�\�z�qV�x�\�O�	�KX[�l\�߷���k\��S�:\r\�ԗ\�y�ͼo�\�\�{_��\\��r�֣���Y\�D�\�\�������:\�?�\\�*S����\0X�z\�t��\��i�n�j\�7~\�\��Y�wĚm\�ɦkI�C�\�Hu\�l\��\0�\�p?\�\��\�u���f��֓5�?\�sm��k�zg�\0\�Fk֬�T�/�w�\\z�\�\�>J\�~N���\�\��\�T��i;G��i\�\�\�ݿ\�A\�\����}\�k�K�\�B\�o5�˰l{W�?�\��\0\���=���\0Iei��i�\�˯�\�:W}�i��4��H\�s��\�K�?�\�k����\�>\\iu�1M��\0�N��\0�s)\�4�	h�q��\�}�w�<Ќ�-\�\�\"�\�\�g�׿��=�p�:�}{��\0��t��Xɷ\�Ksf�?�o�P\��<[}�Џ�\�\�ck;{��kY!��g߶;\�=�\��}�%�d��vo]-�\�\��`q�,�\�\��\�_���\�\�kX�uo\�\�OO�\�~�^�ͣ\�e\�\��\0���\�W�\�\�\��\�w�?�\����}j����3Iqq�i7�\���U���\�꣼�\0I\�\�_�\�8~)\�c\�t�F\�ռ���\�0ٿ�\�y��\0�{��y�\��}ǇU�\�y�?Ք0ǿ\�\����\�;\�~�q����.�\0�S\�\�=�V\�]5܆\�#���u׽�s\��2\��B\�\��\�z#\�\�\��\�^\�\�4k��\�>\��c�#��+\���6��5�wo�\�\�\�_c��\��W�jV�|,۟j\'��dy���\0>\�ʦ\nI5.�_\�\�I\�\'\�\\Ж\�8\�i�6o\��\03�\��5][\�?y��>��\�\�^7}⅒�a��\�y�=���\�O�\�	~1�I>�\���X\�Z��\r\�H�\�t�\0<��\���/\�\Z/\��*�g�\0??o^����\�Ŷ���\0\�\�ǹ\�Ԋ�X�{�8�\0v�����\0_J��/\���>?\�-\�8\��\0??��?Ƽ�Zm�!��\�9�\0ʽ\�\�\�|\�wͳ���O�xO��[>\�m��\��#����\0��>}�V�/7�&\�NQ=�g�\��\0�_\'�\�Ĭ�M�������O\��5\�>6�F\�_�\�߾\��?\� {v�Y�}6\�Ox\�??G��h�\�7���[�\0\�����\0��\0\�:\�U\�o��k\�\�/\��>?y�\�W/\�K�}��[���\��\0���?|@��\�۬\�\�~\�m�up�~\��\��5��>2k*��I��\�\�\�[C��8�\0G�ߧ\�?\n,n��\�M4�$\�\��\�ۊ.��vrv^}�\�\r!�����m�m\��_3q��}+\�\�X![�\�ˋm7M�O�_귳Akko	\�qq\���\�s\�\Z���\�\�\�\rZ\�-t\�+O�K��9�\��\0�x-�\0\�\�\���=,-��Wĺ��\�όz�_n��\�\�M\�i^��\0\�m�\0\�\�}@�	j�\�\���\�;�\�^K\�9Y\�1\�I$�i�m�ߩ�`\��$�\�鵭\�����\�\��\�m��i�\r�����\�$\�!�\�@��\0�~�?\��.����\r�\�\�WE�\�čB\�R��M�\�\�s��\r?ĿO��\0D�\��}k\�<��\�\�`�h�o\��\�ǎ����\�?M�2!E�>G\���\0�~����U5&�^���?����7��]�7�]�\0��\'�\�mR9����\���\�ӽ})�\���jGj�\�1�^�~`�\0��\�rGe�/\�����\��\0�P\�\Z�w\�\��\��1�9�\0=;\�]�\�\�Jͷ�ߧ˿\�R\�德W�۲;�ٱ~\�\�_OAE=\�\"�-�U�����\�\�\�o�nT\�!i�sh�:Ğa�\0�:���\n\����~%j��#��y.c�\0\��&���\r�\��\�kV�v�\�l�\�\�xz�g\��W\�>*�]CW��pe�L\�>s\�zz㧯�:�R���*�Y+=\���Cw\���\�>\�rx�\\�\�\�7hl�}�\�\�\���b�u\�\�s\�k�\�o�&\����\���uX�t�\0�F�\r�x��ˋ��6\�Hs�����\�ު�������U�<١\�E����\09��](%���ˢ�vM7��zٵه\�\�KN��=%|\�㺺]\�;��灞\����\�\�}���\�4|�ݎ=:����)u)4��\0ҙ6\��\0C}�\0\�?\�\��s�\0��\0��\�Tդ��̒|\��\0>�\0\��\��\0�U)E\�d�\�f�.\�Y�\�\�^z$�79_j\�\\:\��;<\�O�m�\0.�\0O�\�zW\�\�&\�>�W�2\���������W���ͽ���<\�h�U��wa���}�hv�Y�\�W\�ɟ\�\��\0,m�\0\�\��\0&�yϽ}�ڶ��\�D��W׼I�j	�\0M,�\�{m߷Auo�d�^}:n�5Nir\�RI\�\�^[�,��z�\0-��l\�\�Ji4�%�ZI/�v\��nz�\�\�\�m�x\�Zغn��U��?\�^\�\��?���>-,8\�ۆ8\�\�\Z\�����;]aw[\�\�+x{�\���x\�k�K���\����qy�\0O�^��wt�\�\��?\\\'�$\�?c�w��Ϳ�|O\�:�½t�\�\�h\��v��\�Fru\�E\�\r}�6O�j	\���\�\�\�\��\�b�~\�\�v23>\�&~��\�\�ׯ?\�A��\"Vm\�\��\0\�~�N:q���a1�6\��>�\�\��Ձ\�j\Z\�\�\�C�\�=�_\�\�\�|\�\�=�gs.\���\�C���u\�[���v�\�\�;���~�vV\�I\"�>�y\�\����\�@\��\�UȜ\�n�\�\�\\ܚ�v�c4^s\'܅����}kV֚k�v�\��\0��\0��\�׷\�\�\�s~cJwn�ߞ�\0\�\�}	��j\�}�\0@\rB\�k�$��o��f\��\0UN1��ڼ�\�(����дE\�(d\�/�\�E�\�sŽ���/?\�\�\��\�V�#x\�\���-\�\�\�Tt��\�W\�\�/.\'�=�?\�\�\�\��5��M\���`\�\�\�.&{��5+��\0Y�jW��ϧ��\�\�>\�\�\�\�5\�RM�\����Zh�y~��]ߢ\�\��O�\�\�\�\�7O%\�\�<�L��\�o����=��3Z��7��hum=�\�O\�\�\�2~\�P��\�\�\�|t��=}?:�\�\����^\�5M��?�~Ƹ�\��7�\'\�\��\��\0\�޳�-+.�R���\�\�\��NK��]\Z\��_-�]ͽR��\�\��ymf�\�y�\0\�c��^,n:�\0�Y��\0��\0^�n�7\�.\�ۿ?:�>�z������\�\�$�8|�Y�wy���*\�n�\�\��|.\�zF�y\�u�\�\���\0�Mǚ&�\0��.��j�}?\��\0��\�.ђ|ˣV]�׶���\�\�Gv\�\�j�vر�x?M�V��P�\�\�o&6�\\�1Y\�\��#\�\�ۊ\�5-no\n\�i~�T�[{;;�\n\�xm\�muM2\��\0\�*\�P?\�ڥ�\��x}��?\�nru\�*�n��\�I�x��\��ؤ���\08\�|\���\��d�Zf_\'\�\�l\�\�\�o���NG}s\�\�h\�\�O\�r�\�K�V�ֲ];\�\\ͮf\�u\�\�\�y\�Wi~*k�7�n��\�4\���|1�\0?=��|]q�x\�rX��oj��\�S����e\�\�s6�Ǎ<y&�\�Oy\r��Eҵ\�>\�\�[?�w�O��\0��7�ǝ�H���\�X\�\�~0�\�t}i:}��\�/\�m�\�?\�\����\0K�/�~Yz�\�\�\�I(��˿m]ޞ[��\�\�ZL\�unW�4=��9�\0<c��I&\�d�O\�\����k\�Z\�T\�\�\�\�9�\�\\\�ou�\0\�Xm\��?�o\��ӜW}\��\�R_G\�yn�\�Ӟ�\���ӫ\�k��\�\��w�>�UV�Q~V\��\0\�\�}>���Y�Vڹ^w��\�\�\�=/\�u\�v�\0:��=G�\�Z�e�����A�>ߧ�3CVv{�<7Z�\�\��\0�Y�?�\�ל�\�q3G\�\�N\�~�\�ޙ�\�z\�VI6�\���s�Ҽ\�V�h`�\�8�\�\��\�\���\��\�\'\�f��3Z%k-\�\�\�|\�9\�U\�\�\�\���\�ҳ\�4\�Y�΋�\�Mk��q���\0:b��\0h|�\03�\�\���\0�\�>\�5\��\�\��\0>�k�p���Iy\�\�\�﮿\�Zw\�\�\����⬋�F\�5\�7\r\�ǹ�͗�\0-�\�\������\�\�vw�M��\��\0�/>\�m�\'�U�\�?\�\�J�\�muy\�y��}\�k\���\0#��}*�z��\�,\�\�wZéY\�p�W�|���\�9�R�挤Ҷ�w���o�\�\�\�A�\�m��h\�v����w�!���\0A\�?ow\r\�I�+t��q�09��\�b\�Tj�\�l\�,6f\��M��\��x��\0���t��/�ծ��[�_27�\0�п��\0��\0�\�q\��vs.\�\�U\�\�\����_N�\���ɠ\�\�\�\�\�(;\�\�\��sϭq�Eqk%\�q�\�\���Q\�\�\��g\�\�/ǖ\�S32y�\��l�\01��ל��Y]Z�\�w\��>����_Zm���[>߮�!/u\��w��\�뱍g�I<����<��d~w\�mx?�-�zW\�>���q\�$��[>x_���\09\�+\�9��X\�n\�\�=�\0�\�郏�\0UG�kR[�\�\�\�\�\��\0&\��\��{��1\�ڦ\n���di/\�U�w�\�\'^\�\��jO[�֟�|ͳ��1\��8��R�m��]�\�o$1\�\��\0���\��\�\�\�}x潂��M5_>f\�>}�N���?�(��]Cy6ߛc�y����9���.^I�#n\���Á\��J�\�ƍ_o߻{Ϳ��\0\�־/��\�.��Я\���6�~����\�٥\�\�(������\�\�w\�4\�n-a\����E��A\�Y\�\��\0\�\�\���}k\��\0h�Z\�\�t=I��\�K\�f�\�\�\�:�6�\0��q\�?l�?�~+\�\�\��|/�\��][RO�krB�\0�<��\��\0�_�K�\�\r\�5\�\Z}�i�^^\\jS\�\����\0\�\�\��\��<�J��M\�\�h�l��\�[�\��X\"��{(\�j���\�yj\�\�9�\�\�oo\�\�|\��\0S�\�zq\��g�j�+]4\�b\�M\�\�ǳ̚k���\�\��?\�\�\\d}��\�\��]{\�g�t;_��>\�ok�_\�\�R{o[\��\0_�^�\�����\0���ԯ�u�\n\�n5�R���\�K�\0Eѭ�\�\�O��\0D\�?/ιe_�rߙ�\�wrN\�NZ5�����M\�\�\�\�M\���\�tzůh�:�C�_�d}R\�D\�f\�5]a\�\�\�/g��\�\��ĭl�\�\��}��A\�\��)kn��\��\�\�?��yς~\�Es\r\�C��\�\��\0,x\��\0\�=\�\�o	�n[V�j\�\�\�C���\0��v�#\')JO��\�\�h���I�]���\�\�\�\�4�68a�~\\�\����_\��\�[M�/\�|�^�a[M\�\�o\�MCJ\�U\0_\�PZ�\��\0j\��Z\��\0\�?�:\�\�í�\0k�\'\���\�j��3�_�������JSQz+7{Y}���\0���Nv匥~�.\�6m+\�m=�I%�\�\��\�\�}\�/ï\�\��\�[���\�y.\�Y\��\0�Gӷ_Ƽ��\�W\�Mo��^�\�Q���\��(4[\\׽�\�n�\0�\�\'L�f�Mq�k	c��C�xn\�\�y>G��j_m��\��\�TKw\�\'$�\�c.]m��_-\����=�����wӪ��y\�MzV��\��\�?�\��\0eE|f�\�9\��C�fc�\0�ެI?��\�h��\���}���\�\�\�F��=�\�\�\���^�\�[��\��Z�\�򵶏\�ǝ�O\��\�?j�W\�\�w��\�\��\�p8<�\0�ƾ\���y�\�\�\"�\�*\�\�P\����\��\���ޕ�t\�\�_鰷\�0����m��Ǿk֨�4�\�+�8\�\�w\�%oW�\0\0�r�8�\�<m寓�t�\0U�z��\�k\�-\�孚\�D���\��\��z\n�k\rq�\�gm�4��\0�?�+\�u7Oq\Z�\�\�ya�\0\�\��\0\�\�EMU�\��_���)�\�R2\��˺7O-q���?�\���^5��lۛ���Y\��\�ֽ\� �ú*\�4-r�vb=�\'�\�M\�����\0&�_K\�?�.��h|��1\�O7�?�\�\��\�rx\�^eU*s\�^^eו\�mݖ��\��BQz�\�\��zw��=֖��CW�b���\��ϲ�2E\�\�\�\��?\��\0��u_]x�84�/\��y���7�\��/�\0=5/ \�j�\0\�\�\�㿧�9�%�\�|M�j\�\�OT�þ�K5\��\0�rM��sq��\�~\�u���L�k܏FյI5mORԮX4ח3\\>�\0�\���ǥo�娪VZ�?f�~O�\�\��o}l�\��F7\�\�=\�+8]+k(\�W�\��fVe_�����zMq�{~\��\0:�\�R��¾\��X\���\�d��\0�\����\��\�\��\��<G\�-~e�\�ḛ\�ɷ�ۿ�n+鯋��9#�S�<{�\0�\�\�w�n7�+���\�0�\�������\�=\�Zݾ\�}埻\�{�\��9\�s�n\�4\�1\�\ne\��?�\�\�u\ZMm5\��\�\�z�\0�?_��\�]�\�%�YW\�O\�l~\�\�޳��M�V�ݵ���\0�v\�:V��\�\�\�\�r\�g\��\�q�s\�ڼ\��妞i$�>��\��1�{�t��ó7!�g�\�\����{�aI�e,�m4��\0]��n��Ϛ��\�/�1\�\�c�_j��\0�/�6�\�f�\"��\�\���\�q��ҡ\�\'f�O��\�\���2�no|L\�<3�\��\0\�~\0��\0��\����<Iq�K�;�u\�\�n>\�\��\�\�g�<���C�o\�P4��\�\�=�\����\0�\n�\�Y�Y�}\�\�B?��U�7�^\�J\�J�=\�<�\0\�好�\�\�NkCG��9�Eg\��t�\0\�\�j\��mɾ�~�\0.��\�t-�k-<\�c&�w�<\�\�O\r�z��cY�O��o�=;�\0��\�ZOčVH\�I!Vt;�Ǔ�:�a��\0�.��\�p�ȟC��8\��רh�>\�,\�v\�6\��\0���>���%\�����t��]Gc[ȟ?��\��w\���4H\�|\�v��}\��\���9�\�\��\�����\0ǧ5�\�\�ߍ�\�{VK�g\�\�o�\0?_�\�^�῎�\�#[���~�d�O�6�\�Ŧ���<���=��\�i5��\�\�\�<\�t�\0Uq��_[�?\��\0\�9\�W!�����\�\�߇\�~$hz�۬�P�X���\0��?�\����\0�\�e}k%���B\��\0�\�<��\��z��\�\�զ��i�\��\0]\�O�\���z\��t3�I\��ZG\��]B\�\�:m�\'\�l\�\��<\�^�\0\����oڵ\�>�o�=b�Y^E�\0=\�.;Z�\0�+ܣ�q\���ߞ�\�T�m&\�^��=�rB�e�\�?���\��\0=���\0\�\�?�m\�~\�_\�\�=ؤ��\�f�7��\�m=?#CF��\�B��e��~#���\�\�ߺ�\\�\����\��\�,\�\��\��\�\ZuC�xvO\�V�@\�v�ym�������Ǯk��U�\�\Z{���:\�m7�c�Y��E �\'\��\�\�s�k�����y���\�\�\�> �u�\�\�\�<�3��\���\0�\�y����\�\��kUi+����\�_-L��MZ\�\�ӥ��[�\�T����i��\0�\�=;�W�h:�\�ƑH�bg\�g�\��\0�k\��i���\�\�U�o�Y�M\��\���{sק\�\�G\�?5\�\�\�C#\�O-��?\��ӻz6\�\��n�k\�\��m��\0<{q\�g�s>,��_^2\�t���\0��\�\�]�\�\�6\�:�q\���\0:�\�\�z~�k�\�\�f�2d�\0?��\�-\�7\�M]5\��\�K��\�l\��?\�P�j�;Pu?\\~__\�+I�\�_\�\�\�9\���\0\Z.�m���\�o��\�y�\�}R\�k�/\��.]^n]��\���v����\��\�l��\0�\�\�^�9�R^\�{�|�\0��\�>��}#Bwcw\�;�\0���\0O\�ڳ�\�\���5�Y�\�\�R\�o&\�_W�cw��\0u&�o����\��=?\�\�\�~\�\�k\�X\�wV�0\�_G����O�ҳq.�y7��\�qo�\0.ַ��g��\0�\�5��\\5Œ\��Y\�\�q���x���\��\0e\�\�m��h\����s;�X\�\\�\0\�\�q\��\r�\Zr�)\�\'d\�im��Q\������i6��z\����u�r\�z����wku$߼�M�\�m���n�\0�\\\�\�\�y?}�\�.�\0��ʔg�����\�\�|ǬxN�K��\�ך=\�ɾK9�s,\��\��\0�<��Vn��\�^����\���\�x%��A�\0E\�#\��C\�\�.{�\0ǘ\�㈋�\����\0~�\n\��u�k\�\�Z\�\�\���M�\r|�s#���\�\�\����+��-o�Q�����j���.x/\�b\�A\�,\�.?\��\0bjHmu�>��?\���1���i\�$�\0�Wf\��o��\�\�\�����\�]:�i%$�;\�\�mS뾯G����qm�\�\�=�i]�.Z\�W�P\�\�[ɵ���\����^=�?Q�\�}m\�=js\�\�۶A�o\�~\�\�`t���\�٣hp[��\���\0<w�b�Z\�\�»:��9��>�\0�o|V�]7\�߉G���G�\�W[\�|\��c~e\�?ϧ�\��ߎ-Vo&k�\�\�kg�aN�f\��[�\��<m��ۥ��,�|�>�w\"\���:ׄ��ݯ-f�\�R�\�H�\�\�g\�ȷ\�\�\�\�Ӌz�����Q�\�\���񤗗�\�\�\�\�\�,\�3Isl�\0\�c������\���\0ך����,[R�W�mc�i4��=5\�C�\0,�\�\�[�?\�\�\���\�\��f�a�Z�\��v���\�t>I�X��>\���ϭ\�\�?�g׊�\��\�ioo\�\�ȩ$�\�3I�\0ln5[���\0�\�+�f\���]�\�\��\0�\�\�����\�����~\�\�\�:��T�M\�\��\0\�\��\0U{.�ccn�\��M\�\�\�݇�x4��\�?\�￩=�+�\�u\�\�Z4Ku��\�l~=��\0������+\�m�7�\0�\\sߚ�6�m�OoG�|�էU]�k�\�Zm���/�&��\�\���\0f��}ב\�����\0�_�h�M�^]\�\n�k�\�\�)\�\n_\�k��,��zW\Z\�\�\�B\��\�����\���9ϭs�׋4=,\�&\����u+�\"��s��\��\0\�\�\�\�\�\��b��b�Rwj�ok[���\�ƴӓ\�G�����K\�ue\�wL\�)y6v\�\�~\�Gt�e�\��\"瞝�cӊ�\���\��m�\�O\�]��~^ߩ��\���t\���7\�I��;�l?�tcӮ����\���\�1Q6��X�lt�\0�6��*_x�T������I\����\0�b�\�\�\��%\�\�mm\�\'m.�I��gG#�r{Z\�N\�[t~�\�W\�\�\�q�\�\�3;\�3�;?{\�\���\��k��w��?\�uU\��kk���)��R\���i�>���s\��5\��\0\�\�-I[��\�-\�\�\��ۘ<;k\�ٴK[/�_÷N��h\��?�\��zL?jw��\�\��U�ǧ\�..\�\�{�\0�*׶��c\�\�t��n��1�\�7�\�%죬�v��Qv{n\�.��\�䌅���\�_/��?�=�˓�\��\�c\��\n\Z\�\Z+\�KM����=>�VW\�<~\�\�\��Y�\��j?�\�\�o\���\�\�m?��J־��\�\�M����\0��/\�\�=<G\��Gguww#$m�\�Gt G�\0\�\�ۯ\�W�|t����\���\��O�=�\�?\�-gm|\�v��7��<ؾ��\0?�o�n�\�\����\�Q\�jRN�y�\��\0_oC\�ڸ3t���\�7��1��\0��^Y�\�O6\����?�\�W-�jQ\�\"���������\�։4�Wm4�\�\�\�u�����}4z|p�\�G\�z2~\�O�\������*x�S�q�Zk\�\�\�?x�Ě?��7m7���KP��?��\0�^�k��Z�\��b\��?�_+\�>!M6�wgj�$v\�g��w\�y\��\��\0\��\�\�~9\�\����\�Ꮐ\�gm7\�v���Z!�\��$�0�ſ\�=.��}B\�\��:W��՜(\�4��bg-z\�3�(�M;;rQ�Ysim�\�\�n\n�U*�R�G��T�\\�Ҳ�^i5��\�ڳ�\�O�e�\�5��k��x\�\�횕�\��\�Cp\�\�?\���\0�w �a^�n�U�\��\0$q\�\��\�]\�\�\�y\r�)�\�\�l\�L~\�?���\�AW�\�w�?\�\�\��.��\�\�\�=\nTc�((-nݵrz/zR��~v\�w\�R��9T��R�����\�_�Z�\�ַw-��\�\'��\0?\�5\�|^���\�V�R~�\�\��w\�:o\��\0c��V\�~\�>^��sڸ�\0�Iy\�mI��\��q�>kv��\'���b\�\�\�\��_9̎���\0_OλK{\�{m��\'�\n\'���_R9\�^gi;*�h\�3\���_ך\�4�i�8\�\�T�\�A�\��\� 7//$m\"8ݶ��疟�:~L\�}x�\�\��\0u>\��\�\�\�\�\�=+[V�Vx\�Vڱ�\0s�\�\��\�^W\�\rYm�\�ec\�Ɵ\��\���\�תm-�\0\��GZ׮6I%��\'^�\��\���\�˿�Y#L\�\'�\�L�\0�\�u�븛\�\�ȗ	�\�\�\�ÿ�����\0���\�\�M=�ֱuu:}�M$چ�\0�[xm�\0\�.\'��\�\�9$���\�\�k�\�J\�.\�\�Ⱥ}\�\�^x�R��M\�\�`��\0Q�\�4{x?�۷�WQ�Ȫ�\���\0���\�\\�f��r\�\�1�\0�\0l\�7�|\��/�u?��u�c6\�o�\��3�\�nz\�3\�q\�\�\�[��趗�k\���ãȾZ����\�:f��n?���\�����;\�\�\�`m�\�:�=\��\�c�6ߛ\�\�O\���Mj�\���\����\�\�\�U�����\0?\�V���qݲ:��\0o��l��Y�\�?���\0�?�=j\�sl�.?���w�=}���x\�R�+�\�U�\0a\�^1\�޾\���\�\�\�Mo�\�\�F��\��\n\�WO��S��ˋ�q��\0 \����\0ώ2\�l)nG����<ք7��$s<2$\�\�\�\�\"�\�kq��y\�\���Y\�t�{ӌ�eu٦�4\����\�\�\��}\�~\�]\�ͦ\�\�Hп���hz�\����T�͸.\�\��}x\'�\��\0�b�\�/���L��<1g��\�\�K\�M\���\�\�:}���Y�\0�\�k\���\0�\0�}�R�9,g�<�ȟ�����\0��Q]�P��Zz��9\�ku�\��_�\Z\�Coyo%�\�0\�[\�>xfO6)9�\09�J��Fmu\�49&�_�\�Z|��\0��\0�^:\�>�\�\�\�07П����\�g�k�\�\�\�\�\�_3#\�<���t���M_O=��\0���WMw1|�C״y|+\�>\�q�˅\�O\�y\��\�߯�-3�i�z\rׄ|G6�\�&\�濳���\��\0\�\�\�ۿ�\\ד�\�\�\�w�\�j�\���\0�}��\�x{��\0__ʾ��\�x\��:<\�$ִ�;k��?���>�E�=\�\�\�	\�\�+O\����Gk���\\)ۃ\'��\0��?\�OI�kSI+�T\���׵{��5�\���%�B�9\��\0-�~��\�\�\�w\�Mq4�;��~=�\0��9����\�\�\�\�\��^fs�\0\��3�VN��m�\�o�g\���u=���8Y����3\��x�R�_5�[��?O\����mo\�o\�\������}��\0^:�?ȪZ�\�\�\�;v}:����2I\n�\���\���\0�{׼�������\�xS\�\�s7\�b�\��8��ߢ��\�V�\�)~e��o���_�V~�\"��綺]\�xo\�0\�\��\0�\�_��\�>�\��;p�_4�/O�\�\�\�Z���\r;G�|�MSR��\��\0�\0���7_���\0?ʼKV񇋵�\�\�\��\�\��&��I���Ekg6\�\��\0F\�����r\�Jo\�ѵmtKE�\�\�\�ӳO��\�ח;FdX�\0\�\��\���\0\�:גx�Ş\�\�&�\�5e��2(~ߪy=�\�\�\���\�\�^\ry��e�\��\�}[\\Եf���μ�\�\�\��w�\�Ӹ\�Ҽ�mr���5�\�l�J�w>t�\�\�\�\�\��\0�YJ2�n��KM�\��\�N����k.�^�;;?\�SkœC�I�\�G����,�K��컫y�y��\0f\�ݱ�Mz\�_\�\�\�^��\��04\�2�z$\����\�\�>#�\�\�F-\�\�\�M.\��\0\�r��\0\��\0o\�<I\n�\�nT\���o��?��\0_\�Z��i2##7�\�؟\���V�ۥ%(io���w�|�h�\��)\�駯�Vk��O\�ú]���Y��\�P�\�4�b\�\�P\�u�=�\�a�i��h����?��:�P��t?\rL\��\�ߓgXC\�=k\��\0\�\�O~\��\����I\�o\�9�\0�;h\�Vu��\�N+\���\�\�\������\��\0\���\0�>�\�\�jT�՛�M\�\�\�M6W�;�5f\�c\��\0^-\�\�\�d��/�˗�\0�����\�{��FI դ�\�o�\�\�<��k��\�y\��������\0�jϼ\�#��\��᳿K\�t�i��B\�h/��qo��\0/_\�x�\0�j�\�\�M�c7\��4:�\�\�\'��\���\0\��{�\�M��\��]��~\�SOfxw\�k[���M��ݭ�\�\��C�\���\0��\�����\0B�\0�i_�?����u\r\�ѳ����)�I:ŧ\�[��P\�\�\�Qky���{n\��\�;\�-|\�\�n,��\0�~��\���\�?\�:֟�iz��M�W�����\�\�ȏ��\�\��\0i�\0�_J��\0�k�b\�\�\�V��\��x\�Zv��LO,�\��E^����\�\�5�\�5�k\�$�\����˷�<��\�\�Q�5\�t\�l&�Կ���\0Ǿ��۱߿Jl?5\�Q|�	�+R��\�ɩx�o\��\0p�o�\�\�>��<{�W�x7ᶗ��\�\�\�s�\0La�,s�{�9��t\�\nF�\�_l��z��Go\���\0�w�F;\'���\�o��G�!V��\�4�y�ϥxJ}\��\�\���\���\�\��g\�?�t�>\��\r\�\�\�x~\�u\'�\�..\��\0íz^���avG��s�/z\�l\�Go��?��\�{(=d���\�%\�\��\�ԓ��\�G�\��ߋ\�c\�\�vТ�p�{?����\�\�:|j6\�\��~�z��V�v�O�\0X!�\0\�\�ykշ�\���\0��EN\�.]\����Və��\�o�O\�n��2�\�66ߕ���?1\�EcU�J\���z{֥O?�~>�3�z֊\�\��\0�G�I5\�\��E�m�����J+Uc�W��\�\�\����$|��\0\��o\�˞^_w��7\�o\�s\�d۴昱�&�\0?\�\�\�J��I�3\�+|ɴ|��\0�]+߾3\\n\�\Z=\�?i�\���\�=\�+\�\�l7�v|\��\�ώ=}_{��\0/��A�,c\�ʏ��?\�|s\�Z�I�}�)�\�O��w\����ҵK��\�\�o�h��\���\�\��k�l\�]Sė-4�lvh$�M�\�&��\\�\�ҳ��\�\�\�*���\0�Tc\�}mc��\�\�Լ�{{dԼQ�\�N��O\�t�\0�v���k\�?f�\�\\�/��&_G\�\�x�R\�<H�3\�X\�\�?\�_��\����\�\�\��\�\�\�||�\��E�G]S\�u埇\�H\�\�\�6\�\�h�\��\0.��V\��\0�T�\0mM��\n۪,w)\��\��\0��\��\0Ҽ�1�\ZVS�\n��$���D�[�\0\r4\�\�\�:%yu�\�a&\�\�^����\�:r���Ti$�\�\�Wo��\�\n\�7\�\��g��Oo�\�n��jwn�/����\�۵`\�7\�\Z��\�\�ںM\�K�\�\�\�K3��\�\�{�\��\�\�G\�t\�\�\�\�^J�d��3��\0�\�_7��\�M�jy��?f\��\0\�\�\���ׇ\�t�:�����ry\���s_\�3,���\�=\�\�\�\�\�\���*���$���\�\�Y\�T�\0�\���{N\�\�O*\�G_\��99\����b�[=\�\�w\�\�=����u]���s�zq\��U g\�\\mi$��T�\�s��Nk\��w2\�A2�6�����}}+\�5\�巵7\��\0_O\��׋��\�n-\�F\�s��\0��L\�\�o�\�\�\���h\�df��!�\�1�\�\�\��\�^�\�Pkx�D\�,���jQ\�{��\0y���#��F\��<Wї�_�\"��*}�����\�:Wǿ�f�i�o�ۻ\�}\�mcM��o�\�\�O\�\���\�os�\�>����	_��W�\�iOW\�J_sJǟ\��\�N\�\��\�Cago�\����Z\��>]�w7\�1�\�\��{癒Glw���y�\�\'\�Z�3nۻ\�\��8\�O\�5\�t��n\�f\�\�Mw뮟�\�Ѵ��V���?�^Ï\�\�\�\�~n�\0\"z�?^��\�Ocpc��\0C��\��\0\"�\�\�\��\�6�\�?J�n\�G��/�3�i\�]��i\�\�\���]z���˟��\���C늵�\0\��?c�\0�²cea�7�\�����[��Y?�9�=�?_^4NZ߽֫��\�\�k\�wz�ޟ\���\�f�����\�\�ӭ�\�6�\��\�OA�În>|}�\0��\����\��L�{�\0\�C��\�Bi\�\�՛]�B����\���G�g�\�?��\�\�\������Ŏ�o�\0/:^�h>\�hz\�܏\��\��>4\�~,x7M�v��V��\�4ٟ͗\����.5j�\�\�\�����76��\�\�\���\�N0!\��{J�ς�\05�~+�\��\�u/\n\�	�\�?B�\0�\�\��\0\�\��O\��Ǵ��\�n�\0\��\0�/O�\0�u�i\n��nNГ\�-�٥��Q4���i\�\�;�\��z\�~�*�m���o�\����\�\�ҭF\��=\��\�\��\0&�ou���O�ִ[\�mZ\�R\�a\�4}V\��=u\�\��{\�|�\0\�՟6�������w��\0\�F\��n;m\�?\����Wi\�mo\�\�\�o� Դ\�}Z\�\�O��\0Sr�\��\�q�y\��\��0m{G�5Ǉv�v�\0��Ԧ�\0�xt�\��\�\�\�:�\0�v˻�}�?���Z�SIԵo&ԯ-��I�\��\������&\�Wz$D\\o������+~-�8��Z\�4�j�~��\0x��\0��;�Y���\��c}\��N��\0��\�W\�\Z\�\�\�&g�\�o�ׁ^c⏊\��\��Q�MJ:9�\����\0g\�\�?�.?\�\�M�\0�\�޵\�9�\��\0��\0\r\�\�\�E}�,1�\����>�޽<�\�(\�<:msT�\��\����\��ɻg\��\�\�W?�\�e_4x�\��\0��Yqv�<�\��~ө#�\�K\�?\�\�\�P��\0E\�\�\�\����\n\��q�\�7�����\�\�5k��;k��\�\��\'��.\��\0_J\�u.���柒��\�y\��4\�5ok\���:J\�v�w�y\�C\�\�y?���\0ھ\�\��^��\�\���q^o�Z�]&ɴ}KZ���5��m\�K��\�\�?冟mm�K�s��\�_?\��\0�4]BO_\\\"\�2Q�\0\�L{}��\�s���G\�-[R\��\�]L\'�\��i\��\0�}��\0��������&-Ξ�r����+\�����Gb��-�\���]��u�\�\��\�vsEf\���P\�aG�~\�y\�}>\�������^\r�|H����g�G��\�\�w?\���\0��J�#�$7�-�\�r_\�S?�\�\�_j�\�7O\�\�[�u�\0�\��\r�;��\��i�\��\��\0rmb�\�K�Lg�]�{v1\��R\�\�&�\�����m(\�/h�\��\�\�l��׻d�m\�.Ue��[\�\��;\�Ɨqyy5\�ߴ�\�>\�}GOo\�\�d�\��\�\�jL\�kj\�\�=\�\��X��\0�����O��z��7�Nu_�k\��O�\�\�l\�׵��\0\�\�R�\0�M��~5z��d��2\�k_\�0�O\�}�\�Z���_�\��\0\�&\��\�\�\��\�;���)�>�^\�\�\�l\�\��6�(\�9\�Y\�\�\�\�5�\�\�\�\���X��\�\�\�\rq5\�\����\�7#��\0��7�\��\�ׯ:�Ǌ��o\�\�\�\�\��\0ν�X\�~g��=��\�߸���/>[驷M��\�1\�C\r�\�a��=+���bYL3mO�?\�?\�ڥ{W{����-�Mn�\�m���\�Ar\�k�\�j��\�Y5\�\������	��Z\��,\\h�ٶ�#�\�O[��\�\�\�{���\0\� �6�\�\�\������\�/\�?\�\�\�y�f�\�WWK\�;G�\��\0�����\0\Z�V���9k�ծ�\�.�\�{Ht/h���\�\�m\�\Z�\�\��\0\�\�T�\�\�\�\�\��?\�\�\�\�[\���\�5m\'X\�t�sC��\�4]z\�SG\�lf�U��\rŸ���\�\�\�\�ێ��0�c\�\���T^��\�\�\�\�\�U56�?Ϫ�hx歧�\�!UH\�\�o��S\\Y��\0�^�n`E?rc�\��x\���\\�׭t�L�y�/\���?��\0Z�\�ƞ)\�|\�\�k\�^(\�!\�t=\�k\�\�ɇ��煽��\0���˯�KO�����M�ZM�t.�\0�2I-�\��G\�\�\��\�5ˈm�?j�>�\��;\��c^�\0���\�\��]�\�O��\0\����mSĚ\�\�?_\�\�\���.��jW<\�y�O\�\���\0\�\�\��\\,{s^\��\�6��\����5o:\�\�g���G�͋\�\���}�\����9����\0��래�7O\�W+�>o\��8�5\�6�h��U�ڶ�ӿW�k��cʭ{��ֹ&��\�_��\��_\��\�6ׅ�\��\�޲t\�4\�~_���\0_=븲�lmQ�\��{\��~��${~/�\�M���g\Z��j}B��öqߠ�oʿ�\��\0_ޫ\�۱�\�d�?��������\�g��b�X��\�\�\r��o\�r�eB�\���=z\�\�\�oΞ��\�9\��\0�O��J�ߩ�͇\�~�\�J�\�p�\�\���z�t㧷ҝ���\09�\0_��\0B`|���Ú*\�ڿ7a\��Q@\�_\�{���\�\�,3C�}?\�\�\�g�h�1\�\��?O\�\����n��6m����O�\0_<��\�$\��@\��\����\0\��\�\�\�7\�MAaӦ��ټ���l����\�kˈ\�i#�\�Ԧ��<���\0�y�\�\�˭��o�ҽ#\�\r��-��\�u��\0�&\��w���\�\���\�Gc\�kW�]%�\�ZT:���\��X�\0���\�\�\�\�v��\\U��\�ҏ$d\�{$�\�M|\�\\\������\�w>[�\�\�(�i�z\�I\�U�\0��a\�Y��\��\0�\��G��\0�ϳ\�:���G9&���k\�\�Wwܶ�<g�XZ���]z�%�Ğ0��\�-�\�Y��\��{y�\0���?\�\�\���\0��~�x-��8[\�ȟ��O�\�y\�#u�#\�\�\"���|�;��\0$b�^�\�\�\�\"��Xh\�{(\�ڧ&���k7\�~^m9�^\�o&\�\�Xn�C�\0\�\n�\�\�m5\�7R.\�G�l\�\��b��ðɨM\Z���\0�}��\���_Sx/K\�uc	�Q3#�\0��Z�+��<\�޵����|��\��o\�\�\��\���x\�k᛫�2\�I;�i���\0#��}y�+R�O�\�\�\�\�O\�\��\�9�~���\��\Ze\�\��\0\�\'��3�y�?���$Eg\�[����\0\�\��sV��\�b�\�篧��^��Zǒ\�\�U�q�\�ӟ�Ϸ�H�/�\�\�\���\0�S��}j@\�|]|�7ʹ�}\��~�\��\�cTh\�+�\�|\�\��O=N�\�(�\�ͻ�\����\�}��jdDo�ǯ\�Q;�?\�}U�\��\�z/\�\�u\�b\�n&�N\��1��u�~~\�\'���M�|L�=�\�y�ٶz��\�yQǶ�o�\0�\�_Sx�P*�6\��>�\0��\�\�w�_ڟ�Qt�\�&����\0\�9\�?\�aq�\0��=+���\�ӧ�\��\��:(�[\�\�kUn��\�\�%��_�\�\��g>��,f?w\�\��\0��\0��\�f��\��\�?\��*Ջd��_���������k.ߗ\�\�߿Oֻ�6c�\�W\��\��?��\�#(\�\��\0�GC�<~5\�is9+�\������\�\ZuW�\0�^���v\"J֖�I���k?+�n�c\�!�tk��\��O>\�\�ő��\0/��.k\�E\��\�p;��\�����\�\�\��\0�*�&�}V�z\�\�\��\�\�ɴ�\�ok+��]��lh,��u�\�\�*E�����>\�\�?_J\��?���\��}*Unw}\�\'ӏ\�\�\�Z\�^\�\�]=,�\0R��o\�\�m�ӽ�\��MA&Ͼ\����N�\�j;�~\���\0=\�c����\��\��*\�r\�K\r�\�$��_�\�5t\�q\'\�յvZw��\0��>�G׿�oǅ�|�	�V�\��Y��V�3�\0ȏ\�K�>\��\0b���\01\�N�\�d�\���KVH\�I�C\"\�Ͷ�\0��\�ߏ����}{W\�Ϛ\0\�\����{��\����~\�^$�wck�\�7>,�݄?gҝ/ ���g�\0>6�7?蚖�g\�O���\0��\0�;P�\��\0A��[��:�ѷ�\'�V\�2kG{\��\�\�R\no��Wә_�{\�˯�\�~�\�9X�]\�\��\�I=x��\0>��\��\����O�S|=�w��\0\�\\\���I\�Լ�=c\��\0HҴ\�Z^�\0i}��<��?Ӿ\�\��p?�noj���\�\�\n\��VmZ\�k=C\��\�����ogq���\��~����\�}��b׷�\�\��\0gW\�-���I�@־�\�t�\�Mr����\��\0��\0h��\0=y\�kR�&�y�\�������ڍ\�۷��(\�\�ri-�o\�\���U���O�:��4\��\0<c�\0����\�xW���\�|A\���CW��\0K�\�\�?\�\�\�8���6||�P�t?\nǢx��p�zj<�\�_��{8���|I��U#ͬkڭ\�\�s\�E\�?ѽ�\0��y\r\�\�\�\�EW��\�oq�\��\0Y�\0=k�u.\�\�۽�m\�m�};\�\�~�J�\�F\�>\�\�kj_<఍n��\�-����/�\�ҹ[�_\\\r�\�3\�\"(��_��\�!���0\��>���˯�\0���	\�\nn�?玟�|\n�y6��~^��\�p_g�\��_\�y=\�ǋ�G\�o\"Y��\�}�\�X�\0�\�\�j����\\��mz\�\�Tb�\0���\�y\����\0��\0�\Z�O�jU|�_\��\�\�\��\�i�|6��\�Ƽ�\0�~�\�Rt\�/�\�\�]�_o��H\"\�\�d�\�ik���t�\�v�\�\�|)��,�\��H\�1�\0,\�_q\�_fh>8\�aE�\�f>O\��z��\�|]\�FP�\��\'�\0����[}j\�4r;l��8鞞���>W}�\�\�\�\�Q���\�F�w\�[\�\�k�\�\�]kGԑ�t\r���L\Z�]N�\�\�c�?���+\�m?\�W��v\���>M��\�ӟJ��\��\�m����<�;U\'M-?ϯ\�M\�ٴ{��\�\�Y��\����_�>�J��S\�\�?6\�s�\0-��\�\�}3\�\�\�޷���V����ma�ϟ\���~k����|�3 ��;�\0��X�_q)%�>M�\'\�Ց�\����\�\��\���\n�\�4��T\�-�\�[��E�ϗ\��\0\��\\\�V\���7�|\�\��\��\0!����&�\�o\�ʩ\�|�z�~�\�\�\����FX\�s�\0\�O��\��f�E\�JQ��\�\�~��\�{?\�l�\03\�<A\�i~L�Ml\�:}�/-��l.,\�?\�-\�\�?\�\�\�\�\�\��\�+����\�y�[\�q�_D�\��>��\�~[�\�Ě���=ƹ?�\��=4�{\�\��W\�\�*oZ�\n�\�\�7\��M�\�%���4\�\���ѨiZ~��\0v\�]\���ˇ�_Ҿ%վ\�}�������\����?\r*M\�+4\�եѵ�_�];w\�a�mۢ�]V��;\'���y\���=��\0O~�N\�x^?�\��t��\�\��\�\�N\�L��?\�kA|u\n�X���~c��֡I7k\�ض�\�[��\0�y����.\��\�\��\���\0 \�Yk���m�=\��\�L��4;�_�\�c?\'�#�皑m\�J\�]���׿\�\'ҨEH\���\��1\�\��{Ց\���g\�\��8�*�9ݻOåI�7+|����\�Ǿ,�u�\n�\���ߟ��\�\����\��5k�\��y\�����1�vx;s�\0\�\�\�w�6\�w;O���\��\�{��\0o�\�o�\�Sߺ�M�\��;c�\0�ڀ�\��\0��Z)��\�\�;�(�,���\0\�\���k\�%�\���\0*(��l�\�s�u�\r�Xn\0\�\�c#8\�\�=+\�?ښI �?u\�úmm��\�XhW8c���\�O#֊+\�\�\�1?�\��\0\�P:0\�_��O�\0N@�\�\� 	\��\0	\�q��ѷ�]��1_�^�\0�(?\�E�E�\�G���\�_\�U\�?\��o\�ک9*	� ۿ^\��5���\��?�\�/����\��\��\���nO�~C\�\�Wͱu�\0�/�4QZO\�/\�-\��\��fi\��\0ǳ\�1��T���\0�\��#\��BO\�y�\0���9\�t�?S�?\�QEgS�\��5�ľ�<c\��\�\'���\0*��ü�\�\�i<��K/9<��\��\�Ey�>\'�\'�D饷\�?�;Y�?\�!V��\0�?\�(���\��_�5:(�۞xz�5\�\�u_�\�?�P�\��_�\�gS\��\0��v�\�\��\��\0\�����\�\��{�U/�??\�$\��\0�\�_�i0���\0�u(���\��QEi�\0/?�\�5\��\� ^�\�?�[O�?\�h����/\�&/�$L�\��\0���O\�h���^��>?�v_�NKT�\�\�8�\�x�\�\��\�=(��62�7�\����\�*E�6\�\�F\���O��4Q@\�\�q���i�\0|���[\�\�6��{�\�QZC�\0��\0\�Lg�?�\�\�\0�\�\�ޯ�\��\�E�\�z/ȓ��\0\�?֕z��TQ@\�c\��Z�1-�?\�\�EaSw\�\�;�U��.�$���\�\�y�\���K\�\�\��\0[\'���m\�=袪�O\��~��=�C�]\��\�;�\0z}k\�\�ٚ6\�\�܎��_Z(�DrZ\�q�˹��%S\�\�\rx\�?7\��\��\0�P40\�O\�G\�_�}~��\�G��\�t�\��{QE\0rZ�q��|��\0-�¸K�\�/�\'\�?\�?(�G\��D\�\��r�\0\�A��IE\0T/��\���P\�/\��i��\��\0\\\��4Q@�\�3EP�\�',1),(5,'Edredón Microfibra',70.5,30.05,0,'2021-05-05',NULL,1),(6,'Cortina Cuadros',30.5,10.05,0,'2020-05-05',NULL,1),(7,'Edredón Promo',70.5,30.05,0,'2021-05-05',NULL,1),(8,'Almohada Gruesa',35.5,25.65,0,'2021-05-09',NULL,1),(9,'Cubrecama Grueso',60.5,34,0,'2021-08-09',NULL,1),(10,'Cortina Rayada',30.5,10.05,0,'2020-05-05',NULL,1),(11,'Sabana Fina',20.5,7.05,0,'2021-07-07',NULL,1),(12,'Funda Doble',25.5,10.05,0,'2022-01-09',NULL,1),(13,'Cojin Bordado',15.5,5.05,0,'2021-05-05',NULL,1),(14,'Almohada Ramola',35.5,25.65,0,'2021-05-09',NULL,1),(15,'Cubrecama XL',60.5,34,0,'2021-08-09',NULL,1),(16,'Cortina Fina',30.5,10.05,0,'2020-05-05',NULL,1),(17,'Sabana Gruesa',20.5,7.05,0,'2021-07-07',NULL,1),(18,'Cojin Redondo',10.5,5.05,0,'2022-01-09',NULL,1),(19,'Colchón de plumas',98.5,60,0,'2022-11-21',NULL,1);
/*!40000 ALTER TABLE `producto` ENABLE KEYS */;
UNLOCK TABLES;

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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reclamo`
--

LOCK TABLES `reclamo` WRITE;
/*!40000 ALTER TABLE `reclamo` DISABLE KEYS */;
/*!40000 ALTER TABLE `reclamo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stock`
--

DROP TABLE IF EXISTS `stock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stock` (
  `id_almacen` int NOT NULL,
  `id_producto` int NOT NULL,
  `cantidad` int DEFAULT NULL,
  `activo` tinyint DEFAULT NULL,
  KEY `fk_stock_almacen1_idx` (`id_almacen`),
  KEY `fk_stock_producto1_idx` (`id_producto`),
  CONSTRAINT `fk_stock_almacen1` FOREIGN KEY (`id_almacen`) REFERENCES `almacen` (`id_almacen`),
  CONSTRAINT `fk_stock_producto1` FOREIGN KEY (`id_producto`) REFERENCES `producto` (`id_producto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stock`
--

LOCK TABLES `stock` WRITE;
/*!40000 ALTER TABLE `stock` DISABLE KEYS */;
INSERT INTO `stock` VALUES (2,1,-247,1),(2,2,-35,1),(3,3,325,1),(2,4,9900,1),(3,5,-224,1),(3,6,-33,1),(2,7,261,1),(4,8,170,1),(4,9,169,1),(3,10,145,1),(2,11,-195,1),(3,12,-171,1),(2,13,-96,1),(4,14,-533,1),(4,15,-80,1),(2,16,-466,1),(3,17,-462,1),(4,18,-379,1),(2,19,-265,1);
/*!40000 ALTER TABLE `stock` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `supervisorDeAlmacen`
--

DROP TABLE IF EXISTS `supervisorDeAlmacen`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `supervisorDeAlmacen` (
  `id_usuario` int NOT NULL,
  PRIMARY KEY (`id_usuario`),
  CONSTRAINT `supervisorDeAlmacen_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `supervisorDeAlmacen`
--

LOCK TABLES `supervisorDeAlmacen` WRITE;
/*!40000 ALTER TABLE `supervisorDeAlmacen` DISABLE KEYS */;
INSERT INTO `supervisorDeAlmacen` VALUES (4),(5),(15);
/*!40000 ALTER TABLE `supervisorDeAlmacen` ENABLE KEYS */;
UNLOCK TABLES;

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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipoDeCambio`
--

LOCK TABLES `tipoDeCambio` WRITE;
/*!40000 ALTER TABLE `tipoDeCambio` DISABLE KEYS */;
INSERT INTO `tipoDeCambio` VALUES (1,2,'2022-11-21',3.9,1),(2,1,'2022-11-21',1,1),(3,3,'2022-11-21',0.53,1),(4,4,'2022-11-21',3.92,1),(5,1,'2022-11-22',1,1),(6,2,'2022-11-22',3.8358266206367473,1),(7,3,'2022-11-22',0.5351886540005352,1),(8,4,'2022-11-22',3.9277297721916735,1);
/*!40000 ALTER TABLE `tipoDeCambio` ENABLE KEYS */;
UNLOCK TABLES;

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
  `foto_de_perfil` blob,
  `activo` tinyint DEFAULT NULL,
  PRIMARY KEY (`id_usuario`),
  CONSTRAINT `usuario_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `persona` (`id_persona`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (1,'josemar27','61af2d40a529d40298efaee15a7f4f87','2018-04-20',_binary '�\��\�\0JFIF\0\0\0\0\0\0�\�\0C\0�\�\0C�\�\0\0\0\"\0�\�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0	�\�\0\0\0\0\0\0\0\0\0\0\0\0\0�\�\0\0\0\0A!\'þ\�$�`J��,d\�N\0\0\�\nL$/H����Y oC��(�X�U�\�GE��Ӆ5LL[\�P\0�\�Dɇ\�\�.W=\�!Ȇ}uZ|��\��\�\�\�<�\�W\�m�Þ\�:\�j\�r{^�\�\�=L;}��\�\�\�̛[~�\��~C\�XU|�Vо�\�~e\�yo��u>�\�U��]\�(��ٽ��0�T\�nx\0�ND\�n��R(d�\�\�,P�$J2(��2��9@\�@� &%Sq P��8Z�BN��(\�\�V$r�1�``#��\�B�����\r\�\'��d%\�\0J�+b��U\\�\"�IDc�)Pe�\�t`P\0\�$<6D�v·\��5\�1\�<�\�\��\��;�\�\�\Z\�fߏ[u�İQ��!ğl\�ҭ�\�\�\�/vJJ���-v[�^��]�#�M\"ʭ�f�j�XVѶ\�n|\�\�v>�Jx\�O\�t�έ9\�\�<�d\�\n�N�\0�s�\�1#�I8�h��Spb+c�\�r42`e�)���U ��e ڇH\�cp,?���U9k%9X\0�\�\n\\b\��2�\�I���I�T��\�q�ɵ|dU[D�%\0�\��\0\0h�\�\�rJ�8�V\0=�J�]Y�s&pD����f�\��8G�:X�9\�Lv�\�\�\�i�\�\���\�/�\�¨I5c!m!`�E[ew�i�i�\�6xu\\�ҞjguZ\�{t\�sj�1�\�\�\�#zd���*x��A�f\�!���,��o>mK�\���\�\���<\�[\�\�:\�u\n\�A7u�\n\�M3<M\�\�$b��1�Jd���\�<\n�\�DB\��P���A+(&�V\�rVx@\\�C��$:*ĥU\"���Q1��\�!\��L��`h<\nɜ�H��%\"�`$�A\00�L\�)�1~\�X*+� �СhSt�e\r\\��;�\�\��\�L��*��Nur\�)[8+��[��\�)\�QZ`Z��\�\Z^_\�U}�T���薼z�N�̯M$������,����\�+/S���~�\�A�\�4\�l����(\�4}*�x�Wd|�P/�zo��/�\�\�/6\�\�[�dAfY�$��M�Wn�!ź�Q�]�\n\�0\�dVK\�DJ2!+(¬*b��S�\�8\����g����PSVB\ng\�0��x\���(\�15SU�8�	��� `(PRn2m/n\�t/�*�%\�P(��#�ڨ�\n�S=\�\��\\U	\��&)�Yf\�*�\�4l�X\�{�R1%i\�\�\�X���tu5h�HF�Y\�s\�δ\�\�\�\�\�;B\��\�=�j�Odn\�2qlqKBO�Yz����\�2��\�j�\�m\�K}U�[K��i\n\�\�ݒ���t&-~�}\�\�I�~\�X\��[\��R\���T���5��0P)H\'+\�8@��J�O\��N\04)�A�\n~��b\�7��$� &(�šΑ���*&D�ĤP�\n!2K#q��\"BO\�\0���N/�	@?\n\�SJ`e�{�8stg(+@���f�o\�|\�T\�ѝnb��^�\'�\�|���\�լ\�ۭ�B�[e\�\�\�im\�h۽vem�\�k\�\�tj�\�H�OZ+|\�wu�\�㴚T,tK⼒R(����.w�#an�Ǯ�9]��T\'A�n[\rAp\�J\�K\�\��)���<a�Oea�W�\�~W�s�zr\�\�}�\�\�$��͓I�Qt*(9[Jt΄��0�@7�j ID�hd�At�S\�T\�8��&\�0$(�H&��Е5�n!\�U��	:b&S�t\�n)�ӈ�CpH�8(@2�\��#���¨�ap�\�\�R�\�$\��g��\�\���i�\�)�j��l�=a��\�ݾ�.���\�i-\�#��Ք\�s�q,5w�\�b�\�\�붍	vB��f�4h�g���ː��U\�|�V��d�e\'\0��j�}P\�&�,\�\�\�Q�E\\��怺GX\"\�ٰ�dj\�u�\�ܺ�\�#4U��QT\�ڻ�-/\�9\�\0ݹ�h:̴\�\']b��iW�jئL\����f���9Yx\�(\0�-<`R�D��>xH�qQ\�\�rPp��R\�W �\��95YS0\ZN�(���)���rk�\\1\n,\�-���y\\_�M\���j�I\�b+[\�\��y���\�\�4\�	KO��\0�i�%a�\Z^?IVD\��\�\�n.�\0Yj�\']\�u}�\�q�a����kn�60-�U�L7J%O�\�.sh�:��E\"��\�^\�\�]\\\�\�ൺ\�\�Lypi\�X\��\�kS�SI6��(aGua��\�Dݢ&\�\n�\"�\Z/��\�W}\Z��g\�>K\�h�b���l�lO��A R,P0I\�a\�P�\0HrJ `8\0Zp�q�Z&�H��[q�C*�¨p\���B�\�\�@\�D�r\�*$��d\�SQbɈ:�v�F�C�.��S^_�F�NT��<�\�\�RΌ\'\��O癍�\�)V4(\�5:ܩk�c^\�r6u��tC=�N\��CO����]jmlȖ\�\�\�\�\�KD���L�ح�\�\�6Ed\�\\��6ӭ_E\�!\Zeh릍�S�*՗\'.�\�\�m7X�l��,L\�_)�\�\\�\�\�^�ʭǓ5\�\��Ⱅ؋^t�6VZV\�]���>P���h\�v�w�\Z\�\�_K�Uh#I~�̢���\�\Z�\0��b\�3����xS��!��1O\�XT\�M�\�\�c\��S�@D�!&\�\"�S��t\�x\�swqPMBY9d��\�R�Ԋ��	d��5�d�_\�\�\�{\\�˺z\�(u���6N\�L4��\�\Z\�nwzuP􋅓>�\�ӨY\�מ\�ެ��f�{�\�6\�,�h\�k\�I�\�L��njAPi\�ݘ\�\�\�\�	CL�4�)\��,/\ZB0�6K\"ɤj����=���\�Du\�ɯ&KK�z\�0�\�-�q�m¹~O+d�\�\�ts�`���\�\�\��7I���\�\�͒��n1�חk�v�\�\�=\�zg/R�y�\�P��\�\"�5H\�$\'\�ᝈs��TM�\�B�w)1JXWM@3��\�8\0EX�\�7](�2�$\'\�(�\�`\nT��8\�5l1�#�XEH\���z�7-��+�\�qf��aeV��+\�kԃiϠ\��\�x��l\�\rg�ޥN\�\�f\�3�NMf\�5\"Z��i`EociFU\�\�\�B2EÄH\�<ۈ7p-*\�P\�\Z�̤�(���\�\�\��NY7P5k#ã�a�\\4p\�DY�)FS-k$�j\�Vk�V�1\�Xǩi\Z����\�̝??\0U�_,\���HQ~\�XB\�[\���]ӟC��\�2i�z?\�����\�<݄�U\n\��9 8&�l~(�\'q-@9yX講!8ʆL�\�(()��e2\�N*\� �ć�P������G�Mb,\0\�\���\�\�\�CswN�\�\��\�[(gN��zb.\����)\�D\��\�2\�3�\�^�~�y�p}Lt\�RY:ΥL�\�yd�e)1�YÆ\�:^\n�`\�u\"<��|cVQđr\�9!&�,AM��	��Lb�\�\�8�t\���\�[2Q�gi6H��m��В�50��A����r\�_��z������:^r\�d�l5#W:\�VĨ�\�պm\�u����IԨ��{6Bk\�w��\�\�\ZB�\�*��a9x�7$�lDx\��@I p�y#�C�\�P1��L�\nK�8N@8%\�Rq\"b(��)�&2f�T\�`Z\��\0�t\���L\�~\�\�W\����\��\�U֚e�R\�N���O\�M�\�{� ��\�u$͵w*��)*�ўI\�G��\�\�Wg\�\�q]�DP*PW%|UG!&L\�ʴp\�	�QWP���ud\�e�Ɓ ѣb�JH����\�\�Tb\��\�L,a%�4\�6��\�M�\�g5\�!O�V.\�T�}\r^\�\��>�\�S\�{_\\�\�X�3˧%=\�;t�ز�MQn\�f�\�<\�}	r\�+�e<wr�kܛ�\�0J Ձ\���P�������kEW�I\�&r�\'\�`�UNN0�T�+uY��3����\�\�\�R��y�sm�wy-��F�\�[\�S|	��\�\�[3�s�ק�ަMA{N�0�+�=\'\�Ǐl��%�\�p�c;A���enY\r\n2��\�;t�,\�͈��LP\�v�3�=��:\�ҭ�E%*�v��\�`\�l�W\r/]�����lL�,{W��=e��-Tdl�\'��b���\�f\��c\��>y\�y����]�\\O@\��IZd)7�\�]�/Zy\�\"�H\\��?5\�dW˩�\�Ea�A@\�!@\�\�0@	�a\�( ��q\�R9RW<\�S��Q+Nʓ�\0PF\��4!T+(��D�&bڟ,yZ\�}Ǒf鬞�r��?YϪ£X���\�mHզٳg;?\�N\�2�\�\�^R8A���\�ݢ)c�\'\"\�-2\�ْM\�/\'I�ek���dT\�(\�B�\�\"c�\�*�5kPCtkCx\�v1\�匚8\�\�:j\"դ\�B��[\�vK;�\�GK\�#0a4�\r\�\"T�\�\�\��\�[sգ�p,��Ŀ56�r���\��\�G\�y�,nd\�x\�3�Ǩ\�G��g��\�u�^�t\�L9h\�\����\��t\�Ha)�<P@D�\0uc���T\�\�\n 1^&q�T\�L�\0�1\�\���E\"�E%�D\�!A\�2q|�F{�)ge�I9{k�e\�X�\�1d�\�\�.\�~��\�m<?Q7%?��\�\�:\�c(\�e��$\�\'l������^�k(\�\�W\�hYE\�eHH\�Y\�G;3V�\�X��\�X�G4tu�%\�HNqQ��7n\�\�J��F$���lq_�$b\�=��z���,L{\�\n�#�v��\r�6\�\�\r\�M]b�`��,?�=QD\�\�E�\�7-\'O��\�\�O�i\�����\�<Ǝ�}\�\�\"=\�\�Q)T\�&�NQ\�,��Q\�$I\� �r�\�Ix\nB���\�!8:=2J@2J\�М8\�\�\�\�2�\�\0\�2�ʚ\�]��x�/�6s<^��{o0��pɮ\�M�ܫz�\�z�{[�X��\����\�7\'N�T\0\�J\�\�n\�W3\�y[lU�\��\�T�\�M7\�K�M^YT�{Ѿ�gmBm0(\Z �\�k\�i\����\"X\�H�cL�+�\�Uj�E���N2lA�\�t�\�dĔ���EuGfY\�]�D:�c	V�F\�Mĵ1P�fE&2\�m0�\�VZp`�/�2����Ľ[_?K���Qeh��f\���\�\�\�1\n&ˬ�r\�\�A��,EH\n4HH����+s<9\0P����ܒ\�\"\��5��!*	L��rؠa\�t���p��DT���\��\�2y\'^��[\�{�M\'�E\�WsK<Z�Ǧ�\�\�oH�W�\�Ր�\�<�D��Hh]\�̅\�ɣ`�_�\�L����H�(�ǆ��ˑ�\�U9hv�\�(\�\��B^��R#���Y�=-�ŞA��\�\�d�	$h\�dX�s$�!MU\�ھ\"�cw�\�\�#��n\�B��\�e`�\�#ð$��&\n\�U\'R�\�5p�;V̹\�_\�z*6%\�ls�Ċ�DKYE�\Zz�P}g�\�\�~[\�ϗ��\�\�*���L�v�1�Ē]\'\nqN�]7P9R�,�\�1A\�\�\�\�;0/&\"�NS�!�A!#)�\��+\�;�b�ID\�P;��\�OC\�Aݛ��gb�W�i�KGV\�\\m�������\'\�ɝ�Y:&\Z�\�r�,2�4�vmud�����Ĉi\�J��/\�dt�pG�����q\�\�:B<�c\'m\���\0=M\�K+Eb�ة\�kC�(�\�!`����d\�ZYp�G�\�j�NN9Z0\�\�@HY\�@@!$\���,HN��Q\�V�,�Ʃ�2��s�\Z����0�@\�\�cr\�\�i\�\�/<\�Mj�4�3�Ў�򞄨�\�\�̊�K�x\�T\���Ss*\'\��@\�\n`�2��\�#)\�\�u\�JP�+7\n�\��\� �|a�b�,\�\��Ϝ�\\?\�y\�?Ma��MΚz\��f\�r\\�\�\�7�`�\�N��#\��\r�\�j�\�1�J#$�,\�U\��\�	~xY\�\�v\�\�ά\��;\�H�*\�*��57S&�� d���\��1\�\Z=K��R\�a�FIU\�\�`��4EAi��\�Y��8\�k�׫\�\�uh�\�[r9 ��t�t�5|�W\n���;J�~\�]t�*��f�T{���\��\�4�\�:�\�\�g�\�F�t\��j��#\�<W�0���p��*�� !��L!�\�BQ\�\0Nbb$@�9DJ�I�X&C��Y��8�⁊&V!���!�ʔl\�Q2��)[����G��d\�\�j���D1ϥΤ��v]\�B\�r=$���E\�2jμf\�].\�\�w�u�\"���Ù(\�3!*��h�Hɬp\�Ʋ�\�\�u\�\�J2,\�ᖄ\���w�ڤ����eQ6�\�\�pWh\�V�\�o%��r:�[�P\�ֽn�V����\Z%G\�Q\�ܪ�D\�\n�w\na\�2\�b\����լ\���\���h�\�mj\�I\�p�zn���x\�\�x�\�ܺ&�\�}K�\0����yC��]��r(H��\�`�Hb��)T \�E;�2|\0	�pJBS���K\�z\�S:g �	YxIИ@\�L��j\�9C\�\�w����H7?�\�\�n�Kxh\���C\'=P�\�\�h���\��\�o�{\�\�UԯJ%:$Ͻ�����_0���\�\�\�̰~\�\�\�	j�X�\�\�R�\�#}m�\�\�&�>>2\�ӑ8h�Z�Rx\�\�j\�A�H�*jn\�u\�-\�ΰ6,�%Q\�]M\�F>�I���\�a\�\�4�Y*H\�X���Y�H\�\�R��D�\�fx\�\�3fT\�\Z�\����Y�\�}E\�^}��s�kgd�z�Ǿ�\�v��j����*\�V⚤b\�E�8��LD��)����t\"S��\\�9_�r\�H^3���=UO�}\�_ex�ǅ��\�y2\�\�%+�H\�\�\�Ti�\�\�Z��\\��f�\�3gqԋY*v���\�]%g \� ~�6e4�v�\�L\�\\��ʋg��A\�\�\�\�tn�]�g(�)�$;�P\�t��9K��\�\��]2��2F�\�\�\�$IV����\�SG\�]\\��\�v�1���;ǲ:Z\"���[ʫ\"\��\'d��d�EE\�\'�\�#��#J7R\"ď��V\�P\�hx\�\�L=Z\�\\\�p����]��^+R�n\�\�\�\��-�\�\"��o�\�Wo>7\�2\r6�A@\��Q!1,P0��)D^qHE\nA��Q`b\n�\�T\0\�pVL\�(^,��)��\�*R<\�\�>wx�i�h��;�\�����Zd}v8�`�\�#l�)E>\��\�!%)\�\�\rp��\�C\�-�)\�\\\�в\�\�$�#�\�c\�\�A\�Et\�&ӆ\�VF=\�\"\�d�A�d�#S_S�+�+p�$t\�8AJt9AE�F0�q]\�\�\�W\�E�\�C=KAf��\�t\�\�xC�l���{!c\�@\�%\�#\�\�UAks�zY\�^I�f��7Q?\\�����}Gwc\0ܳ\�\�|X�,\�y��U����\n\�Y4hNM�y/L�|l�[(SHE8��\�\�\��	G�\0��\�a�I\�J|�H���\0�\�\�7=\�#\Z%{¾\��{�V�HF�y\Z^�l�u�A��&��\�\�\n\�ɇ�8\�\�\���튕\��^\�N�/E��5\�\�\�\�\�	�\�(�d�̧��\��\�\����~o^4�=��\���p\��\�>m��֬�\�dk\�\�\�^�Gڣ\��\�t���r؁��U\�\�}\�\�\�NA]~��&V�	�R^�3�g\�6�\�.E�\�r�\�V\�Li%]�7*���\�\�4�}\�3\�R+6�\�\�e^5:\�\�\�B�G\0�^��Պ7b�F�m\�z�z\"j�/\�\�N�e/\��\�Zm�y�&�g�p\"�5\�V(���\�D�`e ��qM\�X�ܨ\\�Edd�q�!\r\'(������,�S��\�|���ӿå]i;�{�4\�=�\r�|�.8z\�h�h4�\�\'\�K�\��2OZ���h\�M\�՘\�k�\09)��jxu~\�Ҥ�T:�}��H�Ӊ�r��2�m�ޯ\�\�rT����˛\��癮|��\�L\�\�.\�#(O(\�k\�rMm\�\�\�u�<ԭrP\�\�\�\�ʲd\n`\�JM��+��EI���9ɷrϩ�\��&��բu\�Od.Ͱ\�\�\�v���V�W;\�;6\�\�� \�Gٖ�	]�u=��\��ڽ\n�3k�\�->V.���l�\�>r�\'�:�z���=\��V-3=\�Z�k�w�s���\�|��I\�&���p\"K\�\n�TPR���\�H\�!DL��\�\��\"��M�$!\�yB�&)�����2rh��}}�ok�\\\�!�]*9�mua�ݚX#Ph�t\�]_6\�\�\�p\�5\��=�\�l���w[ۃ\�=�s\�\��\�ѹ�k(�.�E~2}\�H!�Õ��^n\�a�h\�%\���[\� �ѐ׷x\�*�\�OGǙ�jX\�w\���\�\�<{�\�\�\���F�$�X%�m\�È���\�ڏm�i\�\�4�\�w��h�.G�kY5��ͼ\�-o�՗��\�.��Y�5ݞ�\�\�\�$.�VYڣ\�\�[\�\�\�R�i�e\�+~ːQ\�ս��ߎ�a�\�z���i\�\�c�V�f���g�|G͡\�\�\�o\�U���x\\��E\\\�!\�\�G�J`N`\�����Q)\�0��\0Us�{�S0^�U (�+p�S��$U��\�\�G���9Kl;��,\�\�[sM\�/j٧�;�˗�t��\�\�!�ݍ��\�Cm�>w=��%\n»\�뚾\�=\�R��P\�v֗:4)0��\�sU�\�U�\�^\�\r6�[K/�T��cX\�r��\�f8?�\Zj\�\�_I\��˱���ǰ<\��ޑ�\�[P�X�����z\�6��\�}Q\�/\�\�\�ȣ�z��\�ϧjnpws9\�+j�4|��zI �\�a����(�\�jbvԪ|���;z��Y�{n|\�\"Z,��x���\rG�H<m\�|\�E%\�\���\�^k׹㖹F\�\�ʵ\�p\��=R�\�\�r|QVL\�1D��+\0S�\�!\�RCA��L��<\�ɴQT\�\�!c(U\'\�r�N�D�\�eW�\Z�\'\���Ϣ\�XkS9�W}��a�\�#��h\�\�@�ux���i5\�R��>>�r]fZ\�0�QXzRt�ıt���z��}ĆN�I\�ht\�ש�\��t�5\�b$\�\�d\�i[�2�2�\��_�\�kk3h7<N�n\�l�%z\�\�\�̷\�\Z�;�\��}��M��}dW>ώ\Zo�|�~(7\��go���ɴ����E��Ӫ[:��.\�gO\�.��\�,\��\�\�8Q�\�����4M\�\�k\�1ߥS\��e�e���d��\�ͩє\�\�VvsgB+S\�\����Sz�w\�:>Y�b�(J9<��z\��Nv�\0J\�k6\�늳s���%R?8J�SQT)�8A�\0\�\0�s<*k&Ӎ\�#��\ZVMɜ$İ�B�Q��?��}\�����\���ҳqJѡX\��G�ϗ\�k\�Ώ-M\�����\�W�zq\��\�\�Vzg�\�\�#nGI�3\�y:	1��Ub����~Y�b:��\�]Je�\�\��\�^;�w5�5d�ж��\�\�Ѕ�s���;d��Q�k:\�\�ؼï>�c^ݵv\�df8~�\�R\�x�Y�=�\�}��I�֜������Rx���KI�\�#i+�5\�,�ǅ\��O�������ڎ��&�E\�3u-3\�n\'+�\�xl�J\�\�Ѵo5j���n�]�m^\�h\����iŞ\�η\��=�{_\�ĸJ�\�c˯Gu]�����ײy=]z~=\���\�+�2��\�q\� G5T�L�R�1\0Gr� x�W���L�&Hp�cD�\�V\�C��U���\�O9�9�\\eʽ\�J\�\���;�k���\�\�?IV���;uĴ\�)>{�z\�\�>�\��jn�\�\�\�Y���;uk>�w|�\nfc[�Ȩ���\�\�xұ�A�|痕�\���\�\�Vkz�o��y��w<���c$\��>2��K�4hI�\�˔y�\�� �~N\�\�o*{�{Uu_\��O�\�Q���\�n�w\�hFE\�~S��˗\�~Ը\�\��vN�m�Y��\�\'0�G��S�\�\�{�!\���-*\�2-�ߐ}\�:x/����r�7��8�\Z�1\�y\�Z�\�����X\�j6f�\�\�3\�M\�|\�X\��8+�}6V\�^��\�vWc=����\�\�\�jOy/-鎲��HL!�L��Bb T�d����@@\���\�k\�\�o`\�+*B9�`�Gb�\0�LX=\��9\�hâ�2I\�\�)m\�n\\�\0j�\�\�o��h��v�Ԡm�OWd���ɶ\�W\�o��\�\�{�ESj��>�n�ETgCN\\\n��@ܑ\Z5a\�\���m��ljj���\0<=��Ѯr�\�\�\�\�P�uhz7Ь���KX���+\��}��\�>}\�\�Mc\Z\�\�\�\��\�ٻH=S5ֳ7�Ǿ>�%\�K\�v\�V�+ޙ����H���֦��\�<m�ek\�A\��?<\�=�S�]k��\r̳\�\�ϩ;$Ba̬o\�#Hϡiɵ��Z\�\�7\rh\�#���}���\�\�Y.y\��\�7�\�\�m0\�\�\�ҽ��\�^3\�\�]���\�\�\��P��r\"�`*�QP��ƀ��$\���m^!\�\��\�\���\�2L��V$\�v�D.c�3�=i�t9>`�-/C\�x\�8�J\�y&\�&X\�\�\�ߪ�o����IQ�G\�c�c�׵�e�<\�q�Բ\��;ٴ��#]9z����>2d�R�f飨#\�ᦪm�G����\�j��\ZCצY�v5��/nT�\�_�x\�O\'\����\�\�\�\�l]p=\�\�\�6�B�)�K\�(\�/�j\Zc��\�O���\���:W0\�����v<��r\�t\�%�L\�ZMfQ��%.R79����Z�1�����%�\�Vl��:2\���\��S\�\�\'\�2�\�\�\�ު�\�_\�<�>=\�?\�o���\\=\�\��\'1Dܷ��\�FPT\�i\�1�D�\��x�!���Q%�R!F)�c\"�)\�O�\�̐s�B��g�\�=�W�\�4x=\�4FJ\�<eڝ�ʾ\n��ps�N��rW�\�/\rcK\�PI�{\��v��йh�\�-qQ2Y�\�\�eT\Z\n\�s)\n7BBqRr�8\�iP��\�\�\�\�V������K9\�i_4=uᮿ�\�=�o8�Tk�<\���J2\�֩0\�ۤ]\�Z�\�F��gz9�2�[�\�?�\�\�`e��$��5_O�ɠvX�4\�\�m\�\�\�ʱ�ģlTYI�Z^T�T.qJ�ϘH:7�\�\�\�\�\�1Ӽ}\�����<\�\�dF)�\�4䚡\�Lz\\+���\�\�o��DT�L\�\�\�\�L+r\�q*g\�\�\�xK\�+N�Q(��`L\�*\�\�\�;��$<6�xE�|aP0�R�B�j�,\0)�k\�\�<�=�\�;W̺yXTu�޾t4cW\�<\�z-�%���H��\�Ի\�Gw?Ж\�B�e&XIQ}{\��ْt�\�^\�\�B�]ڨ\�zqm�u_~�K$�Ό��\�Rkl��6h\�Lf�U\�gB3�8w\�vy��7:��TIJG�\�\�>D\�Y\��\Z\Zv)`�~z\�.�\�\�͓\�6k9�*~\����\�y��V�H\�w\�\�g/~x��\�Ƽ�f�ƋhMn\��h���\�e\�\'z\�\�Rt|\�q@,\�00�\�+�\0\�oS\�\�-\�\�=ߞ�И�я\�\�-�*�\�\�)�Ӵ^��a+m�\��n���#�\�8&py#\��LE�]5D�\�R�\'LC$`e?�Q@?+�\0E]8��If\�T\�I\��\�\�l3�\�.\�O�<寝{����o��N9�\�\��]\�㶺\�Vm��o��K}f޺l\�\�R�\�,\�J�\r�κz����)G��\�-�\�k��\�;��^��U�\�\�z�=5\�:극\�\��c{��\�yV�t�\�$�\�/=z\��]/z?\�[%\Z)��TngJ)\�KF�j\�H����R-m�+�2F�\��\��J5�<ӆVߝ\\N?<~�U��^\�i�\�\�\�\�K\��r\�c\�|NU\��l_��b}�K\�\"\�~�!�r=o�\��0?\�\�\�\�!�W�r���,\�k>��?\�\�^\�q�\�\�-R6�+�Y\�\�\�8�\�\�z�[�F\�\�+�0�/�d��p��	�\�\�D\�\n��RPA\'\Z�\"\�rj��pc��\0\����\�R\Z�E�r�3\�E%BG��4��\��PX���\Zt;C\�w#\�\�S$\�ũ\��\�w�\�M�c��m�ʲ8�K\�kv�\�&�[\�\�b���s?͒K\�UYCeo�\�\�$uً�\�\�6l�K��!�Ɩ\�#� \�\��\�\�TH\�_���i\�c��۲���撴D1\�!,7E±nM�\�\�ɝ\n,\�eQQ\�-\�h\�M/F\\\�\����\�S.�\�ͽ\n\�\��꾴%�|�-\�&w�랳)o\�\�-�L��!=�ԊЙ\�C�VSg��e��\�[�>�q�ʲS+�*dz�G��Uҳ_dٽM#:\�\�vi��:��!���(c\�A\�����JU�+W8�%��\�&\'M�\�\��\�z�\�\�U*c�\�@\�\rɨE�5\�^��\��\�\��u\�=:]F�\�+�F���_�B\�\�\�k\�VL\����z�\nM�.�;�\�S�8�\�;ag[��\�3\�\�`gyw\r\�YA\�N\�\�A3�h��Z(;U\�h�3m����Wmw#�\�2tQ�[\\:S��\�&;��\�\�ї�!c7FY_���Q=���,\�x\�\�\����\�\�\�\"a&\�sʹ���\�)�;H�hn\�y0	�\�v4vW�A5�gSW\�\�\�^\�t\�\Z\�\Zn�! �b8�Y)�x�3�f\��\�7���\�-]�\'[]��R\�+f9|�\nd\�(\0b�\�+�:@�Ȱ\�^Bc	l��!\�P*� J�K\�^(c��\�H\�`c��4�)d9,}�\�W��|�\��}��\�a\�j��r�l\��ȡd(U����Wze�/~���\\�\�2�\�I\�Z\�)F�sP�c6�+\"��r\�;NB\�\�El�\�~@�4��4=f[/-	n�\Z�u��h�~�g�\�\�k\�i��#H\Z7\�,�����M�(\��\�rKNa\�\�!Q������[h�}k\'��ons\�M�Z��u}rn\"ߚ�K4EZX(�\Z�\"���\���Ti��Xb(ع�\���3\�u����r\���P�B�O��\�4\�5���\�ٟ\�� N\�/�\�\� �(�T@\�X��\r\0����	J�p2�X�\�4U3�\'BP01��tz�NC�ĥP�ב�O-�k\�w\��u�J0\�ds�r49�bɃ$�V\�|\�A�2|\�N����h�z�M\�\�l�\\���\�1\�M6YO\�얗��y��6%\�]�\�[3��c6\��h)�\\ni�\��\����\�(٨#�J4\�\\\"͝�\�<>�ޯּg�׻\\W5^\rE�c\�V�°�\�O]+\�4��\'S�\n]�Z\���2�\�\�u诨s��LJB�vE�8䵬K\�\�_�@g��\\�u+]�\�`<D�cU�S�T\�\\]\�z\�7X�&��z\�����hiز�\�\�\�χ \�t:`%D��\'��`��10�k�/(\�\nHY>L���\�8��\"�H^0V Sa� �7G\�6��\Zϥ�\Z�*��6\�}�vk��&�\�\�\�\"\�b�\�\�\�c\�=\�\�ɢ\�\�퓑o\'^�V���\�K\�s<�ڼ�j�H�\�_�\��iM8,��t�k\\��\�j\����\�|�\�8W��\�\�\�H��D1���\������m|�w\\�>\�7�3\�ۮm;�a\nz;s,\�s_1Gik\�\�	�թ\�\�\���\0?�b�\�~�ͷIz\�\�3ru\����3\�M|�}\�\���/L�ra[6��b��\�\�\�E�jp�\'6c[�Tm\��3Tǭv_yZ�\�\'��\�\�5k�\�>A1\�\�\Z�<kL\�\�D倦LP�A\�E`��9ܫ\"w��j����Q\'m\�HSRXn:K\0��UEl\�(��.0Kyf\�Z\�/�}A\rx\�ɹj��\�f\�|�#\'��t���A\�\�~\�\�\n\�\��\0:�Ʋ�h�\�\�VQ4NY+3\�L�\�i�BE�k�ĥ}��Ҭ3��43J\�V\�!`\�G�2���N�E�\�^7\�\�n�_G\�+G�3��\�l�]g3�M�_�\�VzS\�!_z�\�\\\���S+]eJ\������XSMw^��Sd\�\�ij��\�WS9�\�\�++j\�l�sH\��p\��\�s�w(�Ak��yRFB\�@L��\\S�;�\�\�s=%9&w���\�3v������\�!��<\�)�N	Yx�tL�#�\n���T���)X���\�\\9\�]C�\� �%P\�7<\0Թ��\�S�)�9\�x�GVɮ\�\�hiʨ\�2�bT�j=\�<��\�Į[	\�9����\�|�\�F}n���U6\�\�ҧ,��$\�봏��!��Չ�4�\"�a�\�N]\�D֪H�h\�\����rn\Z\�u\�+#��J��Ź�w�*\�a\rY;�\��i�6Y(�9j\\�&\�.ا6h\�&�Uj����-,�o�Q�>�Jf3�\��n�b�\�^�p�|.�X��*C<,d�t\�nb\�\�5k4\r�\�[:3D\�J��\�~\��v.&5INUr�\�\�\��IR�����C>��%�\rư&r)AX�VQ��\�	\�\���;��	9Qat\�\�\Z�H;�Ū\�Gt�9Ż\����/=L�%,W�d���-\�w0����y\�%\r)N�\�h������Yr^�3NӼ`��-K֔)!\nְ\�tj�+ҝ��=i��\r6H\�\Z�*Q��\"���c*�\�+ͭ/�\�\�p��\�CmgT�66\�{s\�\�ϼ7ԥ\�e�\�!;\r�I��:J\�e�4�꾰�\�+\�{M�B�b�\r���g�\�T�ׇ0rD�b�%\�bQ_��|���H\ndd�K\���2\�κ�k�^��f\ng*��Q�L\�\r�K\�\ng�!��\�\�\0\�D��ú\�/=\�U@\�9AF�!�u*�\�g�b���br1dR�/u\rM�;~�\�풩+~�\��C��\�{��\�f>Lg!�\nũ\�75\�t�,�s�\����X�\��M�\�\�?\0�\�\�7Ԯ\��P^\�L<]��b�\�\�eqcxT\�-�.bae��-�\�ďvf\�X���I�H��b�\�D\�Ӷ�\rp�fԏ8�v*\�$Y$�%\�z�\�{X��A�l\��Z��\�\�N@htE����Xi\�\����g=V\�]ҡ\�+1��F����żx\�\�R+\�1�\�\n	Xp�ՑD�I��,�\��b\Z�`���\�\��b�DH1W\0氦\�\�1X�\�\�9UX�p<\\�\�s�x9�E���I\�m4�쾴W\�\�ڟ��\\�� ��)\�i���KeJ\�\�\�\�(����S/�\�L�t�Գ\�\�U\�R\�$�Mn$[7��\n\�t;r\��$�hf�&/�\�\�\�\�}�N�2\�\�U&fJ핼^&\�ΜZ\�]Sy\�	,�Q�$2\�UjE�F�r\��&�g�Db\��L�M�u3�Ӫܵ�\�oU\�\�q�j�#W{a˪A����\�\�\�\�Y\�\��\�XU	f��\�\�PQ\�iV\�n�\�=�Q�\����5\�T��0=d-�^*�J)�Bp\'`\�\r�RA1-\�&\�(b��L�\n�(p+\0D\0\�\"�*�\�!8	�BX\�KO\��&>.~�Ѻ\�#�\�t���Z*_w)v\�\�\�\�	H9\��\�\�\�\rU.uk�J\��f��v�存Y�\�\�+R:���ӓ��t\�j��\�\�6{��\r�\�\����t`\�j\�f\�0B˽o\�PV��l\�ɼ�\�g�no�-�\�2@{-׈�\�\�,9C\�hLMv}�c�c驏\'L-\�l�Qp۫�U��\�ul\�o+A��\�`��\�B-\�Mn]\�I\�\�O]am���Z�\�+ӟѥ�m�\�/ ɖ7?�\�4WJ�#�q�]*4zw\�m\�s9\�T�Ǡ\�S�(�:+�b \nc\n`�.9dOY✶B�\�)\�,Ó\�넶�P��U�1	�S)\�-;��\�\�\�\���,@E\Z�U���8\�-\�撿.!%\�VJ5\�Z\�B\�A���Z=\�\�%j\�P�����u\�?�U��\�F�s0���\�B\�76�<e�{�\�ۨ�Jy\�\�q}\�M�^�f��>\�N���\�\�\�\��fz+t�t`B�\�;j�\�\�\�\��:��O<\�Wƙ?fz77��~�칛|\�̌3\�7����\�1������.#ڗ�\�|\�{\�_We；�v�>���?q\r�mI�s�\�\�\�\�6��{3�]�Ci,�U�m#�\�z�V\�\�hն#6\�3k��̳�\�DŽA�\�\�7L�Rs���\Z/\�\�X�3\�H@�\0��d\��\"\�\�\�<�SP�SRB���	��\\��fq\r���c��C�(\�^\0LA(p$�*�[�%C\� �E�Z�V\�UoS�Y��\���\�l�_L\�j���ܠ]!�!��ڶ��\�\��J�eά�{N[!b�1OT\\\�;�\�>]�uO�>_\���tq\�\�d)��\�ퟝ��X}I�x�w��\��\r\r|K\�e6N�u\�a\���d\�\�+rCe\�oF�L\�JѴ\�\�\�\�\�}�\�v�\� ��.��~_\�7s\�/M3\'-��4\�\���\�8J=�:\�\�,�T\��[_ҳ�=jl\�\�G�����\�A���j\�+\�?Q�S��\�#!\�\�\�r(�C�9�D:\�\0��8����S�B�S�`�@�\�\�HH�\r	x��Hd\�`&�\�^R�J�X�F� �b(3\�h\�UJ\�7O>��I=�\���^A\�ע\�$�js�Ѷ�GHƵT\�}��\�T_\�\�:T\�i\�ĉ�L\�FQ�\�M�C�\�F�\0���Mm\�\�΁���:.�uW��墥\�\�W�xg�ԩҕ\�)֦\��j\������rh�2�Ѻ5�>!r�\�k.Ө�\�\0��Q)h���$�=Mq�\�gk٭�\�#&\�\�n�ƕD�\��cs�\������\�%Ty��\�b�x��H�\�� $R� \�\�\�`PVPɚ��uI{\0�T`P\Z\�\0ʦ�@#Ɉc�@U�\�\�\�\0��-] ��\"�\n�\"b��\�\�8ه7}�Є-�W\���M6\�J��T\��^�\�9��n\�.9^�F��u�<��X+ZX\�&\�N��k��t�T�\\]\�tۮӹek�\�\�\�\�Ƥ\�2�N\"0)had���_\�Q���\�ׯ*V\�Z�M~6F9h�Ne�sڼ�r�\�_*�>d׫�|��y�\�\�D\�ly���\'V�#Z�\�\��[>ymuj��\�ص����\�N\�Ub�S�?X���\�*K\�@SRAڦ2J\�ܘ�\�\�T��\n\�C����\�@C\'\�I∮�*q�V?qD�#�\�nK8\0\��\�\�Ȕȡ*�R8y1IE֏.�Ɓ\�\�n�\�m�k{��=�\�\�Y���?�V\�\�u�7GϷOi[~�.1\�acG�|5���\�.�\ru�C�!\n�&\�s\�\�U\�\�����j\��P6W)d\�\�K\���9jH\�\�j�����Q�dWew$��v��6��\�3|*w\')2:�\�g���z\�\nܶ{�~t^�k\�\�3;�Yu�՝_6],�O\'\�(���2�`\�tO�\�܋�@!��5��1��T\��`1�9Q�Ȩ���\�T�\�EP\�&r�9T~\�\�e���xC�R\�T��S�:I�����\�\�`��.��3�\�\�]L4�Չ^�vk�qiK/S��=[n�\�\Zk5{�f\�\�pϭ�hVj|\�]�QG`\��M\��\�U�\�\�%ݛ@\�\�qԚ�\�\�\�U�0L\�G\�E�F��6\Z����_t��HWE���\�YWТ\�j\�\�S}eĺ�Z�����\�z\��\����حr\��\�\�t\\�}\�\�:q0�j�*q`h�|־�\�7�\09x&t��y�qt�\0�H�AL\0\"팜R�h\�b�	�H��㙔O\�J`��B�\�/%0�\��R\�\0\0{�\�\0����΂�V*fH0\"�dnIDT�&\"ȉI\Z�\�G�\�\�i~\�b�gU�\�~ȭl\�%��V]׺D�S%����o:�%�I\�]\�U𱴑ש	]\�\�FB>Xf\"�M���4q��i\��\�6\�\�iX��ͱ\"�\�\�»\�<r�^=��ړ\�tk���M7�\�UD�\�D\�eM)rձD%B\�_��څb\�X���\�iT�CT�Y\�\�,���\��\"�u93�uR\�)`9@�dKb�ɞ�Ɂmr��Ja�S����x\�Cu��(��>�\�f$~@z\�(�$)��P�Tq%0`)��U5tPYɠ�:dpqL\0zfˊ1l\�gʽ7>�gm\r\�\�\�Ӕ�\��5���瓧w��V�\r�-��UZ�lՖ�%J�<���[�\�\�MՉ�MSFf�ˁQ�˾��*\�Awu,2{�֚N\�=T���\�)\�\�>�Ep�\�\�x�\�MU�0�\"5A\�*/]\�TV�	&�ΛW_\"���Z�Mdl\�~`܂\�\nú\�\�:���9.=?H\�<��h\�/�Ɉ\'EP\�(T@D��b�Jq	@���C\0\�MB�9$P�UCH�u\0\"j�GdT�bj���\0f%Q#�A\�3�\�%��&r\�-�E,M��\�T��NP\0]��]C\�p\�\�J�-���+@�%��f̯��z{��/A\�v�E�`�!m\�!d�\�%��]|]ok\0�s\n$\�/A\�s6�k.�\�9h�v�V� \�\����\�\�\�V�[!,\�,��\�\�*\nΝ\�\�Y`�j\�Al����Ti�JݱqnF\�F��:S��\�-��,\�ݤ(ПP��#d(��̻	�G\��\�\�v\�A\nr�\�($�%U!\�\�n1\�:��V(d�a@�u\�֧$�@�\�R�)D\�\'u��	\����\\CWp	B\0�@\�Т\"�p\0NI8S7\"Gv\�4R�*���D�qD:\�֊�����2\�A\�#\�HX�&�9��bڵK�?{\�\�ӝU\\U�\�O\�3���ڴ\�Nmx\Z%�ks4t,Qp\�9:�L6q^�\����\�\�\�#�\�v�­���z\�\"�Ģά����˭�vI\�<\�7\Z\��\rJ�����ݎ�rF֗���d��wK��\'�ۉ�[ \�fy\�\�\�<�\0R��\�y\�H\�Hp2�����\�1\0@\��\�r\"H{g\0Ð�\�\"tc�SXrpث�\0S�W|)T\�L\�h �H\��ˤ~�\�\�1u�\"j��5\�%�\�](\�L�<�e[�+\�Sf˷d�4������\"\�4f�i\�C\�-Q�\�Vgj\�ұ�· +n}&�hI~�h	��\�+Y�d\�\�5NC7F \�\�\�֎�\rlQ2\�)��\�s\r���W�g�\�b\�V�xց_ӫ\�D\�U�� b\�\�ڶ$��$:\�/�8�G67�����\�f;U]�&��z�\�v\�u�c\�E�oξ�\�jY\�\�\'(W�H!\�b*\�\�#���*�B��02�!SU;k9(%T\�\0���T�),C8�\�H���&1BU6R��91Q8�2gG\\6�\�m޴�P�B��:\n��(}G�״`\�\�U��\�B\�i0w8yծ\�[�R�\�%�\Z�9ڵ\Z8�kW���\�\�j:��c9^\�܍Nb��jăB\�\�+\�k�\�S�,f�\"x�R7oM�ٚN��\��̺M=\�	gY0�Jq����V{\Z*�G7Q�ŧ���\'��\�\�\��&8qp�w!t���N�{�ٌ�Sz_\�>��W�vÉ9��\�\�@\�Qʠ\�\0:.,Rq\�\�^�\��]�\�2#\�(�g�C\�S28\�)���Qe7pw\�Z\��0�Q0PP�<T☇T\0\�J\"E�\�k��W\�뱋Wm7l\�`/{�Z����|T��\�\\@j�ň��C_�9mf�\�\�\\L�\�bVW�n�%u��LWo�d�\�v�h\�.�t.Su�F\�\�졶�\�%mv\�4\�\�˻J�\�\�&4Y�u5�]�\�Eujض�\�	�+D�U�јǶ6N*\�\�\�=��\�\�\�NU����XjU�W��O5�\�\�l\����*\�<\�L\�\��\��!He\'\�B:D�p�^\�*\\�P�\n(���O�2D\�0*\���@\���� �e�\�\�\� (\nDL\�Fn~5\�US\Z\�9\�\�)���]�6|Χ`\�A��$\\�%�\�2\�x�\��2�\�[�D��$�0�F�%7?\�3�\\��3�s2�C��\�N©r�d�sR�+�I&�oO�\nj\�&�\��ܣ\"��\��\0?p[C�\�\�\�Y\��\�\Z��L�u�v\��Ҧr�Z\��\0:�	n{D�	/W�[�<��\�\�r\�\Zt���\Za�\�m�J�\�F\�\�s��ݾ���#A��y�\�\"�N\'hAY�����HUTTB�[�2���bB\n��9Y0�\�\�%�\�\�Z*H�[T ���LI�@�D�Jt\�\�\� �O�=I��hL��rC,/�D�d������\�I�v\r^�\�Pz�\�7�9ƛ��\0��\�\�X�x�\0�TZ��%+��\��j���=^\�P�h\�٥\�\Z�2P���ɥ@\�0�����4�\�\�\nK\�\�y��9�<����\�\�\�8jR��7�/�0葔\��k\�=S\�qq\'��\�=6:۲��t�P99�KAS=��>U\�:\�\�\��\�K>έ���H8<����߭��ԇ>o�O\�~�\�NWP@\�\0���YD\�1�Bp\�N(�Ax\�\0�a�8@$�%Bc\0((�nU��TH`*�	^�\�\�u\�\�;�q~A\�Ew7\r�UD\�\�\�8R\�\�;V�\�v\r߳q���<��X/\�>t�\��y\��0�{��\�<U��^�N��)P\�h�yy{\�/\�\�\��\�|���V����K@\�)�\�\�We\�[al�*DRa �_h�ÃY�%j�\�3)\�h�U\�՜�l���]��;QHG>�1��J\�w87%�&�il��\Z\�q,3	Ӿ\"�t�ѥ;5L\�\�gt\���&�\�\n\�9}/�\n\�\�\�2�_�ǰ\��\�C:H\"���}b��\n�ǁ$\�I��2��\' \�J@哐J&��D�\�R\�L��kR*���b\0(^3*n��BqL\�*\Z�C�!���U\�&)�l�\\0�R\�|]\�\�cJ���\�}-\�\"\�Lm\�\Zs\��Egh�>���o\����Ci\�\�Vf\�s\�\�{\"W-^|\�\�~w0|��ғ\\	��Z\��.��\�\�\�B<|��&�F��ʕ��o2\�ďj��V�2�P\�L��|¯�\�\�],\�j\�i \�f�j\�Ջ�~�I�#c�Ò֧m�>_�1\�-\��Q�e�蛿�>X�O\��?d�\�\�=�M\�9TT!\�űJSC��\�b�*�YL\��`1D�{�\�\0EI\�HUT\��\�\03\0\0\0\0!1A\" #2B$3%4C05D�\�\0\0%�Ѯzc�95\�x�=1\\���\�O}0z8\�x\�s\�\n\�\�\�1ӌ\n�\�LW�л-,��)\��x\��{�T��\���u���ڡo�i\��es\��\�Dm�Ic,v��L-\�U{=đ���\��ԶMm��\'4\�ɬ\Z\�GLb�׎�Q鎀\n5���b���\�\n�X�+\�\�t\��\�c��X�\Z5����^zg��4_\�\�L�sX鞟j\�N+\�\�\\P=1X�+<С��h��\"\�\��އ�\0�.�?St�?�M\�^~�Z�^��\�Ln>m�\��)bu�Z��\�j��\�\�;�.{Ww{co�42Y�\���\0\�.d��\�W\�4��\�Au���\�^TӵO\�m���:C\"���y �\�\��W?�W�\�מ�5�(g���E{9�\�\��秓\�(���F(\�5\�\�\�맳@\���C��\\{<Vk=	=1Y�\�B\�2\�Aj%�[uv�\��\����\�\�&����s\�\\<Mk5I\�F�\��m\�KT���]��\�ɗX\�\�Z\�\�\�hC�\0b,LD؊\�X\�\�e�\�ʑ&��j�]\�\�:��Sw�b��nj\��Y����T��\\t�^�zz�\�0q�\�pzb�y(С\�<��C\�x�+\0\�1X�\�c�\�y\��:\�\�\�zc��3F�p\�\��5�C�\�>\�\�.0<tɡ\��Q\�s\��U\�յ�\�)��ܭS\�ڄ�#\�\ZY�d�\��\0�z���\�\����	S\�P9��6\Z�\�\�M\���6�-�?J�0�\�o%�\�jb\�\�Ɲ���a;$\��G��^�7\�\�\�\��I�q�J�\'\�\�\�[��He\�\�\�naY=_\����M(��(qY�h���\�\rs^�(Q\�\�H��\�\\f��k\"��\��\�׎�z\nsC\�t\�+^\�3^+\��\�\�8\����\���\\�\�(�3Uޣe�E�|��]O[Ek�z\�G�k��\�\�ƶڂ�[H�ym�Z�	\"P\�\��\0�\�{o/}{��\�y�Kd\�\�\�$�\��o�\�/e0�L�����L�\�ve�\"��\�C,�1}q{k��ݕ�0e����⾳���\�3Y�����r�\�\rY�y&�C\�M^h�\�rp+\�z5�j5\�ڏ�\�h\Z5\�OC\�\�\�5\�sC�\���<p<\�y \�G\�\�A�Xך�sMY�\�{�9\�d\�Y\�\0\�\�{ȡ\�	4��\�j�6-��\�\�\�\�U�Yn�F�����[9�t\��7@�7�NP\�}���A.$X\�-������y\�h\�[��9#{�\�Y]7r\�\��\�t��\�$��v�<\�#�S�\����nc\�<��4ֳ\�S/�ƔEMm���}\�\�~L�B	m\�SQ.\�*m\'4sY+Ӛ���3F�P�:#���Ϯ)z\Z?\�\'4\�\�yG�tǚ8\�\r.O\n<\ZQ\�Q�hq\�\�L}s��W��9\�XW���\�<t\�O==.k�\�\����k,H\�R�B\��o.T�u�\�uE�I!��ܳ\�rF%����\�MO�A0�\�HO\�������24m�I��Ike�mKJXe\�od��0_Zȝ��\�:���M	5�� �E���\"D\�5(їLx\�i��;� v�\�&�JK\�auc�[��\�V�\�D&h����\�Y\�6ʈ�q\\W��\�z\�\�\�hq\\\�\�<m�M{\�ǳL8�\�2h�^ǌ��\�Vk<f��X�u���Q��8<ЯX�Ed�5��+�^+5\��(�8\'\�\\מ�V��C���\�\�v�\�e�~+m\�\�C����n�j;+V1i�ؗL\�-�;�qg4t\'�:��SM��)�M�1���/�wb\�c�]��cȗ\�i\"42[\�\����]�PD˙�D�w��d3\���í����\�\�q6\�s݉\�Aj-�c��h\��\0\�o<�3i\�,�l\��G4JS+l?��^+4qX\�\�+�������~�t+�9�}+\�\�y^h\��G�5\�Ni|W�\�\�z(\�g4<R\�\�\�Nwz?\�k\�z<P\�P�C\� \��^k���\�_&�\�VB\�T�\�\�h�d�4kݿ�GV�=�~\�b�\�P��\�s%\�̇}饿�J�\�\��!ٍ�P�I�{�41�\�d��\�op�6�e)-��^\�m�\�\��9�\�\�0\�\�ЋW\�]\�6���\�A(����KU�K@�\�^On\���wk��\�?*\�Ӱ���\�ZK+��C�\�\��ڦ�v�&v\�\�&�Q\�\�{�\��>|�\�y��\0xj<ѡ\�`P\��\��^�\�n\�f�h\Z\�\n\�\��1@�8�\�\�(�@b�鎞+�X�\Z�d\n\�O^:f�]b\�G�\�>E�\��,����VhSQ��MY*1��0j\�$�գ\�݂.\�%\�	�U\�om\�\�WyCZ\�\�p�i�\�-�\0��\��9�*�L���!�]\�\�\�2I,��F\�&�os�{K+5M�[\�#�]f&1	7\��p\�Z\�$�h�,5=�\�1\r\�!m=Y���^\�\��\�swm8��N\�r/�]\�ߑ�q�XI���WHo\�\�\n;�o�]�\�{\�\�\�Og5�<\�\�\��m4(\�\�x�מ���?�\�@�zx�\�L\�OK\�z\0�Ӏz\�\�H�\��5\�I�\�f��\�OB�)�\�j�\�vꚒ\�Ms�K(�F���O�JI��p���*�ٲ˰�j3Dd�Wx\�\�P�%�A\"j�\�\\Mg,t�p��x�\��\\~)x.4\�\�Y�\�e	s�\�۵\�n��X\���0� ���)	\�\r\�xT�\�-`G��U�����\�F�\���{d�Ԧ\�Cr\��{9��^K�\0�\�2�0�a͔�+���\�vw�\"\��I����$a�t�3\�z{\�f�#\�y��_�\�q�X\�\�W�$�^\�{=��\�3МP�\�f�\�p|P\��5�\��?�\�3��\�O5\�yS�Tֵ�Gc��Kv�\0�,�\�++d�\�\�\�^�e}CRjk��ߟsQj��\�\�\�j�\�g��$�o\"�\�%Siym,�n�YDR~\�eo-��\"��١�\��9m\�X䴚\�#���\�\�mÈFҫ�92�-�cS�\\Z[�\�t�\�o-�&�3�jL,�(EG���\�\�vK\�a6�6\�.�\0\�{~��\�H�n�<\�e�b��4�Y\�ܨ5\�Z\�Z\�q\�%�\�H\�\�!\�b�t�\�\�\�\�h\�C\�8秺My��Ǔ\�_U�>E�\nM{�\�=J�\�k�^���^�W�\�Ek��\�9\�\�\�\�g�\���^֢ҡ\�5y.��\�\rֱmw�)\0�\�\�ҐS鰵>� �k$u�P�YRG=�g�-�\"\�\��\�\�\��\�`X��6�\ZZ5\��r�ߓ\0޵�EyP^B\�\���\�e��Z\�\�\�.�&�\"�v�nu<����\�+~\�en�v\��Er�d�cu��[�c�e�\�M%\��2\�nghm;�\��\�)\�\'��BeHluE�\Z��e-�\�\�\�\�_Z\�)����4\�pW5��\�5\�\�8�5�\�Oq\�ⱚ5�9\�E�\�ٮGLt\�7�Eb�\0�\��\0M�\�U�\0�^O�0(xy�\0�\�E\�_\�g���\�mQ\�\'f�f6�X�L��\0b�_f=>\�\��\�$2�h`ܺn�\�\�I��\��i�����\ZhXL�=fu�g��\�MgI�\�J�e\�u^�=��W\�#x�����\�\�\�q�Wg*\�	\�\\[�n-`{M\�o%��\�\�<`�O\�l�h~\�Or\�\�@�ۖr,�\�n�\�\�%is�}{,1@\�W�\���4\�$�\�f�W\�5+C���\��!��`�\�+\�s\\\��?ϼ�\rX �>W&��\�b��\�sY�5ɯg��u>\Z�\�G�\�<��\�r:r(Q�^�x�\�c��<�\���\�$\�\�~K�-��Ӫi�3����\0\�i,���ӗr\�\�\"�\�K�?d��c\�5��iZ��cB�\�\�\�-e�QZ�\�?7PjW�!6\Z,�\��\�EMgۖKI�vF�Vʡݞ61\�\�<\nĎ�\0�-\�g�僳H\�Ij�\"\�8�l��ܻ�߸\�[�\�\�\�\�[l[�$�b��ɗf��\�z���\�{�2\�\��D���G\�\�%�J��\� ����$�\�$/{i-4,\Z\�ntO�\\��\�m��e��\�\�z�^������\\W�6ТGOm^k W�\�k5u5��\�5溺t�sX�u\�AY\�q\�V\�P\�>I�s��\�%��J�\�H��\�FԳ\�(�\���\��a\�\�ޓ^\�\�Z\�JjZ�%�MX\�\��\�5)\\�r߱\�O(D9�\���Ȓi\��\�\�\�\�-���k[��Ժw\�\�gn\�6��\�a���s,\�\��k{[\�\��\rܹ��Զة\�B�\�l��\�\�\�\�2Mm�t\�\"!�\�3[�\�\�\�M\�V$oxf\�,vQ^�-��m�6,[O�-�Ӣ\�mh�e�\�1��\�mV\�Z_s�\�砬�C�\�\Znh׊�G����V1F��\�\�\�+�9\�kߊ>y���\�W�=b���q\"¿&�K\�P�1�\�]��`^\�\ZN\�\��vۭl����\rO�X#\�?\�\�ᅳ�T���V�\�\�+��H���Ů?E�mV�\\�2T��;ջgKR�h�\\Y��lP�[����\��Nc�\�qْ#�\�-\�6����\n��Y�{7�0\�\�\�\�kZs\�w�ݹ�\�rm[V��ky�͌PZa��ܲX2\�i\�I-��V�:X.d�auQY\��\�̺��p\\kd[\�\�WX\�\�\�\�MZ�՛k�G6է^\�\�R\���:��R\r��z\n\��hW�\�\�湠y&��u��<\n�o\�4z�\�x\�(\�9\�3�G�hdu�Y��:��o�è\�W�\0 �k��\��\�}g����=&%Hl���\0Ұ��^D�M.�-��{�U�\�E\�\�֣-��\n ��%[XQBZT�\�(�T�bQ�\r.B˥<dY.\�\�r?oz�\��_�L��\�m\"�\� ��\�h\�K|Q�\�\�X�;��\�dcL��{0\�5���lEg�\�\��[\���KUޘ;rXmV\��I!�������ot�!i\�{��0�/\�\�4���歼wNͺK\�\�xb\"\�\�\�Y�Z\�G5isgwE%\�d�Ym��\�{b�q�Z�C\\��y� s\�\��ו\�W��\�5�\�Q\��(\�CY\�@3^F:-/C\�\'��_�Nѭk��=��j\Z��\�\�\�5��Qp�\0�0Z�\�\�\�r��Gm�$�1\�$\�2JR\�}��\0�v\�wP\�\�\Z\�Nj�K/I�\�X��ܚXA�iV�.{%E�@�\���\�⦴X\�̓�Ƅ[\��$EA*+~\�ve\�w\0\�U��\��\�\�kvЖh\�wj\�˽�Kx�禳\�2ҁ��3���+ ���W6�_�I \�i��mH3_�$u�v��\r\���\�\�\�I-�\�_��os&�.�y�D^\�)\"�\n�X\�\rM��y\�\�ix\�zh�\�q\�c�\�4ǚ�^z�\�t��鞞z浍Z-*\�Qw�\\�lZ|w7Wwe�PU�\�\�3me�R\�Ai#��km�+k\Z�w%��#Ҥ�O۶���l�ʣ\�\�a-\�5�\n\�8I��B����R#V�N\���\"\��\�R�\�\�	¢\�/F1R.h&���\\��.B�V�>\�kx�8\��\�b\\�Y��\n��=�q}�֩�Y\�ԣc-УxPZ_ٳZ9j��)K\�a-�\�\�`��͔�\�-\�6�.\�M�6\�iK\"�����A��F�P\�1��<x�\�=r+5��r}c��\Z\�c�C\\ך\��s^(dV1@t=|V�}oam}�\�j\�ww\�\�$s�z��QQ3\�f�I0���[�5KS+j[\��U��H\�\�R\�\�L�(�\�gi�%���)\�\�v��ܦ9wx�ԇ��QWk*��G�9\�\�tR�\Z# &�Jd\�2\�g5\�q�����_\�sLI��\0$��I�?z*@8b\�\ZI��m�%x���H�h�5^\�GnY,����KRL\r$B\��)��\�{�\��\�V)�Z躌�mܫ�s\�\��\�\Z]\����c���_\0\�\�\�\ZS\��\"��\�+�F���Y48\�(W�s�[H�ɯ\rx�\�|�g\�≬��5\�\Z���\�-w]�׮�a��\�\�\�D�cWvYjt\�rw�\�j\� h\"�j\�t�]�\�\�Y�t!l\�jdhm�Q&k�e�?\r+����pH����l\�\�\���\0�?\�*�k��\�k�+�v�h\�\�\�+a\�\�%\�;1J�#p����F�0\0�AZ\�\�\�7լio,6\�g�\�m܈�@�A�\�g��i����\�6���\��h. �\�hNt�GJ����s[�ިy\�vת\'5���\�\�OL}z�ϣE��\�9�:�:�\�\"�8��\�Mw-���j�ɩJ\�\�\Z\�/Zu�\�H�\�p�@*Oȹhl�\��h%m\'Er�:ZB�\��\� 	��\�\�)[\�\"`�`0]���A+R���\�\�\�-�LN\�8�G�v\�Y�S\�Rk\��\�y�QX\�LKJ\��\0,�Mئl�[�	\�\r���S&\�&p�$ѩE�u\�!nk	��m	�FCh�\�f\�d�\����=mn$��\�lOcz�k�\�gA�:�ŋ�m223��+\��^�CǯT8�^+�ӎ���GC\��Ϛ�\�c��\�ȯ4\�Q�\rj\"\�I���kʸ��\�V6\�Ō2\�ok�K3^,Y\�1����m#C�֝b��1*\�\�Q�41o\�*\�ro*\0�+k`-m$�9�Z	_\�\�\�Em\\�\��ԑ届z�T��\�8\�V\�y�2^\�2\�Y5�ԇ�wPn\�Q9��#\�%�\0�ڎf��\�V�wCY᧷�\�\�:{�+)\��\�[��Z�H\�\�E�S��\�\Z��\�\'{{\�,1n:qC��hW���I8\�\0:c��\�\0(\�hs\�\���z�����\ry��\�4\�W\�)i��\rB\�Q��\�\�LdġkO�\�����Mݖ\��\�J��\�ceA\n�p��\�\�E|Rʦ�]�HJ�)HJ\�\r�@�X`\0i�	Ė\�B!�(Z\�aG\����\0�\�J�;�\�\�����8�r\n���\\Ա�gU\�)(v>#\0\�\��R5\�r\Z>W\"Y\� lL���h�\�;c}.e)�ܱx�).5�6M&��;�+\�>�\�_�;om�����!\�\�f������Eg�\�=Vs\���@���\�\�_^k�DVy<t�==b��\�S�\�\�ښEoi\�z��*>�\�\�\'e�v���ҙVJKg�ee%֙n���e#\Zs3Y3� \�})��A���.\�\�,�\�\�\�F�k�h2\�\0P8��C&�I��N�����p2�	\�(�\�1EMc4�me\�`\ntZx�Q��\0\�J\�\�&)\��\�\�\�#u6\�Gp\�+��v\�\�4z��ؑn\Z�]�\�ia}+\��f�O\�$��I߂\�\�>�W:~�\�MsY�g��\�\�k߿C\�y�0hb���q\\׊\�+\"�\n�o>�r1^�\\\��⹬׽F\�;;]FY/\�\�m٨\"\�[�\nG\�A$�_\�{u�Z\�\"���\�6i�$+y�M��pʒn]��\�G�r7#�`���4;\�\�\�e\"�0vjq\"Wq\�e��4Lm�j\�k���\0��v�\�Vŭ�\�|cul�\rۈ�\�0lf��\rR&\� \�EsX��u��p\�6T���E)��3ZΞ�P\�\���47�\�x.�kk�Muw�\�\�$�����f�\��~�{*\�\�p^���^k�Of�ѯ=ph������x�Y\"�\�f�׎�Sѱ��Lo\�\�\�<�b\�\��8#O�\�Q\��%ey\�+xa]CQI�\�\�{:lp�\�u\r\�3a�57ܬK%n�G\Z\n\��\�\nH\�V\�\"����\���Ie�!*��VӅx⸢>�\�@�T\�ɑ\�r�$\�\�\�QZ�]iQEm�˦h\�iՍ;��\����\n\�n�u!\�S�N)\�\n��3_\'ҷTWR\�\��G�c\�eI#��\�f\�_��#��|5�\��g\�3X#�zy>�끊>H\�\�\�\\u�\�M{\�OB�=3�\���i�\�:�b1g�Rԋثh#j�\Zm�..��z�e�U�{%�m�\\>\�Q{���\�E4��\�\�(�\�sdհV5fp1\Z�\�f��k��l�Ƕ\�1K`�@�\��k��\��D��B[E/sL\�/4\�\�;�\�\�<��wf�*P\�\�1G���V�\�}*\��_Ua� \�>\�ii��DP\�ۋ���\�\��Cv�<2E,6\�/kr��\��\��6��f���6\�:�\�5\�ɮi�{j\�@h\Z\�z{\�Lt��d�����<t\�:y�I�re�?�j��\�gbۨ�\�\�@�[Tx)2jk�T&\r��\�ݭah$��e+.�\�>\�ĳJ�p�BI�q[Y6(2ciShZ)G*�h�\�p+{�1��\ZU\�2��b��kע��<ga\�l\�\�rv\�\�G+\Z2`6֦S�낀�\0Ȥ��\�\�c\�&ԩ�\�We:�Ҝ\�\�\���\�h/���\�l�\�\�k�auے\���\����5K;k�\�\n;s�ա�@V+��k��C�=\�\�\"�\�\�\�\�{⇚\�LУ\�z��\��#\�2�]Qcu}3s\Z5Z�Ս����k�c���7S[\�մ3�Z�q:iB5/ѐ1��i��~\�\��=BF�YP�<j)P0E9?\�d�ď}lU�m�\n\�ƶm�\�\';@P\�T�+e�m7�f\�Fw�\�Ex+��;�Y��SE\r*l��;	�\�uy#*�:\�i�7[�ڲ�*\�7\��B�V�R�ι��i�^X�R�-n\�5\�\�{/��.r�|V\��\�0ɂ�ȴ@��P�^i���\0��\�\\\n\�>\0�|�\�qDW8\�^z��\�Aӎ�k\�\�.�(�&�۹N˦&K�5)�5++)o�f�y�Y��.:|PF2�Y\�wS\�x\�%�H\���2_\0V8LP�\�)�d/x��\Z�\�JY_�ȣ��jFwnHߊ\�-eZ�V�)�\�\��\�\��\��\�pC&(\�h\n)�ܧN~�\�\n6\��8+\\�`R�\�*s(&���T�d\�ꖂ\�5[̎$�����\�Ă{\�\\֟:Iq����\�+\�q^(��^�\�P8��\0#\"�\�41^��G_4(x\�\��\�9sG��\�+\�X�\�Vۢ˹���\�V6{Z׹qF\��\"���rCg+mgTG5n���u�\�O\�\�1\�Z�6yA�*%���ᝥSp\r�f�BS\"5�\�#Ƒ�F�Qs\\w\�#\�\�Un\�ވư\�톮\�  ��F\0\�ۀvn[q���F��K\ZGgSV\�\�\�֥�m�p\n\�\�\�/�>\�]F\�7\�>ң\�\Z�W1�MM1W�z\�ګP���Z���%d�j\�\�P�;O4hV8�ɢ+\�\r\�x��}\Z\�\0p|�X\�^�x\�\�\�s@�==W�Lq_��j]֑bx\�e6rdM{-\�f��sb+K0\�\�\�fx;]\�\�P��S���\�Fr�\0hr\� *8�b�\0I\Z0\�+�\Z�2]��]�J\��|�\�\�\�A(\'\�[>\�eT\�\0�B\�\nƫ\\��T\�\�\�ĩH�l*�;�� ��l#��\n��\�ڢ�F\�9$\n1�\�ۧP���\�T\�b\�L��4d\��\�+�\Z��[\\#\�֒w`�Eso��Gy�@Կ:\�3Y�)y��^:�4k\�\r\��\�Ѯ2|׊4:\Z\���Y\�5�2\�\���y���.Z%�$z�����C;���`\�\�a�cy\�\�\�-\�Jp\"\�\\\�U\�#R���n�\�S\�}��N)1�\�X���nIK�h�\�&���\�\�Af�DT`o)�9P�\�\�5�l�&\�\�A�ds�a\\\Z�FNv�\�-��N\�ቭ��5\"\�ɭ���&_�`���\"~�봚�\�\���%�\�m]\�;O�)Y�ɤ�Lڒ\�|R\�Hx5硥�3ɯu\�8�s\�\n\�B�Ls�\�\�4x�\�x�恮+\�t�E(�:}jg���N����[0�R.\�[;N=ˆ�&���wb,`��\�\"W\�\�گ5o>)J\�ۂ�	\'��\�@\��\0d��\"8\��\�p�5\�٪Bwn�.0��P[_ڈW;\�bS\�\��\0�}��$�	� ���\�0\�.[\�ʊo��`\�_3b�M�Ud�\�+��S\"�\�L�4E��A!d���L�/m���+�Z��n?\"=Nͭn�$�\0�h��1�@\�;�VW\"h�k\�O?\�VFN�\�z^E/�Y�F��c4|��\0�>i�9���X5�\�%��\�5֡|��7MIrH�\�G\�#����\�1L�`��i�-ܯu-[�2�bK(Ri\�n�k`@ai*�\nʦ\��_\�\�*°e=\�]\�lG0\�d&�I\Z����-+p\�3\�V��6\ZȢI�gv߱]�b\�c�����T�5�T�\n��\�p\�\n���wV�<aс�dxR�E,m�.\"ޭ����F��9�\�̕~��7j6\�s�v����Y\�۞\�\�\�_Y��\�T\�n����\�8\�8\�h\��X=GOC\�\�h������\"��\�OU�:��\��y\�	��Kzv�v�-��㖦i㶇�MJ\�s\�6�n�\':}�\�8�\�o^U���\'�[���@\�g˶Ѷ\�;qS\\v#��\�/\0Mc��Y\���\�2\Z5�\��r��E\"\r�%���aaF6��B\�R��\'k0¹\�Ͷ�\�{�\�\�E!��Uq��$��l%)�S�\��c+\�gR$5*\n�v�\�\�\�\r���\0h\�3?-7m^\�\�dF�hƵn\�\�\�\�\'nI���z�\�=�\�n?�پ�k�\���x�^\�\�+\���ᎄ\�L䑊9�DQ\�\Z_�1\�\�S�+��v-\�܅�.eKo\�\�����F-|����=��\�\�)�\�/���k�\�m\�\�C��\0x\�I�\\\��굇\��]�8v_�P+Jh��R�n	\�\�\r�v��z�\�{\�bQ\�\�\�\�v�1@��4h�\�v\�\�0.\�Wl\�!�\�\�MO\��e�&墣T/4�4�4�E(8 \�I}yJ�@�V��Ub\���p�\�W)%��	sCsc\�\�\"�M	$7���ա�;iD�yk��\�@zc�G�4+\�O]<����o�:(\�뎘\�V\n>w~m\�*Z�rѥ���{.\�\��Οmm\�\�:�\��k��\�C�5�߸\�5\n\���\0\�@9P��]\�\����\�\��\0LH|s�ș��	��w%5\����ˁ<�?帥�~J\��8�\�ў&�\�5�ε���-\�8y2aZv\��\��	$\�;H�0\�-!��\���ь�T}vaI�\�\�\�sT���@j\�\�%�\�n\\\Z\�L^?\�;�\�\�f\'�]\�?nY,.^\�\�\�]\�cTyd�\��㷨��y��\�\�z>y�\�4Eq�\�(sY�\�8\�\�3Y�=9ǲEq\\u\�@݇k\�\�w�\\Ć\��3\�5+\�nm��)�o&�����jW!e���Cmo�KF)Z�w\r\�Pn�\nc\�I!h\�\�\�\�Rc���}�\n�l�\�\�\��$2\�ӕZ(In�C�\��,6\�q\\g�U�[�\��\�b����r�\�\���\\\�Bˆ\�y�P\�\�U\�,p\�˾�c��6Z�\��|2�Y$9�(�\�Դ�S�Avr�ǫ)\�:~����kV\�^\�z-\��v�}!$ѥ�\�q\�4z\�\�`���\�\�5\�$�\���ӁG��\�y�\�Р�\Z�\�\�\�\�\�Ԯ{�\�*�m`\�\�5\�\�G�\�y��G�\�\�\"D\"M6\�\�^j(\�w-����`2@�\0Z\�T��T\�r~�3��\n\0\nH�\�\�`�`g��J��\ZUM\�\�\�\\T҅W+��]\�\�\\\�\�J\r�\�ڐ\��\��\�\�\�!c�8�\ne\�ڮ�A;i�^�X❋\�8|�\�8z�$?	9޳\�)\�R,�+.\0G��\�S\�!k��\�k;�\��ۂ\�e- �\�j�A}�\�ֲM5\�\�M����B(gq\'��<���\���\n=<�\�Es\�g\n>c~\"�w\��Ӹ\�t���H;sDӝ\�u\�\�o&\�6���#\�%r��e�!�H\�s�m\�\n�O�\0\�\ZEG4��]B�O�\�\�0���]�V9R\���\n_8ʨ\0n_2>\�\�h\�ʩ\��\�fY�\�G\�\��)w-ʓ�^�ү�L��c\�\�\�\�njM\�#\�rV�m�6\��\0\�\�q\�i82\�5я	�$\�#j\�%I�PL.�\�$�;�-�\Z\�ӮSX�\�\�\�q\�\r^\�\�z\�w�1^\�f�k#�\�EX\��\�-g�h\�W\���N���VQm�&Լ��Y�\�\�b�N\�4�Y��\0b33+\"���\r�l\0R�\�!�g���2v�\�m$�D�|H2R?�\�T\�\�k�jM��\�\�+��p�7\�\��ԩ\�.\�G,p\�ڸ���]\�Wu>p�JH�\��\����S�-�1�\�\�|�2-J2_�s��\�\�S\�#z�\0��\�D\r�J�[�}�-�7+s�*\�#>dKW��Mk�n\�\�y-d���\�ъ\�׸#�\�Cɬ��К\�x�C���\�y�W�\��x\�#���Vhf�E{��\rkD4z����%ip�)�i�\r.\�C�	O�KHc���\��\�\�!A�\�<\�\�R>I����\�(�n\n\�\�ܘ\�\�@Z�,s�\0-٣&\ZF\rIH\�\�D͚�ȭ��CC�5\�H1\�69V�̈�6\�2�_\�\�{��P\�\�ة��\ZLo\"���`�\rˮ�龬X1^\0o럗�e�\�\�%�]q���Q\�\�\�\�R���Z�V�\�Oi<�\�6�l\�C�ZD{r!G^A�\�\�z>(Q��|\�z���\�\�\�C9\�8\�\�y�\0B\��Pj�M�\�;ZGv����\�K�.��Okew�M6\�dq�I���G�\�!��b���\�cZ���3QdP�;qJ۩�0�;���1�x&f\�6\�<Ӷk�9�T��\Z),`:5v\�\�\\�O�h��U�7\�ي�n4Ig�\0����b]�;;dY�\�/\�*w��s[v\���L\�6̀R�(�\�dHة�\�\�b��21Z0n�\�\"\�}MͲ\�QM�F��G��\�6:��.�\�\�\�}l\�C �SC�h�Sm�=�鎀׺\�z:g�\�Nk\���\�\�0i���\"�[�.��G��\�7iP�l�\�[���-w,a\�\�\��Kv�m�����4��w�\�Fz�\0T\ns��ܢ=���d�\�-��W�S��\�!#U\���x�\�Q���\�P5;\�R\�\"7u\�H3Yu=\�S<@\�]�(�J���\��q�\0�`��\\T�>\�Ea\'4\�-m\���\�o��\�-�٢v�dz��QlHͽdZ61;\�ꛈ\�.Vib�kq{�\�n\�\�\�`\�*�O����N�����yi�a��5\�8�^�s^9�\��\�k����>k\�_<W=O��p� ��\�io�J�C5\�lf��MKI����\�\��^�}4\�D�Kp\'�\�\�¿\�6\�\�\�߱a�l���qA�\�\�\�\�F\�(V��\�A\�Bɽ�\�e汓\�c���$Dn�#*$�1\�b�Y$��H��\���G1)�p�n�������\�C[Yʶ\��2\�F�1\�=\�P�\0Kɜ\�\�]��|�f\��ʚ\�$�\�^\�Q�\0\�s+�mq�VLR\�c)��\�[���\�F�C\�]�bkAq\�(H.)d��\�\�m#Z\�o*r��?��ȯ�P\�c\�^\�L�=_|\�k==:\�L�G\�7.�\�b�\�ҡ0\���\�PKc�\�I\�\�I�n�;D{�\�\�\�~\���؟\�)\�w(��\�\�+�i�#���\\\�o�z��e)5O����¥5tܷ\�1\�T���\�#aq�-��j�����\�FVym\�\�w�Wy�K�?�� \�7\�%�w#\�\�G\�i7\�q�*;\���ј�yA�����C�S\�I\n����2\�\�G�D{z��FlS��y)�n#\��\0\"LWl\�ےyW\Z��ǧb\��\02�^\�Ά�\�K�1q9����:b�׺�^kء�\�\�\�5��\��b�\�1�\�E�8�B�\0a {w��&h�\�\�\�m�� �\�\�X��iczkp�\�\�\�ojQ\�n�\�+\�8F�\�\�\�5b(\�\��R���\�sq$:�.�c��\��\�3N��\�\�ˮ#?\"M\�\�O\r/ˡaȒj��\�KKɷ\��}:�\�*���\�)?\�U�\��\'|c\����f�\�Ax\�\n�\0��\�\�aI1Y���|\�\\\�\�a�W\�v���>�@�N�(|�\�s\�Q�>����\��̬��o�Slǩ\�6z崂\�\�	$�M�n#\"9-\�lhr*\�J>��O�^u1�n.�7�d�\�me�h��\0m\�ž��*Kg��N��}\�[z��:�\�A\��@\�W���\�(\�\�\�\�c���W���k\�?r��ţZw�+�dk��ȸ֧���`�lWlz�ɂ\�˄�6���\��	H(6\ne\�X(�\�\�k|���YZ��\�\�\�L���&�\�K�v\�\�f�P��D���)�?����Aa��T�\�^�ik%�\�!h���q3˿�K\"g_���\�\��s=�r<qlf�c\�.��Dq�\�\ZX{\�A�\�\�\�\�\�H幼\��\�V{\�\�\�\�\r\��\�ܷI\�\�Ě�\�:̔�\�Tk\�[\���\0\"���/�O$��Z^-\�\�\��j\��\�\�\�R;�\��r�\Z&���w-m/[qW�j\�({\�H$kM\�\�e�\�\�\\���Ů\�\�.%+w��\�\��\0#�\�`\��測�ꚏ�5��3ԜQ�7\�\�o\�ҴJZ�\�}\�\�k��ז��\�!��漸�\�g �ʾ֎CL���\�8�]R\�+�\0+\�\�_�io_�2\�3꿉R|�\'\��[�-\�S\�h(\�E%)�z�\�Kj�H\��O�\��\�?��\0\�dԿGt�kh�Ho���>�-%��\���_��{܁;\\E-ɿ�i%�	��$Ҙ%G+ �vZ�A%\�[jg�\�\�RQN�\0c��$m�Y\�\�c~S��G\�\\4��k\�e����Zy\�\�b���S�j\�mRhM\�f)�\�\�\�Gn\�i��\�x��\����sm���WO�ܽ[�����\0P4�|�A��\�t\�]\n��*�:\Z�9]wtm�\�eY+I�\��\�A5\�\\����[鶓[L�\"�E\�zx�Gσ^\��G\�Ox\�\�O+\�\0׊\�z\�h\�:�lo�k&�{I\�]\n\�\�( ��\0n�heiX4�\�#�ͦBF��\�b\�\�n�Q��s?\�v�j�k��׷z����\�oo%\�i�\0\�\�M�\�Φj/Ӎ:��_��/þ5>��FC\�)>?�-K�\��\�\�~6�)WC\�\�\�V�����]?O\�\Z\�a�\0�D��E�%\rE�\�5x�\�kkA�\�\�V6�\\�7�0�1�����3���\�\�$��\0�Tm�r+RY1$�8�\�꧙.j\�Dr|6\�\�ȾkS��\�j�4�X�3򛒿\�R�����B�\�\���I��n�b�\�\�v?��[\�z1/�{�?��8\�o�\�pԶz��.�{kI��\�\���^�a�F�|\�L��E\�uHYͭ�V�l�sh���ϨGo��\�咻@6��l�1\�\�G�{lQ�Duz\��鞙�U\�I>˫�iڲ��\�S\�;s$v\�\�`��pIؑ\'V�\�ߒ|�-$].���\"&���\�=֧s-\�\�\��6��\Z�\�b3Z\�U\�\�0=��(C{.^�}D�y�/WVwr-�71��^\�Z�:\��^���|N;S&�а\�Oc\"	�\��˪������\�\�ΘG\�5GѾ_6�O�B�k�%�ȴWH��\��AVL	B�\'zz�&j�f\\jz��j��\05\�\�[��\�\Z��[\�CY\�o*=P���=b)l�F�\"��x\��\�~�(�>=#\�b҄@\�!cn�?��֧��D�\\B��\��so��F\�`�ͤiW��|\0v\�\�\'���,j\���\�Iyv\��EZr����\�i�=��\��i&U\�ɬ\�\�k\�:s�z��C=8��<�\�\�9�co\�L\�7��\�r\�IK��\�u�\��-�O\�Y.5��ty?!�z=��[�4��K�m�\�c��O���W\�[W����Y/\Z�\'�\�\�$�tgj��Tq�1A���+Q\�k�ޒ\�gF鞝��\�7��S\�q�M�\�\�\�ܔV�4;�\�~�Յ�֟sr�5�ïj����|��迭-����MB;�֍bٯ?[�S%O���K�\�5�w\�WZ�\�\�n�9{t-\�K\�5�e�]:�x��K����b�\�t\�\�t�\�G���\�\"�6\�Z\�i�UlP���:�X�-!�o\��H\��\�\�Y�R�3H�\"��qʴ�K���NwW轰�翨P\�1�I,�KOϴ��^mp�ѷi7-g��Y�\�^\��ѯ\�8�\0�Q\��5\�?�t�X\�-^dGg�\�\��۽{sz}��0�����)e�ݖ���$�Z�ҭ��]F�\�\�?mڅю)$�],�\�\�Ƈ�\�Rw|�ܤ\�D\�`\����܁ol��J\�\�(L1�$RެfMZ\�U~Aa�>Ob�/\���#|�����Oz�\��F\��+���	\�w\�֚�:v�qa>�k�e!�Z8�Y���g%\���\�e\�&�O�|H\�,v1C\Zڦ?(�\�*P�\�Lw\�iu\�C�۱�\�\�X\�\�K{��\"2��ۻ_�o_�h\�a\��Ţ���Ql.\'/��p\�s�i��_vo�s��\�;KP\\\�(��k��.�{\\ �e�s�ŖM+J�\�+�\�=2kʊ\�S^zz\�N\rs@f�W�\�+=<t\�!H�.m\�T���\�\r�B��!��\�;\�iŝ��3�T\�:\����k״�\�4\�\�+ؙ�/u\��y \�2ΑT�\�_��#�\r�Gn�BB��F�v\��U\�.5���D��?���v�ݽ>���ц�Ѣ&]�z���\�g\�iq\��deqR#\��\0;\�ž�g��EfW��\�D\�٪�\�J�6�G,w\�nu\rZ\�\r�+)6�4\�*{��s�ZBN��]4:N�uQ�n\�|Ct��E\�Yt[��K}B#��[��ɮ�6��J�Dû�\�v\�F\��6\�WQ�+����\�kN����\�b�\"B{l�[�U6j?3b��oْ\�\��&�\���\0�U\�\�XW��ٯNph�\�z�^��s��f�\�-^(u5\�\�\�(}V�%��\��ft�VG�\�\�91\�)\�.Ǔ�\0�����\�tm\�\�\�of�I\�Pi�WV�\�m�u�\0���xI�H\�V�԰�&=�mv����:w��t�zӭ�w�,��bִ|�\��Ȍ�\0$ҞA�\�r��g�x��,\�Qn�[�D�e����.P�\�\�/�Y\�#��\�.���iЭ�\�m^�����>=aZ�\�4��Q\�_Mx��į�\�\�\�\�*\�\�yv@����\�\�m\�m>\�7�X�H\�5= ��M�Eys�\�5V\�Y\�%[�\�C��RE�/��\Z\�\\R9u�j.�&�hL�%����uyڵo�\�\"M2�\0\�L+�v{ko�|\�-\"\�Vy�Kl\�=���.~\',\�6�\���n��Y\�k\�q\\��W�\�Q��^k�硣\���X�\�Ь�֤U\�wQ}�A\Z\�\�c�[�q��\�\�\��X\��\�\\�2jW\�y>��\�p\����C\�\�o��0i>Eumܾ0�-�JR�i�m%\�\�s|5�\�5�����WV\�\�%�\�r\�\�\�n\�/	�[Ԧ�v��\��/\�,\�U�\�\ZPZ\�\�i	��/\�z�\�;\�\�\�	:^\�ݿ\����\'F�,6V����4@�F\�~Eg��V��\� �\0\�B@2G�yl6\�pJ�o���ֿ\�|\�\�\'\�\��\�z��OSc�\�Pj����+\���\�wA�;�[i!m\'Up]\�Ţ�\�P.\�#\�\\\�\���\���\0T��/\�\�д���3\�b�\�R\��qn\�^}Q\�\�\�\�H��\�a\�|Hz`\��\�\�⼌�f�\�\ZÌ\�\�Ѭ\��K�Y�^ϟX\��CDa��\��\�ycX��U��{\�\�\�U�����{�Ѵ�\�oiۭ�\�\�\�nݯ\���O\�\����E��d�lT�?���;��}�����-�\�[&��\�׺�֧fV\�4\�־=�\�|�W�F�n��m��V\�\�H\�wD\�-5M#V�;Y�&���\�\�o����4��T1�Z�\�Y\��K֗M\�\�\�\\|6\�}An�Z�l�M|�?�u�E\�¦\��\�E؊9$h�\�f/g+y,\�\�\�m7\�\�#�\Zb\��\0�$w_\"�*����+Y\Z\�ZN\�Iq/\�\'u���Z\�T���\rUXZ\�z�\r\�V��E?mŶ�s�\�*B	\�`�E���e�i�w\�q�x�z�2\�\�	�8��fK�o�u��UQ�؈�dPB��G\�\�OW���5\��\0\�\�/^��Q�W\�b�M\�R�\�v\��[]\�n0c\�\�t�e\�%s<�V���Y4b\�\��\�\�.$\n���r�	���\�\��%\�*\�M\0Z(�v\�uB%R�4r��\�:��D����V��\�j7\ZV�,#\�\"Υsi4�\�\�3\�\�}u�\��.%�A��@t�\�B�戗N�2\�ʐ\�@�w��,1�K�1v-寔�\�|~h�+lc�KB�K\�M\�\�pw,\�\�[\�_�=��5��@�n\�(�=y��\�/.k@\��O��\0P�V�su�\����[\�\�#\�\�m徙\�L\0CZD�G\�th.b��x\�\�[y,e%bh\�$0\���m�$�-I���jC1F�\�\�\�\�Gy�e��m>�\�\�\�\�6\�qm$\�\�mG\�\�\�[��4�04q�3^+�\�C\�MqF�u5�\�\�:y�栗\�\�q\�O�k\�\���hv��O%쨰\�\�]I\�|\��.�\�\�+���E\���X4i\�\�OO�N�\�\�\�jii��wd4\�\�S~4%�\�3BkSsw�5ԶZ$�\r.\�h�Y\�\�y��T[\�2\�\�\�\�Y���ӿ6�E\�\�Nӯ;p��;�U\�f�X���,\�u\�s\n�jV���\�~f��X�JQ8\�r\Z\�i�e5�D>Gdm��gz��\��*=56j:l�<<o���Mլ<v1\�\�M�\��\�Z��\��|~\�2}B.�|{Kk�BnŬ\Z��f�Ю.\�\�\�*+it�������đ�.cj\\5Ki��Э^\�f\r\Z׽�?ԋ\�\�\�u+\r�\�}\�u��ZKaq�c��\�m!�\�	#�/\���>\�^��\�:c\�F�Nf�\�kѬ\�=}��\�y\�\�En5���jY�o�nkI$izC�ׯ��\'��}0�|sE\�v݈�V�k;:���H\rB&��|�\����_-��&+h�z6�Ԉ�fG۪\�\�\�\�\�\�\r�A!��\�Y��\�\�4��_�j\�\�s�\�,�A1\�áks�ƴy����ԥ�h\�o\�v2\�\��4ZD0�\"*w\�ZΥV��\�\�t(��\�%XbM�v�`T���\�m״\�<��ԿO��5\�\��\��l�d!{ٞ\�@7%�\�\�n���n��˯\�O���%\�f:>�&�\�?-\�O���*\�so*��\r\�od�\�\�V\�\�m�\�4/�\�K��G�\�E��\�MS\\\�l�>�\�p-D3\\Y\��}���+َO�\�Gp\�1?n\')0H�\�g�d\�\�\�$��K�=1�\"�ר\�\�:\�E\�y�C\n�d62�������nt��2\�\��\����\�?&��@&j%B�\�M+m�˚�MN�\��˵y�ov�?\��\�3X�:��,ϸ\�,\�-����D4T\�\�\�0\�p\�\��\�TM�el�{Y澊\�\�sKw}\�;�%\r�,�����E\�\�/�ܘ��\'oR\�]�;B�\�g8dV\rа5p>��u^D����/�x�\�PZ[����t�#\�\�0���Q㵎y���\�E�!R�\� �|rI\�m�%\��jp�%��\r	Z�\�P��\�\Z�߷I(a81�~�gľ!n_Q�\�u\�\�|�O����e������\0��㩥h\�qkV�EK���z�(t�\�P�t\�\��=84+5�zq\�<DE\'\�\r4��\�v>���I�4\�m\"�q$ox]^\�h�%\�U�w(\�>R�[\�6����^\�Y\��JxZ�G����),H-n�RDim\�&;t]\"%\�v\�;��A��\�\�{�]ݞ\"�\�\�&�\�{\��\�\Z�\�\��&�/�?�i\�5ż@\�+̠%pk��:\�\�\�j�$��R��SϦ\�ièi�\���E�JIpc�6�\�iVq��\�4`�$*\�)Y#Ui�D��v��h[࢚�*B��R�w���w�\�����J�?\���w\�\�\�³ܔ}L|wF�D\�t+;�Ĵ�z\\�>qC�\�\�⹣\�z\�:\��\�\�x\�\�\�_4r(\�qF�K\�1ʙ��%M�̬\\�C�ꊢ\�\�O�\\ȕۇ��ڍ�å\�\�s%�\�%\�[$ȸG\�jP%՗\��Et�QIo���MǷ��K� \�\�\�\�\�\0�(�\�;ε\�\�4p\�f\�\�\�;�m=\�\�\�qon��3S��M��\��pu\�\��\�K�m\�d���\�,m\�]�\�~�\�$�\�^���\�PRե7����J.K5\�.�\�+DEMe�m?e\�\�q\"Tw;����[RLi��\�n	c�$j�E��B)\"\�G��ji6Өf��\�\�\�Ρ�\�Z�����^�\�\\ӂO�}.�W�{�9\�u�y�����F\ry�\���^�\�\�{�Ӛ\����ӊ\r\�{�9pjD\�5N�T�]\�\�i��\�P\�ɪd���$�\\˝F~͆�\"\�vd2�=\�9;�\�g\�Z%\�\�ob���ŵ�\�tDɥcK K���*\�HA���ot�&:K������\�ŧ�2��B�\�J;�\�\�V��v����Q���i\�\�I�1�]F�\�\Zy�������s\�c�6���Y���Q�\�5�4v\�_1��Gǵ�\��Eg4wQ,;�Ѳ(Dzk%\�YC$\�f�\�I�	�On\n\Z�h\\J\�g�&K���/d�!i(Dx�#\�m8\r�\\\n0\'\�wߍ�h�\��}^�ÁtW�~Kj�_�\�Ok�Xt�.���N��\r���S�@�F�\�\��8\�ht49�U�5\�\�\�\�\��t�\�$Vi�����6\�\0Ѵ\"��\�Owp.SIan�H\�uPg���/,�-��\�H�\0\�\\���)�7�lKu��\�-�\07�����\�	�+\�$�;0\Z~\�5����{#~\�6\��v)*O�¡t�8\�v�S�#�}\�\�\���\�\��\�\Z�\�[[�uq�=m��\Z\�\�*\�g��\�\Z-�\�.HCr�[\�3Ep\�:{\\��m2K\�\�_���� v�\�\�_���[�ye��j:p\"[ i��\�[CFo\�\�\�\�n҅�؎\�-Q�*\�F1�\�C}]��\0f\�U�SX��\�G\�[��ږ4g\�ok\�\�Ӿ8�	\�y�����o\�\�^\�\�@��\�1D�^k\�F\"�Q�Z\���X\�?��1\�\�N(\�\�2��\0�P_��\�bp�\'\�Q�qN;\�\�\�\�wj#�,�A�P\�U\��\�3!TO�ћ�p\�\�Z%Ɠ{�ϜY\�v��(�q�k\'?ZR\0[�\�Iu��FE��,tn�Q��\�`DS\�P\�*�n+N��U�r\�\�W�Q��Gǝb���m\�\�G]�\Zf�R�\�\�m�H�n�r]!\"D������o��\�?\�lo⻴�L�d\�1\'��Mmh\�H#��ڴ\�\�\"5���\"\"�0�8�9jVm�E\�Z���\Z\��ƥ�i�\�G��\�\�@̖,\'�J�\�ӳMS\�\�i\���^:x\�1\\g��+�#\�\�\�o��4:\�\���\�4|\�\�v�\0�\�͚!\�?k�\�]��]�U͵\�}�mI\�Kk��!J��|\�\�jM�l�4\�\�H/��+�u�\�t�\'\���Ia���۸\�u�6�e\�n\��B�\�3Mx3\�f6�Ƌ�\0p�X�iV6�A�8�\�Z\�\�\\|�mn\�\���/\�\�\�\�\r��k{\"B��\��\��\0�hPE�@�c��\�\��=\�t\�\�A�\�?���\���{?\�.4�j\�V�9Q�К�\�Y��\�bN\�6�<%�`4�mP&�b\���\�2<ݵ\�~Skh���tM\�^^l\�\"�\0;�w��{M@\�5��q	\�q\�E��\�#��\0X$�g\"�W�\�\� P\�Ec��Mf�\�=8��\�1��\�?��Ź\�+n��,E���.m��3\�\�\�ڴ��<�,7Vm�b\��\rV\�Ǌ*\�N{}\�H>ڧ\�4]V;\�Ҕ���|\�I#\��\0.Ҫ\��c^��?X\�?W�ʏ�wE��\0*h\��\0StP?���\�O\��\0�\Z?����O\�TO������M�O�\�!�\�\��R\�j_+�\�\�K�巖�,6\�\�OTY\�R���q\�|���\�/J\�\ne�K7��nɉ�p\�\�gp\�t�o\��K�)�\�C\����\�i�\0��H,R~?0��~�=E�\�\"\�|�!=\�A**k�\�\�-w\�Iv�RjH�mf]��N��?P�*��CS�����R\�\�F�\r\�Ķ�U���<pj�-�\�Y�H\�\�߼�ͪ3\�Kw�ᇙ��x\��G49�\Z_<Vhq^hsG��t\�ׯ4h\Z�^�Ȯ:�\�y��	\�Q�n�\�o��\�\�\�\�W6\�\\\�\�\�V\�\�ƹ��m�\�3jh6�\�R\r�#��ndX�&e�\"X\"�\�X������/>�J��\0G�1=?荋/�\0�g��\0	\��\'边�\�\�\�2?H�G_�\"\�\�\��=�5\'\�\0\�?G��_\�o�\�?�߈\���\�\�_P�\�gR�R\�\�i�i�\�\�\�\�\�G\�2���C\�,�\�J�Vo.\Z �F��Cz�\��rO�����=�E�\��\00�\�\�vE~I�h\��u�Xj?ԯ��\�-u(~�\�ߪ:\�Q�C�\��\�\�RSk���d\�\�J�\���/\�ߗ\\U�\��\�c�]�YU���\�Z˧�\�}$n\�F\�]I�Ͼ\�\�7��K���\�s\"m�:\�H�W\�*��\�y9\�\�4|\������\�y�^\�Тq\\\���\�ƿn�\�\�i­kn\r�G�\\A%\�\�H�����?\�ۨC�	7m��e\�@�Y{�jW�\�\�td,\�\�\�~eѯ\�}ϩ:�\�gF��\�J�\�]�_�YZ\�5\�V���׸^�m6��\�w�U�\�6����V(\�}�Բ���\�\�>�����b\�Ό(mu�6\� UIe��0V�\�\�\�*\�\�P�h.j\��]n�f����\�\�jQ\�w\Z���A^�M\ZS6��Ʃ�O�v\�\�\�\���E�4��T6Z<t#�����<A\��4eL\�IJ%ȩ\�ڞI@Wt�ݶ�\\\�\�1��ޛ5\�\�c�d\�)��\�p������\�x&��k�\�\�Y��\�u�Ё�`-y\�y�ת5�P�\"B\"\�\�{^N?m��*[mT�\�\�<\�mCO�\�\�\Zu~\�Jn�v-�\0\�d�\�֝R��U�\�ÅG\��\r&��Tv0\n�4+��;���o\�CKg\�\���B�Y�\�:K5A�\�1���W]B7F���	%2S++[�S\�j E�2�A�H�\�\�\�:U\�\���k\�\�\�m�X���c�z]&))�(ض����~2\��\�*_�\�\"�\0\�\�G\���[/�K-\��\�)�>¤\�ob�R�9m�\�4ﱮm��|�3}-��Čno�\�_�\�B�B\�{{I��s\�\��x\'�\�Q�hb�:x�\�ghV:s\�P&�b�\�\�碑Zc�up�\�?\�\�\�\\]#UҵXڡ��y����[Ic\�P�l\�\'�v\�\��\0T�\�P\�abЪ�oQU����r�Y�`�\�₶cL��ib\�F���q�Q\�1\��\�m/.\�z�w+h�\�\�\�`�\�U����\�\�ۢ���i$�%����\�h\�қ^����\��\�!�F�l�\n\�$�А8��\�@{Dh���nC\�7T�*�\�s���NAI]�\��S��\�f\�\�}F\�\�A�\�mm�[\�G�o�w$7�E\0]�=c\�\\\�ױG=L�\\c&�\�9\�9�G��:�j\�~\�ʕ�\�Q��qc\n�\�.�\"\�{b\�=���t�.���;x�f�`�b,��\�\�!�\�{H�\�;\�S\"\�4���\�\0�A�N\�\�Dr�J137b�U+`�R��\�lԩ���jj3���-Y���\�T��\��I��bDp\�XmL�r\"����b��K\�\�0̱\�\�f\�X�i\'\�o�۳5���U`h�\�^	��U�59+M�$|��E\�\�\�S\�/]��\�u\�Ic�I�;H\��2\�qp\�n����cB�\no\r\�\�\�A\�\�5�(b�(P\�y�K\�\�\�\�==ѣ@�+M�i\�ף)�\�˔G\�޵N��\�#N	����\�3)\�\�7.\�\�P��\�	\\\�$smF\Z\"\�Sz\�\Z\�hv��Mڬ\�vx\�Q��\�\�M:�Y��KjW\�\�u3m���%�Y�eV�ͤ]ڷ�y`�\�$n\�И\�4[\�B\�ӱ��\�\�\'m*n\�\�\�o݌\�F��h��\0�\�q\�\�5�oc*�,v�l�0�\�\�qR�D��[��M���fc���}��[�\�m\�f@qǋ�/M\'�ܹ2�5\�\�{�g\�^8\�9�t#\'�G��\�\�8�B��\�V�6\��\Z��LJCZ�%\�Ur�\�v�#�|ݲ�{.\�w��\�K�m\�\�^\�G��\�\�ʢܩ%AP���0ݸ��@�p>�b��<�IR\�Qq\\\�{\�pf�LӅ�晟Q\�u$�\���=I\�\�\r���\�cX\�\�Z}\�[?0Uί,�\����Yjyv-�ʼSH�`N~�\��	cq J\�V@%���\�K�����A��\�\�Jc\�j8�\�5Hė�\0\�w�b~\��O�de�\�\�D\�\��w=\��T�z�\��\��\�s\\c\�OtFk\�A�[GN:qC\�n\�Юz8\�\�U����q{����ϋ�\�\\GW��ݰ��U\�&�\�6Ծ-\n��\�x\�\r7�\0�\"G3�h��V\�w420�I\�j�ڈ�[�QGS2���|+\�3 �\�l�C�uTե-u\�[\�T%\��F,\r\\0�,\�{ua�\�\�,�nr3u%\�J��\�ݝ\�\�\�s-��4�B����1��ؤ��\�t��ޒ\�T�C��5Mѽ�1\�H�.	�\�\�\�5(\�.A�aۅ��\�\Z�\�\���\�w\�\'\�F\�}x\�T�Eg��\�9\�y�\�9��\�=q�\�s�1\�\n9�8��\�[i\�\\�m��p�D���l����\�8�\�C��?x���l[���i\Z3��n�\�.\�\�\�S�6c�>c]�\'5�V\�~|�$�;���߇5q�4ץr}�\0%���hmf)�\�IOt�W�\�%Xj;\�Q\r�\�5%�\�\�n\�\��kGP���7�!���K7Z,\�Ep�Q�(�\�	���#\�\�<6	ʊ�\�N���\��s�w<x��\"�g1�\��;Q\�p���ⱎ�q\����E\�:{�3�\�\�+\�\�\�9���K\�׊�=V)\�1&\�G�4wM�{�Oq�K�\�LSo\�]��N{�*C��_\�n2=I�pw�[qQf�l1l`h�\�>����O\�>\Z\�F2�ʸ�-R\\	u�Q��kZB�$1�\�\�\�wr��\�\�\�\��\n�ֵk6��GtGy�\�*\�����C\��\�Tڈ\�\�o\0���\�Wz��sV�\�\�<���^�ָ�$����,x3\�p�U��Ip�eM,\�FR|Ϻ�\�\\\�ʐ�\0o��8�>\�\�n\�\�\\h��\�-�h:\n��c��\�F2=����h\Z�\�\�t�\0�r:\Z|hu�`:�\�|������mn\�ֶ�	{\�jK�&{�m.D�\�_�\01A\�b[�\�\�p�\�mWj�A�*ұ���0q�#�׷𕸊y\n��3I�$qU�\��dRF�i\�]V\�[f�\�u;G�hdZLl��\'��C%�\�a\��\�\���\�-F�\���w.�usI�5\�\�6��\�*RO��\�i�x�2mɩ��\�e|�ɖ�\�=[\�\r4���\�\�ða&֩0��\"�[-+U�\�$�	\�.lc���@e�R`\�\�~:��\��sB��\�\�ߒE+\���:\Z4<z�\�x\����:\�F\�F\�5�\�+��N�H���\��0�_D�ևxL�\��>>�2ab^\�\\Gk�9Z\�W52\n\0��\n\�\�A��qJ̴�4i\�eߝ��S\\ƂK�j\�&��d\'m#.^\�߸5--n+X\�&R\�]\��׎���(@%It�GO5u���2\�lA�ȴX\�V6��-��lQQ\Z\�\��\�G1i�rV��v\Z\��M�1�h�m�4�s=\�!Q�e�U\'9Wb0YB\�\�\����\0��\�\�\�5He\��\0W\�.\�a�\��\�\���x�\�+�\�繷\�(\�z�9\�\�\�k\�dP�\�Y\�\�I�����\��b�hx�\rx�xU&��K\Z�b\�,\�}U\��\�␷���\�\�j\�{]\�J`Ǔ�p�\�0V1�e\�@b�)�ځPD��&0\�A/��\�[\�v\����sY\0� �:�B*U��.&�0�\�H$\�\�\��z\Z��X���\�S[��d^X6E�\�f\Z<�oc���b\�\�PM g\�rl;�,\"�\�o\Z��@`N�`5\' R�mU\�*f�4d5�JE�\�k����d�H���|ӷ\��~\�\�\�fåثiQc��ҋ{O\�\\.+\�=4|�\�QS��\\W���\���Y\�h�EsX\�<tQC�s��G�ԿSm0�\�ȷ�p�\�+�\r^@\�\�m\nWs��\'\�cSDm�\�ڰ�\0V�z�\�\��\�\�T�X�\\\�;�#\�\�;Ǻ\�ARߢ\�W\�J�0\n\�Rk��b	�H\�\n�n[b\��<Q�+�U-w��m,0�D��\�by#ң���\�\�ڊ5T)��Xؕ̆:Tj�m(\�ʹlbZ�\"x(O��sUW�\�+Ga\�آˉ\n%H\�C�2\��\�\"�q\�L�AI��������8\"v����C���h\n�\�\�/49�\�5��U�=�E\n�GȬ��iO\�׾�j@Es�\�K�y\Z:\�$\�\�9U�K\��G�\�ƲQ�BV#���V\��\�A�����3J��lҷ\�p;�1\�\�\�\�\�k�kݕ4\�\�YF�;i�m`\�F�BHY�2�.7tH�fp\�]exf^\�p%��٣�k�\0�aG4l#��\�\�\�\"\�,p\�?�S��� h\�\�#+6\�fr�n$\�\�H\r�\�ͼ\�ԥ�	\�#\�L\�m/��a�$�G,���r��\r\�-\�ڭ\� <\"��E���揚nh�#�Я5��\�\�\�<t9\�y\�\�(f�\�x�X�:�OnH%\0��E�N\�ҭf�����.�(�\�#?\�&v~ae4eN0al\�YE �q��Q�q���\�I��\�R��k��\�(*\r�e\�+Hi߁&]�y@�\�3\�a�\�\�&t�P���8	�\0q4.����-ԑF�h\�xc�+m\�$?v(�F��\�{�,�eV��!\n&LIq��ӻf\�\��v�B[*+���Y��E2\�w5\����8f#Af\Z\�Z�6\�ˇ�L/CK\���\�W��>f�\\P��<u00+��\�ׯ\�\�{\rp+�\�\�{�&�@Ԝ\�/	Dj@-,[��(\�G\�(dZ�\\H�}��cVj���\�\n���ӞU\�\�+��+�\'��,d�x ቶ=��˪�$.7\�\�C�\0\�$I[x�\�*F�pGH�Tk+4њ\�\�Oځ�m$�Ħ��fic \�n۞(b;\�R3~\� ��\n*Hk~j\� �)�\ZS��\�\0�i�\�տ�\�\�\�\�p_,v\�vj��v$ī�I���\0�\n�\0C3a*[%vU<P\�׎����X�\�<�=\n\�y�s\�<�GOg\��W�\�\�4\�4\'�\�\�!�\��\�\�\nn���\r\Z��U\�Z��ŗFq�]\��1�#\'-\�e#k�&WaO0Agm�m��,	\�T&8�\�ѕ܎p\���.#�� TdYAʯ�\�R�#[�5&8\�E1\'b�4H�@d����ؙ\'m�wt\�y>ճ\rq1����\�S$�iwT�BɶW\�\"P\�\�Ȇ&C�]��)�z��˵N�ъ\�\���K�s�|v%�IUs�bv\� �Z\0���C\\W�\�\�\�8�1\���q�\�\��\�\\s\�`t\�rk\�\\G��b\Z\�1\��\�T�{\�a*\�2\�0\�2�\�w*\�6e�\�0\�U���\0R\��h�5m��\np�+\���a�-aړ�\Zg�%\�!\�m�T`#�p����ڡ�}\�r�#<p�e�X�F!_\�\�A�VED�T\�rVy��\n�����\"3��ϩ\'�ҳ�^\�\�\�/\�X\"Y;�\�z؏+*\�\�\�x�X\�F��N�)&��\�\�v\��W[A��\���.�\�8u8Vl�\0\\g\�5y�\�\�\Z�(b�ך\�\�s\\�B�G�4\r\rq\�\�\�C\�E\�43}�����W\�~iش��\0����\Z�?���\�)�.i��L<\�h\Z�\�9\�.琵��B�\�lGsL�w��J��\"��Ȓ�#�_\�b9�#k\���\�2L\�o�bF��)\'V�\�:	\��p_m4ѱ�M\��fC�r\��P�vq G�=�d�&�\�al�\�X�\�\�9��Z�\�**DUO�T`\�i��O�}��Έ6鷶�\�y6+\�*7\�+\�㧚<VxJA�\�5�M\n�1\�\�q�\r��W��P\�\�z\�<W��Dn\n�\\H6B\�K��bRY��(pfbZ(F+��\�\�ӎ\n\�o5h6\�K̜%\�}a�t�\�\�lC\�\�\�\�{�&�\��?#A&VK��\�2�:\���c f��wFu\�\n�ӆa1\0�Eba(]�M\�\�\��\�FEVhG����\�;�FIK�\�2��\�\�\�n\�\�uF�w\�9l��H�\�Qm��<s\��q\r\�\Z�1�J1v\�\��8�M$*[\� 2\\}^\�RF#Q\�Ez>8��u5\�V�\���4CB��\�z\n�ϯf�\�Ҋ�\�\�\�\�$\Z���-\��\�6(ά�S\\��̄\�`��n\�P͔\�/��*A8ą�H\�f[r��\��em\���3\�\�\��;\�J\�$�����c�C�*&\n\�u��C���D)�vzMf��\�BRt�$��\���L�k\n�.�e>�V\�3S\�\�mT��Qþ�c\��\��J*i��\��̦����K.\�k;�\�I#-B$db݊��akf]��V�\�@���Տ\�\�c����+��&[9Wcܑ5\�\�\�\�\�\�x��\�ב��1��W�b�b�4{4�\�\�8�h\�mMG\�s^�y9\�L�\�qsk\���	�ˉ\�&�Eb\�ܹ̭�\�\�\�F~���h�Aˈ0d�v�@\�R)\�$8KH�����dj�6��}ߚ{��\�+/l=\�\��pJ�VX\�]l;\\\�oMfC_�usB�\�o\�hj\�\�5\�\�/Qk�-Sk�	�s0]Np?q�5���%\�l?>B\�i�6, `\\F+�\�S\�!Q9��B.\�%-Zd�3\Z�m�\�C5�\�\�\�1\�\�q۸��\�l��X���5yR˶{U1_Gz=\�\��\���z\n�\�9��\�q\��\�y=�#�Z�怣\�t渡F�X�zמ���U\�\�^k\�2�)X\�\�2��\��\�1\�\�@6>K�RWԡ����չ\�U�\�t�$�ҏ\Zq0PӮ\�\�E\Z��0���*��ث��%�:4��K3E���\"\�P��\��\0n]*e:\'\�%��[m{B{�#\�Z�\��w2֡�s�Y4�բz]\�\�m�^=i�\0�����j�\�\�\r�������\�\�\�\�\�V�.t\��RԗV����mUᡯ8/�3G>��Vq	\�M��J�4�:�\�]>�lcH\�n���\���f!�\��p� \0\�Wm�7YZ\�\Zk\Z\�km\�+h-�4M{�8k\�m8\�z�\�\�{\�\nq\�\�3\��\�1�=3B��G���^+ѡY�C��\�\��^z6Z�\�\��\0fA�7���4gd����W@H�\0@\0\r�okB\�[C� �\�\�\"B�0�d]:��[�>��\�v��\��+Z�I��\�iaҬ�Xn4�~i\���C@�k\�&\�5D�\�W\�t����ތ�[%�t\�B\�\�i�E�\0\�ĺ\�ơT�\�\�f����+\�\ZO\�\�VӴD�+�(\�O��e�-I~ia_0\�R\r>=r��\�6��i��\�\�I���\�|s\��GW�\�8\Z\�N�ڌ�?\�mj�$j*\��T`jFt�~䓨���\��\0��\�\�|~\"1�&�\�\Z�h�8\�C@\�hsB�C\�`\�:{�T:�C�� t���鑟~�W�\��\0\\\�\Z\�M](��\�1W<4�N\�Y�%T�\�j�r�\�JmJ�\�FH�]\�m&\�M�$9$Ȳ\�j-�Num\�A��\�j�����\�-tH�lmD��UŦ�\�\�B�|�n��wZ\�H�d]�	E�0�\�j\�U�_�\0R\�5}�-���V\�)\�\�n\�	\�h�|�d�%�W\�4��5\�?\�m\�ȧK\�-��Ck\Z�BD�בѵ��\�ӭ#�1mo�]mdZ�n쳹-�vѷ� @*���\�\�X��{v[�\�^+\�㧬\�3\�(�E� d\�����\��g�xo5�\�B�\��\�\��dV\rz`W�\�\�y\�S�wp)&�?h�\�\�78��A���1\�\�ed܏g/6�\n��7�\�1*Cm,7Gv\�\�+�\�\�+\�A5s\nJ.t�\���\�X��i��m9ln\�>Gێ\�\�O,:G\�l\�-n�+T�6����\��niW\�R_\�I\�S77(\�e�X^k̋WWkk?1�\�U_�[���nK\�Y5\�i9�M\���V\�W\�v\�1KCd@��H\�\�\�\�\�\�\� �A5jLȓʀ\� 2��\0\�˾<7n\�F�\0y.U����+5\���z+�\�ɯT�h���k\�C�\�\�y@� �q�Ɣ��\�t\�\Zq\�<g3\�c _!�?X\n!M\\m4����\���[l�A�|J��\Z��~\�\�Uwo\���bb�!���٧]�M��Μ�	-~\�\r�,ښ\�`��6\����C�\�;h\�ն��\�\�:\�\�_\'r\�0\�mV\�\��\0&:\��m|�wr��\00�����5jN����{���\�_�#Q�4m�5����m\�Tw#����Y�T�i��f���q1+5\� \�.7��V�j\�6q#��v\�ˈ\��\0�Hf�L��\\c�xk\�\���x�B�\0��hy\�z��F�\�hm��\"��s\�⚱\�\�z\�ȯB��u\nOj\rn\"�!Sq�k�Mo\���3T��mC!���\�7pD0Ya�F\�W^��\0��m\��1N�[~\�M\�\�ئ��P�K����6ڴ�����\��\�\�EZ\�\�\��r�]YD��#Z�iIZ�B�b.]l�_�����m\\\�+��(\"H\�\�F����8���n�6��M�A͒\�ѱۄ����\�#\�h�ݽ�3�^z5\Z�(��h\��\�\�B:�8�@&�9���\�z\Z�扯k䞃��B�Y�OLdy�4+ךs\�ڵHQ\�j2h�\"ۻ\ZR�9Yc�Z`$����\�9�\�J�U��\�U\�o� G��A����yqMo���\�FX\�df\�	�ٲ�쮶�Z[Ƕ8�p�=�B�Y,�z��\�\�t_��\��bS�\��\�8<Iq+��\���B,VB�l\�\0 �f�C�99��\"֣q�\\�x\���ʿp\�-��ȉ���v\0�\�t\�(W�5\�хׂ|�\\W�#�$�?\�>H\��\�<��Q�4<xh׎�\�(u\�c�N<t稯5�(?�p\��r��\�v&��X��\00K\�4hZh\�Q�y\n5�\�H\���b}�Q�\ZB�\�Ր�\�n�E��\�\ZuR���\�7E��ۿ\�=�Q\�Q���F�n\�����\��\"c0\�F\�J\���S�b��vn����Ұ��B\�0+M+�a\�F�����jk�\�P�u}֭{��C\�T��\'*ג\�7rs\�%�\"�\Z�\\Q\�+��F���\�\Z$�\�A\�\�x\�k\�S\�s^�\��\"�=Es�y9�zc�f�\�5뚺�.m\�H\�\Z%\Z��\"HJU�aV��\���3��u\�C.���\�@�6V9N\ZFm\�\��\�\"��\Z�����fDu4+���A\"��QM*�\�q*�*T\� %+ɷ\'9���{�\"\�|��8M滃3J��ԉ��\�(\�\�b�wc)mp\rB�i\�s;�\�nW\�-Z�Tf�$��틩̑\�7,ٓG�\'�\�⁥\�����\�z\"��\�x�\\\���\�\n5\�4\Z���\�ycD�4y\�\�\Z-G��B�Vy�_\"�\�\�.C�#\�\0�s�5�i	4��&\�q�Q�,�9��\nL��y*\"q1�$v\�AttWl�X$\�\�}��;K\\Ww�\0Yc$B��i\�>�u*��\n�\�\\~S�Jb7O��d�+6\�y�w�[�c\"& ���i!�\\G�\�l��ɘ\�(h�Z\�\�\�=\�:]JXƽ\�\�\�o�2*\�$kW\�\�\�܅��B6t��\�G�\�\�V8�C��C�����&�W�h\Z_\�W��8\�y�\rhW�s\�E\Z\'�^�~:)�\��}�vБ[�*\�j�%G.*)AXrkj\��,\�P�\�\���*�c@6\�m��z��\�H\�ɓ-\�BF\�\�q�V�Vd%�+u��5q-0��Ҭ��J�@|\�K� \\�\�\�U,\�l{f,�\�k�)�٣\�_\�(h\�Yv�q�\"	7-a�\�Գe�g�\�\�&\�B�.Z=\�\�\�j\�\�\�\�HH̲\�ao�\�Ǡ=i(W��Y\�O-\��@\�4M\Z\�\0W4\rsG9\�@9^H W�:b�\��F�\��W�\�\�O���C\�4<c4\rgm|�\�\�ܬ���2\�T�d�)P\��RE(\�dK\�\�U�њ�\�.\�H���h\�b\�EQ�\0��FZ�J\��̎T�\�I\�(TFd8�\�4rF�%\�*�H��5N�\\-/\�L\�\�Ǖ�.���\�hSs��\�\�\�\�\'t��\�#\�\�5\�a\�\�㵖w�U�\�\�*���D�\�mo�v�&�#Ye�\�74�\n���~�pU48��A\�1���\�\�x�u�\�N)@\�O��k=|׎�zx5\�I\�+\�<\�I�E5s^i��Jy�8#mkVߟhc�\0f\�\�\�(J��+	LG\'\��ڦUj����E)\�1Q�:�7S\�D�\��+F\�� ݜQ\04�YD{�m�;qpy�\�\�\�VݘH͹�7\�\�\�r�ZH{�IcV�3\"��\�c�$H��D\�Ř\�\�&��8�3\�;kn\�i\�]e82�\�\�����\�<�A;�S�K6\����1eg�Q==��(\�\�\���G�Ϣp	\�s�P<{\���\��\�z�V:\Z\��\�+\�z�:4I��\�k�}��(R��#W�E{\"aհ3������\�8\����Wg\�˺�R����7;G��v+M4�ݺ,�b*\�n݉\"滊P\�\�\�]�m\�V�wwcZ�4\�pv\�2\��q$0��۬K�\�\Z\�j=�T%vp�k�dCF.\�v��؊\0X\�V6\�C�$\nyw=\��7�@n0G\�/6\�wج\Z:��^�$,\��\�=\�j�ɬ\��\��G\�75\n#䞍\�#��^)E:q�ЯC\�LVzf�CB�C��8�i��\r{�\�\�z\no�ە�� \�\�`xdL)V0$��T2\�yY�_�\�G`����\�E\\��\0�5m\�s�\�-F2@\�B�2v\�]��`�\�\�9@j^�{��$\�f\�l)l��G��n���YdU܈co�s���?T�m�\�q�\0��\�ۅ�9�{\0횞A�>\�\0T�,\�\���$ة���P\�k\\O�٥�&�{�G���1�4|u(\�#�\�3��ⳁ▘���t�B�sJOB03\�y\�ךM75\�Mz�#�hP=5�ڦjx\�X�e�)A\0Y\\�\�8QW�HT�۝�0\��ZM�r>\�*�$P��\�z��AP���j�d��L҄�e\�v܁�S�D\�G\"OJ[h��\�:�M���\�X\�q����ʲ��JV2R\�6Ϲ��\�6Q��I\�3\0�/q����RLn�mI���(�F\�\�\Z5\�(����X\�h��?��=\�\\Q5\�f�ɣY����\�s\\\�\�f�\n�@\�+&�sC��\�s^\�4�\�f��\�&\�D܇\�\�1�-e`!���B\�\�\�8�\n�\0bHĭ\�\�,x\�<�z̭Q2ն,e\�yeWp\�F��LWuB�\�0-\Z�y�H;A(�L\�ɄDF\�kbCF�\�Ҍ�\��*\�v��\'F\�(�-%-�2\�\0PK�\�\��݋����������oɉ#����0\��b�mK(A�\��\�w\Z*z\�sM\�Vi�<5\n4:y���u�\0^�O5�xǞ�\�OX\��秾�t\�?�漜t�\�`\�:y��H\�VM5c�hТy\�@֥�\��.�\"5H�$��5�\�Y&jӦu��Ĳ\�+5]e/\�8\�I\�QqBE&,`N\�i\'&B�8˫(\�!/Eq$\�\�2�E�Wnr�Di\�zx�Tf}�(\�*eq2\�^\�3ɄI?\�ٶ$icX����\\I#c��)\\\�\�\"A4�\�\�\�\n�?l�\0��C���\��U��\0nO�ێ��\�h\��\�\����\�4:}k8\�\�מ��\��M\Z+׮k\"��F�ѡ��\'9\�+�\'�^\�\��Q\�\�\��\�VzL�љw8�\�ǃ�X\�c�\�\�\\6Ȯ%I\"���\�\�\�I3	c&��\�)U9wM�Sm�vjF�B\�G�0�\�\�\rɘl�i\'�Rr\�0\"�\���W����I݅X\�O\�v\"2E��>Fe�7V��չ\��$�,�;v\�tn�T\�..f\�]\�q$�;���U�\�1�4٣�\"�\���\�O~+\�W�\�\�<\�X�s\�SB���k\�z\�)GF�׊�G�\�A^+ٯx�\��n�|�G�4��S���\��\rW;�\�~\�5is�+[��\���\'�\\lTw&����;\��\0.	(c�!<�J�R\"\�C3\�b#ߚ��IHK\�J�4�LV�\�\�\�\�\�Ll��fp!�_eܫ\Z���\�\�ٝ\�]�\"�M\�\�\"�S#Jȃ�fiBC\�8�LTU\�\�\�\�\�r\�a%�UY.K=\�\�+\�ڤT\�\Z�\�cOcG����R� \�\n&�=4|09\�5\��\'�~\�k5�\09\�\�d�\�sX�\��\0\�ן\�:\ZW�z7�h�\'=1G	�hyZ\�\�\Z�\�F:e\�N��\�ӗŴ�kI\rE!#���\�w�ȯ�\�rV�&\�.\�<*\�$J;h��\�F\r24���\�\�K����\�m�\�i_^\�NC�\�HKO5�H҉\�Q�ҳ���\��\�q�)\�L;� n�94]*엥g�d�;72��<A!*{�S>羹\�\��\�DV-\"Z*v�̃\���\\���x\� �\��8�\�h�\�=��\�hס�z�C�x�5�旓B�\�\�5\�75�����\�\�3`��\�L��DW\�f�a���(�f�T\�\Z�H\�R�.�Ȩd=\�\�\�\�GP^R\Z;��mr\�7�\��9Z\'w�f\�#��\�<��s5m=��\�.#euD��\�a�������\0\�\�d\�GY�\�M\0�/\�aYo	5r6Ȗ\�-\�F�\\�%F]�\0k�Gz耗�,�mspV\�+SOS\����\�\�Z�\�ݾ�{j#\nЯn\Z�\�جנq\�\�c��8�^+�(�\\P�=��C5�zu4Ə\��\�\�(�J\�\�rk\�?�sD�F)�GÚ$P�?m\�Y+YS�P^\�}J\�-2��\'j�����o�6ڊ_�f�+<\��\�\�R��Ơ�\�\�BhNHK�\�\�Ǌ\�e���<�Ѝ`��0h\�b�c�\�a�\�D\�K<)~\�C\Zŵ��t$W�\�G\�Y�5[\�I��\\Ay��\�\�)y\�0������27k��I)�Z5k���c]��Gd�\�g�4+����\�r=�<�\�{\�z9�=3�ՓJx9�]}t\�KG��\�P\�\�Vx�\�\n�\\��O4\�\�\�cX�\��(�Q\�huU;\�\�(�^7*�gn\�ݐ�{��A��xw�\r�����\��\�o\�d��&c\r�ұ���\�0�Ȳ�\�\n����4�YT�d\��\�1eI\�4�mcp%�\�S˽\��G�˕�1�\�kYP\�`F�-��̫,ϸ=\��\�\�[��\�\�\��\�\\\�\��cy\�\�\�\�\�*H��V\�ڴ�V�|�g��=��ȡ\��\��5잧\�k�\"�$ѯ�C\�C\�CqX\�42(��\��j\�[�rk4<\�R���Պjn)ik\�O�w\�kr�jc��\�f\�h�������\nE&Ewp\�(#%\0`\�?��!�\�.��\�AI\'n�n\�w�\�\�\�\�e|��m��\�n�ʒ\�ߒ:��MR\\,�o$\�,\�Hb7\�\"MBX�mcq�P�\��+�\��{�\�Ja�&\�\�N���kK�ԫ�W*$}\�o\�\�\��#SqV֭P۴ =\�m��FZ\�\��C5\����I\�y�4\�\�A\�SW�5���\�k\Z R׎�nOOT9�@�\�ך\\W\0{�Ѹ8�g�Em��\�[ěk�ס[�\�*\�g��\�Q*�\�d\�ά�4nk�\�\�UFU��5��\��NJʉ2Mܒ�$��w*J\�\Z��+(�\�\�\�\�\�\�\"�\�R�]^+�q]�\�`�\�I���W\�nZzٹ���\�/�[�,�K���wi\��qy�%\�[<׈d2�YXR�\n.Z��x��h\nŴ��&�&�6q�U\�\�y\��\0<W\�\nn�(x\�#��Vy�\0�k\�zo%x<�z\\\�:d�k\�h�Dt\�x\�\�\0)�5�+���y��N0ئ\�\�M\�k���p�W\� ��%\��ț\�\�F\�\��%�\��g|xQ@Ҍ\�~�F̌\nӕ��Gp\�-\��u\r\�1\\�o��+Nۀ�;⼅�L���KEs!U��e$\�HF�[3��W6\���\�\�y��AQqn�5\�{�fJ<o{z�W�\�@\�X\�\�T �H\�R\��*�F��&�ԻUt�\�9\�\�@h�\0\�Vk�\��\�\�\�\�|P�A5\�\�\�k\��\0>\�zf�^An��k\�{���=<P\����k\�yjni��\0�Q�h\�V��%�\Z��=\�\��\n�\�ي�\nӨ\��\�(2���c%%+�\��\Z��5�AY\�FIa#U�\�;�\�:\���1)\�\�\�\�%Cr�?%�K���\�wn��U��iN���\�#�$z{�\�.х�\�Qn���Ձ[�\�$4�;e��aAF퐻2#@)��� Vt\�DF�Gpi�\'�+�dY�\�\n��\�8-��P5\�\�\��\�hsA���C�^Iz\�P科^\rY\�\�><\��\�t\�|\�뎄sO\�\�\��MG\��0j\�q|�V7sZF�\�\�.a\nXdS+*\�\�ć��홓c	6�ʰ�6\�yr��nl!YB�`ܦD�@\0\\m�\�\�YD7��_I�\�+�6\�[�f\'	w�>�#�]�M\�e�\�\r�3=1��\��\�\�$�\��\\\�S\Z�^\�yyRV�4�\�EHB��\�\�;����1 7\�۩\0���\�HVO���K9VEzq\�ѣ^U�\�8�\\V2A\�P\�<�hp9輁^hy�Y\�O|\��B��=5{\'\��Q\�LP\�rM7�*	�G��#\�\�5�\�c$\��z��&�h\�\Z;X:\�F��\�9�\nl��-L�	\�劖b\��ju�J�\�i�\r\�\��۞ɯ�Y\�W\�\n)���d�\�\�~D�I �Q(HHߐ��\�X4\�Ot)�\�M3\�Z\�pHن\�$��4�	E��d��\�I��G�I\�	5*�\�\�\"�7\�\�\�VU���ތ\Z\�\�M{��n�`��D\�5�:�\�\�:\n\�Nh\�\��J��\'�h\�k\�f�F�\�\�Td��^�\�\�>)\��ni\��j�o�xY\�\�o�h\�\�\�\�5��Jw)d\�\�\�m���6葴[\�6T	�2�\�l�\�\�ee@շyh�k������6H���=���T��Қڱ�)�e�m}��ks%4�_�ܡt~S\�\�,F楈\�\�\�\rP芪�a\�K�\�\�\�(	1 \�GػaV�]\�}��\�muq7v�#\�\�v������aG�\'�\�W}�X\�{\� �\�y�<\�@\�\�I\��\rb�B�z�hVk\�dcW��\�\'u5z\�\�P+�sY�5\�\ne�n�(Ԇ��kZ�M%\�\�vҭ�\���:w\�4�\�ن�R���\�\"�Si�U����=�%�m�Jv\�\�ۡL2�L��x�T\�(�\�\�	8M\��6\�F\0p\��7Wa�\�Сu�,V����J\�M���\�2\�hc�Ti���{�cR\�Z��}%���}?��V�_��XYܻwl;fIᚴ\�BM6\�H\�\�\�-Et��=g�\�sY�3\\\�F�\rz\�k\�:N9�\\V��\�\�hp<P�\�5yP\�qE�\�>=y\�\�\nbEm���r�_�j<\�3�?�\Za\�>I��pa\��p\�\�nB3P�\�\�2�-�\��j\�D����U�b\�\�~<�r\�\�L�:)��\�Q\�C�\nv\�\��;\�.m�~a�<�w�1�\03\�CA]k\n��\�#�Ƅ�\�Q^;1�\�GD+W\�\�UF\�`\�H��St�1&$�\0I��c�/�1j�\��k\�=C7q~=�6�qmq\�?�t�G�sX\�\�G�k�#\�\�\�#\��+�b��\�c�:\�\r`QmFjL\� �V�{�\�jS\�+ݮb\��n�Oԩ��\��^\�h.�\�3\�\�D}�ԓ�\�EY-��[�\� \�Rn\�\�#�<Q\�m��Vh\�9F��%Y\�gf)\�,9;\0�r�ڄ�+�\0\�M�)��k\�>\�C\�]�+�6��0�䌂P�(6dx p��.\�XϕU w�T��Ƥ1m�i�:�0�<H�s>>\r�\'���v��\\W�\�x���V�\�H��\�\�^(x��\�׊�@5���?�\�\0@\0\0\0\0!1A\"Q2aq����� #BR�\�3\�b�Cr��$4Ss��\�\0?�\0\0h��*OU*OU��Rz�=T���T�3����J���=T���r�\��1\��ԧc)\�\�G�wiѱ\�D;O\no\�\�=��ls\�*��L\�L*��\�NS�i\�i�\�7��\�\���\�֡�\�@vU;Q�\���ڌ�r�Bk�\�2>k1ꮌ�WD���P�I\�\�_��U\'�$\�z�(���=P�\\P&Q+1RVd\�x��[ߌ�xY�#��:��B�.y�>�[��\��U^ѭP�0�%α\0�Y��X(�8Y˺�\���xʜ\�ہ��Ps�p\�\'ܛ���5~i\�אvM!�A�#u�\�d���*X\�g��\�\ZD�-Mt\��!m\��\�o\�z\�~\�]\�vT�\�n�J6CO>\n\�e�h�;\r��.��V�n\�9�uW\\H�n�w����m\�\�z\"n�Kn\�*g�\0���\'Sp�\�u7��,\�\��ٺq\�D!<\�h\�+�\r\'\�\����7�\Z���Ók\�\�uGQ�\Z�áX.ҧP�o\�zmi(<q��߆��<4D��Ȏ!\\>\��\�\�\n\�eB\"\ny\��\�꡶U�md�­�5\'!�E\�y��cF���\0\nI\�Nm\�B�]d Kn��5M7�e9��U)ǚ�S�	\��KWY�\�wS�fT�\\\��x����\�eA,t�\�AM���µ�\�Dy�$B\�\�h}��\�ꎣ��p�J�o�O\r\�\�U*5��3Ӫ{�뺤 hi�M}\0$M��i\�N[���\0E���\��\�(��%\�&�\�7��c\��E�\�\'T\��^�t\�\\�\�\��5�\r刺���4���\"�O\�M\�\�l���\�\�)M�(8)��2���*:pZ�_\�z\�\��^\\<\��Y�\�s�\�\�\�Ox`2�x㘱�����~��\Z\�Jv\�_\�8\�S�m�+��\�3\�\�\�-l\�mi\�~��C��\��\�#k���#��\�)�؈!\Z$\\!Mɴ��L.\�y�+�-˻�0\�M�&\�D\�p`_e�����t�w.�?]\�\n�#���k�J�P �Sn���\"V�[�,�B���\rxj�o\�\�\�6\�m׆�h �UiUjd�X\�c\�\�`�L�\�J=\��&Qk�\�G\r�u	�\'d\�A�W)+��T��v\�\�\�D�Y�Sh�\��\�t	��\�\nQ.�YA\'Q�E��!E�`\'�\��$��\0\�\�\���\�i\�\�\�`�Ay��\�6�n\"�L*�h\0@�\�<\�:\�x����Q\nz�<c��\�Qe&Q\��D/B��j*J�{\�cq���r�\�2��\�u�b}�\�2!;\�r\�	��_\��Eߖ%2�7\�x2���-1\�\�;�\�.榥��1 4e\�<ܣm\�iH-�ir\�i�je/\��P����+&\�n����H�ѥh�S�Ƌ��F=:������p��\�DF\�\�Pl��V\�/�dz\�bYX��bT{ѿ��8b���t�7C��\�r(\"<\�GT��$�b��ɧKN�޲��\�2{\�s�Fg1\�v@8\�-�S#|Ǣ˄hS0\�v\�ɘN�\�Cm\�ٴ�Wtt]�tN�\�\�\0\�_�q�h�C�D\�yuB�Z&ShA�0mr��:!CRBvo�v\ruO\�N�U\�h\n\�\0<\�\�\�y���r�Qk�10\�Ġ@p�\�\Z�G\�A\�sFmO\���E�������R�8\�\���\�Z*�\Z�\\l\�\�ZD\�By��\�\�Y�;�\�\�AwT\�,\�6eS\�\\§�v\�1�ʙ�h`��_b��쐆�,�\�ٖ�\�3r,s;!C�M��[�\0(\�\�J\�[�n:��$\�\�R�\�%w\�\�p͓#ESN�T\�ǵU\�H�\n�.\�\����^\�2\r7͙6m��wna\�R�.>�`k\�!�f�O%q}��\�\�Ǣ(V�%O8A_�<5���)\�\�y�X\�a�r�\��M\�\�\�;#f��s>�\�[�5-Q\�@\06ʎ��d(	\�w\�43p�$[U�m�wʅ\"=h6n�$	\�V]\nkZ5YD���Ӛ eYDL]m�Y�7���\�6O�\�L8\�#\r#E�Ö�k$6�ۜJ��%=�\\ݾ*�\�\�\07�,-~�\�m�������;l�+^>�r3<?n<\�\�9˴1P;��\��\'�\�I�!\�/d\�\�\Z�XA��Xl�\"IB�\0L�dh腄B�\�ޤ�\�E$X�T\�@��N!\�`�\Zm+K�s,,����\�i\��iDLX\"\��!ToE^�pFIA���\\\0\�ʄ���;��Sb�@vT�Q����\0�a\�\�ODPQ�	R8j���#\�4P�p��>J~+TS�\��<\�|̫�z&4�m�{�\�\�\�Q\�l��\0K�\�*c\�i�y_�D�ޅjnV\�\�,��7��\�k�E���N�L�����(;u3*%Y�L��\��\�@9Q\�T\�\�N�{A7*�\�q	�$�\�ż\�\�\�ʋ�F��\n��\��\'b��z߄/$Q�!J��S\nS�%v�\\���\�����\�]�D����\�򅁠\�\�\�eB�\r��@\�BͲ�h����ã�L�%H�0Vq$7�,\�\"\�h>\\3B/3�\�-\'\��f6Y\��\�\�\�Q�\Z	A�\�42\�P�\�=��p麬�A\�v�f�\"Kt*�\�Q�5T#�p;�N��u\�\�\��$|�n�(#\�\Z\��Ъ��\�c*\�\�\�\\���Ίv\"eRаTM�Mh\�\�|ɷ�&� \�N�JѤD�p\0\�\�:)��6�T��}ɳ:�\�N�\�\��\0\�S>\�}Si�d\��\0��\'5�,4+xG\�~�\�\�rH�\�\�\�X�Supr���$\�,-Qs\�T\�V*�`N\�c)\ZU3B�Z_�\��EŵYQ�k詸8\�\nm�uZ�6B\��P0����F\�JӇ���V \�z*�;\�z�m;j��\'U��&\�ai\\;YXVCS$&�\�I�Y:\0�PqN�b��N�ʪ����d_��\�\�:o��ks�Q{�B\�wE͋j�\��胶\"ɺ˅�k3�\�M�~��\�H\�\0r�\�\'�]<e\�ب9d#�p�\r\�a�\�S\�ݘMyv�KD�X\'���\�N\�E<\'ܜ�S�\r8J�j�\Z�䝢\�<6�E2m�g(\0j\�o\0*L.pXf	,�`\0!1z�I�\n`z\"\�\�\�\'D_挺��e6\�\�ڏ͢��\0\�\�\�U��4�\�n]\�X��ܜ\�D�+!L���|Ц\�\�k\�O�D�{�ܻ��\\dy��D\�\�H������y��8B.,vf�\0�\�\��?^\�^d �\��B�\��S�\��A���\�d\"ܮ���\'�a��o-�\0F�pgh[���mt.��`���\�\���Dt\�n\�8\�i���M!�h(m6Z$,<\�\�a[`\�\�\�6\0�ySA1d]�KA�uN\�a?$i�Κ ܾs)���\�|�>\Zl<_$ ��沆�]�\�1�\�f\\N�?��ٯ�2\�qm��N\�B\'K�\�\\\\�]�)\�\�(k\�dZA��T^\�\�F\��\0\0��pZm6i�\�S �E�P�\�\�\���X\Z�͂tM(�㧧�\��\�f\�-�uS\'\�=˴/\�6���(t�\�\0\�a>-���\�t\�\�T\������:\nu7F`9e6\�O5�×ڌ>]TE�\�G\�\'\��u��{\�\�H#X�4r�2�\�G�XF\�]��\0�(؈�\�	U3���8\\��r�f���\�\�(l�\�H+PP\�\'EU� � �U\��Cr�;\�u�qk\�ӣ�\0dݖ�\�AM(�^\�デN{���_U>�O�<\�žj;���\�ݿ�q\0�\�\�0�Z�\0�\��\0��tV���]��xA~\�5G44�sxt�\�\�#�в�H�\�7�\�d$f\�#\�>�C�t�A� �G��Q\"r\�y�\�\�K�Z�[y7�!B��mS�\�\�9\�>�\�Ե\�J�<\"STs�\�9����\�g;G�ٖ�m�!��1h+\�_]S��ܬFX2!ʰ�6���	���:=~\n�L��P�������4�%n���^�U*Tp��Ԣx��h|�K\�wBJ�mɺ\"٦J��؟_U�h�����Y0\�J�\�p\�K��O�\�]\0\'���\�k�\�\�k~p��/\�@��\�>��$�T5΃�\0�[ة�hSCD�L��\�;i泑�#S�͂��3�]\��\�S]\"\�\�U\�јn�}h��\�24^Z\�:^ f�,CO��/\�5���-wM�f����A�=o\�QC�\�R�\0��_��DtNX��0��I\'xM2\�nP�m\�J�9čb�`\�Z-t\�l��蛬�VBA3�$k�� �:�\�_.���\�\�\�fcX\�u?�sƈ]\��Ji\�\�!m��)\��\�\��àF�\�\�$k&&U�\��J�\�-�l�P�^�쀰t\�3Y\�\��d�\�Um\��Cg؈\0\�Ԧ\� N������\0)�[\�Ӏ�G\�X��Z�)D۪�\�D�4\�5\�ΫI��A�m��6;*^+E�\�\��\��tMM�{\�/	��s\��A�}\�\�C\Z^\�ޤs9�\"ُ\�Q����/0l��N�ٱ�Os��T\�&d�ڛ��/\rt��\'�\�\�\�NK`�����V`@�Bni\�3�f�B<_�;��\�:#���Ge�EPZ�,LIU� \�0)\�n\\\�\�>+-s]�\�2-\��7D}\��\�u��NpV8}]\�) ��S���\�3hM�-neJ�N\�F\�A#�lz�@\n@�\�ӏ,~T]l�d^\�\�xWy$;`�k\�\�w���\"���?.�\�������Q\�<g\�KKA\�؃�\�&a6�Z�\�2��&粥��,��}B,\�\��5��*/{B\�kVh�\�\\ܺܢD��M?�\�O��\�\�[]�C-˲\�ӓ誷P�\�\�UHk��t+\�C��B\Z�8�\r8\���5�-G�4o�\�U\�<��z&�?rs�x<�ڳ��\n��!ڕO��y�N7�����P7�h��LsE\�N\�`3��5\�\��\0R�j�iS3�\�\�8��x\"Zl���0D}��%:�`^\�t7\"p.3\�p�:|��͘ݻ�B����#T�gc�U1L�tC�)�\�tq\�\�e�\�\�._n�}���k�<Is�\�,��ڠd`\�\"\�\�U\�\�c\�ۢs\�\����L��\�so��&@��AG\0�\�\�#~\0�c�\��Ev�9[\�TZN]�S\�tT\�&S\��a\�@\Z&;,\':9�F� e\��W�|�	ݳ�k�9\�5�\�\�(�@�\�Xz�gaU1\�~��z\'\�Zo.���\�4\�\�\�#�%3H\�T\��\0�\�\��UeB\�\�\�8T\�\��vZ�|��\�>�\�\�\�\�Y[��\�}\�s\n΂\�(�\�1\�t�Ц\�D�*�2�V&�����V��9�\�\\�\�.{\�}\nf0n�оݱ*���c&}\n�\�A�\�*�?\rg��	��#�\�\�}�l�\�\�@�\�\�\�}UfH]�M�)�@W\�9u��\0+\n�_o\�Qo+mp�\\+�FPP�JvF\� J#އ\�t]�)�v�+\�sE�i�*?ܐQ\�Q\�\�\�*�\0�� �j\��uCp\�\�\Z�\�۬�,k14Z\�Wjg\�tL\�pqq\�U*�\"5M\����|\0���u(\�\��\�w�\��Bv��=\��O�၃L[\��G�\�9\n�\0I��ӻ\Z��8�\�ʪ\�өr#���\�j\��U.ثH���\r\�%P\�\\%h�S\�� 6�r<�)�o\�R��F��UKb\'\��*\�i\�%�^=G���a$;�X�ӯ��\�2�\�<f#7yQ\�\�%C�\�7��\�7�\�rc\�\�\�÷�ʧ\��f�\�\�׽7	�g�?�z|(�\0��\�]\�&�V�z�\�=�©Db\�A�\�`*�\�J��\�\'�U1��>c�l\�v\�2k�Uo\�\�3\�D巒볜{��suM�����\�\�T ���\�#U�\�f�gO�\�\�M�?\�\0;�p��\�\�1\�\rW��v�%ت�|�E�\�\�w��_�&aT\�T\�ŅcHhZ�\��@�\�d)����\�&�&\�$\�I�\�\���\�\�MuE\�C��F��\��\���H\0\��\0k\�\�Z���sA\�S\�|c#�\�:\��C���!���\0h�J�\�]�XC�e����b�]\���g~]V�\0����\���6�-e\��h�Vw䷢\�j;V軒��j�Qp\�Jp\��	��\�s\�e�UR�\�\�v\� \�\�O�R\��������>K\�ܼ\�8�1��ڵv`ip7?$�`z�\�1\�\�\�\�\�i\�R��r�\�T��\�D�\�l���j���rO\�Sm�w%:�\��~ʵB�\�\ZLz\"ߴ5�zM��\�vN3\'vڍ�U31ϥP~%?\�,$\�t@X�P\�*-�\�]�jo\�-\�_���\�3U�\�\�f�\���b�=e>��v�T�9�T�\�6�X\���S\�TN&�0f�-\�T?��O`{�;&GT�`��\��&b\�\�\r�T(8פ\�\��cm1d\�J��l\�\�4Z]V\�\�Qb\�aB����\�\�\�o��܂u�B�\�T��N\�\�&D.\�\�\�\�?K�\�\�ܴ�^j�iҦ\�\�z\�\�Tg\�\�vcIŒo�`���?&W�\0�\�\�(������xv�\r�\�޿KH�#B\�\�E�L\rJcj\�\�\nT\�S�g�\�/�U�\�Z;E\�]��M\�\�B\�RrĕJ�>I��Yxn�F\�\�\�\�b�H30a�_�j��[�\�v\�V08U�<�h��l����.�㥺�J�v���ʃ*u,\�*\�2\�s\�UN�Y\rh�\����\�\�vU\0js�T(Hה\�;#�u�ov\�M\�V*�N\�͖�*T\�P�L�\Z!L5�q�]V7�H�YCڱ�V�q}l��\�ݪom\�\�B&\����\�j\�\�ʧڭ0!\�U:��,\�\�_\�:&�⠅�\�,C$i:pnoRe�\�\�\Z��--N�\�\�ʗ)�+�o�}��{�G-�*�\0rm\�e<\nӌt<�F�h�\�/���\�{y\�S\'XX���.y��w�=\��2�=�\��˔ ����v\�	\�1X:�4��G�?�쑯�:1�\�\nt07UlKᶧ�X�#\�g�e�����4N\�?����3\n(�8�U�{IfQ̻!��*8�>i�T*�+\��\�*����\�~AJ��<\�vn�����/(�ؼ�Ч���\�F�u���#\�:�zs�4+4? �,C�Wk\�2F]DD�\�wѫpa\��{jf�C�L\��\���^!R짾�]\�=U5J.�e��%2�	F� \�S9�K1ki�g�­D\�\�Rt<uN2���d	\�\�P\���qe>�|�*7\�e\np��[�(��A�tU�5\�Ӏ!\��Vel�֢b\�ܛ@\�1&�X�J-\��]V\Z�h\�a\�\0\"Bhj\�\�\��Ϳ�\����|�V^��\�\�>T�\�p��\�gd7�1\��vnO\�77]>J�`aI�ܽ	��\�X;f���\�$�\0Q\�5	\�M�����;�`#T��U���\n�\�\��S,ȧ��, 5�\��ʅ�isE\�\�>�;b,avC�hd ���r�7Q\�Qx\�[-\�\�U�\�P�\��`�tؘ:�\\ܽ5T�\0����R�\�\���\�\�%\�^�O�\�\ZT\�rƊ�&�5T@-A��Z�����v\�8\�>}\�\�b\�3!�d�Yj4T�V\�$�h�9��&�CK�Mv[h�u�ߌ->\�� ��\�z�HXj�\�@�\��Y˴(RsKC�b)R�S��\��c9��Z*,\�l*2\Z���\�R\�\���\�A�*-��.��b~$\�\Z��&!2�$�.(\n��e\��Qc�s��\�ho\�A��n�V�\�\�\�:o�~��V�!�\�\�O���s)��^�\0!�<\��\�K�\ZKf\r\�(����L�\��7��\�\�i���f\�!d\�9�\'f�j04@�X#�\�K6��х��V$\�7����3\�;Pm+\�h\�ʥ>p0��\�0N��T�Ҩ\��Wn�\�]UVwuH6�c\�\���ܞ�y/N!3��`�\�\�\�\�p�G)pv�O��\�\�5\�;<�{U�\�R�\�!��5N�p]�_�\0K��\��&~,d����I]\�\�����\�(T\Z�\�\�5L�\�a�\�/%�a\Z�\r���\0p$ڏ\"YK+~��T<^\�,\�\�V�ڪ�3|;�\��2�*A����3M�M\�Er�\�8\�m�X�5\�Whደ\��\'Ml1��\0n�\��F�n\�&ұ�T\�9�\��An\�\�P��q\�\�yؠ\��\'\��UF��\�\���a�\�`�e�\�;�\�h^ۧR\�Ev@�,;���\�\Z�\�;�9��{�jS\�\\\�����e�@�z*g�X�5��R\�@%7�\�\�%b`\�.Bś8tUFWR\�\�_=S\r�촂��V/\�C2�\�\�\�\�\�`K�צM)�\�Ƕ4�M\�\�\�mR�i�c\�YF	�d\�7\��\�\'=IoEV�k�Z3\�:�x�� �U\�7\�f�pՍ\�FPkh\�=�\"���_Uٽ���\0�bD\�v\�\�\�l�|ƨ�]Sc�\�Bp2z,CUFI.\r�Ew�\�|\\9�\�j�S��\0/�	������\�\�4��\�\���N�\�~P�F�1\�\�\�R\\��\�yD��X\�u8vg��R\�<Q��*g\���\nm�.\�\�Fj��ⷽvuӥE��\0+\n�-n\�m޷\�\�~\�p#�P��\�hP�\�-U�\�`��X��Qߏ�x�\�K��c\��9�T`\�\�.�cK�\�\Z�\�GD\�\0\':�nY2|�i���\��|@\�´�\�9�\0\�O�7�\Z\�S�V��\�\�ҫv_h\�K������9��\�D�����\�hv\�9GuS�m�Lo�\��\0\�bf�����\0Ϳ�G�{n��M���ɪ���G\�\�\�\�>7Xn\�\�\��t\���\�\�߲e0#`���T\�\�X�\�4\�6si	\��U\�\�&\�\�U[\rF�J�;\�5\�ПM��đ\�\�\��*�{w%\�F!�폖���`�N˨\'��\0��S\�Tg�]�!ڔ�\�#���_\�sf`\�?�\'�M\�\�i�eC\�eM��TH�w`u |ʫ�\�*�2i\��@H�ʟ�=\�<�� ם��\�?£����M��oEZ��\�\�a\�w�\�\Z6?u����$��T�\����\��(�^� \�pE�\�z���F��\n��\�a\Z�Yk.\�Â\�\�$*��p0@X A.�Ѹ	��p<\��t\�el\�\�\��Ǳ}��de�_l��z�UqXz\�\�0\�B\�(\��F}P�\�\��`�\�M��h4�٫�5�\0�SZ���c\�\�\�В>�J�H�L\�\�n�,�h�S^3�Z薁�����X�PuZFi��\�\�{G\�Q�1ݞ��ۻ>4�7\�}\�t>A�8\�\�\�\r5��}L��S�\��A�\"H5\�\n4��BI(�q��X�w�.tG\�Eٸ|\�\�O\�Mh\�ӡL�\�\�s\�\�\�\�m3k\�8\r�<,TAGd\n�6�D.!8B�[�i�\"S\�l���|�%���\�t4\0Ae���O$N�U\"5(8: Z\�\�\�SvXqԦ3;�\�lX\�:\"\�*�\ryl@\\�#u-\0frs��O\�Q���U\"\�\r\�\���h\rc.S\�\�V���C��֦�4OĵωG`�}Jk�ӝ\�U�$�h���f\�t\��\0$Ύ�\�\Z�����r�<-\�C5\�:�H\�K6�\'88\�GC;�I��){��	���Z-ae2\���ò�w\�<˭���\�.������Aj�;+\\o�#I���*9fE\�7���\�답n�oED\�$.z�\�\0��\�CI͢$��;/��Ht\�8�\�Fkr\�I\�滰�h�\�\�y�Ti܍S\�/�q,w�c�M\�=��;,*2\�\�t\�iyp\�0\�\��(GYU��z&\�MS��}\�~�Nc�b,C�2\�,T\�1�T\�\�`�\�\�84�n�\�\�#\�\�@��g ꩀA�:�S��\�Ďt*vR�\0C��V\�!\Z&x㪠\��F�\�S�Y�\�b{ћd��\�4\��\'\n���CEO�\�	��\�\'��ξ\�\�ʲ��ʹ �ԡ���GY��3˜\'\�l^SY����� �\�Fo$�����e)�mFkuk[DCsf)�����Y<ωD\�v��\�\�4%w-0x\���\�UÆ�r��\�eރ�m�D&P��w\�=9�,V���p��e��2\n����\�I�\�T�#\�l����<:μtA	��\0.�\�����T\�\�4�\�ɛ\\*㔝\�e\�vNTw	�x�\� ��u�h��r��U����O��\�w\0\�\�	�f�#E\�Skb/�G��\�3m4UcCeQ�\�\�V�Q\��7�\�\�\�\�X|L�M�k4�\�W\�d\�\�^��\�vߊf��1�\�9)����i�k+���0���^\"�N�,�B���M\���v�S��\�Z~k�\�\0\�I�[1���5*���Ӂ��߈\�B?(�F\�h�.�P$,��\�\�b��R�ʎ\"�Xʫ3m��x��\�H� \�i\0@T\�\�t2���i	\�T\�t�\Z\�<YP�\�3P��l	�3\�ZP��OEZ�k��)o\�U{�\���33Iʜ\�f�q@�\�\�\�\�:�\�e�f�M�\�\n\�LAM�#YE�\�\�Ipl\�R$jS���\r\�8Ǣ{�	�\��\���\�\�fXY\�Q��\r\�bj__GRQ�Q@�y\�~\�Q\�\0�(\�A���lU^BO�~ɓx���C ��&=\�\�[I���<\�P6�\�	�cd&l�\"S��	ě���f_2�@2���_�\�`\�U�\"\0Oq3<�7YI�Oy\\��\�]\�+�swT�\r\�T\�&\�\�\r�]od�׻؃��I�k^țj���\�#��\�\\�$S1!�\�=UW��\�\�<��q���J\'������]o	Ǽ�\�Tw�vSS6�g�·MV\�S��^���Dǃv�\�j��\':�/̠@�*��\�5�#t���\'ɓ�{�.�>\"!d�2�P\�9�$�����\�K��w�@o�\�6.��\�Dܩ\0]>�6Wy�Tڏn�6�tuY\�J.��.�q�|!V(X7r�GT�\�$L5ʯ\�o\�EG	��B<b\�-\��.\r=V\�\�\�.\�\��!�pMt�(\�\�y����md�wwD\� F��1�s�\�\�\�\�Ͳ���B\�d[t*��s��<\�\�-�T�\\�R����\�\�N�A	��F�ln��e\0P\�\�]seZ�Y�\Z\�\�M�r\�SOK���U\r�\�wN��U����XjO\���(\��4�\�j�<#�Zq<\nی�%m\�)?�x\�Sj6�Q��w5�\���Ъf\Z�\��M\�V�\�\�;�F\0Y��\��\�UXw�f�\�\�fz�#D@h�M\�˥\��P�\�7F`�A]\�6\\�i\�}�	��n����\�\�|����\ZJ�\��]\�6�&�J���\�TX�W&�\nrq�I��S�\�\�\�\0��JyD��x\�l���(�;)��j�Bɨ��\�H�B�P8^\�]�Y��f\\\�μl��`�L>\�\r��\\HEЪ@e8�\��\r�F�7L��\0�c��L�F�\0�5��cu\�\��)��-�@�D�tʻ�;O�[仺\0�\�M\0.\�\�`\�\�*\�zn�M\�V9�\�s\�ZH\�j�b=��3p�\�i��L�AR3D\�V\0or�\�j��\�>\�i7[�\�E��\'Us�\�\�-�֪5��T�]THQ\��/��\�0�GF��.\Zʤ\�\��L7;-4O\�%@\�7UD\rn�\���U�J�H��_k������u��S��ꀧ\Z�\�s\��U{N�PK˚n\�p�M\�J\�\�\�{�*�0X�ި\�\�S���,7�V\"Cj\�e�\�j=\��h`�a\�\0�\���\0\��\�T\�xv\�~K\�N�J��]�ǽݨk<S\"\Z��D)�Lx�\�\�)ݹ��ׅ���õ�\�:��U:�q�;��OX\�.�����,>Vȿ\�NsdD��\��0逜\�9�ULF\��͛n��\�S�\�\�V\�D�R���h�Q\�\�x!d\n�S�*�\ry	\�SF\�I)\�R1\�I-u�j	\�UF4\�Sʀ�\�\�\�\�5*��)\n�\�\'�\0M�Ma4\�p\�\�iU?�Y���*5\���G�\�>�.C\�-�/���h�����l{�%7]��uI\�\�[\�eZ�\��\�\�t��oyO\n���\�(_D\���*���L�l>+	�xdx�\�\�\�ưQy�\��G�1�|1�\r\��M�j�N%ً��\�S��21�\0F�a�VMƅ9\����\�c\�UjH\�)�Ⱥ,�\r\�\�\�%��G�\�p�\"�jz���\�n��k�O�O�\n8Q_=Vo�\��2\�\'�a*�Kf\�\Z�l6��1*�-��)Mfj��)	�\�L,�@-	�p�\�ff��>\n�\�\�}��j;3�5�^��\0\�ݜ�\�eG��\�U_\�\�\�q�r-�4\n���c�׺r��%3�{\'\����\�\�\�\��4\�f\�X\�z\�Vd�rӻ�\�\�O�a�����D\0-\rӄ\�@��\�\�5M& \�;\����\��*Q\�\�~<>K^0�F\�\�\��tQ\�piZ�\�\�^bBc��',1),(2,'andream12','1ef1a7668d9078e99b8d0080c6fab3b7','2017-05-21',NULL,1),(3,'josemar27','61af2d40a529d40298efaee15a7f4f87','2018-04-20',_binary '�\��\�\0JFIF\0\0\0\0\0\0�\�\0C\0�\�\0C�\�\0\0\0\"\0�\�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0	�\�\0\0\0\0\0\0\0\0\0\0\0\0\0�\�\0\0\0\0A!\'þ\�$�`J��,d\�N\0\0\�\nL$/H����Y oC��(�X�U�\�GE��Ӆ5LL[\�P\0�\�Dɇ\�\�.W=\�!Ȇ}uZ|��\��\�\�\�<�\�W\�m�Þ\�:\�j\�r{^�\�\�=L;}��\�\�\�̛[~�\��~C\�XU|�Vо�\�~e\�yo��u>�\�U��]\�(��ٽ��0�T\�nx\0�ND\�n��R(d�\�\�,P�$J2(��2��9@\�@� &%Sq P��8Z�BN��(\�\�V$r�1�``#��\�B�����\r\�\'��d%\�\0J�+b��U\\�\"�IDc�)Pe�\�t`P\0\�$<6D�v·\��5\�1\�<�\�\��\��;�\�\�\Z\�fߏ[u�İQ��!ğl\�ҭ�\�\�\�/vJJ���-v[�^��]�#�M\"ʭ�f�j�XVѶ\�n|\�\�v>�Jx\�O\�t�έ9\�\�<�d\�\n�N�\0�s�\�1#�I8�h��Spb+c�\�r42`e�)���U ��e ڇH\�cp,?���U9k%9X\0�\�\n\\b\��2�\�I���I�T��\�q�ɵ|dU[D�%\0�\��\0\0h�\�\�rJ�8�V\0=�J�]Y�s&pD����f�\��8G�:X�9\�Lv�\�\�\�i�\�\���\�/�\�¨I5c!m!`�E[ew�i�i�\�6xu\\�ҞjguZ\�{t\�sj�1�\�\�\�#zd���*x��A�f\�!���,��o>mK�\���\�\���<\�[\�\�:\�u\n\�A7u�\n\�M3<M\�\�$b��1�Jd���\�<\n�\�DB\��P���A+(&�V\�rVx@\\�C��$:*ĥU\"���Q1��\�!\��L��`h<\nɜ�H��%\"�`$�A\00�L\�)�1~\�X*+� �СhSt�e\r\\��;�\�\��\�L��*��Nur\�)[8+��[��\�)\�QZ`Z��\�\Z^_\�U}�T���薼z�N�̯M$������,����\�+/S���~�\�A�\�4\�l����(\�4}*�x�Wd|�P/�zo��/�\�\�/6\�\�[�dAfY�$��M�Wn�!ź�Q�]�\n\�0\�dVK\�DJ2!+(¬*b��S�\�8\����g����PSVB\ng\�0��x\���(\�15SU�8�	��� `(PRn2m/n\�t/�*�%\�P(��#�ڨ�\n�S=\�\��\\U	\��&)�Yf\�*�\�4l�X\�{�R1%i\�\�\�X���tu5h�HF�Y\�s\�δ\�\�\�\�\�;B\��\�=�j�Odn\�2qlqKBO�Yz����\�2��\�j�\�m\�K}U�[K��i\n\�\�ݒ���t&-~�}\�\�I�~\�X\��[\��R\���T���5��0P)H\'+\�8@��J�O\��N\04)�A�\n~��b\�7��$� &(�šΑ���*&D�ĤP�\n!2K#q��\"BO\�\0���N/�	@?\n\�SJ`e�{�8stg(+@���f�o\�|\�T\�ѝnb��^�\'�\�|���\�լ\�ۭ�B�[e\�\�\�im\�h۽vem�\�k\�\�tj�\�H�OZ+|\�wu�\�㴚T,tK⼒R(����.w�#an�Ǯ�9]��T\'A�n[\rAp\�J\�K\�\��)���<a�Oea�W�\�~W�s�zr\�\�}�\�\�$��͓I�Qt*(9[Jt΄��0�@7�j ID�hd�At�S\�T\�8��&\�0$(�H&��Е5�n!\�U��	:b&S�t\�n)�ӈ�CpH�8(@2�\��#���¨�ap�\�\�R�\�$\��g��\�\���i�\�)�j��l�=a��\�ݾ�.���\�i-\�#��Ք\�s�q,5w�\�b�\�\�붍	vB��f�4h�g���ː��U\�|�V��d�e\'\0��j�}P\�&�,\�\�\�Q�E\\��怺GX\"\�ٰ�dj\�u�\�ܺ�\�#4U��QT\�ڻ�-/\�9\�\0ݹ�h:̴\�\']b��iW�jئL\����f���9Yx\�(\0�-<`R�D��>xH�qQ\�\�rPp��R\�W �\��95YS0\ZN�(���)���rk�\\1\n,\�-���y\\_�M\���j�I\�b+[\�\��y���\�\�4\�	KO��\0�i�%a�\Z^?IVD\��\�\�n.�\0Yj�\']\�u}�\�q�a����kn�60-�U�L7J%O�\�.sh�:��E\"��\�^\�\�]\\\�\�ൺ\�\�Lypi\�X\��\�kS�SI6��(aGua��\�Dݢ&\�\n�\"�\Z/��\�W}\Z��g\�>K\�h�b���l�lO��A R,P0I\�a\�P�\0HrJ `8\0Zp�q�Z&�H��[q�C*�¨p\���B�\�\�@\�D�r\�*$��d\�SQbɈ:�v�F�C�.��S^_�F�NT��<�\�\�RΌ\'\��O癍�\�)V4(\�5:ܩk�c^\�r6u��tC=�N\��CO����]jmlȖ\�\�\�\�\�KD���L�ح�\�\�6Ed\�\\��6ӭ_E\�!\Zeh릍�S�*՗\'.�\�\�m7X�l��,L\�_)�\�\\�\�\�^�ʭǓ5\�\��Ⱅ؋^t�6VZV\�]���>P���h\�v�w�\Z\�\�_K�Uh#I~�̢���\�\Z�\0��b\�3����xS��!��1O\�XT\�M�\�\�c\��S�@D�!&\�\"�S��t\�x\�swqPMBY9d��\�R�Ԋ��	d��5�d�_\�\�\�{\\�˺z\�(u���6N\�L4��\�\Z\�nwzuP􋅓>�\�ӨY\�מ\�ެ��f�{�\�6\�,�h\�k\�I�\�L��njAPi\�ݘ\�\�\�\�	CL�4�)\��,/\ZB0�6K\"ɤj����=���\�Du\�ɯ&KK�z\�0�\�-�q�m¹~O+d�\�\�ts�`���\�\�\��7I���\�\�͒��n1�חk�v�\�\�=\�zg/R�y�\�P��\�\"�5H\�$\'\�ᝈs��TM�\�B�w)1JXWM@3��\�8\0EX�\�7](�2�$\'\�(�\�`\nT��8\�5l1�#�XEH\���z�7-��+�\�qf��aeV��+\�kԃiϠ\��\�x��l\�\rg�ޥN\�\�f\�3�NMf\�5\"Z��i`EociFU\�\�\�B2EÄH\�<ۈ7p-*\�P\�\Z�̤�(���\�\�\��NY7P5k#ã�a�\\4p\�DY�)FS-k$�j\�Vk�V�1\�Xǩi\Z����\�̝??\0U�_,\���HQ~\�XB\�[\���]ӟC��\�2i�z?\�����\�<݄�U\n\��9 8&�l~(�\'q-@9yX講!8ʆL�\�(()��e2\�N*\� �ć�P������G�Mb,\0\�\���\�\�\�CswN�\�\��\�[(gN��zb.\����)\�D\��\�2\�3�\�^�~�y�p}Lt\�RY:ΥL�\�yd�e)1�YÆ\�:^\n�`\�u\"<��|cVQđr\�9!&�,AM��	��Lb�\�\�8�t\���\�[2Q�gi6H��m��В�50��A����r\�_��z������:^r\�d�l5#W:\�VĨ�\�պm\�u����IԨ��{6Bk\�w��\�\�\ZB�\�*��a9x�7$�lDx\��@I p�y#�C�\�P1��L�\nK�8N@8%\�Rq\"b(��)�&2f�T\�`Z\��\0�t\���L\�~\�\�W\����\��\�U֚e�R\�N���O\�M�\�{� ��\�u$͵w*��)*�ўI\�G��\�\�Wg\�\�q]�DP*PW%|UG!&L\�ʴp\�	�QWP���ud\�e�Ɓ ѣb�JH����\�\�Tb\��\�L,a%�4\�6��\�M�\�g5\�!O�V.\�T�}\r^\�\��>�\�S\�{_\\�\�X�3˧%=\�;t�ز�MQn\�f�\�<\�}	r\�+�e<wr�kܛ�\�0J Ձ\���P�������kEW�I\�&r�\'\�`�UNN0�T�+uY��3����\�\�\�R��y�sm�wy-��F�\�[\�S|	��\�\�[3�s�ק�ަMA{N�0�+�=\'\�Ǐl��%�\�p�c;A���enY\r\n2��\�;t�,\�͈��LP\�v�3�=��:\�ҭ�E%*�v��\�`\�l�W\r/]�����lL�,{W��=e��-Tdl�\'��b���\�f\��c\��>y\�y����]�\\O@\��IZd)7�\�]�/Zy\�\"�H\\��?5\�dW˩�\�Ea�A@\�!@\�\�0@	�a\�( ��q\�R9RW<\�S��Q+Nʓ�\0PF\��4!T+(��D�&bڟ,yZ\�}Ǒf鬞�r��?YϪ£X���\�mHզٳg;?\�N\�2�\�\�^R8A���\�ݢ)c�\'\"\�-2\�ْM\�/\'I�ek���dT\�(\�B�\�\"c�\�*�5kPCtkCx\�v1\�匚8\�\�:j\"դ\�B��[\�vK;�\�GK\�#0a4�\r\�\"T�\�\�\��\�[sգ�p,��Ŀ56�r���\��\�G\�y�,nd\�x\�3�Ǩ\�G��g��\�u�^�t\�L9h\�\����\��t\�Ha)�<P@D�\0uc���T\�\�\n 1^&q�T\�L�\0�1\�\���E\"�E%�D\�!A\�2q|�F{�)ge�I9{k�e\�X�\�1d�\�\�.\�~��\�m<?Q7%?��\�\�:\�c(\�e��$\�\'l������^�k(\�\�W\�hYE\�eHH\�Y\�G;3V�\�X��\�X�G4tu�%\�HNqQ��7n\�\�J��F$���lq_�$b\�=��z���,L{\�\n�#�v��\r�6\�\�\r\�M]b�`��,?�=QD\�\�E�\�7-\'O��\�\�O�i\�����\�<Ǝ�}\�\�\"=\�\�Q)T\�&�NQ\�,��Q\�$I\� �r�\�Ix\nB���\�!8:=2J@2J\�М8\�\�\�\�2�\�\0\�2�ʚ\�]��x�/�6s<^��{o0��pɮ\�M�ܫz�\�z�{[�X��\����\�7\'N�T\0\�J\�\�n\�W3\�y[lU�\��\�T�\�M7\�K�M^YT�{Ѿ�gmBm0(\Z �\�k\�i\����\"X\�H�cL�+�\�Uj�E���N2lA�\�t�\�dĔ���EuGfY\�]�D:�c	V�F\�Mĵ1P�fE&2\�m0�\�VZp`�/�2����Ľ[_?K���Qeh��f\���\�\�\�1\n&ˬ�r\�\�A��,EH\n4HH����+s<9\0P����ܒ\�\"\��5��!*	L��rؠa\�t���p��DT���\��\�2y\'^��[\�{�M\'�E\�WsK<Z�Ǧ�\�\�oH�W�\�Ր�\�<�D��Hh]\�̅\�ɣ`�_�\�L����H�(�ǆ��ˑ�\�U9hv�\�(\�\��B^��R#���Y�=-�ŞA��\�\�d�	$h\�dX�s$�!MU\�ھ\"�cw�\�\�#��n\�B��\�e`�\�#ð$��&\n\�U\'R�\�5p�;V̹\�_\�z*6%\�ls�Ċ�DKYE�\Zz�P}g�\�\�~[\�ϗ��\�\�*���L�v�1�Ē]\'\nqN�]7P9R�,�\�1A\�\�\�\�;0/&\"�NS�!�A!#)�\��+\�;�b�ID\�P;��\�OC\�Aݛ��gb�W�i�KGV\�\\m�������\'\�ɝ�Y:&\Z�\�r�,2�4�vmud�����Ĉi\�J��/\�dt�pG�����q\�\�:B<�c\'m\���\0=M\�K+Eb�ة\�kC�(�\�!`����d\�ZYp�G�\�j�NN9Z0\�\�@HY\�@@!$\���,HN��Q\�V�,�Ʃ�2��s�\Z����0�@\�\�cr\�\�i\�\�/<\�Mj�4�3�Ў�򞄨�\�\�̊�K�x\�T\���Ss*\'\��@\�\n`�2��\�#)\�\�u\�JP�+7\n�\��\� �|a�b�,\�\��Ϝ�\\?\�y\�?Ma��MΚz\��f\�r\\�\�\�7�`�\�N��#\��\r�\�j�\�1�J#$�,\�U\��\�	~xY\�\�v\�\�ά\��;\�H�*\�*��57S&�� d���\��1\�\Z=K��R\�a�FIU\�\�`��4EAi��\�Y��8\�k�׫\�\�uh�\�[r9 ��t�t�5|�W\n���;J�~\�]t�*��f�T{���\��\�4�\�:�\�\�g�\�F�t\��j��#\�<W�0���p��*�� !��L!�\�BQ\�\0Nbb$@�9DJ�I�X&C��Y��8�⁊&V!���!�ʔl\�Q2��)[����G��d\�\�j���D1ϥΤ��v]\�B\�r=$���E\�2jμf\�].\�\�w�u�\"���Ù(\�3!*��h�Hɬp\�Ʋ�\�\�u\�\�J2,\�ᖄ\���w�ڤ����eQ6�\�\�pWh\�V�\�o%��r:�[�P\�ֽn�V����\Z%G\�Q\�ܪ�D\�\n�w\na\�2\�b\����լ\���\���h�\�mj\�I\�p�zn���x\�\�x�\�ܺ&�\�}K�\0����yC��]��r(H��\�`�Hb��)T \�E;�2|\0	�pJBS���K\�z\�S:g �	YxIИ@\�L��j\�9C\�\�w����H7?�\�\�n�Kxh\���C\'=P�\�\�h���\��\�o�{\�\�UԯJ%:$Ͻ�����_0���\�\�\�̰~\�\�\�	j�X�\�\�R�\�#}m�\�\�&�>>2\�ӑ8h�Z�Rx\�\�j\�A�H�*jn\�u\�-\�ΰ6,�%Q\�]M\�F>�I���\�a\�\�4�Y*H\�X���Y�H\�\�R��D�\�fx\�\�3fT\�\Z�\����Y�\�}E\�^}��s�kgd�z�Ǿ�\�v��j����*\�V⚤b\�E�8��LD��)����t\"S��\\�9_�r\�H^3���=UO�}\�_ex�ǅ��\�y2\�\�%+�H\�\�\�Ti�\�\�Z��\\��f�\�3gqԋY*v���\�]%g \� ~�6e4�v�\�L\�\\��ʋg��A\�\�\�\�tn�]�g(�)�$;�P\�t��9K��\�\��]2��2F�\�\�\�$IV����\�SG\�]\\��\�v�1���;ǲ:Z\"���[ʫ\"\��\'d��d�EE\�\'�\�#��#J7R\"ď��V\�P\�hx\�\�L=Z\�\\\�p����]��^+R�n\�\�\�\��-�\�\"��o�\�Wo>7\�2\r6�A@\��Q!1,P0��)D^qHE\nA��Q`b\n�\�T\0\�pVL\�(^,��)��\�*R<\�\�>wx�i�h��;�\�����Zd}v8�`�\�#l�)E>\��\�!%)\�\�\rp��\�C\�-�)\�\\\�в\�\�$�#�\�c\�\�A\�Et\�&ӆ\�VF=\�\"\�d�A�d�#S_S�+�+p�$t\�8AJt9AE�F0�q]\�\�\�W\�E�\�C=KAf��\�t\�\�xC�l���{!c\�@\�%\�#\�\�UAks�zY\�^I�f��7Q?\\�����}Gwc\0ܳ\�\�|X�,\�y��U����\n\�Y4hNM�y/L�|l�[(SHE8��\�\�\��	G�\0��\�a�I\�J|�H���\0�\�\�7=\�#\Z%{¾\��{�V�HF�y\Z^�l�u�A��&��\�\�\n\�ɇ�8\�\�\���튕\��^\�N�/E��5\�\�\�\�\�	�\�(�d�̧��\��\�\����~o^4�=��\���p\��\�>m��֬�\�dk\�\�\�^�Gڣ\��\�t���r؁��U\�\�}\�\�\�NA]~��&V�	�R^�3�g\�6�\�.E�\�r�\�V\�Li%]�7*���\�\�4�}\�3\�R+6�\�\�e^5:\�\�\�B�G\0�^��Պ7b�F�m\�z�z\"j�/\�\�N�e/\��\�Zm�y�&�g�p\"�5\�V(���\�D�`e ��qM\�X�ܨ\\�Edd�q�!\r\'(������,�S��\�|���ӿå]i;�{�4\�=�\r�|�.8z\�h�h4�\�\'\�K�\��2OZ���h\�M\�՘\�k�\09)��jxu~\�Ҥ�T:�}��H�Ӊ�r��2�m�ޯ\�\�rT����˛\��癮|��\�L\�\�.\�#(O(\�k\�rMm\�\�\�u�<ԭrP\�\�\�\�ʲd\n`\�JM��+��EI���9ɷrϩ�\��&��բu\�Od.Ͱ\�\�\�v���V�W;\�;6\�\�� \�Gٖ�	]�u=��\��ڽ\n�3k�\�->V.���l�\�>r�\'�:�z���=\��V-3=\�Z�k�w�s���\�|��I\�&���p\"K\�\n�TPR���\�H\�!DL��\�\��\"��M�$!\�yB�&)�����2rh��}}�ok�\\\�!�]*9�mua�ݚX#Ph�t\�]_6\�\�\�p\�5\��=�\�l���w[ۃ\�=�s\�\��\�ѹ�k(�.�E~2}\�H!�Õ��^n\�a�h\�%\���[\� �ѐ׷x\�*�\�OGǙ�jX\�w\���\�\�<{�\�\�\���F�$�X%�m\�È���\�ڏm�i\�\�4�\�w��h�.G�kY5��ͼ\�-o�՗��\�.��Y�5ݞ�\�\�\�$.�VYڣ\�\�[\�\�\�R�i�e\�+~ːQ\�ս��ߎ�a�\�z���i\�\�c�V�f���g�|G͡\�\�\�o\�U���x\\��E\\\�!\�\�G�J`N`\�����Q)\�0��\0Us�{�S0^�U (�+p�S��$U��\�\�G���9Kl;��,\�\�[sM\�/j٧�;�˗�t��\�\�!�ݍ��\�Cm�>w=��%\n»\�뚾\�=\�R��P\�v֗:4)0��\�sU�\�U�\�^\�\r6�[K/�T��cX\�r��\�f8?�\Zj\�\�_I\��˱���ǰ<\��ޑ�\�[P�X�����z\�6��\�}Q\�/\�\�\�ȣ�z��\�ϧjnpws9\�+j�4|��zI �\�a����(�\�jbvԪ|���;z��Y�{n|\�\"Z,��x���\rG�H<m\�|\�E%\�\���\�^k׹㖹F\�\�ʵ\�p\��=R�\�\�r|QVL\�1D��+\0S�\�!\�RCA��L��<\�ɴQT\�\�!c(U\'\�r�N�D�\�eW�\Z�\'\���Ϣ\�XkS9�W}��a�\�#��h\�\�@�ux���i5\�R��>>�r]fZ\�0�QXzRt�ıt���z��}ĆN�I\�ht\�ש�\��t�5\�b$\�\�d\�i[�2�2�\��_�\�kk3h7<N�n\�l�%z\�\�\�̷\�\Z�;�\��}��M��}dW>ώ\Zo�|�~(7\��go���ɴ����E��Ӫ[:��.\�gO\�.��\�,\��\�\�8Q�\�����4M\�\�k\�1ߥS\��e�e���d��\�ͩє\�\�VvsgB+S\�\����Sz�w\�:>Y�b�(J9<��z\��Nv�\0J\�k6\�늳s���%R?8J�SQT)�8A�\0\�\0�s<*k&Ӎ\�#��\ZVMɜ$İ�B�Q��?��}\�����\���ҳqJѡX\��G�ϗ\�k\�Ώ-M\�����\�W�zq\��\�\�Vzg�\�\�#nGI�3\�y:	1��Ub����~Y�b:��\�]Je�\�\��\�^;�w5�5d�ж��\�\�Ѕ�s���;d��Q�k:\�\�ؼï>�c^ݵv\�df8~�\�R\�x�Y�=�\�}��I�֜������Rx���KI�\�#i+�5\�,�ǅ\��O�������ڎ��&�E\�3u-3\�n\'+�\�xl�J\�\�Ѵo5j���n�]�m^\�h\����iŞ\�η\��=�{_\�ĸJ�\�c˯Gu]�����ײy=]z~=\���\�+�2��\�q\� G5T�L�R�1\0Gr� x�W���L�&Hp�cD�\�V\�C��U���\�O9�9�\\eʽ\�J\�\���;�k���\�\�?IV���;uĴ\�)>{�z\�\�>�\��jn�\�\�\�Y���;uk>�w|�\nfc[�Ȩ���\�\�xұ�A�|痕�\���\�\�Vkz�o��y��w<���c$\��>2��K�4hI�\�˔y�\�� �~N\�\�o*{�{Uu_\��O�\�Q���\�n�w\�hFE\�~S��˗\�~Ը\�\��vN�m�Y��\�\'0�G��S�\�\�{�!\���-*\�2-�ߐ}\�:x/����r�7��8�\Z�1\�y\�Z�\�����X\�j6f�\�\�3\�M\�|\�X\��8+�}6V\�^��\�vWc=����\�\�\�jOy/-鎲��HL!�L��Bb T�d����@@\���\�k\�\�o`\�+*B9�`�Gb�\0�LX=\��9\�hâ�2I\�\�)m\�n\\�\0j�\�\�o��h��v�Ԡm�OWd���ɶ\�W\�o��\�\�{�ESj��>�n�ETgCN\\\n��@ܑ\Z5a\�\���m��ljj���\0<=��Ѯr�\�\�\�\�P�uhz7Ь���KX���+\��}��\�>}\�\�Mc\Z\�\�\�\��\�ٻH=S5ֳ7�Ǿ>�%\�K\�v\�V�+ޙ����H���֦��\�<m�ek\�A\��?<\�=�S�]k��\r̳\�\�ϩ;$Ba̬o\�#Hϡiɵ��Z\�\�7\rh\�#���}���\�\�Y.y\��\�7�\�\�m0\�\�\�ҽ��\�^3\�\�]���\�\�\��P��r\"�`*�QP��ƀ��$\���m^!\�\��\�\���\�2L��V$\�v�D.c�3�=i�t9>`�-/C\�x\�8�J\�y&\�&X\�\�\�ߪ�o����IQ�G\�c�c�׵�e�<\�q�Բ\��;ٴ��#]9z����>2d�R�f飨#\�ᦪm�G����\�j��\ZCצY�v5��/nT�\�_�x\�O\'\����\�\�\�\�l]p=\�\�\�6�B�)�K\�(\�/�j\Zc��\�O���\���:W0\�����v<��r\�t\�%�L\�ZMfQ��%.R79����Z�1�����%�\�Vl��:2\���\��S\�\�\'\�2�\�\�\�ު�\�_\�<�>=\�?\�o���\\=\�\��\'1Dܷ��\�FPT\�i\�1�D�\��x�!���Q%�R!F)�c\"�)\�O�\�̐s�B��g�\�=�W�\�4x=\�4FJ\�<eڝ�ʾ\n��ps�N��rW�\�/\rcK\�PI�{\��v��йh�\�-qQ2Y�\�\�eT\Z\n\�s)\n7BBqRr�8\�iP��\�\�\�\�V������K9\�i_4=uᮿ�\�=�o8�Tk�<\���J2\�֩0\�ۤ]\�Z�\�F��gz9�2�[�\�?�\�\�`e��$��5_O�ɠvX�4\�\�m\�\�\�ʱ�ģlTYI�Z^T�T.qJ�ϘH:7�\�\�\�\�\�1Ӽ}\�����<\�\�dF)�\�4䚡\�Lz\\+���\�\�o��DT�L\�\�\�\�L+r\�q*g\�\�\�xK\�+N�Q(��`L\�*\�\�\�;��$<6�xE�|aP0�R�B�j�,\0)�k\�\�<�=�\�;W̺yXTu�޾t4cW\�<\�z-�%���H��\�Ի\�Gw?Ж\�B�e&XIQ}{\��ْt�\�^\�\�B�]ڨ\�zqm�u_~�K$�Ό��\�Rkl��6h\�Lf�U\�gB3�8w\�vy��7:��TIJG�\�\�>D\�Y\��\Z\Zv)`�~z\�.�\�\�͓\�6k9�*~\����\�y��V�H\�w\�\�g/~x��\�Ƽ�f�ƋhMn\��h���\�e\�\'z\�\�Rt|\�q@,\�00�\�+�\0\�oS\�\�-\�\�=ߞ�И�я\�\�-�*�\�\�)�Ӵ^��a+m�\��n���#�\�8&py#\��LE�]5D�\�R�\'LC$`e?�Q@?+�\0E]8��If\�T\�I\��\�\�l3�\�.\�O�<寝{����o��N9�\�\��]\�㶺\�Vm��o��K}f޺l\�\�R�\�,\�J�\r�κz����)G��\�-�\�k��\�;��^��U�\�\�z�=5\�:극\�\��c{��\�yV�t�\�$�\�/=z\��]/z?\�[%\Z)��TngJ)\�KF�j\�H����R-m�+�2F�\��\��J5�<ӆVߝ\\N?<~�U��^\�i�\�\�\�\�K\��r\�c\�|NU\��l_��b}�K\�\"\�~�!�r=o�\��0?\�\�\�\�!�W�r���,\�k>��?\�\�^\�q�\�\�-R6�+�Y\�\�\�8�\�\�z�[�F\�\�+�0�/�d��p��	�\�\�D\�\n��RPA\'\Z�\"\�rj��pc��\0\����\�R\Z�E�r�3\�E%BG��4��\��PX���\Zt;C\�w#\�\�S$\�ũ\��\�w�\�M�c��m�ʲ8�K\�kv�\�&�[\�\�b���s?͒K\�UYCeo�\�\�$uً�\�\�6l�K��!�Ɩ\�#� \�\��\�\�TH\�_���i\�c��۲���撴D1\�!,7E±nM�\�\�ɝ\n,\�eQQ\�-\�h\�M/F\\\�\����\�S.�\�ͽ\n\�\��꾴%�|�-\�&w�랳)o\�\�-�L��!=�ԊЙ\�C�VSg��e��\�[�>�q�ʲS+�*dz�G��Uҳ_dٽM#:\�\�vi��:��!���(c\�A\�����JU�+W8�%��\�&\'M�\�\��\�z�\�\�U*c�\�@\�\rɨE�5\�^��\��\�\��u\�=:]F�\�+�F���_�B\�\�\�k\�VL\����z�\nM�.�;�\�S�8�\�;ag[��\�3\�\�`gyw\r\�YA\�N\�\�A3�h��Z(;U\�h�3m����Wmw#�\�2tQ�[\\:S��\�&;��\�\�ї�!c7FY_���Q=���,\�x\�\�\����\�\�\�\"a&\�sʹ���\�)�;H�hn\�y0	�\�v4vW�A5�gSW\�\�\�^\�t\�\Z\�\Zn�! �b8�Y)�x�3�f\��\�7���\�-]�\'[]��R\�+f9|�\nd\�(\0b�\�+�:@�Ȱ\�^Bc	l��!\�P*� J�K\�^(c��\�H\�`c��4�)d9,}�\�W��|�\��}��\�a\�j��r�l\��ȡd(U����Wze�/~���\\�\�2�\�I\�Z\�)F�sP�c6�+\"��r\�;NB\�\�El�\�~@�4��4=f[/-	n�\Z�u��h�~�g�\�\�k\�i��#H\Z7\�,�����M�(\��\�rKNa\�\�!Q������[h�}k\'��ons\�M�Z��u}rn\"ߚ�K4EZX(�\Z�\"���\���Ti��Xb(ع�\���3\�u����r\���P�B�O��\�4\�5���\�ٟ\�� N\�/�\�\� �(�T@\�X��\r\0����	J�p2�X�\�4U3�\'BP01��tz�NC�ĥP�ב�O-�k\�w\��u�J0\�ds�r49�bɃ$�V\�|\�A�2|\�N����h�z�M\�\�l�\\���\�1\�M6YO\�얗��y��6%\�]�\�[3��c6\��h)�\\ni�\��\����\�(٨#�J4\�\\\"͝�\�<>�ޯּg�׻\\W5^\rE�c\�V�°�\�O]+\�4��\'S�\n]�Z\���2�\�\�u诨s��LJB�vE�8䵬K\�\�_�@g��\\�u+]�\�`<D�cU�S�T\�\\]\�z\�7X�&��z\�����hiز�\�\�\�χ \�t:`%D��\'��`��10�k�/(\�\nHY>L���\�8��\"�H^0V Sa� �7G\�6��\Zϥ�\Z�*��6\�}�vk��&�\�\�\�\"\�b�\�\�\�c\�=\�\�ɢ\�\�퓑o\'^�V���\�K\�s<�ڼ�j�H�\�_�\��iM8,��t�k\\��\�j\����\�|�\�8W��\�\�\�H��D1���\������m|�w\\�>\�7�3\�ۮm;�a\nz;s,\�s_1Gik\�\�	�թ\�\�\���\0?�b�\�~�ͷIz\�\�3ru\����3\�M|�}\�\���/L�ra[6��b��\�\�\�E�jp�\'6c[�Tm\��3Tǭv_yZ�\�\'��\�\�5k�\�>A1\�\�\Z�<kL\�\�D倦LP�A\�E`��9ܫ\"w��j����Q\'m\�HSRXn:K\0��UEl\�(��.0Kyf\�Z\�/�}A\rx\�ɹj��\�f\�|�#\'��t���A\�\�~\�\�\n\�\��\0:�Ʋ�h�\�\�VQ4NY+3\�L�\�i�BE�k�ĥ}��Ҭ3��43J\�V\�!`\�G�2���N�E�\�^7\�\�n�_G\�+G�3��\�l�]g3�M�_�\�VzS\�!_z�\�\\\���S+]eJ\������XSMw^��Sd\�\�ij��\�WS9�\�\�++j\�l�sH\��p\��\�s�w(�Ak��yRFB\�@L��\\S�;�\�\�s=%9&w���\�3v������\�!��<\�)�N	Yx�tL�#�\n���T���)X���\�\\9\�]C�\� �%P\�7<\0Թ��\�S�)�9\�x�GVɮ\�\�hiʨ\�2�bT�j=\�<��\�Į[	\�9����\�|�\�F}n���U6\�\�ҧ,��$\�봏��!��Չ�4�\"�a�\�N]\�D֪H�h\�\����rn\Z\�u\�+#��J��Ź�w�*\�a\rY;�\��i�6Y(�9j\\�&\�.ا6h\�&�Uj����-,�o�Q�>�Jf3�\��n�b�\�^�p�|.�X��*C<,d�t\�nb\�\�5k4\r�\�[:3D\�J��\�~\��v.&5INUr�\�\�\��IR�����C>��%�\rư&r)AX�VQ��\�	\�\���;��	9Qat\�\�\Z�H;�Ū\�Gt�9Ż\����/=L�%,W�d���-\�w0����y\�%\r)N�\�h������Yr^�3NӼ`��-K֔)!\nְ\�tj�+ҝ��=i��\r6H\�\Z�*Q��\"���c*�\�+ͭ/�\�\�p��\�CmgT�66\�{s\�\�ϼ7ԥ\�e�\�!;\r�I��:J\�e�4�꾰�\�+\�{M�B�b�\r���g�\�T�ׇ0rD�b�%\�bQ_��|���H\ndd�K\���2\�κ�k�^��f\ng*��Q�L\�\r�K\�\ng�!��\�\�\0\�D��ú\�/=\�U@\�9AF�!�u*�\�g�b���br1dR�/u\rM�;~�\�풩+~�\��C��\�{��\�f>Lg!�\nũ\�75\�t�,�s�\����X�\��M�\�\�?\0�\�\�7Ԯ\��P^\�L<]��b�\�\�eqcxT\�-�.bae��-�\�ďvf\�X���I�H��b�\�D\�Ӷ�\rp�fԏ8�v*\�$Y$�%\�z�\�{X��A�l\��Z��\�\�N@htE����Xi\�\����g=V\�]ҡ\�+1��F����żx\�\�R+\�1�\�\n	Xp�ՑD�I��,�\��b\Z�`���\�\��b�DH1W\0氦\�\�1X�\�\�9UX�p<\\�\�s�x9�E���I\�m4�쾴W\�\�ڟ��\\�� ��)\�i���KeJ\�\�\�\�(����S/�\�L�t�Գ\�\�U\�R\�$�Mn$[7��\n\�t;r\��$�hf�&/�\�\�\�\�}�N�2\�\�U&fJ핼^&\�ΜZ\�]Sy\�	,�Q�$2\�UjE�F�r\��&�g�Db\��L�M�u3�Ӫܵ�\�oU\�\�q�j�#W{a˪A����\�\�\�\�Y\�\��\�XU	f��\�\�PQ\�iV\�n�\�=�Q�\����5\�T��0=d-�^*�J)�Bp\'`\�\r�RA1-\�&\�(b��L�\n�(p+\0D\0\�\"�*�\�!8	�BX\�KO\��&>.~�Ѻ\�#�\�t���Z*_w)v\�\�\�\�	H9\��\�\�\�\rU.uk�J\��f��v�存Y�\�\�+R:���ӓ��t\�j��\�\�6{��\r�\�\����t`\�j\�f\�0B˽o\�PV��l\�ɼ�\�g�no�-�\�2@{-׈�\�\�,9C\�hLMv}�c�c驏\'L-\�l�Qp۫�U��\�ul\�o+A��\�`��\�B-\�Mn]\�I\�\�O]am���Z�\�+ӟѥ�m�\�/ ɖ7?�\�4WJ�#�q�]*4zw\�m\�s9\�T�Ǡ\�S�(�:+�b \nc\n`�.9dOY✶B�\�)\�,Ó\�넶�P��U�1	�S)\�-;��\�\�\�\���,@E\Z�U���8\�-\�撿.!%\�VJ5\�Z\�B\�A���Z=\�\�%j\�P�����u\�?�U��\�F�s0���\�B\�76�<e�{�\�ۨ�Jy\�\�q}\�M�^�f��>\�N���\�\�\�\��fz+t�t`B�\�;j�\�\�\�\��:��O<\�Wƙ?fz77��~�칛|\�̌3\�7����\�1������.#ڗ�\�|\�{\�_We；�v�>���?q\r�mI�s�\�\�\�\�6��{3�]�Ci,�U�m#�\�z�V\�\�hն#6\�3k��̳�\�DŽA�\�\�7L�Rs���\Z/\�\�X�3\�H@�\0��d\��\"\�\�\�<�SP�SRB���	��\\��fq\r���c��C�(\�^\0LA(p$�*�[�%C\� �E�Z�V\�UoS�Y��\���\�l�_L\�j���ܠ]!�!��ڶ��\�\��J�eά�{N[!b�1OT\\\�;�\�>]�uO�>_\���tq\�\�d)��\�ퟝ��X}I�x�w��\��\r\r|K\�e6N�u\�a\���d\�\�+rCe\�oF�L\�JѴ\�\�\�\�\�}�\�v�\� ��.��~_\�7s\�/M3\'-��4\�\���\�8J=�:\�\�,�T\��[_ҳ�=jl\�\�G�����\�A���j\�+\�?Q�S��\�#!\�\�\�r(�C�9�D:\�\0��8����S�B�S�`�@�\�\�HH�\r	x��Hd\�`&�\�^R�J�X�F� �b(3\�h\�UJ\�7O>��I=�\���^A\�ע\�$�js�Ѷ�GHƵT\�}��\�T_\�\�:T\�i\�ĉ�L\�FQ�\�M�C�\�F�\0���Mm\�\�΁���:.�uW��墥\�\�W�xg�ԩҕ\�)֦\��j\������rh�2�Ѻ5�>!r�\�k.Ө�\�\0��Q)h���$�=Mq�\�gk٭�\�#&\�\�n�ƕD�\��cs�\������\�%Ty��\�b�x��H�\�� $R� \�\�\�`PVPɚ��uI{\0�T`P\Z\�\0ʦ�@#Ɉc�@U�\�\�\�\0��-] ��\"�\n�\"b��\�\�8ه7}�Є-�W\���M6\�J��T\��^�\�9��n\�.9^�F��u�<��X+ZX\�&\�N��k��t�T�\\]\�tۮӹek�\�\�\�\�Ƥ\�2�N\"0)had���_\�Q���\�ׯ*V\�Z�M~6F9h�Ne�sڼ�r�\�_*�>d׫�|��y�\�\�D\�ly���\'V�#Z�\�\��[>ymuj��\�ص����\�N\�Ub�S�?X���\�*K\�@SRAڦ2J\�ܘ�\�\�T��\n\�C����\�@C\'\�I∮�*q�V?qD�#�\�nK8\0\��\�\�Ȕȡ*�R8y1IE֏.�Ɓ\�\�n�\�m�k{��=�\�\�Y���?�V\�\�u�7GϷOi[~�.1\�acG�|5���\�.�\ru�C�!\n�&\�s\�\�U\�\�����j\��P6W)d\�\�K\���9jH\�\�j�����Q�dWew$��v��6��\�3|*w\')2:�\�g���z\�\nܶ{�~t^�k\�\�3;�Yu�՝_6],�O\'\�(���2�`\�tO�\�܋�@!��5��1��T\��`1�9Q�Ȩ���\�T�\�EP\�&r�9T~\�\�e���xC�R\�T��S�:I�����\�\�`��.��3�\�\�]L4�Չ^�vk�qiK/S��=[n�\�\Zk5{�f\�\�pϭ�hVj|\�]�QG`\��M\��\�U�\�\�%ݛ@\�\�qԚ�\�\�\�U�0L\�G\�E�F��6\Z����_t��HWE���\�YWТ\�j\�\�S}eĺ�Z�����\�z\��\����حr\��\�\�t\\�}\�\�:q0�j�*q`h�|־�\�7�\09x&t��y�qt�\0�H�AL\0\"팜R�h\�b�	�H��㙔O\�J`��B�\�/%0�\��R\�\0\0{�\�\0����΂�V*fH0\"�dnIDT�&\"ȉI\Z�\�G�\�\�i~\�b�gU�\�~ȭl\�%��V]׺D�S%����o:�%�I\�]\�U𱴑ש	]\�\�FB>Xf\"�M���4q��i\��\�6\�\�iX��ͱ\"�\�\�»\�<r�^=��ړ\�tk���M7�\�UD�\�D\�eM)rձD%B\�_��څb\�X���\�iT�CT�Y\�\�,���\��\"�u93�uR\�)`9@�dKb�ɞ�Ɂmr��Ja�S����x\�Cu��(��>�\�f$~@z\�(�$)��P�Tq%0`)��U5tPYɠ�:dpqL\0zfˊ1l\�gʽ7>�gm\r\�\�\�Ӕ�\��5���瓧w��V�\r�-��UZ�lՖ�%J�<���[�\�\�MՉ�MSFf�ˁQ�˾��*\�Awu,2{�֚N\�=T���\�)\�\�>�Ep�\�\�x�\�MU�0�\"5A\�*/]\�TV�	&�ΛW_\"���Z�Mdl\�~`܂\�\nú\�\�:���9.=?H\�<��h\�/�Ɉ\'EP\�(T@D��b�Jq	@���C\0\�MB�9$P�UCH�u\0\"j�GdT�bj���\0f%Q#�A\�3�\�%��&r\�-�E,M��\�T��NP\0]��]C\�p\�\�J�-���+@�%��f̯��z{��/A\�v�E�`�!m\�!d�\�%��]|]ok\0�s\n$\�/A\�s6�k.�\�9h�v�V� \�\����\�\�\�V�[!,\�,��\�\�*\nΝ\�\�Y`�j\�Al����Ti�JݱqnF\�F��:S��\�-��,\�ݤ(ПP��#d(��̻	�G\��\�\�v\�A\nr�\�($�%U!\�\�n1\�:��V(d�a@�u\�֧$�@�\�R�)D\�\'u��	\����\\CWp	B\0�@\�Т\"�p\0NI8S7\"Gv\�4R�*���D�qD:\�֊�����2\�A\�#\�HX�&�9��bڵK�?{\�\�ӝU\\U�\�O\�3���ڴ\�Nmx\Z%�ks4t,Qp\�9:�L6q^�\����\�\�\�#�\�v�­���z\�\"�Ģά����˭�vI\�<\�7\Z\��\rJ�����ݎ�rF֗���d��wK��\'�ۉ�[ \�fy\�\�\�<�\0R��\�y\�H\�Hp2�����\�1\0@\��\�r\"H{g\0Ð�\�\"tc�SXrpث�\0S�W|)T\�L\�h �H\��ˤ~�\�\�1u�\"j��5\�%�\�](\�L�<�e[�+\�Sf˷d�4������\"\�4f�i\�C\�-Q�\�Vgj\�ұ�· +n}&�hI~�h	��\�+Y�d\�\�5NC7F \�\�\�֎�\rlQ2\�)��\�s\r���W�g�\�b\�V�xց_ӫ\�D\�U�� b\�\�ڶ$��$:\�/�8�G67�����\�f;U]�&��z�\�v\�u�c\�E�oξ�\�jY\�\�\'(W�H!\�b*\�\�#���*�B��02�!SU;k9(%T\�\0���T�),C8�\�H���&1BU6R��91Q8�2gG\\6�\�m޴�P�B��:\n��(}G�״`\�\�U��\�B\�i0w8yծ\�[�R�\�%�\Z�9ڵ\Z8�kW���\�\�j:��c9^\�܍Nb��jăB\�\�+\�k�\�S�,f�\"x�R7oM�ٚN��\��̺M=\�	gY0�Jq����V{\Z*�G7Q�ŧ���\'��\�\�\��&8qp�w!t���N�{�ٌ�Sz_\�>��W�vÉ9��\�\�@\�Qʠ\�\0:.,Rq\�\�^�\��]�\�2#\�(�g�C\�S28\�)���Qe7pw\�Z\��0�Q0PP�<T☇T\0\�J\"E�\�k��W\�뱋Wm7l\�`/{�Z����|T��\�\\@j�ň��C_�9mf�\�\�\\L�\�bVW�n�%u��LWo�d�\�v�h\�.�t.Su�F\�\�졶�\�%mv\�4\�\�˻J�\�\�&4Y�u5�]�\�Eujض�\�	�+D�U�јǶ6N*\�\�\�=��\�\�\�NU����XjU�W��O5�\�\�l\����*\�<\�L\�\��\��!He\'\�B:D�p�^\�*\\�P�\n(���O�2D\�0*\���@\���� �e�\�\�\� (\nDL\�Fn~5\�US\Z\�9\�\�)���]�6|Χ`\�A��$\\�%�\�2\�x�\��2�\�[�D��$�0�F�%7?\�3�\\��3�s2�C��\�N©r�d�sR�+�I&�oO�\nj\�&�\��ܣ\"��\��\0?p[C�\�\�\�Y\��\�\Z��L�u�v\��Ҧr�Z\��\0:�	n{D�	/W�[�<��\�\�r\�\Zt���\Za�\�m�J�\�F\�\�s��ݾ���#A��y�\�\"�N\'hAY�����HUTTB�[�2���bB\n��9Y0�\�\�%�\�\�Z*H�[T ���LI�@�D�Jt\�\�\� �O�=I��hL��rC,/�D�d������\�I�v\r^�\�Pz�\�7�9ƛ��\0��\�\�X�x�\0�TZ��%+��\��j���=^\�P�h\�٥\�\Z�2P���ɥ@\�0�����4�\�\�\nK\�\�y��9�<����\�\�\�8jR��7�/�0葔\��k\�=S\�qq\'��\�=6:۲��t�P99�KAS=��>U\�:\�\�\��\�K>έ���H8<����߭��ԇ>o�O\�~�\�NWP@\�\0���YD\�1�Bp\�N(�Ax\�\0�a�8@$�%Bc\0((�nU��TH`*�	^�\�\�u\�\�;�q~A\�Ew7\r�UD\�\�\�8R\�\�;V�\�v\r߳q���<��X/\�>t�\��y\��0�{��\�<U��^�N��)P\�h�yy{\�/\�\�\��\�|���V����K@\�)�\�\�We\�[al�*DRa �_h�ÃY�%j�\�3)\�h�U\�՜�l���]��;QHG>�1��J\�w87%�&�il��\Z\�q,3	Ӿ\"�t�ѥ;5L\�\�gt\���&�\�\n\�9}/�\n\�\�\�2�_�ǰ\��\�C:H\"���}b��\n�ǁ$\�I��2��\' \�J@哐J&��D�\�R\�L��kR*���b\0(^3*n��BqL\�*\Z�C�!���U\�&)�l�\\0�R\�|]\�\�cJ���\�}-\�\"\�Lm\�\Zs\��Egh�>���o\����Ci\�\�Vf\�s\�\�{\"W-^|\�\�~w0|��ғ\\	��Z\��.��\�\�\�B<|��&�F��ʕ��o2\�ďj��V�2�P\�L��|¯�\�\�],\�j\�i \�f�j\�Ջ�~�I�#c�Ò֧m�>_�1\�-\��Q�e�蛿�>X�O\��?d�\�\�=�M\�9TT!\�űJSC��\�b�*�YL\��`1D�{�\�\0EI\�HUT\��\�\03\0\0\0\0!1A\" #2B$3%4C05D�\�\0\0%�Ѯzc�95\�x�=1\\���\�O}0z8\�x\�s\�\n\�\�\�1ӌ\n�\�LW�л-,��)\��x\��{�T��\���u���ڡo�i\��es\��\�Dm�Ic,v��L-\�U{=đ���\��ԶMm��\'4\�ɬ\Z\�GLb�׎�Q鎀\n5���b���\�\n�X�+\�\�t\��\�c��X�\Z5����^zg��4_\�\�L�sX鞟j\�N+\�\�\\P=1X�+<С��h��\"\�\��އ�\0�.�?St�?�M\�^~�Z�^��\�Ln>m�\��)bu�Z��\�j��\�\�;�.{Ww{co�42Y�\���\0\�.d��\�W\�4��\�Au���\�^TӵO\�m���:C\"���y �\�\��W?�W�\�מ�5�(g���E{9�\�\��秓\�(���F(\�5\�\�\�맳@\���C��\\{<Vk=	=1Y�\�B\�2\�Aj%�[uv�\��\����\�\�&����s\�\\<Mk5I\�F�\��m\�KT���]��\�ɗX\�\�Z\�\�\�hC�\0b,LD؊\�X\�\�e�\�ʑ&��j�]\�\�:��Sw�b��nj\��Y����T��\\t�^�zz�\�0q�\�pzb�y(С\�<��C\�x�+\0\�1X�\�c�\�y\��:\�\�\�zc��3F�p\�\��5�C�\�>\�\�.0<tɡ\��Q\�s\��U\�յ�\�)��ܭS\�ڄ�#\�\ZY�d�\��\0�z���\�\����	S\�P9��6\Z�\�\�M\���6�-�?J�0�\�o%�\�jb\�\�Ɲ���a;$\��G��^�7\�\�\�\��I�q�J�\'\�\�\�[��He\�\�\�naY=_\����M(��(qY�h���\�\rs^�(Q\�\�H��\�\\f��k\"��\��\�׎�z\nsC\�t\�+^\�3^+\��\�\�8\����\���\\�\�(�3Uޣe�E�|��]O[Ek�z\�G�k��\�\�ƶڂ�[H�ym�Z�	\"P\�\��\0�\�{o/}{��\�y�Kd\�\�\�$�\��o�\�/e0�L�����L�\�ve�\"��\�C,�1}q{k��ݕ�0e����⾳���\�3Y�����r�\�\rY�y&�C\�M^h�\�rp+\�z5�j5\�ڏ�\�h\Z5\�OC\�\�\�5\�sC�\���<p<\�y \�G\�\�A�Xך�sMY�\�{�9\�d\�Y\�\0\�\�{ȡ\�	4��\�j�6-��\�\�\�\�U�Yn�F�����[9�t\��7@�7�NP\�}���A.$X\�-������y\�h\�[��9#{�\�Y]7r\�\��\�t��\�$��v�<\�#�S�\����nc\�<��4ֳ\�S/�ƔEMm���}\�\�~L�B	m\�SQ.\�*m\'4sY+Ӛ���3F�P�:#���Ϯ)z\Z?\�\'4\�\�yG�tǚ8\�\r.O\n<\ZQ\�Q�hq\�\�L}s��W��9\�XW���\�<t\�O==.k�\�\����k,H\�R�B\��o.T�u�\�uE�I!��ܳ\�rF%����\�MO�A0�\�HO\�������24m�I��Ike�mKJXe\�od��0_Zȝ��\�:���M	5�� �E���\"D\�5(їLx\�i��;� v�\�&�JK\�auc�[��\�V�\�D&h����\�Y\�6ʈ�q\\W��\�z\�\�\�hq\\\�\�<m�M{\�ǳL8�\�2h�^ǌ��\�Vk<f��X�u���Q��8<ЯX�Ed�5��+�^+5\��(�8\'\�\\מ�V��C���\�\�v�\�e�~+m\�\�C����n�j;+V1i�ؗL\�-�;�qg4t\'�:��SM��)�M�1���/�wb\�c�]��cȗ\�i\"42[\�\����]�PD˙�D�w��d3\���í����\�\�q6\�s݉\�Aj-�c��h\��\0\�o<�3i\�,�l\��G4JS+l?��^+4qX\�\�+�������~�t+�9�}+\�\�y^h\��G�5\�Ni|W�\�\�z(\�g4<R\�\�\�Nwz?\�k\�z<P\�P�C\� \��^k���\�_&�\�VB\�T�\�\�h�d�4kݿ�GV�=�~\�b�\�P��\�s%\�̇}饿�J�\�\��!ٍ�P�I�{�41�\�d��\�op�6�e)-��^\�m�\�\��9�\�\�0\�\�ЋW\�]\�6���\�A(����KU�K@�\�^On\���wk��\�?*\�Ӱ���\�ZK+��C�\�\��ڦ�v�&v\�\�&�Q\�\�{�\��>|�\�y��\0xj<ѡ\�`P\��\��^�\�n\�f�h\Z\�\n\�\��1@�8�\�\�(�@b�鎞+�X�\Z�d\n\�O^:f�]b\�G�\�>E�\��,����VhSQ��MY*1��0j\�$�գ\�݂.\�%\�	�U\�om\�\�WyCZ\�\�p�i�\�-�\0��\��9�*�L���!�]\�\�\�2I,��F\�&�os�{K+5M�[\�#�]f&1	7\��p\�Z\�$�h�,5=�\�1\r\�!m=Y���^\�\��\�swm8��N\�r/�]\�ߑ�q�XI���WHo\�\�\n;�o�]�\�{\�\�\�Og5�<\�\�\��m4(\�\�x�מ���?�\�@�zx�\�L\�OK\�z\0�Ӏz\�\�H�\��5\�I�\�f��\�OB�)�\�j�\�vꚒ\�Ms�K(�F���O�JI��p���*�ٲ˰�j3Dd�Wx\�\�P�%�A\"j�\�\\Mg,t�p��x�\��\\~)x.4\�\�Y�\�e	s�\�۵\�n��X\���0� ���)	\�\r\�xT�\�-`G��U�����\�F�\���{d�Ԧ\�Cr\��{9��^K�\0�\�2�0�a͔�+���\�vw�\"\��I����$a�t�3\�z{\�f�#\�y��_�\�q�X\�\�W�$�^\�{=��\�3МP�\�f�\�p|P\��5�\��?�\�3��\�O5\�yS�Tֵ�Gc��Kv�\0�,�\�++d�\�\�\�^�e}CRjk��ߟsQj��\�\�\�j�\�g��$�o\"�\�%Siym,�n�YDR~\�eo-��\"��١�\��9m\�X䴚\�#���\�\�mÈFҫ�92�-�cS�\\Z[�\�t�\�o-�&�3�jL,�(EG���\�\�vK\�a6�6\�.�\0\�{~��\�H�n�<\�e�b��4�Y\�ܨ5\�Z\�Z\�q\�%�\�H\�\�!\�b�t�\�\�\�\�h\�C\�8秺My��Ǔ\�_U�>E�\nM{�\�=J�\�k�^���^�W�\�Ek��\�9\�\�\�\�g�\���^֢ҡ\�5y.��\�\rֱmw�)\0�\�\�ҐS鰵>� �k$u�P�YRG=�g�-�\"\�\��\�\�\��\�`X��6�\ZZ5\��r�ߓ\0޵�EyP^B\�\���\�e��Z\�\�\�.�&�\"�v�nu<����\�+~\�en�v\��Er�d�cu��[�c�e�\�M%\��2\�nghm;�\��\�)\�\'��BeHluE�\Z��e-�\�\�\�\�_Z\�)����4\�pW5��\�5\�\�8�5�\�Oq\�ⱚ5�9\�E�\�ٮGLt\�7�Eb�\0�\��\0M�\�U�\0�^O�0(xy�\0�\�E\�_\�g���\�mQ\�\'f�f6�X�L��\0b�_f=>\�\��\�$2�h`ܺn�\�\�I��\��i�����\ZhXL�=fu�g��\�MgI�\�J�e\�u^�=��W\�#x�����\�\�\�q�Wg*\�	\�\\[�n-`{M\�o%��\�\�<`�O\�l�h~\�Or\�\�@�ۖr,�\�n�\�\�%is�}{,1@\�W�\���4\�$�\�f�W\�5+C���\��!��`�\�+\�s\\\��?ϼ�\rX �>W&��\�b��\�sY�5ɯg��u>\Z�\�G�\�<��\�r:r(Q�^�x�\�c��<�\���\�$\�\�~K�-��Ӫi�3����\0\�i,���ӗr\�\�\"�\�K�?d��c\�5��iZ��cB�\�\�\�-e�QZ�\�?7PjW�!6\Z,�\��\�EMgۖKI�vF�Vʡݞ61\�\�<\nĎ�\0�-\�g�僳H\�Ij�\"\�8�l��ܻ�߸\�[�\�\�\�\�[l[�$�b��ɗf��\�z���\�{�2\�\��D���G\�\�%�J��\� ����$�\�$/{i-4,\Z\�ntO�\\��\�m��e��\�\�z�^������\\W�6ТGOm^k W�\�k5u5��\�5溺t�sX�u\�AY\�q\�V\�P\�>I�s��\�%��J�\�H��\�FԳ\�(�\���\��a\�\�ޓ^\�\�Z\�JjZ�%�MX\�\��\�5)\\�r߱\�O(D9�\���Ȓi\��\�\�\�\�-���k[��Ժw\�\�gn\�6��\�a���s,\�\��k{[\�\��\rܹ��Զة\�B�\�l��\�\�\�\�2Mm�t\�\"!�\�3[�\�\�\�M\�V$oxf\�,vQ^�-��m�6,[O�-�Ӣ\�mh�e�\�1��\�mV\�Z_s�\�砬�C�\�\Znh׊�G����V1F��\�\�\�+�9\�kߊ>y���\�W�=b���q\"¿&�K\�P�1�\�]��`^\�\ZN\�\��vۭl����\rO�X#\�?\�\�ᅳ�T���V�\�\�+��H���Ů?E�mV�\\�2T��;ջgKR�h�\\Y��lP�[����\��Nc�\�qْ#�\�-\�6����\n��Y�{7�0\�\�\�\�kZs\�w�ݹ�\�rm[V��ky�͌PZa��ܲX2\�i\�I-��V�:X.d�auQY\��\�̺��p\\kd[\�\�WX\�\�\�\�MZ�՛k�G6է^\�\�R\���:��R\r��z\n\��hW�\�\�湠y&��u��<\n�o\�4z�\�x\�(\�9\�3�G�hdu�Y��:��o�è\�W�\0 �k��\��\�}g����=&%Hl���\0Ұ��^D�M.�-��{�U�\�E\�\�֣-��\n ��%[XQBZT�\�(�T�bQ�\r.B˥<dY.\�\�r?oz�\��_�L��\�m\"�\� ��\�h\�K|Q�\�\�X�;��\�dcL��{0\�5���lEg�\�\��[\���KUޘ;rXmV\��I!�������ot�!i\�{��0�/\�\�4���歼wNͺK\�\�xb\"\�\�\�Y�Z\�G5isgwE%\�d�Ym��\�{b�q�Z�C\\��y� s\�\��ו\�W��\�5�\�Q\��(\�CY\�@3^F:-/C\�\'��_�Nѭk��=��j\Z��\�\�\�5��Qp�\0�0Z�\�\�\�r��Gm�$�1\�$\�2JR\�}��\0�v\�wP\�\�\Z\�Nj�K/I�\�X��ܚXA�iV�.{%E�@�\���\�⦴X\�̓�Ƅ[\��$EA*+~\�ve\�w\0\�U��\��\�\�kvЖh\�wj\�˽�Kx�禳\�2ҁ��3���+ ���W6�_�I \�i��mH3_�$u�v��\r\���\�\�\�I-�\�_��os&�.�y�D^\�)\"�\n�X\�\rM��y\�\�ix\�zh�\�q\�c�\�4ǚ�^z�\�t��鞞z浍Z-*\�Qw�\\�lZ|w7Wwe�PU�\�\�3me�R\�Ai#��km�+k\Z�w%��#Ҥ�O۶���l�ʣ\�\�a-\�5�\n\�8I��B����R#V�N\���\"\��\�R�\�\�	¢\�/F1R.h&���\\��.B�V�>\�kx�8\��\�b\\�Y��\n��=�q}�֩�Y\�ԣc-УxPZ_ٳZ9j��)K\�a-�\�\�`��͔�\�-\�6�.\�M�6\�iK\"�����A��F�P\�1��<x�\�=r+5��r}c��\Z\�c�C\\ך\��s^(dV1@t=|V�}oam}�\�j\�ww\�\�$s�z��QQ3\�f�I0���[�5KS+j[\��U��H\�\�R\�\�L�(�\�gi�%���)\�\�v��ܦ9wx�ԇ��QWk*��G�9\�\�tR�\Z# &�Jd\�2\�g5\�q�����_\�sLI��\0$��I�?z*@8b\�\ZI��m�%x���H�h�5^\�GnY,����KRL\r$B\��)��\�{�\��\�V)�Z躌�mܫ�s\�\��\�\Z]\����c���_\0\�\�\�\ZS\��\"��\�+�F���Y48\�(W�s�[H�ɯ\rx�\�|�g\�≬��5\�\Z���\�-w]�׮�a��\�\�\�D�cWvYjt\�rw�\�j\� h\"�j\�t�]�\�\�Y�t!l\�jdhm�Q&k�e�?\r+����pH����l\�\�\���\0�?\�*�k��\�k�+�v�h\�\�\�+a\�\�%\�;1J�#p����F�0\0�AZ\�\�\�7լio,6\�g�\�m܈�@�A�\�g��i����\�6���\��h. �\�hNt�GJ����s[�ިy\�vת\'5���\�\�OL}z�ϣE��\�9�:�:�\�\"�8��\�Mw-���j�ɩJ\�\�\Z\�/Zu�\�H�\�p�@*Oȹhl�\��h%m\'Er�:ZB�\��\� 	��\�\�)[\�\"`�`0]���A+R���\�\�\�-�LN\�8�G�v\�Y�S\�Rk\��\�y�QX\�LKJ\��\0,�Mئl�[�	\�\r���S&\�&p�$ѩE�u\�!nk	��m	�FCh�\�f\�d�\����=mn$��\�lOcz�k�\�gA�:�ŋ�m223��+\��^�CǯT8�^+�ӎ���GC\��Ϛ�\�c��\�ȯ4\�Q�\rj\"\�I���kʸ��\�V6\�Ō2\�ok�K3^,Y\�1����m#C�֝b��1*\�\�Q�41o\�*\�ro*\0�+k`-m$�9�Z	_\�\�\�Em\\�\��ԑ届z�T��\�8\�V\�y�2^\�2\�Y5�ԇ�wPn\�Q9��#\�%�\0�ڎf��\�V�wCY᧷�\�\�:{�+)\��\�[��Z�H\�\�E�S��\�\Z��\�\'{{\�,1n:qC��hW���I8\�\0:c��\�\0(\�hs\�\���z�����\ry��\�4\�W\�)i��\rB\�Q��\�\�LdġkO�\�����Mݖ\��\�J��\�ceA\n�p��\�\�E|Rʦ�]�HJ�)HJ\�\r�@�X`\0i�	Ė\�B!�(Z\�aG\����\0�\�J�;�\�\�����8�r\n���\\Ա�gU\�)(v>#\0\�\��R5\�r\Z>W\"Y\� lL���h�\�;c}.e)�ܱx�).5�6M&��;�+\�>�\�_�;om�����!\�\�f������Eg�\�=Vs\���@���\�\�_^k�DVy<t�==b��\�S�\�\�ښEoi\�z��*>�\�\�\'e�v���ҙVJKg�ee%֙n���e#\Zs3Y3� \�})��A���.\�\�,�\�\�\�F�k�h2\�\0P8��C&�I��N�����p2�	\�(�\�1EMc4�me\�`\ntZx�Q��\0\�J\�\�&)\��\�\�\�#u6\�Gp\�+��v\�\�4z��ؑn\Z�]�\�ia}+\��f�O\�$��I߂\�\�>�W:~�\�MsY�g��\�\�k߿C\�y�0hb���q\\׊\�+\"�\n�o>�r1^�\\\��⹬׽F\�;;]FY/\�\�m٨\"\�[�\nG\�A$�_\�{u�Z\�\"���\�6i�$+y�M��pʒn]��\�G�r7#�`���4;\�\�\�e\"�0vjq\"Wq\�e��4Lm�j\�k���\0��v�\�Vŭ�\�|cul�\rۈ�\�0lf��\rR&\� \�EsX��u��p\�6T���E)��3ZΞ�P\�\���47�\�x.�kk�Muw�\�\�$�����f�\��~�{*\�\�p^���^k�Of�ѯ=ph������x�Y\"�\�f�׎�Sѱ��Lo\�\�\�<�b\�\��8#O�\�Q\��%ey\�+xa]CQI�\�\�{:lp�\�u\r\�3a�57ܬK%n�G\Z\n\��\�\nH\�V\�\"����\���Ie�!*��VӅx⸢>�\�@�T\�ɑ\�r�$\�\�\�QZ�]iQEm�˦h\�iՍ;��\����\n\�n�u!\�S�N)\�\n��3_\'ҷTWR\�\��G�c\�eI#��\�f\�_��#��|5�\��g\�3X#�zy>�끊>H\�\�\�\\u�\�M{\�OB�=3�\���i�\�:�b1g�Rԋثh#j�\Zm�..��z�e�U�{%�m�\\>\�Q{���\�E4��\�\�(�\�sdհV5fp1\Z�\�f��k��l�Ƕ\�1K`�@�\��k��\��D��B[E/sL\�/4\�\�;�\�\�<��wf�*P\�\�1G���V�\�}*\��_Ua� \�>\�ii��DP\�ۋ���\�\��Cv�<2E,6\�/kr��\��\��6��f���6\�:�\�5\�ɮi�{j\�@h\Z\�z{\�Lt��d�����<t\�:y�I�re�?�j��\�gbۨ�\�\�@�[Tx)2jk�T&\r��\�ݭah$��e+.�\�>\�ĳJ�p�BI�q[Y6(2ciShZ)G*�h�\�p+{�1��\ZU\�2��b��kע��<ga\�l\�\�rv\�\�G+\Z2`6֦S�낀�\0Ȥ��\�\�c\�&ԩ�\�We:�Ҝ\�\�\���\�h/���\�l�\�\�k�auے\���\����5K;k�\�\n;s�ա�@V+��k��C�=\�\�\"�\�\�\�\�{⇚\�LУ\�z��\��#\�2�]Qcu}3s\Z5Z�Ս����k�c���7S[\�մ3�Z�q:iB5/ѐ1��i��~\�\��=BF�YP�<j)P0E9?\�d�ď}lU�m�\n\�ƶm�\�\';@P\�T�+e�m7�f\�Fw�\�Ex+��;�Y��SE\r*l��;	�\�uy#*�:\�i�7[�ڲ�*\�7\��B�V�R�ι��i�^X�R�-n\�5\�\�{/��.r�|V\��\�0ɂ�ȴ@��P�^i���\0��\�\\\n\�>\0�|�\�qDW8\�^z��\�Aӎ�k\�\�.�(�&�۹N˦&K�5)�5++)o�f�y�Y��.:|PF2�Y\�wS\�x\�%�H\���2_\0V8LP�\�)�d/x��\Z�\�JY_�ȣ��jFwnHߊ\�-eZ�V�)�\�\��\�\��\��\�pC&(\�h\n)�ܧN~�\�\n6\��8+\\�`R�\�*s(&���T�d\�ꖂ\�5[̎$�����\�Ă{\�\\֟:Iq����\�+\�q^(��^�\�P8��\0#\"�\�41^��G_4(x\�\��\�9sG��\�+\�X�\�Vۢ˹���\�V6{Z׹qF\��\"���rCg+mgTG5n���u�\�O\�\�1\�Z�6yA�*%���ᝥSp\r�f�BS\"5�\�#Ƒ�F�Qs\\w\�#\�\�Un\�ވư\�톮\�  ��F\0\�ۀvn[q���F��K\ZGgSV\�\�\�֥�m�p\n\�\�\�/�>\�]F\�7\�>ң\�\Z�W1�MM1W�z\�ګP���Z���%d�j\�\�P�;O4hV8�ɢ+\�\r\�x��}\Z\�\0p|�X\�^�x\�\�\�s@�==W�Lq_��j]֑bx\�e6rdM{-\�f��sb+K0\�\�\�fx;]\�\�P��S���\�Fr�\0hr\� *8�b�\0I\Z0\�+�\Z�2]��]�J\��|�\�\�\�A(\'\�[>\�eT\�\0�B\�\nƫ\\��T\�\�\�ĩH�l*�;�� ��l#��\n��\�ڢ�F\�9$\n1�\�ۧP���\�T\�b\�L��4d\��\�+�\Z��[\\#\�֒w`�Eso��Gy�@Կ:\�3Y�)y��^:�4k\�\r\��\�Ѯ2|׊4:\Z\���Y\�5�2\�\���y���.Z%�$z�����C;���`\�\�a�cy\�\�\�-\�Jp\"\�\\\�U\�#R���n�\�S\�}��N)1�\�X���nIK�h�\�&���\�\�Af�DT`o)�9P�\�\�5�l�&\�\�A�ds�a\\\Z�FNv�\�-��N\�ቭ��5\"\�ɭ���&_�`���\"~�봚�\�\���%�\�m]\�;O�)Y�ɤ�Lڒ\�|R\�Hx5硥�3ɯu\�8�s\�\n\�B�Ls�\�\�4x�\�x�恮+\�t�E(�:}jg���N����[0�R.\�[;N=ˆ�&���wb,`��\�\"W\�\�گ5o>)J\�ۂ�	\'��\�@\��\0d��\"8\��\�p�5\�٪Bwn�.0��P[_ڈW;\�bS\�\��\0�}��$�	� ���\�0\�.[\�ʊo��`\�_3b�M�Ud�\�+��S\"�\�L�4E��A!d���L�/m���+�Z��n?\"=Nͭn�$�\0�h��1�@\�;�VW\"h�k\�O?\�VFN�\�z^E/�Y�F��c4|��\0�>i�9���X5�\�%��\�5֡|��7MIrH�\�G\�#����\�1L�`��i�-ܯu-[�2�bK(Ri\�n�k`@ai*�\nʦ\��_\�\�*°e=\�]\�lG0\�d&�I\Z����-+p\�3\�V��6\ZȢI�gv߱]�b\�c�����T�5�T�\n��\�p\�\n���wV�<aс�dxR�E,m�.\"ޭ����F��9�\�̕~��7j6\�s�v����Y\�۞\�\�\�_Y��\�T\�n����\�8\�8\�h\��X=GOC\�\�h������\"��\�OU�:��\��y\�	��Kzv�v�-��㖦i㶇�MJ\�s\�6�n�\':}�\�8�\�o^U���\'�[���@\�g˶Ѷ\�;qS\\v#��\�/\0Mc��Y\���\�2\Z5�\��r��E\"\r�%���aaF6��B\�R��\'k0¹\�Ͷ�\�{�\�\�E!��Uq��$��l%)�S�\��c+\�gR$5*\n�v�\�\�\�\r���\0h\�3?-7m^\�\�dF�hƵn\�\�\�\�\'nI���z�\�=�\�n?�پ�k�\���x�^\�\�+\���ᎄ\�L䑊9�DQ\�\Z_�1\�\�S�+��v-\�܅�.eKo\�\�����F-|����=��\�\�)�\�/���k�\�m\�\�C��\0x\�I�\\\��굇\��]�8v_�P+Jh��R�n	\�\�\r�v��z�\�{\�bQ\�\�\�\�v�1@��4h�\�v\�\�0.\�Wl\�!�\�\�MO\��e�&墣T/4�4�4�E(8 \�I}yJ�@�V��Ub\���p�\�W)%��	sCsc\�\�\"�M	$7���ա�;iD�yk��\�@zc�G�4+\�O]<����o�:(\�뎘\�V\n>w~m\�*Z�rѥ���{.\�\��Οmm\�\�:�\��k��\�C�5�߸\�5\n\���\0\�@9P��]\�\����\�\��\0LH|s�ș��	��w%5\����ˁ<�?帥�~J\��8�\�ў&�\�5�ε���-\�8y2aZv\��\��	$\�;H�0\�-!��\���ь�T}vaI�\�\�\�sT���@j\�\�%�\�n\\\Z\�L^?\�;�\�\�f\'�]\�?nY,.^\�\�\�]\�cTyd�\��㷨��y��\�\�z>y�\�4Eq�\�(sY�\�8\�\�3Y�=9ǲEq\\u\�@݇k\�\�w�\\Ć\��3\�5+\�nm��)�o&�����jW!e���Cmo�KF)Z�w\r\�Pn�\nc\�I!h\�\�\�\�Rc���}�\n�l�\�\�\��$2\�ӕZ(In�C�\��,6\�q\\g�U�[�\��\�b����r�\�\���\\\�Bˆ\�y�P\�\�U\�,p\�˾�c��6Z�\��|2�Y$9�(�\�Դ�S�Avr�ǫ)\�:~����kV\�^\�z-\��v�}!$ѥ�\�q\�4z\�\�`���\�\�5\�$�\���ӁG��\�y�\�Р�\Z�\�\�\�\�\�Ԯ{�\�*�m`\�\�5\�\�G�\�y��G�\�\�\"D\"M6\�\�^j(\�w-����`2@�\0Z\�T��T\�r~�3��\n\0\nH�\�\�`�`g��J��\ZUM\�\�\�\\T҅W+��]\�\�\\\�\�J\r�\�ڐ\��\��\�\�\�!c�8�\ne\�ڮ�A;i�^�X❋\�8|�\�8z�$?	9޳\�)\�R,�+.\0G��\�S\�!k��\�k;�\��ۂ\�e- �\�j�A}�\�ֲM5\�\�M����B(gq\'��<���\���\n=<�\�Es\�g\n>c~\"�w\��Ӹ\�t���H;sDӝ\�u\�\�o&\�6���#\�%r��e�!�H\�s�m\�\n�O�\0\�\ZEG4��]B�O�\�\�0���]�V9R\���\n_8ʨ\0n_2>\�\�h\�ʩ\��\�fY�\�G\�\��)w-ʓ�^�ү�L��c\�\�\�\�njM\�#\�rV�m�6\��\0\�\�q\�i82\�5я	�$\�#j\�%I�PL.�\�$�;�-�\Z\�ӮSX�\�\�\�q\�\r^\�\�z\�w�1^\�f�k#�\�EX\��\�-g�h\�W\���N���VQm�&Լ��Y�\�\�b�N\�4�Y��\0b33+\"���\r�l\0R�\�!�g���2v�\�m$�D�|H2R?�\�T\�\�k�jM��\�\�+��p�7\�\��ԩ\�.\�G,p\�ڸ���]\�Wu>p�JH�\��\����S�-�1�\�\�|�2-J2_�s��\�\�S\�#z�\0��\�D\r�J�[�}�-�7+s�*\�#>dKW��Mk�n\�\�y-d���\�ъ\�׸#�\�Cɬ��К\�x�C���\�y�W�\��x\�#���Vhf�E{��\rkD4z����%ip�)�i�\r.\�C�	O�KHc���\��\�\�!A�\�<\�\�R>I����\�(�n\n\�\�ܘ\�\�@Z�,s�\0-٣&\ZF\rIH\�\�D͚�ȭ��CC�5\�H1\�69V�̈�6\�2�_\�\�{��P\�\�ة��\ZLo\"���`�\rˮ�龬X1^\0o럗�e�\�\�%�]q���Q\�\�\�\�R���Z�V�\�Oi<�\�6�l\�C�ZD{r!G^A�\�\�z>(Q��|\�z���\�\�\�C9\�8\�\�y�\0B\��Pj�M�\�;ZGv����\�K�.��Okew�M6\�dq�I���G�\�!��b���\�cZ���3QdP�;qJ۩�0�;���1�x&f\�6\�<Ӷk�9�T��\Z),`:5v\�\�\\�O�h��U�7\�ي�n4Ig�\0����b]�;;dY�\�/\�*w��s[v\���L\�6̀R�(�\�dHة�\�\�b��21Z0n�\�\"\�}MͲ\�QM�F��G��\�6:��.�\�\�\�}l\�C �SC�h�Sm�=�鎀׺\�z:g�\�Nk\���\�\�0i���\"�[�.��G��\�7iP�l�\�[���-w,a\�\�\��Kv�m�����4��w�\�Fz�\0T\ns��ܢ=���d�\�-��W�S��\�!#U\���x�\�Q���\�P5;\�R\�\"7u\�H3Yu=\�S<@\�]�(�J���\��q�\0�`��\\T�>\�Ea\'4\�-m\���\�o��\�-�٢v�dz��QlHͽdZ61;\�ꛈ\�.Vib�kq{�\�n\�\�\�`\�*�O����N�����yi�a��5\�8�^�s^9�\��\�k����>k\�_<W=O��p� ��\�io�J�C5\�lf��MKI����\�\��^�}4\�D�Kp\'�\�\�¿\�6\�\�\�߱a�l���qA�\�\�\�\�F\�(V��\�A\�Bɽ�\�e汓\�c���$Dn�#*$�1\�b�Y$��H��\���G1)�p�n�������\�C[Yʶ\��2\�F�1\�=\�P�\0Kɜ\�\�]��|�f\��ʚ\�$�\�^\�Q�\0\�s+�mq�VLR\�c)��\�[���\�F�C\�]�bkAq\�(H.)d��\�\�m#Z\�o*r��?��ȯ�P\�c\�^\�L�=_|\�k==:\�L�G\�7.�\�b�\�ҡ0\���\�PKc�\�I\�\�I�n�;D{�\�\�\�~\���؟\�)\�w(��\�\�+�i�#���\\\�o�z��e)5O����¥5tܷ\�1\�T���\�#aq�-��j�����\�FVym\�\�w�Wy�K�?�� \�7\�%�w#\�\�G\�i7\�q�*;\���ј�yA�����C�S\�I\n����2\�\�G�D{z��FlS��y)�n#\��\0\"LWl\�ےyW\Z��ǧb\��\02�^\�Ά�\�K�1q9����:b�׺�^kء�\�\�\�5��\��b�\�1�\�E�8�B�\0a {w��&h�\�\�\�m�� �\�\�X��iczkp�\�\�\�ojQ\�n�\�+\�8F�\�\�\�5b(\�\��R���\�sq$:�.�c��\��\�3N��\�\�ˮ#?\"M\�\�O\r/ˡaȒj��\�KKɷ\��}:�\�*���\�)?\�U�\��\'|c\����f�\�Ax\�\n�\0��\�\�aI1Y���|\�\\\�\�a�W\�v���>�@�N�(|�\�s\�Q�>����\��̬��o�Slǩ\�6z崂\�\�	$�M�n#\"9-\�lhr*\�J>��O�^u1�n.�7�d�\�me�h��\0m\�ž��*Kg��N��}\�[z��:�\�A\��@\�W���\�(\�\�\�\�c���W���k\�?r��ţZw�+�dk��ȸ֧���`�lWlz�ɂ\�˄�6���\��	H(6\ne\�X(�\�\�k|���YZ��\�\�\�L���&�\�K�v\�\�f�P��D���)�?����Aa��T�\�^�ik%�\�!h���q3˿�K\"g_���\�\��s=�r<qlf�c\�.��Dq�\�\ZX{\�A�\�\�\�\�\�H幼\��\�V{\�\�\�\�\r\��\�ܷI\�\�Ě�\�:̔�\�Tk\�[\���\0\"���/�O$��Z^-\�\�\��j\��\�\�\�R;�\��r�\Z&���w-m/[qW�j\�({\�H$kM\�\�e�\�\�\\���Ů\�\�.%+w��\�\��\0#�\�`\��測�ꚏ�5��3ԜQ�7\�\�o\�ҴJZ�\�}\�\�k��ז��\�!��漸�\�g �ʾ֎CL���\�8�]R\�+�\0+\�\�_�io_�2\�3꿉R|�\'\��[�-\�S\�h(\�E%)�z�\�Kj�H\��O�\��\�?��\0\�dԿGt�kh�Ho���>�-%��\���_��{܁;\\E-ɿ�i%�	��$Ҙ%G+ �vZ�A%\�[jg�\�\�RQN�\0c��$m�Y\�\�c~S��G\�\\4��k\�e����Zy\�\�b���S�j\�mRhM\�f)�\�\�\�Gn\�i��\�x��\����sm���WO�ܽ[�����\0P4�|�A��\�t\�]\n��*�:\Z�9]wtm�\�eY+I�\��\�A5\�\\����[鶓[L�\"�E\�zx�Gσ^\��G\�Ox\�\�O+\�\0׊\�z\�h\�:�lo�k&�{I\�]\n\�\�( ��\0n�heiX4�\�#�ͦBF��\�b\�\�n�Q��s?\�v�j�k��׷z����\�oo%\�i�\0\�\�M�\�Φj/Ӎ:��_��/þ5>��FC\�)>?�-K�\��\�\�~6�)WC\�\�\�V�����]?O\�\Z\�a�\0�D��E�%\rE�\�5x�\�kkA�\�\�V6�\\�7�0�1�����3���\�\�$��\0�Tm�r+RY1$�8�\�꧙.j\�Dr|6\�\�ȾkS��\�j�4�X�3򛒿\�R�����B�\�\���I��n�b�\�\�v?��[\�z1/�{�?��8\�o�\�pԶz��.�{kI��\�\���^�a�F�|\�L��E\�uHYͭ�V�l�sh���ϨGo��\�咻@6��l�1\�\�G�{lQ�Duz\��鞙�U\�I>˫�iڲ��\�S\�;s$v\�\�`��pIؑ\'V�\�ߒ|�-$].���\"&���\�=֧s-\�\�\��6��\Z�\�b3Z\�U\�\�0=��(C{.^�}D�y�/WVwr-�71��^\�Z�:\��^���|N;S&�а\�Oc\"	�\��˪������\�\�ΘG\�5GѾ_6�O�B�k�%�ȴWH��\��AVL	B�\'zz�&j�f\\jz��j��\05\�\�[��\�\Z��[\�CY\�o*=P���=b)l�F�\"��x\��\�~�(�>=#\�b҄@\�!cn�?��֧��D�\\B��\��so��F\�`�ͤiW��|\0v\�\�\'���,j\���\�Iyv\��EZr����\�i�=��\��i&U\�ɬ\�\�k\�:s�z��C=8��<�\�\�9�co\�L\�7��\�r\�IK��\�u�\��-�O\�Y.5��ty?!�z=��[�4��K�m�\�c��O���W\�[W����Y/\Z�\'�\�\�$�tgj��Tq�1A���+Q\�k�ޒ\�gF鞝��\�7��S\�q�M�\�\�\�ܔV�4;�\�~�Յ�֟sr�5�ïj����|��迭-����MB;�֍bٯ?[�S%O���K�\�5�w\�WZ�\�\�n�9{t-\�K\�5�e�]:�x��K����b�\�t\�\�t�\�G���\�\"�6\�Z\�i�UlP���:�X�-!�o\��H\��\�\�Y�R�3H�\"��qʴ�K���NwW轰�翨P\�1�I,�KOϴ��^mp�ѷi7-g��Y�\�^\��ѯ\�8�\0�Q\��5\�?�t�X\�-^dGg�\�\��۽{sz}��0�����)e�ݖ���$�Z�ҭ��]F�\�\�?mڅю)$�],�\�\�Ƈ�\�Rw|�ܤ\�D\�`\����܁ol��J\�\�(L1�$RެfMZ\�U~Aa�>Ob�/\���#|�����Oz�\��F\��+���	\�w\�֚�:v�qa>�k�e!�Z8�Y���g%\���\�e\�&�O�|H\�,v1C\Zڦ?(�\�*P�\�Lw\�iu\�C�۱�\�\�X\�\�K{��\"2��ۻ_�o_�h\�a\��Ţ���Ql.\'/��p\�s�i��_vo�s��\�;KP\\\�(��k��.�{\\ �e�s�ŖM+J�\�+�\�=2kʊ\�S^zz\�N\rs@f�W�\�+=<t\�!H�.m\�T���\�\r�B��!��\�;\�iŝ��3�T\�:\����k״�\�4\�\�+ؙ�/u\��y \�2ΑT�\�_��#�\r�Gn�BB��F�v\��U\�.5���D��?���v�ݽ>���ц�Ѣ&]�z���\�g\�iq\��deqR#\��\0;\�ž�g��EfW��\�D\�٪�\�J�6�G,w\�nu\rZ\�\r�+)6�4\�*{��s�ZBN��]4:N�uQ�n\�|Ct��E\�Yt[��K}B#��[��ɮ�6��J�Dû�\�v\�F\��6\�WQ�+����\�kN����\�b�\"B{l�[�U6j?3b��oْ\�\��&�\���\0�U\�\�XW��ٯNph�\�z�^��s��f�\�-^(u5\�\�\�(}V�%��\��ft�VG�\�\�91\�)\�.Ǔ�\0�����\�tm\�\�\�of�I\�Pi�WV�\�m�u�\0���xI�H\�V�԰�&=�mv����:w��t�zӭ�w�,��bִ|�\��Ȍ�\0$ҞA�\�r��g�x��,\�Qn�[�D�e����.P�\�\�/�Y\�#��\�.���iЭ�\�m^�����>=aZ�\�4��Q\�_Mx��į�\�\�\�\�*\�\�yv@����\�\�m\�m>\�7�X�H\�5= ��M�Eys�\�5V\�Y\�%[�\�C��RE�/��\Z\�\\R9u�j.�&�hL�%����uyڵo�\�\"M2�\0\�L+�v{ko�|\�-\"\�Vy�Kl\�=���.~\',\�6�\���n��Y\�k\�q\\��W�\�Q��^k�硣\���X�\�Ь�֤U\�wQ}�A\Z\�\�c�[�q��\�\�\��X\��\�\\�2jW\�y>��\�p\����C\�\�o��0i>Eumܾ0�-�JR�i�m%\�\�s|5�\�5�����WV\�\�%�\�r\�\�\�n\�/	�[Ԧ�v��\��/\�,\�U�\�\ZPZ\�\�i	��/\�z�\�;\�\�\�	:^\�ݿ\����\'F�,6V����4@�F\�~Eg��V��\� �\0\�B@2G�yl6\�pJ�o���ֿ\�|\�\�\'\�\��\�z��OSc�\�Pj����+\���\�wA�;�[i!m\'Up]\�Ţ�\�P.\�#\�\\\�\���\���\0T��/\�\�д���3\�b�\�R\��qn\�^}Q\�\�\�\�H��\�a\�|Hz`\��\�\�⼌�f�\�\ZÌ\�\�Ѭ\��K�Y�^ϟX\��CDa��\��\�ycX��U��{\�\�\�U�����{�Ѵ�\�oiۭ�\�\�\�nݯ\���O\�\����E��d�lT�?���;��}�����-�\�[&��\�׺�֧fV\�4\�־=�\�|�W�F�n��m��V\�\�H\�wD\�-5M#V�;Y�&���\�\�o����4��T1�Z�\�Y\��K֗M\�\�\�\\|6\�}An�Z�l�M|�?�u�E\�¦\��\�E؊9$h�\�f/g+y,\�\�\�m7\�\�#�\Zb\��\0�$w_\"�*����+Y\Z\�ZN\�Iq/\�\'u���Z\�T���\rUXZ\�z�\r\�V��E?mŶ�s�\�*B	\�`�E���e�i�w\�q�x�z�2\�\�	�8��fK�o�u��UQ�؈�dPB��G\�\�OW���5\��\0\�\�/^��Q�W\�b�M\�R�\�v\��[]\�n0c\�\�t�e\�%s<�V���Y4b\�\��\�\�.$\n���r�	���\�\��%\�*\�M\0Z(�v\�uB%R�4r��\�:��D����V��\�j7\ZV�,#\�\"Υsi4�\�\�3\�\�}u�\��.%�A��@t�\�B�戗N�2\�ʐ\�@�w��,1�K�1v-寔�\�|~h�+lc�KB�K\�M\�\�pw,\�\�[\�_�=��5��@�n\�(�=y��\�/.k@\��O��\0P�V�su�\����[\�\�#\�\�m徙\�L\0CZD�G\�th.b��x\�\�[y,e%bh\�$0\���m�$�-I���jC1F�\�\�\�\�Gy�e��m>�\�\�\�\�6\�qm$\�\�mG\�\�\�[��4�04q�3^+�\�C\�MqF�u5�\�\�:y�栗\�\�q\�O�k\�\���hv��O%쨰\�\�]I\�|\��.�\�\�+���E\���X4i\�\�OO�N�\�\�\�jii��wd4\�\�S~4%�\�3BkSsw�5ԶZ$�\r.\�h�Y\�\�y��T[\�2\�\�\�\�Y���ӿ6�E\�\�Nӯ;p��;�U\�f�X���,\�u\�s\n�jV���\�~f��X�JQ8\�r\Z\�i�e5�D>Gdm��gz��\��*=56j:l�<<o���Mլ<v1\�\�M�\��\�Z��\��|~\�2}B.�|{Kk�BnŬ\Z��f�Ю.\�\�\�*+it�������đ�.cj\\5Ki��Э^\�f\r\Z׽�?ԋ\�\�\�u+\r�\�}\�u��ZKaq�c��\�m!�\�	#�/\���>\�^��\�:c\�F�Nf�\�kѬ\�=}��\�y\�\�En5���jY�o�nkI$izC�ׯ��\'��}0�|sE\�v݈�V�k;:���H\rB&��|�\����_-��&+h�z6�Ԉ�fG۪\�\�\�\�\�\�\r�A!��\�Y��\�\�4��_�j\�\�s�\�,�A1\�áks�ƴy����ԥ�h\�o\�v2\�\��4ZD0�\"*w\�ZΥV��\�\�t(��\�%XbM�v�`T���\�m״\�<��ԿO��5\�\��\��l�d!{ٞ\�@7%�\�\�n���n��˯\�O���%\�f:>�&�\�?-\�O���*\�so*��\r\�od�\�\�V\�\�m�\�4/�\�K��G�\�E��\�MS\\\�l�>�\�p-D3\\Y\��}���+َO�\�Gp\�1?n\')0H�\�g�d\�\�\�$��K�=1�\"�ר\�\�:\�E\�y�C\n�d62�������nt��2\�\��\����\�?&��@&j%B�\�M+m�˚�MN�\��˵y�ov�?\��\�3X�:��,ϸ\�,\�-����D4T\�\�\�0\�p\�\��\�TM�el�{Y澊\�\�sKw}\�;�%\r�,�����E\�\�/�ܘ��\'oR\�]�;B�\�g8dV\rа5p>��u^D����/�x�\�PZ[����t�#\�\�0���Q㵎y���\�E�!R�\� �|rI\�m�%\��jp�%��\r	Z�\�P��\�\Z�߷I(a81�~�gľ!n_Q�\�u\�\�|�O����e������\0��㩥h\�qkV�EK���z�(t�\�P�t\�\��=84+5�zq\�<DE\'\�\r4��\�v>���I�4\�m\"�q$ox]^\�h�%\�U�w(\�>R�[\�6����^\�Y\��JxZ�G����),H-n�RDim\�&;t]\"%\�v\�;��A��\�\�{�]ݞ\"�\�\�&�\�{\��\�\Z�\�\��&�/�?�i\�5ż@\�+̠%pk��:\�\�\�j�$��R��SϦ\�ièi�\���E�JIpc�6�\�iVq��\�4`�$*\�)Y#Ui�D��v��h[࢚�*B��R�w���w�\�����J�?\���w\�\�\�³ܔ}L|wF�D\�t+;�Ĵ�z\\�>qC�\�\�⹣\�z\�:\��\�\�x\�\�\�_4r(\�qF�K\�1ʙ��%M�̬\\�C�ꊢ\�\�O�\\ȕۇ��ڍ�å\�\�s%�\�%\�[$ȸG\�jP%՗\��Et�QIo���MǷ��K� \�\�\�\�\�\0�(�\�;ε\�\�4p\�f\�\�\�;�m=\�\�\�qon��3S��M��\��pu\�\��\�K�m\�d���\�,m\�]�\�~�\�$�\�^���\�PRե7����J.K5\�.�\�+DEMe�m?e\�\�q\"Tw;����[RLi��\�n	c�$j�E��B)\"\�G��ji6Өf��\�\�\�Ρ�\�Z�����^�\�\\ӂO�}.�W�{�9\�u�y�����F\ry�\���^�\�\�{�Ӛ\����ӊ\r\�{�9pjD\�5N�T�]\�\�i��\�P\�ɪd���$�\\˝F~͆�\"\�vd2�=\�9;�\�g\�Z%\�\�ob���ŵ�\�tDɥcK K���*\�HA���ot�&:K������\�ŧ�2��B�\�J;�\�\�V��v����Q���i\�\�I�1�]F�\�\Zy�������s\�c�6���Y���Q�\�5�4v\�_1��Gǵ�\��Eg4wQ,;�Ѳ(Dzk%\�YC$\�f�\�I�	�On\n\Z�h\\J\�g�&K���/d�!i(Dx�#\�m8\r�\\\n0\'\�wߍ�h�\��}^�ÁtW�~Kj�_�\�Ok�Xt�.���N��\r���S�@�F�\�\��8\�ht49�U�5\�\�\�\�\��t�\�$Vi�����6\�\0Ѵ\"��\�Owp.SIan�H\�uPg���/,�-��\�H�\0\�\\���)�7�lKu��\�-�\07�����\�	�+\�$�;0\Z~\�5����{#~\�6\��v)*O�¡t�8\�v�S�#�}\�\�\���\�\��\�\Z�\�[[�uq�=m��\Z\�\�*\�g��\�\Z-�\�.HCr�[\�3Ep\�:{\\��m2K\�\�_���� v�\�\�_���[�ye��j:p\"[ i��\�[CFo\�\�\�\�n҅�؎\�-Q�*\�F1�\�C}]��\0f\�U�SX��\�G\�[��ږ4g\�ok\�\�Ӿ8�	\�y�����o\�\�^\�\�@��\�1D�^k\�F\"�Q�Z\���X\�?��1\�\�N(\�\�2��\0�P_��\�bp�\'\�Q�qN;\�\�\�\�wj#�,�A�P\�U\��\�3!TO�ћ�p\�\�Z%Ɠ{�ϜY\�v��(�q�k\'?ZR\0[�\�Iu��FE��,tn�Q��\�`DS\�P\�*�n+N��U�r\�\�W�Q��Gǝb���m\�\�G]�\Zf�R�\�\�m�H�n�r]!\"D������o��\�?\�lo⻴�L�d\�1\'��Mmh\�H#��ڴ\�\�\"5���\"\"�0�8�9jVm�E\�Z���\Z\��ƥ�i�\�G��\�\�@̖,\'�J�\�ӳMS\�\�i\���^:x\�1\\g��+�#\�\�\�o��4:\�\���\�4|\�\�v�\0�\�͚!\�?k�\�]��]�U͵\�}�mI\�Kk��!J��|\�\�jM�l�4\�\�H/��+�u�\�t�\'\���Ia���۸\�u�6�e\�n\��B�\�3Mx3\�f6�Ƌ�\0p�X�iV6�A�8�\�Z\�\�\\|�mn\�\���/\�\�\�\�\r��k{\"B��\��\��\0�hPE�@�c��\�\��=\�t\�\�A�\�?���\���{?\�.4�j\�V�9Q�К�\�Y��\�bN\�6�<%�`4�mP&�b\���\�2<ݵ\�~Skh���tM\�^^l\�\"�\0;�w��{M@\�5��q	\�q\�E��\�#��\0X$�g\"�W�\�\� P\�Ec��Mf�\�=8��\�1��\�?��Ź\�+n��,E���.m��3\�\�\�ڴ��<�,7Vm�b\��\rV\�Ǌ*\�N{}\�H>ڧ\�4]V;\�Ҕ���|\�I#\��\0.Ҫ\��c^��?X\�?W�ʏ�wE��\0*h\��\0StP?���\�O\��\0�\Z?����O\�TO������M�O�\�!�\�\��R\�j_+�\�\�K�巖�,6\�\�OTY\�R���q\�|���\�/J\�\ne�K7��nɉ�p\�\�gp\�t�o\��K�)�\�C\����\�i�\0��H,R~?0��~�=E�\�\"\�|�!=\�A**k�\�\�-w\�Iv�RjH�mf]��N��?P�*��CS�����R\�\�F�\r\�Ķ�U���<pj�-�\�Y�H\�\�߼�ͪ3\�Kw�ᇙ��x\��G49�\Z_<Vhq^hsG��t\�ׯ4h\Z�^�Ȯ:�\�y��	\�Q�n�\�o��\�\�\�\�W6\�\\\�\�\�V\�\�ƹ��m�\�3jh6�\�R\r�#��ndX�&e�\"X\"�\�X������/>�J��\0G�1=?荋/�\0�g��\0	\��\'边�\�\�\�2?H�G_�\"\�\�\��=�5\'\�\0\�?G��_\�o�\�?�߈\���\�\�_P�\�gR�R\�\�i�i�\�\�\�\�\�G\�2���C\�,�\�J�Vo.\Z �F��Cz�\��rO�����=�E�\��\00�\�\�vE~I�h\��u�Xj?ԯ��\�-u(~�\�ߪ:\�Q�C�\��\�\�RSk���d\�\�J�\���/\�ߗ\\U�\��\�c�]�YU���\�Z˧�\�}$n\�F\�]I�Ͼ\�\�7��K���\�s\"m�:\�H�W\�*��\�y9\�\�4|\������\�y�^\�Тq\\\���\�ƿn�\�\�i­kn\r�G�\\A%\�\�H�����?\�ۨC�	7m��e\�@�Y{�jW�\�\�td,\�\�\�~eѯ\�}ϩ:�\�gF��\�J�\�]�_�YZ\�5\�V���׸^�m6��\�w�U�\�6����V(\�}�Բ���\�\�>�����b\�Ό(mu�6\� UIe��0V�\�\�\�*\�\�P�h.j\��]n�f����\�\�jQ\�w\Z���A^�M\ZS6��Ʃ�O�v\�\�\�\���E�4��T6Z<t#�����<A\��4eL\�IJ%ȩ\�ڞI@Wt�ݶ�\\\�\�1��ޛ5\�\�c�d\�)��\�p������\�x&��k�\�\�Y��\�u�Ё�`-y\�y�ת5�P�\"B\"\�\�{^N?m��*[mT�\�\�<\�mCO�\�\�\Zu~\�Jn�v-�\0\�d�\�֝R��U�\�ÅG\��\r&��Tv0\n�4+��;���o\�CKg\�\���B�Y�\�:K5A�\�1���W]B7F���	%2S++[�S\�j E�2�A�H�\�\�\�:U\�\���k\�\�\�m�X���c�z]&))�(ض����~2\��\�*_�\�\"�\0\�\�G\���[/�K-\��\�)�>¤\�ob�R�9m�\�4ﱮm��|�3}-��Čno�\�_�\�B�B\�{{I��s\�\��x\'�\�Q�hb�:x�\�ghV:s\�P&�b�\�\�碑Zc�up�\�?\�\�\�\\]#UҵXڡ��y����[Ic\�P�l\�\'�v\�\��\0T�\�P\�abЪ�oQU����r�Y�`�\�₶cL��ib\�F���q�Q\�1\��\�m/.\�z�w+h�\�\�\�`�\�U����\�\�ۢ���i$�%����\�h\�қ^����\��\�!�F�l�\n\�$�А8��\�@{Dh���nC\�7T�*�\�s���NAI]�\��S��\�f\�\�}F\�\�A�\�mm�[\�G�o�w$7�E\0]�=c\�\\\�ױG=L�\\c&�\�9\�9�G��:�j\�~\�ʕ�\�Q��qc\n�\�.�\"\�{b\�=���t�.���;x�f�`�b,��\�\�!�\�{H�\�;\�S\"\�4���\�\0�A�N\�\�Dr�J137b�U+`�R��\�lԩ���jj3���-Y���\�T��\��I��bDp\�XmL�r\"����b��K\�\�0̱\�\�f\�X�i\'\�o�۳5���U`h�\�^	��U�59+M�$|��E\�\�\�S\�/]��\�u\�Ic�I�;H\��2\�qp\�n����cB�\no\r\�\�\�A\�\�5�(b�(P\�y�K\�\�\�\�==ѣ@�+M�i\�ף)�\�˔G\�޵N��\�#N	����\�3)\�\�7.\�\�P��\�	\\\�$smF\Z\"\�Sz\�\Z\�hv��Mڬ\�vx\�Q��\�\�M:�Y��KjW\�\�u3m���%�Y�eV�ͤ]ڷ�y`�\�$n\�И\�4[\�B\�ӱ��\�\�\'m*n\�\�\�o݌\�F��h��\0�\�q\�\�5�oc*�,v�l�0�\�\�qR�D��[��M���fc���}��[�\�m\�f@qǋ�/M\'�ܹ2�5\�\�{�g\�^8\�9�t#\'�G��\�\�8�B��\�V�6\��\Z��LJCZ�%\�Ur�\�v�#�|ݲ�{.\�w��\�K�m\�\�^\�G��\�\�ʢܩ%AP���0ݸ��@�p>�b��<�IR\�Qq\\\�{\�pf�LӅ�晟Q\�u$�\���=I\�\�\r���\�cX\�\�Z}\�[?0Uί,�\����Yjyv-�ʼSH�`N~�\��	cq J\�V@%���\�K�����A��\�\�Jc\�j8�\�5Hė�\0\�w�b~\��O�de�\�\�D\�\��w=\��T�z�\��\��\�s\\c\�OtFk\�A�[GN:qC\�n\�Юz8\�\�U����q{����ϋ�\�\\GW��ݰ��U\�&�\�6Ծ-\n��\�x\�\r7�\0�\"G3�h��V\�w420�I\�j�ڈ�[�QGS2���|+\�3 �\�l�C�uTե-u\�[\�T%\��F,\r\\0�,\�{ua�\�\�,�nr3u%\�J��\�ݝ\�\�\�s-��4�B����1��ؤ��\�t��ޒ\�T�C��5Mѽ�1\�H�.	�\�\�\�5(\�.A�aۅ��\�\Z�\�\���\�w\�\'\�F\�}x\�T�Eg��\�9\�y�\�9��\�=q�\�s�1\�\n9�8��\�[i\�\\�m��p�D���l����\�8�\�C��?x���l[���i\Z3��n�\�.\�\�\�S�6c�>c]�\'5�V\�~|�$�;���߇5q�4ץr}�\0%���hmf)�\�IOt�W�\�%Xj;\�Q\r�\�5%�\�\�n\�\��kGP���7�!���K7Z,\�Ep�Q�(�\�	���#\�\�<6	ʊ�\�N���\��s�w<x��\"�g1�\��;Q\�p���ⱎ�q\����E\�:{�3�\�\�+\�\�\�9���K\�׊�=V)\�1&\�G�4wM�{�Oq�K�\�LSo\�]��N{�*C��_\�n2=I�pw�[qQf�l1l`h�\�>����O\�>\Z\�F2�ʸ�-R\\	u�Q��kZB�$1�\�\�\�wr��\�\�\�\��\n�ֵk6��GtGy�\�*\�����C\��\�Tڈ\�\�o\0���\�Wz��sV�\�\�<���^�ָ�$����,x3\�p�U��Ip�eM,\�FR|Ϻ�\�\\\�ʐ�\0o��8�>\�\�n\�\�\\h��\�-�h:\n��c��\�F2=����h\Z�\�\�t�\0�r:\Z|hu�`:�\�|������mn\�ֶ�	{\�jK�&{�m.D�\�_�\01A\�b[�\�\�p�\�mWj�A�*ұ���0q�#�׷𕸊y\n��3I�$qU�\��dRF�i\�]V\�[f�\�u;G�hdZLl��\'��C%�\�a\��\�\���\�-F�\���w.�usI�5\�\�6��\�*RO��\�i�x�2mɩ��\�e|�ɖ�\�=[\�\r4���\�\�ða&֩0��\"�[-+U�\�$�	\�.lc���@e�R`\�\�~:��\��sB��\�\�ߒE+\���:\Z4<z�\�x\����:\�F\�F\�5�\�+��N�H���\��0�_D�ևxL�\��>>�2ab^\�\\Gk�9Z\�W52\n\0��\n\�\�A��qJ̴�4i\�eߝ��S\\ƂK�j\�&��d\'m#.^\�߸5--n+X\�&R\�]\��׎���(@%It�GO5u���2\�lA�ȴX\�V6��-��lQQ\Z\�\��\�G1i�rV��v\Z\��M�1�h�m�4�s=\�!Q�e�U\'9Wb0YB\�\�\����\0��\�\�\�5He\��\0W\�.\�a�\��\�\���x�\�+�\�繷\�(\�z�9\�\�\�k\�dP�\�Y\�\�I�����\��b�hx�\rx�xU&��K\Z�b\�,\�}U\��\�␷���\�\�j\�{]\�J`Ǔ�p�\�0V1�e\�@b�)�ځPD��&0\�A/��\�[\�v\����sY\0� �:�B*U��.&�0�\�H$\�\�\��z\Z��X���\�S[��d^X6E�\�f\Z<�oc���b\�\�PM g\�rl;�,\"�\�o\Z��@`N�`5\' R�mU\�*f�4d5�JE�\�k����d�H���|ӷ\��~\�\�\�fåثiQc��ҋ{O\�\\.+\�=4|�\�QS��\\W���\���Y\�h�EsX\�<tQC�s��G�ԿSm0�\�ȷ�p�\�+�\r^@\�\�m\nWs��\'\�cSDm�\�ڰ�\0V�z�\�\��\�\�T�X�\\\�;�#\�\�;Ǻ\�ARߢ\�W\�J�0\n\�Rk��b	�H\�\n�n[b\��<Q�+�U-w��m,0�D��\�by#ң���\�\�ڊ5T)��Xؕ̆:Tj�m(\�ʹlbZ�\"x(O��sUW�\�+Ga\�آˉ\n%H\�C�2\��\�\"�q\�L�AI��������8\"v����C���h\n�\�\�/49�\�5��U�=�E\n�GȬ��iO\�׾�j@Es�\�K�y\Z:\�$\�\�9U�K\��G�\�ƲQ�BV#���V\��\�A�����3J��lҷ\�p;�1\�\�\�\�\�k�kݕ4\�\�YF�;i�m`\�F�BHY�2�.7tH�fp\�]exf^\�p%��٣�k�\0�aG4l#��\�\�\�\"\�,p\�?�S��� h\�\�#+6\�fr�n$\�\�H\r�\�ͼ\�ԥ�	\�#\�L\�m/��a�$�G,���r��\r\�-\�ڭ\� <\"��E���揚nh�#�Я5��\�\�\�<t9\�y\�\�(f�\�x�X�:�OnH%\0��E�N\�ҭf�����.�(�\�#?\�&v~ae4eN0al\�YE �q��Q�q���\�I��\�R��k��\�(*\r�e\�+Hi߁&]�y@�\�3\�a�\�\�&t�P���8	�\0q4.����-ԑF�h\�xc�+m\�$?v(�F��\�{�,�eV��!\n&LIq��ӻf\�\��v�B[*+���Y��E2\�w5\����8f#Af\Z\�Z�6\�ˇ�L/CK\���\�W��>f�\\P��<u00+��\�ׯ\�\�{\rp+�\�\�{�&�@Ԝ\�/	Dj@-,[��(\�G\�(dZ�\\H�}��cVj���\�\n���ӞU\�\�+��+�\'��,d�x ቶ=��˪�$.7\�\�C�\0\�$I[x�\�*F�pGH�Tk+4њ\�\�Oځ�m$�Ħ��fic \�n۞(b;\�R3~\� ��\n*Hk~j\� �)�\ZS��\�\0�i�\�տ�\�\�\�\�p_,v\�vj��v$ī�I���\0�\n�\0C3a*[%vU<P\�׎����X�\�<�=\n\�y�s\�<�GOg\��W�\�\�4\�4\'�\�\�!�\��\�\�\nn���\r\Z��U\�Z��ŗFq�]\��1�#\'-\�e#k�&WaO0Agm�m��,	\�T&8�\�ѕ܎p\���.#�� TdYAʯ�\�R�#[�5&8\�E1\'b�4H�@d����ؙ\'m�wt\�y>ճ\rq1����\�S$�iwT�BɶW\�\"P\�\�Ȇ&C�]��)�z��˵N�ъ\�\���K�s�|v%�IUs�bv\� �Z\0���C\\W�\�\�\�8�1\���q�\�\��\�\\s\�`t\�rk\�\\G��b\Z\�1\��\�T�{\�a*\�2\�0\�2�\�w*\�6e�\�0\�U���\0R\��h�5m��\np�+\���a�-aړ�\Zg�%\�!\�m�T`#�p����ڡ�}\�r�#<p�e�X�F!_\�\�A�VED�T\�rVy��\n�����\"3��ϩ\'�ҳ�^\�\�\�/\�X\"Y;�\�z؏+*\�\�\�x�X\�F��N�)&��\�\�v\��W[A��\���.�\�8u8Vl�\0\\g\�5y�\�\�\Z�(b�ך\�\�s\\�B�G�4\r\rq\�\�\�C\�E\�43}�����W\�~iش��\0����\Z�?���\�)�.i��L<\�h\Z�\�9\�.琵��B�\�lGsL�w��J��\"��Ȓ�#�_\�b9�#k\���\�2L\�o�bF��)\'V�\�:	\��p_m4ѱ�M\��fC�r\��P�vq G�=�d�&�\�al�\�X�\�\�9��Z�\�**DUO�T`\�i��O�}��Έ6鷶�\�y6+\�*7\�+\�㧚<VxJA�\�5�M\n�1\�\�q�\r��W��P\�\�z\�<W��Dn\n�\\H6B\�K��bRY��(pfbZ(F+��\�\�ӎ\n\�o5h6\�K̜%\�}a�t�\�\�lC\�\�\�\�{�&�\��?#A&VK��\�2�:\���c f��wFu\�\n�ӆa1\0�Eba(]�M\�\�\��\�FEVhG����\�;�FIK�\�2��\�\�\�n\�\�uF�w\�9l��H�\�Qm��<s\��q\r\�\Z�1�J1v\�\��8�M$*[\� 2\\}^\�RF#Q\�Ez>8��u5\�V�\���4CB��\�z\n�ϯf�\�Ҋ�\�\�\�\�$\Z���-\��\�6(ά�S\\��̄\�`��n\�P͔\�/��*A8ą�H\�f[r��\��em\���3\�\�\��;\�J\�$�����c�C�*&\n\�u��C���D)�vzMf��\�BRt�$��\���L�k\n�.�e>�V\�3S\�\�mT��Qþ�c\��\��J*i��\��̦����K.\�k;�\�I#-B$db݊��akf]��V�\�@���Տ\�\�c����+��&[9Wcܑ5\�\�\�\�\�\�x��\�ב��1��W�b�b�4{4�\�\�8�h\�mMG\�s^�y9\�L�\�qsk\���	�ˉ\�&�Eb\�ܹ̭�\�\�\�F~���h�Aˈ0d�v�@\�R)\�$8KH�����dj�6��}ߚ{��\�+/l=\�\��pJ�VX\�]l;\\\�oMfC_�usB�\�o\�hj\�\�5\�\�/Qk�-Sk�	�s0]Np?q�5���%\�l?>B\�i�6, `\\F+�\�S\�!Q9��B.\�%-Zd�3\Z�m�\�C5�\�\�\�1\�\�q۸��\�l��X���5yR˶{U1_Gz=\�\��\���z\n�\�9��\�q\��\�y=�#�Z�怣\�t渡F�X�zמ���U\�\�^k\�2�)X\�\�2��\��\�1\�\�@6>K�RWԡ����չ\�U�\�t�$�ҏ\Zq0PӮ\�\�E\Z��0���*��ث��%�:4��K3E���\"\�P��\��\0n]*e:\'\�%��[m{B{�#\�Z�\��w2֡�s�Y4�բz]\�\�m�^=i�\0�����j�\�\�\r�������\�\�\�\�\�V�.t\��RԗV����mUᡯ8/�3G>��Vq	\�M��J�4�:�\�]>�lcH\�n���\���f!�\��p� \0\�Wm�7YZ\�\Zk\Z\�km\�+h-�4M{�8k\�m8\�z�\�\�{\�\nq\�\�3\��\�1�=3B��G���^+ѡY�C��\�\��^z6Z�\�\��\0fA�7���4gd����W@H�\0@\0\r�okB\�[C� �\�\�\"B�0�d]:��[�>��\�v��\��+Z�I��\�iaҬ�Xn4�~i\���C@�k\�&\�5D�\�W\�t����ތ�[%�t\�B\�\�i�E�\0\�ĺ\�ơT�\�\�f����+\�\ZO\�\�VӴD�+�(\�O��e�-I~ia_0\�R\r>=r��\�6��i��\�\�I���\�|s\��GW�\�8\Z\�N�ڌ�?\�mj�$j*\��T`jFt�~䓨���\��\0��\�\�|~\"1�&�\�\Z�h�8\�C@\�hsB�C\�`\�:{�T:�C�� t���鑟~�W�\��\0\\\�\Z\�M](��\�1W<4�N\�Y�%T�\�j�r�\�JmJ�\�FH�]\�m&\�M�$9$Ȳ\�j-�Num\�A��\�j�����\�-tH�lmD��UŦ�\�\�B�|�n��wZ\�H�d]�	E�0�\�j\�U�_�\0R\�5}�-���V\�)\�\�n\�	\�h�|�d�%�W\�4��5\�?\�m\�ȧK\�-��Ck\Z�BD�בѵ��\�ӭ#�1mo�]mdZ�n쳹-�vѷ� @*���\�\�X��{v[�\�^+\�㧬\�3\�(�E� d\�����\��g�xo5�\�B�\��\�\��dV\rz`W�\�\�y\�S�wp)&�?h�\�\�78��A���1\�\�ed܏g/6�\n��7�\�1*Cm,7Gv\�\�+�\�\�+\�A5s\nJ.t�\���\�X��i��m9ln\�>Gێ\�\�O,:G\�l\�-n�+T�6����\��niW\�R_\�I\�S77(\�e�X^k̋WWkk?1�\�U_�[���nK\�Y5\�i9�M\���V\�W\�v\�1KCd@��H\�\�\�\�\�\�\� �A5jLȓʀ\� 2��\0\�˾<7n\�F�\0y.U����+5\���z+�\�ɯT�h���k\�C�\�\�y@� �q�Ɣ��\�t\�\Zq\�<g3\�c _!�?X\n!M\\m4����\���[l�A�|J��\Z��~\�\�Uwo\���bb�!���٧]�M��Μ�	-~\�\r�,ښ\�`��6\����C�\�;h\�ն��\�\�:\�\�_\'r\�0\�mV\�\��\0&:\��m|�wr��\00�����5jN����{���\�_�#Q�4m�5����m\�Tw#����Y�T�i��f���q1+5\� \�.7��V�j\�6q#��v\�ˈ\��\0�Hf�L��\\c�xk\�\���x�B�\0��hy\�z��F�\�hm��\"��s\�⚱\�\�z\�ȯB��u\nOj\rn\"�!Sq�k�Mo\���3T��mC!���\�7pD0Ya�F\�W^��\0��m\��1N�[~\�M\�\�ئ��P�K����6ڴ�����\��\�\�EZ\�\�\��r�]YD��#Z�iIZ�B�b.]l�_�����m\\\�+��(\"H\�\�F����8���n�6��M�A͒\�ѱۄ����\�#\�h�ݽ�3�^z5\Z�(��h\��\�\�B:�8�@&�9���\�z\Z�扯k䞃��B�Y�OLdy�4+ךs\�ڵHQ\�j2h�\"ۻ\ZR�9Yc�Z`$����\�9�\�J�U��\�U\�o� G��A����yqMo���\�FX\�df\�	�ٲ�쮶�Z[Ƕ8�p�=�B�Y,�z��\�\�t_��\��bS�\��\�8<Iq+��\���B,VB�l\�\0 �f�C�99��\"֣q�\\�x\���ʿp\�-��ȉ���v\0�\�t\�(W�5\�хׂ|�\\W�#�$�?\�>H\��\�<��Q�4<xh׎�\�(u\�c�N<t稯5�(?�p\��r��\�v&��X��\00K\�4hZh\�Q�y\n5�\�H\���b}�Q�\ZB�\�Ր�\�n�E��\�\ZuR���\�7E��ۿ\�=�Q\�Q���F�n\�����\��\"c0\�F\�J\���S�b��vn����Ұ��B\�0+M+�a\�F�����jk�\�P�u}֭{��C\�T��\'*ג\�7rs\�%�\"�\Z�\\Q\�+��F���\�\Z$�\�A\�\�x\�k\�S\�s^�\��\"�=Es�y9�zc�f�\�5뚺�.m\�H\�\Z%\Z��\"HJU�aV��\���3��u\�C.���\�@�6V9N\ZFm\�\��\�\"��\Z�����fDu4+���A\"��QM*�\�q*�*T\� %+ɷ\'9���{�\"\�|��8M滃3J��ԉ��\�(\�\�b�wc)mp\rB�i\�s;�\�nW\�-Z�Tf�$��틩̑\�7,ٓG�\'�\�⁥\�����\�z\"��\�x�\\\���\�\n5\�4\Z���\�ycD�4y\�\�\Z-G��B�Vy�_\"�\�\�.C�#\�\0�s�5�i	4��&\�q�Q�,�9��\nL��y*\"q1�$v\�AttWl�X$\�\�}��;K\\Ww�\0Yc$B��i\�>�u*��\n�\�\\~S�Jb7O��d�+6\�y�w�[�c\"& ���i!�\\G�\�l��ɘ\�(h�Z\�\�\�=\�:]JXƽ\�\�\�o�2*\�$kW\�\�\�܅��B6t��\�G�\�\�V8�C��C�����&�W�h\Z_\�W��8\�y�\rhW�s\�E\Z\'�^�~:)�\��}�vБ[�*\�j�%G.*)AXrkj\��,\�P�\�\���*�c@6\�m��z��\�H\�ɓ-\�BF\�\�q�V�Vd%�+u��5q-0��Ҭ��J�@|\�K� \\�\�\�U,\�l{f,�\�k�)�٣\�_\�(h\�Yv�q�\"	7-a�\�Գe�g�\�\�&\�B�.Z=\�\�\�j\�\�\�\�HH̲\�ao�\�Ǡ=i(W��Y\�O-\��@\�4M\Z\�\0W4\rsG9\�@9^H W�:b�\��F�\��W�\�\�O���C\�4<c4\rgm|�\�\�ܬ���2\�T�d�)P\��RE(\�dK\�\�U�њ�\�.\�H���h\�b\�EQ�\0��FZ�J\��̎T�\�I\�(TFd8�\�4rF�%\�*�H��5N�\\-/\�L\�\�Ǖ�.���\�hSs��\�\�\�\�\'t��\�#\�\�5\�a\�\�㵖w�U�\�\�*���D�\�mo�v�&�#Ye�\�74�\n���~�pU48��A\�1���\�\�x�u�\�N)@\�O��k=|׎�zx5\�I\�+\�<\�I�E5s^i��Jy�8#mkVߟhc�\0f\�\�\�(J��+	LG\'\��ڦUj����E)\�1Q�:�7S\�D�\��+F\�� ݜQ\04�YD{�m�;qpy�\�\�\�VݘH͹�7\�\�\�r�ZH{�IcV�3\"��\�c�$H��D\�Ř\�\�&��8�3\�;kn\�i\�]e82�\�\�����\�<�A;�S�K6\����1eg�Q==��(\�\�\���G�Ϣp	\�s�P<{\���\��\�z�V:\Z\��\�+\�z�:4I��\�k�}��(R��#W�E{\"aհ3������\�8\����Wg\�˺�R����7;G��v+M4�ݺ,�b*\�n݉\"滊P\�\�\�]�m\�V�wwcZ�4\�pv\�2\��q$0��۬K�\�\Z\�j=�T%vp�k�dCF.\�v��؊\0X\�V6\�C�$\nyw=\��7�@n0G\�/6\�wج\Z:��^�$,\��\�=\�j�ɬ\��\��G\�75\n#䞍\�#��^)E:q�ЯC\�LVzf�CB�C��8�i��\r{�\�\�z\no�ە�� \�\�`xdL)V0$��T2\�yY�_�\�G`����\�E\\��\0�5m\�s�\�-F2@\�B�2v\�]��`�\�\�9@j^�{��$\�f\�l)l��G��n���YdU܈co�s���?T�m�\�q�\0��\�ۅ�9�{\0횞A�>\�\0T�,\�\���$ة���P\�k\\O�٥�&�{�G���1�4|u(\�#�\�3��ⳁ▘���t�B�sJOB03\�y\�ךM75\�Mz�#�hP=5�ڦjx\�X�e�)A\0Y\\�\�8QW�HT�۝�0\��ZM�r>\�*�$P��\�z��AP���j�d��L҄�e\�v܁�S�D\�G\"OJ[h��\�:�M���\�X\�q����ʲ��JV2R\�6Ϲ��\�6Q��I\�3\0�/q����RLn�mI���(�F\�\�\Z5\�(����X\�h��?��=\�\\Q5\�f�ɣY����\�s\\\�\�f�\n�@\�+&�sC��\�s^\�4�\�f��\�&\�D܇\�\�1�-e`!���B\�\�\�8�\n�\0bHĭ\�\�,x\�<�z̭Q2ն,e\�yeWp\�F��LWuB�\�0-\Z�y�H;A(�L\�ɄDF\�kbCF�\�Ҍ�\��*\�v��\'F\�(�-%-�2\�\0PK�\�\��݋����������oɉ#����0\��b�mK(A�\��\�w\Z*z\�sM\�Vi�<5\n4:y���u�\0^�O5�xǞ�\�OX\��秾�t\�?�漜t�\�`\�:y��H\�VM5c�hТy\�@֥�\��.�\"5H�$��5�\�Y&jӦu��Ĳ\�+5]e/\�8\�I\�QqBE&,`N\�i\'&B�8˫(\�!/Eq$\�\�2�E�Wnr�Di\�zx�Tf}�(\�*eq2\�^\�3ɄI?\�ٶ$icX����\\I#c��)\\\�\�\"A4�\�\�\�\n�?l�\0��C���\��U��\0nO�ێ��\�h\��\�\����\�4:}k8\�\�מ��\��M\Z+׮k\"��F�ѡ��\'9\�+�\'�^\�\��Q\�\�\��\�VzL�љw8�\�ǃ�X\�c�\�\�\\6Ȯ%I\"���\�\�\�I3	c&��\�)U9wM�Sm�vjF�B\�G�0�\�\�\rɘl�i\'�Rr\�0\"�\���W����I݅X\�O\�v\"2E��>Fe�7V��չ\��$�,�;v\�tn�T\�..f\�]\�q$�;���U�\�1�4٣�\"�\���\�O~+\�W�\�\�<\�X�s\�SB���k\�z\�)GF�׊�G�\�A^+ٯx�\��n�|�G�4��S���\��\rW;�\�~\�5is�+[��\���\'�\\lTw&����;\��\0.	(c�!<�J�R\"\�C3\�b#ߚ��IHK\�J�4�LV�\�\�\�\�\�Ll��fp!�_eܫ\Z���\�\�ٝ\�]�\"�M\�\�\"�S#Jȃ�fiBC\�8�LTU\�\�\�\�\�r\�a%�UY.K=\�\�+\�ڤT\�\Z�\�cOcG����R� \�\n&�=4|09\�5\��\'�~\�k5�\09\�\�d�\�sX�\��\0\�ן\�:\ZW�z7�h�\'=1G	�hyZ\�\�\Z�\�F:e\�N��\�ӗŴ�kI\rE!#���\�w�ȯ�\�rV�&\�.\�<*\�$J;h��\�F\r24���\�\�K����\�m�\�i_^\�NC�\�HKO5�H҉\�Q�ҳ���\��\�q�)\�L;� n�94]*엥g�d�;72��<A!*{�S>羹\�\��\�DV-\"Z*v�̃\���\\���x\� �\��8�\�h�\�=��\�hס�z�C�x�5�旓B�\�\�5\�75�����\�\�3`��\�L��DW\�f�a���(�f�T\�\Z�H\�R�.�Ȩd=\�\�\�\�GP^R\Z;��mr\�7�\��9Z\'w�f\�#��\�<��s5m=��\�.#euD��\�a�������\0\�\�d\�GY�\�M\0�/\�aYo	5r6Ȗ\�-\�F�\\�%F]�\0k�Gz耗�,�mspV\�+SOS\����\�\�Z�\�ݾ�{j#\nЯn\Z�\�جנq\�\�c��8�^+�(�\\P�=��C5�zu4Ə\��\�\�(�J\�\�rk\�?�sD�F)�GÚ$P�?m\�Y+YS�P^\�}J\�-2��\'j�����o�6ڊ_�f�+<\��\�\�R��Ơ�\�\�BhNHK�\�\�Ǌ\�e���<�Ѝ`��0h\�b�c�\�a�\�D\�K<)~\�C\Zŵ��t$W�\�G\�Y�5[\�I��\\Ay��\�\�)y\�0������27k��I)�Z5k���c]��Gd�\�g�4+����\�r=�<�\�{\�z9�=3�ՓJx9�]}t\�KG��\�P\�\�Vx�\�\n�\\��O4\�\�\�cX�\��(�Q\�huU;\�\�(�^7*�gn\�ݐ�{��A��xw�\r�����\��\�o\�d��&c\r�ұ���\�0�Ȳ�\�\n����4�YT�d\��\�1eI\�4�mcp%�\�S˽\��G�˕�1�\�kYP\�`F�-��̫,ϸ=\��\�\�[��\�\�\��\�\\\�\��cy\�\�\�\�\�*H��V\�ڴ�V�|�g��=��ȡ\��\��5잧\�k�\"�$ѯ�C\�C\�CqX\�42(��\��j\�[�rk4<\�R���Պjn)ik\�O�w\�kr�jc��\�f\�h�������\nE&Ewp\�(#%\0`\�?��!�\�.��\�AI\'n�n\�w�\�\�\�\�e|��m��\�n�ʒ\�ߒ:��MR\\,�o$\�,\�Hb7\�\"MBX�mcq�P�\��+�\��{�\�Ja�&\�\�N���kK�ԫ�W*$}\�o\�\�\��#SqV֭P۴ =\�m��FZ\�\��C5\����I\�y�4\�\�A\�SW�5���\�k\Z R׎�nOOT9�@�\�ך\\W\0{�Ѹ8�g�Em��\�[ěk�ס[�\�*\�g��\�Q*�\�d\�ά�4nk�\�\�UFU��5��\��NJʉ2Mܒ�$��w*J\�\Z��+(�\�\�\�\�\�\�\"�\�R�]^+�q]�\�`�\�I���W\�nZzٹ���\�/�[�,�K���wi\��qy�%\�[<׈d2�YXR�\n.Z��x��h\nŴ��&�&�6q�U\�\�y\��\0<W\�\nn�(x\�#��Vy�\0�k\�zo%x<�z\\\�:d�k\�h�Dt\�x\�\�\0)�5�+���y��N0ئ\�\�M\�k���p�W\� ��%\��ț\�\�F\�\��%�\��g|xQ@Ҍ\�~�F̌\nӕ��Gp\�-\��u\r\�1\\�o��+Nۀ�;⼅�L���KEs!U��e$\�HF�[3��W6\���\�\�y��AQqn�5\�{�fJ<o{z�W�\�@\�X\�\�T �H\�R\��*�F��&�ԻUt�\�9\�\�@h�\0\�Vk�\��\�\�\�\�|P�A5\�\�\�k\��\0>\�zf�^An��k\�{���=<P\����k\�yjni��\0�Q�h\�V��%�\Z��=\�\��\n�\�ي�\nӨ\��\�(2���c%%+�\��\Z��5�AY\�FIa#U�\�;�\�:\���1)\�\�\�\�%Cr�?%�K���\�wn��U��iN���\�#�$z{�\�.х�\�Qn���Ձ[�\�$4�;e��aAF퐻2#@)��� Vt\�DF�Gpi�\'�+�dY�\�\n��\�8-��P5\�\�\��\�hsA���C�^Iz\�P科^\rY\�\�><\��\�t\�|\�뎄sO\�\�\��MG\��0j\�q|�V7sZF�\�\�.a\nXdS+*\�\�ć��홓c	6�ʰ�6\�yr��nl!YB�`ܦD�@\0\\m�\�\�YD7��_I�\�+�6\�[�f\'	w�>�#�]�M\�e�\�\r�3=1��\��\�\�$�\��\\\�S\Z�^\�yyRV�4�\�EHB��\�\�;����1 7\�۩\0���\�HVO���K9VEzq\�ѣ^U�\�8�\\V2A\�P\�<�hp9輁^hy�Y\�O|\��B��=5{\'\��Q\�LP\�rM7�*	�G��#\�\�5�\�c$\��z��&�h\�\Z;X:\�F��\�9�\nl��-L�	\�劖b\��ju�J�\�i�\r\�\��۞ɯ�Y\�W\�\n)���d�\�\�~D�I �Q(HHߐ��\�X4\�Ot)�\�M3\�Z\�pHن\�$��4�	E��d��\�I��G�I\�	5*�\�\�\"�7\�\�\�VU���ތ\Z\�\�M{��n�`��D\�5�:�\�\�:\n\�Nh\�\��J��\'�h\�k\�f�F�\�\�Td��^�\�\�>)\��ni\��j�o�xY\�\�o�h\�\�\�\�5��Jw)d\�\�\�m���6葴[\�6T	�2�\�l�\�\�ee@շyh�k������6H���=���T��Қڱ�)�e�m}��ks%4�_�ܡt~S\�\�,F楈\�\�\�\rP芪�a\�K�\�\�\�(	1 \�GػaV�]\�}��\�muq7v�#\�\�v������aG�\'�\�W}�X\�{\� �\�y�<\�@\�\�I\��\rb�B�z�hVk\�dcW��\�\'u5z\�\�P+�sY�5\�\ne�n�(Ԇ��kZ�M%\�\�vҭ�\���:w\�4�\�ن�R���\�\"�Si�U����=�%�m�Jv\�\�ۡL2�L��x�T\�(�\�\�	8M\��6\�F\0p\��7Wa�\�Сu�,V����J\�M���\�2\�hc�Ti���{�cR\�Z��}%���}?��V�_��XYܻwl;fIᚴ\�BM6\�H\�\�\�-Et��=g�\�sY�3\\\�F�\rz\�k\�:N9�\\V��\�\�hp<P�\�5yP\�qE�\�>=y\�\�\nbEm���r�_�j<\�3�?�\Za\�>I��pa\��p\�\�nB3P�\�\�2�-�\��j\�D����U�b\�\�~<�r\�\�L�:)��\�Q\�C�\nv\�\��;\�.m�~a�<�w�1�\03\�CA]k\n��\�#�Ƅ�\�Q^;1�\�GD+W\�\�UF\�`\�H��St�1&$�\0I��c�/�1j�\��k\�=C7q~=�6�qmq\�?�t�G�sX\�\�G�k�#\�\�\�#\��+�b��\�c�:\�\r`QmFjL\� �V�{�\�jS\�+ݮb\��n�Oԩ��\��^\�h.�\�3\�\�D}�ԓ�\�EY-��[�\� \�Rn\�\�#�<Q\�m��Vh\�9F��%Y\�gf)\�,9;\0�r�ڄ�+�\0\�M�)��k\�>\�C\�]�+�6��0�䌂P�(6dx p��.\�XϕU w�T��Ƥ1m�i�:�0�<H�s>>\r�\'���v��\\W�\�x���V�\�H��\�\�^(x��\�׊�@5���?�\�\0@\0\0\0\0!1A\"Q2aq����� #BR�\�3\�b�Cr��$4Ss��\�\0?�\0\0h��*OU*OU��Rz�=T���T�3����J���=T���r�\��1\��ԧc)\�\�G�wiѱ\�D;O\no\�\�=��ls\�*��L\�L*��\�NS�i\�i�\�7��\�\���\�֡�\�@vU;Q�\���ڌ�r�Bk�\�2>k1ꮌ�WD���P�I\�\�_��U\'�$\�z�(���=P�\\P&Q+1RVd\�x��[ߌ�xY�#��:��B�.y�>�[��\��U^ѭP�0�%α\0�Y��X(�8Y˺�\���xʜ\�ہ��Ps�p\�\'ܛ���5~i\�אvM!�A�#u�\�d���*X\�g��\�\ZD�-Mt\��!m\��\�o\�z\�~\�]\�vT�\�n�J6CO>\n\�e�h�;\r��.��V�n\�9�uW\\H�n�w����m\�\�z\"n�Kn\�*g�\0���\'Sp�\�u7��,\�\��ٺq\�D!<\�h\�+�\r\'\�\����7�\Z���Ók\�\�uGQ�\Z�áX.ҧP�o\�zmi(<q��߆��<4D��Ȏ!\\>\��\�\�\n\�eB\"\ny\��\�꡶U�md�­�5\'!�E\�y��cF���\0\nI\�Nm\�B�]d Kn��5M7�e9��U)ǚ�S�	\��KWY�\�wS�fT�\\\��x����\�eA,t�\�AM���µ�\�Dy�$B\�\�h}��\�ꎣ��p�J�o�O\r\�\�U*5��3Ӫ{�뺤 hi�M}\0$M��i\�N[���\0E���\��\�(��%\�&�\�7��c\��E�\�\'T\��^�t\�\\�\�\��5�\r刺���4���\"�O\�M\�\�l���\�\�)M�(8)��2���*:pZ�_\�z\�\��^\\<\��Y�\�s�\�\�\�Ox`2�x㘱�����~��\Z\�Jv\�_\�8\�S�m�+��\�3\�\�\�-l\�mi\�~��C��\��\�#k���#��\�)�؈!\Z$\\!Mɴ��L.\�y�+�-˻�0\�M�&\�D\�p`_e�����t�w.�?]\�\n�#���k�J�P �Sn���\"V�[�,�B���\rxj�o\�\�\�6\�m׆�h �UiUjd�X\�c\�\�`�L�\�J=\��&Qk�\�G\r�u	�\'d\�A�W)+��T��v\�\�\�D�Y�Sh�\��\�t	��\�\nQ.�YA\'Q�E��!E�`\'�\��$��\0\�\�\���\�i\�\�\�`�Ay��\�6�n\"�L*�h\0@�\�<\�:\�x����Q\nz�<c��\�Qe&Q\��D/B��j*J�{\�cq���r�\�2��\�u�b}�\�2!;\�r\�	��_\��Eߖ%2�7\�x2���-1\�\�;�\�.榥��1 4e\�<ܣm\�iH-�ir\�i�je/\��P����+&\�n����H�ѥh�S�Ƌ��F=:������p��\�DF\�\�Pl��V\�/�dz\�bYX��bT{ѿ��8b���t�7C��\�r(\"<\�GT��$�b��ɧKN�޲��\�2{\�s�Fg1\�v@8\�-�S#|Ǣ˄hS0\�v\�ɘN�\�Cm\�ٴ�Wtt]�tN�\�\�\0\�_�q�h�C�D\�yuB�Z&ShA�0mr��:!CRBvo�v\ruO\�N�U\�h\n\�\0<\�\�\�y���r�Qk�10\�Ġ@p�\�\Z�G\�A\�sFmO\���E�������R�8\�\���\�Z*�\Z�\\l\�\�ZD\�By��\�\�Y�;�\�\�AwT\�,\�6eS\�\\§�v\�1�ʙ�h`��_b��쐆�,�\�ٖ�\�3r,s;!C�M��[�\0(\�\�J\�[�n:��$\�\�R�\�%w\�\�p͓#ESN�T\�ǵU\�H�\n�.\�\����^\�2\r7͙6m��wna\�R�.>�`k\�!�f�O%q}��\�\�Ǣ(V�%O8A_�<5���)\�\�y�X\�a�r�\��M\�\�\�;#f��s>�\�[�5-Q\�@\06ʎ��d(	\�w\�43p�$[U�m�wʅ\"=h6n�$	\�V]\nkZ5YD���Ӛ eYDL]m�Y�7���\�6O�\�L8\�#\r#E�Ö�k$6�ۜJ��%=�\\ݾ*�\�\�\07�,-~�\�m�������;l�+^>�r3<?n<\�\�9˴1P;��\��\'�\�I�!\�/d\�\�\Z�XA��Xl�\"IB�\0L�dh腄B�\�ޤ�\�E$X�T\�@��N!\�`�\Zm+K�s,,����\�i\��iDLX\"\��!ToE^�pFIA���\\\0\�ʄ���;��Sb�@vT�Q����\0�a\�\�ODPQ�	R8j���#\�4P�p��>J~+TS�\��<\�|̫�z&4�m�{�\�\�\�Q\�l��\0K�\�*c\�i�y_�D�ޅjnV\�\�,��7��\�k�E���N�L�����(;u3*%Y�L��\��\�@9Q\�T\�\�N�{A7*�\�q	�$�\�ż\�\�\�ʋ�F��\n��\��\'b��z߄/$Q�!J��S\nS�%v�\\���\�����\�]�D����\�򅁠\�\�\�eB�\r��@\�BͲ�h����ã�L�%H�0Vq$7�,\�\"\�h>\\3B/3�\�-\'\��f6Y\��\�\�\�Q�\Z	A�\�42\�P�\�=��p麬�A\�v�f�\"Kt*�\�Q�5T#�p;�N��u\�\�\��$|�n�(#\�\Z\��Ъ��\�c*\�\�\�\\���Ίv\"eRаTM�Mh\�\�|ɷ�&� \�N�JѤD�p\0\�\�:)��6�T��}ɳ:�\�N�\�\��\0\�S>\�}Si�d\��\0��\'5�,4+xG\�~�\�\�rH�\�\�\�X�Supr���$\�,-Qs\�T\�V*�`N\�c)\ZU3B�Z_�\��EŵYQ�k詸8\�\nm�uZ�6B\��P0����F\�JӇ���V \�z*�;\�z�m;j��\'U��&\�ai\\;YXVCS$&�\�I�Y:\0�PqN�b��N�ʪ����d_��\�\�:o��ks�Q{�B\�wE͋j�\��胶\"ɺ˅�k3�\�M�~��\�H\�\0r�\�\'�]<e\�ب9d#�p�\r\�a�\�S\�ݘMyv�KD�X\'���\�N\�E<\'ܜ�S�\r8J�j�\Z�䝢\�<6�E2m�g(\0j\�o\0*L.pXf	,�`\0!1z�I�\n`z\"\�\�\�\'D_挺��e6\�\�ڏ͢��\0\�\�\�U��4�\�n]\�X��ܜ\�D�+!L���|Ц\�\�k\�O�D�{�ܻ��\\dy��D\�\�H������y��8B.,vf�\0�\�\��?^\�^d �\��B�\��S�\��A���\�d\"ܮ���\'�a��o-�\0F�pgh[���mt.��`���\�\���Dt\�n\�8\�i���M!�h(m6Z$,<\�\�a[`\�\�\�6\0�ySA1d]�KA�uN\�a?$i�Κ ܾs)���\�|�>\Zl<_$ ��沆�]�\�1�\�f\\N�?��ٯ�2\�qm��N\�B\'K�\�\\\\�]�)\�\�(k\�dZA��T^\�\�F\��\0\0��pZm6i�\�S �E�P�\�\�\���X\Z�͂tM(�㧧�\��\�f\�-�uS\'\�=˴/\�6���(t�\�\0\�a>-���\�t\�\�T\������:\nu7F`9e6\�O5�×ڌ>]TE�\�G\�\'\��u��{\�\�H#X�4r�2�\�G�XF\�]��\0�(؈�\�	U3���8\\��r�f���\�\�(l�\�H+PP\�\'EU� � �U\��Cr�;\�u�qk\�ӣ�\0dݖ�\�AM(�^\�デN{���_U>�O�<\�žj;���\�ݿ�q\0�\�\�0�Z�\0�\��\0��tV���]��xA~\�5G44�sxt�\�\�#�в�H�\�7�\�d$f\�#\�>�C�t�A� �G��Q\"r\�y�\�\�K�Z�[y7�!B��mS�\�\�9\�>�\�Ե\�J�<\"STs�\�9����\�g;G�ٖ�m�!��1h+\�_]S��ܬFX2!ʰ�6���	���:=~\n�L��P�������4�%n���^�U*Tp��Ԣx��h|�K\�wBJ�mɺ\"٦J��؟_U�h�����Y0\�J�\�p\�K��O�\�]\0\'���\�k�\�\�k~p��/\�@��\�>��$�T5΃�\0�[ة�hSCD�L��\�;i泑�#S�͂��3�]\��\�S]\"\�\�U\�јn�}h��\�24^Z\�:^ f�,CO��/\�5���-wM�f����A�=o\�QC�\�R�\0��_��DtNX��0��I\'xM2\�nP�m\�J�9čb�`\�Z-t\�l��蛬�VBA3�$k�� �:�\�_.���\�\�\�fcX\�u?�sƈ]\��Ji\�\�!m��)\��\�\��àF�\�\�$k&&U�\��J�\�-�l�P�^�쀰t\�3Y\�\��d�\�Um\��Cg؈\0\�Ԧ\� N������\0)�[\�Ӏ�G\�X��Z�)D۪�\�D�4\�5\�ΫI��A�m��6;*^+E�\�\��\��tMM�{\�/	��s\��A�}\�\�C\Z^\�ޤs9�\"ُ\�Q����/0l��N�ٱ�Os��T\�&d�ڛ��/\rt��\'�\�\�\�NK`�����V`@�Bni\�3�f�B<_�;��\�:#���Ge�EPZ�,LIU� \�0)\�n\\\�\�>+-s]�\�2-\��7D}\��\�u��NpV8}]\�) ��S���\�3hM�-neJ�N\�F\�A#�lz�@\n@�\�ӏ,~T]l�d^\�\�xWy$;`�k\�\�w���\"���?.�\�������Q\�<g\�KKA\�؃�\�&a6�Z�\�2��&粥��,��}B,\�\��5��*/{B\�kVh�\�\\ܺܢD��M?�\�O��\�\�[]�C-˲\�ӓ誷P�\�\�UHk��t+\�C��B\Z�8�\r8\���5�-G�4o�\�U\�<��z&�?rs�x<�ڳ��\n��!ڕO��y�N7�����P7�h��LsE\�N\�`3��5\�\��\0R�j�iS3�\�\�8��x\"Zl���0D}��%:�`^\�t7\"p.3\�p�:|��͘ݻ�B����#T�gc�U1L�tC�)�\�tq\�\�e�\�\�._n�}���k�<Is�\�,��ڠd`\�\"\�\�U\�\�c\�ۢs\�\����L��\�so��&@��AG\0�\�\�#~\0�c�\��Ev�9[\�TZN]�S\�tT\�&S\��a\�@\Z&;,\':9�F� e\��W�|�	ݳ�k�9\�5�\�\�(�@�\�Xz�gaU1\�~��z\'\�Zo.���\�4\�\�\�#�%3H\�T\��\0�\�\��UeB\�\�\�8T\�\��vZ�|��\�>�\�\�\�\�Y[��\�}\�s\n΂\�(�\�1\�t�Ц\�D�*�2�V&�����V��9�\�\\�\�.{\�}\nf0n�оݱ*���c&}\n�\�A�\�*�?\rg��	��#�\�\�}�l�\�\�@�\�\�\�}UfH]�M�)�@W\�9u��\0+\n�_o\�Qo+mp�\\+�FPP�JvF\� J#އ\�t]�)�v�+\�sE�i�*?ܐQ\�Q\�\�\�*�\0�� �j\��uCp\�\�\Z�\�۬�,k14Z\�Wjg\�tL\�pqq\�U*�\"5M\����|\0���u(\�\��\�w�\��Bv��=\��O�၃L[\��G�\�9\n�\0I��ӻ\Z��8�\�ʪ\�өr#���\�j\��U.ثH���\r\�%P\�\\%h�S\�� 6�r<�)�o\�R��F��UKb\'\��*\�i\�%�^=G���a$;�X�ӯ��\�2�\�<f#7yQ\�\�%C�\�7��\�7�\�rc\�\�\�÷�ʧ\��f�\�\�׽7	�g�?�z|(�\0��\�]\�&�V�z�\�=�©Db\�A�\�`*�\�J��\�\'�U1��>c�l\�v\�2k�Uo\�\�3\�D巒볜{��suM�����\�\�T ���\�#U�\�f�gO�\�\�M�?\�\0;�p��\�\�1\�\rW��v�%ت�|�E�\�\�w��_�&aT\�T\�ŅcHhZ�\��@�\�d)����\�&�&\�$\�I�\�\���\�\�MuE\�C��F��\��\���H\0\��\0k\�\�Z���sA\�S\�|c#�\�:\��C���!���\0h�J�\�]�XC�e����b�]\���g~]V�\0����\���6�-e\��h�Vw䷢\�j;V軒��j�Qp\�Jp\��	��\�s\�e�UR�\�\�v\� \�\�O�R\��������>K\�ܼ\�8�1��ڵv`ip7?$�`z�\�1\�\�\�\�\�i\�R��r�\�T��\�D�\�l���j���rO\�Sm�w%:�\��~ʵB�\�\ZLz\"ߴ5�zM��\�vN3\'vڍ�U31ϥP~%?\�,$\�t@X�P\�*-�\�]�jo\�-\�_���\�3U�\�\�f�\���b�=e>��v�T�9�T�\�6�X\���S\�TN&�0f�-\�T?��O`{�;&GT�`��\��&b\�\�\r�T(8פ\�\��cm1d\�J��l\�\�4Z]V\�\�Qb\�aB����\�\�\�o��܂u�B�\�T��N\�\�&D.\�\�\�\�?K�\�\�ܴ�^j�iҦ\�\�z\�\�Tg\�\�vcIŒo�`���?&W�\0�\�\�(������xv�\r�\�޿KH�#B\�\�E�L\rJcj\�\�\nT\�S�g�\�/�U�\�Z;E\�]��M\�\�B\�RrĕJ�>I��Yxn�F\�\�\�\�b�H30a�_�j��[�\�v\�V08U�<�h��l����.�㥺�J�v���ʃ*u,\�*\�2\�s\�UN�Y\rh�\����\�\�vU\0js�T(Hה\�;#�u�ov\�M\�V*�N\�͖�*T\�P�L�\Z!L5�q�]V7�H�YCڱ�V�q}l��\�ݪom\�\�B&\����\�j\�\�ʧڭ0!\�U:��,\�\�_\�:&�⠅�\�,C$i:pnoRe�\�\�\Z��--N�\�\�ʗ)�+�o�}��{�G-�*�\0rm\�e<\nӌt<�F�h�\�/���\�{y\�S\'XX���.y��w�=\��2�=�\��˔ ����v\�	\�1X:�4��G�?�쑯�:1�\�\nt07UlKᶧ�X�#\�g�e�����4N\�?����3\n(�8�U�{IfQ̻!��*8�>i�T*�+\��\�*����\�~AJ��<\�vn�����/(�ؼ�Ч���\�F�u���#\�:�zs�4+4? �,C�Wk\�2F]DD�\�wѫpa\��{jf�C�L\��\���^!R짾�]\�=U5J.�e��%2�	F� \�S9�K1ki�g�­D\�\�Rt<uN2���d	\�\�P\���qe>�|�*7\�e\np��[�(��A�tU�5\�Ӏ!\��Vel�֢b\�ܛ@\�1&�X�J-\��]V\Z�h\�a\�\0\"Bhj\�\�\��Ϳ�\����|�V^��\�\�>T�\�p��\�gd7�1\��vnO\�77]>J�`aI�ܽ	��\�X;f���\�$�\0Q\�5	\�M�����;�`#T��U���\n�\�\��S,ȧ��, 5�\��ʅ�isE\�\�>�;b,avC�hd ���r�7Q\�Qx\�[-\�\�U�\�P�\��`�tؘ:�\\ܽ5T�\0����R�\�\���\�\�%\�^�O�\�\ZT\�rƊ�&�5T@-A��Z�����v\�8\�>}\�\�b\�3!�d�Yj4T�V\�$�h�9��&�CK�Mv[h�u�ߌ->\�� ��\�z�HXj�\�@�\��Y˴(RsKC�b)R�S��\��c9��Z*,\�l*2\Z���\�R\�\���\�A�*-��.��b~$\�\Z��&!2�$�.(\n��e\��Qc�s��\�ho\�A��n�V�\�\�\�:o�~��V�!�\�\�O���s)��^�\0!�<\��\�K�\ZKf\r\�(����L�\��7��\�\�i���f\�!d\�9�\'f�j04@�X#�\�K6��х��V$\�7����3\�;Pm+\�h\�ʥ>p0��\�0N��T�Ҩ\��Wn�\�]UVwuH6�c\�\���ܞ�y/N!3��`�\�\�\�\�p�G)pv�O��\�\�5\�;<�{U�\�R�\�!��5N�p]�_�\0K��\��&~,d����I]\�\�����\�(T\Z�\�\�5L�\�a�\�/%�a\Z�\r���\0p$ڏ\"YK+~��T<^\�,\�\�V�ڪ�3|;�\��2�*A����3M�M\�Er�\�8\�m�X�5\�Whደ\��\'Ml1��\0n�\��F�n\�&ұ�T\�9�\��An\�\�P��q\�\�yؠ\��\'\��UF��\�\���a�\�`�e�\�;�\�h^ۧR\�Ev@�,;���\�\Z�\�;�9��{�jS\�\\\�����e�@�z*g�X�5��R\�@%7�\�\�%b`\�.Bś8tUFWR\�\�_=S\r�촂��V/\�C2�\�\�\�\�\�`K�צM)�\�Ƕ4�M\�\�\�mR�i�c\�YF	�d\�7\��\�\'=IoEV�k�Z3\�:�x�� �U\�7\�f�pՍ\�FPkh\�=�\"���_Uٽ���\0�bD\�v\�\�\�l�|ƨ�]Sc�\�Bp2z,CUFI.\r�Ew�\�|\\9�\�j�S��\0/�	������\�\�4��\�\���N�\�~P�F�1\�\�\�R\\��\�yD��X\�u8vg��R\�<Q��*g\���\nm�.\�\�Fj��ⷽvuӥE��\0+\n�-n\�m޷\�\�~\�p#�P��\�hP�\�-U�\�`��X��Qߏ�x�\�K��c\��9�T`\�\�.�cK�\�\Z�\�GD\�\0\':�nY2|�i���\��|@\�´�\�9�\0\�O�7�\Z\�S�V��\�\�ҫv_h\�K������9��\�D�����\�hv\�9GuS�m�Lo�\��\0\�bf�����\0Ϳ�G�{n��M���ɪ���G\�\�\�\�>7Xn\�\�\��t\���\�\�߲e0#`���T\�\�X�\�4\�6si	\��U\�\�&\�\�U[\rF�J�;\�5\�ПM��đ\�\�\��*�{w%\�F!�폖���`�N˨\'��\0��S\�Tg�]�!ڔ�\�#���_\�sf`\�?�\'�M\�\�i�eC\�eM��TH�w`u |ʫ�\�*�2i\��@H�ʟ�=\�<�� ם��\�?£����M��oEZ��\�\�a\�w�\�\Z6?u����$��T�\����\��(�^� \�pE�\�z���F��\n��\�a\Z�Yk.\�Â\�\�$*��p0@X A.�Ѹ	��p<\��t\�el\�\�\��Ǳ}��de�_l��z�UqXz\�\�0\�B\�(\��F}P�\�\��`�\�M��h4�٫�5�\0�SZ���c\�\�\�В>�J�H�L\�\�n�,�h�S^3�Z薁�����X�PuZFi��\�\�{G\�Q�1ݞ��ۻ>4�7\�}\�t>A�8\�\�\�\r5��}L��S�\��A�\"H5\�\n4��BI(�q��X�w�.tG\�Eٸ|\�\�O\�Mh\�ӡL�\�\�s\�\�\�\�m3k\�8\r�<,TAGd\n�6�D.!8B�[�i�\"S\�l���|�%���\�t4\0Ae���O$N�U\"5(8: Z\�\�\�SvXqԦ3;�\�lX\�:\"\�*�\ryl@\\�#u-\0frs��O\�Q���U\"\�\r\�\���h\rc.S\�\�V���C��֦�4OĵωG`�}Jk�ӝ\�U�$�h���f\�t\��\0$Ύ�\�\Z�����r�<-\�C5\�:�H\�K6�\'88\�GC;�I��){��	���Z-ae2\���ò�w\�<˭���\�.������Aj�;+\\o�#I���*9fE\�7���\�답n�oED\�$.z�\�\0��\�CI͢$��;/��Ht\�8�\�Fkr\�I\�滰�h�\�\�y�Ti܍S\�/�q,w�c�M\�=��;,*2\�\�t\�iyp\�0\�\��(GYU��z&\�MS��}\�~�Nc�b,C�2\�,T\�1�T\�\�`�\�\�84�n�\�\�#\�\�@��g ꩀA�:�S��\�Ďt*vR�\0C��V\�!\Z&x㪠\��F�\�S�Y�\�b{ћd��\�4\��\'\n���CEO�\�	��\�\'��ξ\�\�ʲ��ʹ �ԡ���GY��3˜\'\�l^SY����� �\�Fo$�����e)�mFkuk[DCsf)�����Y<ωD\�v��\�\�4%w-0x\���\�UÆ�r��\�eރ�m�D&P��w\�=9�,V���p��e��2\n����\�I�\�T�#\�l����<:μtA	��\0.�\�����T\�\�4�\�ɛ\\*㔝\�e\�vNTw	�x�\� ��u�h��r��U����O��\�w\0\�\�	�f�#E\�Skb/�G��\�3m4UcCeQ�\�\�V�Q\��7�\�\�\�\�X|L�M�k4�\�W\�d\�\�^��\�vߊf��1�\�9)����i�k+���0���^\"�N�,�B���M\���v�S��\�Z~k�\�\0\�I�[1���5*���Ӂ��߈\�B?(�F\�h�.�P$,��\�\�b��R�ʎ\"�Xʫ3m��x��\�H� \�i\0@T\�\�t2���i	\�T\�t�\Z\�<YP�\�3P��l	�3\�ZP��OEZ�k��)o\�U{�\���33Iʜ\�f�q@�\�\�\�\�:�\�e�f�M�\�\n\�LAM�#YE�\�\�Ipl\�R$jS���\r\�8Ǣ{�	�\��\���\�\�fXY\�Q��\r\�bj__GRQ�Q@�y\�~\�Q\�\0�(\�A���lU^BO�~ɓx���C ��&=\�\�[I���<\�P6�\�	�cd&l�\"S��	ě���f_2�@2���_�\�`\�U�\"\0Oq3<�7YI�Oy\\��\�]\�+�swT�\r\�T\�&\�\�\r�]od�׻؃��I�k^țj���\�#��\�\\�$S1!�\�=UW��\�\�<��q���J\'������]o	Ǽ�\�Tw�vSS6�g�·MV\�S��^���Dǃv�\�j��\':�/̠@�*��\�5�#t���\'ɓ�{�.�>\"!d�2�P\�9�$�����\�K��w�@o�\�6.��\�Dܩ\0]>�6Wy�Tڏn�6�tuY\�J.��.�q�|!V(X7r�GT�\�$L5ʯ\�o\�EG	��B<b\�-\��.\r=V\�\�\�.\�\��!�pMt�(\�\�y����md�wwD\� F��1�s�\�\�\�\�Ͳ���B\�d[t*��s��<\�\�-�T�\\�R����\�\�N�A	��F�ln��e\0P\�\�]seZ�Y�\Z\�\�M�r\�SOK���U\r�\�wN��U����XjO\���(\��4�\�j�<#�Zq<\nی�%m\�)?�x\�Sj6�Q��w5�\���Ъf\Z�\��M\�V�\�\�;�F\0Y��\��\�UXw�f�\�\�fz�#D@h�M\�˥\��P�\�7F`�A]\�6\\�i\�}�	��n����\�\�|����\ZJ�\��]\�6�&�J���\�TX�W&�\nrq�I��S�\�\�\�\0��JyD��x\�l���(�;)��j�Bɨ��\�H�B�P8^\�]�Y��f\\\�μl��`�L>\�\r��\\HEЪ@e8�\��\r�F�7L��\0�c��L�F�\0�5��cu\�\��)��-�@�D�tʻ�;O�[仺\0�\�M\0.\�\�`\�\�*\�zn�M\�V9�\�s\�ZH\�j�b=��3p�\�i��L�AR3D\�V\0or�\�j��\�>\�i7[�\�E��\'Us�\�\�-�֪5��T�]THQ\��/��\�0�GF��.\Zʤ\�\��L7;-4O\�%@\�7UD\rn�\���U�J�H��_k������u��S��ꀧ\Z�\�s\��U{N�PK˚n\�p�M\�J\�\�\�{�*�0X�ި\�\�S���,7�V\"Cj\�e�\�j=\��h`�a\�\0�\���\0\��\�T\�xv\�~K\�N�J��]�ǽݨk<S\"\Z��D)�Lx�\�\�)ݹ��ׅ���õ�\�:��U:�q�;��OX\�.�����,>Vȿ\�NsdD��\��0逜\�9�ULF\��͛n��\�S�\�\�V\�D�R���h�Q\�\�x!d\n�S�*�\ry	\�SF\�I)\�R1\�I-u�j	\�UF4\�Sʀ�\�\�\�\�5*��)\n�\�\'�\0M�Ma4\�p\�\�iU?�Y���*5\���G�\�>�.C\�-�/���h�����l{�%7]��uI\�\�[\�eZ�\��\�\�t��oyO\n���\�(_D\���*���L�l>+	�xdx�\�\�\�ưQy�\��G�1�|1�\r\��M�j�N%ً��\�S��21�\0F�a�VMƅ9\����\�c\�UjH\�)�Ⱥ,�\r\�\�\�%��G�\�p�\"�jz���\�n��k�O�O�\n8Q_=Vo�\��2\�\'�a*�Kf\�\Z�l6��1*�-��)Mfj��)	�\�L,�@-	�p�\�ff��>\n�\�\�}��j;3�5�^��\0\�ݜ�\�eG��\�U_\�\�\�q�r-�4\n���c�׺r��%3�{\'\����\�\�\�\��4\�f\�X\�z\�Vd�rӻ�\�\�O�a�����D\0-\rӄ\�@��\�\�5M& \�;\����\��*Q\�\�~<>K^0�F\�\�\��tQ\�piZ�\�\�^bBc��',1),(4,'jaquino18','f55cc3b0e8e0dba3050d66c9de131cdd','2016-10-27',NULL,1),(5,'jarumynov25','2ca7beb3259b7d2843610cd84f201070','2021-10-13',NULL,1),(6,'omaruiz2000','a395bb40c4de3a1f749a9ee6f129f06e','2021-11-23',NULL,1),(7,'xuan','9ae7095baa4798a8cfe0a061fc965d2e','2015-05-29',NULL,1),(8,'pedroper20','3ede9d5a33b4fa9323c7428faeba264e','2020-12-03',NULL,1),(9,'marinassalazar','078981e8328d4b39ad898b40f1c3477b','2021-10-13',NULL,1),(10,'albertorivera','03f3e46513a03b13e05bd91b8bb5d525','2019-10-13',NULL,1),(11,'andreapac','ee14168a1083d988c678acc61ce3b349','2017-05-21',NULL,1),(12,'gerardorami10','90758c62f02bc6ed660f26222d423a4a','2016-11-17',NULL,1),(13,'davidllanos123','c8549762ebba1dcf8ea23bbc47f012bf','2020-12-17',NULL,1),(14,'omarpal12','a395bb40c4de3a1f749a9ee6f129f06e','2020-05-21',NULL,1),(15,'lionel2001','0211cd7ad662110ecfc89815ff38000f','2022-11-21',NULL,1);
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;

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
-- Dumping data for table `vendedor`
--

LOCK TABLES `vendedor` WRITE;
/*!40000 ALTER TABLE `vendedor` DISABLE KEYS */;
INSERT INTO `vendedor` VALUES (6,19),(7,29),(8,32),(9,42),(10,25),(12,30),(13,29);
/*!40000 ALTER TABLE `vendedor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'DBProyectoLP2'
--
/*!50003 DROP PROCEDURE IF EXISTS `BUSCAR_PRODUCTO` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`adminjoya`@`%` PROCEDURE `BUSCAR_PRODUCTO`(
    IN _id_producto INT
)
BEGIN
    SELECT *
    FROM producto WHERE activo = 1
    AND id_producto = _id_producto;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `BUSCAR_SUPERVISOR_X_ID_USUARIO` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`adminjoya`@`%` PROCEDURE `BUSCAR_SUPERVISOR_X_ID_USUARIO`(
    IN _id_usuario INT
    )
BEGIN
	SELECT  u.*,
            p.*
    FROM    usuario u
            INNER JOIN persona p ON u.id_usuario=p.id_persona
            LEFT JOIN supervisorDeAlmacen s ON u.id_usuario=s.id_usuario
    WHERE   u.activo = 1 AND s.id_usuario = _id_usuario;
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
    UPDATE almacen SET activo=0 WHERE id_almacen = _id_almacen;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ELIMINAR_CLIENTE` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`adminjoya`@`%` PROCEDURE `ELIMINAR_CLIENTE`(
	IN _id_cliente INT
)
BEGIN
	UPDATE cliente SET activo = 0 WHERE id_cliente=_id_cliente;
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
    UPDATE devolucion SET activo=0 WHERE id_devolucion = _id_devolucion;
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
    UPDATE moneda SET activo=0 WHERE id_moneda = _id_moneda;
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
/*!50003 DROP PROCEDURE IF EXISTS `ELIMINAR_PEDIDO` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`adminjoya`@`%` PROCEDURE `ELIMINAR_PEDIDO`(
    IN _id_pedido INT
)
BEGIN
    UPDATE pedido SET activo=0 WHERE id_pedido = _id_pedido;
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
    UPDATE producto SET activo=0 WHERE id_producto = _id_producto;
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
    UPDATE reclamo SET activo=0 WHERE id_reclamo = _id_reclamo;
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
        IN _fid_almacen INT,
        IN _fid_producto INT
)
BEGIN
    UPDATE stock SET activo=0 
    WHERE fid_almacen = _fid_almacen AND fid_producto = _fid_producto;
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
    UPDATE tipo_de_cambio SET activo=0 WHERE id_tipo_de_cambio = _id_tipo_de_cambio;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ELIMINAR_USUARIO` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`adminjoya`@`%` PROCEDURE `ELIMINAR_USUARIO`(
	IN _id_usuario INT
)
BEGIN
    UPDATE usuario SET activo = 0 WHERE id_usuario = _id_usuario;
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
	OUT _id_usuario INT,
    IN _area VARCHAR(50),
    IN _username VARCHAR(50),
    IN _password VARCHAR(50),
    IN _fecha_de_ingreso DATE,
    IN _foto_de_perfil LONGBLOB,
    IN _activo TINYINT,
    IN _tipo_de_documento VARCHAR(50),
    IN _numero_de_documento VARCHAR(50),
    IN _nombre VARCHAR(50),
    IN _apellido VARCHAR(50),
    IN _fecha_de_nacimiento DATE,
    IN _sexo VARCHAR(50),
    IN _telefono VARCHAR(50),
    IN _direccion VARCHAR(50),
    IN _email VARCHAR(50)
    )
BEGIN
	INSERT INTO persona(tipo_de_documento,numero_de_documento,nombre,apellido,fecha_de_nacimiento,sexo,telefono,direccion,email,activo)
                VALUES(_tipo_de_documento, _numero_de_documento, _nombre, _apellido, _fecha_de_nacimiento,_sexo, _telefono, _direccion, _email, 1); 
                SET _id_usuario = @@LAST_INSERT_ID;
    INSERT INTO usuario(id_usuario, username, password, fecha_de_ingreso, foto_de_perfil, activo)
                VALUES(_id_usuario, _username, MD5(_password), _fecha_de_ingreso, _foto_de_perfil, 1);
    INSERT INTO administrador(id_usuario, area)
                VALUES(_id_usuario, _area);
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
    IN _fid_supervisor INT,
    IN _nombre VARCHAR(50),    
    IN _direccion VARCHAR(50),
    IN _activo TINYINT
    )
BEGIN
    INSERT INTO almacen(fid_supervisor,nombre,direccion,activo)
                VALUES(_fid_supervisor, _nombre, _direccion, 1);
    SET _id_almacen = @@LAST_INSERT_ID;
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
    IN _fid_reclamo INT,
    IN _cantidad INT,
    IN _activo TINYINT
    )
BEGIN
    INSERT INTO devolucion(fid_producto,fid_reclamo,cantidad,activo)
                VALUES( _fid_producto, _fid_reclamo, _cantidad, 1);
    SET _id_devolucion = @@LAST_INSERT_ID;
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
    IN _categoria VARCHAR(100),
    IN _activo TINYINT,

    IN _RUC VARCHAR(100),
    IN _razon_social VARCHAR(100),
    IN _direccion VARCHAR(200)
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
    OUT _id_moneda INT,
    IN _nombre VARCHAR(50),
    IN _abreviatura VARCHAR(5),
    IN _activo TINYINT
    )
BEGIN
    INSERT INTO moneda(nombre,abreviatura,activo)
                VALUES(_nombre, _abreviatura, 1);
    SET _id_moneda = @@LAST_INSERT_ID;
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
    OUT _id_orden_de_compra INT,
    IN _fid_cliente INT,
    IN _fid_vendedor INT,
    IN _fid_moneda INT,
    In _monto DOUBLE,
    IN _direccion_de_entrega VARCHAR(200),
    IN _forma_de_entrega VARCHAR(50),
    IN _fecha_de_entrega DATE,
    IN _fecha_de_compra DATE,
    IN _fecha_limite DATE,
    IN _pagado TINYINT,
    IN _activo TINYINT
)
BEGIN
	INSERT INTO ordenDeCompra(fid_cliente,fid_vendedor,fid_moneda,monto,direccion_de_entrega,forma_de_entrega,fecha_de_entrega,fecha_de_compra,fecha_limite,pagado,activo)
                VALUES(_fid_cliente, _fid_vendedor, _fid_moneda, _monto, _direccion_de_entrega, _forma_de_entrega, _fecha_de_entrega, _fecha_de_compra,_fecha_limite, _pagado, 1);
    SET _id_orden_de_compra = @@LAST_INSERT_ID;
    UPDATE DBProyectoLP2.vendedor SET cantidad_ventas = vendedor.cantidad_ventas + 1 WHERE (id_usuario = _fid_vendedor);
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
	OUT _id_pedido INT,
    IN _fid_orden_de_compra INT,
    IN _fid_producto INT,
    IN _cantidad INT,
    IN _descuento DOUBLE,
    IN _activo TINYINT
)
BEGIN
    INSERT INTO pedido(id_pedido,fid_orden_de_compra,fid_producto,cantidad,descuento,activo) 
    VALUES(_id_pedido,_fid_orden_de_compra,_fid_producto,_cantidad,_descuento,1);
    UPDATE stock s SET s.cantidad = s.cantidad - _cantidad WHERE _fid_producto = s.id_producto;
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
	OUT _id_persona_natural INT,
    IN _categoria VARCHAR(50),
    IN _activo TINYINT,
    
    IN _tipo_de_documento VARCHAR(50),
    IN _numero_de_documento VARCHAR(50),
    IN _nombre VARCHAR(50),
    IN _apellido VARCHAR(50),
    IN _fecha_de_nacimiento DATE,
    IN _sexo VARCHAR(50),
    IN _telefono VARCHAR(50),
    IN _direccion VARCHAR(50),
    IN _email VARCHAR(50)
    )
BEGIN    
    INSERT INTO cliente(categoria, activo)
                VALUES(_categoria, 1);
    SET _id_persona_natural = @@LAST_INSERT_ID;
	INSERT INTO personaNatural(id_persona_natural, tipo_de_documento,numero_de_documento,nombre,apellido,fecha_de_nacimiento,sexo, telefono,direccion,email)
                VALUES(_id_persona_natural,_tipo_de_documento, _numero_de_documento, _nombre, _apellido, _fecha_de_nacimiento,_sexo,  _telefono, _direccion, _email); 
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
    IN _nombre VARCHAR(50),    
    IN _precio DOUBLE,
    IN _costo DOUBLE,
    IN _devuelto TINYINT,
    IN _fecha_ingreso DATE,
    IN _foto LONGBLOB,
    IN _activo TINYINT
    )
BEGIN    
    INSERT INTO producto(nombre,precio,costo, devuelto,fecha_ingreso, foto,activo)
                VALUES(_nombre, _precio, _costo, _devuelto, _fecha_ingreso, _foto, 1);
    SET _id_producto = @@LAST_INSERT_ID;
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
    OUT _id_reclamo INT,
    IN _fid_orden_de_compra INT,
    IN _fecha DATE,
    IN _atendido TINYINT,
    IN _justificacion VARCHAR(500),
    IN _activo TINYINT
    )
BEGIN
    INSERT INTO reclamo(fid_orden_de_compra,fecha,atendido,justificacion,activo)
                VALUES(_fid_orden_de_compra, _fecha, _atendido, _justificacion, 1);
    SET _id_reclamo = @@LAST_INSERT_ID;
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
    IN _fid_almacen INT,
    IN _fid_producto INT,
    IN _cantidad INT,
    IN _activo TINYINT
)
BEGIN
    INSERT INTO stock(id_almacen,id_producto,cantidad,activo)
                VALUES(_fid_almacen, _fid_producto, _cantidad,1);
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
	OUT _id_usuario INT,
    IN _username VARCHAR(50),
    IN _password VARCHAR(50),
    IN _fecha_de_ingreso DATE,
    IN _foto_de_perfil LONGBLOB,
    IN _activo TINYINT,
    IN _tipo_de_documento VARCHAR(50),
    IN _numero_de_documento VARCHAR(50),
    IN _nombre VARCHAR(50),
    IN _apellido VARCHAR(50),
    IN _fecha_de_nacimiento DATE,
    IN _sexo VARCHAR(50),
    IN _telefono VARCHAR(50),
    IN _direccion VARCHAR(50),
    IN _email VARCHAR(50)
)
BEGIN
	INSERT INTO persona(tipo_de_documento, numero_de_documento, nombre, apellido, fecha_de_nacimiento,sexo, telefono, direccion, email, activo)
                VALUES(_tipo_de_documento, _numero_de_documento, _nombre, _apellido, _fecha_de_nacimiento,_sexo, _telefono, _direccion, _email, 1); 
                SET _id_usuario = @@LAST_INSERT_ID;
    INSERT INTO usuario(id_usuario, username, password, fecha_de_ingreso, foto_de_perfil, activo)
                VALUES(_id_usuario, _username, MD5(_password), _fecha_de_ingreso, _foto_de_perfil, 1);
    INSERT INTO supervisorDeAlmacen(id_usuario)
                VALUES(_id_usuario);
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
    IN _fecha DATE,
    IN _cambio DOUBLE,
    IN _activo TINYINT
    )
BEGIN
    INSERT INTO tipoDeCambio(fid_moneda,fecha,cambio,activo)
                VALUES(_fid_moneda, _fecha, _cambio, 1);
    SET _id_tipo_de_cambio = @@LAST_INSERT_ID;
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
	OUT _id_usuario INT,
    IN _cantidad_ventas INT,
    IN _username VARCHAR(50),
    IN _password VARCHAR(50),
    IN _fecha_de_ingreso DATE,
    IN _foto_de_perfil LONGBLOB,
    IN _activo TINYINT,
    IN _tipo_de_documento VARCHAR(50),
    IN _numero_de_documento VARCHAR(50),
    IN _nombre VARCHAR(50),
    IN _apellido VARCHAR(50),
    IN _fecha_de_nacimiento DATE,
    IN _sexo VARCHAR(50),
    IN _telefono VARCHAR(50),
    IN _direccion VARCHAR(50),
    IN _email VARCHAR(50)
)
BEGIN
	INSERT INTO persona(tipo_de_documento, numero_de_documento, nombre, apellido, fecha_de_nacimiento,sexo, telefono, direccion, email, activo)
                VALUES(_tipo_de_documento, _numero_de_documento, _nombre, _apellido, _fecha_de_nacimiento,_sexo, _telefono, _direccion, _email, 1); 
                SET _id_usuario = @@LAST_INSERT_ID;
    INSERT INTO usuario(id_usuario, username, password, fecha_de_ingreso, foto_de_perfil, activo)
                VALUES(_id_usuario, _username, MD5(_password), _fecha_de_ingreso, _foto_de_perfil, 1);
    INSERT INTO vendedor(id_usuario, cantidad_ventas)
                VALUES(_id_usuario, 1);
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
    SELECT *
    FROM almacen WHERE activo = 1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `LISTAR_ALMACENES_X_NOMBRE` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`adminjoya`@`%` PROCEDURE `LISTAR_ALMACENES_X_NOMBRE`(
    IN _nombre VARCHAR(80)
)
BEGIN
    SELECT *
    FROM almacen WHERE activo = 1
    AND nombre LIKE CONCAT('%',_nombre,'%');
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `LISTAR_CLIENTES` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`adminjoya`@`%` PROCEDURE `LISTAR_CLIENTES`()
BEGIN
	SELECT  c.id_cliente, c.categoria,
            e.RUC, e.razon_social, e.direccion as direccionE,
            p.nombre, p.apellido, p.fecha_de_nacimiento, p.telefono, p.direccion as direccionP, p.email, p.tipo_de_documento, p.numero_de_documento, p.sexo
    FROM cliente c LEFT JOIN personaNatural p ON c.id_cliente = p.id_persona_natural 
	LEFT JOIN empresa e ON c.id_cliente = e.id_empresa 
    WHERE c.activo = 1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `LISTAR_CLIENTE_X_NOMBRE_DNI_RAZON_RUC` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`adminjoya`@`%` PROCEDURE `LISTAR_CLIENTE_X_NOMBRE_DNI_RAZON_RUC`(
	IN _doc_nombre VARCHAR(80)
)
BEGIN
	SELECT  c.id_cliente, c.categoria,
            e.RUC, e.razon_social, e.direccion as direccionE,
            p.nombre, p.apellido, p.fecha_de_nacimiento, p.telefono, p.direccion as direccionP, p.email, p.tipo_de_documento, p.numero_de_documento, p.sexo
    FROM cliente c LEFT JOIN personaNatural p ON c.id_cliente = p.id_persona_natural 
	LEFT JOIN empresa e ON c.id_cliente = e.id_empresa 
	where activo=1
	AND ((CONCAT(p.nombre,' ',p.apellido) LIKE CONCAT('%',_doc_nombre,'%')) 
    OR (p.numero_de_documento LIKE CONCAT('%',_doc_nombre,'%')) 
    OR (e.RUC LIKE CONCAT('%',_doc_nombre,'%'))
    OR (e.razon_social LIKE CONCAT('%',_doc_nombre,'%')));
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
    SELECT *
    FROM devolucion WHERE activo = 1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `LISTAR_DEVOLUCIONES_X_RECLAMO` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`adminjoya`@`%` PROCEDURE `LISTAR_DEVOLUCIONES_X_RECLAMO`(
	IN _id_reclamo INT
)
BEGIN
    SELECT *
    FROM devolucion d INNER JOIN reclamo r ON d.fid_reclamo = r.id_reclamo
    inner join producto p on d.fid_producto=id_producto 
    WHERE d.activo = 1 AND d.fid_reclamo = _id_reclamo;
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
	SELECT *
    FROM moneda m
    WHERE activo = 1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `LISTAR_MONEDAS_X_NOMBRE` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`adminjoya`@`%` PROCEDURE `LISTAR_MONEDAS_X_NOMBRE`(
	IN _nombre VARCHAR(80)
)
BEGIN
	SELECT *
    FROM moneda m
    WHERE activo = 1
    AND nombre LIKE CONCAT('%',_nombre,'%');
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `LISTAR_MONEDA_ULTIMO_TIPODECAMBIO` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`adminjoya`@`%` PROCEDURE `LISTAR_MONEDA_ULTIMO_TIPODECAMBIO`(
	IN _id_moneda INT
)
BEGIN
	SELECT id_moneda,t.*
    FROM moneda m 
    LEFT JOIN tipoDeCambio t
    ON id_moneda=fid_moneda
    WHERE m.activo = 1
    AND fecha=(select MAX(fecha) from tipoDeCambio where fid_moneda=_id_moneda)
    and id_moneda=_id_moneda;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `LISTAR_ORDENES_DE_COMPRA_X_CLIENTE` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`adminjoya`@`%` PROCEDURE `LISTAR_ORDENES_DE_COMPRA_X_CLIENTE`(
	IN _id_cliente INT
)
BEGIN
	SELECT o.id_orden_de_compra, e.razon_social, p.nombre as nombrePersonaNatural, p.apellido as apellidoPersonaNatural, 
			o.fecha_de_compra, m.nombre as nombreMoneda, o.monto
	FROM ordenDeCompra o INNER JOIN cliente c ON o.fid_cliente = c.id_cliente 
    LEFT JOIN empresa e ON c.id_cliente = e.id_empresa
    LEFT JOIN personaNatural p ON c.id_cliente = p.id_persona_natural
    INNER JOIN moneda m ON o.fid_moneda = m.id_moneda 
    WHERE o.activo = 1 AND o.fid_cliente = _id_cliente;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `LISTAR_ORDENES_DE_COMPRA_X_FECHA` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`adminjoya`@`%` PROCEDURE `LISTAR_ORDENES_DE_COMPRA_X_FECHA`(
	IN _fecha_compra DATE
)
BEGIN
	SELECT o.id_orden_de_compra, o.fecha_de_compra, e.razon_social, p.nombre as nombrePersonaNatural, p.apellido as apellidoPersonaNatural, 
			m.nombre as nombreMoneda, o.monto
	FROM ordenDeCompra o INNER JOIN cliente c ON o.fid_cliente = c.id_cliente 
    LEFT JOIN empresa e ON c.id_cliente = e.id_empresa
    LEFT JOIN personaNatural p ON c.id_cliente = p.id_persona_natural
    INNER JOIN moneda m ON o.fid_moneda = m.id_moneda 
    WHERE o.activo = 1 AND o.fecha_de_compra = _fecha_compra;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `LISTAR_ORDEN_DE_COMPRA` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`adminjoya`@`%` PROCEDURE `LISTAR_ORDEN_DE_COMPRA`(
)
BEGIN
	SELECT o.id_orden_de_compra, o.fecha_de_compra, m.nombre as nombreMoneda,  o.monto
	FROM ordenDeCompra o INNER JOIN moneda m ON o.fid_moneda = m.id_moneda WHERE o.activo = 1
	ORDER BY fecha_de_compra DESC;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `LISTAR_PEDIDOS_X_ORDEN` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`adminjoya`@`%` PROCEDURE `LISTAR_PEDIDOS_X_ORDEN`(
	IN _id_orden INT
)
BEGIN
	SELECT  pro.id_producto, pro.nombre, pe.cantidad,pro.precio
    FROM pedido pe INNER JOIN producto pro ON pe.fid_producto = pro.id_producto
    WHERE pe.activo=1 AND pe.fid_orden_de_compra = _id_orden;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `LISTAR_PRODUCTOS_X_NOMBRE` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`adminjoya`@`%` PROCEDURE `LISTAR_PRODUCTOS_X_NOMBRE`(
	IN _nombre VARCHAR(80)
)
BEGIN
	SELECT *
    FROM producto WHERE activo = 1
    AND nombre LIKE CONCAT('%',_nombre,'%');
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `LISTAR_RECLAMOS_TODO` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`adminjoya`@`%` PROCEDURE `LISTAR_RECLAMOS_TODO`()
BEGIN
	SELECT id_reclamo,fid_orden_de_compra,fecha,atendido,justificacion
    FROM reclamo WHERE activo = 1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `LISTAR_RECLAMO_X_ORDEN` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`adminjoya`@`%` PROCEDURE `LISTAR_RECLAMO_X_ORDEN`(
	IN _id_orden INT
)
BEGIN
	SELECT  r.id_reclamo, o.id_orden_de_compra, r.fecha as fechaReclamo, r.atendido, r.justificacion, o.fecha_de_compra
    FROM reclamo r INNER JOIN ordenDeCompra o ON o.id_orden_de_compra = r.fid_orden_de_compra
    WHERE r.activo=1 AND fid_orden_de_compra=_id_orden;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `LISTAR_STOCK_X_ALMACEN` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`adminjoya`@`%` PROCEDURE `LISTAR_STOCK_X_ALMACEN`(
    IN _fid_almacen INT
)
BEGIN
    SELECT * FROM stock WHERE id_almacen = _fid_almacen AND activo = 1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `LISTAR_STOCK_X_ALMACEN_Y_NOMBRE_PRODUCTO` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`adminjoya`@`%` PROCEDURE `LISTAR_STOCK_X_ALMACEN_Y_NOMBRE_PRODUCTO`(
    IN _fid_almacen INT,
    IN _nombre VARCHAR(80)
)
BEGIN
    SELECT * FROM stock s
    INNER JOIN producto p ON s.id_producto = p.id_producto
    WHERE s.id_almacen = _fid_almacen AND s.activo = 1 AND p.nombre LIKE CONCAT('%',_nombre,'%');
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `LISTAR_SUPERVISORES` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`adminjoya`@`%` PROCEDURE `LISTAR_SUPERVISORES`()
BEGIN
    SELECT  u.*,
            p.*
    FROM    supervisorDeAlmacen s
            INNER JOIN usuario u ON s.id_usuario=u.id_usuario
            LEFT JOIN persona p ON u.id_usuario=p.id_persona
    WHERE   u.activo = 1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `LISTAR_TIPOS_DE_CAMBIO_X_NOMBRE` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`adminjoya`@`%` PROCEDURE `LISTAR_TIPOS_DE_CAMBIO_X_NOMBRE`(
	IN _nombre VARCHAR(80)
)
BEGIN
	SELECT t.*,m.*
    FROM tipo_de_cambio t
    INNER JOIN moneda m
    ON id_moneda=fid_moneda
    WHERE activo = 1
    AND nombre LIKE CONCAT('%',_nombre,'%');
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `LISTAR_ULTIMAS_50_VENTAS` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`adminjoya`@`%` PROCEDURE `LISTAR_ULTIMAS_50_VENTAS`(
)
BEGIN
	SELECT o.id_orden_de_compra, o.fecha_de_compra, o.fecha_de_entrega, o.direccion_de_entrega, o.forma_de_entrega, o.pagado, o.fecha_limite,
			m.nombre as nombreMoneda, o.monto, c.id_cliente, c.categoria,
			e.razon_social, e.RUC,
            p.nombre as nombrePersonaNatural, p.apellido as apellidoPersonaNatural, p.tipo_de_documento,p.numero_de_documento, p.telefono,
            pv.id_persona , pv.nombre as nombreVendedor, pv.apellido as apellidoVendedor
	FROM ordenDeCompra o INNER JOIN cliente c ON o.fid_cliente = c.id_cliente
    LEFT JOIN empresa e ON c.id_cliente = e.id_empresa
    LEFT JOIN personaNatural p ON c.id_cliente = p.id_persona_natural
    INNER JOIN vendedor v ON o.fid_vendedor = v.id_usuario
    LEFT JOIN persona pv ON v.id_usuario = pv.id_persona
    INNER JOIN moneda m ON o.fid_moneda = m.id_moneda 
    WHERE o.activo = 1
	ORDER BY fecha_de_compra DESC
	LIMIT 50;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `LISTAR_USUARIOS` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`adminjoya`@`%` PROCEDURE `LISTAR_USUARIOS`()
BEGIN
	SELECT  u.*,
            p.*,
            cantidad_ventas,
            area 
    FROM    usuario u
            INNER JOIN persona p ON u.id_usuario=p.id_persona
            LEFT JOIN vendedor v ON u.id_usuario=v.id_usuario
            LEFT JOIN supervisorDeAlmacen s ON u.id_usuario=s.id_usuario
            LEFT JOIN administrador a ON u.id_usuario=a.id_usuario
    WHERE   u.activo = 1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `LISTAR_USUARIOS_X_DOCUMENTO_NOMBRE` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`adminjoya`@`%` PROCEDURE `LISTAR_USUARIOS_X_DOCUMENTO_NOMBRE`(
	IN _doc_nombre VARCHAR(80)
)
BEGIN
	SELECT  u.*,
            p.*,
            cantidad_ventas,
            area 
    FROM usuario u
    INNER JOIN persona p ON p.id_persona = u.id_usuario 
    LEFT JOIN vendedor v ON u.id_usuario=v.id_usuario
    LEFT JOIN supervisorDeAlmacen s ON u.id_usuario=s.id_usuario
    LEFT JOIN administrador a ON u.id_usuario=a.id_usuario
    WHERE u.activo = 1
    AND ((CONCAT(p.nombre,' ',p.apellido) LIKE CONCAT('%',_doc_nombre,'%')) 
    OR (p.numero_de_documento LIKE CONCAT('%',_doc_nombre,'%')));
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
	IN _id_usuario INT,
    IN _area VARCHAR(50),
    IN _username VARCHAR(50),
    IN _password VARCHAR(50),
    IN _fecha_de_ingreso DATE,
    IN _foto_de_perfil LONGBLOB,
    IN _activo TINYINT,
    IN _tipo_de_documento VARCHAR(50),
    IN _numero_de_documento VARCHAR(50),
    IN _nombre VARCHAR(50),
    IN _apellido VARCHAR(50),
    IN _fecha_de_nacimiento DATE,
    IN _sexo VARCHAR(50),
    IN _telefono VARCHAR(50),
    IN _direccion VARCHAR(50),
    IN _email VARCHAR(50)
    )
BEGIN
	UPDATE persona SET  tipo_de_documento=_tipo_de_documento ,numero_de_documento=_numero_de_documento,
                        nombre=_nombre,apellido=_apellido,fecha_de_nacimiento=_fecha_de_nacimiento, sexo=_sexo,
                        telefono=_telefono,direccion=_direccion,email=_email
        WHERE id_persona = _id_usuario;
    UPDATE usuario SET username=_username, password=MD5(_password), fecha_de_ingreso=_fecha_de_ingreso,
                        foto_de_perfil=_foto_de_perfil, activo=_activo
        WHERE id_usuario = _id_usuario;
    UPDATE administrador SET area=_area
        WHERE id_usuario = _id_usuario;
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
    IN _fid_supervisor INT,
    IN _nombre VARCHAR(50),    
    IN _direccion VARCHAR(50),
    IN _activo TINYINT
    )
BEGIN
    UPDATE almacen SET fid_supervisor=_fid_supervisor, nombre=_nombre, direccion=_direccion, activo=_activo
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
    IN _cantidad INT,
    IN _activo TINYINT
    )
BEGIN
    UPDATE devolucion SET cantidad=_cantidad, activo=_activo
        WHERE id_devolucion = _id_devolucion;
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
    IN _categoria VARCHAR(100),
    In _activo TINYINT,

    IN _RUC VARCHAR(100),
    IN _razon_social VARCHAR(100),
    IN _direccion VARCHAR(200)
)
BEGIN
    UPDATE cliente SET categoria=_categoria, activo=_activo
        WHERE id_cliente = _id_empresa;
    UPDATE empresa SET RUC=_RUC,razon_social=_razon_social,direccion=_direccion
        WHERE id_empresa = _id_empresa;
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
    IN _id_moneda INT,
    IN _nombre VARCHAR(50),
    IN _abreviatura VARCHAR(5),
    IN _activo TINYINT
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
	IN _id_persona_natural INT,
    IN _categoria VARCHAR(50),
    IN _activo TINYINT,

    IN _tipo_de_documento VARCHAR(50),
    IN _numero_de_documento VARCHAR(50),
    IN _nombre VARCHAR(50),
    IN _apellido VARCHAR(50),
    IN _fecha_de_nacimiento DATE,
    IN _sexo VARCHAR(50),
    IN _telefono VARCHAR(50),
    IN _direccion VARCHAR(50),
    IN _email VARCHAR(50)
    )
BEGIN
    UPDATE cliente SET categoria=_categoria, activo=_activo
        WHERE id_cliente = _id_persona_natural;
	UPDATE personaNatural SET  id_persona_natural=_id_persona_natural,tipo_de_documento=_tipo_de_documento ,numero_de_documento=_numero_de_documento,
                        nombre=_nombre,apellido=_apellido,fecha_de_nacimiento=_fecha_de_nacimiento, sexo=_sexo,
                        telefono=_telefono,direccion=_direccion,email=_email
        WHERE id_persona_natural = _id_persona_natural;
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
    IN _nombre VARCHAR(50),    
    IN _precio DOUBLE,
    IN _costo DOUBLE,
    IN _devuelto TINYINT,
    IN _fecha_ingreso DATE,
    IN _foto LONGBLOB,
    IN _activo TINYINT
    )
BEGIN
    UPDATE producto SET nombre=_nombre, precio=_precio, costo=_costo, devuelto=_devuelto,
                        fecha_ingreso=_fecha_ingreso, activo=_activo, foto=_foto
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
    IN _id_reclamo INT,
    IN _fid_orden_de_compra INT,
    IN _fecha DATE,
    IN _atendido TINYINT,
    IN _justificacion VARCHAR(500),
    IN _activo TINYINT
)
BEGIN
    UPDATE reclamo SET fid_orden_de_compra=_fid_orden_de_compra, fecha=_fecha, atendido=_atendido, justificacion=_justificacion, activo=_activo
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
    IN _fid_almacen INT,
    IN _fid_producto INT,
    IN _activo TINYINT,
    IN _cantidad INT
)
BEGIN
    UPDATE stock SET cantidad=_cantidad, activo=_activo
        WHERE id_almacen = _fid_almacen AND id_producto = _fid_producto;
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
	IN _id_usuario INT,
    IN _username VARCHAR(50),
    IN _password VARCHAR(50),
    IN _fecha_de_ingreso DATE,
    IN _foto_de_perfil LONGBLOB,
    IN _activo TINYINT,
    IN _tipo_de_documento VARCHAR(50),
    IN _numero_de_documento VARCHAR(50),
    IN _nombre VARCHAR(50),
    IN _apellido VARCHAR(50),
    IN _fecha_de_nacimiento DATE,
    In _sexo VARCHAR(50),
    IN _telefono VARCHAR(50),
    IN _direccion VARCHAR(50),
    IN _email VARCHAR(50)
    )
BEGIN
	UPDATE persona SET  tipo_de_documento=_tipo_de_documento ,numero_de_documento=_numero_de_documento,
                        nombre=_nombre,apellido=_apellido,fecha_de_nacimiento=_fecha_de_nacimiento, sexo=_sexo,
                        telefono=_telefono,direccion=_direccion,email=_email
        WHERE id_persona = _id_usuario;
    UPDATE usuario SET username=_username, password=MD5(_password), fecha_de_ingreso=_fecha_de_ingreso,
                        foto_de_perfil=_foto_de_perfil, activo=_activo
        WHERE id_usuario = _id_usuario;
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
    IN _fecha DATE,
    IN _cammbio DOUBLE,
    IN _activo TINYINT
    )
BEGIN
    UPDATE tipo_de_cambio SET cambio=_cammbio, activo=_activo
        WHERE id_tipo_de_cambio = _id_tipo_de_cambio;
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
	IN _id_usuario INT,
    IN _cantidad_ventas INT,
    IN _username VARCHAR(50),
    IN _password VARCHAR(50),
    IN _fecha_de_ingreso DATE,
    IN _foto_de_perfil LONGBLOB,
    IN _activo TINYINT,
    IN _tipo_de_documento VARCHAR(50),
    IN _numero_de_documento VARCHAR(50),
    IN _nombre VARCHAR(50),
    IN _apellido VARCHAR(50),
    IN _fecha_de_nacimiento DATE,
    IN _sexo VARCHAR(50),
    IN _telefono VARCHAR(50),
    IN _direccion VARCHAR(50),
    IN _email VARCHAR(50)
    )
BEGIN
	UPDATE persona SET  tipo_de_documento=_tipo_de_documento ,numero_de_documento=_numero_de_documento,
                        nombre=_nombre,apellido=_apellido,fecha_de_nacimiento=_fecha_de_nacimiento, sexo=_sexo,
                        telefono=_telefono,direccion=_direccion,email=_email
    WHERE id_persona = _id_usuario;

    UPDATE usuario SET username=_username, password=MD5(_password), fecha_de_ingreso=_fecha_de_ingreso,
                        foto_de_perfil=_foto_de_perfil, activo=_activo
    WHERE id_usuario = _id_usuario;

    UPDATE vendedor SET cantidad_ventas=_cantidad_ventas
    WHERE id_usuario = _id_usuario;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `VERIFICAR_CUENTA_USUARIO` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`adminjoya`@`%` PROCEDURE `VERIFICAR_CUENTA_USUARIO`(
	IN _username VARCHAR(50),
    IN _password VARCHAR(50)
)
BEGIN
	SELECT  u.*,
            p.*,
            v.cantidad_ventas,
            a.area 
    FROM    usuario u
            INNER JOIN persona p ON u.id_usuario=p.id_persona
            LEFT JOIN vendedor v ON u.id_usuario=v.id_usuario
            LEFT JOIN supervisorDeAlmacen s ON u.id_usuario=s.id_usuario
            LEFT JOIN administrador a ON u.id_usuario=a.id_usuario
    WHERE
        username = _username AND password = MD5(_password)
        AND u.activo=1;
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

-- Dump completed on 2022-11-22  3:54:25
