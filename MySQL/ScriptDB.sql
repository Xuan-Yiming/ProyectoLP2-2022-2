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
INSERT INTO `empresa` VALUES (1,'20492092313','Panchito Supermayorista','Jiron Faustino Perez 120'),(2,'20107458889','Sabanero Supermayorista','Jiron Carlos Alfajer 502'),(4,'20454713061','AlmohaderÃ­a Pedrito S.A.C','Avenida Francisco Javier MariÃ¡tegui 101'),(6,'20601208416','Galvaza S.R.L.','Avenida Zoey 101'),(7,'27895508416','La Casita S.A.C','Jiron Timoteo Perez 502'),(9,'25898665470','La TecnoTextileria','Jiron Ricardo Palma 901'),(10,'20494331315','EMCA Waori','Jiron Alberto Prada 201'),(11,'21589631005','Ripleysa S.A.C.','Avenida Faustino Sanchez 201'),(14,'20517905454','Cencosud Retail S.A.','Avenida Juan Pardo de Zela 315'),(15,'20337564373','Tiendas Ripley S.A.C.','Avenida Jose Luis Ramirez 115'),(16,'20345346543','Happy inc.','av.principal 1021');
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
INSERT INTO `ordenDeCompra` VALUES (3,1,7,1,1419.25,'Av Cerros de Camacho 102','EnAlmacen','2022-11-21','2022-11-23',0,1,'2022-12-02'),(4,15,7,2,598.08,'Av Gorriones 644','ADestino','2022-11-21','2022-11-24',0,1,'2022-12-06'),(5,2,7,2,312.82,'Av Los Perritos 100','ADestino','2022-11-21','2022-11-17',0,1,'2022-12-02'),(6,14,9,1,4407.5,'JirÃ³n Camino Ainara 85','EnAlmacen','2022-11-21','2022-11-24',1,1,'2022-11-30'),(7,3,10,1,2632.5,'Av Camino Real 104','ADestino','2022-11-21','2022-11-19',0,1,'2022-11-20'),(8,7,10,1,3403.5,'Av Las Gaviotas 1002','ADestino','2022-11-17','2022-11-24',1,1,'2022-11-23'),(9,7,6,2,872.69,'Av Las Gaviotas 1002','EnAlmacen','2022-11-18','2022-11-22',0,1,'2022-11-23'),(10,7,13,2,1324.62,'Av Las Gaviotas 1002','ADestino','2022-11-21','2022-11-24',0,1,'2022-11-29'),(11,2,6,1,1489,'Av Los Perritos 100','EnAlmacen','2022-11-18','2022-11-24',1,1,'2022-11-21'),(12,4,8,1,2729.5,'Av Carlos Arias Araguez 75','ADestino','2022-11-23','2022-11-23',0,1,'2022-11-30'),(13,14,13,2,816.54,'JirÃ³n Camino Ainara 85','EnAlmacen','2022-11-09','2022-11-23',0,1,'2022-11-23'),(14,13,12,2,1655.38,'Av Las Palomitas 100','EnAlmacen','2022-11-08','2022-11-10',0,1,'2022-11-22'),(15,3,7,2,1655.38,'Av Camino Real 104','ADestino','2022-11-09','2022-11-12',0,1,'2022-11-22'),(16,7,9,1,4535.5,'Av Las Gaviotas 1002','ADestino','2022-11-08','2022-11-13',0,1,'2022-11-19'),(17,5,8,2,758.85,'JirÃ³n AndrÃ©s Calamaro 402','EnAlmacen','2022-10-12','2022-10-14',1,1,'2022-10-27'),(18,11,9,1,2515,'Av Pedro Ruiz Gallo 102','EnAlmacen','2022-10-19','2022-10-22',1,1,'2022-10-24'),(19,12,12,1,2515,'Av Faustino Sanchez Carrion 930','ADestino','2022-11-15','2022-11-17',0,1,'2022-11-20'),(20,12,12,1,1146,'Av Faustino Sanchez Carrion 930','EnAlmacen','2022-11-17','2022-11-19',0,1,'2022-11-20'),(21,1,6,2,570.77,'Av Cerros de Camacho 102','ADestino','2022-11-20','2022-11-24',0,1,'2022-11-27'),(22,6,9,2,596.54,'Av Joaquin Corrales 222','ADestino','2022-11-13','2022-11-15',1,1,'2022-11-20'),(23,12,12,2,337.95,'Av Faustino Sanchez Carrion 930','ADestino','2022-11-14','2022-11-16',1,1,'2022-11-21'),(24,1,6,2,344.1,'Av Cerros de Camacho 102','ADestino','2022-11-08','2022-11-11',0,1,'2022-11-18'),(25,2,6,2,651.15,'Av Los Perritos 100','EnAlmacen','2022-11-09','2022-11-12',0,1,'2022-11-19'),(26,3,7,2,662.56,'Av Camino Real 104','ADestino','2022-11-10','2022-11-13',0,1,'2022-11-20'),(27,12,9,2,392.44,'Av Faustino Sanchez Carrion 930','ADestino','2022-11-03','2022-11-05',0,1,'2022-11-15'),(28,6,8,1,1659.5,'Av Joaquin Corrales 222','ADestino','2022-11-04','2022-11-06',0,1,'2022-11-16'),(29,3,7,1,1740,'Av Camino Real 104','EnAlmacen','2022-11-06','2022-11-08',0,1,'2022-11-18'),(30,5,8,1,1307.5,'JirÃ³n AndrÃ©s Calamaro 402','ADestino','2022-11-03','2022-11-05',0,1,'2022-11-15'),(31,9,10,1,1307.5,'Av Las Lomas 702','ADestino','2022-11-03','2022-11-05',0,1,'2022-11-15'),(32,3,7,1,1160,'Av Camino Real 104','ADestino','2022-11-03','2022-11-05',0,1,'2022-11-15'),(33,14,13,1,1972.5,'JirÃ³n Camino Ainara 85','ADestino','2022-11-07','2022-11-09',0,1,'2022-11-19'),(34,5,8,1,701.5,'JirÃ³n AndrÃ©s Calamaro 402','ADestino','2022-11-08','2022-11-10',1,1,'2022-11-20'),(35,4,8,1,633.5,'Av Carlos Arias Araguez 75','ADestino','2022-11-10','2022-11-12',1,1,'2022-11-22'),(36,14,13,1,677.5,'JirÃ³n Camino Ainara 85','ADestino','2022-11-14','2022-11-15',1,1,'2022-11-22'),(37,11,9,1,1638.5,'Av Pedro Ruiz Gallo 102','ADestino','2022-11-14','2022-11-15',1,1,'2022-11-22'),(38,7,9,1,1589.5,'Av Las Gaviotas 1002','EnAlmacen','2022-11-15','2022-11-17',1,1,'2022-11-20'),(39,6,8,2,407.56,'Av Joaquin Corrales 222','EnAlmacen','2022-11-15','2022-11-17',1,1,'2022-11-20'),(40,9,10,2,369.1,'Av Las Lomas 702','EnAlmacen','2022-11-20','2022-11-22',1,1,'2022-11-23'),(41,10,9,2,318.33,'Calle Mariano Valdelomar 12','EnAlmacen','2022-11-20','2022-11-22',1,1,'2022-11-23'),(42,1,6,1,1762,'Av Cerros de Camacho 102','EnAlmacen','2022-11-21','2022-11-23',1,1,'2022-11-24'),(43,6,9,1,1270,'Av Joaquin Corrales 222','ADestino','2022-11-17','2022-11-19',1,1,'2022-11-25'),(44,8,9,1,2522,'Av Primavera 505','ADestino','2022-11-19','2022-11-21',1,1,'2022-11-28'),(45,7,9,2,427.56,'Av Las Gaviotas 1002','ADestino','2022-11-17','2022-11-18',1,1,'2022-11-24'),(46,2,6,2,345.26,'Av Los Perritos 100','ADestino','2022-11-17','2022-11-18',1,1,'2022-11-24'),(47,11,9,2,345.51,'Av Pedro Ruiz Gallo 102','ADestino','2022-11-18','2022-11-19',1,1,'2022-11-27'),(48,13,12,2,345.51,'Av Las Palomitas 100','EnAlmacen','2022-11-15','2022-11-19',1,1,'2022-11-29'),(49,6,9,2,338.97,'Av Joaquin Corrales 222','EnAlmacen','2022-11-16','2022-11-19',1,1,'2022-11-27'),(50,9,10,2,428.46,'Av Las Lomas 702','EnAlmacen','2022-11-14','2022-11-18',1,1,'2022-11-30'),(51,15,13,1,943,'Av Los Gorriones 644','EnAlmacen','2022-11-14','2022-11-17',1,1,'2022-11-27'),(52,13,12,1,2016,'Av Las Palomitas 100','EnAlmacen','2022-11-14','2022-11-18',1,1,'2022-11-22'),(53,14,12,2,452.69,'JirÃ³n Camino Ainara 85','EnAlmacen','2022-11-16','2022-11-19',1,1,'2022-11-24'),(54,7,9,1,1248,'Av Las Gaviotas 1002','EnAlmacen','2022-11-16','2022-11-17',0,1,'2022-11-24'),(55,15,13,1,1281.5,'Av Los Gorriones 644','EnAlmacen','2022-11-13','2022-11-14',0,1,'2022-11-18'),(56,14,13,1,2425.5,'JirÃ³n Camino Ainara 85','EnAlmacen','2022-11-13','2022-11-14',0,1,'2022-11-18'),(57,2,6,1,2964.5,'Av Los Perritos 100','EnAlmacen','2022-11-13','2022-11-14',0,1,'2022-11-18'),(58,10,9,1,1210,'Calle Mariano Valdelomar 12','EnAlmacen','2022-11-13','2022-11-14',0,1,'2022-11-18'),(59,2,6,2,443.46,'Av Los Perritos 100','EnAlmacen','2022-11-16','2022-11-18',0,1,'2022-11-20'),(60,14,13,2,501.03,'JirÃ³n Camino Ainara 85','EnAlmacen','2022-11-16','2022-11-18',1,1,'2022-11-20'),(61,2,6,2,156.92,'Av Los Perritos 100','EnAlmacen','2022-11-14','2022-11-15',1,1,'2022-11-19'),(62,2,6,2,320.38,'Av Los Perritos 100','EnAlmacen','2022-11-14','2022-11-15',1,1,'2022-11-19'),(63,3,7,2,329.87,'Av Camino Real 104','EnAlmacen','2022-11-14','2022-11-15',0,1,'2022-11-19'),(64,5,8,2,418.72,'JirÃ³n AndrÃ©s Calamaro 402','EnAlmacen','2022-11-14','2022-11-15',0,1,'2022-11-17'),(65,15,13,2,509.74,'Av Los Gorriones 644','EnAlmacen','2022-11-14','2022-11-15',0,1,'2022-11-17'),(66,7,9,2,410.38,'Av Las Gaviotas 1002','EnAlmacen','2022-11-16','2022-11-17',0,1,'2022-11-19'),(67,9,10,1,1032.5,'Av Las Lomas 702','EnAlmacen','2022-11-16','2022-11-17',1,1,'2022-11-19'),(68,12,12,1,1770,'Av Faustino Sanchez Carrion 930','ADestino','2022-11-16','2022-11-17',1,1,'2022-11-24'),(69,15,13,2,362.82,'Av Los Gorriones 644','ADestino','2022-11-21','2022-11-23',1,1,'2022-11-25'),(70,8,10,2,404.87,'Av Primavera 505','ADestino','2022-11-19','2022-11-25',1,1,'2022-11-29'),(71,8,10,1,1579,'Av Primavera 505','ADestino','2022-11-19','2022-11-20',1,1,'2022-11-22'),(72,13,12,2,446.28,'Av Las Palomitas 100','ADestino','2022-11-19','2022-11-20',0,1,'2022-11-23'),(73,14,13,2,194.49,'JirÃ³n Camino Ainara 85','ADestino','2022-11-19','2022-11-20',0,1,'2022-11-25'),(74,3,7,2,323.85,'Av Camino Real 104','EnAlmacen','2022-11-15','2022-11-17',0,1,'2022-11-20'),(75,1,6,1,1113,'Av Cerros de Camacho 102','EnAlmacen','2022-11-14','2022-11-17',0,1,'2022-11-21'),(76,2,7,1,2304.5,'Av Los Perritos 100','EnAlmacen','2022-11-14','2022-11-17',0,1,'2022-11-21'),(77,8,9,1,709,'Av Primavera 505','ADestino','2022-11-13','2022-11-16',0,1,'2022-11-19'),(78,2,6,1,1996.5,'Av Los Perritos 100','ADestino','2022-11-14','2022-11-17',0,1,'2022-11-19'),(79,15,13,1,2023,'Av Los Gorriones 644','ADestino','2022-11-14','2022-11-17',0,1,'2022-11-20'),(80,11,9,1,1345,'Av Pedro Ruiz Gallo 102','ADestino','2022-11-08','2022-11-10',0,1,'2022-11-15'),(81,15,13,1,1455.5,'Av Los Gorriones 644','ADestino','2022-11-08','2022-11-10',0,1,'2022-11-17'),(82,11,9,1,2018.5,'Av Pedro Ruiz Gallo 102','ADestino','2022-11-08','2022-11-10',0,1,'2022-11-15'),(83,12,12,1,2101,'Av Faustino Sanchez Carrion 930','ADestino','2022-11-08','2022-11-12',0,1,'2022-11-16'),(84,10,9,2,606.41,'Calle Mariano Valdelomar 12','EnAlmacen','2022-11-10','2022-11-12',0,1,'2022-11-16'),(85,14,12,2,416.41,'JirÃ³n Camino Ainara 85','EnAlmacen','2022-10-18','2022-10-21',0,1,'2022-10-25'),(86,8,9,2,271.15,'Av Primavera 505','EnAlmacen','2022-10-18','2022-10-21',0,1,'2022-10-25'),(87,7,9,2,858.72,'Av Las Gaviotas 1002','EnAlmacen','2022-10-18','2022-10-21',0,1,'2022-10-25'),(88,3,7,1,1372.5,'Av Camino Real 104','EnAlmacen','2022-10-20','2022-10-24',0,1,'2022-10-27'),(90,9,10,1,2242.5,'Av Las Lomas 702','EnAlmacen','2022-10-20','2022-10-24',0,1,'2022-10-27'),(91,1,6,1,1260.5,'Av Cerros de Camacho 102','EnAlmacen','2022-09-28','2022-09-30',0,1,'2022-10-05'),(92,8,9,1,1040.5,'Av Primavera 505','ADestino','2022-09-28','2022-09-30',0,1,'2022-10-05'),(93,4,7,1,1313.5,'Av Carlos Arias Araguez 75','ADestino','2022-09-28','2022-09-30',0,1,'2022-10-05'),(94,5,8,1,2570.5,'JirÃ³n AndrÃ©s Calamaro 402','ADestino','2022-09-28','2022-09-30',0,1,'2022-10-05'),(95,13,12,1,3349,'Av Las Palomitas 100','ADestino','2022-09-30','2022-10-04',1,1,'2022-10-20'),(96,9,10,1,1057.5,'Av Las Lomas 702','ADestino','2022-09-30','2022-10-04',1,1,'2022-10-20'),(97,9,10,1,1306.5,'Av Las Lomas 702','ADestino','2022-09-30','2022-10-04',1,1,'2022-10-20'),(98,4,8,1,1884,'Av Carlos Arias Araguez 75','ADestino','2022-09-30','2022-10-04',1,1,'2022-10-20'),(99,8,9,1,1465.5,'Av Primavera 505','ADestino','2022-09-09','2022-11-12',1,1,'2022-11-18'),(100,2,6,2,319.49,'Av Los Perritos 100','EnAlmacen','2022-09-09','2022-11-12',1,1,'2022-11-18'),(101,12,12,2,411.92,'Av Faustino Sanchez Carrion 930','EnAlmacen','2022-09-09','2022-11-12',1,1,'2022-11-20'),(102,1,6,2,410.77,'Av Cerros de Camacho 102','EnAlmacen','2022-09-09','2022-11-12',0,1,'2022-11-20'),(103,13,12,2,271.15,'Av Las Palomitas 100','EnAlmacen','2022-09-07','2022-11-15',0,1,'2022-11-20'),(104,15,13,2,498.72,'Av Los Gorriones 644','EnAlmacen','2022-09-07','2022-11-15',0,1,'2022-11-20'),(105,6,8,2,453.21,'Av Joaquin Corrales 222','EnAlmacen','2022-09-07','2022-11-15',0,1,'2022-11-20'),(106,5,8,2,234.62,'JirÃ³n AndrÃ©s Calamaro 402','EnAlmacen','2022-09-07','2022-11-15',0,1,'2022-11-20'),(107,7,9,2,234.62,'Av Las Gaviotas 1002','EnAlmacen','2022-11-09','2022-11-15',0,1,'2022-11-20'),(108,9,10,2,271.15,'Av Las Lomas 702','EnAlmacen','2022-11-09','2022-11-15',0,1,'2022-11-20'),(109,13,12,2,345.9,'Av Las Palomitas 100','EnAlmacen','2022-11-08','2022-11-12',0,1,'2022-11-17'),(110,13,12,1,1702,'Av Las Palomitas 100','EnAlmacen','2022-11-08','2022-11-12',0,1,'2022-11-17'),(111,13,12,1,2184,'Av Las Palomitas 100','ADestino','2022-11-08','2022-11-12',0,1,'2022-11-17'),(112,2,6,1,862,'Av Los Perritos 100','ADestino','2022-11-08','2022-11-12',0,1,'2022-11-17'),(113,12,9,1,1345.5,'Av Faustino Sanchez Carrion 930','ADestino','2022-11-08','2022-11-12',0,1,'2022-11-17'),(114,4,7,1,1600.5,'Av Carlos Arias Araguez 75','ADestino','2022-11-10','2022-11-13',0,1,'2022-11-16'),(115,6,8,1,3984.5,'Av Joaquin Corrales 222','ADestino','2022-11-10','2022-11-13',0,1,'2022-11-16'),(116,14,13,1,471.5,'JirÃ³n Camino Ainara 85','ADestino','2022-11-10','2022-11-13',0,1,'2022-11-16'),(117,14,13,1,2083,'JirÃ³n Camino Ainara 85','ADestino','2022-11-10','2022-11-13',0,1,'2022-11-16'),(118,5,8,1,2083,'JirÃ³n AndrÃ©s Calamaro 402','ADestino','2022-11-14','2022-11-17',0,1,'2022-11-20'),(119,6,9,1,1796,'Av Joaquin Corrales 222','ADestino','2022-11-14','2022-11-17',0,1,'2022-11-20'),(120,3,7,1,1943.5,'Av Camino Real 104','ADestino','2022-11-14','2022-11-17',0,1,'2022-11-20'),(121,9,10,1,1943.5,'Av Las Lomas 702','EnAlmacen','2022-11-14','2022-11-17',0,1,'2022-11-20'),(122,6,8,2,276.28,'Av Joaquin Corrales 222','EnAlmacen','2022-11-10','2022-11-12',1,1,'2022-11-29'),(123,14,13,2,327.69,'JirÃ³n Camino Ainara 85','EnAlmacen','2022-11-10','2022-11-12',1,1,'2022-11-29'),(124,13,12,2,237.82,'Av Las Palomitas 100','ADestino','2022-11-10','2022-11-12',1,1,'2022-11-29'),(125,11,9,2,1022.18,'Av Pedro Ruiz Gallo 102','ADestino','2022-11-10','2022-11-12',1,1,'2022-11-29'),(126,12,12,2,310.26,'Av Faustino Sanchez Carrion 930','ADestino','2022-11-18','2022-11-19',1,1,'2022-11-27'),(127,8,9,2,858.72,'Av Primavera 505','ADestino','2022-11-18','2022-11-19',1,1,'2022-11-27'),(128,11,9,2,305.9,'Av Pedro Ruiz Gallo 102','ADestino','2022-11-18','2022-11-20',1,1,'2022-11-27'),(129,3,7,2,338.46,'Av Camino Real 104','ADestino','2022-11-18','2022-11-20',1,1,'2022-11-27'),(130,4,7,2,255.77,'Av Carlos Arias Araguez 75','ADestino','2022-11-18','2022-11-22',1,1,'2022-11-27'),(131,14,13,2,477.82,'JirÃ³n Camino Ainara 85','ADestino','2022-11-18','2022-11-22',1,1,'2022-11-27'),(132,10,9,2,321.92,'Calle Mariano Valdelomar 12','ADestino','2022-11-18','2022-11-22',1,1,'2022-11-27'),(133,10,9,2,461.54,'Calle Mariano Valdelomar 12','ADestino','2022-11-18','2022-11-22',1,1,'2022-11-27'),(134,6,9,2,359.74,'Av Joaquin Corrales 222','ADestino','2022-11-07','2022-11-10',1,1,'2022-11-15'),(135,7,9,2,324.62,'Av Las Gaviotas 1002','ADestino','2022-11-07','2022-11-10',1,1,'2022-11-15'),(136,14,13,2,335.9,'JirÃ³n Camino Ainara 85','ADestino','2022-11-07','2022-11-10',1,1,'2022-11-15'),(137,8,10,2,293.85,'Av Primavera 505','ADestino','2022-11-07','2022-11-10',1,1,'2022-11-15'),(138,8,10,2,336.41,'Av Primavera 505','EnAlmacen','2022-11-07','2022-11-10',1,1,'2022-11-15'),(139,3,7,1,1873.5,'Av Camino Real 104','EnAlmacen','2022-11-09','2022-11-10',1,1,'2022-11-18'),(140,1,6,1,946.5,'Av Cerros de Camacho 102','EnAlmacen','2022-11-09','2022-11-10',1,1,'2022-11-18'),(141,6,8,1,734,'Av Joaquin Corrales 222','EnAlmacen','2022-11-09','2022-11-10',1,1,'2022-11-18'),(142,15,13,1,943,'Av Los Gorriones 644','EnAlmacen','2022-11-09','2022-11-10',1,1,'2022-11-18'),(143,5,8,1,2295,'JirÃ³n AndrÃ©s Calamaro 402','EnAlmacen','2022-11-09','2022-11-10',1,1,'2022-11-18'),(144,4,7,2,253.97,'Av Carlos Arias Araguez 75','ADestino','2022-11-03','2022-11-05',1,1,'2022-11-14'),(145,5,8,2,408.72,'JirÃ³n AndrÃ©s Calamaro 402','ADestino','2022-11-03','2022-11-05',1,1,'2022-11-14'),(146,3,7,2,305,'Av Camino Real 104','ADestino','2022-11-03','2022-11-05',1,1,'2022-11-14'),(147,11,9,2,297.18,'Av Pedro Ruiz Gallo 102','ADestino','2022-11-03','2022-11-05',1,1,'2022-11-14'),(148,10,10,2,164.62,'Calle Mariano Valdelomar 12','ADestino','2022-11-03','2022-11-05',0,1,'2022-11-14'),(149,9,10,2,452.56,'Av Las Lomas 702','ADestino','2022-11-03','2022-11-05',0,1,'2022-11-14'),(150,4,7,2,302.95,'Av Carlos Arias Araguez 75','ADestino','2022-11-06','2022-11-08',0,1,'2022-11-17'),(151,6,9,2,199.74,'Av Joaquin Corrales 222','ADestino','2022-11-06','2022-11-08',0,1,'2022-11-17'),(152,9,10,1,2392,'Av Las Lomas 702','ADestino','2022-11-06','2022-11-08',0,1,'2022-11-17'),(153,8,10,1,2469,'Av Primavera 505','ADestino','2022-11-06','2022-11-08',0,1,'2022-11-17'),(154,14,13,1,1245.5,'JirÃ³n Camino Ainara 85','ADestino','2022-11-06','2022-11-08',0,1,'2022-11-17'),(155,9,10,1,1146,'Av Las Lomas 702','ADestino','2022-11-07','2022-11-09',0,1,'2022-11-19'),(156,2,7,1,2688,'Av Los Perritos 100','ADestino','2022-11-08','2022-11-09',0,1,'2022-11-19'),(157,13,12,1,1310,'Av Las Palomitas 100','ADestino','2022-11-10','2022-11-15',0,1,'2022-11-19'),(158,1,6,1,2227.5,'Av Cerros de Camacho 102','ADestino','2022-11-10','2022-11-15',0,1,'2022-11-19'),(159,6,8,1,1742,'Av Joaquin Corrales 222','ADestino','2022-11-12','2022-11-15',0,1,'2022-11-19'),(160,10,9,1,1246,'Calle Mariano Valdelomar 12','ADestino','2022-11-13','2022-11-15',0,1,'2022-11-19'),(161,12,12,1,2392,'Av Faustino Sanchez Carrion 930','ADestino','2022-11-14','2022-11-15',0,1,'2022-11-18'),(162,13,12,1,1529,'Av Las Palomitas 100','ADestino','2022-11-14','2022-11-15',0,1,'2022-11-18'),(163,12,12,1,2609,'Av Faustino Sanchez Carrion 930','ADestino','2022-11-14','2022-11-15',0,1,'2022-11-18'),(164,2,7,1,1629.5,'Av Los Perritos 100','ADestino','2022-11-14','2022-11-15',0,1,'2022-11-18'),(165,12,12,1,1629.5,'Av Faustino Sanchez Carrion 930','ADestino','2022-10-28','2022-11-03',0,1,'2022-11-14'),(166,5,8,1,1330.5,'JirÃ³n AndrÃ©s Calamaro 402','ADestino','2022-10-28','2022-11-03',0,1,'2022-11-14'),(167,6,8,1,2101,'Av Joaquin Corrales 222','ADestino','2022-10-28','2022-11-03',0,1,'2022-11-14'),(168,3,7,1,2425.5,'Av Camino Real 104','ADestino','2022-10-28','2022-11-03',0,1,'2022-11-14'),(169,4,7,1,1294.5,'Av Carlos Arias Araguez 75','ADestino','2022-10-28','2022-11-03',0,1,'2022-11-14'),(170,13,12,1,1278,'Av Las Palomitas 100','ADestino','2022-10-31','2022-11-03',0,1,'2022-11-14'),(171,5,8,1,1950,'JirÃ³n AndrÃ©s Calamaro 402','ADestino','2022-10-30','2022-11-03',0,1,'2022-11-14'),(172,6,8,1,1107,'Av Joaquin Corrales 222','ADestino','2022-11-04','2022-11-08',0,1,'2022-11-10'),(173,14,13,1,1586,'JirÃ³n Camino Ainara 85','ADestino','2022-11-04','2022-11-08',0,1,'2022-11-10'),(174,2,7,1,1802.5,'Av Los Perritos 100','ADestino','2022-11-04','2022-11-08',0,1,'2022-11-10'),(175,12,9,1,1318,'Av Faustino Sanchez Carrion 930','ADestino','2022-11-04','2022-11-08',0,1,'2022-11-10'),(176,13,12,1,1278,'Av Las Palomitas 100','EnAlmacen','2022-11-05','2022-11-09',0,1,'2022-11-11'),(177,10,10,1,1909.5,'Calle Mariano Valdelomar 12','EnAlmacen','2022-11-05','2022-11-09',0,1,'2022-11-11'),(178,14,13,1,1246.5,'JirÃ³n Camino Ainara 85','EnAlmacen','2022-11-05','2022-11-09',0,1,'2022-11-11'),(179,14,13,1,1606,'JirÃ³n Camino Ainara 85','EnAlmacen','2022-11-05','2022-11-09',0,1,'2022-11-11'),(180,14,13,1,734.5,'JirÃ³n Camino Ainara 85','EnAlmacen','2022-11-05','2022-11-09',0,1,'2022-11-11'),(181,13,12,2,399.36,'Av Las Palomitas 100','ADestino','2022-11-09','2022-11-11',0,1,'2022-11-14'),(182,5,8,2,263.08,'JirÃ³n AndrÃ©s Calamaro 402','ADestino','2022-11-09','2022-11-11',0,1,'2022-11-14'),(183,14,13,2,560,'JirÃ³n Camino Ainara 85','ADestino','2022-11-09','2022-11-11',0,1,'2022-11-14'),(184,12,12,1,1560,'Av Faustino Sanchez Carrion 930','ADestino','2022-11-09','2022-11-11',0,1,'2022-11-14'),(185,5,8,1,3862.5,'JirÃ³n AndrÃ©s Calamaro 402','ADestino','2022-11-09','2022-11-11',1,1,'2022-11-14'),(186,6,8,1,758,'Av Joaquin Corrales 222','ADestino','2022-11-09','2022-11-11',1,1,'2022-11-14'),(187,5,8,1,2273,'JirÃ³n AndrÃ©s Calamaro 402','ADestino','2022-11-09','2022-11-11',1,1,'2022-11-14'),(188,3,7,1,1624,'Av Camino Real 104','EnAlmacen','2022-11-09','2022-11-11',0,1,'2022-11-14'),(189,15,13,1,1313.5,'Av Los Gorriones 644','EnAlmacen','2022-11-12','2022-11-14',1,1,'2022-11-16'),(190,8,10,1,518.5,'Av Primavera 505','EnAlmacen','2022-11-12','2022-11-14',1,1,'2022-11-16'),(191,7,9,1,1624.5,'Av Las Gaviotas 1002','EnAlmacen','2022-11-12','2022-11-14',1,1,'2022-11-16'),(192,9,10,1,1017.5,'Av Las Lomas 702','EnAlmacen','2022-11-12','2022-11-14',1,1,'2022-11-16'),(193,9,10,1,1531,'Av Las Lomas 702','EnAlmacen','2022-11-12','2022-11-16',1,1,'2022-11-18'),(194,5,8,1,1104,'JirÃ³n AndrÃ©s Calamaro 402','EnAlmacen','2022-11-12','2022-11-16',1,1,'2022-11-18'),(195,14,13,1,1742.5,'JirÃ³n Camino Ainara 85','ADestino','2022-11-14','2022-11-15',0,1,'2022-11-17'),(196,5,8,1,1529,'JirÃ³n AndrÃ©s Calamaro 402','ADestino','2022-11-14','2022-11-15',0,1,'2022-11-17'),(197,6,8,2,571.54,'Av Joaquin Corrales 222','ADestino','2022-11-14','2022-11-15',1,1,'2022-11-17'),(198,6,8,2,247.56,'Av Joaquin Corrales 222','ADestino','2022-11-14','2022-11-15',1,1,'2022-11-17'),(199,4,7,2,302.95,'Av Carlos Arias Araguez 75','ADestino','2022-11-14','2022-11-15',1,1,'2022-11-17'),(200,9,10,2,424.49,'Av Las Lomas 702','ADestino','2022-10-11','2022-10-14',1,1,'2022-10-19'),(201,13,12,2,424.49,'Av Las Palomitas 100','EnAlmacen','2022-10-11','2022-10-14',1,1,'2022-10-19'),(202,3,7,2,692.31,'Av Camino Real 104','EnAlmacen','2022-10-11','2022-10-14',1,1,'2022-10-19'),(203,7,9,1,2713,'Av Las Gaviotas 1002','EnAlmacen','2022-10-11','2022-10-14',1,1,'2022-10-19'),(204,7,9,1,1228.5,'Av Las Gaviotas 1002','EnAlmacen','2022-10-11','2022-10-14',1,1,'2022-10-19'),(205,13,12,1,1082,'Av Las Palomitas 100','EnAlmacen','2022-11-18','2022-10-19',1,1,'2022-11-23'),(206,5,8,1,3680.5,'JirÃ³n AndrÃ©s Calamaro 402','EnAlmacen','2022-11-18','2022-10-19',1,1,'2022-11-23'),(207,15,13,1,1156,'Av Los Gorriones 644','EnAlmacen','2022-11-18','2022-10-19',1,1,'2022-11-23'),(208,10,9,1,1616.5,'Calle Mariano Valdelomar 12','ADestino','2022-11-18','2022-10-19',1,1,'2022-11-23'),(209,16,7,4,365.14,'-','EnAlmacen','2022-11-22','2022-11-22',1,1,'2022-11-22');
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
INSERT INTO `persona` VALUES (1,'DNI','78443939','Jose','Marquez Lopez','1996-05-25','Masculino','943076603','Avenida Caminos del Inca 504','josemar27@gmail.com',0),(2,'DNI','75896625','Andrea','Mejia','1998-12-05','Femenino','958695224','Jiron Julio Vega Solis 504','andream99@gmail.com',1),(3,'DNI','78443939','Jose','Marquez Lopez','1996-05-25','Masculino','943076603','Avenida Caminos del Inca 504','josemar27@gmail.com',1),(4,'DNI','77895315','Joel','Aquino','2000-10-10','Masculino','984522681','Avenida JosÃ© Larco 201','joelaquino18@gmail.com',1),(5,'DNI','75426855','Jarumy','Novoa','1996-12-26','Femenino','958475226','Avenida Manuel Vivanco 615','jarumynovoa25@gmail.com',1),(6,'DNI','76338475','Omar','Ruiz','2000-07-26','Masculino','943078555','Avenida TomÃ¡s Valle 102','omarruiz05@gmail.com',1),(7,'CE','001077238','Yiming','Xuan','2001-12-05','Masculino','913777985','Avenida Fernando Wiesse 204','xuamyiming@gmail.com',1),(8,'DNI','74882569','Pedro','Perez','2001-09-21','Masculino','914002568','Avenida Salazar Araguez 155','pedroperez02@gmail.com',1),(9,'DNI','77845699','Marina','Salazar','1990-03-01','Femenino','900145687','Avenida Lamar 504','marinasalaz27@hotmail.com',1),(10,'DNI','78569958','Alberto','Rivera','1995-12-01','Masculino','987556235','Avenida La Cruz 102','albertorivera01@gmail.com',1),(11,'DNI','78226532','Andrea','Pacheco','2001-12-05','Femenino','996584256','Jiron Mariscal Caceres 201','andreapach@gmail.com',1),(12,'DNI','78569958','Gerardo','Ramirez','1997-02-01','Masculino','987554128','Avenida Pedro Rico 555','gerardoramirez12@gmail.com',1),(13,'DNI','78995814','David','Llanos','1999-07-05','Masculino','987557098','Avenida Arias Araguez 503','davidllanos17@gmail.com',1),(14,'DNI','75889689','Omar','Palomino','2002-10-05','Masculino','94859837','Avenida Las Banderas','omarpalomino55@gmail.com',1),(15,'DNI','78935868','Lionel','Perez','2000-07-15','Masculino','998857998','Av Joaquin Corrales 102','lionelperez2001@hotmail.com',1);
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
INSERT INTO `personaNatural` VALUES (3,'Pasaporte','119058769','Carlos','Guanira Del Mar','1980-12-15','Masculino','958665224','Avenida Ã“scar R. Benavides 124','carlosguanira@almohadaspepe.com'),(5,'Pasaporte','154889652','Fabiana','Cueva','1987-02-28','Femenino','958665478','Jiron Honorio Delgado 502','fabicueva10@camasac.com'),(8,'DNI','78559835','Armando','Lama','1987-06-28','Masculino','958696632','Jiron Hector Delgado 502','armandolama@gmail.com'),(12,'DNI','00211258','Leslie','Barreto','1990-04-18','Femenino','958956610','Avenida Gregorio Escobedo 502','lesliebarreto@gmail.com'),(13,'DNI','76882105','Franco','Leyva','1995-04-20','Masculino','994568225','Avenida ArmendÃ¡riz 101','franleyva@fransac.com');
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
INSERT INTO `producto` VALUES (1,'Almohada de plumas',35.5,25.65,0,'2021-05-09',_binary 'ÿ\Øÿ\à\0JFIF\0\0\0\0\0\0ÿ\Û\0„\0	\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r( \Z%!1!%)+...383-7(-.+\n\n\n\r\r\r+++-++-+++-77---++++7-+-7+++----+++-++7+++++-++++++ÿÀ\0\0Á\"\0ÿ\Ä\0\Z\0\0\0\0\0\0\0\0\0\0\0\0\0ÿ\Ä\0-\0\0\0\0\0\0\0\0Qq!1Aa¡‘Á\"R±\Ñ2brÿ\Ä\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0ÿ\Ä\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0ÿ\Ú\0\0\0?\0ú\Å÷\ê> \0\00p \0ƒ\ÏF	=>d²•V‹@z *JM€T©\0\0\010O> s\êµ\á\ã$ó¶òšs÷üý/_#\Ã\ÊÛ¿YvÇ‰/°:a\Ç\'‰d\Öÿ\0\'8¹%’,\ã\ä©\Ú/(£§G#	\Ú>\"¼Gý~Ò\ä6´|}\í2{_¥)\Ç\Ç\çð<F??€j\ÎÓ\Ï\â³½§ŸÀ5gjÃ•üBñxò¿E†3´\ãóø´\áóø¥¦W´\ãò›\Úñ\ä\r´L/køûO‹øû(\Ü2½¢r»úe{FVùj@tXU\É\Ä\âe}ÿ\0hŒqAÕ——Ÿøe3\Î\ÝOñ\äŸ\î6\ß:\Ô\0¡\âe‰‚yõŸPý_²¸œ9—R\Ã\Öÿ\0\çùiÅ–:©®\Î4Ûž\â*6bC£Ø…”@öU*PU¬V†…H0€…U•&-5¨==\Ñ\ÆÁZM‡¶|LÁ<L\×ÂžõŸ\r\Ý\×F\îòVœÿ\0ªú5\Ê\ÏfYe\ç$mœÔf\0\Ä\Ëó\êp¹õ0WþS¥þ\Z\åpÿ\0\å:XÚƒ,£,±o’,Q‡t»­´]\ÔÁ¦Ñ D\Ä\î+˜ŠôV4¤\ËJ£J&\Â\Òô*\Òñ‡¢°g‘\Úp\Ý\Z^“&²×š²§„Xc\íVLqù£…‡vn¦K•¸Xûþõ¥\Ëz¼\äi—w«\çð€I\âe‰‚}\ïS…\ïzœa\ë:ùþV|6EqVJ3\î•Å¦Šƒ=š€ŠJ\Ð\Ð ¬_t¬Aê»ªÒŒ´4\Ò\Â\î Î¦ÖºFXƒ=+G¡ 	Ä«±3‡h2‘\ÕÁ\ákÎž9h\'??%\É1Ÿ\'†:¨Œ\'z\îúC\ËÖ«/)¨‹\0ªjŠ 12\ÄÁ<úª>´Á¯Ý¢;?»Z¸$”,¦¬€‹J\Ñh¢\ÒÆbû§ g!\éz==\êô4¬Æº\Z71m¢\î Ëºs½\Ñbˆ\Åh\à\0`\n²Í¿u\ÖõAŽL±0+ü™³€Û³úÞôÇ³zÞ\ÔL‡OB‚l-+J\îƒ-š\\JÀF†•£\Ð\'E¦š-tpôrl-/C@\ÏG¥\èh\èô»@$\0\r/C@\r/I\È9rþ[\ÊÂ šGH&X˜\'ŸUDûÞª€\è\ì³\×öo§\'‰\Ýuc–\ÔP\ÑC¡Š0g`‘z+\0†ŒX4f	\ZV†€\èÁ#J\Ñ\è¢\ÓB\Ð#CK\ÑQ”hœ 9ø¸\Û\èÎºrŽ~$óR¦U‰–&	\ç\ÔËŸS€\é\àp·7yù6˜«	©\')¥wTN• \îª@\Z\Õ¡¥\0F…\Å`\Ý\ZUƒJ#G¥hl\ZP…\r\0`F!¥\0E\Å:jV(\Ç\'7:òŽ~>>W\ã\Ì\Õ4\éT,LÏ«N\Þ]<\Ùó\ê\ê\ì˜yo\Þÿ\0€uc†\0\0\0\0\0\0\Z0\0\0\0 \0Œx¸7NpU%ñ&­\ê€<L±0O>¯O…\Â\îë¤Ÿ»Ì¾ý^\Ä\0\0\0¶ßœ\ç\æ\êcý\Óóa«8Ÿ\×ÇŸ\Ð5|F?#\ÄNW\è>\"r¥\â\'*\r\Ã99`\Çõ\ç/²ýy\È“ñö<G\Ç\Ø6|G\Ç\Ù^\Ññö\rÃŸ\Ä^P¼M\åö \æñS•üœ\íXü\Ï\ØŒ\ísüÊ¯\Õ\Çû§\æ\Ë$\Þ6Ý\æ\r\ì®WX\Å\×\ÛpžW\Ý\È‰–&	\çÕ¶§9$\Þ\ä\æÇŸP©\Ûr÷“\ì^Û—´Ÿ\å\Ê\Ñ{V|\ä\é#<³·\Ö\Û\ÕPÒ©@\Õ*)¢ÁF˜ ‚ 2\ÙZ@v•\" ›@Z@€/…\Æ\ËONWÑ˜œN6Yz³\0,@õ \0À\0\" \0`\0P€\á€\0@\0À\0\0\0@\0`H\0*\0© \0\0\0ÿ\Ù',1),(2,'Cubrecama Finisimo',55.5,34,0,'2021-08-09',_binary 'ÿ\Øÿ\à\0JFIF\0\0\0\0\0\0ÿ\Û\0„\0\n\Z\Z!.%#+!\Z\'8&+/1555\Z$;@;3?.4514!!!144444?64444144411414144444414444444144444444?4111ÿÀ\0\0\Â\"\0ÿ\Ä\0\0\0\0\0\0\0\0\0\0\0\0\0\0ÿ\Ä\0K\0\n\0\0\0!1AQ\"aq‘2¡±ÁB\ÑðRr\áñ#34bs’¢²\Ât‚\Ã%CS\Ò$Tƒ“³\ãÿ\Ä\0\0\0\0\0\0\0\0\0\0\0\0ÿ\Ä\0%\0\0\0\0\0\0\0\01!AQ2‘\"qaÿ\Ú\0\0\0?\0\è¨qn\Ê%A€$‘\èEJ÷}\ã]±Ý¼Š$\ÏQ¬oU‹djKMg”\Ì`°\Òr\êÁt\Þd\Ñh\í\éù*‚¸ù‡d,\ç®ú¯…Ã¡f?)Š\å\è\Ð{\îb?\æÿ\0¦\ÍhEy\ß\nÀñlCaqV\í\'\ÚÁG¶¯,,Ú–Í”AQ\ÔCù7\Z]±7ý¤aòZµgM¡¨\ßj\Ç\ç\ãƒ\î\àÿ\0\È>¢œ\Ø\Þ2k…oÙ¸\Ã\æ\Õ4»y/´_\×\îÿ\0x>KV€¡\ÜQ±Žn(G.3(2 <\è•g\'~« S…4S«.ñ\ÑOÁ]£Q(§\nˆ5;5E‡\×\rriSJŠùÒ‚`¿¬\'‰ÿ\0KQ»\ÃJ„þ°ž\'\äk¦/\Ôtö/Ñ†øþ\ßû\ë~`?F\\G…¿÷× ]3\\hkÃ±Zcñ^?D¯q¸t¯\Ç\é\Äq>#ý)E^CR-B†¥Zñ\Þ\ß{ñ†\Û?\Ï\'\ç\ï-n}‰=›Ÿ´>U…O\é­øÿ\0¹kq\ìIþ—ö‡\ÈWn>Ÿ?\êÿ\0&°T‹½F*E®\Ñ\á\É#\n\Ç{#ý5\ß÷VÀ\Z\È{,\"ý\ß?õ\Z•1êµ”©M*¨ñ\ìU\Ä*d\ìAF \é\ã\áC\îf\Ñ\ÔFP6\Ô\ï#r~”h  ˆ\Z\ègŸ-z\Ð<U˜=$\èuÙ¹mß±\å5\Ï/—\\u\Ò\æõÌƒ±\Ìó\Öf9i\'_­Z·rôƒ”2øD\Ä\Ìó\ßnu_l†\\¤²\Ä4Á€w6\í<¹\Ñkv\Â\ÌsÖ®>¬\å\éG½Š÷1?óö,V„\n\Îû{8Ÿùû+B\ZµW¨\ßj\éje\ÇÒ¢¾wöƒúý\ß\ï>‚­ƒU= ?üý\ß\ï>‚¬Mg\'~ªI®\ÍG5\Ðk.\ÛH\rt\ZŒ\Zpj<S\ÅDTˆÓµF¥I\\&¯`¸>\"ôý•¢ñ¸VI\åKMY>\Ê\ã¿ú[Ÿ\åÿ\0\ÝMS\ÏK»PL7õ…ñú\Z\Ù\ÝöW\ÕnzÆ€\Üöoj\â½\Ì-\äPub‡(\Ð\êXHu¼c\ÍÍ”³Ò½+ô`Ý«þþo^†¢¼\ëô]\ï\â?e>o^Ž+£\Ê\ã+\Ã8«\â8/’\Z÷[›W…qUÿ\0Ä±®\Þ9PÔ·^«&Ö”\Ô\ËU—J°†¼··\Ü\ã¿\Æ8¿Ò§\Õko\ì9þ—ö¾‹Xqý\"xýV·^\Å!\ä‚$\é¡\èµ×§‡\êÿ\0?ñ¬õ¦\nz\×hðd~Xš\Éû:±‰»\â\ß\ê5­5˜\à©—\ï/ó4¦=VŽ•v•\ä‹d\È%Î“ \Ø\Ï^ú«rÁ\Ï´‰ˆØ“\Ög—Â®fª·,p¶º*\"Î³êµ‹§£x\å\ë\ê$ƒÃ¾)\à\ÕTm\ã?O\rZd\Ø\Æ\ì\â\æ?\ìX£\ßj:Zó®\ì†ø‹·Õ‹‹¡V*2‹Vˆ\Ðw±«‡ô{Ãƒ*ÙŽ ¬4õ¥joM»bSõ\×\ÔT7qiú‰\ZÈ¯°4\ínc\çš\×\\>\Ãp\ÐÁEX‚@ûW2ûý\ãÖ¦—o.\ã¬:\áö›¶g5½ú9¿ö®\è\ÖR\Ø%•K¹l L{¤|h¿\Ñ\í\Î\Ã>!4K\"³H$ŽCÎ™J\éÇ–8ËºÆƒNšô\ïþ\Ø6\ÝV\å\Ã{.db@R\ÚÄ¬h¤\èw\ëå€€ù\å†\Ê\ÝAñ¬\Ük¤\ä\Æô‘®U\îb¢¶ð6Ap#º…$\Å\È\ÌbFdyG¸G³8²\Ødº\Äf»†A\ÔÍ®‘¬k\ß\Î\ÌX¼\Ó\Ù\æfw0¥G{wƒð\Ç/ö‰1”+–b|2\ÍzN„ð\ÔBS\rbN 1ý^\Ñ$P65©ÁamY–‘óDT#¹²·]ªø³÷^o	À©»fÝ°L+¹‚:\Ì\ÊÁ˜\Zžt\ã\í\"#\ä\ã¯÷µ\èwò]°\ër2¸dnýJ\È\ï\æ<«Á±\Ö\ÍÇ´þò;#w•1#¸\î;,ø­ñò\Ïy/öÛkø‘ d\ÂÁ Hw?\ÏO ­»ñ¿a\í}¢—’3H\Ì\êWH\Ö$×†µÔºC)Axƒ4›ž\ë\ËqÏ©\'ô\Úa}ž\Ç\ás5»¨ 3\ä6’mžµßµ\âs¦5#\Çÿ\0\å^…m\Ë\áß½ý&²\Ó\r\ÔúVœ&2‡)\â|ñH\êOªPC\ì¾\"\æ$^wFb\ÈOm5ˆ§!ZŸ³=¥K‡\ZŠ\ÎSsU\Óq»•š\â|þ\r\ÛeUˆ¥YKFÒ¤ÁÐjµ¶­\ï\é.ðL\n³r¸‘\âC\nòÆ€b\Ü÷Š\ã—=|_S<—£Mcm\Ù\Þ‚Žzs¡^-ˆVT\Â\ÞÂ”\Ð¸/\Ìw\ÕDF\Õ\ç–xªu¼¨¿\âï¥¼Œ¬H0\Û\Äô®“Gù|²\Ýõl¸‡\â¶Q¯2\á™K6F}d“D\éBø\é\Z\ãµ\Ï\å¥¶¸2f\äÔXÎ“\é[¬^\Ý\Ã]³˜)¹m1e+$s‰¯:»ú#ºAA\"ódH;cM]\ÍVñ\å\â¼yL¤—\ÛG7\é­y`\Øô› 0\Ål=–\ãv\ï*\â\Z\Ü\\\Å;LW1e\0\é^z¿¡{\æggºð­\ïö^\å•\n(I\n\èñ\ë\Z\Ô+O\Ö‡ð¥B’8û§\áJ³º¾8ü¼þÝ²\Ìu,@$\Åv\Î5Yñ.€=»b\Ò![`	žAŽsÿ\0U3‰]p\Ìó.’–‡E\Z;÷o”xµ7Ù—¶˜\\B3\åV]~•k8\Å\Üf!VI(\ã=¶<\Ôò?\Úñ\ßP\n€\ã\ám›ªHd?¨\Ü\È=ühƒ¸\0’@rt\0x\Ò]–ho\Ø\Ïwýÿ\0ý‹5g¦B··Q\Øqý’{-\äN½\Í\ÝY.\íZaþ\Ù3—»X˜\\¿gm<N¨~.3\ÚkŽ¬!\röŒŸJj\íw5¡,F¶\ZFdb$t$m\ÍU´\Ñ,Z6v$À\å,v\î\Ü..\Í\ëE\Ù:v\\€±\ç#‘\ßøPe\Ã+œ\äe\Ý\n \Ç\"[q\åU‘Û¼E®B bH\ì–S\ïe\æ\çMt“Z%Ë†%\ÑDFP’±±\×\ÐV?„‡UkˆÅ‰,2±œÈŒ@Ž Ä\ãS\ãE\Î<¶Am ¼œÑ¨P$À<\ä\ëA§\Ãß¹hu\Òt‰Ì£»y\ZóŸn=›±o÷K6\\@7QSD\Ì\Þü<¤\ÄxV\Ëp\È‹†•“\0ƒV$i±º··<8]Â¾Sý[©®\Ê\ç+	\ä&	ò¢\ËgL\'\Å\"¸KN\è2Œ\ÊNa#C¦Ç®½\Ôkˆl9…|\Ê\ÒBAž§&Y1®\Ñ‚\röWf˜3¾\ãJ\Ø\à±j;ƒ@S%´ß˜;Q\Z\î\Ç\í9–GW\Z™F\Î;ÉŠ<8¼¦dVˆ÷™`¶€\ê\ÆvŸ:Æ¦$=¶¸\n\ç¶IG]¨ù‚$ðhµ\Ì`þn6f\Ï²¬~yh4¸< €\Ìr°t,‰c\Ô\í\ÝYon}–[®·•ò\\p˜ŽË² h\Ù`OE\ZiW.ñ°¨a ’ªB\Ì|§\áO\Ç(¿m¬#¶fœ„»·S˜’@0Tò\írç•—O*\Çp\ë–[+ˆŸt\î¬:«\rÒ¡²’\ê	YD\ëÌv§\Ýöò5««™f1•:ƒÉ‘\ê*3¤de=G\çO*:c–\ß@a-”¶N„\ë¸Â­\"©i47†]\Í`\Ï\êô\Ñ?»\åZa\"\"rŠeû\n\ÊIU\') Àc‘§«ªXErú\å 9H	Ôˆ\ÜPdK+<8°û®§\ÕX}k\Êø3mfÿ\0:õ¯\Ò:%\Þy$\Û_´!HdVa˜F<\ë\ì_²©ŠÂ¥â„³˜\Çd\Ä@5Œ¦\ã§\'\Û?‚Ä³	\ZoSp\Æÿ\0Ä“ö\æklß£©\Ñr(ðªxÑŽ!q+u/\"¢¬}\âù:DDmÎ¬Lò\Û\Òð¯)¯O¥Iaª¢`.¾¿æ®¯\×\æÿ\0\ÝF6µl\×Xö—Êª\Ãÿ\0P„Ÿ÷SÓ†·\Þpè›\Z&\ÖóÒª\ßð±\ÕÀ?\ZT6ù\ï‹b\Ý\îf²(\è¶Þµò†÷A:\Ñ\Î3\Ã\Ùf\èC‘Œ“½Ç­\07 \ÌVˆ%\Ã\Ñ]wLù\ZÝ´\Ê,¾y$®¿s\ãZŒN\Í\Ñl8`]*ý¬&œä©\Ô\ÏuöY\ï%—¹‡\ïw#°Í‘-‚\ï8Ú´8ƒi\ï\ÛLHº×ˆ´	L>@Á\×\ßm†ƒjH–²\\O¶±7-©9Q\ÈRbc¿\å\åU±8\Ð\Ì]MXö™\Ý._g\ì\î„L±\í\0yFÕ—knw\'ó\ÝU\Z^Œ/öˆ4\Î\ÔfükIgD¬ @*@\Ô¬—²‰’\ãýPu±£¼G‰ZS/”žB%½7oƒ\â{L…f\nG12\Ìù\Ó0\×[*°\Ý]\È\ïVc ùA‹–bQv¹Ls4Òž8•Ñ EQÐ´ü¨4öø˜\Í9À\î&\Ä{§Q\ÏJ+Áx£:¸s#\Âd 6Ýˆy¦‡\à\ÝD`Ž6ñ\Ù\Ñ|OÆ‰p§\r‰tc:0V¶y“ JøiAö›¶r\È%\È\Û\Ê6«\'¨÷Ozžµ¦öY\Ã\Ú\Êðr¼\0•\Ô\n%†\ç\Êo[–?¤K€:\ÎS\ÜMMc\Ù\Û9X\"B‡\0\ÜLŒ\ÔÙ ÿ\0\åVÀ{!\Ä#³,B\0¼´úv+ˆ¾pË†ºQT¨%B.±¬±4\çE,\â\Ú\Ðq	@OÙ¦›\èK\0Þžts	F\ÊC‰``\Ö J’$h	\Üu¬«w‰¸;T	vó™v@cjŸ\Ån£‡\"Þ†tv\×\á[¼\"Óœù°\×2˜25˜ØŸAñ\r¤²‚òI,\ÌKI\'/d·]\r6h\'‹\Ü)L\ì[*±Q\'sk©ó5^\ç\rGPt]gC¹;\È×¥^¿†ko”‰9Ci2„¨9µV\ê\"£ŒæŒ¼ý\Øýô%\ÓJœ}•r¢ƒ¤›(\0\éú¤Õœ6+w@öS”7\Ú9ø•\n\ÌÙ•÷`\é%¼jÕ›…Ž\Ä}\Õ0} L\Ð\ÛWg…;{\Ø\Æð¶¶\Ðz…\Íñ«¶8%¡©kŽz½\×h¬\æŠ0<7=\È1ñW\rŽGªu÷„k\ãµ5ÿ\0MŒ\Ú\áö±[HFc”K@\'X¶ˆU\n:Ò‚;2¦dœ\ÚF¦52y\×-b\îý\â\'\çO\Z»ƒ\á\ë¡\è/ò\Çýc\è¤x\í?\Zr\ãŸû\'þ“óž4\Ü\Í]\ÏB¿–¼ûŠG\í~Fº8—ö“/\Ö*j›‚Á©BnñB4Tõ`>f 8«»Ü£\á&®ªzf\ï«=öc§\Äþ4ªø¦\ã%Š\Ä\Ûe*]agR;\èBð\ì0˜[>l§\æj‚p»-u‡\Ù&TE”Ag$ü\0â«ƒƒaÿ\0ôSü\"ª	\àq\Öm)e\è&Ù\Ón•\r\Þ7ƒ\î\Úwù0 \æTr:Ž”7…p\ë%$\ÚBCº\ÉE\'³q\ÔjG@(´8p—˜(\02«\0=“\0~\Ìù\Ó`\Çö“\ê\Ê\î“%I\\€1û\Ò`!Y>)‘`süù\ÕKvü\rOgo*¢Ý°_µ$÷Î¢¦[—Ò—\r\0¶S±ù\Í| P2‰ž\á¥Eû:•S¸ø\Õâ¿Ÿ\ß\\\"(+ªÀó½v5\ÕV\ÐwxoRþvüjA=5\ï ÿ\0”\Ð\á8¢ˆr4>m®Á]}\Ù\ìƒ;“Ë˜£h\áýök74÷o*ƒk\æ+*;†½c_\ÝR\í\ÏRwbñDÏ‰ \Ù3º$\\h	Ž\ÈØ‚s2…\ÞcAü[ÿ\0KÈ·Rä§ºª‘¦\áY£.¾>šÀq·±%T\í\à9ŠÐ¦=/¶dº\Ön•\nUµV\Ëý“*\Ã}\à\êk*±cˆ=£@‚¡\ÞIŽJ\ÐO\Z%‚\Ç+©\ÈÀ	 2’`uMc¾¨›\×r\ä½g:\r3[2¤i$\Æý>U\Û|#=•\Ê\Ãl\àœ¤\éIŸh¢wp¨\àU=\í\äF£Ö„\âýŸ\Í%0;«˜x4‰ó®ZºöHF^&@@\å\Ùa\Ë\ÇÎ‹\á±\nÃ´ Û;¤õ©¡š ƒ*z:™ù~4Ë¶\âF³‘¶œ½5Ö¶iXv”4Ÿ¼óžµKÂ”{ž\é k®‡uú\ÕFs1\"L¶ƒSð9?H·yL\r¶‘§(<ªóð\ÆÍ”\ÕXo•\\i¯HI2ò$øt<¶Ò ³ö\îº)hß¸Ÿur\Ï;ž¤\ZRuŽ@u\ï\ëR¡ø\Ä*» ò^R4\"§EšÍ‡®\Óa1\î‡InQ ~•|“M\Z\é]†X\â\Âu*zGŽ»UûwUÄ«:Õ–TI§I¨\çX©\"¢û\ÕD+•\ÚTyÂ°¥•ž@\Î\ìG>ÊœŠ}:&˜1ÍŠÌ·´ym\ÙAª¡ŸžQ”m\ëT®qüK\æý•Qñ~545¼+\n¿\Î\'-\×Ÿ¼Còýª\Ïûq‡\ì‘\0²¸#¸A\âhMŽ\'}KyÁc˜öÎ¦\0“\ä¥S\â¸û®C»—* €<M4]\ç\ãVð\ÛOqùUW\ÜøÕœ#h<j‚¼5{k\ãóÒ´õ`\Ã\ÇÈ4¬öI_:?…\ï\ßA\ä?\nŠ˜\á\Ã\ê4=9rª\ï‚a¸ó\ØQ‡OñG\çÂ¬[\0\È#]\ç§uYŽŸ*\ïÙŽú)‰\Â\å˜Ö¨²G\î¢\"#ó½u»óô§…\îõ§\"\áùï @yü>µ-½#®\Ú÷÷s©@ùkøsõ¥=\Ó\Ç\ç@gƒ\ãU\É%\Ñrn\çPº\î2zEpl\'\Ëm\È\ÔF‡¸¡0|G:\Ë[0eL£B<\"ˆ[\Äö@h\Ï:»\"»F;COf}f•¢\\I\Ñ/¢\Ò@9I;Lˆ™ÿ\0@¯ö	Ì\Ú$‰\Ë&`ø‚|*ŽŒ:\Ú\Îòª‡\Ê7óKnÃœ\ÖÉ¶ûœ§+‡b<ª\n\Øv¹cß•]€w\ÌO€U$Q\\?F\0êœ\"\Æ\à\Ý*,GDr·a5…o¸Àm˜\î\Ý\Ý\\Ç¦’ŒÁ˜H\\Ä¡\é\×á¦´AD24‚Nc¬óª·øE¶\Ô‡ª\Äz¤VV\Ç¾¬H˜e\"\'‘\Zs­2\ß|¬sx >ƒò¢‡\âøs \äÃ¨\Ó\Ô\Z‰½IS¡<\ØÖ\ÇV$þw5”\ÄbV\Í÷\0„€\ÈH†V‚V<ô\éCDücxó\éóª\í\Å\\\èÇ¯…E\ÄP[¸\è\åV £\î™=\ÑU\Æ2ym¯\ï5t,¾)ù°_\Ïy4\ì¹mó­\Âcq=–ÁB*ƒ\ç r_\á¾\Ð\rz\éOÆ¢=K‹[¨®›0ô;|\r8ûÕ“ö/ˆCµ£³ö\Ðta\ï0?\ËZ\Ã\ïV\Ñ-*T¨<Ž÷³·A\ì•a\ß\Ù>Ÿ¾ øÿ\0\Ëÿ\02~5\è&\Í1­\Ô;<\ábªTe¹4\Æ\Ó\Ð\Ðþ5ƒ»js$§ë¨‘\çúµ¼6\n\Ýv‰VD#ug\ÏFWT\ÐÇ„\ÏÒƒÊ†\ç¸Ô¸f¢œG\nŒ\î\Ë\Ø9‰\0	X`\ËY/.SAŒ#rë £\é¨få·‚ÿ\0Y®û÷\n\Ð\Ù¹\Îhõ‘ôN\Ñ$x\êO|Ÿ\ÝS-\Í<„zT(±”r\Ó\ÂL}jbQžC\èh§=Í´¾SQ\\·¤ó$øiI¹ð~cð§\\m\0`ŸPh*®„§bv‘\åðýô,\ã™Z\"OŽ\Ô–\ß?\ÏÆŸ©üjŽw\"K\å¦“\\(»1$\îy\é\àh-¶!Wœ÷\r~TÓ‹?u}j¿Ú ˆ‚zN€w\Ò8¨÷~@ð ™®\Ü;˜ø|\ë–od`\ÙõS;ž^]\ï\Ó\ë=ñ\ëL‚yô\ç?Âƒs\Çr5’ñ2ˆ\à÷†+3\áS{;ˆûL:,ÁRÁN§f=ŸHªø½pa´0f\ÕC\ê\Z¡öv\â‹1,\Ã3s\ìò0eT1Ì–n»\Îá˜¨=”F™\ÌÅµb\'E\ZN\ç•\à\×f\Âf?y\Ï\ë}øo±ø\Õ<rwVÁ\ÙûG+p,h	A>\èž\ÈK)\0€Ã¬&Cþöœ©zI\Úkg1%¦\0,y\0ùVO‰§\ÚbY…’¢u\Ð\Z™<„“\Ü+_iN\áF¦$Z‘5”\ãX’—Ø¶LK1%˜\":9o\Z\ÌT…\Ç\\qÜ‰\ÌÄ¨=™Ž\à6ªÌ¤‰Ó¤ë§©§\Üq¯3Ì‘$ym=\Ô\Öh\ç9´|–¨c	\ÖH:®ñ\áùÚ ¸»i\0\íùÂ¥7€\Þ}g\ÃMª­öÁ×¡\äzÈ­\"ÿ\0\Å22ºT†ñ\Ð\Íz}‹¡Â¸Ù€a\æ¯ Á>§s*ô_d±9­d\'T0?eµ\ÃÊ‘\Z:U\Ê\íP9­Uw·W\Ú\Ësc\ä\0ýõÂ5\0)!L\Z\Ä\ãQƒ½L\áG\êJ¥ˆ\á(Û¯¥‘_þ#\åüj7\Ã\Îõé¸Ÿem9S¨\Êg`dDYò®§²\Ö\àŸùG—\á-2¼r \ëZL1€z§’‘õ­ºp{@FE ò\"k;\Åx1²K¤µ³¿Tñ\ê;ýjUˆ\Õõ u1ãœöÔ¬\ÐIøF‡\ÐERS*\Ñ\ß\êKŸ›\nº°F½~\ZS­\Ìy~~”\×~\ÐÓ•HhßŸ\È\Ôw½\èòøkô ‚\ëJ±\ØYAŸ\ÏJ	\Êy“Wø“ÀŽ§\áù=†‚z“\å”\ÇÆ‘\Þ\àÊ¬D\è$Nºhc¬h|\ê¡=¯tž“ð;ª\\#J´\ØÀ˜€	×¾«\Ü^g^zÎ¼\ÏÖ‚aqº\Ó÷\ß]K„lÀNóñ\ßÊ£·nt\n;Žÿ\0\"¥†\ê@ÿ\0)ð¢\ÊF€s#ŸS½4–?x÷\Ï3\Ü9\×Î¤\í\Ý\n¾óõ®>š5\Úgn¤I \Þa\Ý\rü\à-l\ÛUqýœ£Q\Þ7Ò¤\á8Aj\×aþ\ÕŒ£`y°0\Û\Ô\Õk–³aµ!E\î{£@4P6ò©¸Zd°Ÿd\á€\r,£,œï˜…<„Ç—JÏ±\î\Îb°w.]¸RÛ¸Ó”Ž¼•·ò­´\Éd+Ä’FY.\ÙK\ÓH\Øy\ÐD\âŸ\Þr‰p±\ÌF%û \ïDø8`«!	\í,5-*z§Æ‚\í\æc\Úi\Ôü«5¼.%\ÐI\Íf\ä©û\Ù²²O!›)ó=kOˆ‚X#1bys€:\î\"±\Îùm\Þi\Ö\åÀ‹œ¤»k\Ý\Ø\Z~µI\ÙTXé®‘\Èo\ã\Ð\êr0\0@\Þ\Úú-Br\Ö<?}5\î¼žC î­£¯pu†½\Ð\Õ|Kvd™\'ŸC\Ó\Ö=+¤“´\Ï=`wT8‘\åù\éA\Z<4\Ö\Ã\ÙLfK\ê\ÆC\ã\Ëã§a\í\\\åF0—4¼|ºP{\r*Ã¸Õ»–‘\ÙÀb;BFŒ4>R\r*¨2RšR§+K\ìû\ê\nŒ•%]\È)2Š {%F\ËW/(\å¯\ç­TbzP0­1\Ô®\Ü\é\ä¾”Âƒó­WŠð³—²\'\ÞA®Nr½F›rùQ°ý‘o\å5·5ž\â¼ ©7,wt\ä\ÝJô=\Üþr\ÅPû„s\ßnºýcÊ£/Ú“ù\Û\é5Äºt=\ÄÁˆªø›¥Anco\áE\r\Ç\Ý\Ì\ç»O=\ê{NR	\è@úUt1$ó\×\Î\Z›53\ÈðD\\À¾R$\î\0ø~M5›M\ã´U‡.\ÉÐƒ¸\åMv! jyôÈ©.[´>ðª \Ç~\ÇÖƒrt\0\å¶žòkŠ\à±Ð’;‚\r4[<ô\ë¼|E=lúø\ì:\Ç/3@ƒk\×\ã\é5waJµ\×\\Êœ§\ßs9TžJ\0$÷\çT\Çy\Û\ÃÓ^\Ç9û+ Oh;ž’Ï“\ÃkcÖƒOÆ®†b\ÆeT@\Ðn¾CÂ¤ö~ôX@T‘,V09ŒÁ\çùÒ™\Æ1-n\ÏdŒÝ‘%U†§ha\ÔGZ™Qr¢€&À’I¸cº±\ì×¸¸»\ÙL¨\ìE\Æ\\>br1\Ó*ˆ\ÄQ®ý¡Ù€Š\Æ#`3ôó¬\ï\r\Âbù\Ô*¹\ÜeDpydox£÷¸Å›J°\Í\00·%Dl¢_)\éVÄ•lÚ“ ÔŸº¿‰¬n;€PUDp	–bG\ÞbdúrqøŽ\"ð\Ën\ÎU\ä[@\èºñªxf\ß\ï¼‹¯\Ä\éð¤… -Y\n’Õ·}Ç„,ø\íñ­^ƒ[O¹˜õn\Ñø\è<ª\ç\ÙÖ™e,ð;‡\Þ!A©üù\Õ\Ë|\Ú\îóôx¥4¥[\ì\Ê1”9;·ü/³ª¾óá ­/\ÙÕœ»FÃ™ f\í…E_\äë t‹j|\éV†\Þ\0.\Þ¨,—\è\çÆšX÷,\Õ\Ì\ÔŽóòùkñ®h?:ú\ÒI„\ÕÜ¹U™ªw°j²h\"&˜M=\í‘U\Ë\Ð9š˜Æ¸\ÏQ³\Ô¸¯\ÌM\Ëz?1÷\\t=}dø½\âDARL;\É\äkoŽ\Ä\äFc\Èi\ãÊ¼\ïx³\âO™\Ûó\ßEGe}\Þý¿>u:4I²?hóüô¨\í#û;w“ùõx\Ô\é\ã\Ï\ë@\ëý‘”jLù“\'^ê¹‚PÉ‘õ#µ\çÊ¨\×1\å?\à*n\Ç.c÷‰>:\ÐJ\Ü$w¹:z\× r×¼ó=\Ãñ®â€œ\ÃY\ßYƒô§a\Ñ\ß\ÜB|}Xþ4ó\î=\ç~§J\Ða\í#\ÚD¾\âË¡,‡yG†*\ê=\Ù:‚z\í®´ðü\ã\ê\ä/\Äú\r>4o\r\ìý eó9Ü–<üOœ\ÐG\Äxµ¢Ú›®¤)\n¬&–#p\"\'ZfqnªªŠ€\03>¬cMAŸH­\rŒ: „EQ\Ü\0ª\×qÜ¢\è«\ï\Ìþ¬ô\ëR\ê´0p\ì^õ×¸\Çx\Ðxfü\"ˆa°6\íûˆ£¼‰oñj\Ç(¤µ\Î\åjøž\\\ÓKR\ËH-gw\å­Cf¹Re¤¬Ê¥‘R\ËS­’jÅ¼-jeòž*\Ø|!snu¡\Â\áB,P\á.„i\×ñ¢9$o§w\âkr\Ë\ÒiZ\íIöcòM*¨o£Ö—ÚŽ£Ö‚Ü¹*ÀÇ¸Ou=®{Š#qû·\á\éû3\ä_\íGQ\ëR\Úq\Ôz\ÐO´\é\Ô\rA˜Ò¤K† \å\Ðé¾€Ÿ\r\é9oÁö\'\È\ê°;Oû:€rX\"î¢¹À\ßJ\ëŽ^Sn9\ã\ãt…\ìP¼~® iF…Î€Ÿ\Ï}6\ä­m†X½F\ÏWñ\Ø!2º|¨U\Ôe\Ü~{\Ú\"\åS¢\È1ú\ÛOÆ³(5\Ó_/ÆŽñ^«=¢AÜ¯.ø?J\Ï%\È=¡QWS—™ýôÓ žk ‡Î£KÃ©¦½ð\'Rz\é\çñ Wž$zøkõ56\æ:^¿‡¥Q\Ê\Îaš{Žž”c‡p+«ƒÕ½Ÿ\Z¨v¨\à¸4\Òùô\é[TŽT7Ã­\Û÷V[õŽ­û¼¨’\Ô¡©\Ð\Õu5*š*h_ø>övŸ¥\rTñ–Y[\íNµ6a\Þ*e7U€k \Ó0\ÎfZ´–+“F\nr¤Õ”°*uJŠ®˜~µ:\Ø¤QNCU)\ÙkµÚƒ‘Vð7`\å;»U§Y0­cuJ/–•>)WvlX\ä:ý\ÆúU‹‡µ\ä‡\Ï8Ö•*óû½s¯\Ò\Æ\'eýµÿ\0P§Ÿy¼©R¬N›½þœÀ9\Îú&;¶£x}‰\ç×Ÿ­*U\èÃ§—“òY\Íë´«£š•ú Ô©T±V—õG ¬?´6T9…ÀJ•\0;Z\Ò\Ú\ÂÛq\Â)R ¹m\0\Z\0<*\ÒR¥A2T\ËJ•‹S­r•Â¥Z\í*‡K\í\ZHÆ’uÖ[®Ò®9v\Ü\é%=k´ª)\ËJ•E*\è¥Jƒ¢¬a=\áJ•\\{f‰Ò¥J»²ÿ\Ù',1),(3,'Funda Infantil',25.5,10.05,0,'2022-01-09',NULL,1),(4,'Sabana Seda',20.5,7.05,0,'2021-07-07',_binary 'ÿ\Øÿ\à\0JFIF\0\0\0\0\0\0ÿþ\0<CREATOR: gd-jpeg v1.0 (using IJG JPEG v62), quality = 100\nÿ\Û\0C\0ÿ\Û\0CÿÀ\0\"\Â\"\0ÿ\Ä\0\0\0\0\0\0\0\0\0\0\0	\nÿ\Ä\0µ\0\0\0}\0!1AQa\"q2‘¡#B±ÁR\Ñð$3br‚	\n\Z%&\'()*456789:CDEFGHIJSTUVWXYZcdefghijstuvwxyzƒ„…†‡ˆ‰Š’“”•–—˜™š¢£¤¥¦§¨©ª²³´µ¶·¸¹º\Â\Ã\Ä\Å\Æ\Ç\È\É\Ê\Ò\Ó\Ô\Õ\Ö\×\Ø\Ù\Ú\á\â\ã\ä\å\æ\ç\è\é\êñòóôõö÷øùúÿ\Ä\0\0\0\0\0\0\0\0	\nÿ\Ä\0µ\0\0w\0!1AQaq\"2B‘¡±Á	#3Rðbr\Ñ\n$4\á%ñ\Z&\'()*56789:CDEFGHIJSTUVWXYZcdefghijstuvwxyz‚ƒ„…†‡ˆ‰Š’“”•–—˜™š¢£¤¥¦§¨©ª²³´µ¶·¸¹º\Â\Ã\Ä\Å\Æ\Ç\È\É\Ê\Ò\Ó\Ô\Õ\Ö\×\Ø\Ù\Ú\â\ã\ä\å\æ\ç\è\é\êòóôõö÷øùúÿ\Ú\0\0\0?\0þ4Ù¼Ÿ\í\Æ\åž\Úhý1\ß\ë\ß5\érni¹Û”\ïù}>£¿òòH\ØÇ®XÉ¸ÿ\0\Ç\ÌÑ¿ýøÿ\0?Ò½&\Îb\Ï#±\Î?\ÏOCÒ½\0:y›g÷WõÏ§ù÷«gÎ½¿\éŸô\ížü~5›@£üöüjH¤m\ì\ßw\äÿ\0©Ï§ô ’H|”ûÿ\0|þ£úö®/Æ›Z6fþ	¦ÿ\0\Ö>¿¡ôâº‰¦ùcô\ßø~Yÿ\0?rþ,\Ü\Ö¶óò^s_N\Üÿ\0„\ê\ïum\Z\Þûÿ\0•†ønB­x¿Áöhd\Ç^üñøt­¦‘•rZM¿\ïÿ\0J\åtY¼»‰ÿ\0ŽÃð\ç¨\ë\×;\Þf\äÿ\0g\éôÿ\0\ëZÕ¦Ÿ{þ½fÌª\Ê\Üý\Î—Ö²u)¼½wE™@<\Ñúþ}OZÐµ“½\ß\Û\×Û¿_¥b\ë\rþ™¥\Ï\×É¿‡?\ät\î}zc’i«­S2M§\Ñ_\×þ	\Óx’M\Ö\n¿ôóùþ™ý+Výûuÿ\0\ß\ë\Óñ\ì\Z\î5\æÝ§.\ç\æ?úÿ\0ýo§½p\íµK7\Þg\îsúŒ\ÝG\ëM»}\é}\î\Ä77—\è\Õÿ\0;üúh‚á™[øJ|ü\ç·O\\ý+´\Ñ[þ$ö}‘\'\íùn?Ï§\×\ÇÈ›Q˜®\æòzç§­t\Ú)Æ™l[žqÿ\0‘û?Ö‚\r¥q¸·ÿ\0\ëþ´_ÿ\0Ç“½ó4Ì®ý\Üýÿ\0\×\éþy\ïŠ[\é6\Ú|\ß\ß?»\í\ßÿ\0­\é@÷\Ì\ÞRóÿ\0,\áÿ\0=?ýxú\ÖJ·Vo½\éúuÿ\0?‰­[\Ïõ)þ\àþUˆ­¸ñ÷qþo­‹\åwµô±7˜»\×\åù{‘þy\È<G#3v\Èöÿ\09÷&›»in:Ÿ§ù\Ï_Ç½Fò0ü}8\Çõýh\î\Û\î\ÝIÿ\0>Â›\Û‹Ž|\îþ‡ú\Ôl\Ù\Û\ëý§L\Ôs\É\å\Åp\Ì\É\Z«ü\î\ï\åF\Ïo~y\Í&\ÒM½Wo¢K»é¾‚J\í.\î\Åk\æ\ÚWoñó\é\íüý*´-´²ŽÝ¾¼\çúZ\æu¯\Zhö¿-»=ô‰\Óg\î¢úý£\Óƒ§Á\Þ|DÔ·²\Ú\Çgf®<½\î†\ë\ëþs\Ó\é^>\'8Ë¨I©bIixÐ‹«m–²ISô÷õµ»Û¶Ž=}›…ö•OuZ\êöz\ß\å·\ßo^›v~Uóùqß·^ýªÛ¤žtŸ}s\Æ;gùcÚ¼\ë\ÆZ\å\Ö\æ“U—¿\É	û/øœÿ\0‘YM«_H\Ûdº¼\Üÿ\0ß¹œzŸþµy\Ó\â|3÷aB¬\âù¥(C²\Û\Þ\è\î\ÝÖ‰|»[Y¥z‹\íi\ËùmöU»zz\\öýkwÚ¡UßœyŸ¯\éþªÁ\Î\Ü÷\Îÿ\0Ç¯_¨\ëŸðñV¸™·y—zŸž\æ\Ýÿ\0Ÿ\Ä\Õ_´²¶å¸™yû\è\ã\Ê\íÿ\0\ë?\\\â¹_SrRú¬——¶‹k\á\Þ\ÔÝ¶\êWöl¶U•\ÞË‘ÿ\0òG¹)e<ð»1þ?ýluÇµQÔ·(µm¯þ¤FŸO?üÿ\0#^7ý©|¿ñ\ï}y·ý‡œy¾ß‡\çõ\àS¤ñ&±ˆc“T¼e…&ŠnS\ÍúÁß§§t.#\Ã\Ê1R\Ã\ÖMüRR„\×Ùµ¾õùudK.¨¯\ËR]Sö\é\Êö½\Ù\ëZg\î\æ¹\Ýü~G\áþ?\ç\é]T?\Ç\ß÷3þ?—­x¯/¬\äf˜[M\æ~\ìý¦\âã§¿>\Ýx\Åt\Ö-c;o4òU\ã1³ºó}\å\Þ\ç>ÿ\0Î»(\çytâ“¬\éIýš°’K^²<Vý9\å\ÄF\\\Ê<\ë§+»z%·Ï¿s®\Ö\Û\ËH\Õr¬ïœŸ\Ç\×\Ði­òÜ¶\ï\à‡·_§¦=G×¯_:ºñF‹ªyg¼Dn“yû©³þ·ÿ\0®½Jm\Ö\ÓIü; ùýsüºt?—jô¨Ö¥Y\ÊTjSªŸ-9\ÆKn®-\Û\çk\ëÙ˜JŒ—<e¯\î\ÉY\êf\ß1,Þ¥3ùðLW1#~ñ•OË¿\Ïò\ëø\×C¨Ió7\ÊUJž\Üu\éøt\Årþh\ß÷G\ß\ÏáŸ¯\é\ÓÞ¶­jÙžþ\Æ?\Ï\à?Z½#6wrý±þ=ÿ\0\éY¶\íþ’¸\Ï\É\Ü\í\Ç@sú\Õ\æ`[\ë\Óúg\ëÎ‹\ï\ä\íø\'ú€ºoÏ«[\àÿ\0þ¼\Z\ën¾`\Òwÿ\0Y\Ïn¹\çš\â´\Öÿ\0‰¥¿ðüüŸL¼cò®\Îû9X\×\ïl‡ô\È÷üø\éN³–›.ö½\í\åÿ\0«4mq\'Ýg\Ëÿ\0M3þs×ŸÖ¹8N?\Ï?ýp+¬Ö•£²™Y¿úÿ\0ŸOoþ½rvý>n¼õõ\ã\ëU7\ïz+~¿¨\Zó4j¼÷ùÿ\0­\Üÿ\0ú«K\ÅXh\Ö5Wf}3\ß\éø\Ö\\_4°(\ï4?^\'\Ç‘ý+CÅ’yjÍ·sl1 ÿ\0¦Þ¿\áñ¨‡±\èË€\Ê\ï\åþþ¼ÿ\0­k\æ>@\Ý÷¶y}r?\Ï>øü\ë&\ÇýZóó¬ü‡ù\éß½i_`§_¹ü‡_\Ô~”š»^Z¯TÕ˜6ñï¾³~ÿ\0\'\Üvÿ\0?Ö´5éŠ‡ùC3\Í7\çÿ\0×ªzHi5‹]Ãþcñ\ÇúŒ\çÿ\0\×\Ç\áR^n¸¹Y\î\Û\Êoÿ\08ü±Ž¦˜2G\ä#/Þ‘\ÓÌš?ù\ç\íùõöüqÀ\Ý\È\Ó\\\Í\'\ßÀÿ\0?\çµ\Ýj“yv\×30ùŸüûÿ\0žs\\\Íä´›x\ÝþXÿ\0?S@Z¯;\Úß¾ÿ\0=§?UVùù\é¿9\ë\íõ\ïÂ®/\î\ã]ËŸüô?\ãô\éPÂ¥Ý¾_”?\çúõ…©µ¾¿‡\èL\È\Ù\Û\Ó\×ÿ\0­\Óñ\é^¹\á˜|¿Í»øü‰=ù\ç³Ö¼·3\í8û\Ç8þŸÏŸjö\Í.%ƒÃ»süO^£üúfJ\\\Ö\Ò\Ö<öù™Žÿ\0\Äúcðÿ\0?•yŸˆ›lööÿ\0{\çšO¿“\ÆLþ>ü×¥^\ß\î«ÿ\0\'¯ô¯1ñY5…Eþ‡ÿ\0­\Óòüÿ\0\0\Õ_«¿\Ê\Ä\Ñ0>y0qE^¡\0\í\ÑQ\Ï\ä¾ÿ\0O/?Áö÷}\ãywP\Ì\ÌT¥\ä?¯§¹ö\ïŸ\ÃÑ¬dù™¿\ØÁúqþ}»Wšj\Û\'÷’o3ÿ\0¯\Ç\ëúWw¥Í¸·\Í÷\Ó\Ìÿ\09ÿ\0õt\Ç=:Vò]¹F?ûmþg9\Ôy›—·?\çZ’9¾fÿ\0\êG\á\Ûõ\Ï\çYÑ°]»›¾v{ÿ\0õºöúõ¥Ž}¥¿ÿ\0Wÿ\0_ ªB\âL^¸ÿ\0?OÃ®k\ÄM\æi3\"\ìù&†N}sþ{\Õ\ë‰·~#ÿ\0>Ÿ\Èzt¬]r\â\Þ:\à\\\\%¼nðÛ£\Íþ«Î¸\èÿ\0\È\çù\æšW\ì½}H\å÷£®©hý\Zü\î½-×¦eœ\Þ]\å‹wt\Ùúÿ\0žk¨ón\ß×Ÿ\\úZóµ\Õ,|\èD7^wÙžó$3\Åoø÷ûOü|ÿ\0¥z\Ñ\Û\Ùø¢o\ßj\Û\Ãlžl\Ú\ä0\Ïa\ÞEµÇ‘ökcö»›¡ö|Rô\Öûy÷\ï\ÝwÜ²kVÛ¹~ñOn¯ø\Z\Ë\×¼¨d_¸—6R\Çiÿ\0\Î?Mgt²£\Íù_ýŽ‡ÛŸó^*ž°\ËöVm\Ý|ž¿\çó\ÇJ„\íû™“´Z³nÏ®­\ß´]›V‘›NŒn\Îù¡\ãü3\Çù5Æ°VÛ¹¶\áñþ\Ï¦ºk\é3agþ\Û\çö\ïþ}«›ùK2²n\ë÷>¹ÿ\0\Ø4M\ÚÝ¯v»\Ú\ÚI‚I&\ä»[¿æ»¡\Ó.\ÕUþ¯=ô?Q]&Š\ßñ-…‰oýƒúqü½¹\Ù3µw\ç¾~™½q\ïÞ¶´vÅŠó\Öi³ôýlŠq—5ôµ«§=µµ½züû\ÉüKýñ\Óÿ\0­N¼\ÚÖ§\Óy÷\Ç\åü¿\n¯|û¿\×\éþ—µIvÛ UPû·ô\íþ9ú}*‰I½‘Fó\î¿\áòŸO§c\ïXjq»ýÿ\0×·ó®«ûR¾Z|¾¸3?”?\Ïs\Ü\ç×­\Ë?\ÜHw\\\Þmß’\Ïù\ÆG\éÚ¦Iµe\×\ÏmP\Ô$ú[\×úþ½N$¶\æûÿ\07\áùô\çðÿ\0\ZlŒª­¹¶ñÏ¨ÿ\0?\äW«C\àý\"Ý¿\Òi›—c\ë\Ûüô¯\'ñ\ç\Ä\ïøEf\Òô{=SZO\Ý\Ér–\Ð_\Ø\éstÿ\0ùyº\éŸÖ¹±˜\Ì6Œ«\âjÆ”É¿~rMZ\à½\é\É\íh§k«\îkKR´”)E\Îm«¤®¢žò›OH®®\Ì\ËÔµ+=.\Û\íWÒ¤1\Çû\Äÿ\0ž²ÿ\0Ë¿oó\íÏ‡ø£Æ³jS\Í\åü\Öÿ\0ò\Î“ÿ\0J1úu\éßŠ\àõ\ÍkPÖ®f¼º¼{\é\æý\ä\Ûÿ\0u\åO³†¥sÿ\0hVUo»\Û_O\çõ=8÷üû5\â\ãe\ì \åG¢qR‹•vœ5YGÝ”ZzA7mo\'s\è°y[ ”\çiTzó[H§d”]\ßv\Û\ë\Ódj\Ük2\ãj\îlüþžÿ\0_j¤\ÓyZLüÿ\0\ÇÓŸo¯\Ôþ•M¯—\î\î\Øþ_Ïƒ/ùÿ\0>æŸi™f2/—„ß\å÷\í\Ïù\Îk\ç\Þ2:{\×þ¢¿\áþlõ!…V\Õ8¶µI»«ò\ìúvÛ²ó5¡v*\ÒGû\ÅOÝ§¯^™\Ç\ãßš°³\î>_˜›?Õ§8ÿ\0õsþ5‹\r\Ôv±G\âÍ¿\î\'^žŸ\áU\Ú\ëÌ¸X\Ø\ígI¾tÿ\0ž#\ßþ^q\Ð\ãó\è*~¶¬Ö¶ó\ß\Ñ-:6Z\Ã&\Òi¿E¢ø}7\Û\ÐÚ’hw+4\Þ\\˜\â7ý\é\ë\ëþx\íNûtŠ#U_-¤þ7q_\çòö®}™¡\Ëú\éùö\çäš’K\Å\ÙÊ’o†<žlƒ\Óüý­\Å\Å\ÝJI5m—\ëªüºúð¶µ®\Óó³\Þ>]uù¿»[Ë¸’Eo:+ŸŸ%\'\ã¿ùÿ\0 ×’;‰—uy\äùò?Ù –)?N\Äæ²¼\é™Z?9\ímÿ\0\äû\\±\Ãþ?\çµ]òafXä¸º¸gþ›÷^\ß\èö\Ã=ÿ\0\ç´14\çk4´¾¯\Ë\ÓS\á\å\r\Ýýöß¯OÄ¯~×–i\Zý¢;„\Çßšõ}¿\å\Û½†:w®6úmBýå­œÉ³\äò&óy\ä{\n\ì5\r>\ÞG“u¿o\é¾\ãÍòºÿ\0\ëóœW©(³-öy_\Ë\ßò\'ö¯/=þŸ\äv®ƒ\í\Ùúú„zÄ›™U^5\Ù\Ê\Þþû\ßòþ½+¢\Ðþ$jš!_°\Þ\ÜÆ¯˜\Þ\Ù\ß\íV½?\å\â\Þ\äöúß¥y}\Õ\å\Ä0þûe\Â\ã÷3[­þ¾?û{‘š\æu’hü\ëVq<·w˜}ª>\×õüÿ\0Q\Ídñ5p\ÒS¥9\Âq\ÚP“ƒ_mÿ\0G±§°…Xò\ÔQQn\ÍMFI\Ú\Ý\×\åe®·V·\ÙZW\Ä\ë=YBj\Ð\Çk\';\îlŸÍµÿ\0®÷ÿ\0ò\íŒ\ãñ®²£›ËšH\ÜüŽû¹;\çù\×\Âú_ˆ$h¡òþ[¤O.dN7ýŸþ>\'·ëŽŸ\çŠé´Ÿ‰\ÒxFI&’i¤µ\Þ}›‰m$‡þ^\'¸ÿ\0Ÿn?\å\ï½}]\ÅN*+j”¿~’X_y8§\nu7VN*\Ö\Ý\\\á\Ä\äò¼½‚i«¥û²·.©tik\Ö÷\ßC\í›oøú—þ¸Cü…[‘¾nzôúž¿Ö¸_x‘¼Mf5f\Ónt¸\æ†&;Ÿù|‡³\ß[ÿ\0Ó¯\Ù3}\ï—\'õ\ãüöýk\íhV…zq­M·N¢Rƒq”[‹JÏ–IIm³HðgS“ƒKš-©%(\É\'§Ú‹”^\ïf\ío4G§¶5(}®aŒg\ÓðÇ§ù\é]õ\Ómi™—¹ÿ\0#\ëú~u\çz|‡\íö\ì>Qö˜}þ‡§^:\ïõ&_2O›=GN¾ÿ\0\ç?Ÿ]Vòõý-¥»·õÿ\0\à5\é‘T±oŸž\áù÷\ëXö\í\Ê\î\ç\×\Ó\×\Û\Ó5©­2\ì\ßy\ß\äCþ#ŸÇ§ó¬ÿ\0“)\Z·(½ÿ\0~Jc.BW\í\ëü\"hs\ï™\Ï\×üž}jo¿$·d?\'\Ó\è?ó\ÅAf»¯-Aÿ\0Ÿ˜±ú‰¨üe&\ÕU\ïù1\Óü(œ\Ó÷aTóýÝ³ü\ê\íÿ\0ú§úŸ\æ*…Ž\æ\ÜŸ_\Çúþ•j\éÏ‘6;þÿ\0©+\â}\ÒI¾÷·\å`*\è¿.¡¹O	gyÿ\0¢=ÿ\0\Ï5bee\\\ã\æ\Ïùþ_§Z¯¢¶Û‹†\Ü\ê\ßc›\Óþ^>€õö\ã§5¡\"þñw.\å…<\Ç½{ÿ\0^ÿ\0…;û\Öþ\ë{_\äŸøšfQ\r©û\ß\ë¿_\Ðÿ\0>•\Ë\Êv\Å\Z¶>wòÿ\0\Ï\á\×\éùmk\Ò,šƒ7\ìvü½ý?OZÅ›\æ{u\\ü™“ ÿ\0N¿ž(m%w¢@:l*ª\Ëÿ\0\×Q\Ûü½þ_§¯L\çß¥\íf\r»jÿ\0|\ë\éß·OlW}áŸ‡~&ñ,\Ð\Ùý†\Åÿ\0\Õ\Þj_ºóñ\ïoÿ\0w?þ¬\Ó·¤º·_\ây¢Ù³ðÿ\0\ë^µ\í’:Ã£H›¿\åŒ1\ìÿ\0¯oþ·^€\×g\áß\ÚMœ\Ð\Ýk×š„\Ð\æO&ô[X\æü_\ê+\Úôÿ\0\è¶1‡N¶·?\ÓÍ›\Ûþ>~Ÿ§\áNÞŸÕ¿\Ï\ïLz-\ÚK¾ö\Û}»ý\éŸÃ¤jº”o§\é:•\äÿ\0\å\Ú\Îy}?.{\ç>ôÙ¾\nø\Î\êùu-jm\ÂöoŸÚ·¿j¾“ž?\â_¦~Ê¾¼ñ‹­ôxš\Þ\×d pv~?þ¯­x~¡\â+­JY$…¶\ïû÷“6^Ÿ\ê-ñÿ\0\Ùÿ\0õ\æ¢RŒU\ÝþJýWù›F\îÖŠWþ—Oø\Ö\ç)\Â\ËŠ5ÿ\0„“Qm±¢\äxwƒµ@\Èÿ\0H\èqš+]]ö¯\ï ÿ\0—©½>´V>\Ú\Éù\ì\çü\Ñû¿¯\é¿+z\Õ\æ[\íC\î‡ÿ\0?žZ\è´[­\Ëoý\ç¶\êpk¸¼…n\æµÝ‹†y¼¸QÏ›$?ô\ïn?\Ò\î}«\Äþ$~\Ò\ßþé¶º—‹¡×¯-`ñ&…¡\ê¿\Øöj—C³ñ÷\Ùÿ\0\á#\Ô?\ê£\çý?ùWF#C	\â1aJ…(9U«6¹)\Æ>ô\å6›´c¶\ßUc\nt\êV©\ZT¢\çRmFŠ¼¥\'¤c\ÖR“I-/vï¥Ÿ\Ø&\ã\Ï?ò\ÔtúžEM.\ì|û¹\ïþ~˜úWš¯Ä¯´K2ø‚\Ï\ìóCöÄ¹\Çú,¶gûGŸö\Ò\×ì¹»û_\èzÖµŸŽ¼!s7ø‹M’\ÓÌ…\Ò\ç1I?¿ý:ðk Ÿ¿\îôÿ\0?Ë¹\Û\È\Ê\Î\ÌÍ»gú”\ë\ïþy\íÞ°5«Yu-R³Y<¹ž\ÛÌ¶™É–;\Ëô‹yý\å\ßO­g\Ç\â\Ï\r\È\Òy:\æ+oÿ\0Ÿ\È©\ãÿ\0¬­M¹¤É³\Ë\Ô,$W??úd\çò_q«¦»«9;§¯]\Z·®½{ùn„f¸\Ì\Ó<\Ñ\ÞiŸkÙ¾	cŒÓ½\Çý}\Ë\ßcß¥t\Zl\×Ê¿l¾’\æ\ê\â\å!ÎšaŸ:\Üf\ßõ\ç\×üóÁøú—\Æ~e¹‘¼<÷‘\ÛM7‘ÖŸgqsq§ýž\ßþbv·¿h\çþ\Ýjô‹FŽ_2\Í4\Öñ\Ü\é¿\Ú\Û<ˆ¢¸ûD¸ƒ¯ü}ÿ\0\Ó\ßo©¬¤¹bõ\ÖÍ­yu¼uÙ­?SCkO\ÄvÐª¶\í\Ãô=ÿ\0\çÏµ6û÷–—q¿rqù÷ÿ\0>¤sF•gp°Ekkgs$v°\Ã\Z\'“>?\Ô‡\áúg ·ð¾­qÄ‘¥¬n˜gý\ï_ÿ\0_¯N<\Í5\Ï\ïm\ïöSò\îD“n-+\Ù\ßò(³yšNŸ7÷\Ò?(:ûÿ\0>+—,\ßÂ›ÿ\0/Æ½*\ÇÁ~]Œ6w—O2\Â\å\îOù\ï\é\Ín\Ùx_Iµ;–\Í$nù¿{/¿_óš\ÖQrµ­¥÷ù)Ù¶­v\ß\äy\"\Ù\Ý]/ú=´\Ó7û	ž™\çüý+¦\ÑôJ;eŽh\Òžio\Ç\äGôô\ë\Ï>¡“þ®4Ž?\î{öŸ\Ô{\Õvb\ÅV6E\ã\é,¿\ç\Û=iF..\ê_‡ü(%¾¿‡\ê`\Ûøió$m\Í\Ó.\ç¯ù\äVÕ¼0\Â?%/ý\Ï7Ÿ\Çü“\È÷Ð„o—t\Íþ\çÿ\0[\Øs\ÐqXºïˆ´6]WV\Ól\Ûþx¼\Þm×¹û=¸û_ù÷¥6¢\ï)$¾\Íô³VÕ½o¿oó*\Él’:Hdk.\Õcþ\Âù\ï\éŸJË¼¸…eÜ²\ÙûË\ïû«úoŸ×¯Q\ï^c¨|\\ðþ›o4–¶º•ôhŸñùym>—¥\ÇÓ­\Å\Èÿ\0I\çþ|ñÚ¾sø•ñGV×¤š\Î\Æ\â\Óø/\ì\ì±^C\×È·¸ÿ\0¿²Ÿú|¯2\Ï0\Ùm7)O\ÛVµ\éÐ†®N\Ê\Üòk–z\'&û\Ù=N\Ü.¾*|±‹„÷ªI{©-\Ú\×^[ë·©\é\ß>1[Í¥\Í\á\ß\ß;]»ýŸR\ÕaýÕ¯’?\å\Þ\Þ\ãþ>ÿ\0ðñ<\Zù\æFtó\å2—§?\ëfÿ\0§ò?•r¿\ÛM¨üJð\ï„\Úo&\Öm\"`¨2óþ>.?\í\ë\ì¶ü÷ö\Ça¯¦¸\Ó?´¡Y¦·žð\éúT;\ÏúE\å\Æ~\Ñöùöû­½\Å\Ýý\ß^¼Wå¹–o[1¯:\Õ\ä\ïyB‹nœ#Âœ[|ª<\ËfÓº\Ò\é_\ì0y|0\Ô\ã]¦£\'&½\é)^Í»öôk_6h†Y7GóH\ïÀO~?Ï¯\ëYð\ÝGw-ó\"mkÏ±ÌŸò\ÊI¼‹[À¤cð\ïYz–¡%Ç†aº\Ò\Õ\Ö\â\ì\è\é•,—¦{›‹\Î×±ö\ç½j\Þ\Ó\äñ2Ú®\å¿ñ\'€õK=‰Ì–~ ð©<÷ÿ\0–y2­\'$¯®\ï\Ó\Ý\æß¿»\Õvgr¡\r=\ÞV\íø¸-U—ó~eMBñ­m\×\Ém\Ò_\ÜÃ§\Âý\0›Q¸ÿ\0Hœ\àgý\Ó\í­¡\é¶\×#–\×\í‘\ß\Ù\Þ^yŽŸñ\ïg£\éW7?ûo\Ðÿ\0\Ë\Ís÷˜Žm	#vº¼›R’\Ùö~\î;\Ëx?\×ýŸþ^n‰ûG~õ½¬y\Ö	.­kÖ¼ø{¯ltÿ\0—yµ.tûž¿õ\ïþx¬¹\í\')]¨ò\Þ\Û\é×µ\í\×úz:vIj¥\'dÿ\0¼\ím<¼\ßWª+\íUŠI>M³C4‰²Lõÿ\0|Ÿð§5»­Õ‹ukŸ\r\è7ýo\Û5´\Üy½~\Ï\Øþ5i£iWG\Ó\ã‰‹\à¯\n\ÜÍ³Ÿ\ß\\hV\×J±¥\Þ}‹Y\Òo¤d¼\ÞOÙÿ\0uö\Èm\ì.tý?\ìÿ\0÷ªæµ“v»^÷ò\Û\ËwUk+\Ü9uVZY\éü\ÏD“}:»´õ1o¡’©.$\Ù)7œÿ\0ò\Ôýž_\Ó5N?.k­6xö\Â\çí—ˆœŸôx-®-\ìð*\â¦ñC\Íÿ\0~¥\"²5\Â_\ë\Z[\Çÿ\0=?³ÿ\0³m\çŸ\'\Ó\í\àqZ’Xy7\×\ÙÅ»|\ß>\É?\ç\Þ\Æ\Ôùuû\ÙñÒ§™¹4÷²•û§³\Õzú\rA;_[·K[M¶¿[2¬–\í/\Ù\î|Í«3\Í\'\Éþ«Î·\éhÿ\0¯/o\ëM†2\Ï3[Ì%³ù{\ßýV|õüvÇ®?•6—\á/´}£\í\rcy£\é\è\äù¾gö\Åõ\Í\Å\Äþÿ\0ñ\ï\ÎzŽ=j¾¹¨Gguc¤\éöñ\Æ\Þ-ñnÍŸò\çm}öC?õùiþ‰\Çz~\Õ\Â.n\\º)\'dý\ç(\Æ7\ÛyI-;ùY¥J3i(©;\Û[ik6ýyS“ÿ\0¼\ÓY­VHþ\Õ\Þ\\<ÿ\0~góDŸ\éò\ïoÿ\0Ÿ^••«C§\ÞG%\Ò\ÚA$n\ÞXO\'\Êó\å\ßÏ·ý+¥ñŸbK«u™­\á\Ö>Æ\ny²É¦\Û\ß\\þ\ãþ\ß>\Ímhq\ï\Ó_C\Ð\æÖµ=/GšGûw‰,üI®[Müz\Ù\Ùx~Ÿ~¿jÿ\0Dþ•\ÙKV2P\\µ\"Ú+Vm\émn\ï}zm\ê\Ñ\ÇW	NQrjQ’iû²Vv\éki\ë~§ˆ\ëv+f\Í\"ÿ\0©ÿ\0–.û™\Ç‡Aù\×\'#2«n›nÿ\0\ÝÍ½Ï•\çú½¹þ^¥®xa®\"[B‹nòy’\\\Ìóù¶ÿ\0ó\ïö{{oúzÿ\0û¿_Æ¼›V†k5‘g\Ù\"§ú<\ßôÓ‘\ëýø§W\Ú\'>TšI]j¥¶\Ûm§M‡*¦\éµ\'/ñ+J/K§«¾úZ\ÝNcRñü#z„7‹­«\ÛMqö\ÄO6+{\ËsösþŽ?\ã\ê\êðÿ\0ËŸ\á\ëŸpø5\á5Hdñ—‹´_.=WÉ“\Ã\Úªžl¿c·Ÿ\í\\\Ö-ÿ\0\ã\Ó\íW˜ÿ\0@\Ò\ã\Â\Â\ËÖ¾)ñ·‹uo-ü? Ù½ö©mªÿ\0¦i¯Ú¢¼\Ö?\çûP·\ãþ%vñ\éöAžõö7€|#\â}[\Ã\ß\Û_<A­\ê—O˜öw7“\Ú\Ú\Å	\ïökc\íÿ\0•\ép\í(\Ô\ÆÊ¼ð\Õ1~\Ê2(7\nxhUvN­iTNS\å…\Õ5\nn\Ó|ò’åŠž9¬ý–\ÕJtKFR÷¥^pVp„9i\Í$¹\ä\Û÷‚‹\ç¼~¸³Õ¬R\æE’ö\ÌM²“\í0þ¿N¿\Ë¼·K o.T“`þóºô\ã½ÿ\0W\Ë>Ñ­V\æ\â\ßK±Ü³~\ëüzñ\íþq^½ ø7T³sqqx,7ýÔ‡÷²\È1þ>†¿F\Ãb\êM\':Q³n\ê3m/…\èùô~Vóº>N­8\ÂN1“{Z\ê\Íßº»å·›w¿CÐ¬f\Ù{ü¾C\éŸõÿ\0\ç\ëŽ\Ý+\Ñu)¿{q·ûüÿ\0N\ß\áùuó/\ÂÚ–§oc¦\Ü>­t“}¢i¡µ¸Š8\á·ÿ\0Ÿ‹øôûV?§Z÷)<3\çX\ßMyýªºžÿ\0ô;;µZÉùoqpOú7ò\ï\ï]±¨¬Ýž®öZ½~\í¿]ŒOÔ¿xð¯÷$õú}{þ¸¬…“s37—þú\ÞþŸZô\rZó\Ã6ð¦xWXK„O-\æ°\Ôÿ\0\Ñ|\î¿\éò\éŽk‘¸K\Òu+}FVh\ï,\á»{k€\Ëo\çÿ\0Ç¿úE\Ïú%\Ï\çþ5[¢\ÛI\Í\Ê*\î1§6\Ò\ï¤u+’VN\Ú=µ\Þ\Öÿ\00\Óqý¥g»þ{~¿‡Ò±|e.\ë»XWŸùi\ï\Çù\í\é]õŽ“o3$Öº‹|”sþ“\éQJ?ð+\é\Ïò\ë\\‹­\áT³UŽ\æ\Îh\ç}WRÒ¥qþ£ý==¨†&3šŠ„\Òn\ÜÒŒ ºky%¾K¦®ú-Zöô¼[{l¢\Ý÷\ê\×Ko¦\r›6ƒü\ÎyÖ¤¼fX$\ÛþqŸ_óùU[y–6\Ü²ÆŸ}ybô\é\é\Çõ\ÇJmÄ‘\Éyr#®Î›ú’zÖ—¼¶\ÞQv‚i­\Ó^¤ú)\Ûý¡\'\ÏòCO\ßÿ\0õ»q\ìr*y&\Ì3o\Ü\éÓ¯ON\ç¥&g}qax\Övw7>m\Ì6û\áO\Ý}~\ÑÏ·¯¥uöŸüEup–º”?\Øp¼0I¾ý·Ruÿ\0}>\×\×ô\ÅRø\äô\Ù/¾\ß×­„x°Ûµ›¾}Æ˜\Ç\ï>¿Oz\í¼7ð¿\Äþ\"¹¤¶}\'M\Ù\æ=\åúyRÛ¾Ÿý/9\ÆM}9á¿†:‚|\ÍBhFµ\âK÷Å½\åü0y¶ý?q§\Ût¶\íþ—Ò»\å\Ó\Þ8¾\Ç|ó?™y7^\Ý\Ï\\tÿ\0\ëU^\í­,­{\ë{\ëò·\Ìi_å¿§Wò\í\Ôòü-ð\î—*\Éö„Ð¸ÿ\0L¿ÿ\0J–Yºÿ\0Ç¿üz[~?ýzõ›[\Î?\àû\ï\åý}ú÷úsŸ]¥·Ž8\Ö\ÞÚ½]\Óýl?óJÒ³µU^¿7^§~‡¿ùõµü\ÛyJv¾‹W}4\íþExl\Õ~fò\Ö4A÷ÿ\0¯oó×¥p¾/ñDzlrF»7\"aö?\å×“\ä}«¤ñVµ“e\"«\'³œc÷A\éø\nùgX\Ô.µ\Ë\É70ò÷ùŽ\ï_ÿ\0^?–:\Ú\Ú]½‚+™\ßkrþð\Æn¡}y®\\\Ë#¼’\ß??—ùÿ\0õ\Ö~¡3iö\Ìñ\Âå¿6qÛ¸ÿ\0\'\éV®5.\Ç1µ\Ò+\'t\ç\Ó\×ü;W®x²\ÆM\Övku}x\éû”…;þ½;wü:r:œÍ®d¯×®¶·ô\ïstš;OF´¶þW¾ÿ\0\"Uñ%öÑ˜\ã\Îpz\ãžôUû_„š”ö¶\Ó\Ýx—N†\êkxe¹‡Î¸ý\ÔòF¯4}?‚B\ËøQZ}_þž\Ôû\Éö±\ì¿ðO?7÷yžñ3áŸ…þ%\Ú6Ÿ¯Gyg¨i—3^x{\Äú%\äú_ˆü/©g?n\Ñõo±]ÿ\0\×ýŸüx\ßú\×\æ7\í\âxÂ¾>ø[ñb\Ö\Ã\â~9\Ðlü/\àÿ\0½\Ïü#š§\Û5\rsLÿ\0„~ûPû5§\Øõ¯øš[[\Ú}’ó\ì7\Ö\×?ñ1\Ô/´\ïô\êýx¼‘Vò\ës!w¯ú\Î?\ÈÁÇ¾kòóöóºñ\'€_MñÖ­c\â­s\áþ›5¶šš$úfñ:\ß\í6þ\×<=qö_µ\é¿bºþÏ»ñm§\Ûo¬u\ëŸùÿ\0h\×\Äø…†xlŸ™\ài\âaˆ•añ\Ë\ì\Ý^\n¥*”,}*²I\Ú-P\Ãc—\ï°\ÕjR§*”ð³¨\áô\\)Yb3L6_‰t\'E\Ôö˜_n\æªPÄ«4ðui¯mh©N¶N4±V—¶’NWÀ¾/ðÿ\0\Åo†~ý–n¦×¦øÁ¥üQ‡áŸŒ&¶¶ó|ÿ\0\nO\Ãú^¥¬x£UþØ¶ÿ\0KÔµ\í\"\Ö\Þ\ß\Ã\ÖŸ\è=4Cý?\í¸¯\Ñ\ë\èv°¥¬P\Ø\Û[\Ãggl~\ê\Þ\Î\Þ¼ÿ\0õ\çjzþngÿ\0ø\í¯¾\røƒ\Ãÿ\0’o‰_\Z\î~x~\Ûþ\Ëø/\ít?ÿ\0nkzŒ\'\Ö5Ÿ±}§S\Ö?´4û»ý&\Î\ÈX\ØxV\Ûþ&:…ö£þƒcýb/\Ãøü;\ã\rcC\Ö.¯<U£\èšnƒö}KO¿Ò¢º\Õ/\rˆþÑŸY·ÿ\0—oô«µóÿ\0?^½pðÿ\04«˜\áq•ñÞ¶\"Œ°y|±•?w	C\r†Tã…¥Fj©MV\ÄÖª©\Ë\ÛO\Z¦§(r(\ï\Æ\åø¬=\Zœ(\Õú\Î%Q¥û\Æ\êU­T¯Rq\çæŒ£\ÉN’rvE=.þs‡öWN±[Â’H\ï\æl†\Þôöÿ\0>½k¦\Òÿ\0gko#[\éÿ\0\Ùöó\'ú\ëûÏ²ûùÿ\0g¶ÿ\0Kõö\ë\ÜW\ÐW^>øS\á{y¾\Ù•¦µ’y—\"ò\çIóm\á·\ç7\éYÿ\0=k\×>$hz¦‰}\'ƒdÒ¬\ï>V\ÏUón¬ÿ\0\ç\Þþ\Þ\ßN\Ç>µú¯NN6¨¥5\ïrF¤\Ýh\ï-ÿ\0=ä•¹ù]¬õ¶­º\é\ÕyÛ™\Ñü|#\ãR\ßRû3^<6~ûM·\Ú<\ÝCþ%V\×n\ëþ“ö?lô®›P±’-\ÇJX\Þ\æD°û=²l‚Y\Ñþ¿ó\çjGAŸ§Z>![\ê\Þ-\Ðd·¸…o¯ôýò\Úþ\ç\Èý\Ü\ßa¶þ\Ð?öùkö_øùüM[K\Íkþ±©[B‰yg±oxSý.[;;}W\ì÷\Û\Ü\Ë\Ïoÿ\0W5MüQ“\Õ6ôWvVi[¯›_Šô‡†¯\"¼ð\îƒu7ú<“iV~r9ò¥Žoø÷ÿ\0Hü¾•´Ì²Ü«·û|ò?\ÏÒ¼[Ãº‡¯´[xt=/A[[/:\ÙüC­\ß\Ï\å\\M´yú}·ú_ú\Ú?.sÞ–oø“Tu\Å/7ü\Úo…tß²\Úú\Ç\Ç>\Þÿ\0¦wU/nXM\ÝokE=.œ¾k[k\ØX›Z\Óôð\ß\Ú:……Š§ü´¹¼‚/^GùÁ?Z\åo~(x^\Ú\ßL¸¿ñ\ßüù\è–\ÝyžŸ\é\çù\Ö~“ð\ÇÀ°\Ê\ÒM¢\Ü\ê\Òùy\×//®¥§§Ó­wVz~›¡\Ä\Öú6™gc¿Ü†+¯\à—l\Ò~\Ù\Ýû]\í\ÏÊ´o¬[\Ùõùv.x\ï\\}º?ƒ\á\Ñmÿ\0Žó\Ä÷žT¸\ëÿ\0 ûo\ÇüñNŸEø3¼ñf“¥³\'\Éý ù¾Ÿòñrk\Ò#ûEÂ«4½þøÿ\0<a\íõ©¿³\ä:M¹Áß~ß~=Ó-¹§RO\Ê\\‘\Ò\ßf	_\æÝºn\îwgà¤º‰“\\ñ‡Šµ)ý|6×°hÖ²Û½·ú_\ãŠ\Ú\Ñü%\á}v“O\Ð\ì\Únd{\Ë\ßøš_ñùx¹\ëþzqŽ©¬\ím\Ç\Í\'\Í\ß{‰{þ}\ê6’\Û#ls2õØŸº\Ï\×ðÿ\0<œO-5.e\ßwv\Ö\Ý[w\Ú\Ý6w½ÀùŸ\ã\×\Âÿ\0‰^4„j^¾þÛŽ\Ùü\Ø|+ywo¥\Ågûù‡ýª\×\ì—?öùöÖ¾\×,þ&x}n¡\Õ4;P³O-\ì5„û/Ÿü¼}ž\ã\ì¿dºÿ\0§¡5û8nø!Uþÿ\0oóþ{\×5¬h¶*‚M?P³³¼\ÓùŽo´C×˜?\ë\Þ\ç\×ÿ\0­_+šð®0«SK_\r‰©vù§\í(JwI77Z\êJ\Ô\æ\â¬ÚŒog\í`sš\ØHÂœ©R«NZ<•\Ò\Êð·=­ñIJog)tü<¼\ÓüEý¦º\çö•·Ú´\ß&ò\Úþ\Ù\'Š\ê;\Î?qo›_µý«ý#\ìžÿ\0¥Cj¾\"þ\ÏXÿ\0´?³\á¶ÿ\0mžû\ée\íññö´\Ý£¢ô\ë\Ç9\Í~”x\ãöPµÔšú\ã\Â7\Ð\ÙÉ³Ì¶\Óo\ßÊŠI¿\é\Þã­·\×ð\Å|\ãO\ë\Õo4ÿ\0iw:n­yg\r½´7/P\Þ}Ÿý#Ï·¸ÿ\0KŸø÷\ïšü\Û2\Éqùl\ß\Öi\ÍSøaˆ¦\Ü\èM¹YK\Ú%\î[–ö­\Zr÷­Ë£>\Ã™\áñ‘±\å\æJ.Tý\ØÕŠIJÜœ\ÜÒµÚ¼SóKKøÝ¼š×“i«C7?¼†¶œ\Ë\ÇOùzÿ\0Ÿ_\ç\Åo[\Ûø¯\í\íÎµap\Åì£¶±_EÆŸ\Ù\í\ç¸û6©ÿ\0¶v·\Ç=?\Z‘¬ãµ¶\Óa“ž“M\ÛüØ¼Œóþ~™ª7Z”vf\å­Y\áŠö\çû=$úwû5\Æ0_Ê¼Wh«¹Jú]s=4]\Ûü7¹\ê©)4£\ËK\ÚQ\ê¹lôomo\Ý\ëÔ±n¾$ò-umJÉž\Ú\æò\ÏMj\Ã,s¤\Û\ÜOµÇ¯úE\Ç^=\èkx\í\î?²–h-¯,ü‹KUò¼›˜1qüzñkþ‘q\ßùð\Û\íb\Ä6p¶\ë{dûB¶\Ì\æûu\ÍÇ©9ü\êhõ¥¾\Ô-^6\Ú\ÓC\åÉ“ÿ\0-­\ç\Ï=‡\ã\×\'\ëStšŠœ“V®­+\Ê\nÿ\0+\Ý[¾ýšZ©r¦¬\Ý\Üu‹Š\æZ\Þý\Ò[\Ã7\Äû¦’\â\ÆO	,·‰¦\éc}\ç‰<¯\'O²ÿ\0‰}‰ôû­¿\çø\Õx\î¾%Z\Ãý§»\ÂWQ\è\ï¦\ïH¯õÈ¾\ÇŸýŸaÿ\06·¿ý~=ëª³\Õ<”‚9‘\"†\Ú\ä\É	LþòóOŸý#¯?ñ\ëqøýj\âýmµKk‹±\ëv\Ðùsÿ\0\Ë(ÿ\0±õ_´¤~=ó\ëßš®Töœù’ßš\Öj\Övk\Öþ¤&’MÒƒ½´Q»jËš\ËO³/•º\Ü\ãn®¾#Mr]\é~¼±ß©lò|I<QIy«Ÿ´\ÜOökþ_³þ¿\è\Õr{\âœr4ž{öl¹xu\èI±?\Ù\í\ï®..®¬óÿ\0ÿ\0`5©u\æ!o\ß\ì\é©yv\ÖÎžPòDhóûŸùx¸ÿ\0\"¤\ÕüU\ÓB¶ª“Fúglÿ\0ò\Óû>o´~8·Ÿ•K|¶r­$Ÿ/.·nö\Ùuµ•\ì\ßN\áñr¯e	+´Öª\Í(\Ý]I^\é­m¢\Õu2l|M­ZÁ©irxNþ\ÚMa\á¼I8$Š;\Í<ýŸÏ·û5\Õ\í§ú\éþ\ßd­O\í©%\×t}b\ëF¼†MJþ\ËÒ‘\áž_³\Þ\\\\}ž\ãU¸¶û/úUÕŸþ—zÕ‡\Ô-\äÑ¬ôù!š\Âÿ\0R\Ö,\îfÿ\0–šf¡µ\Ïü|qÿ\0/6ÿ\0d\éŽÕ±¥kI\ç\êö‰–Ký\ZòK7G\Ä6z–£öo´×¶?\Ò8\Æ1søPù›Qö$Ô”\ÎÜ­+]_—ñ¿MÁ¨E9*Vj\êVœ½ô\í®¼\Ön\Î\Émß¶“|@\Ò\ä†\ÇO²\Òo\Ö\Îi¯>õWw—g··þÐ¸û/úO\Û3¨{¤\ÚfÖ¶ƒ¨xb\ÏX›[mb>?\r\Þx~\Â\Úi †\ëK³\Ô/®n5ôµ}“\í\\}“ÿ\0úW\'x³/\Ã\ÝYt\Öxõ-Äžñ°3y²ýOž\ãO¹‚\ßþ~\Õö{¿þ·k\Å^*\Ò#µñg‡n4m7T\Ó|C¤ÿ\0nY¤\ÞG•g>±¥[\\\\\à\Õ\Å\Ïú\'ý;VŠ¬\ã/zQ\Ò©\à\Òrq“\åMsm(J<\Î\Ý\Ò\èe\ìa+r\ÆJó”°mZT—;SK\âŒ\ã++jÚ¾\Ì5½{ˆmf¶Ž\Ö\Ú/\í·I?\ÙdŸ\Èÿ\0Q§ÿ\0\Ï\Ïý}ÿ\0Çy?\Ä\r\Â\Ú]\æ­\r\Â.\È~\Óm¾¢òm¾\Ì.½Àÿ\0—¯²ô´õ\àg¿]\à};ÇŸtø_X\×.,\Ò{mWGò%Ñ­\á·\Ï\î5b\Û\ìVzm\×ý=\ÞÜŸO­´Ø·Rñ¾Ÿqñ3\ÅI¢\Ém7\ÛLðzAªjŸõ\Â\ãXÔ­~\Émÿ\0_vv7õ\í\å\Ó2W\Â\à\êT£$”«\Õ~\ÃNNQWU%%ò\Þ\î4ù\ç\'kEuó3	\àðzV\Ä\Â5bÔ£J¼¯;rýˆ¾etÓ¼ýœ#\ÖZ\Øü\ÅðG…ô\É\âOkW\×\Úæ·¯^j“_¼?\êá¿Ÿ\í:}µ¸\íö_³ô\Ï\à+\í/ø\â\Ä\r>\Ùt?\ëúm\Ìp\ín\Ûû\ZÀC\Û\ìöú—Ø®\îOøt\Å}÷\à€Ÿ~¤7\Ú„ô¨o“\ïø“Ä“oxŽI†~u\rlÿ\0£Û•¥nø\Ó\Ç\Ö>Ñ®õHü™¡¶O\ß\ß\Þ\\Á­¼9ÿ\0ôœ}§\éøW\ë\\¾–Ô*T\è\Ãß;B\r\Æ.ugR¤\Üo)ZRmE®ö²o\á+×ž*´¥ûÊ“©%\ÉÏ¼Vœ´\á;Ekm^ý›ü\'û2·‡`7^&ñ²X\Äÿ\0¼š\ÛA°‚[¯ü\\ÿ\0Ç·ý¹\Ù\Û9®¢\ÏKð\'ƒõxõ-K¿Õƒ¤\Ú|\Þ!\Ö/\'\Õ.¥\Ón ÿ\0‰Œö÷?b´¶ûoý9\ÙqcÞ®YüBñWŠ¢X\ì,\ï!·¼‡Ì‡\ÄZ=´e’Ÿññ©¢qköŽ£¯\â+SPð¾ƒ¨XEq«kÌ½Á>\Å\ÛÏ¸û/ú]\Éõ\ï\é[\ÅÓ(¼$S“U-4¤¬\ã9\Þñ{¦•üŒeÌª¹)h¥¬\Ó\ìý/tõ\ë\Ô\å\Û\Ä\ZÍµ\ÝÅ‡€týO\Ãþ¹ý\ä3jPÀb¼Ÿþ ú?\Ù\á ¿ô÷þƒcYòxoÄš£\Úÿ\0kx‚\ÚMI\Þoõ>›n.?\å‡Ù­¿\ã\Ûÿ\0O~zWa$ú›§M“5åœŽ˜˜C`~ß¨M\Óý#X¹º½»ü@\âZ\ÜyŸjº\ÓnmXs‰\æ‚Yd›õõ«…\É(Ô¯^r»–•8k\Ê\ÚQ¦\ãeüªR•¯¦\í\Ígx\Æ)Y/…7¦·\æiû\Ï\í;ke}µÏ¾øw¨Y\ÙG%×ˆ\'š=Ÿ:M(ñ\Óý\Ë\È?^•…c\à\Û}Bá¤‡Wšy#òw\Íý›¿gû1ÿ\0Ÿ‹žm¿\é_D\Þhÿ\0\Úÿ\0hÕ·\ÇcdK4ÿ\0Y\'ù¿†s^j×©j1\éz=ªZ\é\èþ_§˜:ô\ãüþ5\Ñ\Z£f£ªVN\ï\Ë][\ì&\Û\Ý\ß\å\Ñ.‘]º\ßó¿¯hz^“§µÖ¡¬x“X¶O¿l—ÿ\0eµúÿ\0£b/jðy5m6òý \Òô\Í7C³\ã}Ï“öýRN?\ç\ãRûo\áø8\ÏÑŸ\Z¤Cð¬6j\Ï$\× \Ç/—û¯\Ð\×\ÅrP\Ê\Í\åùœr:u\ëô\çÒœ½Ö¹tv\ßW×µüŠ‚N÷]¿SÕ®5Oé±«^Ms¨OýÇš{¯ü\í\í]\Ä:?‡ô\Ý:\Ã\Ä,\Ð\ÒÕ¯\Ó\í~ðd/ZÎ±ü°ŸX\Ïüƒt¿\Ä_W3ð\Ï\Ã:fi}\ã¯Y¥Ýž	ŸM\Ó&Où\njS\Ïö}>ÿ\0è·—^\ßò\ïUg“X×µo\Ä^#¼{{tòµoaO:k´s§\èz=¿8ºÿ\0—Kùð±ÿ\0‰…s\ÊZ½nü‘zY_^e­Û²¶«®¥»¶Ò½£»OK¾š\'{|†\ê\ÚÇŠ<]«\Æð\Çm\Z\èóCq…„0Xxs\Ãðÿ\0Ë¿\Ú>\Ò>\Ékÿ\0o‡\í\ÜW\ÖZ-Ÿö½Í¯ˆ/\Ú\âg†„û2¢\É7‘ÿ\0.ý\Ñlÿ\0¯\Ô\×\Ë>\Ò\Û\ÆW³C}ÿ\0ŸøZ	µJ\Î\Îo\Ý\Çü»Aöù‰k\Ú\Å\×k¼ýq_Vhú²\ê~Ñ¦\ÓlSO“R†k=6\Ù8Š\ÏM·ýÇž?\í\×õ«£\ï\')Fü­¸¶ôn6wŠ²´]Õ\Ýû+jI8r\Å.Yj›\ëir\î\ï®\Úl—ŸI5-R\â\ê?š;oô{g<úxŸúþkq¬\Ö—ÿ\0\×\×ÿ\0\Ô1Wllã³a\î¢aß¿\á‘\ë“ùýi—_1X×·\ßú\ã·ù‡Z\é[]\êÞ¿zZÁ2I·dg\ÛÇ¸†uùsò?—<t\Ï\ãV/&Oµ’i®\Äÿ\0>Ÿ—\ã\Å]†Ž?0Ÿ\àéŽOùÒ¼\Ç\Ç\Zò,2Gn\Ùû´\ã¿ùþ}¹¡»&û£\ïZûYþ_\æyWŒu‰µ©!Ž_\ãgO§¨?_jó½Z\â=&\ÂO-q&\Îqÿ\0\ê\Èÿ\0ù­\æó\Ú\å›j\çÌ‘\ß\êýG=k\Äü]\â)\Z\îeŸÉ…þN¢.ŸLt®:µš³[\ÙE|I´µ­s¢	;\Ý/W²õ}?\Ê\ç%y}yªjKl‹4òuuý\ÔpøøŸŸùu³üyü«»±ðÖ‹¡¯Š.-]_Rÿ\0U²\'úQ†ß‹}V\ãþ}­o?\Ò>ÁŸð¬\Ï\nx^ûTž\ãT¸X\Ö4K8\ïJ\'\î­á¸¸ûG“ÿ\0_W–¿ò\éÞ¾½\Ó|:¾*k\\\È\Ñ\ÚÂ\ï}Ÿò\Çþ=¼\é\é\Ó\éZa\éFæ—½>gvõihô}.\ï}\ïe~©\åR£r²•\Ò\Ó\Ýn\ÖÓ«]ü¿3\ä¥Ö¯ö®m®ó´g÷3u\Ç4W\Öoñ›ötÒ´ËŸø6;5š\Âxÿ\0¶-$ò\æ³&\ÞTó>\Éó\íx\Ùwÿ\03ÞŠ¿i†ÿ\0 Œ7þ\Óòþÿ\0Ÿ\á\æ‡\Ë_þ«ÿ\0\àš\Þ_ô\ë\×ð\ï§\Ó~ðŽs#\Ú\é\Ö\ÒÍ¿þ>oÚ¥ÿ\0\ëgùq×¯\ä¿ü\Û\á<eð\ËNñÏ†u{KðÎ•s\á¿ø—U\ÐuVOø@\â¸\Õn>Ï®Â¿\ÇöO‰?\á$\Õ.4ý\'þ?°\ëž±\'ûGO¾Ó¿Ó¬@¼YûExODþ\ÐmI\Ö<Höù“=µ´ñyŸò\ï\ä[\Û\Û¥\Ü\Ý\Þ]¢XYÿ\0\ÌBû\ìš}|ñ«Æ¿¼söxŽ\èi¾ð\í‡ü,xA\×?±¼ñ“Áÿ\0añ\'…þ h~ø©iz/ˆtO\Þ´ÿ\0‰N¡ð›Ä–Zå‹|Uö¯øGOü¿Xü_\æ\â°5\\\ç‰\Å\Ó_V…)EG\ÚBqöuq^ì°®´U*”yjKº0¥)M%\ïpµ,JÍ°ØºJ0¥†¨¥V¥E\Ëx½(\É{Ñ«½¢ª\Ü)\á\Õ7‰«5\n<²þsuO„<ñÁZo‡£øõ.´–zžŸ\ãˆž!øci¥\ëo\æ\Z…\Å\ïƒü\á½\n\Ë\Ã\Þ\n\Ó4}W\È\Ò\á²Öµ»\ëñt/õþ	?\Ò÷Â¿~øcû<xEðW‰R\ãZño„´\ß|Nñ>‰­Ï¬\Ýxƒ\Æ\Z\Äh¸þ\Ð\Ö>\Õ{wÿ\0}.\â\ß\Ã\ÖŸò\ácmø\×\à\ìv~ñf¡\â¯ø?\Â?4ß„?n~\'|@ð—\Ã}U\Ð\í|Ið«Y\Ñô¯\r\èÿ\0ð‘üH\ÑüIu{wm\á}cû?O´ñm¦­_kŸnµ»\Ô<=§\Øýˆ\Ù_v¿³\Ï\í=\ãO„¾ ý\Ý\ã\Üxne†\ÎóD\Ö!\Õb\Ðo,\î>\Óqþqö¯øúÿ\0G¸û\çØ¿\Ð>\Óh: \×\å¼+Ä´òÚµc†ueŒ¤©ýb.4\ê\à©:ã… 4\êÆŒoª\Ê\îŒe:R”jU¦}\ße³\ZX*Îœ°ò…YR«\ÏR8–ù\å*õW4=¤¹!R>ËF¬)ó\Â.?¬ñ\è0\è7wMx©¨4\É4i5\Ì>o\îzn¿\ãçŸ¦zðyª\Úz[5Õª\'\ËûKùcÿ\0<9=óþzÕ‰<m ø«K\ÒüE¡\ÞCy¥\ëvj\Ã7›û›ˆ>\Ñ\ä ]Yÿ\0Ç¡®\'R¸\Ýl\Ü¹þsŸòO¯\Ó0\ÕU”¨ºv\ÒQ©¦¥	F2Œ£&\ã(Ù§e»Ocój\ÊiµQII>YE½š\é%\åò\Ý\î}\Í\ã†z\Å\ç‡|+\âmV¹¼Žk\rT\Õo&I\å¿\Ñæ¸°ûGŸm\é¦¤}“¿\Ø=ªž‡£\êPµ¯ö†£\â)µ4\Ôd°\ßcö[Éµ	\í¾\Ïöx?\ã\ïRµ¼ºþ\Ðûx³ÿ\0Ÿk?ø˜u¯cøiñS\Ã7\ÞðÎž\×\Û\ÝXx{G³¹ó ¸ÿ\0]ocmoq“ß¿_ÿ\0^‡|Y\à}/\â\Çü!\ëymn·úö±q­yˆ¬$³¹ðå¶±£\éZ}Æ¤?\âZlõA¨²Yý‡þ=³_ RŒRSQ~òWq\Õ;\'³\Ñi?‘\ä4Óµ»Z\'\ß\ï\ÐöCI\Ò~\Ã3<q\\þñ\í¡O¸<³þ~¿ôýß­t–v±\ÇQ\Ú\ÚG1ÿ\0\Ëyº\çüœñ\×j\ãZð~—¼×ž&ðÝ¬7O\ä[Ms­\Ø\Å\å\çü|yÿ\0\é_\é7_ññþ‰iŠ\áõ\ïŽ_ü8\Íoª|Cð\Ú]Ï\ç\Û\î¿ð_¦µ\àu?\äV‘\æw´Z×¤z;Y=VÚ«õ»ì˜”¢ú\ë\Óúùÿ\0V;\ïÝ³þòg™¸ù<¯ó\ï×¿L\Õ\Èü\àYmá¶·`r\ï7\ïeÿ\0=óÇµ|ß¯~\Ôÿ\0ô\Û[[­/\Ã?¼Ecsª\éº?\ÛôO\ßZ\Ú\Ç6±|t\ëi\î.5»­}—\íg´ÿ\0C²¾ÿ\0šš\ã\ãÆ©#2\éõ(¹s\â¯\éZ_oú\é£Z»\Çlû\ã·\Zu\å\îr¹rÛ™5m%dµ×§5ú­{„¤¢““I6Ò»‹»¯³{9%ó>’V[rZižf÷ü\Ï¹\êœ\××ŽV\Ý|˜y\Þ\ãóþŸ_lW\Êú·\ÆŠ\Zv º<>\0\ÐõO±\Íý•\çiº®½k¥\ä³B\â\æ\ê\Èý—\í_ñþ~\ÅE\Ç\Å_\\C\ZÉ­Co\'“ý›g¬2M\ä¤Oo\ßþ>¾Ñƒÿ\0×«Ž´­t šOY\'½»7\Þú\ÛK>ºd\ë\ÓJ\ê\\Ï›•Eo¥µ}¢\ïî¿µgµµúšD[hÏ™‰¦Ù™óF2{þþº\Î[¥¼\Ë\Ë\Èmög4¾_\ë\Ðú~}+óó\âÿ\0Ž¯¬ü©^j\Þ8\Õ|?\Û\Ïy®ý›O¼ÿ\0Jû<ú…¾‰iywsj\ç\Ó\ìD_â¼—\á>µ{«xo$×¦ñD\Ókz\ÇÙ¯&‡Uò®aÿ\0‰o\Ùþ\Îu¿±]\Ü\éeÿ\0Kû]\ç{^Ë¥(sJ´½¹yd\ï·V\ãµ\í³\Öûu‡‰Ž\ê.\Îöm­ðnÿ\0\åsõ:óÅž\nµm×ž&\Ñû\éý¥Ô§§üûc·\à=«Ÿ\n\×Åžð>*³_ø\Ê\ÛÄ—\Ñ\Þ\í%ñ>±¶\Ö<AýŸqsŸ´\Ýhú]Å½Ø´ÿ\0Ÿ\ZøV\Â\åZ&Ú¨›&š?õ>T¿\è÷\ê.?\é\ë\Ûò¯ÿ\0m¯Mð—\ã\ìñªh\æ]\'\á\×\í©[ø…\Ò\ç\ì¿ñMø\ÃJ\Ó|?\âôû\0\Üj\èŸþª\ä\ÇÒ¥\ÂT\ÄU›qŒ\èS÷¹cýcG¥+Gá‹«\Û\Ùé£“k¯N®;OJ\r\Ît±5W.®\Ø\\5\\Tý§Fwz\Ù\Ù\Ù\Ú\Çô%uª\Év\rŒ~dŽ<¿gŽ\ÙþU\Éø\ÓÁ>ñ–ý“\ã\íFÕ´·ý\âX_\Ã\æ\Ë\çuÍµ\Çü}\Û]cþ|ÿ\0CÓ´òo\Ú\ÏÃ¶6z}ü»]»ýªY\"\ã\ìóÿ\0úÿ\0\Ö¥ÿ\0ž‹p³xƒQþ\ÖÕ¸•-·ý«ËŸþ]þƒŸjò\ê\á¡SŸ\ÚC8òJJT\å,œ$¥kit\í\å}u¥]\ÓiÓ“‡+N.\r\Æ]>\ÔZ’¶»4\Þ\Ïk!ø£ö\'øc®C\æx^\ßÅ¾-¼»Y¼1\â«\ï²\Çÿ\0p}K\í¶—#8\íúõù>O\ØO\âDz\Õ\æŸgûQC=”×†\â\Î\Ï\Å_\r º¿³\Æ?qqq¦\ë\ÖV—5ú©¨j¾4ñ2ýŸ\ÂzK\év?ò\ÛRÔ“Ë‹É®#\\‡Â¾Ž5ñ–½s\â-hÿ\0©±Ò²}\Þ~·•\â\âxo)¯%9`(s.U)rû%tÓ³T}œtw·º÷²J\ìõhg¹£]f»NQ©m::°œ•öo™·kmcò¿\â\ì¯û@x\raKø…ð÷\â\×3yc‡\Ã^#Ñ®£ÿ\0·{k«ß³}}ª‡ü3w\íec\r¶¨¾\rðd6\è\É×ž<‚\Â/\'þ>\ã\ÛR\Ò\ì®ùþ~øú©k?Ä­i–\ß\Ã:›ðþ\ÅðR\×\ß\íþ#x{\Ïo§ÿ\0¦\Ýÿ\0\éoZó¿Y\è\Þ\r\Û\'Š.uø‘ÿ\0xŸð’\\\Ï—ý{ø~\Ú\ëý\'þ\ß/}A\ë^UN\n\Êf\å8R¯J:8¨W©N0—YE\ÉÕ­6ö³‚µ¼ô\í§\Å„Ta)P¨ö“t Ü¢­hòSöqV\î»\í¡ùƒ©øSö¯º\Ö/t½\à£\âkw¼³\Ô_ðßŠ¼9 \Ù\Þ\ÌBí‹›«/³õˆö¯V±øñr\Ç\ìñø»Ið~ƒ\'ú\Ï&ÿ\0\Æ\Ö7òÀn \"\æ\ìý\Ö÷ý/õü…{\æ­\ãOx‚5³º\Ô\æ°\ÒSN£¤\Z^—<Ë½·>ÿ\0þº\äæ·±QºFvd\'\ï¿\ï_ò+‘pfWsª¸\Ù\Ê\ïIÖŒ`—5Ò²‚¨ôozš5u®…>\'\ÇI(º8Zi%¬)\ÍM½.ôª©­—üºz\ß\Èð¿i,`acc¥kVog5»¥‚k‘K\çcþ%ó\Û\Ü\\id¹\Çò¯µñÅ«[ÔŽ\ß\à\ï\Ä+\é‘ü\ÇDÐ§º\Ò\ä\ïqýŸ¬[¢{¦õ¯¿´»†¼º³\Òôû\ÍJ\êööhm¬ô\Ûž[«‰¿\é\Þ\Ú\Ûùÿ\0z¦Ÿ\á}>9&‡\Æ\Z\Ä>û7Y\ßý¿YÖ¤ô‚\ßO¶c¶9\çý2ó?•rT\à¬=i©S\Ä\â#e²pv\Õ\Ë\É\ÆRWKMï®§M>)­F•p\Ô\'{;Ëu\×Ü¦\áõ}\Î[\ÝSÆ–v\ÖòjŸ|mj\Ð\Ãÿ\0\Ó\Ù\Ø\Ý}ž†ø–ê—¿§?„:o\Äk‡’>?üE›RK\Ïô\Ñü\â=R\êHn8¸±¸:e­\ïÙ¿Ò¿\Òò=Ç¨¯\Ñ\éµ\ÛÎ¶¾ð¿\Û6}\Íg\ÅI<±Iÿ\0M\à\Ñ\í¿\Ñ?Ï·~<W¶xá¾¥\â«Huk×øq\Óþ%ú‚\ãAµ\Ô!ÿ\0§\ìß±£Ÿz¨ð5\'Q_Y]\ëNœ´|·½G[\Ë\Ü{;\ê\ë\\¹oõ:M\éi*’ŠN\ËU\Õü\Z\ßG\Û\â_‡ÿ\0\rþ3xá¡‡Oð\\>û}·úöõýŒR\ÅöŒþþ\ãG\Ó~\Ýw¦\Ú\ÞÏ¥\ï\Ø8ü\ë\ê¯þÅ¾±—ûOâ–­ÿ\0	¥÷¾GIôoGüð\Ôn?\ä-­\ã¿üx\Øþ<®4û}\'\ÃöQ\éz›g¤\Ø\'Ü´°‡ÊŠL\Ë|\Ë\Í\×ý~u©ñ¤ŠM\Ùùÿ\0ƒ_Ècÿ\0\×5ô™	d\ØIS©Z•\\uh_–X©ûHGk\ÉPŠm4rŒ­k¤µ¿Š\â\ÃB§…§+&°ðå´ºö³s©­´´•®÷§\Ú\éz=µ¾ƒ\á7M\Ñô›4ò\Ò\ÛI³ƒO±¶‡¿\Ù\í\í¿ô¯üM>ùn$µ±ºû%\Ãÿ\0\ËÌý«\Ë?\à1ÿ\0\ë¬õ™m&Uû«3\á¶úþŸT·7Mü}\è\ÜþŸO\ÃÓŸ¯5õ^\ìRŠ÷\"­Ê£î¨¥m\"—»>T¼ö\Ó\ÃÕ¶\Ûm·v\Þ\íõmõ“¶¯\ÓCšÕ¼#©{b\ÚÇˆ5[‹k8fûL0ùŸlÿ\0—ù\ÇÝµ¯oúðÉ®øÄ—\Ý^i°\Ã\à\Ý6o¶iº;þö-Rkoø÷\Õu´ósuÿ\0/v—˜²\Ðl~\Éÿ\01\ÚõoF\Ói’B»\Ïö¬\Öz_üò\Ì¸¹\ãþ½mþ\È?\ë\ã5\Ík“·\Ù\Z\Æ\Ï÷p¥µ\çœ\éÿ\0-1ß¾=ÿ\0NiÓ¥\Í.jp›I99®~}4R\ç\æ÷SN\éZ÷Wz\"¢\çxò¶šûQvknº\Ù~[jp\Z…\ÔÚ¥ö¥¨[\ÆWG°Hl\í¡L‹X\á·ÿ\0{{{×“üª®µyokkn·\Ü:y—.cÿ\0¦\ï\ïút®«I\Ó\ä›\Âú“A\Í“‘ùmÿ\0/\çðÿ\0×œ\ëVrC/\Ó}÷þ_—\à85J­’i\ÝI]Y\'¦\ß\å±\\›ë³¶\ÞI÷ó2ôö¼Ô¯-ã·…\î7\É\å¹\Ùþ¯¯Oÿ\0]}-g¢\ØøO†k†\Í\Ô\Éø\ç\ë\í\\¯ƒt\ÛO\rx^\rVö’úýü\Ë4ÿ\0žy?\ëÿ\0=kRK™µx\Úò\é¶BŸ\êSþz\Ó\ä=~•q•–\×o§§ž½]´D5f\íª½“\ïò\×ócµ‹\é/,dX÷\ì\ÇÉ°þ¹ÿ\0>þ•\Çø\Â‹û©\á\Ùû—ý÷üõö÷\é\è?ŸEŒ\Ër$ùgO-7ÿ\0\Ë8}=\Çñøö\â|$Ö¾9×¬a\ßö[›k\É\äÿ\0W=¿“ùŽ”\ÝK[¢m+wm\è½{zƒMn­ýÁ9ŽZ,ž$m>\Æ\Î\ãÉ’¾tÿ\0–\\û\ä~}ÿ\0Ÿ3}\à_\è:uŸ…ô.\ÃVñÍ™\Ô5\ïkÐ›ÿ\0\ì¸\äoÍ¦ü¸~~™\í>#jZnŸ¯3\Ë?3\ÉûC©¹‚_+ò\ë\ëþ5\çº?Œ<?c©Mu­^Msß¿¼û´÷R\Üc›{ÿ\0\è§üžõœ\ê\É;EI\ÊMA4´…\í\ïK]#e«»°\ãõrI+\Ý>¶·_Ï¡¥©Ç©k\Ö^ðœ¤w–\Öj:—Ù­ µ2g\í6ú?\Ú-\í\å\ï\ì·k÷5\Íø\ÛÁº…æ« øgA’ôû?øù¹™ÿ\0u&±¨g\í\Ù\ã\í7Gd=\Íhi¿´/P\Öõi´\ÛýCPÔ¦šKgG‚\Ö+qÿ\0öÿ\0ñó\Ú\Î\×\×ù\nÅµøÁ—ºK\Û]^ošHo/\ï\çómþ\Ñÿ\0>ööÖ§ý/<Ÿ§lsœi¹ó:œ\éË‘.’\äŒTv\é\Ì\ïø-w/Ÿ•\Å$•\Úv·>š\Ù+io?–§Q\â\ÏÁ>›Âº\\4úÞ±û\ëŸùk¨C§Áþ‘}?ý~jœÿ\0õÉ¯xð¾›ö[->6göV•¦\ép£\çýwnuÛ­\×ÿ\0[9¯ŽuŠš†©ª\Ú\ê\×\Zn”­`\Çgg‰åµŽyþ\Ñ\äg¥\Ï\Û.ø¿­\Èÿ\0h¯[\Æ\Ñ\Çcá­»¦“ç°¾ó\Òsž>\Õ×·½iN<’wJ1ŠŒcù¬£u½–\×\í}7\Ñ^%$\ÒÝ»¶\Û\ë{[Mmk?¼û™Wsÿ\0sƒþGøõ¥†ÿ\0¼|\ß\ç\Þ\çÿ\0¯_\ÇûHx¦3ºm\Ãw?¸—Ö¿§Ú¿\ÏN•µoûR\Ü*•\Ô<f\Üd½†¹<C\Óþ^mGô­¹\×gø™\'\Ò^\"Õ–\ÎÝ£W?ƒ×ŸNûõö¯žu‹‰¯®¶¿\'º\Ï?Lqõ®wPø\í\áýSsMcª\é²>#ù\Òø£ÿ\0Àn?ú\ßZÏ±ñ§†o\äÖ­VGÿ\0Ÿ\ÏôY@ÿ\0·“\Ïÿ\0®±«7ªO\ÜvoMVµÞ–¾¶¿go-i¤šm\ï\ÒÝŸõý#?\Å÷\rkfC&\Ï\ïŸ^ø\Çù\åú‡y\â\í[O\Ó\í\áóf¹¼û=·\ë&?ññ=\Çý:\Ù\ã\íOÓ°ñµ\â\ê’Gi§È“+ÿ\0\Ëh_÷2\Û\ÆZöÏ‚þ\rþÇ³‡\Ä0ÿ\0¦jI5ž”“qö}þ^5_úú\Ö.ºúX\Ûtã™£\Íó½U¤—\á–\ÅÔŸ*öi¦\ïv\×K¥¦\ÞOS¶›\á\îm\á\í?\Ãöwc·³2ò\åÎº\Ô.\î?\ã\æú\ãþž¯8ú{ã™ÿ\0hŠ\×Y¾\røi¬nc°†?ø†\Íÿ\0Ò´»=Bùô\ëùv×µ›oøÿ\0»ÿ\0—úý\íŸ~(Â½ð\çÛ´˜\í¯<Mª\ÜÍ¡ø>\Ær|«c\È\Ú\Z\æ¡ÿ\0P¿ÚŸ\í{þ\×÷\ßc\Óûñù\ßg¦\È\Ï$\×\Þ]\\\Ü\Íyxþuþ©©\\OöBú\â\ãþ^n¯.¹\Ï¼õ¯•\â\Ìõ\à©f`\æþ¹Zš•y\Å\ÉK\r†—,ya$ý\Êõ®\ã«NwR¤f\×/\ÐpöT±úþ&7\ÃÒ“K\á¯^6÷šûP£Ì•´½fõ^\Ë\ß\æ ðõœpCzFž±\Çh‹\äAò¢ U‚€(¯IM-v¯\î?„v>ƒÚŠü³\Ùrø?òþ®ü­÷X‡u\Ó\íúy\ÃÛ¬ýRø\É†¼7ð\ëÄ–v6:&“k-œ\×–\Ï\â=\ê\àx~øH<#\Äµ½»\Ñ5\ïµi\Ö\æ\ÃV¼ÿ\0‰Ÿ}ÿ\0!·œX_~)üUø³­|EO­ÝŠ|sð\ß\Â~¼ý¯\í¼U®xzú/‰Ÿô\ßx‹Nð‡\Ãyü\r\âo\í·~	×¼uÿ\0?‹5\ïùŽk\×Úˆ¼C§i÷\Úw\ÛþÁúyûSü}ð÷\Ã\ß\0øóEðÿ\0\Ä-K\Â>6¿\Ðo4´¹ð—öV¿¯iúf¡ö~¡qq§\\ÿ\0¢}”Z\Üq›\Û\ë\ï²\ê\Zwüxý†¿üj\Ñ<]\ã/]x^\Ï\Æ\Z/õ_\ê^4\Ö5¿M\áÈµ\ï\èú}·\Ã}\Ç\Å\ZÅµ­—‡¼[\àßµ}ƒþ`¶7\ß\é?\Úû¡ö\ï·zþ#VusxS…Y×§¡J¯²T«\Ç\ÛÔŒy æ“•hÑ­({8¹\ÅÂ”\\eR5¨øœ†—\Ô\åR¤ñ\rF¥HJ~\Ö7 ¤¢š„e\ÍNÐƒI7«²²RÄŸ„’j\Ã\á\â\é3<š÷„¼57Ž>0x“Àp\è~#ñ—\Û4{K\Ä:…ÿ\0\Ä\\\ë\ßð\Ûx\ËGð¾±£ø‡Å¾\Ñì¯¼+¯\ß\Ûx{PÓ¿\âcö\í|»ª]hú¥õÆƒ\âMK\ìi©yz&¼šlú¤Z¤7i\Ô-ÿ\0¶4ûo¶\Ýé¶·Ÿhþ\Öÿ\0—\ë\ï·\Û]óþšk\Ú5­KK\Ô4u·µñ3Ç¨ü7}Áÿ\0<U\à\Ë=WK\ÒüAÿ\0}ö§\âŸx\Çûb\çTðÇˆ|7k\âMX¸»°´ñ\'†5Ï°\È?Nû\ÛÐ¼\ã^×¤Ô¼/\à}>ûI¼ð·ƒôy´\r!4M;D±“\\‡P\×5½c\Ãú¯Ž5\r7þ&\Ú\×\Øÿ\0¶5‹KýVðX\ß\ØhcI°þ\Ðÿ\0B±¯\Ã\Ðm«¹>YrF<±Nr”¹\ã)NJm\Ê1”T¹›³½5eM9}l¥8\Ý8ò¹F3›nå‹•¢Ý£%ò9\Í\ÊR“>\Ùø\r\ã¦Ó¼	o¤º>›f÷?\Úz®›©A‡5Ÿ´[ýž\â}\Þ\æ\ëý\Z\×\í_\éŸdÿ\0§œšö-S\âÇƒ\ìtñ5÷‰t¥;>Hb¼‚\êY{Ç½±\ãüô¯•~ü	\Óüu\á}Q®®µ\ï\rX\Ùø‡ý\Zý\ÂH¼AyqcöBûG·Ô¾\Ûý›kg›{O²Ó·n+\ì/þ\Èt´ŽmKS\Ö5i÷ý\åŒQI7ý{\Ûuõ¯\Û8o+\ÆK+\ÂTQ„c(sC\ÚÏ•û.yr\ÊT\ÚN2\×Þ‹µ´´›nß—g•\èÿ\0ibU\ï\Î<\Ê\Ý\æ\ä‡:R\ëe®©o\Ò\çÔŸüEu«xN}yo¯!‡Rš4¤’\Û\ì·Vúg‘Ÿ#úÿ\0ú«±Ö´Ÿ\íÍ¶±\ëš]\Ó\Ë\æ&±gkcªY\Ì\'ÿ\0Iž\ßûJ\Öö\Ó\í]\Ý\å—\àqY:[x{\ÂzV\á\Ý\í\ZK=7\í0\ì\æ;?>\æ\ßO\Å\Æx?\è÷\è=ª…÷M¬ñ±¼™c\ß÷0ÿ\0õ»žÿ\0¬\áiEap\ë–2\åŒc)­Uô\ævþ·[\Üù*’“«$\å5ouj–‘n\Û[õù5o€¾ñ&­\á/kPøŸ\Ä\Þ\"ðˆlüC¦\ê¾\'ñ¹¬\ã÷6ú†•ýö«/[Z\ë·d¿ûŠ?\ã\ÛÖ½ŸI\Ò\ìtXö\èú£®9K;ò\å\â\Ûü:z\×\ä7\Å\ïÚ“\âE¯\ÄO‰^	ºÕ¼I¡øw\Ã*\Ól¼=s\á-6µk\Ö<)m¨\é÷\×\Z†¥köKŸ±\ê——÷mûwÛ­­4ÿ\0\ìó^¡ð‡ö„¿\Ô<Uö=SX{\ï\ê¾³\×óR“Íº°Ô­±§ˆ5B\Ú\ëþ\ï\í\ëË«ôûO\rÿ\0Ç‡ú\'ö‰þÑ«¥V2\ÄV  \éÎG\Éig\Ï}c\Ë5$ÿ\0½o72”\Ü(Þ¯µŽª	IZšr¿.‘M5ö–¶²z-\Ô?´H\Û\äš\ê\Â?ú\ís\æ˜ÿ\0OQ\ÓÓš‰¯-å¶±gÿ\0b\åÿ\0?Ž;w¯\Ìöý¸<\É\á\ëY!y£t›XžiD\Öóý›üûW«~ßž°²kž³^~wx%ÿ\0Ò›®?+\ÑXZU8­¯\ïCû¯´ý:w×§˜ñ\Øx/Š­·K’§NWºK\çÙ¦\ÒV?X>Ù¡¯\ÌÚ¥\ìŸõ\Æ\Ï\Ê\Çþþ_—¡:‡‡\×v\Ë}V\áÛ¹‚/óÿ\0\êÉ¯ÄŸÁJ<+.¶¿¼1ku¿\î[C¥M\å\Ã\ÇüüúŸ¥rú_ü³Âº•\â\Ã7\Ä)®—–!\Óm¼\ß\Çý\Z×¹\íþA,$–®²\éhÆªR²¶\ê1M5ovÕº\Ìs*R”ThÔŠ’Nî–<ÿ\0]o\ßS÷X“\Âú\Ì1\Ú\ßx~þkxo!½-¼U®\è\×RMoÿ\0ÿ\0h\Ô4K«+¿²÷û(½ûó¬\É5/\Ãö°\ÛøOÀ¾ðüfiü›\rG·µŠ\âò\ãþ>/®-\în¾\Éö«Ï³ýªþ\îðýºÿ\08ô¯\Ë_†?¶\ç†|Q¬\ê\ÚDw>0\Ö.>\Ç\r\ä>O†üG\åùýž\ã\ìÿ\0f\Òÿ\0\é\ã\Ó•z†±û@]jm\Ó|ñFòmþe«\Ûx?U°ý÷_øø¹ÿ\0nùÿ\0&±xdžº­›”¤Õ®¹\\¹u{ó\'ki\ç\ÕO\ê%g\ÊÛ¶‘‚kmS\åò\Ú\Ým\Ñw\Øø\ã\ÄL\Ë#i¶s%\Ì\Û\á¶Ò´¨¥·\Ïü{g\ìÖ¿•\ßù›ÿ\0Rñ>¹\Â_„~>h:•\×\ÃOŒÚ–¾-\Ñ4¯ør9µkzúG…õ+_\ìoþ=ÿ\0\Ð-/,¯Ó‡_\íÖñ?\â‘È¶ÿ\0þ$\\4\Ó}¡æ¿³±µó?›¯Q\ëšñ?\ÛKñ\Ç\Å\Ù\ßÅš¹ð\ïR\Ó\×O\Ö<+\âõT—û_G\Õ\Ñ\àþ\ÏûWúM\Õ\å¥\Å\Æq{‹^^s…\æ\Êñª•¡QPs‹¥\ê·JT\ëF0JJ£“•8«A­V·\Ñ?s\"\ÄB9¾\ÛJ£<B¡QUœaMC	\á¥9Êªt\ãNœj\Êu%Q8\Æ)Éµ\×÷{öVø¥â¯³wÁ/ŠZÇ‰,4û|7ð\Ý\äÉ¥Bb–\ãQ\Ó\àþ\Ç\Ö?\Ñøû7üM4ûôA_M[\è~ðÝ¿öÖ¤©»ýb^j_¼–B\ç\Þ\ßÿ\0\×\ïžÿ\0†ÿ\0ðNŸ‹\Þ4ø7û3\èŸõO¤ž&ðßŠ¼Iÿ\0\Ç\Û/ Ö¢³ð~±=¶±oö‹m7v\×_Ú—\Z‡ú\í\ïlö¯¹/¼iñ\ÇRý§^\ÔKµùc§§ü±ÿ\0¯ƒ\ë\×\×\é^5:¼ô©¿zò§M\É\Í8µ.H_µ~}¹û+;w\ÓAañ5\éFP”!^¬i\ÊŒ¡*jmBQ”‹-•\Ów\åoM\î\Þ8ø­u®\É.—¤\êhúoú·¹Tÿ\0O¸ÿ\0°~Ÿlô³\ì5\ç:~¹k¥]ª\Û\Ë‡\Öc\æj^$\Ö&û~½\äÿ\0\Ï\íši\íöM\×˜ó\ß\í\ì@±\Ðl\æÔµ)¿wû”ûT²Mÿ\0_üûWiyðs\Åš3x“ÅŸf†o\'\í`óy²\Ùõý\ÇO²}ª‰9JN\ÉÉ­\\š\Ò+M[\éu\Ño¯c%\Õ\Ùt\Ó~û?C¡Õ¾>G£\ØÉ§ø\Z\Í\×w\î\ä\ÖõX|\Ûû\Ïú~\Ç&\Ûô\Ï\á_8jšž¡¯\ßMªj\×\Ó_]M\'\Ï5\Ëÿ\0«ü½j·2´Œ¾\\Á´þ\ë\çþq\\ý\äŒ]–6\Û\nqò\Ë_\Ëñ\ëýkž¬œ\Õ\ßKyù\Z(¤\î»[òÿ\0/\ÄÖº\Ô#Uh\à\\7¢}=¿ý|q\í\èžøGy«G©\ã\rRO\é.<Ä¶H~Õ¯jÿ\0Ó½¹ÿ\0D\Óm\é\îó§ýû\Ö„ô?ì—‡\Ä\Z²¢ÌŸ¼°µtý\Ô_ô\ßþžnº‘]´šõö¹y—pòG¼¬ðö\Çù\Í(QR_¼Zie}]{­¬\'9Eµ6×¯G§c\è\ï\Úø#\Â6~Oƒtm=W:¬¿\éZö¡\Ïh\Ö.\Òý¾\ÉgøWŽüNÕ–ó\Å+k5µ³I$0”¼\Ø<\ß8ž ¸ÿ\0Ÿ›^†»\Ï\r\Ãqu%­¬1¼ŠŸÀŸò\Óñü{û+Àþ\"L­\â\íA-\äuûúÉ·\ã÷\ß\×Ò·©\Ë\ni\Æ\n)4¬´WV³¶½\ß}\Ì\î\å+¶\ÛvWcµ\Í[\\Ö­|3c«Yøul\í¦¸\Ö/\ï\æò¬4\ë=>´\\ÿ\0>¿e·¸º¿ö¶ö¯NøkûM|=ñ¦—ö\nüLð¯\Ä=)\rœÚ—ƒ\áŸÍ³†\ßýOq£\Üý‡V¶µÿ\0§¿±}‡ô\Ç\ËsÜ¯5½{O\Óä¼·\Õüga…õ+\Ë	\âŠ8µø—\ê\Û\ÜÇ¥É¼µ¸¹ÿ\0>?\Òk\ê?†ÿ\0²Â¿\ÛZx¡ôù®¯´û>•\Ðh\ß\é–ð}ž\â\r?û7\ì7e³ÿ\0Oô\Ëß°ÿ\0_6…|e\\BT(P•)ªõjT”,¢\íÒ´\\eQFòœenx$Õ›—C¥F~\ÖuY(ºp„#.‰·$\ïx¹^0’³|’n:\Ù{¯‡|Ac¯Gu-Ÿˆ!¾d3\îyDBå…½¿ü}\ã×¾k§·i¼¨\ÑdC&<\Ç\Ù\ÞO\Ç\×òÞµ­M\áÛ­Y¬ü3aq\å\Ï\Ú-¯-µ+\rR\În‘oôKoAýsŠ\Üð7µ¢\ßlm{M\Þ\ãxñ>—­¬c·\Ùõ6\îö\Ò\çþ¾ÿ\0ú\â½uVq„®œ®•¡.VÕ­y+\Å7}\äã³µ\ì\íÎ“i´®–\î\éZ\î\Ëv·\×\î>‰“\í™¼½Ì™‘ó\Æ>\Ï\Ó\×Òª\Ú\ê´\Ñ\Ç7Î°§—ó\Æ?\ÏóÁ&°t¿H±5\Õ\Ä6w—“}!°¿±ºŠ\Þ\Î\ßþ[\Ü¥\Ë\é\Ïú\'\åÚ»«6\Öò\ÖK\éhagó&ÞŸ¾’`?\ç\ã·_þµk\îË³·üý|\×rZogo•\Êúõ\ì0é¶—\"46\×öroòÿ\0\ç\ç\í6ÿ\0ûqút®+R¸†;5U™®w÷ýºuü3\Ï×¥V“Äš†±\â{\Òt]Jo\è3^Gö”¶ž(µ\Ë\ÍBn\'··\ÏúM­¯\Ú>Á\í\ïW<C\á5\Õ/\áš\Ç~›½0ÿ\0ußµ¿?‡_Ã“Y(ûE\'v”¶·T\ì\î\×nŸyIµ³4<\Í‰<Ì´)Ru\ë5\Ç_\Ï\é\Åbø‹D­–8U<\çòwŸù\çø~xö5cV\Ô<7\à=>\âÕµ\ï&\êþ\Úy`ðý¾\î\àwû5½·ü{}	\é^#«|TÔ®„\Ð\Ø\Ù\Ãœÿ\0\ë®_Í—Ÿù÷·õúõŒJ‹Q´Zº\êô¶\Ý6ü­n½_´·Å­ö\éúy£Þ¦™u­WF\Ò\íTý†\Î\Ú7\íû<\éúu\éÿ\0×¬|@ð‡\çš\ÎMI5	-Æ–zWúT¾ÿ\0\éý\Ûñ\ë\é\ëòÎ¥¯k\Za}¨\\¼?ó\Ç\Îò­ðÛ¯\ÓËžu·c\åû¼\ìÿ\0¦}¿?\Óó¢1i¾y.i;è•’²²½õJ\ï_5\ê.uf ’WZ=mwò\é\Óm;žÁª|`\Ô\ZY¥\Ð\ìm´µ“\çý>\ëÿ\0‘?\Ìu¯,\Ô<M«_M<\××$\Ï\æM²Q{ý›·}}«\nmß‡ÿ\0«úõ\ïÓµS‘˜ž¿ýË§\Óñª\Ñ7dš½\îú\í\Ó\å¿[±]½õd\Ò].X•‡øóŸðôúf¨\Éwþ\ãú{\äT3œž?ú\ä\Õ‹ðþ”7v\ßp&’á¿½ÁôÇ þ¾õFKŽ6ÿ\0‘Ž;ÿ\0­W‘zý=¿!Œ\çÿ\0¬jŒ’7ñþCÿ\0×ŽÝ»\ÒÄ’g\æ\çóÿ\0?A\éTd“ž¸íž¿€\ëøû\Ô2Í·6\Þ\Î}ÿ\0\Ï\æ«I»w©ú~¾œ}h\ÒIô—ÿ\0_ÿ\0­\Åg\É#1\Ç\çþÏ¶;¶YL};ñ\Ûÿ\0\×ôªòß‰\'ñÿ\0\ë\æ€#ši®~O\Ãõýy\êZ2]7?\çŸAþ?£\æl•üGõþ†ªI»\æ_½aþ{ÿ\0ú³AJM[ªW²õÜ±¡4%Ls\É\Ï\î?•\Üú~Y¯RÐ¾;|F\Ð\àŽ\Ö&¥hýžmb\Æÿ\0.ø÷··¸ÿ\0B»¶\í\Ç\Ûz{×ŠÈ›Czr?CþŸ*¯\Íúôÿ\0\'\é\Í§Ñ§f½s>¶k³Kú\îwþ4ñ÷<Qÿ\0	N±²¶Ò¬ô}+H³Iÿ\0²ô{8?\Ò5möŸô³u¬]¥\ß\Ýÿ\0Óµ¦ŸÞ¶|#§\è\Z¤ñ\Çq«XG7˜6YÜ·\Ùe\çþ¾\ã\ç§\ç^7$\Ò)\ëó\íß‘\Í1®—l…×Ëž1þ}+\æóÀ\ã«\Õ\Å9U§ˆ¨ù\ç\'QÔŒ¤”\"Ÿ³©Í´b•¡(AtŠ¹\îa3¼^:´§FœyaNI\Æ+D•H5}¾)\ÆSz^N\ÇÜ±xZÀEC\Zc\än›F;\Ñ_¥\ÜÁT‹€€\Ú\æ\àcùzô¢¼õJóþŸþO\Ëþžz}þz÷¬þ\Z~\â]:\ÃûŸô\ç\×\îòÓ¦ñ7\ì{\ãmB[\Ã&µ\á\íqndýú-\ìö·W\Üs\ä\Ä\Ê\×#Œ‘_ÿ\0¿`¿ZOŠ//4?†~$¼ð\ÝýÍŸ\Ïá»›|Y\Ù\Ûÿ\0¤\\A¨iún©þ“öË®·bÿ\0­TŸ|3ÔŠ\ÚÆ¤\Òv…\Ç\Íþœ{t5‹7\Â\ëv‘š=Bò\Þ~\å\Ý —üþ8þµ\í\æ<‘\æ0q”±T%~hÎ•H9E¾[«Ô¥>h½9”¯v\Ö9p|Q™`\ç\Ç\ØUIr¸U„\Üzi\n÷—Ù“\æµÝ–®ÿ\0\Çÿ\0‰>ø\ÛÁöú\ç€|iÆ·ö}oGÔ¼	\ãû´\Ûoø÷\Ðôsm¥Y]\Ûie\Ïú_\Û~\Ãö\Z\æôß‡¿üI¨ˆ|?\à=oOÓ¬\Ó\ìzmÿ\0‰-§ð½„põ¸ž\Þ\ßRÿ\0‰µ·ýy\Ù\ÙÇ\å_\ØÔŸ\ro”m³ñ±<$/m}OûzïŽ½3úr:\ÇÁýr\à³\\hú´¿ß™,ešOü	µ\Ç×·c^NÃ¬ªH\Îy†/ Õ¡W\ÜMi£•4\Ûõ¼lµ\Ö\î\Ýõø\ÏZ.1\Âa¨¶šr„ªI\ÛM•YTŠ½¬ôwÓ±øsð—À2xw\ÂZ>–\ÐM6¡amw\ï¾ym~\Ø?\ã\â}?\í?ò\ëysÏ§±\í\ìéº”v)°nÿ\0 \éô¯\ÒÙ¾5¹’Fø{{>ü\Ö\Úo\î¿ò[\çš\å/¼\áøDq ý•“ýb\'\î¿ô§\Ð×‘\Í}\ÆOÓ¦\â¡\Æ0£´I+»[W¾¿-~V¶&U¤\äÖ²—3mó6ýl¿\àt>R\Ñ~\ÞxÁ]]j—ž\ÕU†=R°†	n¤\Ñø:Œý§ñõÿ\0\Èf¾lñ§\Â{­[Vþ\Â\Òþ&|HÔ¦¶ø™=µþ• \Ås¿Ù¼/{ùzöW\èÇ‹!†\ßCš;Qö\íy/°ùVpóÿ\0>\Çò\ïJðû_\Í\á\Ødº¾ø¥\ào\r\ßjOû\ä\Ö5‹ý\Z\ê\ÎŒ\Ü¤c\Å^ƒùz×·JU)Ò…¾X¶\ç>\í>[$úsZÿ\0kn\Ç…9\ÊRi¶••¬úKn\Ý?só?\âÁ¿†^\rñ\Óx\ã\Å\Þ!\Ñn<U£\Ãqø·â¿Œmb\×!ðÿ\0üK\î/­ôý3À\é?\Ø÷Z½¥ýÝŸüü\Ù\æ¼\î\ëö_øK\àxR\ßZ³‡\â6½¯x\Ã\Ãz]\ä\ßð¸< \êž(\ÔuW\íg·¶µ²\Ò|7 \Ù\évÿ\0k¿ÿ\0§oùh\Þóõ$ž,\Ò>)|A\Ô5cðwþ\Õ\ç‚o&\Òô\ß\ÛkÚ¬·_\Ø:}õ\ÍÇ…õ]>\ßÄž2²´·\ÒõR\ßQÕ¬-2\ã\Ú\Òÿ\0ý8W+ñAñ·Æ\èú_…ü\âO/µ+?\êO¦\ß\éWWúWŠ¼a=µ\Å\Äú\ÅÅ¶½{öoøýŸ‹+\Ü\ØXø˜ûùøŒÎ­ªV…X\Í>ZXu\Z5œ\äŸ$[š5N[E¥M«;¦\Ý\Ó=l&_EJ•NTd\ïW)U§F^ô\î¹\æªA-TÜ›û-%ª=Á¿°o\ìñ\n]kP\Ð~hšô\ÚV¥ö}z\çþ\ÝZÇ¬\\Oqöˆ>\Ñÿ\0	E\ï\Úy·¸¼8ÿ\0—i¨øý¯U·ÿ\0‚}þ\Êz\n­Ö›ð\'\á\îŸj\Ã¬×šlú ¸½3ÿ\0\Ë\ÅÎ¥u{\ß\ìöœtüjMkÁ¾0øðŸC\×4?x‡\Âk\ä\Û\ë\ÚgŠ¼\à\íKðž¥qÎŸ£ÿ\0\ÈKÁ·ºN·¯[}?ý.ò÷ý>û\Z~›^O\á\ßø»Æž)ðÿ\0\í	û<x\Ê\Ï\ãGŽ-Ÿ^\Óüsm\ãŸ\ìkR\Ö þÏ·¾\Ñô{S\ì—:§ƒî»°´û‡cþ‰¨·W­EF¢š´¹Ÿø´¿ªw½¶ó>~½\Z\nr\å‹z\ÝFJòq\ÓTôN\Û5e\å{\Øö…ý¾\Ú\Ç\ïƒm\î¤†\á»Ÿÿ\0%\ã\×\êG\ã^½ ü#øK\á\Û+{]3á¿€ôÕ¶†\ïe\á½\Ö):}¢øõ\ï\Ûþµò^­ðw\ã\Ã\ß\éú·\Ã?Š“k\Z—‰S\â§\Ä/\ÛX\Ý|P\Õ/>\Ýÿ\0+\Ãÿ\0\ÚVº×„ôO\Ù\â\ã\ì:NöúˆúW\Ð_¾\"ø{\á\ßÀ¯\Zj\ÚÖ·3?‡¡\Ð\ÓR\Ö,\'þÙ¼¼ñDÿ\0\Øÿ\0\é\Ã\ì—7Y¸¸»ÿ\0Cÿ\0³qMÊ£µÝ»_O\åÿ\0$\ß\Ï\ÍÂ4\ÔT›7µÓº;[«\â¯i~	ðßŠ¼U¥\èþ	¶·ðß†õrXl\ì,e\Ô\ï?³\ì.n- ·û7ü|ý¶\ë\ìÿ\0\è€ÿ\0Jü‘ðÿ\0\íûex‚\ÎþûPñ§Á\Ï\Ù\é¶\ßh¹›\Å_	o\íb¸\ç6ðiÿ\0Ù¶··z•\×ñ\ég\Î?\âc^“Oð¯…õ­K\×-|M\áXmo!š\â\Ò\ÛUñ%õ­üò\ïB\Þ\Ú\Ö÷\ì\ßñ\îsiÿ\0\Çñ¯¦ÿ\0doéº§Š|]®isxKÅ¶º?‡¡\Ó\îoô\ÝKûz+=KPŸþ%ÿ\0g·\Ö\í²nn¿\Ñ\î?ñ\áø\ns””~ô½“Okwƒ²ôò\ìmr­l’\è£\îôû0pZy·÷]¾;öEý£>:|Vø¹¯h?<}ð\ßRø{\á\ïj^ ›R³ðü+›]SR¸ŸM\Óôˆ4ýcÄŸØ—w\"\Î\ê\â\â\ë\ì–v_\éö6ß…}‘ñ»VðýÇ†|\'o¨M£\ë\Z¯\ã6\Ý\Þ\Âþ\rR\Â\âm\í3ý„\Ü[¢\\ÿ\0¥}ŸýŽ½\Å|õñ\ãöWø\éñk\ÄZ?ü#þ\"ð¯„ü%¦\Ï5\ã\Ã3\èÚ‘\Ì>\Íö³\éúnƒe¤ý«‹ŸÓŽk\Ú4_…7^\Ó>ü2\Õ/mµ+¯\rYø“\Ä\Z•ý´0Z\Çy©j\ßg3ý›\Ûþ~þ¹®J\Õdð\íT§\ÉQ\Åó.nd¹*B*^\Ò1ör\æ»v„¥\ÉkI\ê›\ÑRJ¯\î\êB­.hJ2Šä–©9§M·%\É6\ã†m7	KU¤þ\è6º¶šu-7þ\ï	xn\ÚO³›ûðM\ÕÁÿ\0¨‡\í¿\Ò\î\ë\ïý½û\ÂzN‹¯j±\è~\Ò\îu\é¶y—š÷‰?u§\Û\Ãÿ\0/\Û\èö\ß\èvÖ¼\Ë\á¾v¯\Óôÿ\0&}?A\Ñ\ì\îumjþhm\ì4\Ëón®\'ÿ\0¦ø\çŸÖ¾\Øð‘gð\çK]7Xš\ÇQñf¤þeÎ‰¦¿Ú­l\æ\ç\ìðj\Z…·ü}]Y÷´?\è?Jòb\ï;\í¦¾š]_¥Î“\Ô4	øo\ÃðÅ¨8\"³O2\Úo±Ák-\ä\ßóýöùvµ\éön˜\â¾cøñ\ã\ëJo\ì+Yž8]ÿ\0|¾sÿ\0\×úb¾°·\Òo5+y/5É·HðùŸfC\åEoÏ¡\ç\ßü\æ¾/ø…ð\Ö\Î\ÏX\Ô5-S\â•k\Ì\ÞdÉ¦\ß_\êC\Ó\Èÿ\0Fÿ\0Ÿþ¿~0\ç~Weø\íª·\Þ\Î÷›aV]\ß}<\×CœGôÿ\0\'?¥{—…üá¿‡¶\Ö~(ø•j—\ÚõÍ´7ž\ZðmŸ\Ú?\ã\ßUñ@ÿ\0Ÿ¯ù{°\Òs\Øh\Ö‡að¿†n\áÕ´]7Sñ—ˆ-ŸÌ°Ô¼Om•\á}2óþ]õ[oýªö\ïRº³ÿ\0—¶^ý‡ŸùW?\â+ÉšöóV\×5	µ-jýæ¸¼¼¹“Í–Iýý?Nõ\Ï¥ñyi\Ñ\ë\Õi}ô\×TÖ’ÖŸ>ý?\áŠ>*×¯üIªMy\"¤0»þ\æ\Úò¢Ž\Äÿ\0ú\ë\Þ>ü1—X±þ\Ö\Ô\ãµøöM™–\ã\ç\Ät­O…?f¼··ñ‡\Ä\Ò\ÃN™\rÆ› \Ü\Í\åKqü|[\ßj\ãþ]­z¢\Ç÷¥}}\âK.³\Ðm\Òd…<¸b°µò­cö~qøu­\ã›ù/\×úòfg3®`ü3ðÎ¡¨I\Z-\ã\ÛM²\ËW›§=JüõÕ–\ê\ì\ßj+³^¼\×\îxÙ¯±<]\áwÇ—P\Üjº¥ž—§Ù¿™±#žþ\êAÿ\0’Vœ{~U“ð¯I³»·¼’\'Ö–\ÛCm«Cö\\“g>}Í¿ü¼út¼öú	©	O\ÝI(¯Moó[=¿\à\r;4û;ž#ðw\á-ôÚŸ\ÄoIý‹\á7ý\"Á\î_\Ê\Õ<G6qÿ\0ûqÿ\0\Ú^\æ-\ÇýC»W§x\ÃXñ§Ž.#\Ó|%¢ß¦‹lŸg…þ\Íý—¥\Û\Ãÿ\0N÷?Qü½«Ý–;\ëë•›T’Ù¤Dò\Ów‘û¿úaom²[‰<V\Ä?e\Ü\ê$ó¤Cüoô\ãÛŽ Š)Ñ8ò\Çf\ï\'\ÖOK¶\ï\å§`n\ï\ÑYy%²>G³ø+«]Ik\Þ%Ò¬\å¿l¾~¡,|Û—ô?Z\î4ÿ\0†?ôË©G©k\Ó\'\ß{—û-‡·ú=·§_¨¯pÕ¦\Óla\Ã\ßtýmó\Óü÷\ç÷^\"ð\ì\ÑIpöw1Xÿ\0\Í\Ì\ÐZ\Å\'ý{\Ï\Ïÿ\0_\ëZ(F\éZ\í\í«ò_×¨/\×,ükqö=?\Ãz0¿\î\Ò4°ý\ïùxþX#ú\×eªx«Àw’_hzmž±c<\ÞbU/¯þ\Ç\Æÿ\0iºû%µ·Oùsü+º\Ö<e\áU£\Ñü\'muqÿ\0,\ïõ›™\åŠ>\å\Þ\Þ\×\ì_iÿ\0·\Êó{\íKPÔ™Zú\êI•3\ä\Ã\î­m\Î\å\Þ\ßð>ýþ\éE¾f—2\Ú\\©Ë§W~Š\Û\çf\âî–—]ªòÿ\0?#\Õ,~;x’ksý©¤\ÛYÉ³÷0\Øyÿ\0¹>\Ë\Ï\çÞ¹}{â·Œu«²µ\ä:]«¡ó“J‡\ì·Rÿ\0=õøûÿ\0§/°þu\ç\ÐýòªÌ¥‡\ç\Óóÿ\0=j\ïd´z$»6ì­§\ç\Ú\Ïs79y/—ù\Ü$‘X³nv‘ÿ\0x\îÿ\0½—¯?\ç\ëƒUYŽXu\Ïù?\Ì\Ð\Ê\Ø?7A\éþsøþuo›þŸ­.k­·v\ïÛ¦þòH$<6?\Ïlþµ^_\âü?¥L\êOû\Ã\ßÿ\0¯Žùª²6Ó·8\Î\Øÿ\0=k#t¬’\ì¬U•s\ì\ß\Ë¨\éÿ\0W4d]­õÿ\0\ë\çW›§\ß\Ïô÷\äœ~5NE\Ý÷r=?ð\í\Í3\ä\\{\ãùò?Z§&\Üó|ô\Ïn½ñþzÖ„ˆ1\Ç\0ñøõ¿\äV|~nCõ\Ïõý(>o\âë··\\{~9õ\çð¬¹•½}N®=¿O¥lH\Ü\Çüóõ5FDÀû\ß\Ó\éŸ\Çÿ\0\Ô{\0bÈ¼±\ï\×üþË½g\ÈÌ¡»\ë\É\éü¾¼Vµ\Âý\ì}\Üõý±ž•›6\ï»üX\ç?^xÿ\0\ë÷\ë\êž\Ò`z~¤ÿ\0Ÿòj»;1\ÜÇ‘úT\Ó+d°m¿ýn¹\ç\ëÚªÉ¹B\î\á~£×žÿ\0\äþ\0\Ö|n\'ùŸó\ÍS“ü\Çþ~g\ãR;vøÿ\0®«\Èÿ\0xcß¯\ã\é@\än~÷®y\Ç?§\å\ÛVGù~Sõ\àÿ\0ŸÂ¦‘ò:{~}};Ul§‡\äóóÒ€ ˜\î?\Ü\Ùÿ\0\Öüúô\â¨\ÈÊ»—\îûzÿ\0ú\Ç\è{Õ™$U\íw\êsúÿ\0‡8\ìk6\á¶ö\Ëq\íÛÿ\0VOjƒJ÷v\ÛúüK\Ë#m^\Ý¾”VR\Ü\r«óv\Ýô¢§’=¿þf§ô:ºl1Üº\Ú\Ú\ß\Ì\ßó\Ù\Óô÷÷­f\Ó\äX>h_w_ò9\Ç5ñ\í\×\ÇÏŠZ\å\Ó\Úø_A†\ß{ùhð\Û\\jrÿ\0\àE\Îlû{*’üsñ“-Ç‰¼Q¤\Ú\É÷\ÒkÏ²\ç\Ûû>\Ø‰\í\ÏA\Ñvö‹~›n–Ž\Ú\ïò0\å}l¾w\íþr¹ô¶©yªŸµk\ÚVŽ¿\í\ÞA\æÿ\0õ½+ŸµÔ¼2³ù‹«jzõ\æÿ\0ùsŽ(û~?þ¯J\ât?ƒ~\Ñ\Ìs\êW\Z—‰/ºüü\ÚùÃ¯ü|óú÷¯H·\Ðn–/\'M\Ñá°„ÿ\0­\çðÿ\0>ý«^¶û\ïú!\î\Z\Çfi¯\ì\á\àþW\ç\íþ>µ\æ#\Ò\ì4\Û;}?Îš\ê\æóÍ¹}ÿ\0j1CoÛ§üýœ÷\æ½f\ë\Âw—´m©Ck;§\ßD72\Çô·ÿ\0<õ\í^G\ã\Ù\ÏÁ~ {[\Ï|@ñU«[$\ÛöjV:\r¬Ÿiþ]ÿ\0/nõ¥\'Ô‹›qI\Ý\Ùs=<®¿2d›‹KW§[u>3ø\Écuªi\Ú~Ÿc¡\Ù\ëW—7“F–Ú–±ö\r.Ìˆ?\×\ê×´_´\Úý«\ìÿ\0\Ô_0\Íð¿\âd+º\Î\Ïö3ð{$&I>xs\Åòý?´®µ¿´\ÝzŸ\ë_¤\rð?öW\Òf\Ù}®k\Þ\"¸G?¹‡[šX»ñþk\ëøN\ë\Ãÿ\0~\0\Ì6øg\á\njLÿ\0ò\ÛR}V]\ã<ÿ\0\Ë\ÖZ\ë•z7M{K\Ù\'ª\ÙY¯Š2\Ù\ßkm­\î…K\ÚSœh\Éós\'.i4ô{\ÆQµµõz\è~5½¯\í%\'¬u«?Ž\ß\r<\'â‹›m4M\à?üð¤Z¥¼\×7\ßg¸ŸP\Ô.t\ì‹k­#J¸ÿ\0Oô\ïøö¯¨>\Ã\àÏ„zˆ,n¼i¬|Jñw‹|g¯x\ÓÅ¾6ÿ\0„&K®k\Þ û7\Ú?\âQmþ‰¦\Ú\Ù\Ú\Û\Û\ÚXZYÿ\0 ÿ\0×€úkcð3\áü\íº\ãá€4øÿ\0\ç‹\éS\ß\Ý\ä\Í\Ð\Ç_ó\Ùþ$ýŸþ\nø‚\Ãû/ÄŸü©i{<·°¹ðí‡•!\É\ãýý¯šÂœ\èFJ\í’V\\õb\Ô\\£iJ\n7å“‹\Ý\Þ\Ý.ô7©Z­Jr¤£BœengNŒa)(¸\Êr‹Œ¹!(\ÝE5{µ{žþ&ø±ðª\ê\Þk?h/¨\é¶\Ïö‡‡\ÅVþ\Ëó­ÿ\0\å¿\Ùõ½S\ìœ\Ï\Ýs¾øùð‡\\¼¹ð¯\Â?\èú\æ¥7\î\îtO†—ž\Õ.¼\ëx¿\Ú5\r?Á?\Û_fº³µ\Ïú^±ž‚¾šÖ¿\àš°Oˆ¯úûö,øª]A7\Ú\çˆ|7}-¬“\ÓÆŸý©ö;žÿ\0è—Ÿ\è=«\×%°øð‡\Ã\ÐøOÁ¶þøw\á»4ò\í¼ð»\Ã\Zƒtx\ç‡ö†\íl­=ûg\á\ï³\ÆSWp¤Ü¿¾\ì–\Ýy_šùvg±“w”Õ¬•”Z½·¾½}4\Ôùgþ/ˆ—\Æ\ÞeøC\âU\Éö¯‰ô;	Aò>\Ïþ‘oŽ\Þ\Ù\éùxOÇÙ·\Ä|9¥ø\ÅZ/\Ä/\Û\èž$‡\Åwþñ\'…n®£\Ôtû›{´[\êZ^µiskgý¡qþˆ,¸Ï¯_ª5\ï[ü\Ñ\è±\Þm~“\\\ÍûÞŸ‡O\ä8\ë\\}Ž•\â\ïO\ä\ØZ\êW\Ò;ÿ\0\Ë?Êúc?—\åY<t¯eN\Ý}öºZ\Þ÷\Ë\î]Kö1[9§\Ý8ùox¾\Þ[¿+~y\Þ~È§þ	<uñ»ã­žž”÷þøeu§\ÃoöŸ\Üi÷\Zn—¢\Ýÿ\0¦øûûoüyÄ¿¯5êŸ³_\Â?þ\Ì>	×¼#¢\ë\Ú÷Š&ñ·±ª\ëz—†\à\Ðn¤š\Þ\Çû>\Þ\ì\ëk«\Ñÿ\0/ñ÷õ\éÖ¿P<ð6\ê\Þ\Ùfñv¥\rº¹ù\ì\á›\ír{o^¼b»\ïøTž¾o.\×À\Zn¨\Éÿ\01-z*\Ö?úo\ïþqZGkóSŽª\×M\Ý^Ë­\í¶¶Ü—FViTiI©I8\ÅÝ¯N[zkn–\ëùþ¾7ðú•\Ý5ü-\Çü¸Oø\Ð{}k†o\nüPø“ñCLÔ¾\éö\Ö>³ð¯\Øõ¿‰\Þ*\è\Þ\rðü\×\×7}¢\çý/[\Õ1ø”h\âúûþ¼y¯¾üU¡ü\'ð:2\Ç\á}\Ä LÈ–p\ÛOk \ÙÍŒŸ´[ý«ý\'ÿ\0\×\Íqvº7Ž¾(j6òjMo£\Ãû»8>Ë£ið\Ï\r?O¶ÿ\0D¶ÿ\0\ëš\ËŠ§Vœi4\ÛN\îW\Ú\ÝW\æÿ\0U:nœ\Üùù®­gv\ëwù~·Ó¼h\Þød\×ú÷‰5Tû?ˆ~\"\ß\Ûµ\ísþ~,t{{oùôút²ÿ\0Nÿ\0 Ž¡}Ò¾šø[ð\Îo\r\Ãý±\â)>Ñ®^\'˜»ùŸc\à\Ç\Çý=œWQ\à\ï\è>	´¿Ñ¤¾\Ùó\Í7ú\ßñ\çüz\àÓ¼Iªx’ú6\Óü.¶¶>zfm{R?\êúc\ì\Z~~×þ·z\äŠ{\Ëu·eu­–\Êú}\ß3S\âg\Ä-#Âº|–«qöJo¹gú\é=9\è{õ÷¯Œdþ\Ðñ6¦×—‹4\Ó;þ\æ\Úó¼¾¯\ÓzWÓ–?t6ºþ\Ññ\æ±\âmIÿ\0y3\Þ?\Ùm|\î\ß\èö\Ýþ—¿Ê½\"\ÇE\Òô\ØV\ßM\Ól\íaO\à†\"úô?^9?^\É\ÆRz·ši&¼\ï¯õ`>O³ø{\ã\rJ5Ž\ÏO¶\Òa|;U›É—ÿ\0\í¿\Ó:¯¯jôü\Ñôû»}[\\Ô®µJ\Ù\à¸Dô].9¿\ë\ßþ^{ÿ\0\Ç\å\æq^\å$7Ø·PÆ¿\îõ»pNy\ç>\Õ\n\ÛÃô\ÍNi¼±üºþŸ‡\ãëœ¿gªþºÿ\0º\Íåœ~v¡pú„ŸÀŽþl9\àoþµs·w“jvþ]œsZùI¡\æXúÿ\0.ÞŸžzi—\Ãøeš?9Sœ:y¿\á\íŸÃ©¬Ù¼Q¢\ØnŽ\Þ\ÅþOóø{Ušº„jaºWº\\}ôIÄ¼\ç§ø\ã<þ5zóO‘¢\Û\Ï\à¢oó¿¥r·Ÿ4˜Q¶[\î“>XO´ÿ\0ú¸ÿ\0<\ç\Ä\ß|hº\ËC¤\éöm&\ã³÷?j—Ö“”WUùþ@z„j°ùh[–—þ{lób\ÏóÏ¯¯^jk­Z\ÏK®®$‡O‡½\åûþöOúö·ñótzö>œ×Š\Éñ+\ÅW1\íó!µÿ\0r%–?óþx\Ír7×š†¥qö\Ëë‰¯.2>yŸŽ¸[ÿ\0Ï·4\ÄÝ“}Žó\Ä&¼y \Ò\áò\ãÝ½ý\Ú	n¤ÿ\0¯x?\å\Ûñ½+\Ìn$š\âC$\Ó<\ÍÏ—\ç?›\åÿ\0úúÿ\0J™·\á\ÓúQ´²ü\Ç\îÿ\0Ÿÿ\0WýzJ\×k_ø\çùö&ü\Ê\Û]7\ßfŒÖ‡•þ,ÿ\0O\çþ{T2B\Ü~Ÿ\ç?Nÿ\0…tÏŽ7\ãòþ¢£’Í¹\ãóôõ?—\á\ë\ÅD¤Ö‹®·ûú[’=¿þg2Ð•<\ãþ¾ý¯cúf«\ÉoŸ÷ºÿ\0>ùõÿ\0õWQö5_\àO©?\ã\ä*œ–¼·ÿ\0[¹õþ¿5›m\î\ïýÀ‚¾®\ë¶ß\ÎnX[Ÿ›§\áøþ?‰þ•|§•\Ëu\éþ½óšè¥·f\'jüÝ¿–=}†8ç¹ª²Yº\ßQ“ÿ\0\ëÿ\0\Z/\é»wë­·}moÅ”’[#\ã\\m\ë\Üûzzó\×ôöª\Ï\Z\à}¹þOôõ\íZò[\í9ÿ\0óô\ëÓš®\Ð\ãøwÿ\0Ÿ§ó¤3Eÿ\0g\Ü\ä}{~y8üjŒ‹·\æû½{\çô<ú\Ö\ä\í<\ç\ß×\è9\ë\ïŸ4x\Ý\Ðsóý?žyÿ\0õP‹|#þG\ëT$Fþö\ïoó\Û\Ð\ç[3\'Gaõ\'’\reÌŒ»vü«\Û\×#üŸÇ¥\0cÈ»yû½OÀŽ\ß\ç\ëTdùJ\îþO\×\ÛÚ´&ûÅ¿‹\ë\íŸnøÿ\08¬ù•}›\ßóÿ\0#¡üÀ(\ËÕ·\Çõýÿ\0Y¬Ù—v\ï\â?\ÏÛ¿\ë\é\Ïptf\ÏÍ·¦O^¹ÿ\0õõÿ\0\nÎ•ŽJÿ\0œgÿ\0­þ{\0g\É\ÇR>Nÿ\0\ä{ÿ\0‘\Î|Ÿ\'UÝþ·¯¯ù\ÍhM·6Þ¸úþ?\äzó\ÆlÛ›ýŸñ\ç\0÷ü§JI9?\Åùÿ\0þ¾¼\Õi\åf\Êÿ\0z{÷«O\Çý¼{~=?¥g\È\ÛIþôþ¥\0Vf\Ïû*Ÿ\Ó\ßÓ§\×ùÔže\Æ¡ÿ\0\ëþ~=>“I\'\î{ûõ\ïoQŠÉ¸“h\Ü8\á\ëÏ¹ý(-\Â\Ýw\ÛN½ý{ô+\Í&\Ð~oó\Û\Óøþ¼\ç\Ép»|¶\Ë0\à~]ý¸ÿ\0\ëu¢\â\ávž}ùý8ÿ\09þX3]™~~:l\ã¿ù\íù\ÐT•­ª\ék_o\ë\Ð\ÚRûW‘÷Gñû}(¬¼m«óvžŸZ(+^\Ë\ï\äK\Þ^‹¥–Ž\Ö8m\ãOùcim¯\ãþ™¨ùf\Þ\Öz|\×ô\Ù\ÓÊ‹ð¸\é\×ñýk\Ë5\Zx£R¸’ø7;\ßþBZ\Øóxÿ\0žÿ\0ó\é×¯o¦kž\Ô<ñ\ÄE—\Å0š8ÿ\0\è¥?•póÿ\0.ö\ØþU»ml¯ó±\éš\ß\Ä/øn&m[\Ä\Z=™O¿mi\'ö¥þ\ë\Þ\Ûüþ5\á~\"ý¡Žù-|9¤\ß\ê“ò\Ò\çX*.\ä}ŸO\Ó}?\éòôÃš\í´ÿ\0€~#mRKÙ”3c\Ïû\Ùf\Ç~qüús^™§xGÁz—ö=Áx\Ù5\Ì®\Ïý<ñõüóÞ‡\Ìú¥ø\ß\ïH“\ã\Õ><x\áCYÿ\0j\ØØ¿Ü‡M†\r\Z\×ÿ\0’ñþ\Ôhÿ\0³¿‰µGK¯k\ï\Z¿ß‡\í3\Ý\Ý\àAÿ\0õúúW\Ô\ÒjKUµŽý\ÄD\ëùûv\äþT\ák¨]\r\×y1ºs³÷R_þ½%\Ö\ïúþ¿\0<ó\Ãÿ\0~ø_k-¬:…\âq¾ñü\ß\Ïð\ãÛZô\î*Ã¤X¤ÿ\0\Äò¢\ï×¯§\Ð÷«Vö:m™Ý·Î›³ò3ùžsŒœU[\ímm\Ã,1¢û\'\Çõ\ãüª\Él¬€°¶³F­5\å\á]\ç\çMÿ\0¯‡^{\â¸\ß|@\Ð|8¬ª¿j¸\Ï\Éÿ\0-x1ü°{ö¬\ÝIu\íp´w\Ùa\Ç?_ó\×ó\ã¥f\Úü7±‘\ã¸Ô§’\âN¿¼\Ç\çÿ\0¯ßñ\Äoø¢F³\Ò\Ök[W\Ï\Émû®=\Çq\Ïÿ\0^¸\Ý3\áoˆ5«…¸Õ¤tóŸ\ç\Þ|\éxÿ\0\ëúr}³_aXøWE³hã³´ó™þÿ\0’þúqùzWUzn›úEÅµžÿ\0ùbþ•ÿ\0€øÿ\0=:T(\ßâ¿•\å\ÊÀ|Û¤ü#\Ó\íL+Š—\'?l¿Oõž¿\èÿ\0—^û×¸h¾’\Æóš;dÿ\0–6pAk\Ö\ã\Çùc­j\\k\Ëe\Ò\ì÷ùü¿óü®¿óïµûÿ\0‘\\½õÆ´<½[R¼º‡þZY\Ù\ÍöN?\é\Þ\Ûc¦;tªI-¾&ø‘\à\ß·\Ù`a®jˆ\çe‡\ïa?õñq\Ü,W—\ßø›\âgG§\é7:F–ÿ\0s|?`‹\Éõÿ\0I\ãú}kØ¬t\'K]º~Ÿa§ÿ\0\Óhm óºÿ\0\Ï\Çù÷\éW&6\ë÷¤y›¦üsþ#\×Ú“Wz·n\ËO[¾·ô\Ð	\Ò~L\×?\Ú\ZÖ¡\×g™±1u\ï\êqü{>›¤\Û\Ø\Åq¬Í±< wùQGõ\éþG­Y’ò8F\åTýÿ\0\Ï\ë\é\Îx\ÏO\\»\íz\Ò\Î6–\â\áŸõiþ¶O\Ãüƒ\íG»+úÿ\0]@\Þo-p\Ò2/?>\Î\Î>µ4cørqøÿ\0Q\ï\Ï\å^S«|J\Óô\é\ZdF“ ó\Ïú\ãù\ã½q7\ß/&\Ýª¿wbp?Ÿ\×ÿ\0\Õ\Âu\"·\×\Ìi7²>„kÄwI41\Çþ\Ûõ\à}01\\Æ¥\ão\ré¡¾Õ¨yÌŸò\Î\Ý?\Ögüò+\ç‹\Ïk\Ç÷\ß(\Èùo7üþ=}«™¼[‹‰\ZF\É\ã\äDÿ\0Wüýk9VZ¨ï¦»\Û\åtµõ{’]¿þg´jŸ\Z´›r\Ëc£Ku³ø\îfò»ô®.\ë\âþµ~\ß\èzn›oÿ\0“\Îó\æòýþ¿Oc\\d:1t¾’\ÛOÞŸ\'\Û$ý\ìÿ\0×¿ü}ÿ\0“\\Î¬ºNŸv°Ã©[G3˜~I¥ŸÍ¸ÿ\0¦ÿ\0g¶ÿ\0Kÿ\0?ž51p¤”ªT…4\ÚI\Îqƒ»j\Ê\Î\×\Ö\Û_\ÎÚ•\ZS›j1”ž¿e-­½–‰ôo³\ìvº‡<U}¿\Î\Ö!µñòY\Ã_þ¼~ƒ½sþuõü\æ_jW™ûÿ\0\ë\â†.¿ÊºŸøûRºk;\ËXL\êo û,·üÿ\0³ÿ\0Ëµ®\ã\Ãþ_¯È¯CµðŒ\ÒGòÇµc\ÏÈ‰ùý½G5¥6\êG›x´¤•¤›VV¼d“W\Ö\×Z¯Bd’Óªvz\ß[/óþ•]%d\ÚYA\ãžz~ý}kR\ßK\Ûò\Å\Z\"¿÷\Óüþ¼c¿±\Ã\à™3»\Ëq‚c;\Ð~\è{ýzþFý€\ÚQóHa\ëü\çÿ\0®nß•l“[E\'Ý»þKü·$ñ;}%¾C·\Ð|ŸOóõ«’i¦1ó+\îú~cô\ìy8¯ !ð,qý\Ï\ÞH?¾œuý3þzU+Ÿ\n†ûD?zD!LŸò=3Ï¥6¤\ÕÖ–\ì\ï½+mó\Ô\0]=‹n\Û\Çõÿ\0<vãŠµŽÓ€»©õü{ÿ\0Zõ…ðúB]<·Ú¶}zg×¯\éU\î4UfXü\Î\ß\'Oó\Û×·j…\Õ\Ûñ\ÍZ\Û\åO›ü\çÿ\0\ÕUd·l2¯¨ü1ž¾™ÿ\0#\Ó\ÑA¸a¹\áÜKö\ïÛ¯8ü~µNm\r•r~ö:§¯ù\è~ƒ¨¥%f\×Eú¤M¥ü\Ë\îÿ\0ƒý]ù[\Í\ä·lz}}ýÿ\0®{V|–\ì§ýžýñøó\Ôô®\â\ãM’3µ—%?¸yãŽœÿ\0ŸZÇ’Õ°\ÛUøû?\ÎGn\rIG&\Ð\í·\æüºû~?þ®*³»§ôü³]$–\ç,r\ÜüŸ\áÓžµ^K•\ãŸ\Ç\ëý?\n\0\å\æ…X}\Þ{gÿ\0\ÕëŽ•A‘”\àŒý?\Ïÿ\0[Þºy!ùx^¿L\ç·Oóß±5•4{Y¾_—·\ÓÓ¶y\éZ\0æ¦\ßo\é\ß\×\Ó\Ó\ê}k.h\Ë\0ÿ\0\ç¯ùþ®’eG*ûÿ\0õ‡_OÆ±\î#\ÝüCúc\Óú\Ð?4}¾¼Ã\åƒÿ\0ë¬¹£þócüõýZÞ‘s\íŸ\æ?\Èýk&\á7q÷\Øtú~\ç?P~\áW?w>Þ½=¿\Î>€e\Èü\éõ\ï[’F\ß7ùþŸýÆ³.hÜ«ÿ\0}ÿ\0õýþ£Ö€1¤ù\Û\æ_óŸ×ŸAŽ•Fh¸n>o×¿z\Ôœn\Ï=O\Ãÿ\0\×Y³|¾ø\Ïô\Å;i6¾\ë˜3ÿ\0žú\à\Ö|\ß;¶ÓŸ\ç\Ç­hM2e¿‹·\Éþ}O\ãß½cM\"¨cþy\ãõ\ë\ë\ß€‚fü½}‡ó\ëX÷,Ÿ›ûþ]ý2}ñS]O³kr\Þ\Ý:~~_Z\ç\î®3ž>Wÿ\0#ü\çÓŠ\0&›\å[\Ûùóþ\nÍža·ql·÷?.ž¿ýoÎ¼\×|£ÿ\0\Ç?NŸþ¯R1ut¨Û”¦\ß\È~¿—¯\\ƒjÍ®\Ãn.6Ÿ™/ÿ\0¨ÿ\0\äW?wyµö«?\Ëüý\\Ñ¨^mù•¾½‡Oó\ê~µ\È\Ý_*¿\Ì\ÙQ\Ç\ëúÿ\0ˆ ¸-o\ä\×\Ýoó:5º‹jó\'Aü\ßJ+–]JM«û¿\á½¨ \Ðþ«®.#Y\äTùW\ÜDò¢\é\ÛÓ§ÿ\0¨\ZË¾Ô¤·_/M·…®Ÿø\Ý?uþ\êI¡ºó^\ãR’\Ú\Õ]¾XQÿ\0ý_\äzT>tjûm£@¿\ß?½\ëž=½z\é]9N6ñÀý\ã[C\'ûžžŸþ¿ñ«\Ñ\è~kyš…\ä“ÈŸÁŸ\ÝgüóùÔ‹7˜\ß\Ýwþ1ý=*B\Ò\îUd\éÃ¿=Hÿ\0?•\0iFÖ¶h«cýþþ£ùžŸ^j¦šAµ\äÇ¶ÿ\0þ·ÿ\0*¬\Òù#\å]\Ò÷\ç\ëÓ¿\áU&la\î&Û¿ø?\Ö\Ë\'ø÷8\ï\Ï~þ\ÔbI›ý^\ï¢lúOó\ß5],\ã“÷“¯ý÷ÛŸó\ëúf«ý¢lmµ´†ÿ\0ò\Úó÷²÷\ëoüÿ\0\Îj\Ï\å·Í¨]MuþÃ¸Š(ú\Ë\0\Ï\ã@¤Õ­`-œh¸T\ÏÈžo¿ÿ\0¯½Q[‹©µÂ¢\Ë\Ý._ýWý»ÿ\0?a\Èô§6µilž]»\"ªq:_ÿ\0]r·š\ÛM\'Ê›qÿ\0‘=x\çÿ\0\×ù\Ðm6¡$‰²KÉš?ù\ãý–/\ÎÛ·ù\Æ\rU[ˆc_1U#R¹ûÞ½zóŸn•\É\Çqpvùq¼Œsòvÿ\0?Ê­-¬’’òg”»\n~\ê(ý»Ÿ\Ë8\ä\r\Ï\í\Ø\î|\Öö“÷_Oóô\æ¤k\É1ü\ïþ\çlOþ¸\ëY¬\ÑÆ»v…_ö?\Îý}8\é™y}\"®\È~Vþùÿ\0õñ\ß=?JM¥»·õÿ\0\r+\íbVX\æ›÷\Û0?ÿ\0_Ÿó\ëŠ\æ\æ×™\î÷¯û‰þHü,ó\\v£«iºyf¸ºó®\\pˆþmÜŸ\áüÿ\0ròk\Zµ\á“\ì\ëöWûùÇ› ý?_\ê1“ª¢\ìÖ½Rw·®ž¾©|†•ÝŽ³VñL6©#Muµ“ª#™n‡¯©¯3º\×õMY\äò—\ìñ¿ð\'\ïfõ?h¸\ï\ï\Ïj\Î\Ö9¤™·\ÝJŸ¼t™\Ï\Óþ>?Ÿlþ•nõ%±³ûUä¶–6»ÿ\0\ç´±‡ý<\\ÿ\0Ÿo^Y×½Û’ŠJò¾\ÖVÕ½-d\ì´\ê\Ó.1´•÷è–­¿%\×“)ý…cvk‡ówó?{Ÿ\Óó§5\ÔjV8c;¿ýo u\ã¯\ä+\Íõ¯‰\Z\r\ì\Ú_Ú¦ºÔ¡¶þÐž\Â\Î\Îú\ëË³?ñ\íÿ\0Ö··j¼\ëai×®kD›\ã\ÄI¶\è\nüm¢øw\Ìÿ\0÷ˆ_Bð•„ñûÿ\0ôS\í~¿ñù{\Û?\Ùü\×±ôy½%:õ[\å\ä£	Ô³\Òü\Þ\Î3’Jú¾Gn\ÇDhN\ÊRŠ¥“¼Ú‹³\Ñ;6®·½›ô»=\Zû\Ä\Z^ž\âa},?y\äCûÛ¯óþsN\Óuk¦\Ðt”\Òô\×?&½­MöX¤Áÿ\0—´ö\ëÿ\0}kh¿ü? ¯\Ú<Q\â	µ7\Ùhÿ\0oKÿ\0°…Í­–“mÿ\0>vWßv\Ö-£\Íp\Ñø\ÂÉ¨O>gö—‰&Ÿ^–\Þù\ïöù\Ûvÿ\0—.\ÇZ\Ò4qµ­*•\É\é\nj1ŸM]Gy/%\î\ïukC©N6\å\\\í?‰¤\âÒ³²‹\éóg/k\á+]B9®5-SUñ\0O\'\íŸ\Øð\ÏŸ\×ýEÆ 9\ç?óû\Ð×¡xwÁ6³M\Z\éZ=µšþ\ç|‰\ïzñþ‘ü¿Â»ÿ\0\è·\ÚÐ†MsPy-\ÓýM¶\È\"µ·\ãþ]ôûoôKn ß Ž¡}c¡\Û5µŒ~[l;ß·_\Ävÿ\0=ú©apøyûE\Îj+ß”y§­´\æ¨\ç-R\ï«êž†R«9+^Ë´}\Õ\Òÿ\0.ö\ë{_Kkz6¾\ÓtôŽn<É³ûýŸ\ê½ýu\Ö\Û\Çg\Zª¯“óýü{v=¸\é^8\Úò\É+4­¹»ü\äù\Ï\ãÒ©\É\âÏ–8\Ù\Ù?ƒcŸ\ÂóŒ\×g´]Sùkþ_×¡™\î\Ò]Z\Æ\Ûcÿ\0\äzÿ\03Ö´¬ciÏ™\"¢¯\ç¿¯¥xžªI\æ«M&\ïŸøÿ\0cñ«¾*øo¡\Ù}ŽÕ¼\É\äþ4(\ç\ëWÌ’MõIÛ¨«©kZn“³M\"+!\'\Û_\çÿ\0Ö¬ûY-\î­c¼2F«3ùGùþ•ñ…÷Œ5}{WµŽK§ò\Þo¹¼ÿ\0Ÿ^\Õ\ê3x’k·³YvGc\ç\Ç\Óô\î=9¨U\î\×O×¨BZ\Ú\Ù\ÝLÑ¤‰”ý\ç\Óð\Ï\ë\ÅG¨G£Ú†·¸di¥?\"Cþ·“Ÿ\Ãò\ë^Ce\â\æ\Ó\í\Ze“Ì™\Ó)³ðü»u÷\íZž’\ï\Ä\ZÔ—\×Á\Ú4“Ÿùk\íÿ\0\ë\ÇÖ“\å\É\ßßºû·óÓ°‘q \É\r¼e\\3óóŒ\'ü\ã=z{W?}\áû‹h$šE\Þy\Î\Ïþ¿·½zdÚ¬Ó¬j\È\Ñ\Â<´OLž1\ë‘R]C\rÕ³|Ÿ3ý\Î\ß\ç9\é\Ç\éUÈº¶ÿ\0¥þ_w¥Àù¶ÿ\0M•S\í»Wû\ï\è?\Ï\çøW2\Úpa&\Ø÷s÷ÿ\0\Ãöö¯|\Öt9f¶h\ÙaDó=ÿ\0–3\Û=ÿ\0\n\áu\r.;Z5ù[ø\ßóü¿#\É\â³q’\Ýiÿ\0\rýZ\ÝX\Í»\æ\ìsåŸ¯\ãY7\"_»µ¿\Ïù8\Ï\á^¤\Ú?\Úbueóø6õ»}¯Nk™ñ6Ž\Ö0®\äq¾?3\çO+ü\ÏZV“\ê­o›\×ò\ÏZ\â6Ü»=?úÿ\0\çó\æ³\æ]Û¾aùÿ\0ž;þ½¹±±½?Qþ5b\Þ\ÜÍ»úþyüýqžÆ¼\Ðñþx\çÿ\0\Õ\î8\ëYsD\Ý?Ï¯\ëð\Ï5\Ø]Y\í-»\ßÿ\0\×ùc\Û8¬{‹uSþ÷\ï?.½½ÿ\0Ÿj\0\än!\ã\î\á¿\Î??\ä8\íY2[…9û\Ëþ—ÿ\0_±®¢hN[vó×Œ=³\Ó\Ð\ZÉ¸Œm\Ûü^ÿ\0O_\Ç\Øñš\0\ån©[ý\Ìq\í\Ð?ÿ\0U`\Ün\É_ó\ßüŸ©®¢\éxo^Ÿ\\ÿ\0õÁüë—¸U\ÏÍ–\ì^IúP-\Ç\ÊÛ—\é\ëÁ?NŸþªËšE#¿ûþ¿óÓŸJÒºm£g¯ùý?\Ïj\æn¤h\Î\î\Çß¯ø\ä~\ã½\0Sº“\ï}?Oo~9ú~X7m}÷yœ~}¿_Â­^\\.\Ý\Üõ\ç={Nõ\É\Þ]b¡‰dÿ\0>Ÿ_¦zu4b\â\à²nn\ß\íþ\\ó\Îú\Ü\Åõ\Çð\îù~Ÿ§\×üõ¨Pó<\å“\åò_üþ£\ÜW3ªj\\r6\íª>;ž‡Ö€/-\â\î’“\æþ_ÿ\0«±\â°î®™£‘[büÿ\0\Ç\Ïù\ÇO_\åY\Ú?4rÿ\0\íö\ãúvÒ¨\Þ]|²4¬Š¸óoÿ\0=ù \Û\ÍR5ùZo¹Ÿ¯ùü}k‹\Ô5ˆ÷:«&\î>\Ïúž\ßýz/#¼\Õ.V\ßK·{«\é±µ´	þ³\é\ëÛ§¥Oö_ø$›¯]Y\ë\Þ$…<\Ä\Ñ-Ÿþ%zd\Ãþ~.?\æ%uŸ_ôƒœT¹%u\ÕZý»V»þ¶fñVZm½ûú\éþg2·º³*°³»!”0\"üFAÿ\0N\à\æŠ\é—\ãf£µp¶ª6Œ(†Ž\0\ã \n*yŸ÷/??Áö#\Úy~?ð\êòñVò\í®\'šgTs±˜£ÿ\0?‰«pÂ¬¡™|ˆP‰¿÷²Ÿ\êx\ÅC3G\Én\Ëò\Çû\ÇOóÿ\0\×üG\\Mk\ÄQ\èöR_4/y3þ\ïM\ÓbýÐžl\çý#þ{ÿ\0õë­¾T\Û\Ù&\Ûþ»™\êöWg[¹cVhc\ÛØ»ÿ\0\Ë>¸\í\Ûðý+‰×¾ hz?—ckpúö¹r\Þ]¶‰¡y÷òM\Ïü¼Ç¥·ý¾Ö¼OP\Ô<Q\ã\ÍJM6\Öòkÿ\0¼¹ý÷\Ùtm>O³\Û¢[Z\Ùÿ\0\Ï\Ý\àüEuš,\Þð:Io¥\É­®yb;ýc\È\Çó\ÂÃ§\Ùm?LVj§6±\ÙZ\ïu{\ê“\ëo\Æû-\nqµ·»Wi-µ·\éúž¡¦ÿ\0n4Ky®\\[i\Ò<bD\ÓlÍŠ\ßþ˜\\k?ñóu\Ð±ý†\ÇÕ†\Ô-T3+nÿ\0møó\ÉÏ¿\é^OŠ/¼Eªž4q¿ñö9>•·\â\rJ=&\Ía…L\×[ü·ÿ\0ž_˜_:\ÕÙ¥Ó»\ïoORMýS\ÄQ\Ú\Ç÷‡÷þO\é\ë\Ïó\É÷ó›\ïMt\Øib\ß÷üÿ\0‡j\áõŸ;w˜\Ùû›ùô\íôþU\Ùx\'ÁwZ±][VW†\ÏþX\Â\éû\ëƒü¿ýJžg&’Ó¿_\Ð\r-:+\ÍA¡ö¿;öu\ëÿ\0\ë\Ï~~•\ØZø~p²Ü³´\Ã\îwúzw\ã\ëš\é\ìö1yp„†4þ\r˜úóþsü\èµ\ÃH\ÌÊ»xù7Ÿ^ý|ç¯¨ XcŒm>_\Ëÿ\0×ŸsùV}\î¥oj¬»2}ÿ\0\Î;ž\Ø\È×µ\Èt›.®&òc|\ìù?{q7\ê1ôüJñ;\í[P\Ö\Þ0ð\Ûÿ\0¶ÿ\0\ç¿J\Îuv³ýv\Û_¼i7²;mc\Ç¶ó46ª÷M\ÓýPúŠ\ãou[TÜ¾s\Û\Ã\Ód?ò\Óÿ\0¯\í\ëY/ö5&I7³\ç\çÿ\0[¿ùÿ\0õ¿\ZŸM]c^—\ì¾\Ñ\ï5k§qþ§÷V¶ùÿ\0–ú†¡sþ‰m\Üv\ÅrÎ³\æiK}¢¢\å}¯¢O\ËGnú\Ü\ÑA-õü?R[{X\á|\É?\Ýúq\íüûc¿5¬x³I\ÑÂ¬\×q3¿”–zl?oºó¿\í\Ûþ=¹ÿ\0ŸÁ\Óò¯fÒ¾\nµ\Ôk\'5ë™™¿xú?‡Ÿû>\Â?úaq¨\Ç\Ý\Ï9õþxô\á\ï…ü?\Zÿ\0\Â;\áO‘>\æ¡smö«ÿ\0ú\ïö‹Ÿóùb¥P\ÄMo\ZI¤\ï%)Ku¼\"´ù\Éo¦\ÚW=5­Ü¬¶’{}­%þ_eü^ñU\Ì7\Ðm¼3\áŸ&i.u\ï¤]\\Mqÿ\0>\â\æ\ë\ì–Ö¶}?\åúúÿ\0œŠ£§þ\Î~¼\Õ?µ¼}\âMo\âgˆ$›\Ìû5š\\]X[gþX[\Üj_ñ)\Óm,ÿ\0\ê¢\Ø{÷¯´uh|+k!¸ñ&¬ú\Ê\Ë®|\Ó\Ûþ]þŸ^z\×#uñKEÒ•­ü?¢C\Ï\ãtò}}k7–\á¦Ô±.x§v\ÔkNS¤®£ðQN4â£§-\ïoû{F±U¡ZrTSŠ‹t£\Ë9%\ÖU.\ê9>²\æùz\Ãö\Ñ|¿øD|¢h2«©§\ÛõOú\ï\ç\ê]¿\ë\ÎË¾}kzó\áî½ª;\Ä^(Hÿ\0¿\ç\\~\ê?ú÷\È\ïý1\í\\\×\Ä/\Zj\Ì\Ñ\Ù\Éöup\ã\Ù<±Ó®q\éýk-tk\Ç\æ£yqq4žZB“y²\É?×¿\×ò®ØªTÒŒ#\É´!\Æ¯²—\æôW·S\Ûwm·\Ý\ê\Ù\Ú[|;ðY¹Ž\ÔkWšÖ¡66Y\Ø\ËL½OÙ¿\ë\ï­z§†|9¢xF\Æ\á~\Éöy¦6\æg_6/üÿ\0—›\\qÎ¨øg\Ã:_\Ãý5¤™’mrñ·÷Žþo—üø\Ûÿ\0Ó¯\Óòõó¿xº\âúIf\Ûð&ñù\çóÓ¥]\ãÝ­.Í·ø\í¶¢:\íSÅšžó‹yY\Ä\Þ^\Ï\×\Ûõú×“\êþ.³ºf\Û#üÿ\0»;&9ÿ\0>¼\Ã\ç÷—LÍ»{{\ï\ç\ÓÓóŽk\nO¾\ßZ\ÎRv»Iµ\ÙZû-w¹²¾ŽkŒ-\ÒF¿O:/\çÁö\ã\ï]Ÿ¹Ua…G\ßù<¯Ï§\ÓÛ®Ex-\Ô\ÓFXG&\Ö\Èþ?\ç‘ß¿ÿ\0®¬iþ(Ô­YGÚ¦o÷\ß\Í\ì§ó\Ç\çY\ÆIZ6iyk\ê\Þ\ß× ¥y«If\â6G¿¾\íô\ë\í\ÏNMyŽµ|÷\×2H\Îÿ\0\ç\Þ\ç\×úv\Ç\ç\Æ+¢ÿ\0„\Òy\"ò®,l.¹ÿ\0–\Ðÿ\0Ný\ÇsúcûJÉ¤ó?±\ìü\Âùÿ\0]qÿ\0\É_Ÿ\ê)\Í7kZ\Í\Ù\ÝÛµ¾\ëm¿\â?#š6_Ý·ðHŸº1÷\çñ\ã\éõ\ã§[Ë§d—\Òyg\çwÄ¿\çñ©tøtýJ\îf±Aÿ\0œ\Ã7•&?_OÎ»\Åð=ú¬\Ú^­óþrŸeº\é‚~\Ò~¸\Í:q—+\Ñ|Mh\ï\Û}»\ÇG­I*­œ…\×^¾ù\ã¦zwþ•\îþ\rÔ¯4›%[P›n~ÿ\0\Éû\ß\Ó<zö5\Ç\èï¦½ófQöx_\ä›þYIÿ\0\Öþ\Ë\Õ.cµ\Ñ\ã[%ˆŸ#ÿ\0‡ù\Ïõ¼`¹Sµ®­m\í¶«×¦Š\Ä)>nW¯ž\Ý.\\ÿ\0„Š;IwL»†~}ŸòÓ¯_ó\ÓJØ·ñÕ„‚8#‘\ã•\î\ÏL~_\çŽ+À\ïµ)®\ç–8\äugq÷ÿ\0Q\ßüžµV¤…£fû\éþx\Èõþu\nM]&Ò½\ì\ì\í;.ÅŸ]Y\Ý-õ§™tÈ­?\ï¿\è?—j¯¨hö·²®\Æ>X\Êt\é\ëøÿ\0ž+\ç]?\Å\×\ÖóÅ¶I›ý´“ÍŠ1þ~ž§ž+\Õ4Zªý¢\é¿rvûø›ÿ\0\Õ\×üóV\äšiû¯Ñ¾Ï°]5m\åŽ5û»ü·öö÷ç¿¯qT~4X\Û\Ç\á\í:ú•¼ï³¿ýø\çù\×i½ \Þ2´r\"„\ï\×óý3\Ï\ã\Åq?¯R\ri°\Ç÷dÔ¾A\ÆO\Ù\íùýµ	\é%\äŸ\Ü\×ùó=½‹Hj\îW\éÿ\0\ëÿ\0?Ž+r;²\Ç\å·\Þtò\Âvÿ\0=\È\çõ®\Ë\Ãkø\á‘W\åÿ\0Z\ïù}}?SW¼E¡ù!dò\Ý[—òr3žq\Ç\ãüóN1M6û\Ûò¿Go•ÿ\0¯ø\'‘\ß[²–ÿ\0=:ÿ\0\×Ò°\î-\Ûf[\ïó\ÇŸN9\îk\Òu\r.Eu\Û“\åÿ\0>ø\ç\ë\é\ÇN[P·\ÏÈ¼\ì\çÿ\0\çŸþ¿ q²n\ïKn­½¼üþñœ-\Äkó\é\é\Çù¯JÅº\åo—þûõÿ\0?†1]T‘.\æ]¼\'¯ùô\éø\â°\î£\ÚYUw€ö\ïŸó\Ç\0p·Ñ¶üûz~ž•\Ê\Ýtoúi\ßþy\Ï\é\é]\Õôe‡\Ý\nN¿Î¸\ÝAv‘ü=z~ŸOQ\Î=(¼cû¾»8ÿ\0=ÿ\0úüW©LW\æ?ðùõÿ\08\Î?\n\êõ	6†fùGõ\íô\ï^ªM\æn]\Ãð\ïúþ¿•\0a\Þ]·“\'û¼\Æy\ëóÈ¯?\Õ5&X\Ù\åy¾óó\ÆsšÚ¼ºÚ“)o\àþOÿ\0V9Á¯%×¯$û=\Ónýô?¼‡>˜\ãùv\í@­x¶·û•·-\Ì?\Çþ~½z\â¹Rû\äÍ¹<´N¿\äø{s®k\r¾—3?™$¶¾d\á\Î~ž\äñ\\³^j\Z´–¶66·7Ú•\Ëÿ\0£Y\ÚG\æ\Ë/?LüœóI´·vþ¿\à+´»»\Z#TÚ³}¢O\ÞBþZ\'ôþ@u\ïÚ·4­^ñDöÿ\0rSËšþ\çX[ôÿ\0‹ùyÿ\0¯OÏ¶:-\'ÁºN‚\Þx\Ú4\Ô5WO14KkŸ\ÝGÿ\0a´ÿ\0×¥Ÿ5\'ˆ<y\"\ÃºÃ§\é\éþ¦\Î\Í<˜‡ó\Çó\æ’w\è\Ö\Ú=þk¡§&«]½­\é\×\ä\\¸]ÁzuÅ¶2\\k)²óXtý\í\Æå…·{k_\Ïñ¯‘ü}pn5	nZB³õ\Î\ïþ³\éþ?Nõ\éÚ¦­%\å\Ì?67Móÿ\0!ý?\åþ2‚\Þ;™®$‘!Ž:I¦šo*\Ö\Þùø¸¹\Çòz¥f•“i«]´®ú¯Á–“é®©jû\éú_\Ô\áV\ã\å_õ\ßtw\ÇoJ+7þ§\È|[§\å~S±\ï\Êex;\Ùy\\”÷4VÖŸó\Çÿ\0‡ÿ\0\'\ëý=/’\Ë/»ú\ïùögö©­\\5½\Ü\Ò\rû]ýyÿ\0H·\è;{w\â¼÷\Ç\Z}\Â\éj—‰onò\Ù\Çs²î®¾ÇŸô{->\ß\'ÿ\0\'}ù¯H¸û=õÇ‡÷\ç\ËþÍ‡T¼ö\Ì\è\ßË·j\âþ \\\Ç6›go¸~ûÎ¼üúœÿ\0*ô%ù›»WZ\'n‹ü\Îh|K\çù3\Ãu\\}–=Eµþ\É\Ó]\â’hQÿ\0Òµ	¸\Ìú…\Ç\ëöOøñ\çµSšñ¬m–ÿ\0H™?\Ïøô¥PGßžßŸù\éY\×\ÓI{x±Æ¾k;Áo\n\'ý<p=øüsX$\àµ\ÒM«Eh•û.–Ó¯mM~øg¦­ž‡y\â+•\Ý%\Ëÿ\0£yž\ç¯\Óò5ƒ\ã\rI—l1þò\ê\åóôú\ÆÃ¥z­ÅŠ\éz—£Ç²(\ì,!’ñ\Ïýpô\ï\×üñ^e¢\Û\Û\êzµ\æ¹x¾d0¿ú/\Ï\å\Ç_ð\Åh\Þ\Élº\ë«v»³\Ûd`\Ý\Û}\Í/ü<¤‡X×£ó?å¥µ›ó\×?¿¸\ã>¸ÿ\0\Zöif\ÚY£ùU\ÊDAþG¾G\å\Æ+\Æi.#^\Ûòÿ\0Œ}=øU««¨cY3\"C)û\éÿ\0un;ñõ\àÖž\êK]ôj\ïþ\è\"\ái¤¸oÝ§\ï\ê¦?ýu\æþ$ñÕ­¬²ZØ¯\Ú$ü½ˆ?t?\ë\ãŽ\ßþ¾\àñ>1øžºµ\ÍÆƒ\á\Öt±…ü»›ŸùkqŸ\Ëý?•y\Íõò\ÙÂ»•ä¸›ýM²\éG\ãú\Ö5+\Æ\Ú|=Þt\Òß“\Ö\å¨_\âZv\Ñ\Ü\è5\rRK¢Ú†­t\"7—\n;‘¿ü¼\\}žÛ¿¥e\é³\êž(¼†\ÇA\Ó\ï.šgÅµµ´?\ë1ÿ\0-\î1\Ï\Ù}ÿ\0\ãÇ·z«\àÿ\0	\ë\Þ4\Ö|›%EhSþ&\Ú\Ý\Ï\Z_†ô\Óÿ\0Nüý¦\çþ|-<_bx7Á\Z?‚ô‘¤\è+x\Ð;ý£R\ÖõY¾Õ¯k“wŸP\Ô?\å\Ú\×þ|-,þ\Ãcab?\â]§\à\×=8T\Ä;\ë\nI\Ý\Î\ÖsjÜª;\'\Öûtmk¦’j	[Wt¢—E¥\î\ï}[v}?ð¿Á½>Ô¥\çŒ.?µ/¦ý\çöu´\ß\è\Ó‹ƒÿ\0?ö\åö\ãµ{E½½®Ÿi½¼6\Ú}²|\Ã¶±ƒ\Ûüûö¬]G\Ä\ÚN–\Z\Û\í—_Á?ó\Ûüþ}q7V¾&ñA-t\Ïgc¿\ÌKdý\Ô_\ä}8ükº\ãM5½›{¶û·ùvó0m·vt:§Ž´›\Ñ\Ø\Çý¡p‡ýxs\äþ¸÷ÿ\0^Y¯x\Ç\Ä:’H«3\Ú\Ã\Þuûœð^Ø¯B·ðŽŸc\Z\ÜJ¢iø?\é·\â=‡#\Ó\ß\èüý¨\Ì\Ò\ÅöH?>¿\ç\Ó\ß`|\Ïwu#;y\Î\ì\Ø\áÿ\0\Ö~>£°¢\ÖFØ³G§\Þ\Ýeü½ðA\æþûüþ\Ï\ëk?‡þ\Ó\ÛÌ¸±†þoúy\æ?\çøþµ\Ð}¢\ÇND[;U‡\î†\ëþ³ö~‡ü>]²·ñµ\Äe´\ß\êKn‰\æ<\×0}–(¿ð\'œú½q\ïž\Ðn<1¥Ç¬x‰¢“Ä—0ùžL?ñ\ë¥\ÃqÏ‘oÿ\0O_óÿ\0w\í\ïÎ•Çˆ!š\ámõ-r\ÏM„§™²\æþ\Æ\×\Ìû?ü°\Å\Ïü|ý8ü+—ñ\'´%EŠ={K‘\Ýú‰ ¿–Oüþ®þ\ãQ¦ù®öj\ÏÍ­oòó½À\æ|M­\\\\<Û–`þ}\îe\×üúb¼¢\îo1›\åöú{ÿ\0/ó\Ít·^*µº-\r¥\å\å\ÓE¢O\å~_e\ãÖ«Ç¥ø¦ò)u}[’\×ø\æ}ÊŠ3þ~¼u\íYós6\ï}¿¯\ë\Ìf\ÚÛ¼³\éþ{ÿ\0žÜNEó72£°\çþYÿ\0žÞ½*\ë5M7Z±…¯¦±¿†\Ïþ[M:A\ï‡ý;›¡\ÓßŠnŸ\á__Z‹\ë[4’\Í\ß\Ëóžú\Æ)|\îÿ\0‡ò\ç>…\Û\×\îôóóü»\èsym¹[l{\Û\ëÛ¯×¿\åúrs[\í\îoÿ\0=3Ÿ§n=øú	¾øº\êš\Þ\Î\ÎEóŒiV\ß\ç\ïúöþU\Íj_	üqk‹}\î•3û«k\È<\Ù?\ç\ãüþ§­C\Ö\Þ\ã\Ý-W{??/\È(·fa´ÿ\0õ¸ÿ\0ó“šÕ‚6\áÏ¿¿ÿ\0¯ñ½}¡\êš-ö5M/R±ƒø\Ú\æ\Îq\ãq\ëÿ\0Ö®¿\Ã\ÚMœ\Ón“d‘ó—I ‹·_³õ\ç\éM;¤û«€\ï\é¾Lžv\çÝ\ã\Ïõ\ãõú\Õ\æšK{–e\Ìg\Éóþx\ëÓ\ËÚ»©4‹{t†+i‹\ä\ì™R\à‡ù\ã5y\áû¥#u¾\Öþÿ\0\ê¤\à\Ë\Çÿ\0^ª\É%eÕ¯\ËüÀ\ì|3\â\ë\Èc†2\âhSø&\Í\éÓ¿\ëù\×Q¯x“\Ã7Ö«\r\ä3G7üöGƒÍ\ÓÓŸ®0}\ë\Ìm-d±³\Û\"1\Ü`>oOó\ÐJ\åõ	$‘¶ÿ\0ÿ\0Ÿùö\Çù5£÷`»»«v¾¿\ÒªmE¾š?\ì\íY\ÚMøqu‹Žý}ú\Õrû\Â:µšùÐ¯o\ÓÎ‡÷±I\ê:ŸÇŽOKó!ó6\Öÿ\0o·¾_©\í\Åv\Z?‹¯´¦ei<\ÈO>Kþö(\ÏjPJÍ»omm\Ó\×\Ô>ûýöÎ¾Zÿ\0\ËO\æ3ØÀb°nµI\ã\r2|¾Ÿ‰ÿ\0<ô\ÎkÔµh:\á+«i?7{›g²\ÇþÇ¯\É\Ýh>”y\Ú~´’+ÿ\0\Ë˜|©c\ç¦q\Ó\Ü\Ô\ËWwVß»\Óo\ë\ïIÖ®£³³;+¿D~\ã·ÓžƒŸÇ¯§xòY$ð×‡~gc\r\Í\æ÷õ¿˜\ëœúb›\á‡òGiu\âK\æ¶kK\ÞBŠþl²M\ÎO_óùÑ®4w\Þ­½­¯ù\ß\Ö3?A\ßó\ëME¨9tn\Ëþ\Ýjÿ\0˜\ï\éý[ü¾öÎ›\á\í\är\Ç¼Ÿvko18ÿ\0GŸòú}+´\ÖtÕºÚ¥w|þg?¯@?§_Oð]\ÓCI»l¼\ÑÃ°gþ>?É¯e\Ðuµ#´ñ\Éò~\ï/\ÓüŸÆ®\ÝôvýQn­ ®em¨¿\'ù\Ç\éÖ¼«\\\ÑZ#m\Ýü¹\Ïù\Î{Ž:W\Ò\×\Çq¹v\îQü|\çüõ\çš\â|I¢¬Ð«»\Ñ=xÿ\0\ëóÿ\0\ê¦\Ò{«ÿ\0_ð\0ùFúÝ¢fm»±ý\Ì{t\íù\Ö\r\äl©ó}}ûž¿Î½wZ\Ð\Ú\Ü\É\'–ûSûù\ïœs\×ÿ\0\×Þ¼òò\Ï\å,\Û×¶ÿ\0óþO¨¬¥½®Ý»»\ç:‚ü¬?‡Ÿ†Goó\í\ëÁ\êK÷¸ûœJôAv¬œü\Çø?_\é^m«r²1\àgüþX©\Ï5I6†få¿¹\Ç\ëú~}+\ÊõË¥Œ·\Ì¾>\ãò\Îy#ð¯@×®#&vm…\è>ž±\Ôb¼\Ä\Z\Äq³I+|\Éÿ\0,þŸýnþŸ˜iÙ§\Ù\Ü\nw\×Ñ¯œ\Ì\ØT\ÌsóÏ¸\ã\Æu\íI¤•š6Ü²?—\ÛýU\Çó\ÇC\é\Ïn(ñG‰™£m··.wøÿ\0ŸÆ¬x\Â7\Þ*HõQŸO\Ða“\ç¹\ÝË¨}ŸþXiÿ\0ü™øö\æ[Š·M\îÝ´\Ñn÷\Û\Ì½Áþ ñEŽ|«ýŸ£\Ø[Mý­\â\Äò¬,á·Ÿ\èýE\Í\Ñ\çüŠ’\ãâ§…ü+au¡ø\Ý\à¸/ö{ýz\å1ª\ê\×\Çfµÿ\0§K>9Ï±\ï¼O\âi$ðæ­ \ÛÉ·O°¼†;G\ÌQÙ‰\Æ`úwý+\ã8ôµŽ\æ\âFý\ä4\Ò\"Žÿ\0«?”JNö\Ùõôèµ¾\Úê·¾\Ú\Z\Â*÷wq\Óg\Ë\ÕYž…u\ãJkµ¸ši¦“ø78\éþõ\é\Ð\êZ‘\Ý\"î¸›\îBŸ½—?ˆ=¾Ÿ–+‘‡K¸¸ceùŸŒ\çùÿ\0œ\ç¸5\ëZ}Ž—\á]µ\Íjú\ÃF°O\ÞK©\\ý–.\ßòñž_@{\ÔÁµ(6Ü¹t\ÕÝ»\Ûwò\ìY‡¬Ü¯\Ú7#‘\ä§\ïLõñ\éooJù·\ÇZnµñ3\â¥\á¶w³ð¯†\ïÿ\0³þ\ÇŸ+XÔ­ñöWP=.Ò¿\Ñ,-üx}›§öt^\'øÈº´\Óhÿ\0m\îdšgò\æñmå·•,}\ä§ÿ\0\Ï\×ý=Þû‡t\è	|\'qkrÌ¯$Ž\âI¦›÷³I1ÿ\0‰þ\ÐÏ¯\ËYû_q6\Óv“[4­¢\ï~›Z\×\ÖúiÁsZ\Ú>U³Ž±NúuMZ\Ö\Û\ÒÙ¶¿ôAmn<\Ä¹\é\Zû\Ñ_`Ã¢§•\ÊÕ§ð²=¨¥õXÿ\0Ï¥÷?/\ë\äû\êý¼»K§_ðùz}\Ìþ”n-\×A¶\Ð\ìn•¥ª¦›§¿—ÿ\0.ÿ\0f‚\Ú\ß\Èú\Ùÿ\0?zó¿ŠG¦=\Ôj\Ûm\ä›\ç™ÿ\0\å\ß,OO\Èþfº­RúMS\Å^m\Þdi6¥q1ÿ\0¦\Ú}ý\Èü{{û×ü`Õ¾Ñª¬\'\îüéŸ§þ”žùö¯F´\ÜaÌ–ª\\ªú«\Ýo\ëý\\å¦¯%ýo§\êx\íÆ¥\æI\'ð\ï‡¿O_\éŠô¯„¾þ\Ýñz¥\â\î\Ó4^Mÿ\0<¤¼\ã\ìðq\ßü=«È®,$ó|\Ë5\Ü\Îÿ\0ñ\ïþ·\Ìÿ\0¯|cŸ¯S_Yøf\Õ|3\à{{\Õ#¾¿Ay~ÿ\0N?Â±¦ù\îý\Ûhû½ž½¬þ~Šõ7enÿ\0¥Šþ>ñ5³Y\Û\Éû\Ëù¿}³Ÿ\Üÿ\03\\þ–ÁEž›b¥¤&I¦ÿ\0ž_\äÿ\0‰\í\\\î½4—W‘\îo¹û¿¿\ÏúG?\á\ë\Ív\Öko¢i\Þc—0ü\ïŸõpúg©ü­lC^\ì|\Û’ý\Ë\í\Ñ\Ø\Ä\Ëc\ì\É\åÿ\0\Ë`\Ïøq_6üPø‡#3hz}\Ç\Êÿ\0\É\Þ\Èyýÿ\0ôþ•­\â\Ïyp\Ýùo\ä\ÚÂƒgý4\î9ÿ\0§\ß\\õþðôoª]\ê$\Ôi#‡Î‘ón¤ôƒO·\ãþ&——^F“aÿ\0O\×?ô\åŠ\â\ÆW•8\Æ~ü\Û}RQ„Sro]´Iu½¯¦ºÒ¤\å&\åö9_.ü\Í\ÉEFý/®¶\Öw]W†t9£[½SV\ìô›7ÿ\0Lwõ—Ÿò\ï¥[ÿ\0\ÏÎ©x?ð®+¼\Óô=KÅºþ“§Ú³\Ùÿ\0j¿ðB%û¾9¸\Çùú\çŒ]6J\é\ì\ä\Öláµ¼…?\ÐôgûU‡‡\á\é\ä[ÿ\0\ÐKT¼\Çú}\ßü¿\ß_PxgOµð.…&¿®\È[R‡Ê†\ÛþZ\Û\Ù|Žyÿ\0Lÿ\0—\ïþ¿.…8§Qµ¤Z­%e/{V\ÓN*ðÕ«Ù¾e(ÄKI\Ú\Î\ÎÍ§£j\Ú\ÅõiY]ô\Ó^\ãH\Ò|?\à\n;}–zUŸ\ï<\éŸý+P¼¸\Ï\Ú/®?\ç\æ\î÷\ë×¥q~ ñ•\Õ\àû.–¿g†gò\Ògÿ\0–Ÿý|\Ù\â±\ín/¼m¬}¢øyz]Ÿ\ï<Ÿùe8\èxõ\ÅZ\Ò\á‡Xñ³2¤vv»…¿¯==z\æMz\n\Î\É%•“^VÛµú\ï\Ø\Ãó\êûÿ\0Zõ:¿	øn\Þ;v\Õ5\\?(óŽxþ¿§½t·\r,¾^\ï.=œB‰ü¿\èz\Ôsj˜I]‘Â‰ŽžV=ùük‡mSÎ¹v†M\Ìÿ\0ºó\çþ~˜­\0\îš\ê\Þ·+\"·£ôù×Œôª7^$eVŽ\Ý]˜?—¿ÛŸ\Çüñ\\û,’Vmªzÿ\0Ÿóžzõ¦«[\Æ£_¸þ^÷\äý\Ï¥&¡}\"4’\Í\å¯Wwÿ\0ž?\äñúõ\Èós\Ç\Ã#Y\éKö©‡\îž\ægý\Ïùþ¾Ø¨üQª2†F‘\Æ\ÄùO¯_Ç¯NkÌ­\âY.Y¾ô\Îÿ\0\" \Æ:vþ­g);´´ó\ëÑVòfuoG6©70I%²Zýª\Ö#ÿ\0=\î-ú}”þ«\×ò[´nº}«;Lv[Cö[_ûwû1?f\ÇOÒ¼\ß\â/\ÄK\Ø6Ÿou»R‘<¿\Üþ÷\Ëÿ\0¦öÿ\0òóuùô©>\Zx\êO\Z\è-ý¡\Ú\ëZT\Ñiú”3<l\çþ$ú\çú7ü{}¶\×ýÿ\0þŸ­\é÷5\çT®½»„gyZ\ê/U%ex÷\æe[]viÆ“\ä\çq²R³}z=¶\í\Öúmc¬’ûR·a4\Ö÷-uš>\Õ\ë\âÛŒqõ¯F\Ñ~#X®’,n÷oû\èÿ\0Ó¯\×?­rKk4r,–\ìñ9\ÆÇ…ü©c?\ç\ÜdT­k\Ì\ß\ÚV6\×\Èÿ\0ò\Ù\Ó\ì·^\ßñ0¶ÿ\0K\îy¼²¾þµ\ÑO\ïªi§g~¶\ëý|–\è\ÍÁ­µü?S\Ø5\r6\Ó\Å\Óÿ\0³\Ù$_\ã‡ú¹øÇ·\Óòõ©<+¤\Ék¢\ÝY\Í\Ä\É\â­öoÿ\0–>E·Q\íŽü3\æZ©c¤\ÜùzˆOh\\\ïÒ¼HŸeÿ\0À}B\Û\íºM\Î?ò\ã_I\Ù\É\Öz}\äqÃ·R’\çDxe‹\Îò3þqmÿ\0?\áúuA©^K­´ÿ\0ƒÿ\0\rb	´\Ù-ô˜\î!¸Ø¶ö\Ïò;þ–{ƒëµ¤\ßX\êQ´Ê±´qÿ\0©$óüÈ¯3ñõ\ÓZ‹»výÙ›\î>Á\åIŸÿ\0W8ü1Y~Ö¼2\ÕVD\Ü\é\æl\ë\å\çœzŸqV xŽ\ÇO’	šKX[ðl\ëß·õüýk\æýSÀ:\r\ÝÔ—\Çy¦Í¼oš\Â\æ{_ñþ\\÷¯r¾Ö£¼¡Y\äDù\Ó\ëüñùƒô®:\Ö?·\\ù*Sý¿§ÿ\0XŸz\Æt”š\Òöi«nšj\Í7~\ï§\äžYøwÄšm\ÊÉ¦kIªC³\ËHu\Ël\Ëÿ\0\Ýp?\é\Ëñ\Íuú†¡fŠºÖ“5¬?\Çsmþ•kùzgÿ\0\ÖFkÖ¬ôTŽ/™wŸ\\z÷\æ©\ê>J\î~N¹ôü\É\äû\ÒT¤­i;G¤›i\Þ\Û\ÚÝ¿\ËA\ß\Óú·ù}\ížk¨K¤\ÞB\Ío5´Ë°l{Wò¥?ö\ïÿ\0\ê÷¯=¸±ÿ\0Iei‘üiû\ïË¯§\ä:W}«iöò4Ÿ¹H\äsþº\ÝKŽ?ó\Îk™®¬\ä>\\iu÷1M÷ÿ\0—Nýÿ\0ýs)\É4¥	hµq÷’\Û}µwü<ÐŒù-\Ú\É\"º\ï\çg—×¿ùü=ó›p¿:´}{üÿ\0¯½tªXÉ·\íKsf¦?ùoþP\Ïý<[}¶Ð¯\á\èck;{¸škY!¸gß¶;\Ë=¿\Éú}œ%¤d›³vo]-º\Ö\Ûþ`q²,™\Ü\Ùö\Ï_þ¿ù\ã\ÖkX¾uo\â\ÇOOó\Ç~ü^šÍ£\àe\ç\ïÿ\0žŸŸ\çW¬\ì\ä‘\ãý\Öw¿?ú\äúúŒ}j€ö‡3Iqq«i7³\é÷šUœ‘¤\ßê£¼ÿ\0I\ï\Ï_ó\Û8~)\Ðc\ÒtýF\ÂÕ¼µ¼›\í0Ù¿ú\Ûy¹ÿ\0{ùyµ\ëý}Ç‡U´\Ûy®?Õ”0Ç¿\Ó\ìþ£¿\â;\Ö~½qý ™·.ÿ\0ðS\ï\Î=ûV\í]5Ü†\Ô#®»ùu×½­s\Ìü2\×÷B\Ê\ëó\çz#\í\ë\Ïù\ë^\í¦\Ã4k¸©\Ø>\ãþc¯#§¶+\Íôû6’ò5woý\Û\ï\æ_cÀ÷\íøW¦jVú|,ÛŸj\'”þdyòùÿ\0>\ßÊ¦\nI5.÷_\Õ\ÙI\Ý\'\Ý\\Ð–\ê8\Ûi’6o\ïÿ\03ü\Çù5][\Ì?yó©þ>¾\Ï\á^7}â…’ùaŸ\Ëyý=û®\ãO“\í	~1‡I>¿\çôúX\ËZ¶‹\r\êHñ®\åtÿ\0<þ¾\Ùüü/\Å\Z/\Ù÷*”gÿ\0??o^•ôµ¬\ÑÅ¶ù™ÿ\0\Ï\ëÇ¹\íÔŠóŸX¬{š8ÿ\0vþƒüŸÿ\0_J™ü/\åù >?\×-\Ú8\Øÿ\0??òý?Æ¼‹Zm«!÷ù\Î9ÿ\0Ê½\Ï\Ä\Û|\ÉwÍ³ðôO­xOŒ¦[>\âm¿½\Ùò#þ£üÿ\0õ«>}ñV¥/7™&\æNQ=»g§\×ÿ\0¯_\'ø\ÛÄ¬“Mµ¶¶þ»¾½O\Çñ5\é>6ñF\×_¼\Üß¾\èù?\ç§ {v¯Yô}6\ÞOx\Â??G³šhô\Ý7¶¹©[ÿ\0\Ëúõ³ÿ\0—ÿ\0\ä:\ÐU\ào­ôk\â\ï/\Ùü>?y¦\éW/\åK®}Ÿþ[ùö\Òÿ\0ô¾»?|@·¸\ÚÛ¬\Û\Û~\îm¿upð~\Ïö\éþ5óˆ>2k*»’I¤ò\ã\Ý\Û[C•¼8ÿ\0G‚ß§\è?\n,n¦š\ÐM4$\Ï\Óð\ãÛŠ.®“vrv^}þ\í\r!¥øö±ªm™m\×þ_3qü½}+\Í\ãX![«\ËË‹m7M³O´_ê·³Akko	\ïqq\éüý\ës\Ä\Z¾Ÿ¢\è\ë\â\rZ\é-t\Ý+OšKû™9ò\áÿ\0—x-ÿ\0\ç\æ\êóþ=,-ü¿WÄº¦¥\âÏŒz¤_n´\ß\ÛM\æi^…ÿ\0\Ñmÿ\0\ç\Þ}@ù	j„\Ë\ßü¸\Ì;Š\á^K\Ý9Y\Ú1\ÚI$´i·môß©¼`\äû$®\Ûéµ­\Þ÷ü»ž\É\â\Úmœ²i¿\rô—ñ¥¿\Ê$\Ö!ž\×@·ÿ\0°~ž?\Òõ.ø»¼û\r‰\íš\áWEñ\ÏÄB\ßRñ†­®M“\ä\Ãsû«\r?Ä¿O¶ÿ\0D¶\éú}k\×<ðŽ\Þ\Ý`’hþo\ï…÷\çÇŽµô¶\á?M†2!Eù>G\Ùøÿ\0Ÿ~ø¨Š­U5&”^ðŽŠ?ðš¯7«Á]½7ò]ÿ\0®\'ð\ÂmR9¦„¯û\éú÷\ÏÓ½})£\èöújGjŠ\Ù1þ^¤~`ÿ\0õ©\ÖrGeð/\îýþ§ó\äÿ\0‘P\é\Z”w\×\Íú\Õó1±9ÿ\0=;\å]”\è\ÂJÍ·½ß§Ë¿\ÏR\Ûå¾·WôÛ²;„Ù±~\ï\Ý_OAE=\ä\"-øU°±¢´²\ì¾\ä\ïonT\Õ!i›sh÷:Äžaÿ\0ž:„Ÿü\n\íô¯ž~%jŒ¾#¿™y.cÿ\0\Ïù&¾–ð\r™\Óô\ÍkV‘vù\ßlò\ß\Öxzúg\ßúW\Ç>*º]CW¼“peûL\Ò>s\Æzzã§¯¥:‘R§·¯*ùY+=\Õú™Cw\éú£\Ñ>\érx‹\\†\ê\Þ7hl‡}€\Å\ß\çð¯bñu\â\és\Ék‡\ìo÷&\Çú¹³\ÄóùuX¿tÿ\0øFü\r®x‘ŽË‹÷ó6\ÏHsþù÷õ\íÞªø–ò¸™’U<Ù¡\ÇEÁþ˜ÿ\09¬ù](%«¦¥Ë¢ºvM7­¶zÙµÙ‡\Æ\í²KN½Œ=%|\Éãºº]\Ò;‰·çž\ßþª¯\â\Í}”µ¾\ì4|ñÝŽ=:ûöü«)u)4¹ÿ\0Ò™6\ìÿ\0C}ÿ\0\ë?\é…\Çµsÿ\0òÿ\0ü¼\ãTÕ¤¸½Ì’|\Îÿ\0>ÿ\0\Ëü\ãÿ\0­U)E\Ëd·\îŸf¿.\åYó·\Ò\×^z$ý79_j\Ó\\:\éñ·;<\ÇOúmÿ\0.ÿ\0Oóƒ\ÍzW\Ã\Ý&\Þ>ûW’2\ßð¥žŒ‡ýWöö±Í½½÷ý<\ÝhúU¾±waƒþ}©hv¯Yû\ÄW\ÊÉŸ\Ì\éÿ\0,mÿ\0\ã\ßÿ\0&½yÏ½}¢Ú¶›ð\çD™¾W×¼I¯j	ÿ\0M,ô\ë{mß·Auo¨dó^}:n¶5Nir\ÚRI\ê\í^[­,¹šzÿ\0-º¦l\å\ÉJi4¥%ºZI/ûv\êúnz·\Ã\Ø\Ãm©x\ÛZØºn”þUŸœ?\Ö^\Ë\Í÷?ñõö>-,8\ÇÛ†8\Í\ë\Z\å÷Œµõ;]aw[\Û\Ë+x{ô\Ç‹ªx\Âk­Kðý™\é¶‰û¡qyÿ\0OŸ^Ÿwt¸\ã\Ñõ?\\\'™$\×?c°wÁýÍ¿ü|O\ê:Â½t—\Â\ïh\Úöv½õ\×Fru\ÓE\áŸ\r}ž6Oµj	\åü˜\í\ï\ëŸ\åÁ\Åbø~\ë\ìv23>\Ù&~¿—\ë\Û×¯?\âA¯¯\"Vm\Ë\îÿ\0\ëŸ~ŸN:qü¡†a1«6\Õü>¾\ç\éúÕ\Öj\Z\Ä\×\ÉC÷\Ó=¿_\å\é\Ï|\Ô\Ú=³gs.\Ýùõ\ÄCüôþu\Î[²ùûvð\é\æ;¿·ø~­vV\íµI\">þy\é\×óúŸ\ç@\ï¯û\ÛUÈœ\än¾\ß\á\\Üšüvþc4^s\'Ü…¾§üóŒ}kVÖšk‰vþ\îÿ\0¹ÿ\0ž¸\ï×·\å\í\Ås~cJwnößžÿ\0\ã\Æ}	¨›j\Ö}ÿ\0@\rB\êk©$¸ºo—ýf\Äÿ\0UN1úñÚ¼§\Ä(º·»ºÐ´E\Õ(d\Ö/ó\çE£\ÃsÅ½ý…/?\ã\ï\ìŸó\ãVþ#x\Ú\ßÁú-\Õ\æ\ä›Ttòô\ÛW\Ç\ï/.\'û=¾?\í\ê\ã\Ûô5ð·M\Òõ‰`\Ó\Ö\á.&{™®5+÷ÿ\0YªjWò¾Ï§ü¹\Ø\Ð>\Æ\Ú\Ó\Ó5\ËRMµ\ïö­ºZhŸy~…Á]ß¢\Û\ÏþO¿\ï\à\Ó\Â7O%\Õ\Â<“Løš\æoøú“ü=±ž3Zš7†õhum=Ÿ\ÎO\Ý\Ü\Ã2~\çP³¸\æ\â\Æ|tµ»=}?:ú\Ò\ëÀöþ^\Û5M©÷?¯~Æ¸»\ï´7—\'\é\ßú\ãÿ\0\×Þ³–-+.·Rºî¶¶¯\ç«\ß\æöNK¯“]\Z\Ò÷_-ô]Í½R·š\Ö\Úòymfý\Úyÿ\0\ëc›þ^,n:ÿ\0¥YŽÿ\0òÿ\0^ƒn¶7\Ð.\åÛ¿?:¯>½zþ¸¯³±¼\Ð\î$’8|ûY¿wy§»*\ân¢\Ú\çþ|.\ÍzF—y\ä›uó\ê\Æðÿ\0£MÇš&ÿ\0—ˆ.ü»j–}?\éÿ\0Š¨\Æ.Ñ’|Ë£V]²×¶º½¼\Ü\ÝGv\ì\Ûj÷vØ±©x?M“Vµ›P›\Ë\Òo&6ó\\§1Y\Í\×ý#\Ö\×ÛŠ\í5-no\n\ßi~‡T°[{;;\n\Íxm\ímuM2\àÿ\0\È*\ãP?\è–Ú¥\×üx}³þ?\ìnru\í*§n—\ÌI¡xü·\ßûØ¤‡ñÿ\08\Ï|\ãñ‚\íõdùZf_\'\ì\él\ï\æ\Åoüð·ûNG}s\ï\×h\É\ÓO\ÝrŠ\åK—V–Ö²];\Ý\\Í®f\Üu\ï\Ò\ßy\îWi~*kµ7ön¥²\ï4\Ûôò¿|1ÿ\0?=—ò¯˜|]qªx\ÅrX·oj—ð\ÈSøó¸œþe\È\Ís6úÇ<y&’\×Oy\r˜†EÒµ\Ï>\ê\Ò[?ùwŸO¹ÿ\0½7œÇð¯H¸øƒ\àX\Ù\é~0³\Õt}i:}ž¤\è/\ímþ\Ñ?\Ù\í ¸¸¶ÿ\0Kû/ý~YzŠ\Û\âŠ\×I(»µË¿m]Þž[ö±\Ë\ÍZL\ÇunWþ4=¸ü9ÿ\0<c€õI&\Öd†OïŸ\ë\ïƒúõük\ÉZ\ßT\Ð\ä’\Î\â9˜\Ø\\\Íouÿ\0\ËXm\çû?Ÿo\Ó¿ÓœW}\á±\êR_G\æynŸ\çÓž\êú¥Ó«\í°k¥•\î\íýwô>®UV…Q~V\Ùÿ\0\ë\î}>•“¨Y±VÚ¹^w§ù\Ó\ß\æ¹=/\Åu\ävÿ\0:®þ=Gó\ÏZô…e¸‰ˆù¾A¿>ß§®3CVv{ <7Zµ\Ú\ì±ÿ\0þY§?Ÿ\é×œô\Åq3G\Î\âN\Ü~Ÿ\ç¯Þ™õ\íz\ÕVI6¯\ßúœsïž¾ŸÒ¼\×V·h`’\â8ö\Ç\Æþ\ß\ÏŸ‡\ê“\Ý\'\êfù—3Z%k-\×\É\Ù|\ì·9\ÖU\î\î\ë\Ïùõ\íÒ³\î4\ÛY›Î‹ý\ãªMkû©qô¶ÿ\0:b«ÿ\0h|ÿ\03ô\ã\éøÿ\0ˆ\ã>\Ô5\â¯þ\É\×ÿ\0>kžp„ž©Iy\ë\Ù\èï®¿\äZw\è\Ó\êšþ¼þâ¬‹ªF\ß5\Ä7\r\ÆÇ¹‡Í—ÿ\0-¾\Å\×üžõ¹£\ê\ÖvwšMŽ§\Øÿ\0¶/>\Ïm©\'úU‡\Û?\å\ßJ¸\ïmuy\éyþ€}\ëk\í¬¿˜ÿ\0#ƒþ}*¬z…·\Ú,\Ö\åwZÃ©Y\Þp¾Wö|ö·ü\ç¾9“R‚æŒ¤Ò¶’w´ºo¥\í¦Ž\Ö\ÛAž\áªm·µh\Õv®ù¤òwž!ü¿ÿ\0A\Ç?ow\r\ÂIŸ+tùýqý09¨õ\íb\ÏTj±\Ôl\ï,6f\ÚóM¹‚\ëŸúx¶ÿ\0Ÿ¯út¼¯/¾Õ®´÷[¦_27ÿ\0–Ð¿•ÿ\0’ÿ\0ò\ìq\Î•vs.\ê\ÏU\æž\Ï\ËúóŒ_N­\îúžÉ \Â\Ð\Ý\É\æ(;\ì\Ï\åþsÏ­q¼Eqk%\Ìq¶\í\é÷ýQ\ç\ë\éúg\Ð\Õ/Ç–\ÞS32yŸ\êþlÿ\01úû×œø›Y]Z÷\å“w\Ï÷>¾¿ý_Zm¤¯³[>ß®ö!/u\Æöw»ò\íë±g­I<û¤¸û<ˆþd~w\ïmx?ù-þzW\Ñ>ñ¬–q\Ç$ˆ·[>x_·¡ÿ\09\è+\æ9´öX\æ›n\Õ\æ=ÿ\0˜\ãéƒÿ\0UG¢kR[º\Ù\Ì\Î\Ñ\Âÿ\0&\Çý\í¿ý{úð1\ÛÚ¦\nþºšdi/\ÚU°wü\é\'^\ß\ËüjO[µÖŸ¸|Í³üž1\×þ8öòR‡m¬“]½\äo$1\È\îÿ\0½¯\Ùþ\Ñ\Ç\Ô}xæ½‚ýšM5_>f\È>}ŸNþ¼ý?–(Œü]Cy6ß›cùyôþ¾ý9¯–þ.^I#n\ÚÁüÃ\ëúJú\ÛÆ_oß»{Í¿ðÿ\0\çÖ¾/øø\Ò.œ¶Ð¯\Ìù6ú~½¿úü\ÍÙ¥\Þ\å(¶®­½µù\Ú\èw\Þ4\×n-a\ß·úEýøA\åY\Ù\Ûÿ\0\Ç\Ä\ç¹÷ý}k\Âÿ\0h­Z\Î\át=I·Ž\ÛK\Ófš\Î\Â\Ù:ù6ÿ\0ññq\Û?lº?ý~+\ê\ï\É‚|/‡\ìþ][RO¶krBÿ\0½<¨ú\Ùÿ\0“_üKš\íŸ\r\Ã5\Ô\Z}œi©^^\\jS\Û\Å™óÿ\0\å\â\ãó»\Çý<þJ§»M\É\íh»l¢ž\Ñ[ù\ëùX\"ýý{(\Ùjô³º\Ùyj\ï®\Ö9½\Ã\ëoo\í\Ö|\Çÿ\0Sú\Üzq\Óúgjö+]4\Ãb\ÓM\ä\ÛÇ³Ìšk™¼¨\í\áò?\×\Ü\\d}›ò\ï\éšð]{\ãgƒt;_°ø>\Öokž_\Û\îR{o[\Íÿ\0_û^¥\Çüùõÿ\0 €¯Ô¯¼uñ\n\én5ýRþö›\ÌKÿ\0EÑ­ó\Þ\ßOµÿ\0D\ê?/Î¹e_•rß™­\ÒwrN\×NZ5¶õ¹ºM\Þ\ê\Ê\×M\ìö¿\ÝtzÅ¯hž:ŸCð_‡d}R\ÏD\Õf\Õ5]a\Ê\Ò\ï/g¶±\Ó\ÏüÄ­l¿\Ò\Úú}»þA\Õ\ê¿ü)kn±þ\í“\ß\ê?¯­yÏ‚~\ÜEs\r\ÃCµ¿\å¦\ãÿ\0,x\ëÿ\0\×=\ë\ëo	øn[V‹j\Ì\ß\îCøûÿ\0õûv¬#\')JO­´\í¿\àh›Š²Iò¨­]¯·“\í¯\Ý\Ô\ì4ý68aù~\\§\Ïû¿õ_\Ãñ\ë[Mú/\Þ|ñ³§^µa[M\Ò\áo\íMCJ\ÓU\0_\êPZóž\Öÿ\0j\íøZ\æÿ\0\á?ð:\È\ÐÃ­ÿ\0k²\'\Ï‰¦\ßjŸù3ö_²ž¾›ªð‚JSQz+7{Y}¦»ÿ\0žš‘NvåŒ¥~ª.\Ý6m+\ïm=ûI%¿\î\Õü\Ï\ã}\â/Ã¯\Ó\×ó\Í[ðš\Çy.\é‘Y\Üÿ\0žGÓ·_Æ¼¶ó\â„W\ÓMo ø^þ\áQü·¹\Öõ(4[\\×½·\Ûnÿ\0Ÿ\Ó\'Lñf«Mq¨k	cûüC¥xn\Û\ì±y>Gü¼j_m»¹\äó\íœTKw\î\'$¾\Ôc.]m»’_-\Öö½=Œ®”š‹wÓªµºy\ßMzVý®\Çû\×?÷\Çÿ\0eE|fú\í»»9\ÕüC—fcÿ\0»Þ¬I?òõ\êh©ú\Ìüº}¯ðù\Ã\ß\ÏF©­=÷\Ó\ì\Ïûž^‚\ì[ºö\ÝÁZ’\Çòµ¶\éÇ¨O\Ïö\î?jøW\ì\íw½š\æ\æŸ\ëp8<ÿ\0ŸÆ¾\Øø±y·\Â\Þ\"ò\Ø*\Ü\êP\ÙÁù\ã§Á\ÛüŽÞ•ò¯t\ß\í_é°·\Ã0¼˜÷òmýùÇ¾kÖ¨¯4»\Æ+ð8\â\íw\Ù%oWÿ\0\0úrò8ô\éº<må¯“’tÿ\0UþzñŠð\ßk\Ò-\íå­š\î·Dù÷¿\îù\éúz\nôk\rqª\ÇgmŽ4òÿ\0þ?¦+\Ãu7Oq\Z·\Í\çyaÿ\0\ç§\áÿ\0\Ö\ëƒEMU½\Ý™_ªþ™)´\î‹R2\Ë˜Ëº7O-qþ«ó?—\ëôñ¯^5­ô‹lÛ›û‡þY\ç¿ð\çÖ½\Å ‡Ãº*\Ý4-r–vb=‰\'“\æM\ç÷ôõÿ\0&¼_K\Ö?·.¡ºh|–¹1\á¹O7÷?ó\Þ\ãü\ärx\é^eU*s\å^^e×•\ëmÝ–ú»\ÚûBQzµ\Ö\Ûúzw·ü=Ö–ªCW—b¸’ù\áþÏ²û2E\å\å\Ä\çû?\ìÿ\0õùu_]xú84ü/\à›y¯„¼7¦\é÷/ÿ\0=5/ \Üjÿ\0\à\Ò\âã¿§Ÿ9ü%¸\Ò|Mñj\Î\ÏOT“Ã¾øK5\çÿ\0–rM§Ásq£Á\è~\Ùuþ—öLôkÜFÕµI5mORÔ®X4×—3\\>ÿ\0ú\ïœ“ŽÇ¥o‚å¨ªVZ©?fŸ~O‹\î“\å·÷o}lŠ\ÉÁF7\ï\É=\í+8]+k(\ÚWóµ´\ÖºfVe_¹û¸“þzMq›{~\Ýÿ\0:ú\ãR´Â¾\ÐôX\Õ­´\Ød¹ÿ\0®\×¸¸ö\çù\×\Êþ\Óµ<G\á-~e¸\Õá¸›\ÓÉ·ŸÛ¿¯n+é¯‹·†9#µSµ<{ÿ\0Ÿ\Ã\Íw§n7÷+þ¦‹\Í0š\î­þ±þóô\Æ=\ëZÝ¾\Ñ}åŸ»\ï{ö\Ïù9\Ås¶n\Í4\×1\Û\ne\Óñ?¯\ã\Åu\ZMm5\Ã¢\á\Îzÿ\0ª?_óù\Ð]§\Æ%YW\åO\Þl~\ß\ÓÞ³õ­M¡V·Ýµ‹÷ÿ\0õv\ã¶:V½\Ò\Ù\Ú\Ír\í·g\Üõ\èqþs\ëÚ¼\Úúå¦ži$>÷›\ïý1þ{ût µÃ³7!›g·\Ó\è§‹{ˆaIže,©m4‰ÿ\0]¼n¾¿ÏšÁ’\à/ñ1\Ç\ÐcŸ_jðÿ\0‰/¼6—\Ëf¯\"½”\Ö\éô¸\éqøŸÒ¡\Í\'f¿Oóû\í\Ü‹þ2üno|L\Õ<3¤\Èÿ\0\Ù~\0¼ÿ\0‰õ\Ïú¨®<IqüKô;úu\Ñ\ín>\×\Ïü\Ü\Úgþ<«¬øCñ–o\êP4“º\Æ\é=¿\Ïõúÿ\0œ\nø\ïY¸Y¼}\ã\ÍB?—ûUü7¨^\ØJ\ãJû=\Ç<ÿ\0\Çå¥½½\Ø\ÇNkCG¸’9šEg\Ûütÿ\0\ë\ã¿j\à‹mÉ¾¯~ÿ\0.–¿\ât-—k-<\Üc&þwü<\Ï\ÚO\rüz·™cY¤O¹òo¯=;ÿ\0žõ\íZOÄVH\ÖI!Vt;žÇ“þ:üaðÿ\0‰.¼¤\ÝpñÈŸCõü8\çŸÀ×¨hþ>\Õ,\Ùv\Í6\Üÿ\0‡¿ù>•ª©%\Ùú¤Àýtòô]Gc[ÈŸ?÷·\×ùw\ëøµ4H\í|\èvùš}\çú\ä„þö9¿\å\Þú\ßþž¬ÿ\0Ç§5ù\ë\áß—\Ö{VK©g\î\Âoÿ\0?_¯\ã^ùá¿Ž\È#[›ü~œd‘O™6›\ÑÅ¦žþ½<««=™ô\Ôi5º²\Ì\Û\æ…<\Çtÿ\0Uqü»_[ý?\åÿ\0\Ó9\íW!¸þŸýó\Ç\áß‡\Ð~$hz£Û¬—PÂŽþX›î­¦¸ÿ\0–÷?ô\ë‘þŸÿ\0ƒ\×e}k%Œ»•B\Âÿ\0»\î<¹¿\ç‡ýzö°\ï\ÐÕ¦šºi§\Ùÿ\0]\ÈO–\é÷ºz\ëøt3üI\áûZG\Íö]B\Û\Î:mú\'\ïl\æ\íý<\Ú^ÿ\0\Ëý¡¯oÚµ\äš>¹oö=bþY^Eÿ\0=\ì.;Zÿ\0ž+Ü£—q\ãüñßžŸ\áTõm&\Ç^µû=ò¼rBþe…\ä?ñõ§\Ïÿ\0=­ýÿ\0\é\Ó?ým\ä·~\ï_\ë\Ñ=Ø¤”®\ãfû7½ü\ím=?#CFñ‡\âB¾ñe½´~#¶´„\Ù\ê¶ßº—\\†\Þøþ·\Çü\Å,\í\ãþ\Óþ\â\ZuC©xvO\êV³@\Þv›ym÷¡Á‰úýžÇ®kÁüU¦\ë\Z{Àº“:\Ím7™c¬YùñE ·\'\ìó\Û\Üsök¯¡ôüy¥ø»\Ã\Ð\é> –u«\Ý\ß\å<¯3þ¢\Ööÿ\0ó\ëy“öþö\Æ\ïþkUi+§÷ü¿\Ï_-Lõ»MZ\ß\ÓÓ¥Œ»[¨\×T·¸…Ÿiþÿ\0ù\î=;úW»h:²\ÉÆ‘Hžbg\Üg\Ìÿ\0žk\Åüi¡¯‡\Ö\ÇU³oµYºM\íý\ïý¼{s×§\å\ÍG\á?5\ë\Ù\ÜC#\íšO-úû?\ÃùÓ»z6\Û\éùnµk\ê\Íüm—ÿ\0<{q\Ðg¥s>,³†_^2\ítûžÿ\0ž¡\ë\é]¥\Ç\ïž6\í³ž:úq\éøÿ\0:ò¿‹\Ú\Äz~…k¡\Æ\Ûf¹2dÿ\0?þ®\Ø-\Ù7\ØM]5\Üù\ÞK­­\Ïl\çü?\ÃP÷j·;Pu?\\~__\ä+I—\Ì_\â\ë\Ç9\Üúÿ\0\Z.§m»¶¶\Ïoóô\îyú\Ö}R\ëk¿/\ëô.]^n]Á¿\Ãñúvý‚º†\×ò\äl®ÿ\0‘\Î\Ï^ý9ªR^\ä´{·|ÿ\0Ÿù\ê>•…}#Bwcw\Î;ÿ\0«úÿ\0O\ÇÚ³©\Ó\çú¯5«Yø\Æ\×R\Óo&\Ó_Wòcw…ÿ\0u&¥oŸ³ý¢\ßþ=?\é\Ð\ç·~\Ô\ík\â³X\êwV¾0\Ó_G¼°¿›OþÒ³q.y7ü»\Ïqoÿ\0.Ö·–¿g»ÿ\0Ÿ\Ç5Ÿª\\5Å’\É¥Y\Ü\Åqóû¾xüúô\ïÿ\0e\ê–\Úmõôh\Öúö•s;ôX\Ò\\ÿ\0\Ó\æ—q\Ûò\r®\Zr)\Í\'d\ä¥im­´Q\è¼ú¶•Šºi6®öz\Úö¶»u¿r\äzµ®¤«wku$ß¼ûM„\Þm¬Ÿýnÿ\0\\\Õ\è\Öy?}\Ü.ÿ\0¹¿Ê”gþøôô\ç\ê|Ç¬xNûK‘µ\ê×š=\æÉ¾K9¿s,\ßõ\ïÿ\0—<þ¼Vn—ñ£\Å^¸·´ñ\ç‡·´\Ôx%šóAÿ\0E\Õ#\ÇýC\î\Ñ.{ÿ\0Ç˜\æºãˆ‹øîšµ\äþ¾ÿ\0~‰\n\×øuùk\Ò\ÖZ\ß\å·\ÌûM–\r|·s#§ú¿\å\ß\ÔõÀ¯+¼ó-o¤Q÷þñúj÷‚þ.x/\âb\×A\Ö,\î.?\Õÿ\0bjHmu›>œù?\éþ°1š¹«i\Í$ÿ\0¹Wf\ßüoþ³\Ó\ì\ÜŽž¹ú\×]:Ši%$û;\è\ïmSë¾¯G¶—½¢qm¤\ìš\Ý=õi]ô.Z\ëW–P\Û\Ü[Éµ­Ÿ\Þ¬‡þ^=°?Qô\Í}m\á=js\Ã\ÊÛ¶Aüo\Ì~\ß\Ì`t¯¬\íÙ£hp[þƒ\×ôÿ\0<wøb³Z\è\ÚÂ»:ª©9û˜>ÿ\0¯o|V©]7\Úß‰G˜øûG“\íW[\Ü|\Ûòc~e\î?Ï§¹\éòßŽ-Vo&k¸\Ò\êkgóaN‘f\ßþ[ú\ç¿ò¯¥<m­‹Û¥‘Œ,’|†>žw\"\ßüý:×„øŠÝ¯-f›\äR\ÞH‘\ï\íg\çÈ·\é\ç\íš\ÍÓ‹z®·þ¼ŸQ¦\Ö\Ìü÷ñ¤——š\Í\å\Ô\í\æ,\×3Islÿ\0\ëc³·Ÿ³ó\Òóÿ\0×šüñý¢,[RñW…mc’i4øü=5\ÂCÿ\0,¼\ï\í[›?\Þ\ë\ì¶öþ\Ø\íšýfñ·‡aóZø\Æövú•œ\Þt>I–Xõ>\Ãý´Ï­\ç\Ú?òg×Šü\Óø\åioo\ã\ÛÈ©$\è3Iÿ\0ln5[Ÿ³ÿ\0ž\Ý+f\âš÷¹]÷\è·\Úÿ\0†\ï\å­Žý•þ\æð¯ƒôµ•~\Ð\É\æ:‰úT²M\Ï\Ùÿ\0\Ñ\Ïÿ\0U{.ccnª\ÖúM\Õ\Ö\ÏÝ‡¼x4¸³\î?\ãï¿©=½+œ\Òu\í\ÕZ4Ku‡®\Ïl~=ÿ\0®´­õº¸+\æm†7ÿ\0¶\\sßšò•6šmõOoGý|™Õ§U]¾k©\éZmö¬“/‘&‰£\Ã\çüÿ\0f¶û}×‘\ëö‹‘ÿ\0¶_ýhüM¬^]\ë\n’kš\Ü\Ö)\Ï\n_\ÏkŸø,±ùzW\Z\Ú\Ò\ÂB\Ãó\ìûˆŸò\Óüý9Ï­sº×‹4=,\Þ&\Öô­u+ø\"ºsŸ³\Ûÿ\0\Ç\Õ\Î\é\Ê\Ëùbœ¹bµRwjýok[¦Ÿ\ÊÆ´Ó“\ÑG·º¬õ·K\ë·ue\èwL\Ö)y6v\Ê\Ó~\îGtóe“\Óý\"çžºcÓŠš\Îù¬\âòmü\ÅO\à]üú~^ß©¯“\âö—t\ë…ü7\â¯Iþ®;˜l?°tcÓ®¡­Ÿµ\çþ¼\ì¿1Q6µñƒXùltÿ\0ø6û*_x£T¯üüý‹I\çþ¼ÿ\0bª\Æ\ë\ÙÁ%\Ñ\Âmm\Õ\'m.õI½“gG#³r{Z\ÊN\Ï[t~ò\íªW\é\å\ìqþ\ä\Í3;\É3¿;?{\Ç\áõõ\Èýk…ñw¼?\áuU\Öõkk¦û–)›ýR\ãþ˜iú>›þ—s\Ïù5\Èÿ\0\Â\ã-I[þˆ\Þ-\Ô\Ï\ï¬ôÛ˜<;k\íÙ´K[/ô_Ã·N‚®h\ßü?¢\Ì÷zL?jwýõ\å\ÏúUýÇ§\Ú..\Ò\î{ÿ\0†*×¶š´c\Ë\Ítœùn¶û1“\Ý7»\ì%ì£¬¥všºQv{n\ß.Šý\ëäŒ…øÁ§\í_/Áž?’=£Ë“þ\Æý\âc\äù\n\Z\á¿\Z+\ÕKM«òöÀ=>´VW\Å<~\å\å\çýY÷\Õûj?ó\é\ào\Ëû¿\Õ\ßm?¯ŒJÖ¾±·\è\ÓMö‰¸ÿ\0žý/\Ï\Û=<G\áóGguww#$m³\ËGt Gÿ\0\Ö\ëÛ¯\ÔW¹|tù´±\Ðü‰\×ñO·=«\ç?\ê-gm|\Ûv·“7—½<Ø¾¹ÿ\0?‡o§nõ\î\ïøµ¨\êQ\ÜjRN³y\ïÿ\0_oC\íÚ¸3t­¸ü\Ï7™ý1ùÿ\0­^Yö\ÚO6\ßô‹™ýˆ?ó\ØW-¨jQ\Ù\"ù¹“÷Žœù\ëÖ‰4·Wm4“\Ù\ë\Ýuþµ†ø­}4z|p­\ÂG\×z2~\êOó\Çø÷¯›þ*xûSøqðZk\í\Þ\Â?x·Äš?…ü7m7ú«KPŸþ?¸ÿ\0˜^köýZþ\Óþb\Ûû?þ_+\Ú>!M6¹wgj³$v\égö‡w\Ýy\Üþ\ãÿ\0\ëû\×\Í~9\Ð\ãø‘ñ\ßá€\ãgm7\áv•©¬Z!ý\×ü$ž0ýÅ¿\Ú=.¬ô}B\ï·\Ø¤:W‹šÕœ(\Ê4«bg-z\Î3¯(óM;;rQYsim¾\Õ\×n\n•U*‘R¥Gš½Tõ\\´Ò²·^i5ô½\ìÚ³û\àO‡eð\Â5–úk›Ÿx\æ\ëíš•ý\Ïü\ÞCp\ï\î?\ëðÿ\0¦w Ÿa^•nùU¿\é™ÿ\0$q\ë\íú\Ö]\Õ\Â\Éy\r¤)¶\Î\Âl\áL~\ê?³ó\ÏAW­\Îwñ?\ß\Ï\çø.¾õ\ë\á\è¬=\nTcµ((-nÝµrz/zR”›~v\éw\ÉR¤§9T–®R»ù´¿‘\ì_¬Zó\ÇÖ·w-…œ\Ò\'óÿ\0?\Ó5\Ú|^¾õ\æ·VùR~ø\ï\Óùw\Æ:o\ìÿ\0cº÷V\Ô~\ä>^îŸõýsÚ¸ÿ\0‰Iy\âmI±ò£\ìýqý>kv­÷\'÷«’b\Û\î’\Û\ìñ„_9ÌŽüŸÿ\0_OÎ»K{\Û{m¼²\'—\n\'ü´ý_R9\ï^gi;*»h\â3\Çóþ_×š\ê4õi’8\Û\æTý\çAþ\Çù\ã¥ 7//$m\"8Ý¶†ýç–ŸŽ:~L\×}x±\Ä\Ìÿ\0u>\æñ\Ï\ã\é\Û\ê=+[V¸Vx\ãVÚ±ÿ\0sü\ç\×ñ\ë^W\ã\rYm­\äec\åÆŸ\ß÷\ãüõ\í×ªm-ÿ\0\àGZ×®6I%¼œ\'^¸\Îú\Ýûú\×Ë¿üY#L\Ë\'ú\ÇLÿ\0Ÿ\Ôuüë¸›\Ä\ÑÈ—	ö\È\Ô\ÍÃ¿÷±Œ¯ÿ\0õšù\×\âM=…Ö±uu:}²M$Ú†ÿ\0ô[xmÿ\0\Ò.\'ŸŽ\Õ\Í9$µ½\Ò\ëký\ÃJ\í.\î\ÇÈº}\Ó\Þ^x«R™·M\â\Ý`öÿ\0Q§\Î4{x?ðÛ·øWQ¥ÈªŠ\Ýüÿ\0ž¿€\ë\\‡fŒør\Æ\â1ÿ\0ÿ\0l\Õ7¾|\Ù¶/®u?ó¸…ušc6\Åo¦\Îý3ü\Çnz\×3\åq\é\Ó\Ë[¿¼è¶—ók\î·ùžÃ£È¾Z·þþ\Î:fº˜n?‡ü÷\íúð ¯;\Ð\ç\ã`m¿\â:þ=\Óõ\íc˜6ß›\å\ìO\ÃñüMj\Õôû\ï÷ùˆ\è\á¸\ÚU—¨üøÿ\0?\çVµž­qÝ²:”ÿ\0oüûlþ‘Y¾\î?¿ÿ\0¯?=j\Ôslþ.?ƒüûwõ=}˜½¤x\ëR³+û\çUÿ\0a\Ï^1\ßÞ¾\äøñ\Ê\Ï\ÅMoð\ç\ÅFº”\Éö\n\êWOû­Sþ¥Ë‹Žqªÿ\0 \Ïû‡ÿ\0ÏŽ2\á¸l)nG¯·õô<Ö„7­‹$s<2$\Ð\É\Ð\Ê\"–\Þkqö‹y\í\îü½Y\Ýtü{ÓŒœeuÙ¦º4\í£û¤\Ó\ï\Ñö}\ì~\Ó]\ÛÍ¦\Ï\å³HÐ¿ú—ùhz‘\Ïü½œTÍ¸.\îŸ\çñ}x\'«\Çþ\0üb‡\ã/†®ôLŸð°<1gš®\Ï\ÝK\âM\Üýž\ß\Æ:}¿üýYÿ\0£\Úk\Öóÿ\0ÿ\0ù}¯Rš9,gû<œÈŸ”ñûÿ\0þ¶Q]‘P’ºZz¿ó9\Úkuó\èý_¹\Z\ÓCoyo%½\Ô0\Ü[\Ì>xfO6)9ÿ\09ýJñ¿øFmu\×49&Ž_÷\ÛZ|Àÿ\0¯ÿ\0¯^:\Ï>•\ê\Ñ\Ü07ÐŸóÁõõ\â¦gók®\å\Ù\å\ì\â_3#\Ó<û“ùt¦¢“M_O=öÿ\0‡õôWMw1|ñC×´y|+\â©>\Éq¿Ë…\äO\Ýy\ßó\Þß¯¶-3ýi¶z\r×„|G6Ž\Î&\Óæ¿³¼°¹\Ùÿ\0\ê\é\ÃÛ¿§\\×“ø\ã\Ã\éw\êjñ\é÷ÿ\0»}Ÿò\çx{ÿ\0__Ê¾Œð\ëx\ÛÁ:<\×$Ö´«;k›”?¼“û>þEû=\ß\Ð\Õ	\ê\í·+O\Ôõ¯µGkº“ý\\)Ûƒ\'¿ÿ\0¯ò?\ÄOI¬kSI+†T\Ýúó×µ{—Ž5¦\Òô¯%™BŸ9\ßÿ\0-¿~þž\Ü\×\Éw\×Mq4’;ùþ~=ÿ\0—¯9¨›²·\Ò\Å\ï\â\ßü^fsÿ\0\×ü3øVN©¨m—\åoúg\Çøóœu=«º8Y¤ùüý3\ïýx®R¼_5•[øý?O\×ô¬…mo\åo\Æ\åù®¼¹·}þÿ\0^:ý?ÈªZ…\Â\Í\Ö;v}:ö÷¬¿2I\n÷\ïóô\çùÿ\0œ{×¼¸µ±·’úú\âxS\ï\Ís7\Ùb÷\çð¬§8¨½ß¢óó°\ËV¥\ä)~e›÷oüºþ_ŸV~©\"·…ç¶º]\Òxo\Ä0\ê\Âÿ\0ò\Ò_ü¸\Ô>†\Øò;p÷_4/Oþ\Þ\Ò\á›Zµšò\r;Gš|«MSRóþ\Ïÿ\0ÿ\0ùùµ7_ò÷ÿ\0?Ê¼KVñ‡‹µû\Û\æ\Ôõ\ï\ìù&¹šI­¬œEkg6\Ñ\àÿ\0F\Ïüüõ…r\ÉJo\ÝÑµmtKE»\é\ä\í·¨Ó³O³¹\ï×—Í¾FdXÿ\0\åŽ\Çý\×½ÿ\0\Î:×’x»Åž\Ò\î&±\Ô5eºš2(~ßªy=¿\Ñ\í¿\Òøõ\ï\Ç^\ry†õe½\Öõ\Ë}[\\Ôµf³¶ò“Î¼Ÿ\ì\Ñ\âùw·\âÓ¸\ÇÒ¼²mrø‡¬5¾\Èl“J†w>t²\Ç\Å\Æ\ë\Óÿ\0¯YJ2÷n÷“KM­\Ëø\ë·Nú—½£k.^›;;?\×SkÅ“C©Iö\íG¿±šó,õKûŸì»«yºyöÿ\0f\ÅÝ±üMz\Â_\Ú\Ï\Ä^¿·\Ðþ04\Þ2ðz$\Öðø‚\Î\Ï>#ð\Ü\ÞF-\ç¸\í\âM.\Ìÿ\0\ÜrÀÿ\0\Ïÿ\0o\Ö<I\n–\ËnT\Æ÷šoõ?Ÿÿ\0_\çZ–½i2##7ú\ÇØŸ\×üúV´Û¥%(io²õ‹w»|ºhô\Óñ)\Æé§¯šVk½½O\èÃº]¾­¥YøŠ\ÇP³\Ö4b\Ê\ÏP\Òu=þ\Õa¬iº„h·¾·¸?ñò:ñ¯P³…t?\rL\Íòµ\Ïß“gXC\Û=k\åÿ\0\Ø\êO~\Ëþ\Ý“‡¼I\ão\Û9ÿ\0Ÿ;h\àVuü–\ÎN+\éˆ—\Ñ\Ú\ØýŽ‘üŸ\Æÿ\0\ê¿úÿ\0>•\ë\ÂjT Õ›šM\Ù\Þ\ÏM6Wü;™5f\×c\åÿ\0^-\Õ\ì\Þd‰¬/öË—ÿ\0žŸôÀö\Î{ô®FI Õ¤³\Ìo§\Ý\Ø<öúk¿‘\åy\ßññöúüÿ\0ýjÏ¼\Õ#¾–\æ™á³¿K\Ëtži¼­B\Þh/­¿qo“ÿ\0/_\éxÿ\0§j–\â\ÞM­c7\îó4:…\Ì\É\'ü¶\Óóÿ\0\çù{÷\éM¦·\Ñõ]¿­~\âSOfxw\Äk[…ŽûM·ýÝ­³\Ù\ê’CŸ\ß¤ÿ\0 Á\Ïü¹ôÿ\0Bÿ\0—i_—?µ‡¿³u\r\ÇÑ³ý†óþ)ýI:Å§\Þ[ý§P\Ó\ç\ÇQkyþ‘{n\Õû\ã;\Ô-|\å\Øn,õÿ\0—~žž\Ùü¸\è?\à¡:ÖŸ©izÀ»M—Wš–­£ø\ã\ÆÈ¥\Ù\èÿ\0iÿ\0„_J¸ÿ\0Ÿk½b\ê\â\ãV¿´\Çüx\ÛZv½®LO,©\ÊûE^û¤ô³\Ó\î5¤\í5£k\í$¯\îõý§Ë·Ÿ<¥¿\Ù\ï¼Q¥5\Ât\Ól&þÔ¿óúÿ\0Ç¾›öÛ±ß¿Jl?5\ÍQ|Ÿ	ø+R¸\ÇÉ©xžo\ìÿ\0pûo¶\ê\×>ƒþ<{óŒWŸx7á¶—¦ˆ\Ö\Ò\Æsÿ\0La‚,sø{þ9¯¢t\Ã\nFñ\Ï_lóþz÷óœGo\Çúÿ\0‚w©F;\'®÷ð\ço¢üGñ!VñŒ\ï4ûyÏ¥xJ}\×ó\Ã\íò¹\Æ÷¯\ë\Ýøg\á?†t¹>\Ñ—\r\Å\ã¿\Ïx~\Õu\'§\Ú..\Òÿ\0Ã­z^›§¬avGùýsþ/z\ë­l\ÕGo¿þ?Ÿù\á{(=d¹Ÿž\ß%\Ó\Ïþ\íÔ“µ½\ßG¾\Ûýß‹\îc\Ù\èvÐ¢¬p¤{?Ÿóù\Ö\ä:|j6\í\ßþ~œzûúV¤vûOÿ\0X!ÿ\0\Ö\æ­ykÕ·Ÿ\åùÿ\0ú«EN\É.]\×ùÀüVÉ™ºŽ\ßo¢O\Ñn¼’2þ\Æ66ß•¿¿ý?1\ÇEcUùJ\îüºz{Ö¥O?ý~>3þzÖŠ\ß\Ýÿ\0ûGºI5\Õ\ëþE³m«òöžŸJ+UcùW˜þ\è\í\íõ¢Ÿ$|þÿ\0\ëúo\ÊËž^_wõý7\åo\ês\ãdÛ´æ˜±ù&ÿ\0?\ç\ë\ÇJùŸIž3\ç+|É´|›ÿ\0ý]+ß¾3\\n\Ó\Z=\Ã?i‡\ßü\Ï=\Î+\æ\Ûl7÷v|\ï³ü\çÏŽ=}_{šÿ\0/•ŽA÷,c\åÊóþ?\ç|s\ÄZ³I«}ž)“\ËOõw\Çòü«ÒµK·†\Ò\âoùh‰„\ßùŸ\Ë\×ôkÀl\á]SÄ—-4žlvh$¹M“\å&úŸ\\ô\çÒ³›÷\Ò\ê\ß*û›ÿ\0€Tc\Í}mc¬…\Ñ\á¸Ô¼›{{dÔ¼Q­\ÜN˜‡O\Ðtÿ\0ùvÁ÷ük\Ä?fø\Û\\ñ/Œ¾&_G\ä\ßxŸR\Ö<H‰3\æX\á\Ô?\â_£Á\éþ‡ \Û\é\ÝÀ\Å\Ï\Ñ||ñ\è¿›E†G]S\âuåŸ‡\áH\Ö\Û\è6\×\ßh¸\ëÿ\0.·—V\ãÿ\0ºTÿ\0mMž‘\nÛª,w)\ÆÁ\Öÿ\0£þ\èÿ\0Ò¼­1­\ZVS†\n›­$õýýD”[ÿ\0\r4\í\Ò\Õ:%yu¯\Ýa&\×\Å^¢¦¬®\Ý:r‹›ùTi$¶\ä\ßWo¢¬\ß\n\Ò7\Ì\Îþg™Ooó\Çnõ½jwnþ/“¾¿\ÃÛµ`\Û7\Ë\Z²þ\é\×ÚºM\ÞK©\í\í\ÕK3¿—\Ï\è{÷\Çô\ã‘\íœG\Út\ß\ì\ß\Ü^J»d¹ó¥3£ÿ\0Ÿ\å_7ø¢\èM­jyƒþ?f\ëÿ\0\Ö\Ç\ä•õ×‡\Ñt¿:…¹³òúry\Ïõýs_\ë3,š•÷\Ì=\Ì\Ò\ä\Ç\ã\Ûüž*¥½»$¿¯¼\í\ÙY\ÕTÿ\0À\ëü½{N\Ò\ÖO*\ÚG_\ïþ99\çôöþb¸[=\Û\Õw\É\Î=úþ¿­u]º¨ùsþzq\ÐþU g\Þ\\mi$‘Tý\ÖsùŸNk\Äüw2\ÜA2™6¯•ùý}}+\Ò5\Ëå·µ7\Ìÿ\0_O\åø×‹øŽ\én-\æF\ìŸsüÿ\0Ÿ­L\Ò\åoª\Û\ï\Ôžõh\Õdfý!¿\í¹1\Ó\ì\Ãò\ë^ñ\ÃPkx±D\Ó,ŸðjQ\ï{™ÿ\0yö‹«#þžF\çó¿<WÑ—ž_™\"ùŸ*}ýœô¿ú\Ý:WÇ¿´f¥i•o¤Û»\É}\âmcMðúoý\Ð\ÜO\ç\ê¿ò\ëosô\Î>¼•¤£	_ªýWõ\æiOW\ÚJ_sJÇŸ\Ùþ\çN\Ó\íþ\êCagož\Ç÷óýZ\è´ù>]»w7\â1õ\Ç\×ü{ç™’Glwýòy÷\Ç\'\éZ–3nÛ»\å\àþ8\ç¯O\×5\Èt¸¹n\íf\í¦\ëMwë®Ÿð\ËÑ´›…Vù›±?ý^Ã\åš\î­\æ\á~nÿ\0\"zþ?^þþ\ÞOcpc“ÿ\0Cü¿\Éÿ\0\"½\Æ\è²\íô\ê6ó\î?Jºn\ÉGñù/ò3’i\Ú]•ºi\Û\å\Þúö]z…“ËŸöú\ãüþCëŠµÿ\0\Ý?cÿ\0¬Â²ceaó7ò\çòþ™•[Ÿ¼Y?¸9ü=¿?_^4NZß½Ö«¯§\ç\Ôk\Ýwz´ÞŸ\Õüþ\ãf·¼üûŸ\é\ßÓ­¨\î6§\Ûü\ÏOAŠÃŽn>|}ÿ\0“¹\ïüû\ÓùL³{ÿ\0\ßCü¯\áBi\ì\ÄÕ›]Bð‹µ\ïø‡Gñg†\ï?³õ\í\ç\í–­µ“­½ÅŽ£oÿ\0/:^±h>\Éhz\ØÜ\Ãõ\ãÁ>4\Ð~,x7Mñvƒ‹V¹ó¬\ï4ÙŸÍ—\Âúõ¾.5jô\ë\Ç\Úô¾—ö76š\ã\í\ÕøŸ\ÛN0!\ïþ{JöÏ‚ÿ\05„~+þ\Öò\îu/\n\ë	Ÿ\ã?Bÿ\0ò\Ñ\íÿ\0\ã\ÞûO\ÏüÇ´øú\Ðnÿ\0\åÿ\0ý/Oÿ\0uõi\nŠ“nNÐ“\Õ-“Ù¥ù÷îº§Q4¬¤“i\Û\Ñ;ý\×òz\ì~«*´mµƒ«oò\ÝúõÀ\ç\ÓÒ­F\Ùþ=\Ùþ\ç\ç¨ÿ\0&ou¦øƒO±Ö´[\ëmZ\ÇR\Óa\Õ4}V\Ïþ=u\Í\âô{\ë|ÿ\0\ËÕŸ6·öŸñýþw§ÿ\0\ÈF\Ëƒn;m\Ï?\ä÷úûWi\Ímo\ä\×\ßoò Ô´\Û}Z\Æ\ãO¸ÿ\0SrŸ\ê¦ñ\ïqýy\ëŽõ\Íü0m{Gñ5Ç‡vùvÿ\0¾¼Ô¦ÿ\0Ÿxtø\ïý\Ó\Ù\í:ÿ\0vË»ø}½?µ¥¬ZøSIÔµo&Ô¯-¡·I·\ãý\Þ´ùøú¥&\ÒWz$D\\o²Ž–õ½¿+~-÷8¿ŠZ\ã4«j²~ñÿ\0xüÿ\0ú½;þY¯³ˆ\Ìþc}\×ýN—ÿ\0ª®\êW\×\Z\å\ß\Ú&g“\ïoó×^câŠ\Þð©š\ÓûQõMJ:9´\Ýü¶ÿ\0g\Ç\Ú?´.?\ã\ÓMÿ\0·\ËÞµ\Ï9¤\Ûÿ\0ÿ\0\r\Ü\Ð\ì¼E}º,1ý\ã÷¶ž>žÞ½<‡\Ä(\Ñ<:msTµ\Òü\ïøó¶™ü\ÛûÉ»g\éö\ß\éW?ö\çe_4xƒ\ãÿ\0‰¼Yqvº<–\Þð½ž~Ó©#Á\âK\Î?\ã\Þ\ßP¹ÿ\0E\Ó\í\Î\Êúûñ¯\n\Òüq£\é7º—ˆ¯®\æ\Ô5k”ž;k›û\É\ïõ\'Ž´.\Òÿ\0_J\çu.“½ýæŸ’º»\Ñy\í¦ºõ4\ß5ok\ÑøÁ:J\évþw—y\âC\æ\Ýy?õðÿ\0Ú¾\Ç\Óþ^õ‹\Ó\éýžq^oñZþ]&É´}KZ¿ñˆ5‹˜m\ÒK™¼\Ù\Ò?å†Ÿmm‹Kûs²õ\ë_?\èÿ\0¬4]BO_\\\"\ì2Qÿ\0\ÖL{}Ÿž\ÝsÀ¯ñG\Æ-[R\Öõ\ï²]L\'Ž\Úòi\àÿ\0‰}˜ÿ\0Ÿùö»ó÷øý&-Îž¶r–©µ§+\å»ü¯¯Gb¢¯-Š\Îýþ]²üuñ\Æ\Ìø\ÃvsEf\Þ°›P\ÕaGó~\Çy\ä}>\ÇóõŸô¾ý^\r¨|HŽ¹¸ŽgšG¹š\ç\Ëw?\ë¹ýÿ\0øŸJù#þ$7—-§\ér_\ëS?–\é£\Û_j’\É7O\ß\Ü[¢uÿ\0§\Úõ\rü;ø­\âÁi¾\Öþ\Êÿ\0rmbò\ÃKŠLgþ]ñ{v1\ÓúR\ê\Å&ý\Öô²‚“m(\Æ/h¾\Éü\í\æl¨¶×»dõm\É.Ue«»[\ß\Ïò;\ÍÆ—qyy5\Æß´ù\Ò>\Ì}GOo\ç\Ådµ\åô\Ò\ÝjL\Íkj\ï\æ=\Ì\ÏöX£ÿ\0¯‹‹¯ôOþµzŸû7üNu_·k\Þð¤O÷\á\Ól\ç×µ˜ÿ\0\í\ãRÿ\0‰M·þ~5z÷ödðû2\Ük_\Û0¾O\Þ}§\ÅZ”ú¤_ö\ï§ÿ\0\È&\Øõ\Ï\Ø\ì±ø\×;œ›÷)¹>Ž^\ê\Ö\Ýl\í£\×õ6(\Ù9\ÉY\ì£\ï­\Ö\í5ü\Ë\Î\Î\×ùŸXø\á\æ’\Þ\rq5\Ë\Ïùòð\Ü7#ºÿ\0À7–\ßø\Ç×¯:ºÇŠµ¦o\ì\ß\ß\Û\Úÿ\0Î½¬X\é~g¯ú=µ­\íß¸ö¯¨/>[é©·M±†\Ö1\ÊC\r·\Ùaó=+¼ð¾­bYL3mOö?\Ï?\ÏÚ¥{W{´–•-—Mn¶\Õm¦·ò¿\ÝAr\Åkü\Òjö²\ÙY5\Ý\ë÷£ö‹þ	—¯Z\Éû,\\h·Ù¶¾#ð¯\ÄO[ø’\Â\Â\æ{¨­ÿ\0\á û6±\á\ë\ïôŸô¿ô\Í/\×?\é\Ö\×y¯fñ¶¢\×WWK\æ;G¿\Ëÿ\0ž§ü÷ÿ\0\ZüVýœþ9k³ï¤Õ®£\Ô.ü\â{Ht/hðþ÷\Ì\Óm\ç\Zˆ\í\íÿ\0\å\çTð\Ý\Õ\Å\Å\ßý?\Ø\Ü\ê\Ú[\ÚýŠ\Ô5m\'X\Ñt½sC¼¶\Õ4]z\ÎSG\ÖlfûU®¡\rÅ¸¸·ž\Þ\ã\ß\×ÛŽùõ0õc\ì\á£„T^½’\×\ç\Û\î¹\ÅU56ú?Ïªùhxæ­§ù\Ï!UH\Ö\æo³÷S\\Yóÿ\0ð•^ûn`E?rc…\ßþx\Ûôþ\\×­t’L’yŸ/\×ü´?Ÿÿ\0Z¼\×Æž)\Ð|\á\ík\Å^(\Ô!\Ót=\Úk\Ë\ËÉ‡ú¸ç…½¹ÿ\0›«Ë¯ôKOù¾¹®‰M»ZM½t.ÿ\0¢2I-‘\á´G\Æ\Í\à€\î5Ëˆmµ?j¯>Ÿ\àŸ;\çûc^ÿ\0ž÷õ\Ñ\Çú]ý\ÞOýÿ\0\åö¿§mSÄš\î©\â?_\Ü\ê\Úö½.©¬jW<\Ëy©O\Í\Äýÿ\0\í\Â\Óþ\\,{s^\Ññƒ\â6µñ›\Çú·5o:\Ö\Ögû†ôGŸÍ‹\Ã\Þ·œ}‚\Çþ¾¯9»¿»ÿ\0—ûëž˜®7O\ÓW+µ>o\åý8¹5\É6¥h¤¹UžÚ¶¾Ó¿Wøk©¼cÊ­{¾®Ö¹&“¦\Ç_”¯\Óú_\éšô\Í6×…§\çô\ïÞ²t\Ý4\å~_¯¯ÿ\0_=ë¸²²lmQž\Ýû{\çû~•Ÿ${~/ü\ËM­™¥g\Zü§j}Bõ¿Ã¶qß …oÊ¿¦\Ïÿ\0_Þ«\ÚÛ±»\ædö?†óþµ©¨þŸ\ägüúbŽX®‹\ç¯\æ\r·»o\Ôr«eBô\çñý=z\Ô\Û\ÚoÎž±ñ\Æ9\ëžÿ\0§Oþ½J£ß©ªÍ‡\Ô~¿\áJ«\×pü\Ï\âýýz“tã§·Òµ¹ÿ\09ÿ\0_þ½\0B`|²ôÃš*\ê…Ú¿7a\ØúQ@\Ò_\Å{¦»†\ê\ß,3Cø}?\È\æ¼\íg·hþ1\ß\Ëù?O\ëŸ\åŠö¯ˆnžú6m¿¾ü¿Oÿ\0_<Šð\Ù$\Üû@\Ü·\áøñÿ\0\êÀ\ï\è\ç7\âMAaÓ¦‘•Ù¼Ÿ‘ýlŸ—ù÷\ã¾kËˆ\æi#þ\ÞÔ¦Ž<¨¼ÿ\0ùyž\â\àË­¯o§Ò½#\Æ\rþ-­¿\Íuªÿ\0¡&\Ïùw‹Ÿñ\Ç\×øó\ßGc\áŸkWò]%º\éZT:”Ÿó\ÒóXÿ\0…ö\å\Ø\Ù\év÷ø\\U›\æÒ$d\ï{$½\Ôï£·M|\î\\\åõ”¢—›\è¾w>[ø\É\ã(üiñz\×I\ÓUÿ\0°üa\æY¿Ÿ\æÿ\0¡\çûGõÿ\0Ï³\ê:·¯úG9&¾ øk\Ù\í­WwÜ¶‡<gþXZüñø]zþ%›Äž0¸û\Þ-ñ\ÒYŸ\êô{yÿ\0³´ø?\ë\×\ì¶öÿ\0Ÿ½~ˆx-¼‹8[\îÈŸÁþOó\Íy\Ù#u–#\Ý\Þ\"£©ô|Ÿ;«ÿ\0$bú^ö\è›\î\Ì\"¨ºXh\Ù{(\ÎÚ§&”¤ºk7\ë~^m9š^\Ùo&\à\ÛXnþCÿ\0\Ö\nõ\ï\ém5\ì7R.\ÔGól\ã\éøb¼‡Ã°É¨M\Zª–ÿ\0¸}‡·\×ùó_Sx/K\Ûuc	ùQ3#ÿ\0ŸóZú+»ö<\ãÞµ«…±ð|‘ý\ßôo\ïŸ\Ý\àö\ëõýx\Îká›«2\êI;ži³þÿ\0#·¥}yñ+ROð½\æ\×\Ú\ÞO\Ù\Óþ\Þ9þ~¿§\ãó\Ze\Ü\Ýÿ\0\Ö\'±ü3þy¥?‰ü¿$Eg\Õ[œ ùÿ\0\é\ßúsV¦›\Ìb½\ãç¯§¿¯^¿§ZÇ’\ã\ÉUqþ\ßÓŸóÏ·¥H³/–\Ì\Ý\Óøÿ\0ŸSõþ}j@\â|]|¤7Í´¢}\Ìû~Ÿ\äŠð\ÝcTh\Ë+¸\Ú|\è\ßüO=Nµ\éž(º\ÞÍ»ù\Çùüˆ\â¾}ñôjdDoóÇ¯\åQ;ò»?\Ã}U¾\àŠ\Ùz/\Ð\àu\Íb\án&òN\Æþ1¼ûuú~~\æ¾\'ø©©M­|Lð=„\Óy¿Ù¶zö¸\é¼yQÇ¶oÿ\0·\ã_SxƒP*³6\Ñ÷>ÿ\0øû\×\Åw—_ÚŸ¼Qt²\èš&¡£ÿ\0\Ï9\î?\âaqÿ\0¥ž=+†´\íÓ§–\Íú\ßð:(­[\×\ákUn©÷\Ø\ë%‘¿_Ÿ\ç\ç¯øg>Àþ,f?w\î\äÿ\0ùÿ\0õú\â²fý\ïð\Î?\Éü*Õ‹d¯÷_úóõô¬ƒ²µ›k.ß—\Ó\Óß¿OÖ»­6cò®\âW\ßü\çü?—›\Ã#(\Ý\Ûÿ\0®GCþ<~5\Øis9+ý\ÞþŸ‰úú\Í\ZuWÿ\0‡^½¾ûv\"JÖ–öI¤ú§k?+ún—c\Ð!›tkµ³\ÛüO>\Ü\ÕÅ‘¶ÿ\0/þ¶.k\ÞE\Âó¹¿\Îp;©\ëžõ ¯ý\ï\Ï\Ïÿ\0¬*£&¯}V—z\é\Ó\Ïú\Ð\ÎÉ´“\æok+öó]ôülh,ˆŸu¿\Ï\è*E“¡¿§>\Þ\ç?_J\Îó?‹ž¸\íœþ}*Unw}\Ü\'Ó\é\é\íZ\Ý^\×\×]=,ÿ\0R’²o\Þ\Ým¥Ó½Ÿ\á¢üMA&Ï¾\ÙõþŸN¾\Õj;Œ~\ížùÿ\0=\Åc«¯ñ¿\Óõ\Èü*\Ôr\ÜK\r¾\Ý$úþ_‡\Ô5t\×q\'\ÊÕµvZwºÿ\0‚º>þG×¿³oÇ…ø|¾	ñV¡\äøY¿šV±3ÿ\0È\âKŽ>\Ûÿ\0b¾±ÿ\01\ëN¶\ßdñ\ãú¿KVH\îIòC\"\ÇÍ¶ÿ\0õô\Þßøõ¼ú}{W\àÏš\0\Ú\Ëòñ¿ü{ñõ\íù£þ~\Ó^$øwck \ë–7>,ðÝ„?gÒ/ µñ‡gÿ\0>6÷7?èš–—g\ÓO´¼ÿ\0ÿ\0ý;Pþ\Îÿ\0A«¡[‘û:ŽÑ·»\'«V\Ú2kG{\èô\ë¥\ÅR\noššWÓ™_£{\ßË¯ª\ê~°\Ç9X£]\Ì\ïò\ÏI=xúÿ\0>µù\×ñ\ëö¤±OˆS|=øw¢ÿ\0\Â\\\Þó¬üI\âÔ¼­=c\Ïÿ\0HÒ´\ï³Z^ÿ\0i}þ<õ¾?Ó¾\×\Ïúp?¿nojž¾ð\ï\Ã\n\ÜøVmZ\Îk=C\Äú\Ýýþ³ogq·¸ƒ\Ãú~›þ‰¦\Ý}“þb×··\×\Öÿ\0gW\ç-¿‹¼I¢@Ö¾·\Ót´\ÞMrðý¾ý\æÿ\0žÿ\0h¹ÿ\0=y\ÅkRµ&¹y›\Úü±•­£µÚ\î›Û·™Œ(\Ô\æri-´o\Ó\ËôüU·µOŠ:ö«4\Öÿ\0<cÿ\0¿„­¿\×xWÁø°\Ö|A\ÇúCW¶ÿ\0K¶\Ò\ï?\é\Ï\ì8¯—þ6||‡P…t?\nÇ¢xÁöpùzj<²\É_ôù{8õ¯ž|I‰¼U#Í¬kÚ­\ä™\ís\åE\ê?Ñ½ÿ\0¯¥y\r\ï\Ã\ëˆ\æ’EW‘¿\Öoqû\Ïÿ\0Yÿ\0=k–u.\í\ÚÛ½úm\Õm¯};Â‚\Ñ\Ê~±Jö\ÛF\îº>\ß\äkj_<à°nòò\å-­­§û/¯\×Ò¹[¯_\\\r±\Ç3\ï\"(¸þ_§ \â´!ðŒ‘0\Ýù>þþŸË¯ÿ\0ªº«	\Æ\nn‡?çŽŸý|\nŽy6•õ~^Ÿð\åªp_gô\íþ_\Üy=\ÕÇ‹µG\Ûo\"Y¬ƒ\ä}†\êXÿ\0Ÿ\×\Ûjö‡ð¦ó\\¼†mz\â\ëTbÿ\0òøó\Ëy\éþÿ\0œÿ\0œ\ZúOð¼jU|´_\Ãü\ã\ë\×ñ\ßiú|6ª«\åÆ¼ÿ\0œ~ž\ÜRt\å/Š\î\Û]ú_o¿úH\"\é\Çd–\×ik¥–út»\ëv»\ï\Ó|)ð¿†ü,–\íöH\Ù1ÿ\0,\Ï_q\ë_fh>8\ÓaE†\í£f>O\Ý¼zŸó\Å|]\ÃFPý\Ìþ\'ÿ\0­øõ­[}j\â4r;lûŸ8éžžøª>W}©\é\Ö\Ä\ÊQ’³\ßFúw\Ó[\ß\å·k£\ï\Ë]kGÔ‘—t\r¿øûL\Zž]N¼\Ñ\ìc³?þ¿ò+\âm?\ÆW–¥v\ÈûŽ>Mý¿\ÏÓŸJô\â„ñˆ\ã’m­üûþ<ý;U\'î¦·M-?Ï¯\ÜM\ÚÙ´{ž¡\à\ÛY•¶\ÃõûŸ_§>¿JóýS\á\Ü?6\Ûsÿ\0-¿€\Ë\å}3\Ç\ã\ÛÞ·´Ÿ‰V“ªù“maûÏŸ\ÓüŸ~k¶³ñ•|¿3 þú;ÿ\0ùïš®Xö_q)%²>Mñ\'\ÂÕ‘–\ß÷Ÿô\Ï\éü\ë´øñ\nó\á4·ñT\×-ð\Ã[¹ûEµÏ—\æÿ\0\Â¯\\\ÌV\ßþ 7—|\ë\Öò\áÿ\0!ùþ¯¢&±\Óo\ÇÊ©\Ê|ýzþ~µ\Â\ë\Þ·º†FX\Ósÿ\0\äOþ¿\ãùf¥E\ÆJQ¶\í\Ó~ú\êš{?\Ílÿ\03\Û<A\çi~L’Ml\Ë:}¡/-¦ól.,\î?\Ò-\ï­\î?\ã\Ò\æ\×\Ö\ïô\Î+ñö®ø\Õyñ[\Äqø_D™\×À>¹›\ì~[þ\ëÄšõ¿ú=Æ¹?ý\Ïþ=4û{\Ô\åôW\Û\Þ*oZø\nó\á\Ì7\ßñM»\Í%›ùñ4\Ñ\áóþÑ¨iZ~¡ÿ\0v\Ú]\ïüúË‡ú_Ò¾%Õ¾\Ü}¶®ªŸÁ°ñ\ÏôÁý?\r*M\Ù+4\ÚÕ¥Ñµ¤_Ÿ];w\Òa›mÛ¢¿]V¿ð;\'Á¥³y\äóý=ºÿ\0O~³N\Òx^?ú\Üûtþµ\ì\Ëð\Æ\áN\å†LŸö?\ÎkA|u\n¨Xñþú~cóÖ¡I7k\ëØ¶š\Ý[úÿ\0‚yýŽš¿.\Õõ\ß\×ô\ãñÿ\0 \×Yk§ª…m½=\Çù\ÏLþ¶4;‹_½\Üc?\'ù#õçš‘m\ÙJ\î]¿ðó×¿\×\'Ò¨EH\íö\ßú1\í\ïú{Õ‘\Åùúg\Ï\åþ8«*£9Ý»OÃ¥Iµ7+|û¿ƒ¨\íÇ¾,úu \n«\ÑòüßŸøž\Ô\í½öþ¯\ëþ5k·\Ýüy\Çùþ¿•1—vx;sÿ\0\ê\É\äw 6\ãw;OóþŸ\ãú\Ó{öÿ\0oò\ã¯oó\ëSßº†Mù\ïïŽ¹ü;cÿ\0¯Ú€À\ç°ÿ\0–„Z) °\å\ì;Š(ú,øƒÿ\0\×\ßõòk\Ä%û\Ïøÿ\0*(®ùlý\äsœuð\r­Xn\0\â\Ìc#8\ë\Ó=+\ç?ÚšI ø?u\ä»Ãºmm”\ÍXhW8c°Œ°\ìO#ÖŠ+\Ë\Í\Ý1?õ\éÿ\0\éP:0\ï˜_úýOÿ\0N@ø\Ó\á 	\àÿ\0	\ìq¦ýÑ·þ]­ý1_¡^ÿ\0(?\çEžEþ\éGü¿ôˆ\æ_\ïU\Ç?\Ìúo\áÚ©9*	õ Û¿^\çó5ô÷„\ãú?ú\á/õ¢Šõ\çð¿—\æŽ¿\ÉþÁnOü~C\ß\ÜWÍ±uÿ\0€/ó4QZO\â/\É-\ßú\ßûfi\Òÿ\0Ç³\×1ü…T÷ÿ\0·\ãù#\ÅüBO\ïyÿ\0–˜ü9\â¾tñ?Sõ?\ÌQEgS§\Ïô5‡Ä¾“<c\Åñ\í\'û³ÿ\0*ø¯Ã¼ø\Ã\âi<ŸøK/9<Ÿõ\Ýú\ÑEyõ>\'þ\'ùDé¥·\Ê?“;Yú?\Ð!Vôÿ\0º?\æ(¢±Ÿ\Âþ_š5:(¹Ûžxzþ5\Õ\Øu_ú\î?­P¾\Ïø_þ\ÚgS\ìÿ\0Šúv™\×\Ûý\Èÿ\0\Ýþ†µ“\ï\Çþ{µU/‚??\Ê$\Óÿ\0—\â_ûi0û­ÿ\0þu(ûþ\çøQEiÿ\0/?¯\å5\êý\ç ^ƒ\è?•[O¼?\äh¢ªý½/\Ê&/”$LŸ\Ãÿ\0þ•õO\êh¢”ö^¿£>?ûv_œNKTÀ\á\Î8ú\×x«\æ\Éò¿\è=(¢²62°7·\ïŸý›ü\ä*EŽ6\Î\äF\é÷•O¯¨4Q@\Ý\Äqþó÷iÿ\0|¯·µ[\Ó\Ñ6‘{õ\ÔQZCÿ\0’ÿ\0\ÛLgñ?—\ä\È\0ò›\×\ÓÞ¯º\ßð\çE¡\Ùz/È“øÿ\0\à?Ö•z þTQ@\Éc\ïøZ±1-–?\Ô\ÑEaSw\ë\Í;¯Uù.™$Ÿ»ù\ß\ïy¿\Ù÷¯K\Ð\æ—\Ìÿ\0[\'ú±üm\è=è¢ª¿O\Õ·~¯ó=‹Cš]\Íû\Ù;ÿ\0z}k\Ó\ìÙš6\Ü\ÌÜŽ¤Ÿ_Z(­DrZ\Ôq²Ë¹¸þ%S\é\ê\rx\î«?7\î£û\Óÿ\0…P40\îO\ÝG\Ï_‘}~•–\ÑG…ý\Útþ\âû{QE\0rZ¤qù²|‰ÿ\0-…Â¸Kø\Ó/ò\'\ß?\Â?ÂŠ(ðG\çùD\æ\Ûýrÿ\0\×AüIE\0T/÷\áü…P\î/\×üi’ý\Ãÿ\0\\\Ïò4Q@“\ê3EPÿ\Ù',1),(5,'EdredÃ³n Microfibra',70.5,30.05,0,'2021-05-05',NULL,1),(6,'Cortina Cuadros',30.5,10.05,0,'2020-05-05',NULL,1),(7,'EdredÃ³n Promo',70.5,30.05,0,'2021-05-05',NULL,1),(8,'Almohada Gruesa',35.5,25.65,0,'2021-05-09',NULL,1),(9,'Cubrecama Grueso',60.5,34,0,'2021-08-09',NULL,1),(10,'Cortina Rayada',30.5,10.05,0,'2020-05-05',NULL,1),(11,'Sabana Fina',20.5,7.05,0,'2021-07-07',NULL,1),(12,'Funda Doble',25.5,10.05,0,'2022-01-09',NULL,1),(13,'Cojin Bordado',15.5,5.05,0,'2021-05-05',NULL,1),(14,'Almohada Ramola',35.5,25.65,0,'2021-05-09',NULL,1),(15,'Cubrecama XL',60.5,34,0,'2021-08-09',NULL,1),(16,'Cortina Fina',30.5,10.05,0,'2020-05-05',NULL,1),(17,'Sabana Gruesa',20.5,7.05,0,'2021-07-07',NULL,1),(18,'Cojin Redondo',10.5,5.05,0,'2022-01-09',NULL,1),(19,'ColchÃ³n de plumas',98.5,60,0,'2022-11-21',NULL,1);
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
INSERT INTO `usuario` VALUES (1,'josemar27','61af2d40a529d40298efaee15a7f4f87','2018-04-20',_binary 'ÿ\Øÿ\à\0JFIF\0\0\0\0\0\0ÿ\Û\0C\0ÿ\Û\0Cÿ\Â\0\0\0\"\0ÿ\Ä\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0	ÿ\Ä\0\0\0\0\0\0\0\0\0\0\0\0\0ÿ\Ú\0\0\0\0A!\'Ã¾\æ$î•€”`J—ˆ,d\ÆN\0\0\Ü\nL$/H—¸Á©Y oC—(X„U€\àGE…¢Ó…5LL[\ëP\0ª\ÇDÉ‡\î\á.W=\Ö!È†}uZ|‡˜\áô\Ñ\ê\Å<À\åW\Ñm¼Ãž\î:\çj\Ûr{^£\ä\×=L;}£¥\î\Ë\ÏÌ›[~š\Çø~C\ÏXU|ŸVÐ¾û\Õ~e\ëyo÷¼u>‘\ÐU¹‰]\È(˜¹Ù½¥“0¦T\ænx\0¦ND\Ên„ŠR(d†\Å\à,P $J2(”2´©9@\î±@¦ &%SqÂ P­ø8Z‹BN¦(\È\ë¸V$rˆ1‘``#„‚\ÑB‚ø€®™\r\Ê\'°¢d%\à\0J“+b”†U\\¼\"ÀIDc¤)Pe°\Üt`P\0\æ$<6DŒvÎ‡\à…5\Ê1\Å<ó\Õ\çú\ëó½;½\Å\Ü\Z\áfß[užÄ°Q´õ!ÄŸl\ÔÒ­\Ñ\íª\Ñ/vJJš½¶-v[ž^¦‡]¹#›M\"Ê­†f«jöXVÑ¶\ßn|\è“\áv>ŽJx\ËO\ãtýÎ­9\Í\é<’d\á\n€NŽ\0›s\é…1#•I8 h‰œSpb+cˆ\Èr42`e†)—ŠU ¢½e Ú‡H\écp,?À»®U9k%9X\0©\Ü\n\\b\Èñ2š\ãI’°‡I•T„ª\Êq„Éµ|dU[DŠ%\0Š\å¤\0\0h±\Ò\èªrJ†8¦V\0=®J]Yùs&pDÀ‘¢fü\Óñ8GŸ:Xý9\çLv¹\Ý\ã\Ûi†\è\àŒ˜\ä/¢\ÄÂ¨I5c!m!`ŠE[ew‰iôiœ\Ê6xu\\ŸÒžjguZ\Ý{t\Îsjª1­\Ô\ë\Ô#zd‹˜‹*xšòAf\ê!ýš¡,¯¡o>mK\Ó÷ý\Ã\å÷«<\ï[\Ò\î™:\ãu\n\ÒA7uª\n\ÆM3<M\Â\Ö$b€1ÀJdŠ÷ª\Â<\n¥\âDB\à„P„¬¬A+(&¢V\ÊrVx@\\€C€œ$:*Ä¥U\"¦„‡Q1¬‰\Ê!\Ê†L†ˆ`h<\nÉœ…H €%\"‚`$¹A\00ˆL\Æ)“1~\ÒX*+‡ ’Ð¡hSt’e\r\\ªù;¥\Ï\Ûü\ËL®ú*‘“Nur\Ï)[8+«‚[”³\Ù)\×QZ`ZöŒ\ì\Z^_\ÛU}¼T‰±«è–¼zóN‰Ì¯M$ª™½ù®ú,¡…²¾\É+/S½†…~\ÝA¢\ï4\Êl—˜®­(\Ý4}*x­Wd|—P/£zoÁš/«\î\é/6\ï\Þ[·dAfY·$Š­MŽWn²!Åº®Q–]“\n\Å0\ÜdVK\ÅDJ2!+(Â¬*b“¡S‰\Ë8\Éõªªg„ €PSVB\ng\Ä0À¡x\à£À (\ä15SU8ƒ	¸§Š `(PRn2m/n\àt/¡*¦%\ÕP(£‡#ðÚ¨¸\n‹S=\æ\ì¯ô\\U	\î÷&)ó¥Yf\æ*Œ\Ë4l¡X\Ø{­R1%i\ï\î¦\íXƒ´½tu5h÷HF«Y\Ýs\ÚÎ´\Í\ë¨\é\Ì\Ä;B\Ùõ\ë=µjÁOdn\Þ2qlqKBO©Yz¯´¦–\å2‘ñ\Ôj¤\Ùm\ÛK}U´[K¤¤i\n\í\ï¹Ý’öŠt&-~ú}\à\ïIù~\î®X\Éü[\ÒœR\è”–TÁ¹5•0P)H\'+\Å8@‘ÀJO\ÌÀN\04)˜A”\n~€œb\Æ7–Š$¦ &(‡Å¡Î‘Š›„*&DüÄ¤P®\n!2K#q¬€\"BO\Â\0ªˆ˜N/ƒ	@?\n\áSJ`e²{¡8stg(+@¶„üf–o\ë|\ãT\ïÑnb÷¼^©\'¦\â|¶¥´\îÕ¬\áÛ­ŠBµ[e\Ô\Þ\ä³im\ÍhÛ½vem´\ék\é\Ítj©\í«H¨OZ+|\éwuÀ\Ìã´šT,tKâ¼’R(·›.wñ–#an•Ç®µ9]·²T\'Aµn[\rAp\ÉJ\×K\Ñ\ËÁ)Š—¯<a«OeaŸW§\í~Wµsõzr\É\ç}\Ó\Ù$ªò¼Í“I²Qt*(9[JtÎ„ª 0‘@7‚j ID”hdŽAt—S\ÜT\Ý8ü”&\á0$(”H&„’Ð•5n!\ÄU“„	:b&S’t\âˆn)ÁÓˆ CpH±8(@2€\àð#Àš€Â¨™apš\Ù\ÓRó\Å$\Éýg¶\Ã\æû¼i˜\é)›j‡–l =a’®\ÜÝ¾º.¹¼õ\Îi-\Ë#¶úÕ”\åsóq,5wù\Ùb£\Ç\Ûë¶	vB«‘f»4hùg‹­´Ë¹†U\Ä|•VÀ¡d¶e\'\0»£jô}P\î&°,\Î\ß\ØQœE\\«—æ€ºGX\"\×Ù°”dj\Åuž\éÜº¦\å#4U±»QT\âÚ»ª-/\é9\Ï\0Ý¹ýh:Ì´\î\']b”ôiWŠjØ¦L\ì€ÀŠf¨¤„9Yx\Ü(\0¢-<`R‹Dü™>xH€qQ\à\ãrPp¦ðR\îW Á\Â€95YS0\ZN“(š•±)²÷‹rk¡\\1\n,\Ä-“Š£y\\_žM\å®÷…jÀI\Åb+[\ë²\Äòyƒúõ\Ñ\ä4\Ò	KO––\0‹i·%až\Z^?IVD\Ñô\ç\Én.ÿ\0Yj‰\']\Õu}ô\êq«a§Á±‰kn60-¨U©L7J%Oœ\Ø.shõ:®­E\"¾½\Ê^\Ä\É]\\\Å\Ãàµº\Ë\ÑLypi\ÉX\Úù\àkS‘SI6½‘(aGua„»\ÙDÝ¢&\Ù\n»\"þ\Z/¥ñ\ÚW}\Z¸øg\Ô>K\Ôh„b÷›¼l½lO¢¨A R,P0I\Âa\ÓPŠ\0HrJ `8\0Zp”q¸Z&¡H˜ƒ[q­C*‰Â¨p\â™’B‰\Ç\ã@\ÆDŒr\Â*$¢’d\íSQbÉˆ:ð¦vœF²C¦.«µS^_¦FúNTóû<¸\Ú\êRÎŒ\'\ÙŠOç™”\ê)V4(\Ò5:Ü©k±c^\×r6u¬‹tC=ÁN\ÜúCO®ü­]jmlÈ–\Û\Ã\ç\È\ïKDÀ‰¬L­Ø­’\î\ì6Ed\Ò\\‰”6Ó­_E\Þ!\Zehë¦—S½*Õ—\'.±\Ô\äm7Xžl‰ô,L\Þ_)Á\é›\\›\Ñ\ä†^Ê­Ç“5\Ö\ëòš‹â°•Ø‹^tõ6VZV\Ú]¢ô¸>P¥‰¢h\Õv¸wû\Z\å\å_KùUh#I~´Ì¢ª¤¡\ã\Z²\0ð°Àb\Ô3õ€ª¦xS”Ž!À1O\ÇXT\ÔM”\Ã\Æc\Å•S„@D¦!&\á\"•S€œt\Ýx\ÄswqPMBY9d”¡\ÌR‘ÔŠ	d”¢5ùdý_\á‰\Ä\Ô{\\‡Ëºz\Ñ(u«œ6N\ÈL4½…\Ý\Z\ë¯nwzuPô‹…“>ü\ÎÓ¨Y\ë×ž\ÏÞ¬™÷f¶{„\å6\×,²h\×k\áIû\ÇLœµnjAPi\ËÝ˜\Æ\Ë\Þ\ê	CLü4•)\é©º,/\ZB0³6K\"É¤jˆ¸¥=Œù’\ÊDu\éÉ¯&KKŽz\è0š\Ì-¹q¸mÂ¹~O+dž\é\Ítsü`®¿\ì\ä¹\è¥7I¼öû\Ú\î¢Í’…žn1ö×—k¸v»\î\å=\àzg/R¼yž\ÙPµ”\Ô\"‹5H\Õ$\'\ëáˆsŠ™TM§\êB„w)1JXWM@3Œ™\È8\0EXÁ\Ð7](ª2«$\'\à(™\ë`\nT‰¨8\ä5l1”#‘XEH\ï³¯zŸ7-—’+·\ÍqfˆžaeV§ž+\ßkÔƒiÏ \ÅÁ\éxú‹l\Ö\rg—Þ¥N\Û\Ýf\é3³NMf\Ù5\"Z´²i`EociFU\ì\Â\âB2EÃ„H\Ä<Ûˆ7p-*\ÍP\Ï\Z­Ì¤(ƒ†õ\Þ\å\âŠNY7P5k#Ã£¥a™\\4p\ÌDY»)FS-k$›j\ÔVk¶Vº1\æXÇ©i\Z¹ž«ú\ÓÌ??\0U¤_,\ÆÁ‹HQ~\ÓXB\ç[\æ™þ]ÓŸC…\Ð2i¾z?\Åþ“óû\è¨<Ý„ðU\n\à…9 8&¥l~(¬\'q-@9yXè¬›!8Ê†L£\Â(()˜¥e2\ÅN*\à ð£Ä‡“P¢ˆ°‰€¦G†Mb,\0\â´\âð†\á\ã\ÈCswNò¦\Ç\ãþ\Ç[(gNõþzb.\Ìþ–™)\ÑD\Îö\Ú2\å²3š\Î^š~ƒy¢p}Lt\âRY:Î¥Lº\èydºe)1²YÃ†\ç:^\n®`\Çu\"<ˆœ|cVQÄ‘r\é9!&’,AM£ª	ˆ¼Lb¦\Ñ\Ø8‰t\Éó’\ä™[2Q¨gi6H¶²m•¡Ð’Š50‰™A¨‹˜r\ç¸_§ªz¹¾†ô÷—:^r\Íd¥l5#W:\ÍVÄ¨Á\èÕºm\Ëuœû¬£IÔ¨ø·{6Bk\Ëw‡¸\È\éˆ\ZB”\Æ*‰a9xô7$±lDx\Üð@I p”y#‚C”\íP1‚¡LŒ\nK¹8N@8%\àRq\"b(„¼)&2f•T\Ô`Z\Ìÿ\0št\ãÁ«L\ë~\ï\ÉW\á¼¾†\×ú\æ¿UÖše£R\ÊNÀ¸²O\ÔMŸ\Ï{’ ÷Ÿ\Ûu$Íµw*£ù)*½ÑžI\ëGõ‚\Ê\ïœWg\Ø\Éq]þDP*PW%|UG!&L\îÊ´p\ä	QWP¢‚‡ud\Úe²Æ Ñ£b¿JHúõ¡õ\È\ëTb\ÙŒ\ÄL,a%¤4\Û6ª¼\ÖM³\ç…g5\Õ!O¸V.\ÏTÁ}\r^\ß\Ãð>‡\ÙS\Í{_\\ò\æ¥Xý3Ë§%=\Ç;t½Ø²MQn\ëf¦\Ü<\Ï}	r\Þ+ e<wrñkÜ›ƒ\å0J Õ\Ä—€P€ €œ®¼¢kEWŒI\Â&r”\'\Ç`™UNN0ò±Tö+uY’„3¸ ³ó\ï\Ó\ÞRô¾y¶sm¤wy-“¶F°\Ý[\ÏS|	­ö\ß\ê[3¹s¼×§¸Þ¦MA{N·0²+º=\'\ÞÇlœ¬%\Ópõc;Aº¥–enY\r\n2ª«\Æ;t¨,\äÍˆ˜ñLP\åvÁ3º=µ²:\ê‘Ò­–E%*€v¤\Æ`\Þl¢W\r/]°ö˜lL,{W…³=e»ö-Tdló\'®¹b†²š\íf\á£c\ã >y\èy¬–ý‡]ú\\O@\ÙñIZd)7š\Ö]•/Zy\Ñ\"¿H\\©÷?5\ÞdWË©€\êEaŽA@\Ý!@\é\Ä0@	œa\â( ð’q\ÈR9RW<\èS•ˆQ+NÊ“¸\0PF\Ë÷4!T+(ÀD¢&bÚŸ,yZ\Â}Ç‘fé¬žürº…?YÏªÂ£Xº­®\×mHÕ¦Ù³g;?\ÓN\É2š\Ã\Ý^R8Aµ“®\ÕÝ¢)c“\'\"\ï-2\ÑÙ’M\Ï/\'I·ek½’dT\Ê(\ÈB¾\â¤\"c“\Ä*þ5kPCtkCx\Óv1\îåŒš8\ê\í:j\"Õ¤\ÑB­†[\ÈvK;¬\ÅGK\Ç#0a4Œ\r\ä\"TÀ\Å\Ú\á•\Û[sÕ£¬p,ð³Ä¿56­r‡»›\á¬÷\ÜG\îyô,nd\×x\Ð3ŽÇ¨\ÓG¢úg¢ù\×uñ^…t\íL9h\é¤\à€œ†\ã¦t\ÝHa)€<P@D¬\0uc”„T\Ä\ì\n 1^&qˆT\ÕL°\0˜1\à\è˜ƒE\"¤E%±D\Å!A\Ð2q|óƒ°F{¿)ge£I9{k§e\×X \Ü1d±\Õ\Â.\çŸ~‰¦\Ôm<?Q7%?Ÿ¢\ì\ç:\êc(\Ðe®›$\ê»\'lµ»½ˆ£•^¸k(\Õ\ÜW\î‘hYE\ËeHH\ÇY\ÊG;3V¬\îX…\åX©G4tu–%\ÎHNqQ¢’7n\ä\êJ“¶F$Áú‰lq_$b\ê²=„»zš•‚,L{\Ô\n°#¨v¥”\rŽ6\Ê\ë\r\ìM]b½`Œ¿,?›=QD\ß\ç¼E¦\æ7-\'O¹£\Ü\ëOòi\Ðý™óû\Û<ÆŽ²}\Ã\ì\"=\Ê\âQ)T\Ê&üNQ\É,¨Q\à$I\Â ¤rÁ\ÇIx\nB˜°ñ\É!8:=2J@2J\ÂÐœ8\ê\Í\Ô\ã2£\Ï\0\Å2·Êš\Ä]žxô/–6s<^«²{o0þýpÉ®\ßM«Ü«z«\ëz‰{[¿X¹½\ëòû\Ã7\'N¹T\0\ãJ\æ\çn\íW3\åy[lU‚\Êù\áTŽ\âM7\ÏK—M^YT”{Ñ¾·gmBm0(\Z µ\è³k\Ëi\ç©”©¶\"X\åHôcLô+ \ÏUj©E¹¸°N2lA‚\ét¹\ÓdÄ”š¨ýEuGfY\Ò]ûD:´c	V‚F\ÃMÄµ1P¶fE&2\Ûm0\ÖVZp`¸/±2®§™óÄ½[_?K‘¸Qeh†£f\Ñô˜\Ù\æƒ\ä½1\n&Ë¬€r\ã€\ÐA»„,EH\n4HH¬‰ˆ˜+s<9\0P¤ …€Ü’\ë\"\Ü5Š›!*	L¤€rØ a\ätøÀ‘p“©DTþöŸ\Ïþ\×2y\'^ôü[\Ó{¦M\'¼E\ÇWsK<Z¦Ç¦Á\è\ÜoH¡WŒ\ÇÕ°\Å<¯D¨’Hh]\ÊÌ…\ÊÉ£`±_¼\ÌL°’²·H•(’Ç†‘¬Ë‘³\ÍU9hvŠ\ê(\Ñ\ÚºB^ú€R#£¢°Y“=-µÅžA´°\Æ\ã°d«	$h\×dX³s$!MU\ÌÚ¾\"´cw‘\è\î#ƒ•n\ÜB‘«\Æe`¡\ç#Ã°$›¦&\n\ÑU\'R²\Å5p©;VÌ¹\Ý_\Æz*6%\éls¥ÄŠ¶DKYEš\ZzöP}gó\Û\Ý~[\ÐÏ—»‘\Ø\â*’“ñL€vŒ1¸Ä’]\'\nqN…]7P9R˜,š\Î1A\Ô\Å\ä\Ú;0/&\"¬NS¤!¸A!#)‹\Æ+\Ì;¸b·ID\åP;ý½\áOC\ç•AÝ›»†gb­W³i¯KGV\Þ\\m‘šþ”„ôŸ\'\ÑÉòY:&\Z­\ÓrŒ,2ó4•vmudŒ²™ºÄˆi\ÕJ‹”/\Ëdt°pGŽ™¿½¶q\Â\Ã:B<‘c\'m\Ý–ª\0=M\ÃK+EbòØ©\ÐkC”(\Ü!`”ˆ±¬d\ÄZYp’GŠ\çjˆNN9Z0\Ï\Ð@HY\Æ@@!$\Æ‘ó,HN‰¢Q\âV¡,µÆ©’2ù¡s\Z··“•0´@\ï\ácr\Î\Ùi\Ç\è/<\ëMj™4÷3«ÐŽ–òž„¨ñ\Ò\ÃÌŠ’K§x\ãT\ÈðñSs*\'\à„@\Â\n` 2€”\á…#)\æ\àu\×JPª+7\nÀ\é¬§\Ç ¢|aˆb˜,\Ü\çòÏœö\\?\Öy\È?Ma÷«MÎšz\ì‘Šf\Ùr\\Š\É\ß7µ`½\ÂNñý#\Öò\ró\íj\Þ1°J#$º,\ÂU\Ùû\Ô	~xY\Ù\Ñv\Å\ÉÎ¬\Ýµ;\éH÷*\É*­‘57S&úµ dšÀµ\Ô˜1\Ï\Z=K‘ºR\Ùa„FIU\ë\ç‚`…­4EAi˜¨\ÕY¤„8\Õkó×«\Õ\Ùuh’\Í[r9 ­¼t„tˆ5|ƒW\nƒ¶µ;J~\Ç]t*‰¾f°T{¹ðõ\×ñ\Ý4µ\Ñ:›\Ô\Îg¤\ÙF¡t\Éój÷Ÿ#\Õ<W§0¹ôðp˜ˆ*•Š !œL!“\ãBQ\à\0Nbb$@€9DJ¼IÁX&C”‘Y­€8ŽâŠ&V!øŽ†!ŒÊ”l\ÕQ2ø»)[½·š½G»›d\Æ\åj¦±µD1Ï¥Î¤¹°v]\ÈB\Ïr=$ ™õE\Ê2jÎ¼f\ä].\í«\Öw²u«\"¼›¸Ã™(\ì‹3!*Áùh÷HÉ¬p\èÆ²¥\Å\Äu\à\ÉJ2,\Åá–„\Ë¬€wŒÚ¤„¨²eQ6¼\ì\ÅpWh\ÑVˆ\åo%—r:[¼P\ÔÖ½nVŠ‚¸¡\Z%G\ÍQ\ÙÜªµD\é\nŠw\na\Ð2\åb\ÎÀ„«Õ¬\Õö®\É…¦hù\Ùmj\ëI\èpózn™“ôx\ê\ëxý\ÆÜº&™\ç}Kÿ\0¬ü›·yC¡¹]®r(HÀ™\Ê`“Hb˜–)T \ÈE;2|\0	pJBSº‰•K\Îz\ÈS:g †	YxIÐ˜@\ÈL’¡j\Å9C\á\Ûw¯Á…H7?¯\à\Ön´Kxh\Ý—·C\'=P²\æ\×h‰”\æö\ìo’{\Î\î®UÔ¯J%:$Ï½‰°²­ø_0ù›ò\ï\Þ\ÇÌ°~\á£\È\ï€	j»X‡\î\ãRü\é#}mŽ\Ð\ë¡&Š>>2\çÓ‘8hùZœRx\Î\äj\ÙA§H*jn\éu\ì®-\ËÎ°6,±%Q\Û]M\ÜF>£I˜ªò\Êa\Ü\Ë4‰Y*H\ÙXª­ŽY±H\Å\ãR”øD®\Âfx\Æ\Å3fT\í\Z«\ÓóøöY·\ä}E\Í^}¯›s‘kgd°z¯Ç¾‰\áv÷™jôŸ•ô*\éVâš¤b\ãE‡8•LD„–)˜Œ’“t\"S£À\\‹9_Šr\ÇH^3ŽÀ=UO}\â_ex³Ç…¬¯\èy2\Ñ\Ï%+³H\Õ\á\íTi«\Í\ÃZ¥ª\\©ºf²\ä3gqÔ‹Y*v¶‰µ\Ö]%g \å ~þ6e4¼v‘\×L\äŒ\\µÊ‹g—A\å\È\í\Ãtn®]“g(ó)Š$;P\å—t«½9Kø–\Ö\Åù]2¢¢2F¸\æ\ì\Æ$IV—‰¬±\ÎSG\Ï]\\µŽ\Ìvò1¦šñœ;Ç²:Z\"»¢¤[Ê«\"\Íû\'d‘‘d”EE\Ë\'˜\Ô#ŸÀ#J7R\"Ä€°V\ÅP\íhx\ç‘\ÏL=Z\ß\\\èpª—¤°]¼¬^+R§n\ä\Ý\î¹\Åö-™\å\"÷“o­\ÜWo>7\Ó2\r6A@\ÉœQ!1,P0–‡)D^qHE\nA“ŽQ`b\nŠ\îT\0\épVL\Æ(^, Œ)©‹\É*R<\Ñ\è¯>wxþižhŒ;®\èüú®·Zd}v8û`²\á#lý)E>\å÷\ä¥!%)\Ö\â\rp¶£\ÌC\È-–)\á«\\\ÊÐ²\Æ\ë$„#–\ïc\å\ìªA\ÓEt\Ñ&Ó†\ÕVF=\Ë\"\Òd„Añd˜#S_S°+«+p±$t\ä®8AJt9AEœF0q]\Í\ç\ëW\ÏE¡\é³C=KAf©À\Ùt\Ò\ÍxC¼lŒ˜³{!c\Õ@\Û%\Ê#\Ð\éUAksµzY\Í^I±f‘Š7Q?\\ù‚°•»}Gwc\0Ü³\í\Ü|X®,\Úyµ«U¢ü·»\n\ÑY4hNM©y/Lº|lº[(SHE8„\Ã\Õ\Â¡	GŒ\0À\åaµI\ÊJ|¨HŸœ\0”\Ê\Ä7=\Ò#\Z%{Â¾\áð¿{‹V®HF÷y\Z^“l›u¦Aª›&¥”\í\Ï\n\ÊÉ‡¹8\ì\Ç\å÷ŒíŠ•\Üõ^\ÊNª/E“‹5\Ô\í\Û\Ê\Ó	Ž\Ç(·dõÌ§˜¥\ïÁ\è\Òù¾›~o^4ñ=Ÿ\Øòþp\Éô\ß>m®¾Ö¬ù\Ædk\Ý\ï\Þ^¼GÚ£\ëò\Ût“¨­rØ£ûU\ì\í}\Õ\è’\éNA]~œ…&V	­R^­3±g\Í6’\ã.E³\éŒrø\ÉV\ÈLi%]®7*«‰¶\×\é4”}\Æ3\ÏR+6†\í³\ìŸe^5:\Ä\É\ÅB«G\0¯^ˆ±ÕŠ7b·F…m\Èzžz\"jµ/\Ñ\ãN´e/\Ðò\ÕZmöy£&¼g¨p\"ô5\ÑV(©ˆ\ÄD’`e ‰«qM\ÏX‰Ü¨\\¤Edd‚q—!\r\'(™•Œ‘À,€S¦µ\Å|ûúóÓ¿Ã¥]i;—{˜4\Ë=ö\rƒ|±.8z\Âhºh4‹\ß\'\ÓK•\Øú2OZ¸ý›h\é²M\ãÕ˜\Ûkÿ\09)«¢jxu~\ÜÒ¤¤T:œ}†“HÓ‰‚r²š2¯mŸÞ¯\Ï\ãˆrT¼¿°¨Ë›\ÙôŒç™®|®þ\ìL\â\Ó.\Ý#(O(\Ók\ÓrMm\Ó\à\Ðu«<Ô­rP\Ü\å\Â\ÍÊ²d\n`\ÐJM¶„+¯¥EI†’9É·rÏ©™\Þþ&…œÕ¢u\ã¹Od.Í°\È\ä¤\Ïv®œ¥VúW;\Í;6\Ë\äö \ÇGÙ–¿	]²u=û\É÷Ú½\n¶3kª\ë->V.¥—lù\é>rõ\'œ:žzžúŸ=\ÙóV-3=\ÕZ¸k®w¦sú½«\Ú|—¢I\Ç&”Š¡p\"K\Æ\n¡TPR˜¤§\ÇH\ê!DLª–\Ê\Ü\"¨›MÁ$!\ÎyB€&)¸‚‰¹•2rh­¾}}ðok\\\Ö!ú]*9úmua¬ÝšX#Phšt\Ë]_6\Ã\Û\Öp\Ü5\ëò=’\Øl—œ¦w[Ûƒ\×=õs\Í\Õñ•\ÇÑ¹þk(®.—E~2}\ÙH!»Ã•­’^n\Úa›h\Ú%\Ùü§[\Ý ¨Ñ×·x\ë*ó\ËOGÇ™ŸjX\îw\Ý÷—\ê\Ú<{µ\á\ê\ï²ùƒFû$ˆX%±m\ÝÃˆÁòŒñ\ÞÚm¢i\æ\æ4°\Ãwòµšžh½.G£kY5Ÿ¡Í¼\Ò-o¨Õ—†”\Û.º°Y¬5Ýž¡\Ô\é\Ï$.·VYÚ£\Õ\á[\É\Õ\ÉR¯i–e\Ä+~ËQ\áÕ½¡ßŽ‘aó\Êz¹þ©i\ã\ØcV°fºõ™g·|GÍ¡\æ\ç\Ýo\ßU½Œ°x\\“„E\\\ä!\à\äG˜J`N`\å™¸ž„Q)\Ò0ü¢\0Us¢{”S0^‚U (‡+pðS‚’$U«ó\ã\èG‚»ü9Kl;¾¶,\Î\é[sM\á/jÙ§²;³Ë—ƒtû±\È\Ü!™Ýü™\ÝCm÷>w=«%\nÂ»\Êëš¾\î=\âR‘¶P\ÒvÖ—:4)0‹ \ÒsU²\ÝUñ\Î^\Ü\r6¡[K/¨T¥cX\Êr¶¤\Øf8?¯\Zj\Í\â_I\ÏùË±ÀóÇ°<\ÒóÞ‘õ\Ë[P´XŸŒ©¹õz\Ó6ñô\í™}Q\é/\Ï\ì\çÈ£¦z›\è¼Ï§jnpws9\Û+j´4|„•zI £\Æa™‚®(“\å«jbvÔª|ž¥¼;zü¹Yô†{n|\æ\"Z,„µxô¾‡\rGÀH<m\è|\ÎE%\Ó\àú›\×^k×¹ã–¹F\Õ\îÊµ\ìƒp\çô=Rþ\Ë\â½r|QVL\Ñ1D°ò+\0S\à!\ÒRCA€‰L¤‚<\ÊÉ´QT\é\Ç!c(U\'\ãršNšD\ÄeW‘\Zš\'\Ç·ñÏ¢\áXkS9¿W}¶«aª\è#„¹h\ì\ß@¥ux°´«i5\ÑRô³>>­r]fZ\Ù0òQXzRt™Ä±t¡•™z·ž}Ä†N‚I\Öht\é×©õ\é‹¥t»5\Õb$\Ö\ê—d\Íi[¥2«2ª\îñ_°\â—kk3h7<N™n\á¥l­%z\Ë\Ï\æÌ·\Ì\Zý;·\äò}¹ºM¾®}dW>ÏŽ\Zo¶|½~(7\ÕýgoŸö½É´›÷‰E³¢Óª[:§¼.\ÚgO\Ò.³°\î,\ê³„\Ú\âª8Qô\êÀ«¯™4M\ê\Çk\Ð1ß¥S\ìöeÁe¥£¶dŠ¬\èÍ©Ñ”\Ä\ÏVvsgB+S\Û\Êùõ£Szþw\Ú:>Y¿b³(J9<·z\ÃöNvÿ\0J\Ùk6\ÏëŠ³s£˜ %R?8J¤SQT)ù8A\0\ã\0¦s<*k&Ó\Æ#Š¡\ZVMÉœ$Ä°¨B§Q‚ò?®¼}\èø’¸®\í„õ¹Ò³qJÑ¡X\ÜöG¡Ï—\Ëk\×Î-M\Ýö›ª\ÄW¥zq\Üú\ß\îVzg…\ê\ê#nGI’3\Ñy:	1Š«Ub·ú¤‹~Yb:ù»\î]Je»\Î\ÌÀ\Í^;¾w5«5dÐ¶ª§\Ù\ÔÐ…°s½ö¡;d·™Qk:\Ê\çØ¼Ã¯>¹c^Ýµv\ídf8~À\ÑR\ÑxúY‘=«\æ}¸¼I§ÖœúŸ•ý°Rxþ¹KI°\ç·#i+˜5\Ö,¦Ç…\îóO££÷Ž§ŸóÚŽ£&“E\Õ3u-3\Þn\'+½\êxlûJ\Ç\ÐÑ´o5j¹´¯n­]šm^\Ûh\Øþù•iÅž\ì˜Î·\Ûó¿=ôŒ{_\ßÄ¸Jù\ßcË¯Gu]•¥ª¬ñ×²y=]z~=\ïŽõ¯\å+…2„À\åq\Â G5T”LœR˜1\0Gr… xÀWŠ ¸L«&HpðcD€\áV\â¨C£ÀUüŸ\ëO9õ9õ\\eÊ½\íJ\Ç\æ ƒ;ŸkŠšª\ì\Ü?IV”°ó;uÄ´\Ë)>{«z\Ó\Æ>ƒ\Ìýjný\Ï\Õ\ÄY›ªµ;uk>Šw|ò\nfc[§È¨û¸\é\æxÒ±¬Aô|ç—•¾\Äõ¼\í\ÛVkz£o´ôyõòw<‹úc$\àý>2ø½K™4hI˜\æË”yƒ\Ôþ ô~N\Ï\ïo*{‹{Uu_\ÉõO \å˜Qº£‡\ï™n¾w\ÎhFE\ì~SõžË—\ê~Ô¸\Ç\ïùvN†m¥Yõ®\Ç\'0òG¸üS¯\Ê\á—{–!\Ùòõ-*\ï2-÷ß}\à:x/½‹œr½7˜¶8¼\Zö1\×y\ÙZõ\îµ±‡X\Ôj6fÀ\î\í3\ÏM\ã|\ÉX\Ýñ½8+º}6V\ì^™\ÃvWc=ö‡Š½\Ù\Ã\ìjOy/-éŽ²©—HL!µLš„Bb TždŽ°¼¢@@\Ö€ô\Ük\Í\Öo`\â+*B9‘`¢Gb”\0ÁLX=\Íñ9\éhÃ¢¦2I\â\ã²)m\Ën\\ÿ\0jº\è\Øo‡«hùv·Ô müOWd’‹É¶\çW\Òo÷¼\ï±\ï¾{ôESjñþ>nÁETgCN\\\nûµ@Ü‘\Z5a\Ò\ãõƒm˜¼ljj›øÿ\0<=»ÁÑ®rŽ\Ê\Ë\Î\ìP uhz7Ð¬³øKX—°ú+\Éþ}ú§\ê>}\ê\ÏMc\Z\ß\Ý\Ý\ç«ü\ÅÙ»H=S5Ö³7§Ç¾>ú%\ä¯K\àv\ßVø+Þ™©µ²­Hò½·´Ö¦ˆš\Ë<mòek\ÛA\Ýó?<\ç=£S»]k˜û\rÌ³\ç\ìÏ©;$BaÌ¬o\Þ#HÏ¡iÉµ‹‘Z\Ê\á«7\rh\Þ#ö—}“¶ù\ç\ØY.y\çö\Û7³\å\æm0\Ä\É\ÐÒ½±ƒ\í^3\Ñ\Ù]‡´À\Ý\Â\Ã…P®Šr\"¬`*¬QP„Æ€´˜$\âñÀm^!\È\Ðš\ê\å˜„\Ì2L¢†V$\ÍvúD.c·3À=išt9>`ô-/C\êx\é8‰J\åy&\á&X\ç\é\Éßª¾o¢–¯IQªG\Öc´có×µ¾eý<\êq£Ô²\Êó;Ù´Ž¡#]9z÷ª¹®>2dúR§fé£¨#\ìá¦ªmŠG™¡¸\Õjº·\ZC×¦Y…v5£‡/nTš\Ö_³x\ÏO\'\Éþò§\Ò\ç›\Ò\íl]p=\íŠ\ã\ã6ùB¥)¹K\Ò(\×/žj\Zcšð¿\ÖO˜þ»\ÙÀô:W0\æ÷òºv<”Žr\át\é%®L\ÙZMfQ”¼%.R79®·Ÿ™Z³1¶·­%”\ÊVlö­:2\Ã«—\ÇýS\Ø\â“\'\Ü2Œ\Ê\Ï\ÏÞªó\ç_\Ì<õ>=\è¿?\ío¯§ô\\=\ì\ì“¾\'1DÜ·¥À\ÂFPT\Üi\Å1Dø\Ã…x !ƒ€€Q%­R!F)ˆc\"‰)\áO‰\äÌsB²¶g»\â=ŸW\Ø4x=\è4FJ\Î<eÚ·Ê¾\n‰Ÿps®N¥úrWŸ\è/\rcK\çPI¸{\ãªv¼¯Ð¹hÁ\è-qQ2Y­\è»\áeT\Z\n\Ìs)\n7BBqRrú8\ÅiPŒ½\Ù\ì…\æ\ÆV™µšþ‚´K9\èi_4=uá®¿“\Õ=ñ’o8½Tk†<\ÞõòJ2\ÎÖ©0\ÕÛ¤]\ïZ²\ÌF¹ gz9Ÿ2û[À\Ý?ö\å\äŸ`e½‰$¸´5_O®É vXª4\å\Îm\Ð\Õ\ÆÊ±ªÄ£lTYI±Z^TõT.qJñÏ˜H:7­\Í\Ã\ê\Î\Ã1Ó¼}\Óóø—¶<\Ñ\ê³dF)¶\ã4äš¡\èLz\\+§ü…\è\îo­©DTòL\Þ\Ã\Ø\×L+r\âq*g\Ç\Ï\ÌxK\Æ+NQ(¦‘`L\Ð*\ç\á\è;¸’$<6¡xE¢|aP0ÀRˆB’j¤,\0)«k\æ\è<õ=œ\Í;WÌºyXTuüÞ¾t4cW\Ú<\Ëz-û%¿•¤H°”\ÉÔ»\ÉGw?Ð–\ßB½e&XIQ}{\Èò¯Ù’tù\Ô^\Ï\êBž]Ú¨\Ûzqmžu_~¶K$ùÎŒŠ \ÔRkl™¿6h\ÛLf¶U\ægB3«8w\çvy¿˜7:§¹TIJG‡\ìŠ\ê>D\èºY\ëó\Z\Zv)`µ~z\×.¢\ê\å¸Í“\í6k9¿*~\Çü±…\ëy¯³VŸH\æw\å\Ög/~xºõ\ÈÆ¼–föÆ‹hMn\Ìóhª°´\Åe\Ú\'z\é\ê¬Rt|\îq@,\Ë00\Ü+ÿ\0\ÍoS\ã\ß-\é\í=ßžôÐ˜¦Ñ\Û\Æ-®*·\Ô\ä)®Ó´^µ„a+m£\ØÁn»‚ñ#\Ã8&py#\Äð©LE…]5D˜\ÐR \'LC$`e?ºQ@?+“\0E]8“If\å¹T\ÍI\Ùü\í\èl3µ\î.\ØO¥<å¯{³Œ¾o€ôN9£\Ï\æ¬]\éã¶º\åVmö¸o‹ºK}fÞºl\Â\ÒR›\Ú,\îJ­\r˜Îºz¼–ý)G¡›\æ-¿\èžk·™\ç;‹º^œºU\Î\åz½=5\ä:ê·¹\Í\à…c{®»\äyV§t©\Ó$…\Õ/=z\Éý]/z?\Ð[%\Z)®¬TngJ)\ÔKF¶j\ËH»½ö©R-m²+¶2Fõ\×ñ\êôJ5ó<Ó†Vß\\N?<~œUŽ—^\Ãi›\í\Ç\ì\ÝK\åõr\Üc\ß|NU\éûl_‹òb}ŒK\ä\"\ê~°!òr=oú\ÏòŠ0?\Ô\Ì\×\ç!“W´rŒ†þ,\Åk>ùô†ž?\Í\ï^\èqü\Þ\Í-R6§+·Y\Å\î\á8¢\Ú\àzµ[F\á“\Ü+¢0¾/ dƒ¢pøŠ	‰\Í\â‘D\Ï\n©ŠRPA\'\Z²\"\Ðrj—ˆpc¢£\0\î‰º\åR\Z¹E€r·3\ÇE%BG›4¶£\ßõPXŽ½ž\Zt;C\ìw#\å\íS$\ÕÅ©\Ñõ\Ìw¡\æM¹c›†mŽÊ²8»K\Ùkv•\Ñ&¼[\Ô\Õb–¯¸s?Í’K\ÖUYCeo®\Ò\å³$uÙ‹º\è\Ê6lò³ªK‰†!ºÆ–\Ä#½ \î\Õò\ë\ßTH\Ý_–´½i\ëc§ÀÛ²üú›æ’´D1\î!,7EÂ±nMö\Õ\ØÉ\n,\ìeQQ\ê-\Ïh\ÚM/F\\\î\×§“¬\ËS.ø\î‡Í½\n\ê\Åñê¾´%š|Á-\è&wëž³)o\Ø\È-žL¶ú!=šÔŠÐ™\ØC­VSg²©e›š\È[–>‘qªÊ²S+¹*dzŽG§…UÒ³_dÙ½M#:\Ï\ëvi—¦:ª¤!¼÷ž(c\ÈA\Åœ¬ŠœJUª+W8†%ª \Ò&\'M\á\Ü\áz”\Ý\ÊU*c\à@\Å\rÉ¨E±5\Ñ^µ¸\è™ù\×\ëùu\Ó=îš°:]F¤\È+šFü˜¶_±B\é\á\Äk\ÐVL\à´¯z÷\nMÁ.;”\ÓSð8»\Í;ag[¦Á\Ë3\Ú\Õ`gyw\r\çYA\ÒN\ì\ÎA3õhþ’Z(;U\æŒh¹3m‘‰”©Wmw#—\Î2tQ¯[\\:S¬Œ\ì&;µÁ\Ì\ÕÑ—°!c7FY_¼»ŸQ=ˆ³,\Ãx\È\Ö\Üú£ \Ô\Û\å\"a&\ÓsÍ´“À\Ï)«;H¡hn\Æy0	½\êv4vW A5—gSW\ã¥\ã³\Û^\Ît\Ø\Z\Å\Zn½! •b8­Y)úxŽ3f\Êü\ê7­\Ú-]£\'[]…´R\Ù+f9|§\nd\Ê(\0bƒ\Å+:@È°\Ü^Bc	l¬§!\ìP*„ J¢K\æ^(c€ó\ÎH\Ä`c«±4—)d9,}¯\ã·W¾¡|¨\èî½¢›}§„\Éa\íjðûr¶l\ØóÈ¡d(U“˜—’Wze½/~ù¡“\\›\æ2²\ÉI\ÏZ\Ù)FósP¿c6+\"’šr\È;NB\Ê\ËEl¤\Å~@§4ºŽ4=f[/-	nª\Z±u££h~…g®\Ø\Äk\çi¶¼#H\Z7\Í,´ôùºM«(\Úõ\×rKNa\Î\ì!Q”‡™¥¬•[h±}k\'–•ons\ëM•Z”‰u}rn\"ßš¾K4EZX(³\Z´\"“¸š\ã‡±TiŽ¯Xb(Ø¹˜\ãž²ñ«3\Úuž±¯ƒr\Ýò½ðPýB¯O¢‡\Î4\ê5›µœ\ÂÙŸ\åÁ N\î/‹\É\Ø (‰T@\ÅX™Œ\r\0ª ¥À	J‡p2¬X€\à4U3¼\'BP01€­tz‹NC¤Ä¥P×‘ŠO-–k\Åw\Õ÷uºJ0\édsør49ŸbÉƒ$’V\â|\ÂA„2|\ïN¨¹Œ»hŠz—M\Ì\Öló\\¼ü’\Ô1\×M6YO\êì–—‘›y¯6%\Ù]ª\Í[3§­c6\Öðh)›\\ni®\àö\Ìþù’\Ú(Ù¨#…J4\Ê\\\"Í›\ê<>¼Þ¯Ö¼g·×»\\W5^\rE¶c\ÒVŠÂ°µ\ØO]+\í«4·›\'S®\n]µZ\é…­2ù\ë\Êuè¯¨sºñLJB¥vE›8äµ¬K\Ö\Ù_³@g½¬\\”u+]¯\Ø`<D¬cU˜S®T\Ý\\]\Ûz\Å7X™&Žñz\×ùŽ‹’hiØ²­\Ä\â¸\äÏ‡ \ät:`%DŠ¥\'¤‚`Š—10ñk†/(\è\nHY>Lƒˆ™\á8 Š\"ÀH^0V Saˆ ð7G\Õ6ž™\ZÏ¥ô\Z¥*ûŽ6\ç}žvk­»&¹\Õ\Â\Ë\"\æb©\Ä\í»†\Éc\Ý=\Ð\ÃÉ¢\Å\Úí“‘o\'^‡VŠ•¡\îµK\Äs<³Ú¼ƒj²HÁ\Î_•\ÔõiM8,°tk\\­\äj\è°Á­ô\Ì|ž\Ü8W ³\Û\å\ÉHª¼D1šÀ\Øü§©òm|¦w\\¾>\Ú7½3\ÈÛ®m;Œa\nz;s,\â”s_1Gik\ç\å	úÕ©\Ø\ì\Ùüÿ\0?¯b¼\ä~ŠÍ·Iz\Í\Ò3ru\ìú§¦3\ç·M|ö}\Ö\Úö°/L¬ra[6Š˜b‚¶\Ô\í¨Œ\àE®jpŠ\'6c[µTm\åú3TÇ­v_yZº\ç\'¨”\Å\î5kó\Ì>A1\Ã\â\Z¥<kL\å\âDå€¦LPªA\çE`°‚9Ü«\"w¬üj¨‹”¤Q\'m\àHSRXn:K\0–…UEl\î(•¡.0Kyf\î³Z\æ/­}A\rx\ÊÉ¹j±š\ìf\Ê|ý#\'˜štú®ƒA\Å\É~\Õ\ã\n\Ù\åÿ\0:¹Æ²¸h¼\Ö\æVQ4NY+3\ãLó\Èi¦BE«kšÄ¥}ý‚Ò¬3›²43J\ÝV\Ú!`\ãªG‹2µÀ²N´Eñ¤\Ó^7\å\ÏnÁ_G\Ï+G¬3ý¨\Ól­]g3ôMþ_”\îVzS\á»!_z…\î\\\Õ¥¬S+]eJ\é«¯«XSMw^…°Sd\Ô\Åij¬º\ÕWS9¨\Ã\Ú++j\×l¾sH\Ð„p\êõ\Ìsôw(¶Ak‰yRFB\Í@L•ö\\SŸ;§\Ü\ê¶s=%9&w¸°º\É3v©²”ûšó\æ!¼÷<\Æ)¬N	Yx§tL‡#’\n¤¥T†ÁÀ)Xª•¡\Ó\\9\ë]C\Ê ó²%P\î7<\0Ô¹´ª\ØS)µ9\ØxGVÉ®\Å\ìhiÊ¨\È2¯bTñj=\ç<™…\ÊÄ®[	\éˆ9Šõó˜÷\Í|ü\ÝF}n›†U6\Ì\ËÒ§,²Á$\éŠë´²•!£ªÕ‰†4½\"£a\çN]\ÃDÖªH£h\æ\Î²ªõrn\Z\Ìu\ã+#³šJ¥ùÅ¹ðºw¦*\Äa\rY;²\çöi—6Y(‹9j\\&\Ã.Ø§6h\Ù&‚Uj–‘…’-,ªoQô>Jf3õ\ÈÁn¿b¡\Ï^–p‰|.‰X“€*C<,d…t\änb\Ê\é5k4\rœ\ï[:3D\ÝJ©š\Ó~\Öv.&5INUr¨\È\Õ\ÑªIR™”¨®‹C>­¹%Á\rÆ°&r)AX‚VQ«\Â	\È\ì‚ü;¸¢	9Qat\ë†\ë\Z§H;–Åª\èGt­9Å»\Ñõ­¨/=LŒ%,W—dž€Á-\æ¼w0•´”y\ß%\r)N·\æhµ–¿š¯žYr^µ3NÓ¼`µš-KÖ”)!\nÖ°\Ôtjš+Ò¾¡=i©š\r6H\Å\Zö*Q”ð\"­´²c*­\Ù+Í­/®\Ì\Îp¯¯\ÇCmgT­66\Ò{s\Õ\ÞÏ¼7Ô¥\çe²\í¬!;\r›I‘•:J\ÌeŽ4¬ê¾°º\Ñ+\áª{M³Bšbó\rŽ¶´g·\èT¥×‡0rDŒb­%\ÜbQ_’€|šºH\ndd¼K\ãõ”2\íÎº£kœ^ª£f\ng*‚‰Q•L\â°\r•K\Ä\ng…!ˆ¤\å\ã˜\0\àDô±Ãº\Ä/=\ÂU@\â†9AF†!“u*­\Ýg´b°˜¯br1dRñ/u\rMŸ;~ö\ëí’©+~»\ÓõCùó\Ñ{³ž\Æf>Lg!”\nÅ©\Û75\èt ,ös¢\ÇŸªX©\ØúM„\Ñ\Ó?\0ô\Å\Æ7Ô®\ÎöP^\ÛL<]¾¤b\îª\ÕeqcxT\Ñ-‹.bae²-¡\ÛÄvf\ÐXûòÀIÁH‡³b·\ÃD\ÛÓ¶¯\rp¯fÔ8‘v*\Ë$Y$¢%\Êzû\ç•{X™‚A´l\Ü©Z¡ó\Ü\ÞN@htEž©¬ÀXi\Õ\Ñ‚³–g=V\ç]Ò¡\ì+1ú¾F¶¥š¥Å¼x\Ô\ÑR+\å1­\Ü\n	Xp…Õ‘DùIˆ²,…\èÀb\Z²`´ˆ²\Ã\éÀb™DH1W\0æ°¦\î\å1X€\è\Å9UXˆp<\\…\äs”x9ÁE‡†šI\Øm4¢ì¾´W\ä\ÒÚŸŸ÷\\ù£ ¿•)\åi—…’KeJ\Ý\Ø\Ð\Ù(‹¨‘¶S/”\ï±L·t—Ô³\ë\ÅU\ÒR\Ë$÷Mn$[7²‰\n\Ât;r\Ï‘$—hfª&/º\Í\ç\Ó\é}žN™2\â\åU&fJí•¼^&\ÐÎœZ\Ê]Sy\è	,¬Q¤$2\ÑUjE‰F·r\í«–¢&›g©Db\ÕôL¢M­u3ÓªÜµ¹\çoU\×\Ëq’j…#W{aËªAžª–\Ò\é\×\ÊY\Ì\ÆÀ\ÆXU	f«¥\Ö\ìPQ\êiV\Ón¤\Å=§Qª\Îõ»¯5\ÉT¤†0=d-ˆ^*¨J)žBp\'`\ç\rRA1-\Ê&\Ò(b€‰LÀ\n¡(p+\0D\0\æ\"º*“\Æ!8	ªBX\ÅKO\Éõ&>.~¹Ñº\Õ#–\Étºó¸•îœœñZ*_w)v\ë\Ä\Ô\×	H9\Øò\Ñ\Ë\É\rU.uk³J\èùf‹Ÿv‚å­˜Yž\Ä\Þ+R:›¯»Ó“¨²t\Ëj›ª\Ä\Â6{ƒº\r\Þ\Òú›t`\Ìj\Óf\è0BË½o\ÞPVú½l\çÉ¼¯\ég¾noö-‹\Ä2@{-×ˆ£\Ú\ï,9C\èhLMv}–ccé©\'L-\ÛlšQpÛ«ñU£‰\Íul\ço+A¶ù\Ç`²\ÂB-\ÎMn]\ÅI\â\éO]amøµ¡Z¹\Ó+ÓŸÑ¥ªmŽ\Û/ É–7?¾\Ð4WJ‹#ûqú]*4zw\ìm\Ïs9\ÄT½Ç \âS•(ˆ:+¢b \nc\n`º.9dOYâœ¶BñŠ\ç)\É,Ã“\â€ë„¶€Pœ¬U“1	¨S)\Ì-;„‰\Ñ\Ê\È\à‘Á,@E\Z¬U°’¢8\æ-\ãæ’¿.!%\éVJ5\ÛZ\ÚB\ÙA¾˜òZ=\â\è%j\×P¾‡·š©u\êš?¯U ´\ÝFs0€·¢\ÉB\Ê76¥<eš{Ÿ\ÈÛ¨«Jy\Ë\ìq}\ÕMò^®fŽú>\ÃN¹û\ç\Û\Ü\Êþfz+tôt`Bû\ç;jð–\Ù\ë\Ò\Ãó:—öO<\ÛWÆ™?fz77 ð~«ì¹›|\ßÌŒ3\ë7™ñõü\Ý1ôº›£™ò.#Ú—´\ê|\ã{\é_Weï¼›Ÿvù>ø©ù?q\r¨mIús™\Ñ\Î\ß\è±6±”{3Ÿ]¿Ci,—Uñm#ª\ÚzüV\è\ÉhÕ¶#6\Ð3k¨ªÌ³¹\ÕDÅ½Aó\Û\Ý7L”Rs¦³§\Z/\É\ÛX™3\ÅH@–\0¦Žd\Õ¤\"\É\É\Ü<ÀSP’SRB¬Š„	ø±\\¢²fq\rÁˆªcª°C•(\â^\0LA(p$¶*¥[‘%C\Ë ©E•ZñV\ÓUoS–Yƒ†\Æþ¹\Òl¦_L\Åjô¾¬Ü ]!§!œµÚ¶¥•\éµ\ë¹ÁJšeÎ¬õ{N[!b­1OT\\\Ó;´\ç>]÷uO¦>_\ê›§tq\à\Ûd)¨¢\×íŸûµX}I§x“w·\ëœú\r\r|Kî‰œ\Ùe6N­u\Ôa\Ûö´d\è\Ù+rCe\ÚoF¿L\áJÑ´\Ó\ç\Ì\Ö\Ü}—\Þv\ì ºô.¹«~_\ë7s\Ü/M3\'-’·4\æŠ\ë÷ø\í8J=“:\Ð\Õ,T\Æó[_Ò³ý=jl\Í\ÃG•œ¶û\ÛA´Œ³j\ä+\Õ?QŒSºœ\Å#!\Í\Â\Èr(C9ÁD:\Å\0¥¸8­ŸøS‘B•Sª`±@Š\ä\ÝHH\r	x…§Hd\Õ`&®\Ò^R‘J¢X’F· òb(3\×h\äUJ\Í7O>ö²I=£\í¯ƒ^A\Ê×¢\Ý$‰jsöÑ¶GHÆµT\Ó}š­\ÊT_\Ó\ï:T\Æi\ÌÄ‰L\êFQ¢\ßM¾C¼\ÈFð–\0¸»·Mm\Ì\ÜÎ´¬¥:.“uW·ñå¢¥\æ\ÍWžxg•Ô©Ò•\à)Ö¦\Õôj\Ë­¾†¾šrh½2¼Ñº5¿>!rõ\îk.Ó¨Œ\Ì\0”ªQ)h¯©£$ž=MqŸ\ÐgkÙ­µ\Í#&\É\Æn°Æ•D±\Ôôcsµ\äû›´‹ü\Ý%Ty—¸\Ýb•x†«HÁ\Ä™ $R¸ \ë\Å\á`PVPÉš¹ÀuI{\0T`î„…P\Z\Å\0Ê¦ @#Éˆcž@U‹\Ý\Â\Â\0Š²-] Ž‘\"Â˜\nŠ\"bŽ°\Í\Ã8Ù‡7}÷Ð„-ŽW\Ö„’M6\ÙJµòT\è½^ú\é9­n\Ý.9^‡F©úu¦<­¨X+ZX\È&\ÛN‚Žkµ£tªT¡\\]\étÛ®Ó¹ekµ\á\ï\å°\îÆ¤\ì2N\"0)had¹‚·_\ÐQº‹«\Ä×¯*V\ÍZ«M~6F9hŽNe£sÚ¼rµ\É_*º>d×«“|›‹yö\Æ\ÜD\Íly™®¿\'V¸#Zº\Ò\Öô[>ymujóú\íØµ„‡Ž\ÞN\ãUb SÀ?Xœ¹‹\È*K\Ð@SRAÚ¦2J\ÐÜ˜–\Ú\ÉÂ›T¼\n\ÑC”ð€Š\è@C\'\ÆIâˆ®˜*q’V?qD§#©\ÊnK8\0\Å­\Ñ\èÈ”È¡*œR8y1IEÖ.…Æ\ì¹\Òn½\Ùm”k{¥»=³\ç\èY¡¥’?’V\Õ\Òu¬7GÏ·Oi[~².1\ÓacGñ|5¹™¯\Í.§\ru•C§!\nõ&\Ïs\Æ\ÏU\å\ìõ¼’‰j\éðP6W)d\Ì\æK\Û¦‹9jH\Ê\äj’´´´QûdWew$´v»°6Œ¡\äž3|*w\')2:©\Ëg­…†z\æ\nÜ¶{~t^ð¯k\Å\â3;®Yu²Õ_6],¢O\'\Ô(Ÿ‰2¨`\ètO‰\ÉÜ‹¸@!ŠÁ5›œ1€¢T\Éñ`1€9Q„È¨õŸ¸\ÆT¡\ÖEP\é&r¼9T~\ä\Ôe²ˆ xC„R\ÂT”¢S:I¬š‹À­\Å\î`£–.¨Ÿ3ú\ã\Ï]L4÷Õ‰^õvk¶qiK/S”»=[nò\Õ\Zk5{ýf\ê\ÍpÏ­¦hVj|\æ]²QG`\è‹¥M\ËÁ\ÈU²\Æ\Ñ%Ý›@\Í\ÍqÔšö\Ó\Þ\ãU¿0L\ÇG\ÛEšFüó6\Zü¡Ž«_t“¯HWE’œŒ\ÂYWÐ¢\êj\Ö\ÒS}eÄºµZ”û¥ž¢\Ùz\Õô\Äü¡úØ­r\Ùü\ê\ît\\¬}\ê\ê:q0¯j®*q`hò´|Ö¾ž\Æ7ÿ\09x&t¸ýy˜qt°\0±HÀAL\0\"íŒœR¦h\â‚b˜	±HŽ“ã™”O\ÄJ`¶·B®\Î/%0ò\ÄÁR\Ø\0\0{¸\æ\0€«€Î‚„V*fH0\"£dnIDT&\"È‰I\Zô\âG\Û\Þi~\çb²gU¶\ï~È­l\×%óûV]×ºD‰S%“Žº­o:º%²I\ê]\ÆUð±´‘×©	]\Ë\×FB>Xf\"›Mœº¿4q¥ši\Í¬\â6\Ó\ÒiXŒ™Í±\"´\æ\ÚÂ»\Ú<rñ^=úµÚ“\Õtkô©²M7ñ\è§UD¥\ËD\ÙeM)rÕ±D%B\Ç_»ŸÚ…b\ÌXö±¬\ìiT²CT»Y\Î\Ù,¼Ÿˆ\ïò\"”u93uR\â†)`9@ÀdKb¯Éž©Émr¨JaŒS£‰Šx\ËCu¨ (šƒ>\êf$~@z\Å(˜$)ƒP¢Tq%0`)À‘U5tPYÉ º:dpqL\0zfËŠ1l\×gÊ½7>‡gm\r\×\ç\èÓ”¹\ìû5™œòç“§w”ˆV\r£-±¶UZ“lÕ–ý%J˜<—ƒœ[†\Ó\æMÕ‰šMSFfúËQŒË¾ˆ–*\áAwu,2{óÖšN\É=T¶¶‡\ì)\Î\ß>«Ep–\È\Åx§\ÍMU¨0\"5A\Â*/]\ÄTVˆ	&¤Î›W_\"¯ ŽZòMdl\Ë~`Ü‚\É\nÃº\Ð\ß:š£ô9.=?H\Ö<¶ñh\á¯/©Éˆ\'EP\É(T@Dª‚bŠJq	@“ŠŠC\0\ÆMB€9$PœUCH£u\0\"j­GdT©bjÀ¦\0f%Q#ÀA\î3€\Ç%„„&r\Â-–E,M£¦\á›T¢NP\0]›£]C\Þp\Î\ÎJô-Š±†+@£%«·fÌ¯¸úz{º÷/A\ëv“E£`¦!m\Í!d£\Ë%·»]|]ok\0òs\n$\Ï/A\ã¨s6‹k.º\É9hÀvŸV± \Õ\ÏŒ‘®\à\Å\ÓV‹[!,\á¬,¥ˆ\Ã\Ø*\nÎ\×\ÑY`j\ÝAl¶ªŒTi™JÝ±qnF\ëF¼³:Sšó\â-Š³,\ÂÝ¤(ÐŸPöó#d(þƒÌ»	•G\Çö\È\Ýv\çA\nr‘\É($À%U!\È\ên1\â:ð‰V(dùa@§u\â”Ö§$¢@˜\äR¶)D\ì¦\'uŠ 	\Ö‡š·\\CWp	B\0Á@\ÜÐ¢\"¬p\0NI8S7\"Gv\í4R’*¦¬‘D²qD:\ÌÖŠ¿žýõ2\ÃA\Ë#\ÙHX›&¾9´žbÚµKþ?{\Ç\ÓÓU\\U®\×O\ã¢3™©žÚ´\ËNmx\Z%§ks4t,Qp\Ò9:‰L6q^§\È›™•\Ý\è\è#§\Ìv³Â­žƒ•z\ä\"ƒÄ¢Î¬´‘Ž Ë­ñ…vI\Ç<\×7\Zî µ\Ø \rJ‘Ž’³ŠÝŽ¢rFÖ—ˆ»›d”„wK¼£\'ŸÛ‰ö[ \çfy\Í\Ë\ß<ÿ\0Rø‚\Èy\î‰H\ÖHp2½À¸Ž§\á1\0@\ã\Èr\"H{g\0ÃÀ\Ê\"tc”SXrpØ«Š\0S­W|)T\çL\åh „H\Ð“Ë¤~‹\Ò\ä1u·\"j§³5\Û%\Ñ](\áLò<¥e[š+\ìSfË·d¦4ŸŠô’†\"\Ì4f˜i\åŸC\È-Qµ\ËVgj\ÇÒ±¯Â· +n}&ñ…hI~ˆh	®\É+Y±d\ê\Í5NC7F \×\ì±\ËÖŽ­\rlQ2\Ú)ž±\çs\ršù³W¡gñ\îb\ÈVôxÖ_Ó«\ê­D\èU¼ú b\ç\âÚ¶$³Š$:\Ð/‰8£G67µ«³¬µ\Ýf;U]•&¸òŠz¶\Ìv\ÉuŸc\ìEúoÎ¾¥\àjY\â\í\'(W…H!\Éb*\áº\È#õªª*–B¬˜02ª!SU;k9(%T\Õ\0­»€T†),C8\ìŽH¡…ñ&1BU6R”©91Q82gG\\6®\ÆmÞ´¢P’Bˆ‡:\n¢(}G·×´`\Î\ï½UŒ£\æB\Êi0w8yÕ®\â[ŠRñš\Ú%š\Zõ9Úµ\Z8ŒkW–¬ý\åµ\ìî¨—j:‹¦c9^\ëÜNb½¶jÄƒB\è\Ø+\Ök¤\ÔS¥,f‹\"x³R7oMºÙšNµ†\ÔöÌºM=\Ô	gY0§Jqõ¹„ŽV{\Z*¬G7QùÅ§³¦¾\'ù£\í\Ë\äý&8qp°w!t¸»–NŒ{˜ÙŒ½Sz_\Î>ˆóW…vÃ‰9 \Ü\ê@\áQÊ \è\0:.,Rq\Ð\Ü^\Èñ]¹\ä2#\Ö(ògœC\ÈS28\à°)˜‚ŒQe7pw\ÂZ\í‘0´Q0PPˆ<Tâ˜‡T\0\êJ\"E«\Äk±›W\Íë±‹Wm7l\á`/{“Z—‡‹|T”“\Ö\\@jþÅˆ‹²C_ƒ9mf­\Û\Ï\\L’\ÏbVW›nÁ%u“…LWo¾d³\Ëv¯h\É.µt.Su•F\Í\Ùì¡¶ô\æƒ%mv\æ4\ç\ÖË»J’\Ê\×&4Y·u5Š]¨\ËEujØ¶ö\Ú	‚+D’U Ñ˜Ç¶6N*\æ\Æ\ë=‡¨\è\å\ËNU¦¬¢ÁXjU½WòûO5‘\Ç\Ôl\è¶Ÿ*\Õ<\ÙL\èŸ\Ãð\Â¦!He\'\çB:Dðp­^\ã‹*\\»P‚\n(Š‰•O…2D\Å0*\àƒ”@\ìŠ­ Še’\î\ä±\â¹ (\nDL\æFn~5\ÈUS\Z\ì9\Ò\ä‡)¹˜‹]ˆ6|Î§`\ÂA›³$\\¢%©\ç2\×x½\Â÷2±\Ó[ûD‰›$º0“F³%7?\Ô3\\¤“3»s2Cª±\ÊNÂ©r€dŽsR—+–I&¶oO²\nj\Ô&ò¹\ÚõÜ£\"¹š\Òÿ\0?p[C–\Ë\ì\æY\äó\Ä\Z½±Luv\Ò–Ò¦rñZ\Þÿ\0:	n{D”	/W§[Š<­\ß\Îr\ä–\Zt”À¶\Zaô\æmˆJ’\ÉF\Æ\ësô¢Ý¾…¦ý#Aò«yü\é\"‘N\'hAYÂ™¤›‚ÀHUTTB¬[•2ˆ²ŠbB\nº¤9Y0ó\Ä\Ì%©\Ô\îZ*H¨[T ˆ „LI’@üD°Jt\Ã\Ì\Ü ¥OÀ=I‚hL­·rC,/öDŒd©´œ¦\ÒIv\r^µ\ÙPzº\ïŸ7ó²9Æ›ôÿ\0šú\Ò\ÅX´xÿ\0§TZ®ƒ%+ö·\ÏŸj¹–®=^\ÃP²h\ÄÙ¥\Ò\Z»2P•ŒÁÉ¥@\é0¬™üŒœ4­\Ë\æ\nK\Ì\Óy¦‹9–<£µ©ª\Æ\è\ë8jR‡©7±/ó‡0è‘”\ç“k\É=S\íªqq\'¬\Ç=6:Û²ª±tòP99‘KAS=¦ò>U\Ý:\ç§\ë\×»\âK>Î­•˜ùH8<³·ù¡ß­ù§Ô‡>oôO\Î~„\ïŠNWP@\Â\0‰±ÁYD\Å1­Bp\èN(¦Ax\ä\0‚a8@$¢%Bc\0((‰nUœ„TH`*‹	^ª\Ò\äu\ä–\á;ˆq~A\á”Ew7\r°UD\â\Ä\Ó8R\ä\ã;V²\ëv\rß³qÁþ£<Œ­X/\Ò>t\Ðýy\éò0®{¡ø\ï©<U¼†^²N”‘)P\Ðhúyy{\×/\ï\ç\Øñ\ë|ý¶‰V¶¦¯™K@\Ñ)‘\á\ëWe\ë[al¢*DRa ™_h£ÃƒY‡%j«\Î3)\ÖhöU\ÈÕœ‚l±Š¿]•‡;QHG>™1»—J\Õw87%&šil•‚\Z\ïŸq,3	Ó¾\"¯t£Ñ¥;5L\Ó\ágt\Û½ù&»\í\n\Ü9}/¢\n\Ò\í\ß2ú_¦Ç°\î†\â‰C:H\"ª‚}b‘‰\nÇ$\ÔI—“2¤¤\' \ÆJ@å“J&‡€DŽ\îR\ÂLœ†kR*À ªb\0(^3*n“ˆBqL\ï*\Z¶CŽ!ˆ‹”U\Û&)„l„\\0¾R\Ü|]\ê¼\æcJŸ‡ú\Î}-\îŒ\"\áŸLm\Ú\Zs\ÆýEghŽ>´›¶o\ÕúŸ¡Ci\æ\áVf\ï´s\í©\Æ{\"W-^|\Ú\á~w0|›Ò“\\	ô¬Z\Ë.ª¬\Ö\Ý\ÕB<|¡Ÿ&¥FœÁÊ•«ˆo2\ÞÄjõ“V¢2’P\×L‚´|Â¯†\é\à],\éj\íi \æfj\èÕ‹¾~‰I­#cÃ’Ö§m«>_ž1\Û-\îþQ¼e–è›¿¸>XúO\Íú?d\Ü\Ï=ò¦M\Ê9TT!\Äî šÅ±JSCŒ‰\Ëb¦*§YL\äñ`1Dª{¸\ì\0EI\åHUT\Îÿ\Ä\03\0\0\0\0!1A\" #2B$3%4C05Dÿ\Ú\0\0%‹Ñ®zc¦95\Íx¯=1\\Ž¼ô\ÇO}0z8\Íx\ès\Ô\n\æ±\Ô\Ö1ÓŒ\n÷\ÏLWºÐ»-,­)\Æþx\Ìù{™T›ˆ\á©õûu«¯”Ú¡o”i\áþes\Úü\àDmþIc,vºŒL-\çU{=Ä‘¿õ\Î±Ô¶Mm©‡\'4\ÙÉ¬\Z\ÚGLbŠ×Ž€QéŽ€\n5Ž·ùb¹£š\Å\nóX +\ï‘\Ót\Çð\æ…c¯¯X¬\Z5ž‚³ü^zg§Š4_\Ç\ÏLòsXéžŸj\ÏN+\Ù\é“\\P=1X®+<Ð¡š’h¢¿\"\Ò\à§ùÞ‡ÿ\0ù.™?St·?þM\Ò^~¦Z­^þ¥\ßLn>m©\Üù)buˆZ’ú\Æjý®\Ê\æ;­.{Ww{co¬42Yü\Êöÿ\0\Ì.dšû\åW\×4º…\ÔAu›º\É^TÓµO\Üm»™®:C\"•ù¯y ó“\×\Ý¼W?ÀW‘\Ó×žƒ5ž(g§ú®E{9¬\Ð\ç þç§“\Î(õ¯F(\×5\æ¶\Ñ\éë§³@\ãøƒCøŸ\\{<Vk=	=1YÀ\ÏB\Ã2\ÞAj%ù[uvþ\íû\Öùý²\Ò\á&±†ö¼s\Ú\\<Mk5I\ÞFŽ\ê’¤m\ìKT•­¬]¢ý\ÆÉ—X\Ù\ÚZ\ß\Û\ÏhCÿ\0b,LDØŠ\éX\Ö\áeˆ\ÛÊ‘&Ÿ®jš]\í…\ì:•¼Swˆb¥¨nj\ÏY¬Œ“€TŠó\\tó^ðzzñ\Ó0q¸\Öpzby(Ð¡\ç<ŠõC\Íx®+\0\Ö1Xõ\Íc§\Åy\Éò:\Ô\ã\ÅzcŠô3F·p\Í\Ðô5“Cš\Ï>\È\â….0<tÉ¡\Ô¼Q\ás\ÈûU\ÝÕµ’\ê)—ºÜ­S\êÚ„•#\Ü\ZY¬d±\Æÿ\0‘z•³µ\ã\ÕŽý	S\éP9šµ6\Z¬\Ñ\×M\×¡§6–-®?J0ˆ\Ëo%œ\Ðjb\æ\ÔÆ·Š¢a;$\à†G„À^ƒ7\ã\Ø\ê\ÒÁIóq³Jù\'\î\â\Ç[°¼He\Ü\Ë\ÍnaY=_\ÇüøòM(ùö(qY hž‡€\Ý\rs^…(Q\â¶\æ½H¡š\Ï\\f–†k\"³š\äô\Û×Žžz\nsC\Ãt\Å+^\×3^+\ïš÷\Ð\ç¡8\éŠ§¤­\Çô÷\\õ\Æ(µ3UÞ£e§E©|¹¦]O[Ekýz\æG–k«‡\í\ÝÆ¶Ú‚‚[Hºym­Zš	\"P\à\×ÿ\0¶\Ô{o/}{¤’\Õy§Kd\Ð\Þ\È$ø\î§¡o«\é/e0LÁ¢š•÷L±\Éve\"’ö\ØC,ù1}q{k˜²Ý•¹0e±”ýÁâ¾³ù–\Ý3Y°¿‘§r¾\ê\rY©y&³C\íM^hŒ\Örp+\Õz5Šj5\î‡Úœ\Öh\Z5\âOC\È\æ³\Ó5\ÆsCš\â…ž«<p<\Ðy \æ³G\È\ÏAþX×šôsMY¬\æ…{¯9\Íd\àY\è\0\é\Í{È¡\ã	4¥œ\Ýjö6-©ü\Â\í\ê\ïU·YnõF•™¡‘‚[9üt\Ýø7@´7‹NP\×}’’ñA.$X\Ú-½¤¶ºž‹y\áºh\æ[µš9#{û\ËY]7r\Â\ã÷\×t¡¦\Ë$€†v«<\Î#¼Sø\ì²¸œnc\Ê<ƒ4Ö³\ÄS/¨Æ”EMm•üú}\Ç\Ç~L÷B	m\åSQ.\á*m\'4sY+Óšõ3FPò:#Ž‚¸Ï®)z\Z?\ë\'4\Õ\âyGŒtÇš8\Î\r.O\n<\ZQ\äQ¢hq\Ð\æ‡L}sŠ¼W³ü9\ÆXWþ«ù\è<t\ÆO==.k€\Õ\Ýý½¢k,H\×RùB\ãòo.T uŽ\ÓuE¤I!ýžÜ³\érF%•º\âMO¥A0’\ÒHO\Øœ“¨«¤24mþIµžIke°mKJXe\Òod§0_ZÈ‰™\Þ:±˜¢M	5»ò ²E½«þ\"D\Î5(Ñ—Lx\çi£Ž;« v´Âˆ\Æ&ŒJK\Ëaucò[…š\×V´\ÔD&hŠ¹‘\ËY\ä6Êˆ†q\\WŽ‡\Åz\É\ì\ä’hq\\\à\Ð<mÁM{\ÉÇ³L8¦\è2hó^ÇŒŒú\àVk<f¹¡X¯uš¬óœQÀ 8<Ð¯X EdŠ5Šô+ƒ^+5\ç¡ð(ò8\'\Ô\\×ž’V­­C§­÷\Ê\âv¼\Õe¸~+m\Í\ÅC¦²›·n˜j;+V1i–Ø—L\Õ-…Í¾óqg4t\'š:¶»SM¦Á)ŸM’1´©¼/ýwb\Öc½]§‹cÈ—\Ùi\"42[\Ü\É¾‡¹]¢PDË™ÀD÷wø—d3\Ç™™Ã­½º†ˆ\Ê\×q6\æ¡sÝ‰\ÈAj-¯c¼·h\ä·ÿ\0\ío<ö3i\ß,•l\Ò‚G4JS+l? ù^+4qX\È\Ü+Žžýôõš¯~¨t+š9¯}+\Í\ày^h\×ñG§5\ÏNi|W¡\ã\Þz(\Åg4<R\Ð\é\åNwz?\Îk\Íz<P\â¼P®C\Ó \×¼^k…©¥\Û_&ù\ÄVB\ïT»\Ô\åh®d‘4kÝ¿³GVº=…~\Ùbô\ÖP«›\Ûs%\ÂÌ‡}é¥¿¹JŒ\Û\Ü!Ù™P’I{õ41’\Úd´±\Ëop²6øe)-°^\Ùm–\ê\×ò9·\Æ\á0\Ý\êÐ‹W\Ó]\â6÷·ò\êA(© ·“KU¸K@ž\Í^On\Êö’wk¶ý\í?*\×Ó°Ÿöž\éµZK+†“Cù\â\ÂöÚ¦v€&v\Ä\î&Q\È\Í{÷\Ôø>|”\èy¯¼\0xj<Ñ¡\à`P\ç ó\æ¸“^«\Ín\Åf°h\Z\Í\n\æ\ÑñŽ1@ô8À\é\ã¦(ñ@b¹éŽž+X¬\Zûd\n\ÏO^:fµ]b\ËG·\Ö>Eª\êõ,ö‘—¼VhSQž¤MY*1¨¸0j\Ê$¸Õ£\ÞÝ‚.\î±%\ì²	­U\Îom\Ê\ÝWyCZ\Þ\í­‰p’i¨\è-ÿ\0£’\Þý9­*÷Lü¸•!¬]\Ã\Ä\ä2I,–‘F\í&¯os{K+5Mò[\Å#›]f&1	7\ÙÁp\éZ\Ê$±h÷,5=°\ê1\r\Ë!m=Y¢»–^\Õ\Ì÷\Åswm8ü‹N\çr/­]\éß‘‹qªXI§ü†WHo\í\ç\n;«oö]µ\Í{\ç\ã\ßOg5Ž<\Ñ\é\È…m4(\Ð\Åx¬×ž‚½Ÿ?ó\ã¦@®zx÷\ÏL\æOK\ãz\0¡Ó€z\é\é°H¡\Íš5\ÎI­\ßf¬Š\ÏOB²)¥\Åjº\Ôvêš’\ÜMs¨K(ƒF¸¸«OJIø¼p†·†*”Ù²Ë°«j3Dd¾Wx\ï\ÐPº%ŠA\"j–\Í\\Mg,tƒp·ºxž\Þñ\\~)x.4\î\ØY•\Õe	s¬\é’Ûµ\Ón˜X\Ëø÷0÷ ¹»‚)	\ß\r\ÄxT™\Î-`G°¹U¾°¶‡¸\ÓF½\ëý»{d¼Ô¦\ïCr\ìµ†{9ˆ˜^Kÿ\0¯\Ä2“0žaÍ”¯+Áºž\Üvw¼\"\îšIÀ´’µ$a…tð3\Æz{\Íf¼#\äy¤ô_ò\Ýq‘X\à\äW¿$ó^\Í{=Ž€\×3ÐœP£\Íf±\Ëp|P\éÁ5š\æˆþ?ó\æŽ3§\ÏO5\ìySTÖµªGc³¬Kvÿ\0,‚\Ö++d¹\Ö\à\ç^¾e}CRjk»­ßŸsQj÷ð\Ð\Ô\äj’\Ùgñ$ o\"¥\Ô%Siym,‘n‘YDR~\Ýeo-£À\"·žÙ¡™\à’9m\ïžXä´š\æ#·½ý\Â\ÉmÃˆFÒ«›92«-»cSµ\\Z[¬\Ét¿\Ùo-»&‘3ˆjL,ö(EG„¿¶\Ã\ÅvK\Ëa6ò6\Ë.ÿ\0\Å{~þ€\×H¶n­<\âe…b¸Š4œY\ÍÜ¨5\ÝZ\ßZ\êq\É%¬\ÂH\Ú\à!\ïbšt \Ê\Õ\ë\Ðh\â±C\Æ8ç§ºMy¬òÇ“\Ç_Uš>E„\nM{£\Ó=Jñ\Îkš^€ôõ^üW¼\ÖEkŒ‘\Æ9\ë\æ‰\é\ÍgŒ\Ò˜«^Ö¢Ò¡\Ô5y.¤”\Æ\rÖ±mw¯)\0œ\Ò\ÐÒSé°µ> £k$uƒPýYRG=¦g–-„\"\æ\Îý\í\ê\Úò\È`X½©6þ\ZZ5\îœñrõß“\0Þµ²EyP^B\Ö\í˜µ¤\áe²÷Z\é\É\Ä.ª&·\"˜v­nu<¢²ƒ¸\Ò+~\à°env\àúErŒd•cu»ž[˜c·e†\àM%\ÂÁ2\×nghm;‚\ÒÀ\Ü)\Ð\'’—BeHluE¹\Z¶³e-Ÿ\Ì\í\Ø\Ú_Z\Þ)úù¤4\ìpW5ºˆ\Í5\æ¼\Ö8þ5š\ÇOq\Óâ±š5Á9\ÇE“\ÓÙ®GLt\Å7žEb‡\0Š\äÿ\0MŠ\ÇU¯\0ñ^O¾0(xyþ\0«\ÍE\â_\Ôg¼¸ž\ámQ\î¯\'f·f6öX¬L£ÿ\0b”_f=>\â\àþ\Ù$2…h`Üºnž\Â\ÏI¾ž\Îói“£‰¬™\ZhXL³=fu‘gµ•\ØMgIø\×Júe\Äu^£=†…W\Æ#x¡’¿€†\Ü\Ä\×qªWg*\ë‘	\Ê\\[®n-`{M\Õo%·µ\ï\ß<`O\íl©h~\îOr\Ë\Ð@¯Û–r,¤\ÛnÁ\Ì\Ç%is“}{,1@\ÍW‘\Ýö¯4\Ü$\ÉfúW\Ë5+C¦ü‚\Æø!…`š\Æ+\Ãs\\\Ðð?Ï¼ò\rXâ€¯š>W&¹¡\Åb¸ø\ÍsY¯5É¯gžœu>\Z›\ìG’\Ô<ù£\År:r(Q£^ƒx¡\Íc¢Ž<ô\ç§üô\æ®$\É\Ö~K-ö Óªi÷3„¶´·\0\Èi,¤–£Ó—r\Û\Æ\"š\ÒK™?d½c\Ò5­ñiZ…¤cBž\î§\Ó\ï-eüQZò\Ý?7PjW!6\Z,±\Íñ\ÙEMgÛ–KI†vF‚VÊ¡Ýž61\Ä\ï<\nÄŽÿ\0·-\èµg‰åƒ³H\ØIj£\"\Þ8ò¶¶l§·Ü»šß¸\Ò[š\Ú\Ý\Å\Û[l[˜$b¡¶É—f÷ú\Òz¸‡ñ\ë{¹2\Î\Õ°D«©•G\Õ\î©%–J¶»\Ô ¡¬ü‚$“\ä$/{i-4,\Z\é­ntO’\\”µ\Ôm®€e¦¬\ä·\Æz¡^‰£ž™£‘\\W°6Ð¢GOm^k Wƒ\ã¦k5ïŽ€u5žœ\ç5ï§¬tòsX¯u\ÏAY\èq\ÔV\åP\î>Iò·†s—’\É%½Jó\ËH†­\ØFÔ³\Ë(´\×ûú\Åüa\î\îÞ“^\×\ãZ\î¦JjZ¬%õMX\×\î—£\Ô5)\\rß±\ÝO(D9\Ëø°È’i\ëø\ê\Ë\Ø\á-™‹k[À“Ôºw\á\Ëgn\ë6¡§\ï—aºµüs,\×\ãñ‘k{[\æ\Þ­\rÜ¹‰…Ô¶Ø©\ìB³\Øl›´\æ\Ê\ê\ß2Mm˜t\Ë\"!’\Î3[´\Í\Ø\ÂM\ÛV$oxf\Þ,vQ^-¬mš6,[O‰-¤Ó¢\Ùmh®e²\î1¶’\ÖmV\ÅZ_s¦\éç ¬‘CŠ\Å\Znh×ŠóGž£Ž¼V1F—ø\ã \Ç\Ö+Š9\éŽkßŠ>y¬Š\ËW¡=b³Šõq\"Â¿&ùK\ÍP«1ž\Ö]§ð`^\â\ZN\Ô\íøvÛ­l‚¬Ÿ\rO¬X#\Ç?\ä\×á…³ŠTµ¨õV¦\Ô\å¼+øH¶¾Å®?E”mVö\\2T¥´;Õ»gKR²h­\\Y‡¨lP´[ª¶‡ñ\çšÀNc°\ÌqÙ’#·\íˆ-\Þ6»±Š¶\n–°Y‹{7µ0\Ù\Ü\Ù\ÉkZs\ÍwÝ¹š\Õrm[V¶·kyŽÍŒPZa¸¶Ü²X2\ëi\äI-¢ V’:X.d¡auQY\å—ñ\ìÌº®¥p\\kd[\Þ\êŠWX\Õ\Ü\Þ\ÛMZ”Õ›k”G6Õ§^\Ý\éR\éú¬:¼R\r¸®z\n\ÅžhW£\É\ëæ¹ y&ˆ¯uŸ°<\nð¿o\ãŠ4zŸ\Ïx\è(\Ñ9\è3G¦hduñY£…:–§o¦Ã¨\ëWÿ\0 žk„¥\Ïô\Ï}g›¹¯š=&%Hl¬ˆÿ\0Ò°Š’^D²M.£-¤{—U³\ÓE\Ý\ÕÖ£-¥ƒ\n ’%[XQBZTû\ê(„T–bQ–\r.BË¥<dY.\Ô\Ór?oz¸\Òó_ˆL­¦\æ®m\"™\í \Ãh\æK|Q¶\Ü\ÑX®;²š\ÛdcLþ‹{0\Ë5–¿lEg·\ì\Ëø[\ÓñðKUÞ˜;rXmV\ØüI!««¥›ö…‰otø!i\×{£³0™/\å\Ý4“³öæ­¼wNÍºK\Ù\æ¡xb\"\Æ\è\ÜY˜Z\ÖG5isgwE%\Òd´Ym„\Ë{b¬qŒZC\\¨…y¯ s\Ó\èó×•\àWž˜\â5“\ÐQ\Ïý(\ÇCY\Ç@3^F:-/C\ç\' ¡_òNÑ­k¶š=´òj\Zýñ´²\Ñ\à\Õ5…’Qpó\0¡0Zš\î\Ë\êr™“Gm§$õ1\Ç$\×2JR\Ú}–¶\0´v\ÍwP\é\Ì\Z\×NjƒK/I§\ìXôöÜšXA„iVð.{%E–@ñ\êÁ\Óâ¦´X\ÅÍƒ‚Æ„[\Óð$EA*+~\Ýve\íw\0\ÚU²°\æž¯\Æ\ÏkvÐ–h\Ûwj\îË½·Kx¿ç¦³\åµ2Ò«3¸—º+ »¶¸W6—_¶I \íi¶ômH3_‰$uøv®©\r\ÂÀ’\æ\Ú\æI-¼\Ù_¢Áos&—.‘y²D^\í)\"…\nóX\Æ\rMœ¯y\é\ÅixÂ‰\Ízh™\ãq\è´cð\É4Çš÷^zš\ätðÀéžžzæµZ-*\ÚQw©\\þlZ|w7WweŒPUŸ\å\Ö3me·R\×Ai#¼¹kmŠ+k\Zˆw%¾Ÿ#Ò¤’OÛ¶­­ƒlŽÊ£\Ó\Ìa-\Í5¡\n\æ8I¢¥B÷ ¿R#V¤N\Ý¡ò\"\Ëö\íRý\Ë\Æ	Â¢\í/F1R.h&ž•¦\\´‘.B«VÁ>\Úkxž8\ãþ\Éb\\´Y©¡\n³¥= q}§Ö©¦Y\âÔ£c-Ð£xPZ_Ù³Z9j²Š)K\î†a-Ÿ\ä\ê`‹˜Í”°\É-\Ä6Á.\ÓM½6\ÒiK\"°¥úŠðAŠõF¼P\Æ1šô<x£\ç=r+5 r}cø­\Z\Íc¡C\\×š\Ï¬s^(dV1@t=|V¡}oam}©\Üj\×ww\Å\î$s÷z·±QQ3\Äf›I0¶«¤[™5KS+j[\ë¼òU…›H\Ö\ÚR\æ\ßL(®\Ãgi´%¶Á¶)\à\Êv‚‡Ü¦9wx¢Ô‡ôQWk*ª¨G 9\Â\ÐtR€\Z# &ð¾Jd\Ã2\Ôg5\Æq¶±¶™±_\èsLI¤ÿ\0$…¥IÀ?z*@8b\Î\ZI—´m”%x¤«›Hóªh­5^\ÙGnY,²ö°ŠKRL\r$B\Þö)¡¸\Ó{\ížÀ\êV)©ZèºŒšmÜ«øs\Ý\Éø\×\Z]\Îø­®c¼¶ö_\0\ã\Ç\ì\ZS\Ðø\"³Á\è+“F±•¡Y48\ê(W¬sƒ[H¡É¯\rx¡\à|g\Éâ‰¬œð5\Å\Z»¸Š\Ú-w]º×®øa¸¹\î\Ö\åD‡cWvYjt\ërw®\Ûj\Ø h\"šj\Ót©]´\Í\âY¤t!l\ÇjdhmñQ&k¶e¥?\r+±ª¢pH¨Š¨—l\Ò\Î\î¤û\0£?\æ›*ñ…k¢¤\ÔkŠ+ŠvŠh\Î\á\á°+a\á\ã%\Ó;1J§#p“ˆ£F¢0\0™AZ\Ó\Ã\Ü7Õ¬io,6\íg²\ÈmÜˆ¤@¬A³\Õg„³iú­º³\Ã6©¢š\Òõh. ‚\ßhNt­GJ‘ š…s[¾Þ¨y\â†v×ª\'5·¯º\â¾\ÛOL}zƒÏ£E¨“\Ó9¦:ž:š\ã\"¼8¯š\êMw-´ñj—É©J\Ó\Ã\Z\ï/Zu”\×Hö\Úp¸@*OÈ¹hlž\ÜÁh%m\'Er¶:ZB°\Û‚\Ã 	Á­\Ð\Ø)[\Ã\"`¤`0]µ»A+RŠ¡¿\í\â\Ü-­LN\à8´G’v\ÖY™S\ÐRk\×À\Åy¤QX\ÛLKJ\Öÿ\0,¿MØ¦lƒ[ð®Œ	\È\r’…³S&\á&pœ$Ñ©Eµu\Ý!nk	­m	°FCh†\âf\Ód€\Çš®­=mn$·«\ÛlOcz—k¯\ÅgA½:…Å‹÷m223ò+\Ðó^³CÇ¯T8¡^+ÓŽ†‡ðGC\ãøÏšó\Ðc«£\×È¯4\ßQò\rj\"\ÌIõ¼½kÊ¸š‰\ÛV6\ÛÅŒ2\Åok¦K3^,Y\Ä1‡µ¹žm#CˆÖb±¬1*\Ð\ÝQ¨41o\Ã*\Ôro*\0¡+k`-m$ª9¡Z	_\â¿\Ã\áEm\\ª\ÐóÔ‘å±ŠzŒT¹Á\Ç8\äV\à´y 2^\ß2\íY5¸Ô‡wPn\ÓQ9¦©#\á—%ö\0·ÚŽf‹‰\âV­wCYá§·–\Ö\æ:{š+)\êò\Þ[£¿ZŒH\Õ\ÝEºSø’\Ë\Z¯\Å\'{{\ë,1n:qC§’hWš¾’I8\Å\0:cŒñ\à­\0(\Ðhs\Ó\ßðözŠŽ†¹®\ry¬ž\Ç4\ËW\×)i¡¬\rB\ëQ¡\Ó\ìLdÄ¡kO…\êþ—÷ÀMÝ–\îø\çJ²\ÏceA\nšp´¶\ê\ìE|RÊ¦£]õHJ®)HJ\î\r¦@´X`\0i	Ä–\æB!û(Z\ÃaG\Õ¸¥\0ª\ÓJ™;¢\à\Ö²¹úŠ8¥r\n…–\\Ô±±gU\Û)(v>#\0\î®\ÞóR5\èr\Z>W\"Y\ã lL¹¯h½\Å;c}.e)§Ü±xš).5­6M&¦’;«+\Ø>ñº\Í_¹;om…ž­¥†!\Å\Õf½ðºƒŽEg \Î=Vs\Ðôõ@ô¸Ÿ\á\Ï_^k“DVy<t ==b±š\àS¿\Ó\æÚšEoi\îzŽ³*>¤\ê\â„\'eœvŠ‰–Ò™VJKg‘ee%Ö™n»¡ƒe#\Zs3Y3· \á})‘³AÁ¡¿.\Õ\Ý,¦\â¼\Ñ\ÅFŒk´h2\í\0P8¨óC&•I¡N €‚¶ýp2¨	\Æ(¨\Æ1EMc4Àme\Å`\ntZx‹Q©ÿ\0\ÌJ\È\Ñ&)\Æò\É\Î\Ú#u6\ÃGp\ê³+šv\Õ\Ä4zþØ‘n\Z¤]þ\çia}+\Íôf›O\Û$¸ŒIß‚\è\Ç>¡W:~\ÝMsY¯gš÷\Ð\Ökß¿C\êy®0hbððq\\×Š\â†+\"¼\nôo>úr1^±\\\Ðóâ¹¬×½F\ê;;]FY/\îŽ\ÔmÙ¨\"\Ü[\nG\ÚA$²_\É{uƒZ\Ë\"¤‹¤\Â6ið$+y¥MšpÊ’n]¢†\í°G¹r7#¡`üý‹4;\ê\Ú\Üe\"ý0vjq\"Wq\äeŒ·4Lm›j\Ækœ–À\0‘µvö\ÔVÅ­®\Û|cul¬\rÛˆ£\Í0lf§—\rR&\Ó \ÝEsXúôuú•p\î6T±¥E)£©3ZÎž·P\Ý\éý©47’\Òx.¥kk©Muw\ß\Ç$’À÷ñ›fø\Ùº~œ{*\ß\èp^½šó^k‡Of¼Ñ¯=phù£ž£§Àx£Y\"€\Íf¼×ŽžSÑ±•Lo\Í\Å\â<÷b\ã\Îò8#O³\ÛQ\Úö%ey\Ú+xa]CQIª\Â\Õ{:lpª\áu\rÂ‡\Ô3a57Ü¬K%núG\Z\n\àˆ\Ã\nH\ËV\Ì\"ƒ´Á\ê©‘Ie„!*›‚VÓ…xâ¸¢>ª\Ê@…T\ÏÉ‘\Úr‚$\Æ\Å\ÜQZ¶]iQEmûË¦h\åiÕ;¶Š\ìõ¾®\n\ËnŽu!\îSñN)\Ï\nø•3_\'Ò·TWR\Ù\Íñ³G©c\ÞeI#ž§\â®f\Û_¿#‹…|5Š\Ç¯g\Æ3X#§zy>øëŠ>H\È\é\Ç\\u÷\ÆM{\ÏOB‡=3“\Ó‹·i«\ç:—b1gšRÔ‹Ø«h#j‡\ZmŒ..œ¤z“e U¶{%›m’\\>\êQ{Œ«µ\ÞE4¡©\Ô\æ(Ž\ßsdÕ°V5fp1\Z\Õfœñkƒôl‚Ç¶\Ô1K`¨@€\Ñ­k–ž\Ë—Dö­B[E/sL\Ç/4\Ì\Û;˜\Ò\Ø<‡òwf*P\×\ã’1G˜¬Vˆ\Í}*\î¤_Ua“ \Í>\åii©‡DP\ßÛ‹„ù’\Ð\É­Cvñ<2E,6\×/kr™\Öò\Ü¿6—–f¶‡Ž6\ß:û\Í5\î¸É®iº{j\Ï@h\Z\Îz{\ÏLtÀ¬dž†¼‹Š<t\Æ:y®Iôre‚?“j²µ\ÌgbÛ¨¢\Ã\Û@¢[Tx)2jkˆT&\r»­\ÕÝ­ahÂ…$ô£e+.Á\Ä>\îÄ³Jp±BIq[Y6(2ciShZ)G*¨h„\Ép+{š1‚»\ZU\Å2òŸb¹¢k×¢¹¥<ga\Ïl\Ö\Þrv\ï\ÅG+\Z2`6Ö¦Së‚€£\0È¤šõ\Û\Ëc\í&Ô©“\ìWe:Òœ\Ô\è\Ä£­\é¢h/´ñ§\Ùl®\Ú\Úk´auÛ’\á‰\ã¸ø¾¨5K;kŽ\ä\n;s¶Õ¡ƒ@V+ž»kš÷C¨=\Ð\ë\"¸\é\æ¸\é\â½{â‡š\ÇLÐ£\Ñzø¢\Õõ#\ä2‹]Qcu}3s\Z5ZŒÕˆ† ´k™c³¼½7S[\ÚÕ´3½Z¬q:iB5/Ñ1­¬i¾Š~\í\ç¸û=BFŠYP­<j)P0E9?\édþÄ}lU¥m²\n\ØÆ¶m¡\ä\';@P\ØT¶+e«m7úf\ËFw®\ÃEx+‚‚;Y–€SE\r*l¯±;	¯\Ãuy#*ò:\íi¸7[€Ú²Á*\å7\Ñ¦B‚V¦R’Î¹¯iˆ^X¤Rð®-n\Ú5\í\î{/ý¨.r³|V\çð\ï¬0É‚ôÈ´@º½Pó^iüûÿ\0ž‹\ç“\\\n\ç>\0ð|ô\ÅqDW8\Û^z‡Š\ÇAÓŽžk\×\Î.ƒ(&‚Û¹NË¦&K…5)¯5++)o¯f¹yõY¥«.:|PF2¥Y\éwS\Ôx\Ï%ùH\Æºð2_\0V8LPò«—\Æ)d/x…½\Z¾\ÏJY_–È£±†jFwnHßŠ\î-eZ¶VÀ)‹\Ö\èñ\Ü\Ëš\îš\ÍpC&(\ãh\n)óÜ§N~Ž\Ò\n6\Íõ8+\\Š`R¿\Ø*s(&¥™Tšd\Êê–‚\á5[ÌŽ$‰¿ùµ»\â­Ä‚{\Ë\\ÖŸ:Iqñ›ô½±\Æ+\Ùq^(ùó^‡\ÏP8÷ÿ\0#\"¸\Ç41^ŠöG_4(x\é\ìš´\×9sG§Š\ä‚+\ÍX¯\ÔVÛ¢Ë¹¤¾¹\ÛV6{Z×¹qF\ãñ\"ùû÷rCg+mgTG5n¤€£u¸\ßO\Ë\É1\îZŽ6yA¢*% úŽá¥Sp\rÀf‘BS\"5ª\Ï#Æ‘•F‘Qs\\w\Ù#\Ù\ÛUn\ÐÞˆÆ°\Ùí†®\Ð  ¶F\0\ÆÛ€vn[q Ž¼F§©K\ZGgSV\ä\à§\ÝÖ¥ˆm‘p\n\×\Ø\Ò/ö>\â]F\Ò7\Ö>Ò£\È\Z±W1‡MM1Wšz\ÉÚ«P»—ûZõ‰Ž%dŽj\Æ\ÏP;O4hV8¦É¢+\Þ\r\Åx¦óŽ}\Z\Ç\0p|óX\ä^úx\à\çš\Ís@š==W¯Lq_¨óƒj]Ö‘bx\Ùe6rdM{-\ì¯f–õsb+K0\Â\Ú\Ýfx;]\È\âP£ŠS‚­ö\ÎFr±\0hr\æ *8òbÿ\0I\Z0\í+Œ\ZŽ2]ú™]¤J\Ûý|ž\Ø\ß\ÛA(\'\é[>\ÂeT\Í\0¨B\Æ\nÆ«\\ƒ™T\È\Ò\çÄ©H¼l*€;Ž£ ²œl#€À\n»¸\ÚÚ¢”F\í¦9$\n1Š\ÝÛ§P´ñ«¬\äT\Úb\ÛL´û4d\Õò\â+­\Z£¨[\\#\ÂÖ’w`œEso§öGy¿@Ô¿:\Ë3Y®)y¬ó^:·4k\í\r\îó\ÔÑ®2|×Š4:\Z\ÇòñY\çš5š2\ç\ëú‹y¾ò.Z%$zº¹´±C;¥½´`\Ì\Ûacy\ï\Ê\Ì-\ÛJp\"\ê\\\ØU\Þ#R•±Ánˆ\ãS\Â}™‡N)1\ÅXŸª¿nIK’h²\áŽ&¼²ö\É\ÛAf´DT`o)÷9P±\á\Ú5Šl­&\í\ëAŽds†a\\\Z‘FNv\Ø-²N\Úá‰­ü¸5\"\æ¥É­¬õ·&_ `˜“´\"~—ë´š¼\î\Æòþ%Á\Õm]\ã‘;O§)Y÷É¤«LÚ’\ê|R\ÝHx5ç¡¥®3É¯u\èŠ8¬s\ä\n\æ±BLsŠ\É\é·4x¡\Íx¬æ®+\ÍtòE(¢:}jgúü¶Nþµ•¶[0÷R.\Ë[;N=Ë†‘&¼»¹wb,`‰¦\Ç\"W\Ì\ÍÚ¯5o>)J\âÛ‚„	\'˜˜\á@\éÿ\0d®À\"8\Æ·\ßpŠ5\ßÙªBwnœ.0±„P[_ÚˆW;\ÈbS\í\Ðÿ\0¬}·’$—	» »úˆ\Å0\ä±.[\ÜÊŠo±”`\Ä_3bšM´Ud®\Ñ+ý˜S\"µ\ÇLµ4E©ÀA!d­‹¶L¥/m…õ¹+¨Z‡¨n?\"=NÍ­n­$ÿ\0õh«¬1þ@\Ó;¶VW\"hŽk\ÇO?\ËVFN£\æ†z^E/“Y¡F¹þc4|Šÿ\0š>i«9¡À¯X5¨\Ü%µ•\Ã5Ö¡|¸¨7MIrHš\ÓG\Ò#½¹ž¦\Û1L®`´ši¬-Ü¯u-[ý2 bK(Ri\énŽk`@ai*À\nÊ¦\ß£_\ê\æ*Â°e=\Î]\ÉlG0\Úd&˜I\Z€û›”-+î¡p\Å3\ÎV”ò6\ZÈ¢I¨gvß±]´b\Èc´ý·ø®T•5ŒT¤\n‰¨\çp\Î\n†¢¿wVª<aÑ˜dxR­E,m™.\"Þ­•¢»ªFú³9¯\ìÌ•~”»7j6\Ísšv¤”½«Y\ÉÛž\Â\â\ê_Y¶Ž\ßT\Ðn¬›¼\Ö8\ã8\âŽh\ÒñX=GOC\È\âŽhƒŠ’‰¡š\"‰£\ÇOU’:¯‘\ãþy\Æ	¯’KzvŸvµ-‚óã–¦iã¶‡÷MJ\ë¿s\Ü6ªn¯\':}ª\â8”\Äo^U¶€¸\'‘[¹‹ü@\ØgË¶Ñ¶\Ý;qS\\v#µ¸\î/\0McœY\äõ¥\×2\Z5”\Ýõr€¨E\"\r»%¥Œ’aaF6¢¸B\ÖR÷\'k0Â¹\ËÍ¶’\ã{œ\ä\ÆE!§òUqõŒ$¡˜l%)S§\×¥c+\ÚgR$5*\n‰v\Ä\Ô\ã\r²¥ÿ\0h\Ü3?-7m^\î\ÍdFºhÆµn\æ¸\î\Ù\Ë\'nI®»öz³\Ç=‡\Çn?ºÙ¾¥k¡\Í†…x£^\ë\Ö+\ä£ŸáŽ„\âLä‘Š9¯DQ\æ\Z_óž1\Â\àS±+úv-\ÒÜ…–.eKo\Ú\à£µ·F-|ú•õœ=º\Å\ï)–\Î/³´¡kþ\çm\Õ\ÍCö¢\0x\ÎI«\\\ç‰¦êµ‡\îÁ]„8v_±P+Jhû„Røn	\Æ\í\rÁv»zª\Ô{\ÜbQ\Ü\Ô\ç\ê¥vœ1@¸¡4h \Öv\Ð\íš0.\ãWl\Ô!”\Ò\ÛMO\Øöe˜&å¢£T/4ù4¦4ûE(8 \íI}yJ½@¦VÀ¸Ub\Ù­“p\ÏW)%”—	sCsc\Ù\ï˜\"¼M	$7–þÕ¡ü;iDñykŠ¡\æ@zc“G¯4+\ÇO]<žŒšoò:(\ÑëŽ˜\âV\n>w~m\Ë*ZürÑ¥µ™{.\â\ÎñÎŸmm\é\Ö:\Ä—k¶ª\ÄCý5Àß¸\ì§5\n\ÔŒÿ\0\Ü@9P–¶]\Å\È¸ª¨\Ê\Ëÿ\0LH|sõÈ™¬ª	”­w%5\íþ”²Ë<±?å¸¥º~J\çò8Ž\àÑž&¬\ï5þÎµ°š’-\Æ8y2aZv\Üò\×²	$\Ç;Hú0\È-!¦¾\í»›ÑŒ›T}vaI“\î\Ù\á—sT­¦¤@j\ë\î%Œ\Ön\\\Z\ëºL^?\Ö;ü\Õ\äf\'–]\Í?nY,.^\Ú\é\ä]\ÛcTydž\Þóã·¨ñ¥yþ¿\ë\Åz>y¦\Ñ4Eq‘\Ó(sY¬\Ö8\è\Ô3Y¯=9Ç²Eq\\u\Æ@Ý‡k\æ·\éw­\\Ä†\Î´3\Â5+\Ùnm­µ)»o&…¦¶µ¨jW!e°²’CmoµKF)Z‘w\r\ÔPn‹\nc\ÍI!h\í†\ì\Õ\ÜRc…‹²}¨\nŠl°\æ¾\Ý\Ñƒ$2\ÖÓ•Z(In˜C\Í÷,6\Öq\\g…UÁ[Š\Â¼\Òb»¯Ž÷r¿\ë\Í¾¤\\\ÑBË†\Þy°P\Ä\áªU\ã,p\ÍË¾·cÀ’6Z¤\ÏŽ|2ýY$9(«\ÈÔ´ñŠ’SAvrõÇ«)\â:~™¨µkV\Ð^\êz-\äúv¢}!$Ñ¥¡\Íq\Ó4z\çš\Å`ƒšõ\Ó\×5\ì$ó\èøñÓGŽ˜\Íy¡\×Ð ¹\Z”\â\Þ\Ò\é\ä¹Ô®{Ž\Ë*Ám`\Ð\Ç5\Å\ÓG§\ìy¦„G£\é°\Ç\"D\"M6\Ù\Ô^j(\ëw-ô­¥œ`2@ÿ\0Z\íTŒ•T\Ír~¢3¾”\n\0\nHò\í\Å`»`g·¹J®ð\ZUM\È\Ø\Ü\\TÒ…W+ô¤]\ä¡\È\\\Ð\ÝJ\rª\ÆÚ\äù\Ûû\ä\Ö\Þ!cƒ8‚\ne\á¡Ú®»A;i™^—Xâ‹\Í8|¦\ê8z“$?	9Þ³\ß)\ÞR,³+.\0Gº¶\îS\Ã!k­\Ðk;\ëôÛ‚\Êe- º\Ûj²A}£\ÈÖ²M5\Û\ÇM¼ð¾‡B(gq\'§š<žž‰\Í¦½\n=<Š\ÆEs\Ôg\n>c~\"‹w\ÒþÓ¸\ët÷—³H;sDÓ\Ïu\Ì\èo&\Ò6ùò‘³#\Í%r¡e…!ŸH\Ís•m\Ë\nƒOÿ\0\Ø\ZEG4ƒ†]B«Oõ\Ã\Â0……]•V9R\à€\n_8Ê¨\0n_2>\Ú\Üh\îÊ©\ÎÀ\ÇfYÀ\ÂG\É\Ú¦)w-Ê“¶^öÒ¯‘Lœ°c\Ê\Ö\ß\ënjM\È#\árV‹m©6\Ôÿ\0\Ô\Îq\Üi82\ä5Ñ	‘$\É#j\Ò%I‡PL.±\æ$š;©-©\Z\ÞÓ®SXŠ\Ö\à\ìq\É\r^\ë\Õz\çwý1^\ÅfŽk#¡\èEX\áˆ\à-g¦h\ÓW\É¾óN…®µVQm&Ô¼øñYº\Ý\éb‚N\ä4ŠY·ÿ\0b33+\"¶–¢\r÷l\0R™\Å!úg…‡€2v’\Ãm$‹D©|H2R?±\ÆT\Ñ\Ük¶jM‘®\Â\Õ+€˜p‰7\ì\ã²Ô©\Ã.\âG,p\ÛÚ¸‚›š]\ÅWu>p­JH®\Öñ\Ùûö¸Sô-š1š\Æ\Ú|µ2-J2_šsŠ\æ¥\ËS\à#zÿ\0Š“\ëD\r§J¿[›}­-¬7+s¾*\Ô#>dKWÁ‡Mk‘n\Æ\Þy-d³¼ø\ÅÑŠ\í×¸#\ÏCÉ¬šõÐš\Åx£CšÀ¡\Åy¬W£\ãŠÀx\ã#ŽžüVhfŽE{µ\rkD4zýº¼%ip¢)’iµ\r.\íC‰	O€KHcÀ”˜\íû\Î\ê!A¾\Æ<\×\ÎR>I–˜\Æ(Œn\n\Ö\×Ü˜\È\Æ@Z„,sÿ\0-Ù£&\ZF\rIH\à\ÛDÍšÈ­¥¨CCŠ5\ÐH1\Ä69V¨Ìˆ 6\æ2Š_\í¤\á{‚’P\í\ÕØ©þª\ZLo\"”š³`Š\rË®¿é¾¬X1^\0oëŸ—e˜\Ò\×%‰]qª³øQ\à½\Ó\Î\æR”±µZ¾Vö\ÜOi<°\ê6ºl\ÓC©ZD{r!G^Aó\ï\Õz>(Q¦¯|\ÖzŒž±\Ó\é\ÅC9\ê8\é\èyÿ\0B\áûPj²Mø\é;ZGv§¼¥–\ËK¶.–öOkew›M6\ãdqþI¶·²G•\Ò!±Œb³¹£\ÎcZœ²ñ3QdPÀ;qJÛ©ý0À;·“€1x&f\Ë6\Ú<Ó¶k9ÁT‘ñ\Z),`:5v\ëµ\Æ\\¼Oöh¤‘U™7\ïÙŠn4Ig€\0˜Á‰ûb]Œ;;dY’\ç/\É*wª s[v\Ñ§ñ€L\Ê6Ì€R¦(°\ÚdHØ©²\à\Ðb¡ô21Z0n§\Û\"\Þ}MÍ²\ÜQM’F˜‹Gƒò\Þ6:Žª.š\ç\ã·\É}l\ëC ·SC¯hœSmŽ=ùéŽ€×º\Æz:g\ÇNk\×Àø\×\å0iú•¼\"ò[“.¡©G²ù\å7iPölû\ë[¼†Á-w,a\Þ\é¬\âüKv”m¥¨³»œ4™®w©\ÚFzŒ\0T\ns’¹Ü¢=ùûd¤\È-†¨W¸SŒ»\ë!#U\ã ¼x¨\ØQ¦¨­\ÎP5;\ÇR\É\"7u\ÅH3Yu=\ÕS<@\Ô]¬(–J™þ\Ëýqÿ\0õ`ˆó\\Tó>\ÅEa\'4\à-m\åÀÀ\æ¤oª¶\ê-€Ù¢v–dz•”QlHÍ½dZ61;\Öê›ˆ\Û.Vib–kq{¢\Ôn\Ä\Ü\Ú`\é*’O£·¾ùNš³®œ«yi£a‘5\ã§8¯^¨s^9ó\Ôô\Ïk£Œùþ>k\Ï_<W=O“pŸ ¸ˆ\ËioJòC5\î‘lf¹MKI·¸–û\å·\Öó^ª}4\èD’Kp\'¹\Ç\ÕÂ¿\Ú6\Ú\å\Æß±a„lñ¤¦qAŽ\è˜\å\Ü\ÍF\Ø(V•—\ëA\ÑBÉ½‹\ìeæ±“\Åc²©¡$Dnú#*$—1\Æb™Y$…‚Hƒ¹\Ü‘…G1)©p­nŒŠ—²†\îC[YÊ¶\êò2\ìFú1\Í=\ÜPÿ\0KÉœ\Ð\Æ]¶—|™f\ÅöÊš\å$Á\ä^\èQÿ\0\Ïs+»mq—VLR\ãc)§ª\á[¾ø\ë¬F‚C\â]¬bkAq\Ë(H.)d³ø\Ò\Çm#Z\Éo*r ô?ÀôÈ¯ÀP\Íc\ê±^\ÇLô=_|\Ök==:\äL‚G\×7.œ\Åb\ÜÒ¡0\Ã¸Š\ÛPKc›\ÍI\å\îI±n‚;D{­\í\Ê\Ì~\ê¸þ¸ØŸ\ä)\ãw(„¦\Õ\ê+¼i¯#†£»\\\Çoƒz”÷e)5O©¢“®Â¥5tÜ·\ã1\êTš¯\ß#aq¬-¼±jý»…¸¸\ßFVym\Ô\×w»Wy¨K?·‰ \È7\É%¸w#\Ê\îG\Ùi7\Æq¸*;\îôŽªÀÑ˜ŠyA­û—¾±C£S\ÜI\n¾¡¶¿2\Ö\î¶G¾D{zü¤Fî¡§lSŒ‰y)‚n#\Éÿ\0\"LWl\ÍÛ’yW\ZôÇ§b\â™ÿ\02š^\ÍÎ†½\ÛK÷1q9·Ž°:b½×º÷^kØ¡ü\È\é\ï5Š÷\Ð¬b¹\ê1\êEô†8¾Bÿ\0a {w‰®&hš\Ú\Â\ãm”Ÿ ½\í\ØX¢ÁiczkpŠ\ß\ä\ÉojQ\Ån¬\â†+\ä8F…\Â\Ä\Í5b(\â–\ç÷R¶„þ\ãsq$:•.¦cüŠ\Ö—\ç3NŸ¼\Þ\ÌË®#?\"M\Ã\äO\r/Ë¡aÈ’jüø\çKKÉ·\Û¶}:ö\â*±™ž\Æ)?\ç¢U½\Þú\'|c\èñ±±fþ\ÈAx\â\nÿ\0°¼\Õ\ÉaI1Y½÷¹|\Û\\\ê\ÔaW\äv‚¤ù>š@ùNš(|–\Ës\ëQ½>±§ù½\ØõÌ¬÷“o“SlÇ©\í6zå´‚\î\ê	$ŽM´n#\"9-\Ãlhr*\àJ>²ýOµ^u1¹n.ˆ7Ád‡\ã·me¨hòÿ\0m\âµÅ¾‹¬*Kg±‹Nœ´}\Õ[z•®:š\ÏA\ãšñ@\àWž¸Á\è(\ã\ïŠ\Ý\Íc¯ž€W‘À®k\ä?r‰öÅ£Zwõ+¢dk›¯È¸Ö§ü»û`ŒlWlz•É‚\ÖË„6 ©¾\Ô€	H(6\ne\ÝX(ž\ç\ík|ª¦þYZöü\Õ\æº\ÒLºœõ&¹\ØKv\ê\íf“P’–DŠ­µ)£?¹«‹­Aa¤›T¹\Ü^£ik%À\Ó!h£“ñq3Ë¿’K\"g_Áµ¸\ï\Éùs=„r<qlf¹c\Ì.¬‚DqŽ\×\ZX{\ïAœ\Ì\ä\â\æ\âHå¹¼\Úð\îV{\Å\Å\Ä\Ì\r\Õõ\ÍÜ·I\ë«\ÕÄš³\ï:Ì”º\ÖTk\í[\ë‘ÿ\0\"¶·«/”O$–óZ^-\Õ\â\Äðj\Öú\Ý\æ\ëR;´\Ü r\Z&Œ–®w-m/[qW£j\ê({\ÐH$kM\Ñ\ÍeŠ\ê\î²\\À°µÅ®\×\Ð.%+wŽœ\Ð\ëÿ\0#–\Å`\ÐŠæ¸¬óêšð5ƒü3ÔœQû7\È\Æo\ìÒ´JZ­\Ì}\Þ\àkŽ×–±¶\Ã!Šæ¼¸²\Úg ¸Ê¾ÖŽCL½º†\ê8ª]R\Õ+ÿ\0+\Ð\íª_io_ù2\Ü3ê¿‰R|ª\'\×ô[¡-\î…S\Éh(\ÝE%)·zŽ\ËKj‡H\Ò´O‰\é’\é?¤ÿ\0\ÕdÔ¿Gt»kh¿Ho®­®>ò-%’ò\îÁ—_¶«{Ü;\\E-É¿´i%š	§Š$Ò˜%G+ ŠvZ¼A%\Ü[jg\Ð\ÄRQNÿ\0cô©$m—Y\ê\ãc~SŠšG\Þ\\4•«k\Èe¾¸‘®Zy\é‘\Õb´¿»S¤j\ÑmRhM\Ôf)¤\Ü\â\ßGn\ßi­ª\âx¦¯\Üû÷¨smòû›WOÜ½[üù¡¨ÿ\0P4—|»A’¡\×t\é¨]\n¸›*„:\Z»9]wtm•\ÜeY+I½\Þð\æA5\ê\\µµœ²[é¶“[L‡\"‡E\êzx£GÏƒ^\èóG\ÏOx\æ±\ÏO+\ß\0×Š\Åz\èh\ç:¼loôk&¹{I\ã]\n\å\Þ( ÿ\0nóheiX4²\Ï#½Í¦BFø«\Ýb\Î\Ån¿Qôûs?\êv®jœkú”×·z˜©®»\Õoo%\Ëiÿ\0\×\îM§\éÎ¦j/Ó:¿ð_Œ¥/Ã¾5>…¢FC\Ò)>?¡-K¤\èð¯\à\è ~6„)WC\Û\Û\ÐV¦°øü¦]?O\Ö\Z\Äaÿ\0óD©¾E«%\rE‘\í5xŠ\ÚkkA­\Ú\ÍV6±\\›7ƒ0†1ý½¸£’3µ§\Å\Ì$‰ÿ\0¹Tm†r+RY1$·8Ž\Úê§™.j\ëDr|6\Ù\ÏÈ¾kSü–\îjŸ4½Xþ3ò›’¿\ÔRŽ€•ûšBü\ã\Õ…ñ±I ün¿bø\í\ãv?øö[\áz1/ú{•?Àõ8\êoŠ\ëpÔ¶zµ.¥{kIó\Â\Ñüû^‰aýF“|\ãL¸­E\ìuHYÍ­ÁVl“shú„‘Ï¨Go­ñ\Ëå’»@6Á”lŠ1\×\ÕGø{lQ£Duz\ä¹éž™¯U\ÇI>Ë«ÂŸiÚ²µŽ\ÉS\ãÍ¾s$v\ç\ë`ŸúpIØ‘\'V–\Ñß’|ª-$].£ª˜\"&°­\Ô=Ö§s-\Ý\ç\Åþ6¢ö\Z°\Ób3Z\ÛU\Ý\Ä0=¾£(C{.^ó}D…y¤/WVwr-¼71ˆô^\åZü:\å¸ø^”–ó|N;S&ƒÐ°\ÙOc\"	º\ÒôËª¹øŒ†ó\ã\ÚÎ˜G\È5GÑ¾_6ûOšBõkò½%·È´WH¯…\ÛÀAVL	B£\'zz–&jòf\\jzŽŸj—ÿ\05\Ð\à[›\Ü\Z¾ù[\ÉCY\Öo*=P¹¨þ=b)l»F©\"¦Ÿx\Õû\í~Á(¨>=#\ÒbÒ„@\Ù!cnŒ?ššÖ§¶‘D¦\\B÷¡\Ôõsoò¦F\Ô`˜Í¤iW©«|\0v\ä‰\í\'˜¤­,j\Õ÷ˆ\ÙIyv\ÖóEZr˜¤¼\ãi¶=öˆ\Æ‹i&U\ÇÉ¬\Ñ\èk\Þ:sŽzû÷C=8‡ò<õ\ë\ï¦9»co\ÛL\×7¿ú\Úr\ïƒIK‡¹\Ôu¹\à–-œO\ÜY.5±ºty?!ùz=€š[™4•šK»m³\Éc¶²OÀ´øW\Ç[W½‰£µY/\Z¿\'ú\æ¸\Ú$¹tgj‹Tq±1A¾£µ+Q\Âkñ­Þ’\égFéž…Š\Û7–“S\éqµM¦\Î\ã\ì®Ü”V¯4;ú\Õ~ñÕ…õÖŸsrñ5øÃ¯j¥þª|®Àè¿­-™­þóMB;¿ÖbÙ¯?[þS%Oú­óKº\Ñ5w\äWZ•\ß\Än¾9{t-\ÏK\Ô5ƒeñ]:ºxŽ—K…Š¡‰bƒ\êt\Ø\ét¨\ØG¥©¥\Ò\"ø6\ÅZ\Åi¬UlP±±Š:¸X£-!¥o\ì’’H\íö\Ô\ßYöRº3H¨\"¸¾qÊ´þK¢‚Â‹‘NwWè½°›ç¿¨P\é1üI,¦KOÏ´»^mp–Ñ·i7-gš÷Y¦\Å^\Í¼Ñ¯\ë§8ÿ\0šQ\àú5\ï?ÀtñX\æ½-^dGg¦\â\æòÛ½{sz}»þ0½µ†ö¥)eŒÝ–³ò$›Z¶Ò­¡–]Fø\Ç\Ù?mÚ…ÑŽ)$],­\Æ\íÆ‡ñ€\ÛRw|µÜ¤\ÊD\Ô`\ãðøŠÜol˜J\Ð\Ø(L1ù$RÞ¬fMZ\ÑU~Aa™>Obµ/\Êôñ#|’ÀŸü‹Ozý\ÑþF\ê©+ñ£ö¹	\Ñw\ãÖš´:v©qa>·k£e!²Z8‡Y¹¸g%\í¤«\Æe\Õ&µO‹|H\Þ,v1C\ZÚ¦?(À\Ã*P’\ÝLw\Ûiu\ÖCªÛ±ý\Ú\ÕX\ê‘\ËK{º¿\"2¹šÛ»_o_h\Äa\ÚþÅ¢¦»‘Ql.\'/²p\æs¶i‹_voþs¤\ä;KP\\\Ñ(þk¯«.¯{\\ ¶eƒsñÅ–M+J•\Ì+š\ç¯=2kÊŠ\ÏS^zz\ÇN\rs@f·W\à+=<t\×!H®.m\áŸT·¾\Ë\r´B®‹!“û\ä;\êiÅŒ3›T\Ä:\Úö¯´k×´»\Õ4\Ø\á¸+Ø™ö/u\Ïýy \ß2Î‘T¶\ë_Œª#‡\rµGn´BB¿—Fñv\ËòU\Ü.5‹ª‡D½º?øõ±vøÝ½>ˆ¹¸Ñ†÷Ñ¢&]„z½¡³\Ög\Ýiq\ÝŒdeqR#\Æÿ\0;\ÓÅ¾¡g¨»EfW¨\ÖD\ÔÙªñ\ÒJ6‘G,w\Ãnu\rZ\Ò\r¢+)6²Â•4\è*{˜³s¯ZBN£¨]4:N­uQün\èª|Ct’üE\ãYt[ˆ’K}B#¥«[¥¯É®£6ºüJ³DÃ»\Õv\ÝF\Êž6\ÝWQ™+·²¥“\ÈkN”¦¡ú\Ëb©\"B{l»[ôU6j?3bš¼oÙ’\Ö\äÁ& \ì÷ÿ\0¶U\Ò\ìXWø­Ù¯Nphó\Ñzø^†…sŽ„fˆ\ëš-^(u5\ë\Ð\è(}Vþ%”ˆ\ÓòftýVGž\â\ï¨91\Û)\î.Ç“ÿ\0¤º´½›\Ãtm\æ°\Ó\îofI\ßPi‰WV¦\Òm‰uÿ\0ýõxI„H\ÄVýÔ°—&=µmv¨¼¾Ž:w—´tözÓ­Œw,‘ÀbÖ´|¿\ËôÈŒÿ\0$ÒžA­\ér„‰gŽx«©,\ÒQn²[´D¬ešŒŠª.P¿\Í\â/¥Y\Ê#‡ð¥\Õ.ô¯ˆiÐ­‡\Æm^ øµ±©>=aZ·\Æ4™—Q\Ñ_Mx¹‡Ä¯®\Ú\â\Í\Ö*\â\èƒyv@ºŽòõ\á\Óm\àm>\Ú7«X¢H\í5= ¯þM¥Eysò\í5V\ëY\Ó%[›\ÛC¤‰RE¨/§³\Z\Ê\\R9uŸj.¥&†hL•%žõ¹·uyÚµo·\ë\"M2ÿ\0\×L+ôv{ko|\Æ-\"\ëVy»Kl\É=®¨¡.~\',\Ö6–\ï«…n„Y\èk\Þq\\€¼WŠ\ÇQõþ^k¯ç¡£\ÐùõX¡\ÐÐ¬ªÖ¤U\ÖwQ}¨A\Z\Ç\Üc©[¼q›•\î\È\ÏºX\È÷\Ó\\¤2jW\éy>›¥\Ép\ÐÀ°¤C\ê˜\ä’o³ø0i>EumÜ¾0©-ñJRÀi—m%\Æ\Ñs|5€\ß5­ºö¿©WV\Ö\í­%Ÿ\çr\â\ã\æ—n\È/	Ÿ[Ô¦“v°µ\Åó˜/\ï,\ßU†\îŠ\ZPZ\Ù\Úi	¶/\åzŒ\É;\ê\×\Ë	:^\îÝ¿\Åô–­\'FŒ,6Vð€¨•4@F\Å~Eg²µV²—\à ÿ\0\äB@2Gºyl6\ípJ„o­±ºÖ¿\Ý|\â\ë\'\ä\×òµ\æµz±OScû\î«Pj·¹±ù+\Ç®¹\ÊwA¤;ª[i!m\'Up]\ÂÅ¢Œ\ÔP.\Ù#\Å\\\Ú\Ñöš\Üýÿ\0Tñû/\å˜\áÐ´ˆ®¢3\åb’\ìR\ÞÁqn\ê^}Q\Ö\Þ\ã\âH­¤\Åa\â|Hz`\ã§¹\Æ\êâ¼Œœf¿\Í\ZÃŒ\Ð\ëœÑ¬\ç óK“Y¯^ÏŸX\âùCDaºö\Úô\ÉycX –U†µ{\Ý\â\×Uµµ°»¼{§Ñ´½\ÕoiÛ­»\î\Ñ\ÔnÝ¯\æü›O\Ó\èñò”E˜Àd£lTö?±˜¥;Šº}€¬†¡‘-¨\ë[&µò¼\Ô×º½Ö§fV\á4\ØÖ¾=£\ß|‡WýFøn¡úm®üV\ê\íH\ÇwD\Ó-5M#Vø;Yˆ&¸´­\è\éo¹¤¹³4–¤T1‘Z…\êY\ÃòKÖ—M\Ò\á\ï\\|6\×}AnZ¥l’M|½?õu‰E\å·Â¦\Úõ\ÓEØŠ9$h´\éf/g+y,\Õ\Í\ä·m7\Ç\î#·\Zb\Èÿ\0‹$w_\"ý*ùŽñ+Y\Z\ì˜ZN\ÜIq/\Å\'u»ü¸Z\ÛT»¶–\rUXZ\êz¹\r\ÚV®“E?mÅ¶¡sµ\Î*B	\Õ`ûE•“õe‚i¡w\Ïqòx­z¼2\Û\Ý	’8• fKo¹u«üUQôØˆ•dPBÁG\Û\×OW±žƒ5\Ïÿ\0\á\ä/^¼œQ¬W\Íb¤M\çR¶\Ùv\×«[]\Ìn0c\Ö\ï±t÷e\î%s<¶V‡»¥Y4b\æ\çñ\Î\é.$\n‚¦‹r‹	¤¯ƒ\É\Ùù%\Ì*\×M\0Z(Àv\êuB%Rµ4r´Ž\Ø:úD·šŒòV•¦\Üj7\ZV,#\Ô\"Î¥si4\Ù\ê3\Ú\Ë}u©\Üü.%ªAƒð«@t™\áBºæˆ—Nö2\ÚÊ\Þ@¶wñ,1µK²1v-å¯”ž\Ó|~h¾+lc€KBK\ÍM\ã\äpw,\Ý\Ð[\é·_=¤‰5µ³@Šn\Ö(µ=y¦©\í/.k@\ÐûOò‹ÿ\0P‘V£su¤\Ýü‹õ[\å\ß#\Ñ\ímå¾™\ìL\0CZDûG\Èth.b¾±x\Ê\î[y,e%bh\æŽ$0\Íˆm¤$£-IŠ“ýjC1F\Ë\Ï\Õ\ÙGy e¶m>ô‹\î\Ø\Ó\ç6\íqm$\Ò\î’mG\â\ê±\Ú[ª¨4¼04qü3^+¿\ÍC\ÆMqF¼u5š\âˆ\æŽ:y¯ï§š\â³\Åq\ÒOµk\Ð\âóò‹hv¶²O%ì¨°\ê\Ò]I\Ø|\éö.ò\è\Ú+¼ ‹E\Ø÷–X4i\å\èOO¥N†\Ú\å´\íjii·¥wd4\ê\ÏS~4%¤\î3BkSsw‹5Ô¶Z$’\r.\Âh¥Y\×\äºy‚öT[\í2\Ù\è\ì\í¦Y­ ²Ó¿6ûE\Ò\×NÓ¯;pû¨;ŽU\äf“X¼¸,\ï u\Ùs\n»jV«’\Þ~f± X‡JQ8\Är\Z\Îiªe5ªD>Gdm®¡gzøþ\Ûý*=56j:l‚<<o¥¤MÕ¬<v1\Â\ÑM«\éð\ßZÁñ\è÷|~\Æ2}B.õ|{KkýBnÅ¬\Zž f¦Ð®.\Å\Ç\Å*+itö·’¤«¥µÄ‘ˆ.cj\\5Ki¾žÐ­^\Ûf\r\Z×½ò?Ô‹\ï\Ë\×u+\r\È}\Éu´…ZKaq‰cºµ\Ðm!‘\æ‚	#”/\×ü’>\Ë^¨ô\Æ:c\æ³F‡Nf³\ÎkÑ¬\×=}¯ƒ\Íy\é\ÍEn5žŽûjYˆo‘nkI$izC±×¯ð´û\'¼¸}0£|sE\ÛvÝˆ§V–k;:´µ…H\rB&Œ«|®\ËñõŒ_-þ‡&+h£z6‘ÔˆŠfGÛª\Ú\Ü\Î\Ñ\è\å\r´A!²Ž\ÖY¦\ì\Ô4¾Š_Šj\Ö\ïs£\ê,§A1\ØÃ¡ks¿Æ´yô–º¾Ô¥Žh\ï§o\Åv2\éŠ\ï‘4ZD0‡\"*w\ÛZÎ¥V¶¥\î\ït(–\Â%XbMÁv­`T‚®¯\Ðm×´\Ñ<‹µÔ¿Oµ5\È\Ù‘\Éúl‹d!{Ùž\ê@7%÷\Æ\ínŒŸ›n¡ñË¯\ÊOŒü%\×f:>&—\Ó?-\ßO¶†Œ*\Éso*››\r\Õod‘\Ò\ÚV\È\ìm¤\í½4/†\ÉK˜÷Gñ\ËE†ý\ÖMS\\\Öl’>œ\ïp-D3\\Y\Ëº}õµœ+ÙŽO„\ØGp\Ö1?n\')0Hõ\ÅgŽd\ä\Ð\ç§$ø£KÁ=1Š\"‡×¨\Í\Ö:\ç§E\Óy©C\nžd62°¾²½®®ntú¼2\Þ\Éñ\í­£°\Ó?&®@&j%Bö\åM+m¨Ëš‰MN»\ëõËµyúov·?\Æø\Ö3XŠ:¹º,Ï¸\Ë,\Ô-¤–†D4T\Ä\Ñ\Ã0\Ãp\Õ\Üú\ÌTM¼el´{Yæ¾Š\Ú\ÚsKw}\É;÷%\r ,¥šõ«E\â\â/œÜ˜­¾\'oR\é]›;Bð\Åg8dV\rÐ°5p>·£u^D¿“ò½ñ/þx‘\ëPZ[¬© »t«#\Å\Ø0´ŸˆQãµŽy¤³´\ïE¦!Rª\Í “|rI\Üm†%\à‰jpŒ%·‹\r	Zƒ\ïP ¨\Ð\Z’ß·I(a81­~ºgÄ¾!n_Q’\Ûu\ì\Ü|O……¤‚e²µ´šÿ\0´Ÿã©¥h\ÖqkV·EKø÷Šzö(tñ\ÐPþt\È\Çò=84+5Žzq\Ó<DE\'\È\r4ªþ\Åv>›–ƒI†4\Óm\"üq$ox]^\ïhŠ%\ÂUžw(\â>R[\ç6“¥þ‘^\ÈY\Å’JxZ¿G¨ôºü),H-n‰RDim\ã&;t]\"%\Òv\Æ;¢ŽA±‰\è\Ú{„]Ýž\"€\á\äŠ&–\ë{\Å®\×\Z½\Î\Úù&¢/õ?i\é5Å¼@\Å+Ì %pk´µ:\Õ\Ò\äjñŸ$±‹Rø¬SÏ¦\ÝiÃ¨i·\ÙŠ—EüJIpc–6¥\ÚiVq…’\ß4`š$*\Ð)Y#UiŽDƒ¡v­h[à¢š‹*B«›R§w‹ý¨w‹\Ûø­¡‡Jš?\ë–¼šw\ç\Ø\ÙÂ³Ü”}L|wF³D\Ót+;£Ä´ûz\\Š>qC‚\Ä\Ðâ¹£\Íz\É:\çŠó\Ó\Ýx\é\ã©\éš_4r(\ÖqF³K\Å1Ê™€©%M±Ì¬\\°CùêŠ¢\Ö\ÔO¨\\È•Û‡ñ´ðÚýÃ¥\Õ\ës%³\å %\Ý[$È¸G\ÍjP%Õ—\ÆîŽƒóEt·QIoº£·MÇ·‘øK† \Æ\Ò\×\ã\Ä\0€(ƒ\è;Îµ\Ü\Í4p\ì‹f\Ý\ì\Ë;¤m=\Ò\È\íqonŸŸ3S›‰M•ƒ\îüpu\í\Åò\ÝKñm\í­d¾»ø\æ”,m\Ä]ˆ\í~†\Û$ƒ\Ý^¦®\×PRÕ¥7þ¦¯¦J.K5\Ñ.™\Ã+DEMe¢m?e\åˆ\Åq\"Tw;«»œ‚[RLi±\ín	c”$j“E¾£B)\"\ÍG¡¹ji6Ó¨f¼ú\×\È\îÎ¡¨\ÚZ­´£Œ^£\ì‹\\Ó‚Oñ}.÷Wš{­9\ìu›y•ü¤žF\ry£\àøõ^¼\ç\Å{õÓš\ÏñŠñÓŠ\r\Í{ò9pjD\Ü5NòTú]\å\Ëiº\î›P\ÏÉªdÁ¡«$²\\ËF~Í†—\"\é¶vd2¡=\È9;•\Ìg\îZ%\â\æ¾oböº‡Åµ\ÝtDÉ¥cK K¡™ò*\ÙHA²”‘ot”&:K°´·¶¦„\êÅ§†2úœBž\ìJ;ö\ä\îžVý²v¡¦•öQ¢ˆ•i\×\íªIý1½]F÷\á\Zy­­¿ª´ðñs\ïcö6ø¢ŸY¶°ºQ‹\Ô5§4v\×_1´GÇµ¯\ØþEg4wQ,;„Ñ²(Dzk%\ÃYC$\Ïf½\çI 	©On\n\ZŽh\\J\ìg¼&K›¸©/d¨!i(Dx°#\äm8\r¸\\\n0\'\äwß¦hþ\åò}^ñÃtW¶~Kj©_ž\ÏOk»Xtý.ò´ƒNù¦\r¶¡¾S“@‘F¼\Ñ\Íñž8\èht49¯UŠ5\ê¹\è\Õ\ì\ãœtõ\Ó$Vi¼ö“·«6\éž\0Ñ´\"­„\ÖOwp.SIanH\ÓuPg¸¸Ÿ/,Š-û¿\ßHÿ\0\Ô\\žð†)ò7ólKuŸÀ\Ô-³\07û›¢ˆ\Ò	ô+\Ú$þ;0\Z~\Ñ5¬À¾{#~\Ç6\Ïüv)*OŽÂ¡t›8\Äv»Sú#¥}\Í\Ø\Íˆ©\Õ\Ë—\æ\Zò\Ø[[ƒuqñ½=m µ\Z\Ê\Ò*\Égõ®\Æ\Z-‘\Æ.HCr¿[\Ø3Ep\×:{\\Áòm2K\ß\Ó_®§¥ vñ\Ù\Û_ŒŒ²[›ye³Šj:p\"[ i´˜\Ù[CFo\Ø\æ\È\ÒnÒ…¤ØŽ\Ì-Q*\ÓF1´\ÆC}]¹ÿ\0f\áUõSX‡À\íG\ã[©¨Ú–4g\îok\ë\ÎÓ¾8ò	\åºy­õ‹†¹o\Â\í^\Ù\Ê@¦°\Ý1D“^k\ßF\"‡QÀZ\ÏðóX\ç?Àœ1\Ó\ÏN(\æ³\Í2‚ÿ\0›P_ý®\Æbp’\'\ÖQýqN;\Ö\ì\è\Ìwj#µ,†A“P\åU\Øö\ã˜3!TO¾Ñ›«p\Ã\äZ%Æ“{ñÏœY\ë–v–»(ˆqþk\'?ZR\0[ˆ\ÃIu‘ŽFEŠ·,tn¶Q”’\æ`DS\ÉP\Ú*n+N¢¥Uò­r\Þ\ÂW“QºøGÇb¶¶‰m\Â\îG]‹\Zf­R½\Â\Üm”H•n—r]!\"DÁµú˜üo÷‹\ë·?\Öloâ»´ŠL”d\Â1\'²Mmh\ÂH#·öÚ´\Ö\ì”\"5³ƒ\"\"„0™8¥9jVm®E\ÛZ¦­¤\Z\íýÆ¥©i¦\ØGÀ¿\á\ê@Ì–,\'­J¯\ä±Ó³MS\Û\äi\Ðñ^:x\è1\\gŒò+œ#\Æ\ëš\Üo¬Š4:\ç\ìø£\×4|\æˆ\Ëvÿ\0®\èÍš!\Ù?k\Æ]ºŒ]‰UÍµ\Ä}µmI\ÄKk·µ!J¶¨|\Ì\ãjM°l¨4\î\ÂH/ôû+˜u‚\êºtš\'\ê©¢Iaú“ñÛ¸\ìu6øe\Øn\ÈœB‘\å3Mx3\Çf6ñÆ‹¶\0pX‰iV6¦A†8«\íZ\Ê\Ì\\|ºmn\ï\æ÷š/\Ç\Û\â\ß\r–þk{\"Bµ¿\é÷\Ûÿ\0¤hPE“@Šcº¿\Ê\Üî«Š›=\Ët\Ü\ÒA¶\ß?ø«­\ÇÀþ{?\Ä.4j\ÏVŠ9Q•Ðš˜\ÇY¶­\ÐbN\Ö6¦<%©`4£mP&b\èý¶\Ó2<Ýµ\Ö~Skhºþ tM\áº^^l\Ï\"ÿ\0;÷w¢¹{M@\Û5¦£q	\Äq\æE¶¨\í#„ÿ\0X$Ÿg\"½W¯\ä\â¸ P\êEc¯šMf‰\î¸=8£Á\Å1²\í?ý•Å¹\í+n¼¶,Eý‘.m¿¹3\ß\×\ÙÚ´ˆ÷<ó,7Vm¹b\â§«\rV\ËÇŠ*\ÍN{}\ÚH>Ú§\Å4]V;\ÏÒ”«ŸŠ|\ÇI#\äÿ\0.Òª\Çõc^¶¨?X\ã¨?W´ÊõwE¯ÿ\0*h\Òÿ\0StP?ü›ñ\ÚO\Ôÿ\0Ž\Z?©º§ýO\ÐTOú©¢—õŸMˆOú\Û!«\ß\ÕýR\äj_+¾\Ô\ßK›å·–ø,6\æ\ÛOTY\ÙR»­…q\Û|–Š¥\â/J\Ì\neúK7¼…nÉ‰§p\Æ\Ìgp\Õt¸o\íþKñ)’\ãC\ÖõŸŒ\Üiÿ\0¬H,R~?0µù~‘=E«\Ã\"\Å|Ž!=\ÌA**kˆ\è\Ü-w\ÅIv‹RjH¦mf]ü›N†¯?P´*ûõCSù–­¨˜R\Ô\ÓFø\r\åÄ¶úU½ <pjû-‘\æY¥H\Å\ë³ß¼‘Íª3\î«Kw‘á‡™—·x\íóG49½\Z_<Vhq^hsGž¼t\à×¯4h\Zó^¸È®:ñ\Ôy•	\ãQn¤\Òo²µ\î\í\ã\ÝW6\Ü\\\è\ïŽ\ÄV\Ò\ëÆ¹´•m–\à3jh6®\ãR\r«#¶”ndX°&eŽ\"X\"ª\ÎXƒÂ…•¥··™/>ñJ®ÿ\0Gþ1=?è‹/ÿ\0„g¯ÿ\0	\êõ\'è¾¹·\è\ï\È2?H¾G_þ\"\Ö\Ô\Çú=ª5\'\é\0\Þ?G´ª_\ÒoŒ\Ä?ðßˆ\éõ\Ã\é_P±\é©gRýR\ä\ìiŽi¦\Ú\Ö\å‹\Û\äG\Ð2‚ÁC\î,Œ\ä†J¸Vo.\Z ŽF£¥Cz—\Ú–rOñýù¦ý=¾E“\âÿ\00µ\ç\åvE~Iòh\ÏþuòXj?Ô¯‘­\Õ-u(~ª\ë”ßª:\ÛQýCù\Óü\Ï\äRSkúüôd\×\îJü\ä÷¦/\Óß—\\U—\é \ícú]¢YU†Ÿ§\ÛZË§˜\æ”}$n\ÑF\Å]IºÏ¾\é\Ö7¶ŠKš°¶\Ýs\"m­:\ëH±W\Ç*ˆñƒ\Ñy9\é\ê4|\Èñüýñš¹\Ãy÷^\ëÐ¢q\\\Óóš\ÛÆ¿nö\ç\é§iÂ­kn\ró¢G«\\A%\Í\ÄH÷®½—Œ?\äÛ¨Cœ	7m…ˆe\Å@šY{µjW„\Ñ\Ätd,\Æ\í\Ð~eÑ¯\Ï}Ï©:Ÿ\ÜgF†þ\âJŠ\â]³_†YZ\à5\ÑVü‡¢×¸^¹m6ø¿\ìw³U§\Æ6½®†ªV(\áŽ}‘Ô²ý¯œ\á\î>°ý²®b\ÜÎŒ(mu‰6\Ç UIe“0V«\È\Ø\×*\Ð\ËP¶h.j\âÁ]nôf¦øô‘\Ò\ÚjQ\Ôw\Z½²A^¤M\ZS6•ñÆ©´OŒv\×\ã\ß\Ù‡ñE¨4¿T6Z<t#³Ž£š‹<A\ÅÀ4eL\äIJ%È©\ÆÚžI@Wt¬Ý¶Ž\\\ê\Ó1¸øÞ›5\Ì\Ïc±d\Û)²µ\Ùp³›¤ûõõ\Åx&±Šký\Ð\â³Y¥óŠ\àuóÐŒ`-y\êy¬×ª5ŒP­\"B\"\×\Ó{^N?mµŒ*[mTš\ä¢\ß<\×mCOª\Â\Ù\Zu~\äJn“v-ÿ\0\Êdõ\ÛÖR£•UŒ\ÑÃ…G\Ý‚\r&ž’Tv0\nü4+±Œ;¤µo\àCKg\Ú\Õ˜­BÁY’\Ê:K5A–\×1 ©¢W]B7F¼»	%2S++[ˆS\íj EÂˆö2´A–Hò²\Ã\Ä\Ð:U\Â\î¨Ÿk\Ú\Ê\Åm»X‰›ñ£cûz]&))´(Ø¶„±³ü~2\Ëñ\Ø*_Ž\Å\"ÿ\0\ã¶\ïG\ãñ[/ñK-\Ïñ\Ø)¾>Â¤\Óob©Rþ9mî²¡¶\Ñ4ï±®m®¹|ó3}-‡þÄŒnoô\Å_ý\éBþB\Æ{{I¸½s\Ó\Ñðx\'Š\æ¼Q®hb†:x¡\ÅghV:s\ÐP&ƒb‰\Å\ãç¢‘Zc’upö\î?\Ö\ß\í\\]#UÒµXÚ¡¾¹y¤¹»Œ[Ic\â¿Pül\Ô\'“v\ä\Êÿ\0T‘\ÝP\íabÐªªoQUš‘™©r¥Y©` \Ââ‚¶cLº‚ib\ËF½ªµqµQ\ä1\Õõ\×m/.\äz¹w+h²\É\Å\á`ñ\àU«´‡’\Ñ\ÆÛ¢ú«¡i$·%®¢³§\Öh\ÎÒ›^Àµ™‹\Ûý\Ù!»F»l¬\n\É$ôÐ8„²\ï@{Dh¨£ÁnC\æ7TŠ*ö\Ñs†œNAI]ö\ÞöS—¹\Ïf\Ö\Â}F\î\ÇAü\Ùmm”[\ÝG‘o®w$7 E\0]=c\í\\\î¬×±G=Lñ\\c&±\Ó9\ê9¡G ñŽ:Šj\Ö~\ÍÊ•’\ÛQ³qc\nš\í¶.“\"\é{b\Î=˜˜t‰.¥¶‚;x‚f·`œb,¹¶\Î\Ô!©\Ó{Hª\Â;\ÈS\"\â4ˆ³\á—\0µAöN\Ú\àDr¸J137b‘U+` RŸª\×lÔ©…¼“jj3—þ…-Y¡³·\íT ­\ÊñIš·bDp\íXmL‚r\"§·¹ñ±®b¯‘K\Í\Í0Ì±\â•\Ìf\ÊXñi\'\×o¶Û³5õŠ‘U`hö\å^	¸´U·59+M’$|„ŽE\Æ\Æ\îS\Õ/]Ÿ¿\Ëu\îIc§I¾;H\à2\Éqp\Ñn¿‚ú™cB…\no\r\à\×\ÏA\Å\Ç5(b†(P\èyþK\È\é\ï\×==Ñ£@ò+M¸i\á×£)¨\éË”G\ÂÞµN®õ\Ú#N	ý†¤ñ¢\×3)\æ\Ù7.\î\ÔPœ¡\å†	\\\æ$smF\Z\"\ÔSz\Ç\Z\Ôhv©¡MÚ¬\Üvx\íQº\Ý\ÅM:–Y°—KjW\ê\ëu3mý¶%¬Yˆî¤¤eVøÍ¤]Ú·µy`¶\Õ$n\êÐ˜\éš4[\éB\ÕÓ±«¼\Ó\Ô\'m*n\îŒ\Ú\ÜoÝŒ\ïF¨ûh‘ÿ\0ô\Ïq\å·\Í5¶oc*–,v©l‰0´\à\ÓqR€Dª¡[†žMµýfc²÷ý}±¦[¤\Óm\Äf@qÇ‹…/M\'õÜ¹2Š5\ç¡\Å{¯g\ë^8\ê9¬t#\'ƒG§\á\ã®8¯B¹¡\ãªV‘6\Çù\ZºLJCZ«%\ÜUr”\Ðv¬#‡|Ý²«{.\éw•¥\äKþm\Ù\å^\íGœ±\Ü\ÈÊ¢Ü©%AP û–0Ý¸ƒ­@™p>¤b•·<¾IR\ÍQq\\\Ê{\×pfLÓ…©æ™ŸQ\Ìu$ý\æ²Á·=I\Â\Ý\r§ºª\ïcX\Þ\ÇZ}\Ü[?0UÎ¯,¡\ïö ¼Yjyv-ýÊ¼SHž`N~±\É¿	cq J\ÎV@%¢”…\ßK–¦»”˜Aþ©\Â\âJc\Éj8©\Å5HÄ—ÿ\0\ãwöb~\ß¿Ode·\Ò\áD\Ø\Ëñw=\ÂöT–z÷\èš\Ï¼\Ós\\c\ßOtFk\ßA“[GN:qC\Ån\â¼Ð®z8\é\ìU´½›q{‰¦œ‚Ï‹·\Å\\GW®Ý°£¸U\ë“&õ\Æ6Ô¾-\nš„\åx\Ý\r7ˆ\0„\"G3¬h¢ÁV\Ìw420‘I\Øj¡Úˆª[·QGS2“¼˜|+\Ë3 –\èl’C—uTÕ¥-u\î[\ÌT%\Ø§F,\r\\0ò€,\ï{ua¨\î\Ý,”nr3u%\ÈJ¹¾\ÝÝ\Ó\Ü\çs-Š·4ŒB¼‚­¦1½¼Ø¤Ÿ´\ít€‰Þ’\åT™C°º5MÑ½÷1\ÍH™.	£\Ü\é\É5(\Í.AœaÛ…˜\Ó\Zø\æ\Óù‡\í¹w\Ó\'\ÒF\Ý}x\ßTŽEgŽœ\×9\Íy¬\Ö9¬ñ\Ó=qš\Åsš1\Ó\n9¬8«§\ï[i\Ó\\·m—Ÿp’D«“¹l¤’ýª\å8û\æC†´?xþ·l[“ªµi\Z3Šˆn¡\êŽ.\Ú\í\áS‘6cŽ>c]¸\'5¸V\á~|…$º;§”šß‡5qº4×¥r}ÿ\0%–žûhmf)­\ÛIOtWž\ã%Xj;\×Q\rý\Õ5%÷\Ù\ï°n\ï·\é®ükGP‚­®7›!§³ûK7Z,Â–\à­EpÁQ£(’\à	¬œƒ#\È\æ¤<6	ÊŠ“\ëN©¾¢\à³söw<x¯\"¡g1–\Ã;Q\Èp‘Œ²â±Ž q\à­ŠE\Æ:{ô3Š\à\Ö+\Ð\è\Ô9þ¡¯K\ã×Šð=V)\Å1&\ßGœ4wM…{£OqŠK­\ÂLSo\Ê]ý¢N{¬*C…·_\íˆn2=I±pw´[qQf·l1l`h\å>µ‚Œ…O\æ>\Z\êF2¶Ê¸¼-R\\	uµQ®™kZBÁ$1Ÿ\É\Ê\êwr•ž\Â\â\æž\Îò\n·Öµk6·ùGtGy‹\ì*\ÊýŠ® C\êü\ìTÚˆ\Å\î«o\0½ùŒ\ÍWz¶³sV¨\Ê\Ú<÷Š°^¶Ö¸­$ž¡ˆµ,x3\ãp•U»©Ip¤eM,\ÏFR|Ïº›\î\\\â¤Êÿ\0o±™8©>\Ó\én\è\Â\\h­²\è-h:\n¿‘c·…\ÍF2=üùÀ h\ZÀ\é\ïœtÿ\0œr:\Z|hu”`:œ\á|¬ª±š·‘mn\ÎÖ¶¼	{\æjK¥&{¾m.D±\ê_ÿ\01A\Ïb[‚\Ò\Ûpû\ÓmWj§Aƒ*Ò±¬š0q’#ú×·ð•¸Šy\n•œ3Iƒ$qU¸\Í¬dRF«i\Ü]V\Ò[fŠ\ëu;G¾hdZLl·º\'ö¦C%¬\Ða\à–\Þ\ã®˜\Ê-Fð\Å·—w.usIñ†5\Ä\Û6ú´\Ð*ROµû\Ói›x 2mÉ©‹ƒ\Úe|É–…\Â=[\Ê\r4™®ø\Ü\ÉÃ°a&Ö©0¿œ\"®[-+Uø\Û$¤	\ì.lc›•¸@e­R`\É\Ü~:†¼\ÐðsB‡•\æ³\Óß’E+\Ðþ¢:\Z4<z÷\èx\Ç½ø®:\ÍF\íF\Ó5¥\ê+¾óNŽH®ô\íû0Œ_DñÖ‡xLº\Êž>>Œ2ab^\Ú\\Gk€9Z\îW52\n\0’¨\n\Ê\ÔA¥©qJÌ´‡4i\îeßõ‘S\\Æ‚K‚j\Þ&’„d\'m#.^\âß¸5--n+X\Ð&R\Ñ]\Âö×ŽŽ³÷(@%ItñGO5u¦±­2\à¬lA¢È´X\ÍV6‹µ-‘©lQQ\Z\Ô\Í¬\ÂG1i—rV™¤v\Z\ÝûMƒ1¾hºmœ4”s=\Ð!Q˜e‘U\'9Wb0YB\æ¶\Ñ\É¤ÿ\0›\Ë\Õ\Ë5He\ïÿ\0W\Ü.\áµa§\Å¤\Ú\éûªx’\Ú+‹\Èç¹·\Ã(\àzö9\è\Õ\ék\ÕdPó\æ³Y\ä\ÖI §Ž‚½\ãøb²hx¯\rx xU&‹²K\Z÷b\Ô,\ä«}U\Ô²\Õâ·ñ¨‹\Ú\ßj\Ø{]\ÛJ`Ç“”p¦\Þ0V1÷e\Ý@bÀ)¨ÚPD‘­&0\ÊA/\è[\Æv\ÍÀ¦ºsY\0¤ º:„B*Uû‚.&Œ0–\ÈH$\Ð\á”\Ýüz\ZýžX­¬\ËS[·‘d^X6E»\Ðf\Z<ocö³€b\Ò\ÍPM g\ìrl;Œ,\"Œ\Ão\Zô¨@`N»`5\' R’mU\Þ*f’4d5öJE­\ák¹º™…d½Hƒ‰ª|Ó·\Öõ~\Ë\Ì\ÚfÃ¥Ø«iQcù°Ò‹{O\ë´\\.+\×=4|ú\ÇQSŠñ\\W®ƒƒ\â¸šõY\èhŽEsX\È<tQCŠsŠõG¢Ô¿Sm0§\íÈ·±p\æ+¨\r^@\Ø\Ôm\nWs¿¡\'\ÙcSDm¿\æÚ°¸\0V‚zŒ\ä\Æô\ê\ÜT¦X­\\\Ä;©#\ì\ï;Çº\âARß¢\ÔW\ÆJ0\n\â£Rký¿b	ŽH\Î\nýn[b\É<Q–+¾U-w¦–m,0“DŒ°\Ðby#Ò£Ž£´\Ú\ÉÚŠ5T)÷ÁXØ•Ì†:TjŠm(\ÚÊ¹lbZ¯\"x(O´ÁsUW·\Ì+Ga\ÍØ¢Ë‰\n%H\îC³2\Íþ\Û\"®q\ÚLºAIô«ª—úŒ‚8\"v£©C¼ôöh\nó\Ó\Í/49¬\×5šU–=’E\nóGÈ¬ôòiO\ä×¾›j@Es´\ÛK‘y\Z:\Ù$\Ö\Â9UžK\çŠ÷G\á’Æ²QŠBV#† ¡V\Ñþ\êA£ö£¡3J¦¢lÒ·\Ôp;ø1\Ë\Æ\ì\Ñ\ÚkÀkÝ•4\ê\âYF½;i¶m`\áF¸BHY˜2‡.7tHfp\Ò]exf^\ïp%ýÙ£k°\0üaG4l#º\Å\ä\Ä\"\Ã,p\ì‘?­S¶²ý h\ë\Í#+6\Öfrn$\É\ÔH\r\ÑÍ¼\èÔ¥”	\â#\ÍL\æ·m/±–a$­G,òºðrµ¢\r\Ú-\ÑÚ­\Í <\"†™EŽ†ˆæšnhù#œÐ¯5Žƒ\È\Ã\Í<t9\Åy\é\Æ(f‰\Íx¡X¢:®OnH%\0¬¢EN\ÙÒ­fÁºœ…ž.ñ(£\Æ#?\×&v~ae4eN0al\åYE Áqƒ’Q¹q´ò\ÓI•ž\éR¡Žk·†\Þ(*\r¥e\Ê+Hiß&]Ÿy@•\Å3\ìa´\Ó\Â&tPª¹’8	£\0q4.Š–ø¦-Ô‘F«h\êxcŠ+m\Ï$?v(œF¬ü\Ä{…,¹eV“!\n&LIq”¾Ó»f\Î\áûvó¢B[*+°³€Y¤–E2\Èw5\Æú»û8f#Af\Z\îZš6\ËË‡µL/CK\ãôñ\ÐW¿ú>f±\\P¡À<u00+Š÷\ë×¯\ï\Å{\rp+Š\ç­\Ü{’&û@Ôœ\Ò/	Dj@-,[ªó(\èG\ã(dZµ\\H²}·ýcVjˆÀž\æ\n–ÀûÓžU\Ö\à+¿“+¾\'­,d¼x á‰¶=¸¥Ëª¶$.7\ï\ÅCÿ\0\Í$I[xþ\Ä*FøpGH˜Tk+4Ñš\ì\ÉOÚŒm$²Ä¦ ·fic \ÅnÛž(b;\ÅR3~\ë ’¦\n*Hk~j\Ë ›)œ\ZS¾§\â\0™iô\ìÕ¿ˆ\Û\êŽ\Ø\Þp_,v\ïvj•¸v$Ä«I±¸ÿ\0­\nÿ\0C3a*[%vU<P\ä×Ž™¬ôñX¡\ç<ô=\n\çy¬s\Ó<ŽGOg\ïýWŠ\æ±\×4\ë¼4\'¶\Å\Å!³\Åù\Ü\ã\nn™À\r\Z‘¹U\ÊZ²Å—Fq÷]\ê‘1±#\'-\Èe#k…&WaO0Agmùmöñ,	\ØT&8§\ØÑ•ÜŽp\ëõˆ.#¸¦ TdYAÊ¯ö\ÊR£#[ 5&8\ÛE1\'bž4H¨@d§Œ¦Ø™\'mòwt\Èy>Õ³\rq1Šƒ®\ïS$†iwT—BÉ¶W\Ü\"P\Ô\ì¤È†&Cš]¦Ž)z•ËµNÀÑŠ\í\Û›·KÁs°|v%“IUsöbv\× ôZ\0Ž‚‡C\\WŠ\Ç\×\ë’8ò1\Ó§qŸ\ã\ç ñ\î\\s\ì`t\Årk\Ý\\G”¶b\Z\à1\Úò\íT{\Üa*\æ2\×0\Æ2¸\Üw*\Û6e‡\Æ0\êUœ‚ÿ\0R\Õ©h˜5mÀ†\np•+\äü‰aˆ-aÚ“³\Zgº%\Û!\ÜmÀT`#­p²º¢Ú¡¢}\ír‚#<p‰eòX­F!_\ê\ÒAÀVED”T\ÃrVy­\n¡‹“’§\"3‹…Ï©\'¸Ò³”^\á\í\â/\ÈX\"Y;°\ÅzØ+*\Ì\È\Îx¤X\ÞF‹N†)&û¶\Þ\åv\ËñW[Aœý\î «.Œ\Ó8u8Vlÿ\0\\g\Ý5y¬\Ñ\éž\ZŽ(b¼×šïœ\ã\Æs\\ƒB±GŠ4\r\rq\Ó\ë\×C\âE\í43}‘¸Œ¥W\ë~iØ´ñÿ\0 ù™‹\Z‰?³ü½\ë)ö.i¸®L<\Ôh\Z\Ò9\æ.çµ…£B˜\ÍlGsL„w•©JŠ€\"‡¸È’­#€_\ìb9¤#k\Êõ\Û2L\ÇoýbF™)\'V \Ñ:	\â½p_m4Ñ±–M\Åð´³fC†r\ØœP¶vq G–=ƒd­&ø\Ìal’\åX«\Ô\Ø9«Z®\åµ**DUÂœO¼T`\èi¾òO‘}„‰Îˆ6é·¶±\îy6+\Ê*7\Þ+\Ðã§š<VxJA£\çŠ5’M\nð1\Ó\Íqü\ržýWž„P\é\Íz\éš<Wš÷Dn\nÁ\\H6B\ÊK…½bRY¸³(pfbZ(F+žŠ\Û\ÑÓŽ\n\Úo5h6\ÔKÌœ%\Ë}a‡tñ\Æ\ÇlC\ì\Ô\×\â{®&¸\É¶?#A&VK—¨\î2‰:\ïüŽc f©‘wFu\Ý\n–Ó†a1\0‹Eba(]€M\ì\Ë\Ûñ\æFEVhG­ŠŒ¡\å;£FIKû\í2©ü\Ù\Ú\à£n\í\ÛuF»w\ã9lµH\ÌQm¥ˆ<s\Ûóq\r\Ê\Z³1ŽJ1v\ê\ïÁ8¹M$*[\Ï 2\\}^\á‹RF#Q\ÕEz>8£Àu5\ÎV³\Ó¹¯4CB½ø\èz\nöÏ¯f¿\äÒŠñ\Ð\Ñ\é\ï$\Z¸‹¼-\ïò\É6(Î¬·S\\½¿Ì„\ì`”n\ÙPÍ”\ã/µ„*A8Ä…’H\éf[r¹•\Ôñem\íÀ”3\Ë\Í\Äù;\ÓJ\Û$’­¤Œ¼c–Cð*&\n\ëu“óC©†®D)õvzMfŽ°\ÄBRtž$±ù\âúôL°k\nõ.±e>»V\×3S\ê\âmT‡‹QÃ¾³c\Ôû\ïùJ*i‰­\ÇÁÌ¦¥‘¡’KÂŽ.\Ék;•\îI#-B$dbÝŠ½´akf]‘½V©\î@«©œÕ\Ò\Ücºû‹®+¹ô&[9WcÜ‘5\å\Ï\Ú\Î\í\ìx§¡\â½×‘šð1ž€W¬bb4{4µ\ä‘\Î8®h\ämMG\Ës^†y9\ÇLš\âœqsk\ë½·	‰Ë‰\ì&üEb\ÃÜ¹Ì­´\Â\á\àF~¸‰¢höAËˆ0d³v«@\ÍR)\Û$8KH›¶‹µždjš6©¥}ßš{—µ\Ù+/l=\È\íþpJ›VX\ê]l;\\\ê“oMfC_ºusBþ\ão\ïhj\Î\Ê5\Ï\î/Qk÷-Sk³	µs0]Np?q¹5û‹µ%\Ôl?>B\îi¯6, `\\F+ª\ÃS\Ý!Q9«†B.\çš%-Zd¨3\Z m£\ì“C5‘\ä\ì\â1\Õ\ÔqÛ¸¸Œ\Òl¶«X¿µ§5yRË¶{U1_Gz=\Û\Èö\Öˆ®z\n÷\ï9¬ó\Ðq\Ôñ\Ðy=ù#šZõæ€£\æ¼tæ¸¡F±X®z×ž‚ŸU\ï\Í^k\Í2Š)X\â\î2ö‹\ãü\Ì1\Ë\Í@6>K¼RWÔ¡•Š¨öÕ¹\íU›\îtÁ$®Ò\Zq0PÓ®\ä\ÔE\ZŒ÷0¯ï‚¢ù¢*üªØ«üª%ù:4Ÿ½K3E¨º´\"\ïP¥ø\íÿ\0n]*e:\'\Ã%˜„[m{B{ý#\â—Z„\Ëúw2Ö¡ús¬Y4ŸÕ¢z]\Ò\Ím¡^=iÿ\0”´Ÿ§«jº\ß\Ä\rª­¼™µø\Ô\â\ã\á\×V¦.t\ëùRÔ—V´º†úmUá¡¯8/¬3G>®Vq	\ëM¶’J†4¡:…\Ü]>¨lcH\ãnŽøö\êø¾f!š\Õp» \0\ÇWmý7YZ\Ú\Zk\Z\îkm\æ+h-‰4M{Ž8k\Ým8\Åz¡\ã\Í{\Å\nq\Ó\Í3\Ðô\Ú1Š=3BGÀ¡^+Ñ¡Y¡C¡£\ä\×“^z6Zˆ\í\Éÿ\0fA‰7‡ˆ‘4gdŠ£½öW@Hÿ\0@\0\r³okB\æ[C‘ «\Õ\ã\"Bð¥0d]:§¤[þ>¯ð\ãvš§\Åõ+Z˜I–òž\á°iaÒ¬–Xn4‰~i\ëŸC@¶k\Í&\Ê5D²\îW\Ét˜®£øÞŒ‘[%Œt\ÑB\Ð\Üi¨Eÿ\0\ÇÄº\íÆ¡T·\Ò\Õf¹™µ+\æ\ZO\Ç\â‹VÓ´D†+û(\ÚO‘üeõ-I~ia_0\ÐR\r>=rºü\×6—‚iœÁ\Ü\çIøµý\Å|s\â­GW¨\Ò8\Z\ßN†ÚŒ¶?\Ùmjµ$j*\á“T`jFt›~ä“¨­û…\ïÿ\0¬ª\í\Â|~\"1š&³\Ô\Zöhô8\ÇC@\ÖhsB‡C\Å`\Ö:{¯T:óCüŸ tõŽ™é‘Ÿ~¼WŠ\ç¡ÿ\0\\\ì\Z\æŽM](†õ\Ö1W<4ŽN\îY¹%T»\îj•r’\îJmJ³\ÆFH¿]\ëm&\ÇMµ$9$È²\Ýj-’Num\ÞA¬ü\Új…¥¥À†\Ñ-tHŒlmDüUÅ¦¡\Ê\âBš|ƒn—øwZ\åŠHšd]¨	EŒ0¦\Új\åUþ_ÿ\0R\Ó5}¨-ý¦¸V\Æ)\ä\Ün\Ø	\àh…|§d±%”W\É4ù¯5\Í?\ãm\âÈ§K\Ò-£€Ck\Z¬BD†×‘Ñµ½³\ìÓ­#Š1mo©]mdZ¸nì³¹-¥vÑ· @*ù÷¥\Ñ\ÜX„­{v[«\Ï^+\Ðã§¬\×3\Î(žEƒ d\Ññš†¡š\ãøg®xo5š\ÝB±\Ôñ\Ó\ßýdV\rz`WŸ\á\èy\×Sµwp)&§?hÁ\î\Ä78™¤Aýµ³1\ß\î¡edÜg/6’\n·ž7’\ê1*Cm,7Gv\Ò\à+\Ô\ê+\î¬A5s\nJ.t•\ÌöŽ\ÓX•i ‹m9ln\í>GÛŽ\ë\åO,:G\Èl\åŠ-nÁ+Tù6•½œ”\íº»´niW\ÈR_\ëI\é®S77(\Õe­X^kÌ‹WWkk?1†\×U_[öõýnK\ÊY5\Øi9ŸM\Ò¬­V\ÙW\Ìv\ï1KCd@«÷H\ã\Ã\Ù\Ç\Å\Í\Â šA5jLÈ“Ê€\Û 2ˆÿ\0\ÐË¾<7n\é·Fÿ\0y.Už ‹µ+5\î€®z+ü\ÐÉ¯Tžhý¨òk\ÍCŠ\â—\Åy@õ ôqŠÆ”ô÷\î¼t\Í\Zq\É<g3\Ðc _!…?X\n!M\\m4€¬±°\Ý‹¹[lˆAŽ|J´¯\Z‚º~\Ä\äUwo\îø™bb¹!–ŠóÙ§]†M’¥Îœ³	-~\Â\rô,Úš\Ë`»°6\Ööö›CÀ\Æ;h\ØÕ¶¹ª\Â\å:\Í\ä_\'r\ß0\×mV\Ï\äÿ\0&:\×þm|¾wr´ÿ\00½’§ù«5jN÷—¹¸{™À±\Ù_‡#Q³4m‚5µ¨’­m\ÌTw#¦ž¸YœTªiŠ¤f¡™±q1+5\Û \Ô.7™¹V®j\ê6q#«‚v\ÜËˆ\Óÿ\0´Hf»L•¡\\c§xk\Ù\æ˜¢x£B‡\0¦ó‚hy\â…z¬óF³\Æhm¬ô\"±üs\Éâš±\Ó\Íz\ÉÈ¯B°µu\nOj\rn\"!SqókýMo\æµ˜3T±ýmC!¶¸û\Û7pD0Ya’F\ßW^òÿ\0¼½m\í 1N©[~\×M\Í\ïØ¦•”PòK‰£´6Ú´Šöˆ¯\ÅŽ\ê\êEZ\Ø\Æ\Íûr«]YD´’#Z—iIZ§B¡b.]lð_‹ŠŒ¨µm\\\Û+¬(\"H\Ô\ÓFù¾´8¸¡nš6ŽöMôAÍ’\ÑÑ±Û„©«­\Ê#\äh‰Ý½ô3‘^z5\Zô(ôŽh\×ù\É\ÏB:û8 @&‰9¥¬ô\Æz\ZŠæ‰¯käžƒšóB³Y¢OLdy¯4+×šs\ÇÚµHQ\Üj2h³\"Û»\ZR»9Yc‘Z`$Š¦ŽŠ\Ò9«\ÆJ‚U¤þ\ÅU\Òo¡ G•ñA…³¸»yqMo¾¦·\ÙFX\ãdf\Ø	ŽÙ²¶ì®¶ò²Z[Ç¶8“pŠ=’B†Y,¥z¶±\ì¬\Ãt_Œò¯\àˆbSµ\Ö™\á8<Iq+¼‹\ÃöóB,VB•l\Ô\0 ‰f C99«\"Ö£qµ\\¡x\íòùÊ¿p\Ö-÷ñÈ‰¾°üv\0–\ät\Î(W¿5\æ³Ñ…×‚|ó\\Wš#$š?\Õ>H\äû\Ç<¸¬Q¯4<xh×Ž™\è(u\Åc¦N<tç¨¯5ò(?¨p\éþr™‰\Ïv&¥–X¢ÿ\00K\Å4hZh\ÊQ›y\n5³\îH\äú‡b}¥Q™\ZBŒ\ÊÕ”\Òn¯Eöˆ\Ê\ZuR¬‡\Ô7E™¶Û¿\Ö=Q\åQ§Š·Fðn\ÓÀ…¬„\Ø\"c0\ÉF\ÝJ\ÉðªS‡b¨ªvn­ª ¿Ò°ùµB\Ò0+M+¿a\ÍF¨ô¢¥‘jk\ÇPŸu}Ö­{˜C\ÆT…©\'*×’\î7rs\Ý%­\"ð\Z÷\\Q\Æ+À¡F— ó\Ô\Z$‹\ÏA\×\Åx\èk\ÇS\Ås^³\àŠ\"¸=Esy9ôzcŸf³\Í5ëšº.m\è˜H\à\Z%\Z­§\"HJU©aVóö\Üö¢3®úu\ÃC.ú³‘\Ø@ø6V9N\ZFm\Ð\Èø\Ï\"‚¬\Zœ„¦Œ¤fDu4+³ˆA\"ŠŠQM*\ãq*‰*T\Ú %+É·\'9Žð‡{…\"\æ|´÷8Mæ»ƒ3JµÔ‰º¶\Ð(\Ü\Òb²wc)mp\rB¬i\Ýs;ý\ïnW\Ü-ZÁTf•$‘Àí‹©Ì‘\ß7,Ù“G\'¾\ëâ¥\ç ž¢€ú\Öz\"‰£\Õx¡\\\×ú¬\æ\n5\ë4\Z‡úõ\ÔycDô4y\ë\Í\Z-G¡ÂŸB·Vy¡_\"³\ì\Ý.C™#\æ¡\0„s²5™i	4°÷&\áq‚QŽ,¦9´¸\nL­ºy*\"q1¤$v\ØAttWlX$\É\Ö}ª±;K\\Wwÿ\0Yc$B„…i\î>‹u*¤³\nš\é\\~S©Jb7O¼‰d©+6\éyðw‘[¥c\"& û¡i!À\\GŒ\Ôlˆ°É˜\âŽ(hýZ\á\Â\Å=\Ë:]JXÆ½\Ñ\Ø\Çoö2*\Í$kW\Í\ß\ÙÜ…¯B6tŽ‹\ÔG\æ\àV8¡C óC ¯­ƒš&”W®h\Z_\áœW¡€8\Íy®\rhW¼s\ëE\Z\'“^¼~:)ª\Ùþ}ŽvÐ‘[¾*\Öj´%G.*)AXrkj\íº„¸,\ËPý\ë¸\Ï¬*©c@6\Çm´§zù¡\ÜH\ØÉ“-\ÄBF\Û\ÙqºVüVd%’+uÀú5q-0þÀÒ¬‰ºJ@|\åKû \\’\á\ÌU,\Òl{f,ñ\Èkµ)¡Ù£\Û_\ì(h\êYv¿qŠ\"	7-a¥\ÃÔ³e®gþ\Ù\ß&\ÑBº.Z=\ä\Ä\èj\ç\Í\Ô\çHHÌ²\Éaoø\ÖÇ =i(WüóY\èO-\äñ@\Ñ4M\Z\Ç\0W4\rsG9\Ï@9^H W®:b³\ÐñF\ãøW\á\ÏOø¦£C\É4<c4\rgm|‚\Ä\ÙÜ¬•óô2\ÄT›d™)P\ÊÁRE(\ÑdK\Ö\íUœÑš´\ä.\äH¦Á¹h\æb\ÓEQÿ\0ô’FZŽJ\ï¦ÌŽT\ÈI\æ(TFd8§\à4rF‘%\Ã*«H©º5Nñ\\-/\äL\Î\ÝÇ•³.û˜­\ì¸hSsöö\ä\Ø\Ä\è‹\'t¶¤\Ý#\í\â5\Úa\Ë\Òãµ–wšUŒ\Ü\Þ*¬¬ÀD¨\Ímo´vµ&Ž#Ye«\É74’\nøõ¯~ôpU48¡þA\è1Šœ\ç\Õx¯uš\ÎN)@\èO òk=|×Žžzx5\èžI\è+\É<\ÖI¢E5s^i¨‘Jy¯8#mkVßŸhc•\0f\ß\Õ\Ê(J³Ÿ+	LG\'\ÛúÚ¦UjŸ¸•­E)\Ä1Q¾:…7S\ÄD¯\æû+F\ïõ ÝœQ\04YD{‰m‚;qpy\ãº\ì\ÅVÝ˜HÍ¹™7\Å\Ý\ÝrZH{†IcVˆ3\"•£\ßc‰$H¢…D\ÒÅ˜\ä\ß&¨±8ˆ3\Ð;kn\êi\Å]e82º\æ\Ý¨÷öÁ\Í<¢A;°S­K6\àš´«1egœQ==ø®(\Ð\èµ\ìô£G¸Ï¢p	\èsœP<{\ÅÁ¡\äù\Íz¬V:\Z\Ç«\Ö+\Ýz :4I¯ú\èkþ}ôð(R±©#W€E{\"aÕ°3¸‘³«\Å8\Ëð„»Wg\êËº¡RŒ“²´7;G–•v+M4‘Ýº,´b*\ËnÝ‰\"æ»ŠP\ä\Ô\å]m\ÝVûwwcZ¦4\Ïpv\Þ2\êùq$0ö€Û¬K•\Û\Z\Æj=´T%vpk¹dCF.\Ývþ¨ØŠ\0X\ËV6\ÅC÷$\nyw=\Þ÷7¯@n0G\Û/6\ÕwØ¬\Z:¸™^¯$,\Õñ\Ý=\ç¹j“É¬\àô\Ç¨G\Î75\n#äž\Ó#§¡^)E:qœÐ¯C\ÏLVzfCB³C‡€8®i³ž\r{ó\×\Þz\noó¬Û•¹– \Ô\ì`xdL)V0$ˆ«T2\ÌyY—_¼\ÊG`£¿‘»\ÕE\\¨ÿ\0¶5m\Åsµ\Ë-F2@\áBµ2v\ê]¢”`¨\í\×9@j^÷{·µ$\×f\ël)l¼‚G–‚nŸ·™YdUÜˆco©s¸ý«?T‹m÷\Äqÿ\0´…\æÛ…¸9{\0íšžA˜>\Õ\0T¦,\Ò\Ëý‹$Ø©œ±žP\ík\\O¦Ù¥¬&{¯G ¯1Ÿ4|u(\î¯#Œ\Ñ3šõâ³â–˜ž¾½tñB…sJOB03\Æy\è¤×šM75\åMz¯#’hP=5øÚ¦jx\ÉX¥e’)A\0Y\\ö\Â8QW†HT»Û¦0\Ô«ZM²r>\Ò*º$P©Ž\ãz„ŽAPªøjŒd¤…LÒ„¨e\ÊvÜÁS„D\ÂG\"OJ[h¶\Í: M©¤ \ÐX\é›q¬•µ‘Ê²Œ–JV2R\Æ6Ï¹Ÿ¯\Í6Q¦‘I\Ç3\0•/qŒ„„±RLnòmIŠ¼—(øF\Ð\ì\Z5\Æ(ôÁ¡X\èhšö?¯=\Ç\\Q5\Íf¹É£Y¡Ž¸¹\ès\\\Ð\äf…\n÷@\ã¦+&½sCžƒ\Ës^\Ñ4¯\Õf–µ\Ä&\ÖDÜ‡\ê\×1®-e`!¸©B\á\Ð\Ù8‘\nÿ\0bHÄ­\Ó\Ç,x\ï<‡zÌ­Q2Õ¶,e\î•yeWp\çF¹ŽLWuB«\ä0-\Z‹y’H;A(›L\ÒÉ„DF\ÈkbCFª\ìÒŒ\ïò*\Év½¸\'F\Û(·-%-¸2\Ç\0PK±\Ø\êÁÝ‹’ª¯–ž«“ö˜ŒoÉ‰#ˆ¬›‹0\Äób¯mK(A¡\Ùþ\áw\Z*z\ËsM\äVi€<5\n4:y¡À¯uÿ\0^ŽO5žxÇž‡\íOX\Ïðç§¾œt\ç?óæ¼œt÷\Å`\Ö:y¯òH\äVM5cžhÐ¢y\Ý@Ö¥–\Çþ.“\"5HŠ$‰‹5½\ÎY&jÓ¦u™¾Ä²\Ð+5]e/\Ö8\ËI\ïQqBE&,`N\ìŠi\'&B¸8Ë«(\Í!/Eq$\Ó\Ä2¡E–Wnr¬Di\Ûzx¢Tf}²(\í*eq2\ï¸^\Ò3É„I?\èÙ¶$icX¢š¤”\\I#c­)\\\Ý\Ê\"A4’\Ô\î\å\n±?lÿ\0š–C»¸½\ÝÀU‹ÿ\0nOŒÛŽù£\âh\àš\ë\ÍõŒô\ç4:}k8\é\à×ž‡¯\à€M\Z+×®k\"–F½Ñ¡À¯\'9\ê+Á\'‘^\Û\Ç½Q\äœ\ç\ÍŠ\àVzL¡Ñ™w8ˆ\ÓÇƒƒX\Úc”\Ä\Ð\\6È®%I\"»Ž\Þ\ê‰\ÊI3	c&Žø\ê)U9wM¹Sm·vjFýB\âˆG†0¹\î˜\ä\rÉ˜l‡i\'Rr\Ò0\"†\å©˜Â†‚W¿³¼´IÝ…X\çO\ëv\"2E²>Fe«7V«’Õ¹\Ë±$“,µ;v\Ïtn•T\Ë..f\Í]\Üq$ñ;­ô°Uø\×1š4Ù£Á\"‰\ç¡Á\ÇO~+\ÕWƒ\ïš\Ï<\ìX®s\ÏSB³Á k\Íz\Å)GF¬×Š÷G¦\ÞA^+Ù¯x£\ÓÀn§|óG 4¢¯S…¶³\íÁ\rW;…\ïŽ~\Ý5is²+[¿¥\ÌÁ’\'û\\lTw&¡•¶¡;\áÿ\0.	(c†!<¥J³R\"\î–C3\Ðb#ßš·ˆIHK\ÔJ²4ÁLVö\Å\è\Ú\æ€\ÌLlŠÁfp!_eÜ«\Z¦Œ\Â\ÞÙ\Ö]û\"šM\Î\á\"ŽS#JÈƒûfiBC\Å8úLTU\Ý\Î\á\î˜\îr\Òa%ºUY.K=\Ô\í+\ÛÚ¤T\ä\Zø\ÚcOcG§üõûRŠ \Ó\n&‡=4|09\Ï5\àô\'¦~\Þk5ÿ\09\é\ÅdŠ\ÍsX¡\àÿ\0\Ð×Ÿ\à:\ZW²z7‚hš\'=1G	®hyZ\Ô\×\Z‰\ÛF:e\ÛN¯µ\ÐÓ—Å´ŸkI\rE!#¸¢™\ãwÈ¯´\ÔrVó&\È.\é<*\É$J;hŠ\äF\r24…¶•\í»©\ÂKˆ´­¯\Üm²\Äi_^\ÜNC’\âHKO5¤HÒ‰\×Q®Ò³¤“½\Äñ\Çq¹)\ÅL;¥ nô94]*ì—¥g…d™;72÷ó<A!*{¡S>ç¾¹\Ø\ÐÁ\ÙDV-\"Z*v´Ìƒ\Ðøñ\\ŽŒ€x\É –\Î8¡\Íhš\Í=üš\Æh×¡þzóCøx¯5šæ—“B\È\É5\Å75Ž¢¸À¡\È\ä3`°§\áLý³DW\Ífµa¶ñ‚•û(f˜T\Ê\Z¤H\ÉR—.‹È¨d=\Â\Í\â\âGP^R\Z;€µmr\Û7®\è¯‚9Z\'w‘f\î#ˆÀ\í<ª‡s5m=•‰\Ã.#euD€¶\ça€û´½¸­¤\0\Ü\Êd\ÆGY¬\àM\0Ž/\ÇaYo	5r6È–\à-\ÂFŒ\\€%F]ÿ\0k‰Gzè€—÷,‹mspV\Û+SOS\Èù¹º\Ë\ÚZ÷\îÝ¾¨{j#\nÐ¯n\Zó\ÓØ¬× q\Ó\ÍcŽ‡8£^+œ(ñ\\P¯=š¡C5šzu4Æ\à\Ó\Ö(ðJ\Ñ\â²rk\Ý?òsDòF)óGÃš$P¦?m\ÄY+YSŒP^\å}J\Ë-2¨§\'j Á‰Á·o²6ÚŠ_«f‹+<\èÀ\æ\ÖR§¾Æ »\Ú\ÂBhNHK—\Ý\ÍÇŠ\Üe“¾ò<±Ð`„£0h\ÖbŠc¨\îa”\ÄD\ÓK<)~\âC\ZÅµ£¼t$Wµ\ÚG\ÖYñ5[\ÜI¹˜\\Ay„‘\Æ\Ù)y\ç0‹«¼¹¾ð27k¹¼I)®Z5k¹¡‰c]«”Gd\Ýg¨4+ž‹žž\èr=š<ô\Å{\Íz9¯=3Õ“Jx9¯]}t\ÝKGŽœ\ÓP\æ\ï£Vxó\Ð\n÷\\€¾O4\Ù\Ë\ÑcX¬\à’(œQ\ÆhuUÍ¾\Õ\í•(ˆ^7*ñ¸gn\æ§Ý›{ŠŠAŽüxwÁ\rº‹Œ¥À\Ì \Ço\Úd‰&c\rµÒ±¾ó\ç0’È²Ž\ä\n€›‚’4ŠYT‚d\Å\Ò1eI\â4ómcp%¨\î¶SË½\å•¤G«Ë•†1¨\íkYP\×`F®-£ˆÌ«,Ï¸=\îú\é\â[»§\Æ\í\Â·\Ý\\\Ã\Ûöcy\Ú\á\ì\í\Ö*H’žV\ÏÚ´¤V¯|õgÁ=ú¦È¡\Å™\àø5ìž§\ÏkÀ\"—$Ñ¯õC\ÇC\ÍCqX\Ç42(ø¡\Ðùj\Ý[°rk4<\àRø¦ðÕŠjn)ik\ÍO¿w\ßkr‡jc©ˆ\íf\âh§…’Œ›¡\nE&Ewp\Í(#%\0`\Ô?­¿!•\í.’\ÖAI\'n’n\Õw†\È\ï\ä\íe|Žómü \ên¬Ê’\Ãß’:ŠüMR\\,Žo$\î,\ÒHb7\Å\"MBX’mcq‹P‘\Äó+Á\Êù{—\×Ja¸&\à\ÎNû»¥kK»Ô«­W*$}\Ðo\îµ\Ë\Ôó#SqVÖ­PÛ´ =\×m• FZ\ì\ÐñC5\æŠÀ¯I\Ñy¯4\Õ\ÏA\ÅSW¿5Ž‚¼\Ök\Z R×ŽƒnOOT9£@ñš\Ý×š\\W\0{÷Ñ¸8¬g§Em­µ\Î[Ä›k¬×¡[¸\Î*\å‡g±\íQ*¾\çd\íÎ¬µ4nkŠ\Ú\ìUFUš“5µ”\ÌôNJÊ‰2MÜ’ $Ž¼w*J\Ë\ZÀ³+(™\Õ\í\æ\î\Ò\Ë\"¹\ÌR¨]^+‰q]’\â`û\ãI·¤’W\çÂ”nZzÙ¹Ÿñö\É/Ž[ƒ,²K†¥wi\îÁqy‰%\Ò[<×ˆd2™YXR»\n.Z£‹x·‡h\nÅ´˜&¦&¾6q¯U\ë\Þy\éÿ\0<W\Å\nnž(x\Í#žœVyÿ\0žk\Åzo%x<®z\\\Ö:dšk\æŽhñDt\Åx\ë\Í\0)5‚+œýy£þN0Ø¦\à\ÉM\åkž˜§pƒW\Õ µŠ%\ÅûÈ›\Æ\éF\Ò\áù%–\æ³g|xQ@ÒŒ\Ö~’FÌŒ\nÓ•»´Gp\Û-\îûu\r\×1\\¯o¼…+NÛ€º;â¼…ŒLÁ¤KEs!U»‘e$\ÒHF²[3‚÷W6\íûš\Ü\×yŠ™AQqn«5\é«{ò°fJ<o{z‰W—\â@\áX\Ä\ÈT ¸H\ÜR\Ûñ*ƒF‹˜&õÔ»Ut²\×9\é\Ï@hÿ\0\àVk‚\ÞÀ\Â\æ”\â³\Ñ|P®A5\ï\È\èk\Øÿ\0>\èzf³^An™‚k\Í{¬ñÁ=<P\æ¼ô÷žk\Ûyjni¨ÿ\0¬Qòh\àVµª%Œ\Z†³=\Å\í¶ó\n¡\ÈÙŠ‰\nÓ¨\Üø\Û(2ŽŒc%%+œ\íð\Z¸·5¶AY\ÍFIa#Uµ\Æ;ª\Ç:\Âýµ1)\å€\Ã\Å\Ã%CrŠ?%ªK©£\êwn»U©¥iNø”¥\à#ò$z{¯\È.Ñ…†\áQnµŠ¦Õ[™\ß$4‚;eûaAFí»2#@)÷ö¨ Vt\ÝDFŠGpi¿\'ü+¨dY¢\Í\nÁ¡\ã8-šœP5\î\é\èù\ÅhsA¨ùóCš^Iz\æ½Pç§‘^\rY\ç\×><\Ðñš\àt\Ç|\ÐëŽ„sO\É\ç\ÃóMG\Éò0j\êq|‡V7sZFó\Þ\Ú.a\nXdS+*\Ä\ÛÄ‡›…í™“c	6˜Ê°‘6\Ôyr»…nl!YB‰`Ü¦D´@\0\\m¨\ï\îYD7‘_I¼\Ü+‘6\Ö[´f\'	w>¡#²]’M\Üeš\ê\r3=1ž»\í’\í\Ù$»\í¨\\\×S\Zš^\àyyRV—4\ÚEHB»°\íˆ\Ù;™·Œ¥1 7\íÛ©\0£”Š\æHVOˆüŽK9VEzq\ÓÑ£^U‡\Û8‰Â‘\\V2A\ÍP\ç¡<õhp9è¼^hy£Y\ÏO|\ÒóB€¯=5{\'\àœQ\ÏLP\ÅrM7š*	£GÁó#\×\É5€\êc$\ß±z†&ûh\Ã\Z;X:\ìFð³¬\áž9÷\nl•´-L¤	\ìåŠ–b\Çµju¥Jš\ßi–\r\Ã\í¹¤ÛžÉ¯úY\ÂW\å\n)§Ž¤d¯\È\Å~DŒI ‰Q(HHß—¤\ÎX4\ËOt)¦\ÝM3\ÄZ\ïpHÙ†\Ä$¤‹4ˆ	E­ødû„\ÃI“G¶I\ã	5*î«ˆƒ\ä\Ü\"¤7\Û\ä–\ÚVUø†½ÞŒ\Z\ä\ÖM{¡Šnœ`°ñD\×5’:Œ\Ð\â†:\n\ÏNh\Ñ\æ¼ôJšô\'žh\Ök\Ýf½F³\É\ëšTdúŠ^‡\É\à>)\èøni\Ø­j«o©xY\Ã\îo„h\Â\Ã\ã¶\Ç5ºJw)d\Æ\Ì\×m·°·6è‘´[\Î6T	¾2¨\ÊlŽ\È\Øee@Õ·yh‡k¶¸¸–‚6H™ª‡=ˆööT„…ÒšÚ±™)­eŒm}¹‘ks%4‰_“Ü¡t~S\å\ç,Fæ¥ˆ\×\ã\í\rPèŠª¸a\ÙKö\Ä\æŽ\Õ(	1 \îGØ»aV®]\è}–÷\ëmuq7v£#\Ø\Üvøö·û¸aGš\'\ÐW}X\Å{\Ï ñ\ìy¯<\Ö@\é\âI\É®\rb±BŽzžhVk\ÅdcWüœ\í\'u5z\é\ÏP+€sY¥5\Í\ne¬n¢(Ô†µñkZ«M%\Ý\ÉvÒ­\íö«:w\Æ4ˆ\ÊÙ†ŒR™’¿\Õ\"ýSi©U•¯ù†=²%¢m¡Jv\Õ\í±Û¡L2‘L¬Œx’T\Ü(ƒ\ì\Å	8M\Ûó€´6\äF\0p\Ñ¢7Wa³\ÙÐ¡uŽ,V¶¨¬J\ÍM¹Š†\î2\ïhcTiš¼ý{‡cR\ÎZ·‡}%‘Ÿ}?ù¹V’_óªXYÜ»wl;fIáš´\ÍBM6\ëH\Ô\â\Õ-Et÷œ=gœ\ÖsY 3\\\ÖFŽ\rz\Æk\Þ:N9¡\\V«Š\Ð\èhp<P­\Ü5yP\ÍqE¸\çŠ>=y\éš\ç\nbEm£‚ñrø_“j<\ê3µ?¦\Za\Ô>Iú‹pa\Òôp\â\ÃnB3Pˆ\Ý\Å2„-¹\Òõj\ÆD±«¢öU©b\í\Õ~<Šr\Ê\èL©:)‘¡\îQ\ÌC¶\nv\Ã\É¢;\Ö.m•~a©<ýwÀ1«\03\ÓCA]k\n«·\ê#úÆ„Ž\ÓQ^;1–\ÃGD+W\Ò\áUF\Ö`\ÍH„ˆSt¶1&$À\0I¹‚c¦/€1j®\à“k\Û=C7q~=®6‘qmq\å¿?Àt“G®sX\ë\â±G€kœ#\â¼\Ñ\Æ#\É®+½b¸£\Íc¦:\â°\r`QmFjL\ã ÁV³{ø\ÑjS\Í+Ý®b\çôn·OÔ©ûñ\éÁ^\Õh.õ\à3\Ü\ÞD}ªÔ“ú\æEY-”«[¾\á \îRn\Ü\à#½<Q\Êm•£Vh\Û9F€´%Y\Ôgf)\á,9;\0¡rÚ„¡+õ\0\ÅMö)†™k\Í>\ÕC\ï]‚+²6‘ô0¶äŒ‚Pš(6dx p‘§.\ÕXÏ•U w½TôÆ¤1m¯i:ù0·<H‹s>>\rò\'°¹•vŠó\\WŠ\Åx ¹¬V¯\ÆHÀÀ\É\Å^(xÀ¯\æ¼×Š§@5Ž‹ö?ÿ\Ä\0@\0\0\0\0!1A\"Q2aq‘¡±ð #BRÁ\Ñ3\áb‚Cr’ñ$4Ss¢ÿ\Ú\0?\0\0h¤©*OU*OU˜õRz©=TžªýT©3ª’³ªJ’¤©=Tžªór§\Í«1\êžøÔ§c)\Ó\ÕGªwiÑ±\ïD;O\no\ß\Â=±†ls\Ì*½³L\èL*¦\âNS‡i\âi‚\è7¶ˆ\Î\Ëù”\ÞÖ¡¤\Ç@vU;Q¹\ä‚¥ÚŒ¨rùBk\í2>k1ê®ŒõWDžªýP”I\ê¯\Õ_ª¿U\'ª$\Ýz©(’¤©=P”\\P&Q+1RVd\èxƒ¡[ßŒ­xY‚#§À:•”B.y©>³[º­\ÚU^Ñ­P‘0Ž%Î±\0£Y®¶X(°8YËº¨\Í³‡xÊœ\ÂÛ½Ps™p\ã\'Ü›–½¼5~i\Ò×vM!÷Aù#u†\Æd°˜ù*X\Æg‘ª\ï\ZDƒ-Mt\ï÷!m\Â­\Ño\Õz\Ô~\î‹]\ßvTõ\Ùn¡J6CO>\n\Õe²h•;\r–¼.‰…V°n\ê¦9uW\\H¦nªw®—’Žm\Ó\Ëz\"nšKn\Ä*gÿ\0»¢¨\'Sp©\×u7Áº,\Õ\íþÙºq\ÊD!<\æh\æ+¼\r\'\Ï\àƒƒ§7½\Z§­Ã“k\ì\ÃuGQ’\ZüÃ¡X.Ò§P÷o\åzmi(<q•¢ß†¨„Â•<4D­”ÈŽ!\\>\Õˆ\è\ã²\n\êeB\"\ny\ìŠó\àê¡¶UñmdóÂ­5\'!¸E\Ïy»cF—öÿ\0\nI\ïNm\å¦B©]d Knƒœ5M7‘e9†·U)Çš§S–	\ÑùKWYº\âwS¡fTø\\\ÓŽx³¹š¨\ÖeA,t„\ÒAMø–ýÂµò\àDy¯$B\Ë\Ñh}ûø\ëêŽ£‰øp‹JžoÀO\r\Ö\è©U*5«3Óª{šëº¤ hi¨M}\0$M¼‚i\ÎN[ö¿ÿ\0EŸ¨€\ã€\Ý(¶‹%\ä&Ÿ\Ý7™¾c\ëøE¼\Ý\'T\Ùô^ƒt\í\\…\Û\æ–5º\råˆº‰Ž¨4’©–\"úO\ÍM\Ñ\Ôl°ø¬\Â\ã)M©(8)²Ž2Š”ü*:pZ¨_\àz\ï\Çö^\\<\×ÁYŠ\ê§sª\×\Õ\ïOx`2±xã˜±ŠñøŽ€~¾¡\Z\ØJv\Ê_\ç¢8\ÆS—mþ+¿¦\ï3\æ‹\Ü\Ó-l\Êmi\Ö~½¨C†©\Ìü\Û#k»™«#ˆ‘\á)­Øˆ!\Z$\\!MÉ´‰‹L.\êyº+¹-Ë»·0\æM§&\ãD\Úp`_e–Œþ  t²w.‹?]\Õ\n¹#¢§‰k¢J§P ùSn¤§¢\"V‹[¢,¡B…§§\rxj‹o\Â\ê\ë6\Êm×†žh ‹UiUjdõX\Üc\Þ\â`ªLÀ\ÌJ=\áú&Qk\êG\r¿u	´\'d\êA‚W)+™·Tùv\ëª\î¡\×Â›D“Y±Shˆ\æú\èƒt	´÷\Ù\nQ.‰YA\'Q¼EŠ !E¢`\'²\é”À$ÿ\0\Ê\×\Ñ¸¦\Òi\Æ\é\Í`³Ayúú\Õ6¢n\"«L*h\0@¨\Ò<\Õ:\ìx–œÁµQ\nzð<c„£\îQe&Q\ãðD/B¡’j*Jñ{\ácq¿‘—rñ\Ä2¡±\Ûu—b}Š\Â2!;\çr\å	¥ _\ÇðEß–%2•7\Ïx2õ²û-1\ä\Ü;€\å‡.æ¦¥°…1 4e\ê<Ü£m\ÓiH-ir\îi¯je/\ËùP¥Žª¥+&\Än²Á÷£HµÑ¥hS©Æ‹»ýF=:¦´ƒ¬Ÿ‚p˜\íDF\ê\ãPl³üV\ê/dz\ÃbYX¦übT{Ñ¿—8b–¿tð7C”¢\ïr(\"<\åGT÷$˜b±ùÉ§KNªÞ²»À\Ò2{\Ðsò˜Fg1\Îv@8\Û-þS#|Ç¢Ë„hS0\Ïv\ÜÉ˜N³\ïCm\×Ù´Wtt]ÁtN£\â¾\Ì\0\Ó_Šq¬h›C›D\ÚyuB„Z&ShAð£‡0mr»“:!CRBvoºv\ruO\ÃN¡U\Ãh\n\î\0<\É\Ù\Úy§¹°rQk£10\å’Ä @pµ\Ö\Z®G\æ…A\îsFmO\Çüð¸E…Âˆû€ð‚´ôR¦8\î\Äð…\íZ*µ\ZÀ\\l\Ä\âZD\ÃBy¼ü\Ç\ÑY±;¦\Ü\ÃAwT\Ì,\Ü6eS\Ã\\Â§‚v\êž1¸Ê™‚h`Áò_b¶‹ì†½,¾\ÌÙ–„\Ú3r,s;!C M¡›[ÿ\0(\Ð\ÚJ\î[ún:£‡$\Î\ÈRò®\å%w\Þ\ÔpÍ“#ESNT\ÃÇµU\ÃHò\n­.\í\ÜÀ–”^\É2\r7Í™6mƒ—wna\áRý.>¥`k\ä!µf¿O%q}Š•\Ä\äÇ¢(V¼%O8A_²<5û¯)\ï\Ëy°X\Ìaªr¶\ÍºM\ìš\Ü\Å;#fù“s>À\ß[¬5-Q\Ã@\06ÊŽº‘d(	\Êw\Ñ43p²$[U—m—wÊ…\"=h6n«$	\ÞV]\nkZ5YD’ˆ½Óš eYDL]m“Y§7¦š¢\Ð6O¦\ÒL8\Ö#\r#EˆÃ–“k$6²ÛœJ½¼%=™\\Ý¾*“\Ú\à\07ù,-~ñ\ÍmŠ§„ Š…;l´+^>€r3<?n<\Ó\Ñ9Ë´1P;¦›\ïü\'¾\èI´!\È/d\æ½\æ\Z°XA°¹Xl±\"IBˆ\0L¥dhè…„B\ÐÞ¤«\ÖE$XžT\×@ýN!\Ä`¦\Zm+K”s,,Ÿ¨·¢\Éi\ÑiDLX\"\èô!ToE^†pFIA´Ž„\\\0\ÍÊ„´ž;šýSb@vTŸQ˜ˆ¦ÿ\0ša\ë\ÃODPQ·	R8j…¸À#\Â4P£p‡¢>J~+TS¦\ç«<\Ô|Ì«—z&4žm‚{º\ê°\Ô\ßQ\Âl‹…\0K…\Õ*c\Øi“y_¤D Þ…jnV\È\Ü,°¶7žŠ\Ñk¯E¯’»NªLŽˆ‘¢õ(;u3*%Y·L°¡\ê£õ\æ@9Q\ÓT\á\íN²{A7*¤\Ðq	$»\è¦Å¼\Ó\é\ÙÊ‹¤F®§\n—„\ë÷\'bŠzß„/$Q÷!Jù¨S\nSô%v…\\ü™¬\ÔýŒ¦€\î]·D¾‰”ó\ßò… \Ò\ì\ÑeB˜\rµ€@\íBÍ²ºh´£¦«Ã£¡L‰%H‘0Vq$7”,\à\"\çh>\\3B/3º\Î-\'\à»Àf6Y\Ä \æ\Ä\èQ©\Z	Aò\ß42\ßP‹\ìŸ=½Špéº¬ÀA\ÙvŽf\"Kt*Œ\êQ‚5T#½p;ªN¦u\ã\å\Æ¯$|øn¥(#\èµ\Z\ÇªÐª®\Ñc*\æ®\é\Ñ\\ž°©ÎŠv\"eRÐ°TMMh\Ú\È|É·²&ú \ÒN°JÑ¤D£p\0\Ý\Ú:)ö©6þT˜‚}É³:“\íN‚\ë\æÿ\0\ÉS>\à}Si¶d\Éÿ\0‘ù\'5£,4+xG\Å~«\Ä\ÝrHƒ\ê„\ì\ÎX”SuprµŸ$\ã,-Qs\äT\ášV*†`N\Åc)\ZU3B£Z_”\ß©EÅµYQ»kè©¸8\Ý\nm¢uZ­6B\èð”P0Šž¨˜F\ëªJÓ‡—¬¢V \Ãz*ƒ;\Üzªm;j€\'U•¶&\åai\\;YXVCS$&\ÔI²Y:\0PqNŸb‘ÁNóÊª½ Œ¢d_¢\â\å:o¹ºksøQ{„B\ÌwEÍ‹j¦\Âóèƒ¶\"ÉºË…¾k3›\íM©~¤¡\ÌH\Ù\0r¬\Í\'˜]<e\ÐØ¨9d#ºp«\r\Çaó\ÉS\ÛÝ˜Myv¥KDˆX\'Œ…¾\åN\ëE<\'ÜœµS·\r8JŒjŽ\Z£ä¢\Ç<6…E2mºg(\0j\äo\0*L.pXf	,ª`\0!1z­Iƒ\n`z\"\ïŠ\Ì\Ò\'D_æŒº‡ð³e6\É\ÅÚÍ¢—°\0\é\Í\×U•‡4¼\én]\ÖXœ»Üœ\ëDŸ+!LÁ‡€|Ð¦\â\âk\ÐOðDˆ{§Ü»¶\\dy¬‚D\Ú\ÊH°Ž©·–ýy¬ 8B.,vfÿ\0„\ç\Üô?^\Ä^d ö\Ý¿Bœ\Ñ¬S„\ì±šA…‰¡\Ìd\"Ü®Ž‰Ž\'•a«÷o-ÿ\0F pgh[£¥¸mt.Š”`ú ¡\Þ\Ü–·Dt\án\Í8\êi»ð²õM!±h(m6Z$,<\æ\Ña[`\í\Ð\Ì6\0 ySA1d]¶KA‚uN\Þa?$i–Îš Ü¾s)€’†\ë|¡>\Zl<_$ ™æ²†»]½\Ë1‚\Òf\\N½?ô¥Ù¯²2\Øqm“žN\ÖB\'K¨\Ñ\\\\þ]§)\Þ\ë(k\ãdZA¾T^\Ê\ÒF\Éÿ\0\0¬¾pZm6iº\ÅS ºE•P€\Ê\ã\å¢®òX\Z¥Í‚tM(©ã§§¨\è®‘\Âf\Ê-øuS\'\Ñ=Ë´/\å6“ª”(tó\Í\0\Ýa>-–³„\ít\Ó\ÓT\Ç€‹–‡:\nu7F`9e6\íO5šÃ—ÚŒ>]TE¢\ÈG\é\'\àuª{\ã\ÉH#X4r“2›\ïG¦XF\Ç]¸ÿ\0¸(Øˆú\Õ	U3»®ª8\\†Àr›f˜•­\æ\á(l\ÜH+PP\èœ\'EU½ “ ‰U\Ù¯Cr¸;\Åu€qk\ÚÓ£ÿ\0dÝ–¾\ÔAM(¯^\Âãƒ‡N{’¿µ_U>ôO½<\ÊÅ¾j;ýª‹\á¦Ý¿’q\0ˆ\×\Ù0óZÿ\0²\Âª\0”tV‰š„]­¥xA~\ë5G44™sxt…\ë¢\æ#–Ð²»H…\Î7ú\Ýd$f\Ì#\Í>•C¤t¸A¯ °G¨þQ\"r\Ìy„\Ü\ÒKšZƒ[y7ø!B™¾mS©\Ó\É9\È>Ÿ\åÔµ\ÖJ¢<\"STsó\Å9¹Š›\Êg;G‹Ù–¢m¤!¨º1h+\Í_]SÁ¹Ü¬FX2!Ê°¿6ª´	…›˜:=~\nLµ§P‰óý†Š‹ó4¼%nŠ¶^‹U*Tp„­Ô¢x’ªh|•K\ÕwBJ‚mÉº\"Ù¦J ÀØŸ_U…hž‹ óY0\ÚJ¸\Ýp\ÕK¦ÁO·\ä¬]\0\'»¥¿\Âk¦\Ä\è³k~pƒ®/\ì@·¡\Ì>‚‘$T5Îƒ²\0ô[Ø©´hSCD•L¶ò\È;iæ³‘¬#S˜Í‚¦ð3ô]\à›\ÚS]\"\Þ\ÅU\ÐÑ˜n¬}h›”\ã24^Z\è:^ fñ,COª¬/\ä³5¤€µ-wM—f¼¹§Að=o\ÆQC\ê¶RŠ\0ñó_ºòDtNX§–0Ž¨I\'xM2\ÝnP¦m\ÐJ 9Äb£`\êZ-t\Ñl´è›¬Â›ÁVBA3¢$k­ ’: \Ò_.²ž\Ü\ß\áfcX\àu?ºsÆˆ]\áùJi\×\Ð!m¾¾)\ÅÀ\Ï\ÉœÃ F©\Þ\ß$k&&U‰\ÐóJƒ\î²-»lŸP¸^ò¦ì€°t\Ù3Y\é\Õˆd´\ÝUm\Ìò¬CgØˆ\0\ÇÔ¦\È N¿‹ø¾ûÿ\0)†[\æ‚Ó€±G\îX¢´Zù)DÛªõ\àD4\ï5\ÚÎ«I¾¶A¢m¢¦6;*^+EÀ\Ý\Õ²\Þò tMM³{\Ô/	‘¢s\ÉñA®}\Æ\ÈC\Z^\äÞ¤s9¬\"Ù\îŸQ·´¦»/0l©N¬Ù±‰Os¢÷T\êˆ&d„Ú›“ª/\rt¸ú\'˜\à\Ô\ìNK`›¾“·ðV`@´Bni\æ3¸f˜B<_™;õš\í:#—¬¹Ge·EPZú,LIUš \îª0)\ìn\\\Ã\Ä>+-s]¨\Ý2-\ç÷7D}\Í¶\ãuö©NpV8}Â’]\Õ) ˜€S€²§\Ê3hM–-neJÀN\èF\áA#ªlzª@\n@–\ì…Ó,~T]l³d^\Ö\ÌxWy$;`k\Ì\Ýwù¦ú\"û“¡?.©\Î·öú…Q\à<g\ÑKKA\×Øƒ€\å&a6¦Z\Ë2«ž&ç²¥”³,óû}B,\Ð\æõ5¼ƒ*/{B\ÍkVh\Ó\\ÜºÜ¢DœóM?ª\ÅOŠ\Ö\È[]•C-Ë²\ÄÓ“èª·Pœ\Ð\íUHk™út+\ìµCš…B\ZÀ8”\r8\Üš5û-Gš4o²\ÓU\Ú<®¦z&˜?rs³x<§Ú³†€\nÀ²!Ú•Oõšy·N7Ž©œº¡P7˜îŸ‰h»•LsE\æN\Ô`3™ª5\Û\Âÿ\0R¤j‡iS3–\é˜\Æ8ø—x\"ZlƒÁƒ0D}…ž%:ž`^\át7\"p.3\Òpˆ:|“Í˜Ý»õB¬“·œ#T¶gcðU1LtC´)\Ítq\í±\Íeö\Ø\æ._nñ}©™€k¦<Is¡\Ú,·œÚ d`\Ø\"\Ù\åU\Û\Ñc\ÝÛ¢s\Ï\â £L‰¦\ásoýª&@žˆAG\0Š\Ó\Ð#~\0¢c‡\Í©Ev¡9[\íTZN]÷S\ìtT\ä&S\Ìñ™a\Ú@\Z&;,\':9¶Fµ e\Õ§W¢|ó	Ý³…kò9\ß5Š\í\Ì(Ÿ@Ÿ\ÛXz“gaU1\Ì~Àz\'\âZo.·’©\Ú4\é\Ù\ï#þ%3H\éT\åÿ\0µ\ß\ÂÁUeB\ß\Å\Ó8T\Þ\Ø¡vZª|À™\Õ>£\Ü\Ð\Ö\êY[ŸÀ\à}\ès\nÎ‚\Ñ(€\Ñ1\ÌtúÐ¦\íDù*•2V&»Œ¢­V¤ô9¹\Ì\\¾\Ð.{\à}\nf0nüÐ¾Ý±*§Ž£c&}\n£\ÚAñ\ì*ž?\rgŠ¶	¸ü#­\ß\Ý}§lµ\Û\ï@µ\Í\Ì\×}UfH]¡M±)ð@W\ä9uúÿ\0+\nÀ_o\áQo+mp¡\\+¨FPP¾JvF\Ü J#Þ‡\àt]¥)’vú+\ÆsE”i´*?ÜQ\ÅQ\Â\Ò\ï*º\0÷Ÿ j\âñuCp\Ì\î\Zý\ÈÛ¬›,k14Z\ÃWjg\ètL\Ìpqq\êU*•\"5M\Ã÷„ò|\0ý—úu(\Ì\Õ§\áw¤\ßüBv ¤=\ÃøOÀáƒL[\ÓøG‚\Ì9\nÿ\0IÁÓ»\Z”ò8„\ÞÊª\ËÓ©r#´°÷\Ìj\éôU.Ø«H‘‰¡\r\ê%P\í\\%h®S\æšú 6¨r<£)¾o\ÙR¦³FþûUKb\'\Ùü*\Õi\Ò%õ^=Gò±±†a$;¼XŽÓ¯‰þ\Ó2ù\Â<f#7yQ\Ñ\ë%C°\à7÷ü\å7±\érc\ë\É\ËÃ·òÊ§\ÙøfŒ\Ý\ß×½7	†gý?¯z|(ÿ\0§õ\ï]\Ý&ŽVŸz·\Ê=­Â©Db\ÛAò·\îª`*±\ÓJ£˜\é\'ùU1øú>cŒl\âªv\Ö2k´Uo\Ö\á3\ÜDå·’ë³œ{ö“suM¶’¯÷\ê´\àT ¼ø‘\é#Uª\ífˆgOò˜\Ó\ÎM®?\Ê\0;ªp¶‘\×\Ñ1\í¤\rWœ¡v†%Øª­|þE‡\Ö\êw¾›_ &aT\ÞT\ÎÅ…cHhZ›\Þô@¼\Ûd)¯³ˆº\î&À&\á$\ÎI…\Ü\Ó»¨\Þ\ëMuE\ÃC¢©F›\åŽ\ìø«H\0\Ãÿ\0k\ê\ØZŒ£€sA\ÝS\í|c#ñœ\à:\ß÷Cú´!‰ÿ\0hþJ«\Û]£XC«ežŠ««b¹]\Äú¬g~]Vÿ\0º¥‡¦\Û€…6‚-e\áðh²Vwä·¢\îj;Vè»’»‡jªQp\ØJp\Öñ	®‘\Ês\Þe¶UR¶\í\Ùv\Ý \Î\çOÁR\Îõúý“™®>K\ÑÜ¼\Ä8À1¿•Úµv`ip7?$Á`z©\ã1\é\Ã\ä¢\ë\Éi\ìR‚r¶\ÆTðò\è¡D®\Ól¹ ›j µ®rO\ÍSmŠw%:…\Ú›~ÊµBñ™\æ\ZLz\"ß´5˜zM—ª\ÃvN3\'vÚ±U31Ï¥P~%?\Ø,$\Øt@X¦P\è*-Œ\Ä]°jo\ä‰-\Ð_®°ž\æ€3U™\è»\Æf†\Éö¨b¦=e>“›v¹T¨9·T«\æ6¸X\ïþ­S\ä±TN&0f¨-\ìT?¤ñO`{ž;&GTý`±¿\Óœ&b\ß\Ä\ròT(8×¤\×\éœŠcm1d\ÆJ¾l\Æ\å4Z]V\ä»\ÊQb\âîªaB¹‡®ò \Ð\Ù\×oª®Ü‚u•Bˆ\ÑT£˜N\è\È&D.\Ø\æ\ì\Ò?K§\äœ\ÑÜ´^j´iÒ¦\Ö\Óz\Ç\ÑTg\Î\ÅvcIÅ’oª`†‹ð?&W’\0ý\È\Ö(²ª–ú­xv£\r¼\çÞ¿KHº#B\Æ\âE˜L\rJcj\ã\ê\nT\ÄS¬g³\Í/¹Už\ÊZ;E\Ú]þ¦M\â \ÛB\ÃRrÄ•J˜>IŒ°Yxn…F\Ó\×\Å\Õb»H30a•_µjóÁ[º\Åv\ÕV08U‡<Àh™øl°½·‰.þã¥º‚JÀv¹¬ðÊƒ*u,\í–*\Ø2\âs\ÎUNƒY\rh²\í‡ª\É\ÙvU\0jsòT(H×”\Ì;#Áuov\ÇM\ÚV*žN\ÐÍ–˜*T\ÎP›L“\Z!L5Žq¶]V7´H¨YCÚ±¹Vˆq}l‘ \ßÝªom\â\ÍB&\âú…„\íj\å\ÄÊ§Ú­0!\ÝU:¬,\ä\â_\Ë:&±â …œ\Ä,C$i:pnoReƒ\É\Þ\Z•--N®\Ú\ÆÊ—)ò+²o‰}ºý{“G-õ*ÿ\0rm\Ãe<\nÓŒt<øF…h±\ì/§›ô\Â{y\ÆS\'XXš¢‹.yŽw±=\à2»=”\éÀË” øÂ—›‰v\æ	\Ô1X:š4òüGò°´?øì‘¯ð:1®\Ê\nt07UlKá¶§óXŒ#\Ûgþe‰¥—¼¦4N\Â?¼ƒ¶…3\n(—8ŽU†{IfQÌ»!‚®*8Á>iÀT*¶+\Ûô\í*®™º®\Ù~AJˆñ<\Ývn’€ŽŠ/(„Ø¼®Ð§š“‚\íFšu‹Ž#\æ»:¦zs¿4+4? —,C«Wk\é2F]DDª\ØwÑ«pa\Ë„{jfžCðL\ÂÁ\Ô¢^!Rì§¾›]\á=U5J.‚e©­%2”	F˜ \î«S9»K1kig÷Â­D\Ò\ÑRt<uN2úý—d	\ï\ÞP\Øø¡qe>ô|*7\ãe\npš™[ù(öð¥AõtU»5\ÝÓ€!\ÅÁVelóÖ¢b\ãÜ›@\ã1&¾X¥J-\æžÀ]V\Z‘h\Õa\è´\0\"Bhj\í\Ú\ã¢Í¿º\ë³©„¢|¾V^”\ì\Í>T¹\Öp²¦\ì¾gd7½1\å«vnO\á77]>J¿`aI’Ü½	º¡\ØX;f¥¿\î$ÿ\0Q\ìœ5	\ÉM±µ¾Š¦;±`#T¸ˆU °\n¬\×\âûS,È§õü, 5£\Ñ˜Ê…ˆisE\Ú\Ø>÷;b,avCœhd þ¦r‡7Q\ÕQx\ï[-\Ó\ëU‰\ÃP¬\Ãø`tØ˜:¦\\Ü½5Tÿ\0§°­¶Rñ\æ\ãû‡\ì\ì%\Ê^‚O¼\Ý\ZT\ÃrÆŠ¥&5T@-A­„ZŠ·„ƒ¢v\í8\Ù>}\ß\åb\è3!‘dúYj4TŽV\å$¸h»9†•&‡CKöMv[h¿u¢ßŒ->\èù ®µ\Ñz­HXj”\é@ñ\Ý´YË´(RsKC¥b)R§Sº§\Êªc9ýZ*,\æl*2\Z·¢\ÇR\ï°\î»©\ßAþ*-úø.ðb~$\è\Z¿¨&!2œ$¯.(\n’e\Â¥Qc´s §\Øho\ëAºn»V¸\Ã\á\ê:oú~‘«V®!û\é\æOð°ô²s)÷^ÿ\0Â˜!¡<\æ¢\ëKñ\ZKf\r\Ó(ý—´L¬\Äó7¤þ\Ê\íi¶Š…f\Ì!d\Ì9\'f‡j04@—X#¬\ìŸK6›¦Ñ…¦ªV$\Å7“ºÀ³3\ë;Pm+\Øh\êÊ¥>pî‹²0”ò\Ó0Nñ ó·½TÀÒ¨\ÑøWnŸ\É]UVwuH6•c\ê´\Õ‡¯Üž¨y/N!3û`‚\Þ\Þ\æ\Ìp±G)pv‹OûŽ\Ý\Å5\Ç;<„{Uó\ÙR\ì!´‚5N¦p] _ÿ\0K¯ý\Ãü&~,d…’˜¼I]\ã\àŒœ¨º\Ñ(T\Zû\Ñ\î¿5L³\Ñaš\è/%ýa\Z‚\r‹ÿ\0p$Ú\"YK+~º¡T<^\Ä,\Ö\è»V¿ÚªŒ3|;®\ÌÁ2…*A­‚©²3M¶M\äŸErù\Ù8\åm´X¶5\æWhá‹°\Ýý\'Ml1˜ÿ\0nð¨\ÖûFn\à&Ò±“T\ê9²\ÊûAn\ë½\îPûq\Ú\èyØ \Íú\'\Ñ»UFÀ…\Ú\Õûºa€\Ý`©e \ß;û\×h^Û§R\éEv@š,;ýþ¼\Ö\Z‹\ã;›9öù{—jS\Ë\\\Ù¢•û‡e€@ðz*gñX»5¿‡R\Ð@%7™\Ï\è%b`\à.BÅ›8tUFWR\ê°\Æ_=S\r„ì´‚ŠýV/\ÌC2–\ß\Ë\æ¨\Ô\Å`K©×¦M)³\ÅÇ¶4ôM\Æ\á\ÜmRþi¯c\ã˜YF	žd\ç7\Âª\î™\'=IoEV kŽZ3\ç:ªx… U\Î7\Ýf¹pÕ\íFPkh\Ò=ö\"·…£_UÙ½šòÿ\0´bD\Ôv\Ë\Î\í¢l®|Æ¨ó]Sc\ÖBp2z,CUFI.\rõEw\ì|\\9¤\àjžSµÿ\0/‘	Ž£ˆ§ž“\ç\æª4þ”\Ð\æ»€N¨\ç¸~PšF…1\Ô\Ã\êR\\¨\ÍyDŽ¶X\ìu8vgŒÁR\í<Q«­*g\Øô²\nm».\Ð\ÙFj“â·½vuÓ¥E±ÿ\0+\nñ-n\ÝmÞ·\×\Å~\ìp#€P†«\ÉhP½\Ó-U‡\Í`¶¬X¹‹Qß˜x”\æK‹¡c\é—9§T`\Õ\ë.ªcK¦\È\Z¦\ÜGD\Ñ\0\':˜nY2|“i—™«\Ùø|@\çÂ´Ÿ\Ô9ÿ\0\ÄO¹7±\Z\çS«V¹\ã\æÒ«v_h\ëK´‡üšñû9§ö\ÛDý¶“½¿\Ëhv\é9GuSþmþLoø\éƒÿ\0\ìbf·¯ý¦ÿ\0Í¿ÁG²{n¯Mž™Éªô­G\Ó\Å\ã\ì>7Xn\È\ì\ìt\Îò©ü\æ\çß²e0#`‹ƒŽT\Ö\ÛX„\Ý4\Ñ6si	\ì™U\Û\Ë&\Å\ÓU[\rF«J»;\Ê5\ì¿ÐŸM³€Ä‘\ä\á›\åü*´{w%\ÔF!¿í–©¸ü`µNË¨\' ÿ\0ö–S\ÂTgü]ü!Ú”´\î#ý§ø_\êsf`\ê?þ\'øM\Å\ã¢iöeC\ëeMý«THÁw`u |Ê«„\í*­2i\Ó­@HôÊŸý=\Þ<¾¾ ×€\ï?Â££…¦MoEZ…\Û\Ía\èw•\Ù\Z6?u†¥™¬$»T‡\Ö–‹­\Äð•(¨^ª \ÌpEù\Úz‚«¦F…¤\nœ‡\Öa\Z”Yk.\ÑÃ‚\Ã\Í$*Œ°p0@X A.Ñ¸	Ž¸p<\Ýóƒt\Çel\Ä\Ê\ïùÇ±}¢›de˜_l¢ÁzUqXz\Î\Ê0\ÙB\ï(\Ð‡F}P®\Ó\Íö`¾\ßM™ƒh4þÙ«”5¬\0úSZ»¹žc\á\æ¨\äÐ’>¾J¥Hò•L\É\Ön²,´hS^3óZè–¬‚«ù½X¶PuZFi˜„\Î\Ô{G\ãQ„1Ýžñ¡Û»>4½7\Ù}\Øt>AòŸ’8\Î\Î\Ë\r5Ÿ²}Lô«S›\×ùA¸\"H5\ê\n4©þBI(ºq–ÁXƒw.tG\×EÙ¸|\Ü\å²O\ÐMh\ÊÓ¡L©\Ü\Ñs\Ê\Ä\Ô\ïm3k\Â8\rº<,TAGd\n•6ŽD.!8B¡[ðiù\"S\Ëlñù|Ÿ%Œ»ú\è±t4\0Ae£ª¡O$NªU\"5(8: Z\Ö\É\ÕSvXqÔ¦3;‹\ÜlX\×:\"\î*¡\ryl@\\³#u-\0frs‰O\å˜Qù‹¢U\"\Ó\r\ë¿\×þ–h\rc.S\éº\äªV“º¦C„§Ö¦4OÄµÏ‰G`¼}Jk³Ó\ÉU˜$šhª¸µf\ët\Õÿ\0$ÎŽ¼\í\Z¦—”Ÿr¨<-\ÊC5\Õ:“H\èK6÷\'88\ÈGC;¬I‡‹){²´	úø¬Z-ae2\Ò®øÃ²›w\Õ<Ë­ û‚\Ê.¼‘û±ÀAj¨;+\\oþ#Iü³û*9fE\Ö7ò´’«\Ìë‹µnoED\Ê$.z¢\à\0³\ÔCIÍ¢$“òª;/ª’Ht\Ê8‚\ÒFkr\ÏI\Óæ»°øh˜\È\Ìy¶TiÜS\ã/šq,wªcùM\î±=ûó;,*2\ç\æt\ë²iyp\Õ0\å¥\æžù(GYU™˜z&\ÒMS˜ø}\î~´NcÁb,Cœ2\ì,T\æ1ùT\Þ\Ö`”\ã\Ë84’nŸ\á\Ö#\Ä\å@õ†g ê©€A‘:¬S †\èÄŽt*vR\0C„­V\È!\Z&xãª \ÌøF·\ÍS Y¨\Õb{Ñ›dø¸\Ý4\Üù\'\n…ÀòCEOš\Ó	¿„\Ù\'˜§Î¾\è\åÊ²ÁƒÊ¹ ‘Ô¡œüGYŠ•3Ëœ\'\äl^SY˜°ù®÷ ”\ìFo$ú“¼¯´e)¯mFkuk[DCsf)õ¤†´ Y<Ï‰D\åvº©\Ø\é4%w-0x\ëõõ\ÑUÃ†’rü„\êeÞƒ¢mšD&Pô²w\Å=9û,V¦û£p¨‰e¬˜2\nŽ™€±\ÌI™\àTð¼#\Ôl·¬ð<:Î¼tA	–¬\0. \áù…ÀôT\Ü\×4ƒ\âÉ›\\*ã”\Âe\ÜvNTw	‡x”\Â •šuºhˆ‘r²‚UÀƒ¢©O½¹\Õw\0\ê\Ù	¸f‚#E\ÝSkb/ðGû„\ì3m4UcCeQ€\Ì\ÝV£Q\Îü7œ\Ú\Ô\à¼\çX|LˆM“k4¶\åW\Åd\å\å^©þ\çvßŠfƒ›1¨\ï9)…ð›¢i—k+óšÁ0Œ†÷^\"N²,´BŒ‚ÁM\î­¢v½Sõº\ÇZ~k³\è‡\0\åI¹[1²®þî›š5*«¤Óøðßˆ\ÕB?(”F\èhŠ.šP$,¡¹\æ\áb¬óR™ÊŽ\"¥XÊ«3m¬¦xˆú\ÕHó \í‚i\0@T\È\×t2‘šò„›i	\ÃT\æt”\Z\Â<YP¥\Ì3Pƒøl	´3\×ZP¥“OEZ†k›„)o\ïU{²\Ïª33IÊœ\Òfˆq@¼\ìƒ\Ë\Í\Ó:¤\æe€fôM‘\Í\n\ÄLAM€#YE°\Ù\áIpl\ì†R$jS§¬¢\r\å8Ç¢{¶	þ\å‹™\í÷®\Î\åfXY\ÝQÁ“\r\Ýbj__GRQüQ@ð•y\à~\àQ\Ñ\0¾(\íAƒ«‚lU^BOˆ~É“x‡’ûC ´¶&=\ê°\É[IŽ©¦<\ÓP6„\Ã	¦cd&l·\"S°	Ä›þ‰f_2©@2™ô_÷\Ã`\ÝU¨\"\0Oq3<7YIòOy\\˜À\ç]\Ó+¹swT™\r\åT\Ú&\éœ\ä\r–]odû×»Øƒ¥¾I¦k^È›jªž‰\Ä#§¢\Ä\\„$S1!¡\Â=UW“˜\ì\í<¸’q›ð¸J\'„ñŽ¨‡ƒ]o	Ç¼¦\ØTwªvSS6‹g´Â·MV\áS¿^‰®¿DÇƒv¬\Þj£º\':ó²/Ì @“*“€\Õ5ò#t÷ô¼\'É“²{ˆ.…>\"!dƒ2ŸP\é9$ž’©¶³\ßK’©w™@o…\Ü6.˜ð\ÐDÜ©\0]> 6Wy¯TÚn…6¸tuY\äJ.·š.˜q„|!V(X7rºGTü\Í$L5Ê¯\åo\éEG	û¥B<b\ê-\Ðð.\r=V\ë\ì\Ã.\É\á·!pMt(\ê\Ôy”ö¦žmdªwwD\â F¨“1²sŒ\Æ\É\Ï\ËÍ²§‰B\ïd[t*–s¶‹<\Í\Ñ-Tö\\…R“ˆ‘¢\É\ïN¦A	Œ•F‘lnƒŒe\0P\Ú\é‚]seZ¦Yºï±\Z\Ó\ê…M“r\êSOK‚‰±U\r\ÞwNˆôU„µƒ©XjO\Êö“(\áó4ò\èªjŠ<#€Zq<\nÛŒð%m\Ð)?»x\èSj6¦Qù‚w5‚\í³ƒÐªf\Z\àôM\êV\Ñ\Í;ªF\0Y“ú\îšö\ÞUXw¢f¤\Ê\ïfz¢#D@hóM\îË¥\â•PŒ\Ò7F`¶A]\Õ6\\”i\Ò}ö	´©n˜Ÿ”–\É\Ï| ‘º©\ZJ¨\ãñ]\ï6º&¾J²¥ \ÞTXW&\nrq©I›ªS¨\Ú\é\Õ\0§¬JyD¢½x\Úlš…(ð;)ûj€BÉ¨€˜\çHB§P8^\Î]£Y‚€f\\\åÎ¼l€`¶L>\Ô\r“¹\\HEÐª@e8‘\è©\róF¡7L©ÿ\0’cü´LüF¦\0¹5ô˜cu\Þ\Ñý)¸š-€@Dñ„¬tÊ»œ;OŽ[ä»º\0\ÓM\0.\å\Þ`\ß\Ì*\ØznƒM\ÒV9›\Ês\ËZH\Ôj«b=‰¯3p˜\â©i®¨L‹AR3D\ÙV\0or›\áj£½\å>\Õi7[…\ËE¦û\'Us¿\í\Õ-¼Öª5û°Tõ]THQ\Âû/‚€\á0GFª©.\ZÊ¤\ì\Ò´L7;-4O\æ%@\è7UD\rn‹\Éº¯U”J­H¬_k»³²÷˜ðu’¨Sý ê€§\Z£\Ús\ÌñU{N®PKËšn\Õp¦M\ÙJ\ì\î\Ù{±*»0XþÞ¨\Ú\äS†±º,7õV\"Cj\Òe\Ìj=\ëµ¨h`©a\Í\0ú\Íò¾‰ÿ\0\Ôø\çT\åxv\Þ~K\ÛN«J£«]ôÇ½Ý¨k<S\"\Z›ýD)ŠLx—\Ô\é)Ý¹›•×…‰þ¦Ãµý\Ý:£ýU:•q—;©ó•OX\á.…‰´ú,>VÈ¿\ÐNsdD·®\è­0é€œ\ç9¨ULF\ÈúÍ›nœò\íS¸\ï\àV\èD©R£ƒ¸hµQ\Ñ\êx!d\n”S´*‘\ry	\ÆSF\áI)\áR1\ÑI-u‘j	\åUF4\ÆSÊ€½\ìš\Ü\Ã\Í5*œµ)\nƒ\Ì\'ÿ\0MöMa4\Úp\Õ\ÛiU?¥Y‘¢†*5\Íü¬Gô\Î>•.C\ß-–/±±ôh‡ºƒ²Ÿl{¦%7]˜ªuI\á\Ã[\ïeZ›\Þü\È\Ðt…ŠoyO\n­¦Á\î”(_D\Îö*… øLùl>+	„xdxœ\ä\î\ÌÆ°Qy \ì®òG²1¯|1„\r\ÖúM”jœN%Ù‹Œ\ÑSÁ¶21¹\0F˜aVMÆ…9\Ù®ª•\Îc\íUjH\å°)œÈº,ª\r\Õ\Ì\ï%·ñG\ãp¤\"¾jz¢•¢\Õnƒk„O½O’\n8Q_=VoŠ\ÒÁ2\à\'›a*Kf\è\Zól6‡—1*“-ª)Mfjœ‡)	”\ÞL,µ@-	p†\Ôff”ü>\n¥\ç\Ó}»±j;3©5¿^©ÿ\0\ÓÝœ÷\äeGü‡\ÆU_\é\Þ\Êq£r-4\n‡ô¯c×ºrž®%3±{\'\àÁƒš\×\ß\æ¿\Óð4\Îf\áX\×z\áVd˜rÓ»½\É\æO’a´€œÀ÷D\0-\rÓ„\êš@²¨\æ\è5M& \Ù;\àª£\áõ*Q\Û\Í~<>K^0µF\á\êŠ\ëÀtQ\ápiZ©\â\å^bBc¥’',1),(2,'andream12','1ef1a7668d9078e99b8d0080c6fab3b7','2017-05-21',NULL,1),(3,'josemar27','61af2d40a529d40298efaee15a7f4f87','2018-04-20',_binary 'ÿ\Øÿ\à\0JFIF\0\0\0\0\0\0ÿ\Û\0C\0ÿ\Û\0Cÿ\Â\0\0\0\"\0ÿ\Ä\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0	ÿ\Ä\0\0\0\0\0\0\0\0\0\0\0\0\0ÿ\Ú\0\0\0\0A!\'Ã¾\æ$î•€”`J—ˆ,d\ÆN\0\0\Ü\nL$/H—¸Á©Y oC—(X„U€\àGE…¢Ó…5LL[\ëP\0ª\ÇDÉ‡\î\á.W=\Ö!È†}uZ|‡˜\áô\Ñ\ê\Å<À\åW\Ñm¼Ãž\î:\çj\Ûr{^£\ä\×=L;}£¥\î\Ë\ÏÌ›[~š\Çø~C\ÏXU|ŸVÐ¾û\Õ~e\ëyo÷¼u>‘\ÐU¹‰]\È(˜¹Ù½¥“0¦T\ænx\0¦ND\Ên„ŠR(d†\Å\à,P $J2(”2´©9@\î±@¦ &%SqÂ P­ø8Z‹BN¦(\È\ë¸V$rˆ1‘``#„‚\ÑB‚ø€®™\r\Ê\'°¢d%\à\0J“+b”†U\\¼\"ÀIDc¤)Pe°\Üt`P\0\æ$<6DŒvÎ‡\à…5\Ê1\Å<ó\Õ\çú\ëó½;½\Å\Ü\Z\áfß[užÄ°Q´õ!ÄŸl\ÔÒ­\Ñ\íª\Ñ/vJJš½¶-v[ž^¦‡]¹#›M\"Ê­†f«jöXVÑ¶\ßn|\è“\áv>ŽJx\ËO\ãtýÎ­9\Í\é<’d\á\n€NŽ\0›s\é…1#•I8 h‰œSpb+cˆ\Èr42`e†)—ŠU ¢½e Ú‡H\écp,?À»®U9k%9X\0©\Ü\n\\b\Èñ2š\ãI’°‡I•T„ª\Êq„Éµ|dU[DŠ%\0Š\å¤\0\0h±\Ò\èªrJ†8¦V\0=®J]Yùs&pDÀ‘¢fü\Óñ8GŸ:Xý9\çLv¹\Ý\ã\Ûi†\è\àŒ˜\ä/¢\ÄÂ¨I5c!m!`ŠE[ew‰iôiœ\Ê6xu\\ŸÒžjguZ\Ý{t\Îsjª1­\Ô\ë\Ô#zd‹˜‹*xšòAf\ê!ýš¡,¯¡o>mK\Ó÷ý\Ã\å÷«<\ï[\Ò\î™:\ãu\n\ÒA7uª\n\ÆM3<M\Â\Ö$b€1ÀJdŠ÷ª\Â<\n¥\âDB\à„P„¬¬A+(&¢V\ÊrVx@\\€C€œ$:*Ä¥U\"¦„‡Q1¬‰\Ê!\Ê†L†ˆ`h<\nÉœ…H €%\"‚`$¹A\00ˆL\Æ)“1~\ÒX*+‡ ’Ð¡hSt’e\r\\ªù;¥\Ï\Ûü\ËL®ú*‘“Nur\Ï)[8+«‚[”³\Ù)\×QZ`ZöŒ\ì\Z^_\ÛU}¼T‰±«è–¼zóN‰Ì¯M$ª™½ù®ú,¡…²¾\É+/S½†…~\ÝA¢\ï4\Êl—˜®­(\Ý4}*x­Wd|—P/£zoÁš/«\î\é/6\ï\Þ[·dAfY·$Š­MŽWn²!Åº®Q–]“\n\Å0\ÜdVK\ÅDJ2!+(Â¬*b“¡S‰\Ë8\Éõªªg„ €PSVB\ng\Ä0À¡x\à£À (\ä15SU8ƒ	¸§Š `(PRn2m/n\àt/¡*¦%\ÕP(£‡#ðÚ¨¸\n‹S=\æ\ì¯ô\\U	\î÷&)ó¥Yf\æ*Œ\Ë4l¡X\Ø{­R1%i\ï\î¦\íXƒ´½tu5h÷HF«Y\Ýs\ÚÎ´\Í\ë¨\é\Ì\Ä;B\Ùõ\ë=µjÁOdn\Þ2qlqKBO©Yz¯´¦–\å2‘ñ\Ôj¤\Ùm\ÛK}U´[K¤¤i\n\í\ï¹Ý’öŠt&-~ú}\à\ïIù~\î®X\Éü[\ÒœR\è”–TÁ¹5•0P)H\'+\Å8@‘ÀJO\ÌÀN\04)˜A”\n~€œb\Æ7–Š$¦ &(‡Å¡Î‘Š›„*&DüÄ¤P®\n!2K#q¬€\"BO\Â\0ªˆ˜N/ƒ	@?\n\áSJ`e²{¡8stg(+@¶„üf–o\ë|\ãT\ïÑnb÷¼^©\'¦\â|¶¥´\îÕ¬\áÛ­ŠBµ[e\Ô\Þ\ä³im\ÍhÛ½vem´\ék\é\Ítj©\í«H¨OZ+|\éwuÀ\Ìã´šT,tKâ¼’R(·›.wñ–#an•Ç®µ9]·²T\'Aµn[\rAp\ÉJ\×K\Ñ\ËÁ)Š—¯<a«OeaŸW§\í~Wµsõzr\É\ç}\Ó\Ù$ªò¼Í“I²Qt*(9[JtÎ„ª 0‘@7‚j ID”hdŽAt—S\ÜT\Ý8ü”&\á0$(”H&„’Ð•5n!\ÄU“„	:b&S’t\âˆn)ÁÓˆ CpH±8(@2€\àð#Àš€Â¨™apš\Ù\ÓRó\Å$\Éýg¶\Ã\æû¼i˜\é)›j‡–l =a’®\ÜÝ¾º.¹¼õ\Îi-\Ë#¶úÕ”\åsóq,5wù\Ùb£\Ç\Ûë¶	vB«‘f»4hùg‹­´Ë¹†U\Ä|•VÀ¡d¶e\'\0»£jô}P\î&°,\Î\ß\ØQœE\\«—æ€ºGX\"\×Ù°”dj\Åuž\éÜº¦\å#4U±»QT\âÚ»ª-/\é9\Ï\0Ý¹ýh:Ì´\î\']b”ôiWŠjØ¦L\ì€ÀŠf¨¤„9Yx\Ü(\0¢-<`R‹Dü™>xH€qQ\à\ãrPp¦ðR\îW Á\Â€95YS0\ZN“(š•±)²÷‹rk¡\\1\n,\Ä-“Š£y\\_žM\å®÷…jÀI\Åb+[\ë²\Äòyƒúõ\Ñ\ä4\Ò	KO––\0‹i·%až\Z^?IVD\Ñô\ç\Én.ÿ\0Yj‰\']\Õu}ô\êq«a§Á±‰kn60-¨U©L7J%Oœ\Ø.shõ:®­E\"¾½\Ê^\Ä\É]\\\Å\Ãàµº\Ë\ÑLypi\ÉX\Úù\àkS‘SI6½‘(aGua„»\ÙDÝ¢&\Ù\n»\"þ\Z/¥ñ\ÚW}\Z¸øg\Ô>K\Ôh„b÷›¼l½lO¢¨A R,P0I\Âa\ÓPŠ\0HrJ `8\0Zp”q¸Z&¡H˜ƒ[q­C*‰Â¨p\â™’B‰\Ç\ã@\ÆDŒr\Â*$¢’d\íSQbÉˆ:ð¦vœF²C¦.«µS^_¦FúNTóû<¸\Ú\êRÎŒ\'\ÙŠOç™”\ê)V4(\Ò5:Ü©k±c^\×r6u¬‹tC=ÁN\ÜúCO®ü­]jmlÈ–\Û\Ã\ç\È\ïKDÀ‰¬L­Ø­’\î\ì6Ed\Ò\\‰”6Ó­_E\Þ!\Zehë¦—S½*Õ—\'.±\Ô\äm7Xžl‰ô,L\Þ_)Á\é›\\›\Ñ\ä†^Ê­Ç“5\Ö\ëòš‹â°•Ø‹^tõ6VZV\Ú]¢ô¸>P¥‰¢h\Õv¸wû\Z\å\å_KùUh#I~´Ì¢ª¤¡\ã\Z²\0ð°Àb\Ô3õ€ª¦xS”Ž!À1O\ÇXT\ÔM”\Ã\Æc\Å•S„@D¦!&\á\"•S€œt\Ýx\ÄswqPMBY9d”¡\ÌR‘ÔŠ	d”¢5ùdý_\á‰\Ä\Ô{\\‡Ëºz\Ñ(u«œ6N\ÈL4½…\Ý\Z\ë¯nwzuPô‹…“>ü\ÎÓ¨Y\ë×ž\ÏÞ¬™÷f¶{„\å6\×,²h\×k\áIû\ÇLœµnjAPi\ËÝ˜\Æ\Ë\Þ\ê	CLü4•)\é©º,/\ZB0³6K\"É¤jˆ¸¥=Œù’\ÊDu\éÉ¯&KKŽz\è0š\Ì-¹q¸mÂ¹~O+dž\é\Ítsü`®¿\ì\ä¹\è¥7I¼öû\Ú\î¢Í’…žn1ö×—k¸v»\î\å=\àzg/R¼yž\ÙPµ”\Ô\"‹5H\Õ$\'\ëáˆsŠ™TM§\êB„w)1JXWM@3Œ™\È8\0EXÁ\Ð7](ª2«$\'\à(™\ë`\nT‰¨8\ä5l1”#‘XEH\ï³¯zŸ7-—’+·\ÍqfˆžaeV§ž+\ßkÔƒiÏ \ÅÁ\éxú‹l\Ö\rg—Þ¥N\Û\Ýf\é3³NMf\Ù5\"Z´²i`EociFU\ì\Â\âB2EÃ„H\Ä<Ûˆ7p-*\ÍP\Ï\Z­Ì¤(ƒ†õ\Þ\å\âŠNY7P5k#Ã£¥a™\\4p\ÌDY»)FS-k$›j\ÔVk¶Vº1\æXÇ©i\Z¹ž«ú\ÓÌ??\0U¤_,\ÆÁ‹HQ~\ÓXB\ç[\æ™þ]ÓŸC…\Ð2i¾z?\Åþ“óû\è¨<Ý„ðU\n\à…9 8&¥l~(¬\'q-@9yXè¬›!8Ê†L£\Â(()˜¥e2\ÅN*\à ð£Ä‡“P¢ˆ°‰€¦G†Mb,\0\â´\âð†\á\ã\ÈCswNò¦\Ç\ãþ\Ç[(gNõþzb.\Ìþ–™)\ÑD\Îö\Ú2\å²3š\Î^š~ƒy¢p}Lt\âRY:Î¥Lº\èydºe)1²YÃ†\ç:^\n®`\Çu\"<ˆœ|cVQÄ‘r\é9!&’,AM£ª	ˆ¼Lb¦\Ñ\Ø8‰t\Éó’\ä™[2Q¨gi6H¶²m•¡Ð’Š50‰™A¨‹˜r\ç¸_§ªz¹¾†ô÷—:^r\Íd¥l5#W:\ÍVÄ¨Á\èÕºm\Ëuœû¬£IÔ¨ø·{6Bk\Ëw‡¸\È\éˆ\ZB”\Æ*‰a9xô7$±lDx\Üð@I p”y#‚C”\íP1‚¡LŒ\nK¹8N@8%\àRq\"b(„¼)&2f•T\Ô`Z\Ìÿ\0št\ãÁ«L\ë~\ï\ÉW\á¼¾†\×ú\æ¿UÖše£R\ÊNÀ¸²O\ÔMŸ\Ï{’ ÷Ÿ\Ûu$Íµw*£ù)*½ÑžI\ëGõ‚\Ê\ïœWg\Ø\Éq]þDP*PW%|UG!&L\îÊ´p\ä	QWP¢‚‡ud\Úe²Æ Ñ£b¿JHúõ¡õ\È\ëTb\ÙŒ\ÄL,a%¤4\Û6ª¼\ÖM³\ç…g5\Õ!O¸V.\ÏTÁ}\r^\ß\Ãð>‡\ÙS\Í{_\\ò\æ¥Xý3Ë§%=\Ç;t½Ø²MQn\ëf¦\Ü<\Ï}	r\Þ+ e<wrñkÜ›ƒ\å0J Õ\Ä—€P€ €œ®¼¢kEWŒI\Â&r”\'\Ç`™UNN0ò±Tö+uY’„3¸ ³ó\ï\Ó\ÞRô¾y¶sm¤wy-“¶F°\Ý[\ÏS|	­ö\ß\ê[3¹s¼×§¸Þ¦MA{N·0²+º=\'\ÞÇlœ¬%\Ópõc;Aº¥–enY\r\n2ª«\Æ;t¨,\äÍˆ˜ñLP\åvÁ3º=µ²:\ê‘Ò­–E%*€v¤\Æ`\Þl¢W\r/]°ö˜lL,{W…³=e»ö-Tdló\'®¹b†²š\íf\á£c\ã >y\èy¬–ý‡]ú\\O@\ÙñIZd)7š\Ö]•/Zy\Ñ\"¿H\\©÷?5\ÞdWË©€\êEaŽA@\Ý!@\é\Ä0@	œa\â( ð’q\ÈR9RW<\èS•ˆQ+NÊ“¸\0PF\Ë÷4!T+(ÀD¢&bÚŸ,yZ\Â}Ç‘fé¬žürº…?YÏªÂ£Xº­®\×mHÕ¦Ù³g;?\ÓN\É2š\Ã\Ý^R8Aµ“®\ÕÝ¢)c“\'\"\ï-2\ÑÙ’M\Ï/\'I·ek½’dT\Ê(\ÈB¾\â¤\"c“\Ä*þ5kPCtkCx\Óv1\îåŒš8\ê\í:j\"Õ¤\ÑB­†[\ÈvK;¬\ÅGK\Ç#0a4Œ\r\ä\"TÀ\Å\Ú\á•\Û[sÕ£¬p,ð³Ä¿56­r‡»›\á¬÷\ÜG\îyô,nd\×x\Ð3ŽÇ¨\ÓG¢úg¢ù\×uñ^…t\íL9h\é¤\à€œ†\ã¦t\ÝHa)€<P@D¬\0uc”„T\Ä\ì\n 1^&qˆT\ÕL°\0˜1\à\è˜ƒE\"¤E%±D\Å!A\Ð2q|óƒ°F{¿)ge£I9{k§e\×X \Ü1d±\Õ\Â.\çŸ~‰¦\Ôm<?Q7%?Ÿ¢\ì\ç:\êc(\Ðe®›$\ê»\'lµ»½ˆ£•^¸k(\Õ\ÜW\î‘hYE\ËeHH\ÇY\ÊG;3V¬\îX…\åX©G4tu–%\ÎHNqQ¢’7n\ä\êJ“¶F$Áú‰lq_$b\ê²=„»zš•‚,L{\Ô\n°#¨v¥”\rŽ6\Ê\ë\r\ìM]b½`Œ¿,?›=QD\ß\ç¼E¦\æ7-\'O¹£\Ü\ëOòi\Ðý™óû\Û<ÆŽ²}\Ã\ì\"=\Ê\âQ)T\Ê&üNQ\É,¨Q\à$I\Â ¤rÁ\ÇIx\nB˜°ñ\É!8:=2J@2J\ÂÐœ8\ê\Í\Ô\ã2£\Ï\0\Å2·Êš\Ä]žxô/–6s<^«²{o0þýpÉ®\ßM«Ü«z«\ëz‰{[¿X¹½\ëòû\Ã7\'N¹T\0\ãJ\æ\çn\íW3\åy[lU‚\Êù\áTŽ\âM7\ÏK—M^YT”{Ñ¾·gmBm0(\Z µ\è³k\Ëi\ç©”©¶\"X\åHôcLô+ \ÏUj©E¹¸°N2lA‚\ét¹\ÓdÄ”š¨ýEuGfY\Ò]ûD:´c	V‚F\ÃMÄµ1P¶fE&2\Ûm0\ÖVZp`¸/±2®§™óÄ½[_?K‘¸Qeh†£f\Ñô˜\Ù\æƒ\ä½1\n&Ë¬€r\ã€\ÐA»„,EH\n4HH¬‰ˆ˜+s<9\0P¤ …€Ü’\ë\"\Ü5Š›!*	L¤€rØ a\ätøÀ‘p“©DTþöŸ\Ïþ\×2y\'^ôü[\Ó{¦M\'¼E\ÇWsK<Z¦Ç¦Á\è\ÜoH¡WŒ\ÇÕ°\Å<¯D¨’Hh]\ÊÌ…\ÊÉ£`±_¼\ÌL°’²·H•(’Ç†‘¬Ë‘³\ÍU9hvŠ\ê(\Ñ\ÚºB^ú€R#£¢°Y“=-µÅžA´°\Æ\ã°d«	$h\×dX³s$!MU\ÌÚ¾\"´cw‘\è\î#ƒ•n\ÜB‘«\Æe`¡\ç#Ã°$›¦&\n\ÑU\'R²\Å5p©;VÌ¹\Ý_\Æz*6%\éls¥ÄŠ¶DKYEš\ZzöP}gó\Û\Ý~[\ÐÏ—»‘\Ø\â*’“ñL€vŒ1¸Ä’]\'\nqN…]7P9R˜,š\Î1A\Ô\Å\ä\Ú;0/&\"¬NS¤!¸A!#)‹\Æ+\Ì;¸b·ID\åP;ý½\áOC\ç•AÝ›»†gb­W³i¯KGV\Þ\\m‘šþ”„ôŸ\'\ÑÉòY:&\Z­\ÓrŒ,2ó4•vmudŒ²™ºÄˆi\ÕJ‹”/\Ëdt°pGŽ™¿½¶q\Â\Ã:B<‘c\'m\Ý–ª\0=M\ÃK+EbòØ©\ÐkC”(\Ü!`”ˆ±¬d\ÄZYp’GŠ\çjˆNN9Z0\Ï\Ð@HY\Æ@@!$\Æ‘ó,HN‰¢Q\âV¡,µÆ©’2ù¡s\Z··“•0´@\ï\ácr\Î\Ùi\Ç\è/<\ëMj™4÷3«ÐŽ–òž„¨ñ\Ò\ÃÌŠ’K§x\ãT\ÈðñSs*\'\à„@\Â\n` 2€”\á…#)\æ\àu\×JPª+7\nÀ\é¬§\Ç ¢|aˆb˜,\Ü\çòÏœö\\?\Öy\È?Ma÷«MÎšz\ì‘Šf\Ùr\\Š\É\ß7µ`½\ÂNñý#\Öò\ró\íj\Þ1°J#$º,\ÂU\Ùû\Ô	~xY\Ù\Ñv\Å\ÉÎ¬\Ýµ;\éH÷*\É*­‘57S&úµ dšÀµ\Ô˜1\Ï\Z=K‘ºR\Ùa„FIU\ë\ç‚`…­4EAi˜¨\ÕY¤„8\Õkó×«\Õ\Ùuh’\Í[r9 ­¼t„tˆ5|ƒW\nƒ¶µ;J~\Ç]t*‰¾f°T{¹ðõ\×ñ\Ý4µ\Ñ:›\Ô\Îg¤\ÙF¡t\Éój÷Ÿ#\Õ<W§0¹ôðp˜ˆ*•Š !œL!“\ãBQ\à\0Nbb$@€9DJ¼IÁX&C”‘Y­€8ŽâŠ&V!øŽ†!ŒÊ”l\ÕQ2ø»)[½·š½G»›d\Æ\åj¦±µD1Ï¥Î¤¹°v]\ÈB\Ïr=$ ™õE\Ê2jÎ¼f\ä].\í«\Öw²u«\"¼›¸Ã™(\ì‹3!*Áùh÷HÉ¬p\èÆ²¥\Å\Äu\à\ÉJ2,\Åá–„\Ë¬€wŒÚ¤„¨²eQ6¼\ì\ÅpWh\ÑVˆ\åo%—r:[¼P\ÔÖ½nVŠ‚¸¡\Z%G\ÍQ\ÙÜªµD\é\nŠw\na\Ð2\åb\ÎÀ„«Õ¬\Õö®\É…¦hù\Ùmj\ëI\èpózn™“ôx\ê\ëxý\ÆÜº&™\ç}Kÿ\0¬ü›·yC¡¹]®r(HÀ™\Ê`“Hb˜–)T \ÈE;2|\0	pJBSº‰•K\Îz\ÈS:g †	YxIÐ˜@\ÈL’¡j\Å9C\á\Ûw¯Á…H7?¯\à\Ön´Kxh\Ý—·C\'=P²\æ\×h‰”\æö\ìo’{\Î\î®UÔ¯J%:$Ï½‰°²­ø_0ù›ò\ï\Þ\ÇÌ°~\á£\È\ï€	j»X‡\î\ãRü\é#}mŽ\Ð\ë¡&Š>>2\çÓ‘8hùZœRx\Î\äj\ÙA§H*jn\éu\ì®-\ËÎ°6,±%Q\Û]M\ÜF>£I˜ªò\Êa\Ü\Ë4‰Y*H\ÙXª­ŽY±H\Å\ãR”øD®\Âfx\Æ\Å3fT\í\Z«\ÓóøöY·\ä}E\Í^}¯›s‘kgd°z¯Ç¾‰\áv÷™jôŸ•ô*\éVâš¤b\ãE‡8•LD„–)˜Œ’“t\"S£À\\‹9_Šr\ÇH^3ŽÀ=UO}\â_ex³Ç…¬¯\èy2\Ñ\Ï%+³H\Õ\á\íTi«\Í\ÃZ¥ª\\©ºf²\ä3gqÔ‹Y*v¶‰µ\Ö]%g \å ~þ6e4¼v‘\×L\äŒ\\µÊ‹g—A\å\È\í\Ãtn®]“g(ó)Š$;P\å—t«½9Kø–\Ö\Åù]2¢¢2F¸\æ\ì\Æ$IV—‰¬±\ÎSG\Ï]\\µŽ\Ìvò1¦šñœ;Ç²:Z\"»¢¤[Ê«\"\Íû\'d‘‘d”EE\Ë\'˜\Ô#ŸÀ#J7R\"Ä€°V\ÅP\íhx\ç‘\ÏL=Z\ß\\\èpª—¤°]¼¬^+R§n\ä\Ý\î¹\Åö-™\å\"÷“o­\ÜWo>7\Ó2\r6A@\ÉœQ!1,P0–‡)D^qHE\nA“ŽQ`b\nŠ\îT\0\épVL\Æ(^, Œ)©‹\É*R<\Ñ\è¯>wxþižhŒ;®\èüú®·Zd}v8û`²\á#lý)E>\å÷\ä¥!%)\Ö\â\rp¶£\ÌC\È-–)\á«\\\ÊÐ²\Æ\ë$„#–\ïc\å\ìªA\ÓEt\Ñ&Ó†\ÕVF=\Ë\"\Òd„Añd˜#S_S°+«+p±$t\ä®8AJt9AEœF0q]\Í\ç\ëW\ÏE¡\é³C=KAf©À\Ùt\Ò\ÍxC¼lŒ˜³{!c\Õ@\Û%\Ê#\Ð\éUAksµzY\Í^I±f‘Š7Q?\\ù‚°•»}Gwc\0Ü³\í\Ü|X®,\Úyµ«U¢ü·»\n\ÑY4hNM©y/Lº|lº[(SHE8„\Ã\Õ\Â¡	GŒ\0À\åaµI\ÊJ|¨HŸœ\0”\Ê\Ä7=\Ò#\Z%{Â¾\áð¿{‹V®HF÷y\Z^“l›u¦Aª›&¥”\í\Ï\n\ÊÉ‡¹8\ì\Ç\å÷ŒíŠ•\Üõ^\ÊNª/E“‹5\Ô\í\Û\Ê\Ó	Ž\Ç(·dõÌ§˜¥\ïÁ\è\Òù¾›~o^4ñ=Ÿ\Øòþp\Éô\ß>m®¾Ö¬ù\Ædk\Ý\ï\Þ^¼GÚ£\ëò\Ût“¨­rØ£ûU\ì\í}\Õ\è’\éNA]~œ…&V	­R^­3±g\Í6’\ã.E³\éŒrø\ÉV\ÈLi%]®7*«‰¶\×\é4”}\Æ3\ÏR+6†\í³\ìŸe^5:\Ä\É\ÅB«G\0¯^ˆ±ÕŠ7b·F…m\Èzžz\"jµ/\Ñ\ãN´e/\Ðò\ÕZmöy£&¼g¨p\"ô5\ÑV(©ˆ\ÄD’`e ‰«qM\ÏX‰Ü¨\\¤Edd‚q—!\r\'(™•Œ‘À,€S¦µ\Å|ûúóÓ¿Ã¥]i;—{˜4\Ë=ö\rƒ|±.8z\Âhºh4‹\ß\'\ÓK•\Øú2OZ¸ý›h\é²M\ãÕ˜\Ûkÿ\09)«¢jxu~\ÜÒ¤¤T:œ}†“HÓ‰‚r²š2¯mŸÞ¯\Ï\ãˆrT¼¿°¨Ë›\ÙôŒç™®|®þ\ìL\â\Ó.\Ý#(O(\Ók\ÓrMm\Ó\à\Ðu«<Ô­rP\Ü\å\Â\ÍÊ²d\n`\ÐJM¶„+¯¥EI†’9É·rÏ©™\Þþ&…œÕ¢u\ã¹Od.Í°\È\ä¤\Ïv®œ¥VúW;\Í;6\Ë\äö \ÇGÙ–¿	]²u=û\É÷Ú½\n¶3kª\ë->V.¥—lù\é>rõ\'œ:žzžúŸ=\ÙóV-3=\ÕZ¸k®w¦sú½«\Ú|—¢I\Ç&”Š¡p\"K\Æ\n¡TPR˜¤§\ÇH\ê!DLª–\Ê\Ü\"¨›MÁ$!\ÎyB€&)¸‚‰¹•2rh­¾}}ðok\\\Ö!ú]*9úmua¬ÝšX#Phšt\Ë]_6\Ã\Û\Öp\Ü5\ëò=’\Øl—œ¦w[Ûƒ\×=õs\Í\Õñ•\ÇÑ¹þk(®.—E~2}\ÙH!»Ã•­’^n\Úa›h\Ú%\Ùü§[\Ý ¨Ñ×·x\ë*ó\ËOGÇ™ŸjX\îw\Ý÷—\ê\Ú<{µ\á\ê\ï²ùƒFû$ˆX%±m\ÝÃˆÁòŒñ\ÞÚm¢i\æ\æ4°\Ãwòµšžh½.G£kY5Ÿ¡Í¼\Ò-o¨Õ—†”\Û.º°Y¬5Ýž¡\Ô\é\Ï$.·VYÚ£\Õ\á[\É\Õ\ÉR¯i–e\Ä+~ËQ\áÕ½¡ßŽ‘aó\Êz¹þ©i\ã\ØcV°fºõ™g·|GÍ¡\æ\ç\Ýo\ßU½Œ°x\\“„E\\\ä!\à\äG˜J`N`\å™¸ž„Q)\Ò0ü¢\0Us¢{”S0^‚U (‡+pðS‚’$U«ó\ã\èG‚»ü9Kl;¾¶,\Î\é[sM\á/jÙ§²;³Ë—ƒtû±\È\Ü!™Ýü™\ÝCm÷>w=«%\nÂ»\Êëš¾\î=\âR‘¶P\ÒvÖ—:4)0‹ \ÒsU²\ÝUñ\Î^\Ü\r6¡[K/¨T¥cX\Êr¶¤\Øf8?¯\Zj\Í\â_I\ÏùË±ÀóÇ°<\ÒóÞ‘õ\Ë[P´XŸŒ©¹õz\Ó6ñô\í™}Q\é/\Ï\ì\çÈ£¦z›\è¼Ï§jnpws9\Û+j´4|„•zI £\Æa™‚®(“\å«jbvÔª|ž¥¼;zü¹Yô†{n|\æ\"Z,„µxô¾‡\rGÀH<m\è|\ÎE%\Ó\àú›\×^k×¹ã–¹F\Õ\îÊµ\ìƒp\çô=Rþ\Ë\â½r|QVL\Ñ1D°ò+\0S\à!\ÒRCA€‰L¤‚<\ÊÉ´QT\é\Ç!c(U\'\ãršNšD\ÄeW‘\Zš\'\Ç·ñÏ¢\áXkS9¿W}¶«aª\è#„¹h\ì\ß@¥ux°´«i5\ÑRô³>>­r]fZ\Ù0òQXzRt™Ä±t¡•™z·ž}Ä†N‚I\Öht\é×©õ\é‹¥t»5\Õb$\Ö\ê—d\Íi[¥2«2ª\îñ_°\â—kk3h7<N™n\á¥l­%z\Ë\Ï\æÌ·\Ì\Zý;·\äò}¹ºM¾®}dW>ÏŽ\Zo¶|½~(7\ÕýgoŸö½É´›÷‰E³¢Óª[:§¼.\ÚgO\Ò.³°\î,\ê³„\Ú\âª8Qô\êÀ«¯™4M\ê\Çk\Ð1ß¥S\ìöeÁe¥£¶dŠ¬\èÍ©Ñ”\Ä\ÏVvsgB+S\Û\Êùõ£Szþw\Ú:>Y¿b³(J9<·z\ÃöNvÿ\0J\Ùk6\ÏëŠ³s£˜ %R?8J¤SQT)ù8A\0\ã\0¦s<*k&Ó\Æ#Š¡\ZVMÉœ$Ä°¨B§Q‚ò?®¼}\èø’¸®\í„õ¹Ò³qJÑ¡X\ÜöG¡Ï—\Ëk\×Î-M\Ýö›ª\ÄW¥zq\Üú\ß\îVzg…\ê\ê#nGI’3\Ñy:	1Š«Ub·ú¤‹~Yb:ù»\î]Je»\Î\ÌÀ\Í^;¾w5«5dÐ¶ª§\Ù\ÔÐ…°s½ö¡;d·™Qk:\Ê\çØ¼Ã¯>¹c^Ýµv\ídf8~À\ÑR\ÑxúY‘=«\æ}¸¼I§ÖœúŸ•ý°Rxþ¹KI°\ç·#i+˜5\Ö,¦Ç…\îóO££÷Ž§ŸóÚŽ£&“E\Õ3u-3\Þn\'+½\êxlûJ\Ç\ÐÑ´o5j¹´¯n­]šm^\Ûh\Øþù•iÅž\ì˜Î·\Ûó¿=ôŒ{_\ßÄ¸Jù\ßcË¯Gu]•¥ª¬ñ×²y=]z~=\ïŽõ¯\å+…2„À\åq\Â G5T”LœR˜1\0Gr… xÀWŠ ¸L«&HpðcD€\áV\â¨C£ÀUüŸ\ëO9õ9õ\\eÊ½\íJ\Ç\æ ƒ;ŸkŠšª\ì\Ü?IV”°ó;uÄ´\Ë)>{«z\Ó\Æ>ƒ\Ìýjný\Ï\Õ\ÄY›ªµ;uk>Šw|ò\nfc[§È¨û¸\é\æxÒ±¬Aô|ç—•¾\Äõ¼\í\ÛVkz£o´ôyõòw<‹úc$\àý>2ø½K™4hI˜\æË”yƒ\Ôþ ô~N\Ï\ïo*{‹{Uu_\ÉõO \å˜Qº£‡\ï™n¾w\ÎhFE\ì~SõžË—\ê~Ô¸\Ç\ïùvN†m¥Yõ®\Ç\'0òG¸üS¯\Ê\á—{–!\Ùòõ-*\ï2-÷ß}\à:x/½‹œr½7˜¶8¼\Zö1\×y\ÙZõ\îµ±‡X\Ôj6fÀ\î\í3\ÏM\ã|\ÉX\Ýñ½8+º}6V\ì^™\ÃvWc=ö‡Š½\Ù\Ã\ìjOy/-éŽ²©—HL!µLš„Bb TždŽ°¼¢@@\Ö€ô\Ük\Í\Öo`\â+*B9‘`¢Gb”\0ÁLX=\Íñ9\éhÃ¢¦2I\â\ã²)m\Ën\\ÿ\0jº\è\Øo‡«hùv·Ô müOWd’‹É¶\çW\Òo÷¼\ï±\ï¾{ôESjñþ>nÁETgCN\\\nûµ@Ü‘\Z5a\Ò\ãõƒm˜¼ljj›øÿ\0<=»ÁÑ®rŽ\Ê\Ë\Î\ìP uhz7Ð¬³øKX—°ú+\Éþ}ú§\ê>}\ê\ÏMc\Z\ß\Ý\Ý\ç«ü\ÅÙ»H=S5Ö³7§Ç¾>ú%\ä¯K\àv\ßVø+Þ™©µ²­Hò½·´Ö¦ˆš\Ë<mòek\ÛA\Ýó?<\ç=£S»]k˜û\rÌ³\ç\ìÏ©;$BaÌ¬o\Þ#HÏ¡iÉµ‹‘Z\Ê\á«7\rh\Þ#ö—}“¶ù\ç\ØY.y\çö\Û7³\å\æm0\Ä\É\ÐÒ½±ƒ\í^3\Ñ\Ù]‡´À\Ý\Â\Ã…P®Šr\"¬`*¬QP„Æ€´˜$\âñÀm^!\È\Ðš\ê\å˜„\Ì2L¢†V$\ÍvúD.c·3À=išt9>`ô-/C\êx\é8‰J\åy&\á&X\ç\é\Éßª¾o¢–¯IQªG\Öc´có×µ¾eý<\êq£Ô²\Êó;Ù´Ž¡#]9z÷ª¹®>2dúR§fé£¨#\ìá¦ªmŠG™¡¸\Õjº·\ZC×¦Y…v5£‡/nTš\Ö_³x\ÏO\'\Éþò§\Ò\ç›\Ò\íl]p=\íŠ\ã\ã6ùB¥)¹K\Ò(\×/žj\Zcšð¿\ÖO˜þ»\ÙÀô:W0\æ÷òºv<”Žr\át\é%®L\ÙZMfQ”¼%.R79®·Ÿ™Z³1¶·­%”\ÊVlö­:2\Ã«—\ÇýS\Ø\â“\'\Ü2Œ\Ê\Ï\ÏÞªó\ç_\Ì<õ>=\è¿?\ío¯§ô\\=\ì\ì“¾\'1DÜ·¥À\ÂFPT\Üi\Å1Dø\Ã…x !ƒ€€Q%­R!F)ˆc\"‰)\áO‰\äÌsB²¶g»\â=ŸW\Ø4x=\è4FJ\Î<eÚ·Ê¾\n‰Ÿps®N¥úrWŸ\è/\rcK\çPI¸{\ãªv¼¯Ð¹hÁ\è-qQ2Y­\è»\áeT\Z\n\Ìs)\n7BBqRrú8\ÅiPŒ½\Ù\ì…\æ\ÆV™µšþ‚´K9\èi_4=uá®¿“\Õ=ñ’o8½Tk†<\ÞõòJ2\ÎÖ©0\ÕÛ¤]\ïZ²\ÌF¹ gz9Ÿ2û[À\Ý?ö\å\äŸ`e½‰$¸´5_O®É vXª4\å\Îm\Ð\Õ\ÆÊ±ªÄ£lTYI±Z^TõT.qJñÏ˜H:7­\Í\Ã\ê\Î\Ã1Ó¼}\Óóø—¶<\Ñ\ê³dF)¶\ã4äš¡\èLz\\+§ü…\è\îo­©DTòL\Þ\Ã\Ø\×L+r\âq*g\Ç\Ï\ÌxK\Æ+NQ(¦‘`L\Ð*\ç\á\è;¸’$<6¡xE¢|aP0ÀRˆB’j¤,\0)«k\æ\è<õ=œ\Í;WÌºyXTuüÞ¾t4cW\Ú<\Ëz-û%¿•¤H°”\ÉÔ»\ÉGw?Ð–\ßB½e&XIQ}{\Èò¯Ù’tù\Ô^\Ï\êBž]Ú¨\Ûzqmžu_~¶K$ùÎŒŠ \ÔRkl™¿6h\ÛLf¶U\ægB3«8w\çvy¿˜7:§¹TIJG‡\ìŠ\ê>D\èºY\ëó\Z\Zv)`µ~z\×.¢\ê\å¸Í“\í6k9¿*~\Çü±…\ëy¯³VŸH\æw\å\Ög/~xºõ\ÈÆ¼–föÆ‹hMn\Ìóhª°´\Åe\Ú\'z\é\ê¬Rt|\îq@,\Ë00\Ü+ÿ\0\ÍoS\ã\ß-\é\í=ßžôÐ˜¦Ñ\Û\Æ-®*·\Ô\ä)®Ó´^µ„a+m£\ØÁn»‚ñ#\Ã8&py#\Äð©LE…]5D˜\ÐR \'LC$`e?ºQ@?+“\0E]8“If\å¹T\ÍI\Ùü\í\èl3µ\î.\ØO¥<å¯{³Œ¾o€ôN9£\Ï\æ¬]\éã¶º\åVmö¸o‹ºK}fÞºl\Â\ÒR›\Ú,\îJ­\r˜Îºz¼–ý)G¡›\æ-¿\èžk·™\ç;‹º^œºU\Î\åz½=5\ä:ê·¹\Í\à…c{®»\äyV§t©\Ó$…\Õ/=z\Éý]/z?\Ð[%\Z)®¬TngJ)\ÔKF¶j\ËH»½ö©R-m²+¶2Fõ\×ñ\êôJ5ó<Ó†Vß\\N?<~œUŽ—^\Ãi›\í\Ç\ì\ÝK\åõr\Üc\ß|NU\éûl_‹òb}ŒK\ä\"\ê~°!òr=oú\ÏòŠ0?\Ô\Ì\×\ç!“W´rŒ†þ,\Åk>ùô†ž?\Í\ï^\èqü\Þ\Í-R6§+·Y\Å\î\á8¢\Ú\àzµ[F\á“\Ü+¢0¾/ dƒ¢pøŠ	‰\Í\â‘D\Ï\n©ŠRPA\'\Z²\"\Ðrj—ˆpc¢£\0\î‰º\åR\Z¹E€r·3\ÇE%BG›4¶£\ßõPXŽ½ž\Zt;C\ìw#\å\íS$\ÕÅ©\Ñõ\Ìw¡\æM¹c›†mŽÊ²8»K\Ùkv•\Ñ&¼[\Ô\Õb–¯¸s?Í’K\ÖUYCeo®\Ò\å³$uÙ‹º\è\Ê6lò³ªK‰†!ºÆ–\Ä#½ \î\Õò\ë\ßTH\Ý_–´½i\ëc§ÀÛ²üú›æ’´D1\î!,7EÂ±nMö\Õ\ØÉ\n,\ìeQQ\ê-\Ïh\ÚM/F\\\î\×§“¬\ËS.ø\î‡Í½\n\ê\Åñê¾´%š|Á-\è&wëž³)o\Ø\È-žL¶ú!=šÔŠÐ™\ØC­VSg²©e›š\È[–>‘qªÊ²S+¹*dzŽG§…UÒ³_dÙ½M#:\Ï\ëvi—¦:ª¤!¼÷ž(c\ÈA\Åœ¬ŠœJUª+W8†%ª \Ò&\'M\á\Ü\áz”\Ý\ÊU*c\à@\Å\rÉ¨E±5\Ñ^µ¸\è™ù\×\ëùu\Ó=îš°:]F¤\È+šFü˜¶_±B\é\á\Äk\ÐVL\à´¯z÷\nMÁ.;”\ÓSð8»\Í;ag[¦Á\Ë3\Ú\Õ`gyw\r\çYA\ÒN\ì\ÎA3õhþ’Z(;U\æŒh¹3m‘‰”©Wmw#—\Î2tQ¯[\\:S¬Œ\ì&;µÁ\Ì\ÕÑ—°!c7FY_¼»ŸQ=ˆ³,\Ãx\È\Ö\Üú£ \Ô\Û\å\"a&\ÓsÍ´“À\Ï)«;H¡hn\Æy0	½\êv4vW A5—gSW\ã¥\ã³\Û^\Ît\Ø\Z\Å\Zn½! •b8­Y)úxŽ3f\Êü\ê7­\Ú-]£\'[]…´R\Ù+f9|§\nd\Ê(\0bƒ\Å+:@È°\Ü^Bc	l¬§!\ìP*„ J¢K\æ^(c€ó\ÎH\Ä`c«±4—)d9,}¯\ã·W¾¡|¨\èî½¢›}§„\Éa\íjðûr¶l\ØóÈ¡d(U“˜—’Wze½/~ù¡“\\›\æ2²\ÉI\ÏZ\Ù)FósP¿c6+\"’šr\È;NB\Ê\ËEl¤\Å~@§4ºŽ4=f[/-	nª\Z±u££h~…g®\Ø\Äk\çi¶¼#H\Z7\Í,´ôùºM«(\Úõ\×rKNa\Î\ì!Q”‡™¥¬•[h±}k\'–•ons\ëM•Z”‰u}rn\"ßš¾K4EZX(³\Z´\"“¸š\ã‡±TiŽ¯Xb(Ø¹˜\ãž²ñ«3\Úuž±¯ƒr\Ýò½ðPýB¯O¢‡\Î4\ê5›µœ\ÂÙŸ\åÁ N\î/‹\É\Ø (‰T@\ÅX™Œ\r\0ª ¥À	J‡p2¬X€\à4U3¼\'BP01€­tz‹NC¤Ä¥P×‘ŠO-–k\Åw\Õ÷uºJ0\édsør49ŸbÉƒ$’V\â|\ÂA„2|\ïN¨¹Œ»hŠz—M\Ì\Öló\\¼ü’\Ô1\×M6YO\êì–—‘›y¯6%\Ù]ª\Í[3§­c6\Öðh)›\\ni®\àö\Ìþù’\Ú(Ù¨#…J4\Ê\\\"Í›\ê<>¼Þ¯Ö¼g·×»\\W5^\rE¶c\ÒVŠÂ°µ\ØO]+\í«4·›\'S®\n]µZ\é…­2ù\ë\Êuè¯¨sºñLJB¥vE›8äµ¬K\Ö\Ù_³@g½¬\\”u+]¯\Ø`<D¬cU˜S®T\Ý\\]\Ûz\Å7X™&Žñz\×ùŽ‹’hiØ²­\Ä\â¸\äÏ‡ \ät:`%DŠ¥\'¤‚`Š—10ñk†/(\è\nHY>Lƒˆ™\á8 Š\"ÀH^0V Saˆ ð7G\Õ6ž™\ZÏ¥ô\Z¥*ûŽ6\ç}žvk­»&¹\Õ\Â\Ë\"\æb©\Ä\í»†\Éc\Ý=\Ð\ÃÉ¢\Å\Úí“‘o\'^‡VŠ•¡\îµK\Äs<³Ú¼ƒj²HÁ\Î_•\ÔõiM8,°tk\\­\äj\è°Á­ô\Ì|ž\Ü8W ³\Û\å\ÉHª¼D1šÀ\Øü§©òm|¦w\\¾>\Ú7½3\ÈÛ®m;Œa\nz;s,\â”s_1Gik\ç\å	úÕ©\Ø\ì\Ùüÿ\0?¯b¼\ä~ŠÍ·Iz\Í\Ò3ru\ìú§¦3\ç·M|ö}\Ö\Úö°/L¬ra[6Š˜b‚¶\Ô\í¨Œ\àE®jpŠ\'6c[µTm\åú3TÇ­v_yZº\ç\'¨”\Å\î5kó\Ì>A1\Ã\â\Z¥<kL\å\âDå€¦LPªA\çE`°‚9Ü«\"w¬üj¨‹”¤Q\'m\àHSRXn:K\0–…UEl\î(•¡.0Kyf\î³Z\æ/­}A\rx\ÊÉ¹j±š\ìf\Ê|ý#\'˜štú®ƒA\Å\É~\Õ\ã\n\Ù\åÿ\0:¹Æ²¸h¼\Ö\æVQ4NY+3\ãLó\Èi¦BE«kšÄ¥}ý‚Ò¬3›²43J\ÝV\Ú!`\ãªG‹2µÀ²N´Eñ¤\Ó^7\å\ÏnÁ_G\Ï+G¬3ý¨\Ól­]g3ôMþ_”\îVzS\á»!_z…\î\\\Õ¥¬S+]eJ\é«¯«XSMw^…°Sd\Ô\Åij¬º\ÕWS9¨\Ã\Ú++j\×l¾sH\Ð„p\êõ\Ìsôw(¶Ak‰yRFB\Í@L•ö\\SŸ;§\Ü\ê¶s=%9&w¸°º\É3v©²”ûšó\æ!¼÷<\Æ)¬N	Yx§tL‡#’\n¤¥T†ÁÀ)Xª•¡\Ó\\9\ë]C\Ê ó²%P\î7<\0Ô¹´ª\ØS)µ9\ØxGVÉ®\Å\ìhiÊ¨\È2¯bTñj=\ç<™…\ÊÄ®[	\éˆ9Šõó˜÷\Í|ü\ÝF}n›†U6\Ì\ËÒ§,²Á$\éŠë´²•!£ªÕ‰†4½\"£a\çN]\ÃDÖªH£h\æ\Î²ªõrn\Z\Ìu\ã+#³šJ¥ùÅ¹ðºw¦*\Äa\rY;²\çöi—6Y(‹9j\\&\Ã.Ø§6h\Ù&‚Uj–‘…’-,ªoQô>Jf3õ\ÈÁn¿b¡\Ï^–p‰|.‰X“€*C<,d…t\änb\Ê\é5k4\rœ\ï[:3D\ÝJ©š\Ó~\Öv.&5INUr¨\È\Õ\ÑªIR™”¨®‹C>­¹%Á\rÆ°&r)AX‚VQ«\Â	\È\ì‚ü;¸¢	9Qat\ë†\ë\Z§H;–Åª\èGt­9Å»\Ñõ­¨/=LŒ%,W—dž€Á-\æ¼w0•´”y\ß%\r)N·\æhµ–¿š¯žYr^µ3NÓ¼`µš-KÖ”)!\nÖ°\Ôtjš+Ò¾¡=i©š\r6H\Å\Zö*Q”ð\"­´²c*­\Ù+Í­/®\Ì\Îp¯¯\ÇCmgT­66\Ò{s\Õ\ÞÏ¼7Ô¥\çe²\í¬!;\r›I‘•:J\ÌeŽ4¬ê¾°º\Ñ+\áª{M³Bšbó\rŽ¶´g·\èT¥×‡0rDŒb­%\ÜbQ_’€|šºH\ndd¼K\ãõ”2\íÎº£kœ^ª£f\ng*‚‰Q•L\â°\r•K\Ä\ng…!ˆ¤\å\ã˜\0\àDô±Ãº\Ä/=\ÂU@\â†9AF†!“u*­\Ýg´b°˜¯br1dRñ/u\rMŸ;~ö\ëí’©+~»\ÓõCùó\Ñ{³ž\Æf>Lg!”\nÅ©\Û75\èt ,ös¢\ÇŸªX©\ØúM„\Ñ\Ó?\0ô\Å\Æ7Ô®\ÎöP^\ÛL<]¾¤b\îª\ÕeqcxT\Ñ-‹.bae²-¡\ÛÄvf\ÐXûòÀIÁH‡³b·\ÃD\ÛÓ¶¯\rp¯fÔ8‘v*\Ë$Y$¢%\Êzû\ç•{X™‚A´l\Ü©Z¡ó\Ü\ÞN@htEž©¬ÀXi\Õ\Ñ‚³–g=V\ç]Ò¡\ì+1ú¾F¶¥š¥Å¼x\Ô\ÑR+\å1­\Ü\n	Xp…Õ‘DùIˆ²,…\èÀb\Z²`´ˆ²\Ã\éÀb™DH1W\0æ°¦\î\å1X€\è\Å9UXˆp<\\…\äs”x9ÁE‡†šI\Øm4¢ì¾´W\ä\ÒÚŸŸ÷\\ù£ ¿•)\åi—…’KeJ\Ý\Ø\Ð\Ù(‹¨‘¶S/”\ï±L·t—Ô³\ë\ÅU\ÒR\Ë$÷Mn$[7²‰\n\Ât;r\Ï‘$—hfª&/º\Í\ç\Ó\é}žN™2\â\åU&fJí•¼^&\ÐÎœZ\Ê]Sy\è	,¬Q¤$2\ÑUjE‰F·r\í«–¢&›g©Db\ÕôL¢M­u3ÓªÜµ¹\çoU\×\Ëq’j…#W{aËªAžª–\Ò\é\×\ÊY\Ì\ÆÀ\ÆXU	f«¥\Ö\ìPQ\êiV\Ón¤\Å=§Qª\Îõ»¯5\ÉT¤†0=d-ˆ^*¨J)žBp\'`\ç\rRA1-\Ê&\Ò(b€‰LÀ\n¡(p+\0D\0\æ\"º*“\Æ!8	ªBX\ÅKO\Éõ&>.~¹Ñº\Õ#–\Étºó¸•îœœñZ*_w)v\ë\Ä\Ô\×	H9\Øò\Ñ\Ë\É\rU.uk³J\èùf‹Ÿv‚å­˜Yž\Ä\Þ+R:›¯»Ó“¨²t\Ëj›ª\Ä\Â6{ƒº\r\Þ\Òú›t`\Ìj\Óf\è0BË½o\ÞPVú½l\çÉ¼¯\ég¾noö-‹\Ä2@{-×ˆ£\Ú\ï,9C\èhLMv}–ccé©\'L-\ÛlšQpÛ«ñU£‰\Íul\ço+A¶ù\Ç`²\ÂB-\ÎMn]\ÅI\â\éO]amøµ¡Z¹\Ó+ÓŸÑ¥ªmŽ\Û/ É–7?¾\Ð4WJ‹#ûqú]*4zw\ìm\Ïs9\ÄT½Ç \âS•(ˆ:+¢b \nc\n`º.9dOYâœ¶BñŠ\ç)\É,Ã“\â€ë„¶€Pœ¬U“1	¨S)\Ì-;„‰\Ñ\Ê\È\à‘Á,@E\Z¬U°’¢8\æ-\ãæ’¿.!%\éVJ5\ÛZ\ÚB\ÙA¾˜òZ=\â\è%j\×P¾‡·š©u\êš?¯U ´\ÝFs0€·¢\ÉB\Ê76¥<eš{Ÿ\ÈÛ¨«Jy\Ë\ìq}\ÕMò^®fŽú>\ÃN¹û\ç\Û\Ü\Êþfz+tôt`Bû\ç;jð–\Ù\ë\Ò\Ãó:—öO<\ÛWÆ™?fz77 ð~«ì¹›|\ßÌŒ3\ë7™ñõü\Ý1ôº›£™ò.#Ú—´\ê|\ã{\é_Weï¼›Ÿvù>ø©ù?q\r¨mIús™\Ñ\Î\ß\è±6±”{3Ÿ]¿Ci,—Uñm#ª\ÚzüV\è\ÉhÕ¶#6\Ð3k¨ªÌ³¹\ÕDÅ½Aó\Û\Ý7L”Rs¦³§\Z/\É\ÛX™3\ÅH@–\0¦Žd\Õ¤\"\É\É\Ü<ÀSP’SRB¬Š„	ø±\\¢²fq\rÁˆªcª°C•(\â^\0LA(p$¶*¥[‘%C\Ë ©E•ZñV\ÓUoS–Yƒ†\Æþ¹\Òl¦_L\Åjô¾¬Ü ]!§!œµÚ¶¥•\éµ\ë¹ÁJšeÎ¬õ{N[!b­1OT\\\Ó;´\ç>]÷uO¦>_\ê›§tq\à\Ûd)¨¢\×íŸûµX}I§x“w·\ëœú\r\r|Kî‰œ\Ùe6N­u\Ôa\Ûö´d\è\Ù+rCe\ÚoF¿L\áJÑ´\Ó\ç\Ì\Ö\Ü}—\Þv\ì ºô.¹«~_\ë7s\Ü/M3\'-’·4\æŠ\ë÷ø\í8J=“:\Ð\Õ,T\Æó[_Ò³ý=jl\Í\ÃG•œ¶û\ÛA´Œ³j\ä+\Õ?QŒSºœ\Å#!\Í\Â\Èr(C9ÁD:\Å\0¥¸8­ŸøS‘B•Sª`±@Š\ä\ÝHH\r	x…§Hd\Õ`&®\Ò^R‘J¢X’F· òb(3\×h\äUJ\Í7O>ö²I=£\í¯ƒ^A\Ê×¢\Ý$‰jsöÑ¶GHÆµT\Ó}š­\ÊT_\Ó\ï:T\Æi\ÌÄ‰L\êFQ¢\ßM¾C¼\ÈFð–\0¸»·Mm\Ì\ÜÎ´¬¥:.“uW·ñå¢¥\æ\ÍWžxg•Ô©Ò•\à)Ö¦\Õôj\Ë­¾†¾šrh½2¼Ñº5¿>!rõ\îk.Ó¨Œ\Ì\0”ªQ)h¯©£$ž=MqŸ\ÐgkÙ­µ\Í#&\É\Æn°Æ•D±\Ôôcsµ\äû›´‹ü\Ý%Ty—¸\Ýb•x†«HÁ\Ä™ $R¸ \ë\Å\á`PVPÉš¹ÀuI{\0T`î„…P\Z\Å\0Ê¦ @#Éˆcž@U‹\Ý\Â\Â\0Š²-] Ž‘\"Â˜\nŠ\"bŽ°\Í\Ã8Ù‡7}÷Ð„-ŽW\Ö„’M6\ÙJµòT\è½^ú\é9­n\Ý.9^‡F©úu¦<­¨X+ZX\È&\ÛN‚Žkµ£tªT¡\\]\étÛ®Ó¹ekµ\á\ï\å°\îÆ¤\ì2N\"0)had¹‚·_\ÐQº‹«\Ä×¯*V\ÍZ«M~6F9hŽNe£sÚ¼rµ\É_*º>d×«“|›‹yö\Æ\ÜD\Íly™®¿\'V¸#Zº\Ò\Öô[>ymujóú\íØµ„‡Ž\ÞN\ãUb SÀ?Xœ¹‹\È*K\Ð@SRAÚ¦2J\ÐÜ˜–\Ú\ÉÂ›T¼\n\ÑC”ð€Š\è@C\'\ÆIâˆ®˜*q’V?qD§#©\ÊnK8\0\Å­\Ñ\èÈ”È¡*œR8y1IEÖ.…Æ\ì¹\Òn½\Ùm”k{¥»=³\ç\èY¡¥’?’V\Õ\Òu¬7GÏ·Oi[~².1\ÓacGñ|5¹™¯\Í.§\ru•C§!\nõ&\Ïs\Æ\ÏU\å\ìõ¼’‰j\éðP6W)d\Ì\æK\Û¦‹9jH\Ê\äj’´´´QûdWew$´v»°6Œ¡\äž3|*w\')2:©\Ëg­…†z\æ\nÜ¶{~t^ð¯k\Å\â3;®Yu²Õ_6],¢O\'\Ô(Ÿ‰2¨`\ètO‰\ÉÜ‹¸@!ŠÁ5›œ1€¢T\Éñ`1€9Q„È¨õŸ¸\ÆT¡\ÖEP\é&r¼9T~\ä\Ôe²ˆ xC„R\ÂT”¢S:I¬š‹À­\Å\î`£–.¨Ÿ3ú\ã\Ï]L4÷Õ‰^õvk¶qiK/S”»=[nò\Õ\Zk5{ýf\ê\ÍpÏ­¦hVj|\æ]²QG`\è‹¥M\ËÁ\ÈU²\Æ\Ñ%Ý›@\Í\ÍqÔšö\Ó\Þ\ãU¿0L\ÇG\ÛEšFüó6\Zü¡Ž«_t“¯HWE’œŒ\ÂYWÐ¢\êj\Ö\ÒS}eÄºµZ”û¥ž¢\Ùz\Õô\Äü¡úØ­r\Ùü\ê\ît\\¬}\ê\ê:q0¯j®*q`hò´|Ö¾ž\Æ7ÿ\09x&t¸ýy˜qt°\0±HÀAL\0\"íŒœR¦h\â‚b˜	±HŽ“ã™”O\ÄJ`¶·B®\Î/%0ò\ÄÁR\Ø\0\0{¸\æ\0€«€Î‚„V*fH0\"£dnIDT&\"È‰I\Zô\âG\Û\Þi~\çb²gU¶\ï~È­l\×%óûV]×ºD‰S%“Žº­o:º%²I\ê]\ÆUð±´‘×©	]\Ë\×FB>Xf\"›Mœº¿4q¥ši\Í¬\â6\Ó\ÒiXŒ™Í±\"´\æ\ÚÂ»\Ú<rñ^=úµÚ“\Õtkô©²M7ñ\è§UD¥\ËD\ÙeM)rÕ±D%B\Ç_»ŸÚ…b\ÌXö±¬\ìiT²CT»Y\Î\Ù,¼Ÿˆ\ïò\"”u93uR\â†)`9@ÀdKb¯Éž©Émr¨JaŒS£‰Šx\ËCu¨ (šƒ>\êf$~@z\Å(˜$)ƒP¢Tq%0`)À‘U5tPYÉ º:dpqL\0zfËŠ1l\×gÊ½7>‡gm\r\×\ç\èÓ”¹\ìû5™œòç“§w”ˆV\r£-±¶UZ“lÕ–ý%J˜<—ƒœ[†\Ó\æMÕ‰šMSFfúËQŒË¾ˆ–*\áAwu,2{óÖšN\É=T¶¶‡\ì)\Î\ß>«Ep–\È\Åx§\ÍMU¨0\"5A\Â*/]\ÄTVˆ	&¤Î›W_\"¯ ŽZòMdl\Ë~`Ü‚\É\nÃº\Ð\ß:š£ô9.=?H\Ö<¶ñh\á¯/©Éˆ\'EP\É(T@Dª‚bŠJq	@“ŠŠC\0\ÆMB€9$PœUCH£u\0\"j­GdT©bjÀ¦\0f%Q#ÀA\î3€\Ç%„„&r\Â-–E,M£¦\á›T¢NP\0]›£]C\Þp\Î\ÎJô-Š±†+@£%«·fÌ¯¸úz{º÷/A\ëv“E£`¦!m\Í!d£\Ë%·»]|]ok\0òs\n$\Ï/A\ã¨s6‹k.º\É9hÀvŸV± \Õ\ÏŒ‘®\à\Å\ÓV‹[!,\á¬,¥ˆ\Ã\Ø*\nÎ\×\ÑY`j\ÝAl¶ªŒTi™JÝ±qnF\ëF¼³:Sšó\â-Š³,\ÂÝ¤(ÐŸPöó#d(þƒÌ»	•G\Çö\È\Ýv\çA\nr‘\É($À%U!\È\ên1\â:ð‰V(dùa@§u\â”Ö§$¢@˜\äR¶)D\ì¦\'uŠ 	\Ö‡š·\\CWp	B\0Á@\ÜÐ¢\"¬p\0NI8S7\"Gv\í4R’*¦¬‘D²qD:\ÌÖŠ¿žýõ2\ÃA\Ë#\ÙHX›&¾9´žbÚµKþ?{\Ç\ÓÓU\\U®\×O\ã¢3™©žÚ´\ËNmx\Z%§ks4t,Qp\Ò9:‰L6q^§\È›™•\Ý\è\è#§\Ìv³Â­žƒ•z\ä\"ƒÄ¢Î¬´‘Ž Ë­ñ…vI\Ç<\×7\Zî µ\Ø \rJ‘Ž’³ŠÝŽ¢rFÖ—ˆ»›d”„wK¼£\'ŸÛ‰ö[ \çfy\Í\Ë\ß<ÿ\0Rø‚\Èy\î‰H\ÖHp2½À¸Ž§\á1\0@\ã\Èr\"H{g\0ÃÀ\Ê\"tc”SXrpØ«Š\0S­W|)T\çL\åh „H\Ð“Ë¤~‹\Ò\ä1u·\"j§³5\Û%\Ñ](\áLò<¥e[š+\ìSfË·d¦4ŸŠô’†\"\Ì4f˜i\åŸC\È-Qµ\ËVgj\ÇÒ±¯Â· +n}&ñ…hI~ˆh	®\É+Y±d\ê\Í5NC7F \×\ì±\ËÖŽ­\rlQ2\Ú)ž±\çs\ršù³W¡gñ\îb\ÈVôxÖ_Ó«\ê­D\èU¼ú b\ç\âÚ¶$³Š$:\Ð/‰8£G67µ«³¬µ\Ýf;U]•&¸òŠz¶\Ìv\ÉuŸc\ìEúoÎ¾¥\àjY\â\í\'(W…H!\Éb*\áº\È#õªª*–B¬˜02ª!SU;k9(%T\Õ\0­»€T†),C8\ìŽH¡…ñ&1BU6R”©91Q82gG\\6®\ÆmÞ´¢P’Bˆ‡:\n¢(}G·×´`\Î\ï½UŒ£\æB\Êi0w8yÕ®\â[ŠRñš\Ú%š\Zõ9Úµ\Z8ŒkW–¬ý\åµ\ìî¨—j:‹¦c9^\ëÜNb½¶jÄƒB\è\Ø+\Ök¤\ÔS¥,f‹\"x³R7oMºÙšNµ†\ÔöÌºM=\Ô	gY0§Jqõ¹„ŽV{\Z*¬G7QùÅ§³¦¾\'ù£\í\Ë\äý&8qp°w!t¸»–NŒ{˜ÙŒ½Sz_\Î>ˆóW…vÃ‰9 \Ü\ê@\áQÊ \è\0:.,Rq\Ð\Ü^\Èñ]¹\ä2#\Ö(ògœC\ÈS28\à°)˜‚ŒQe7pw\ÂZ\í‘0´Q0PPˆ<Tâ˜‡T\0\êJ\"E«\Äk±›W\Íë±‹Wm7l\á`/{“Z—‡‹|T”“\Ö\\@jþÅˆ‹²C_ƒ9mf­\Û\Ï\\L’\ÏbVW›nÁ%u“…LWo¾d³\Ëv¯h\É.µt.Su•F\Í\Ùì¡¶ô\æƒ%mv\æ4\ç\ÖË»J’\Ê\×&4Y·u5Š]¨\ËEujØ¶ö\Ú	‚+D’U Ñ˜Ç¶6N*\æ\Æ\ë=‡¨\è\å\ËNU¦¬¢ÁXjU½WòûO5‘\Ç\Ôl\è¶Ÿ*\Õ<\ÙL\èŸ\Ãð\Â¦!He\'\çB:Dðp­^\ã‹*\\»P‚\n(Š‰•O…2D\Å0*\àƒ”@\ìŠ­ Še’\î\ä±\â¹ (\nDL\æFn~5\ÈUS\Z\ì9\Ò\ä‡)¹˜‹]ˆ6|Î§`\ÂA›³$\\¢%©\ç2\×x½\Â÷2±\Ó[ûD‰›$º0“F³%7?\Ô3\\¤“3»s2Cª±\ÊNÂ©r€dŽsR—+–I&¶oO²\nj\Ô&ò¹\ÚõÜ£\"¹š\Òÿ\0?p[C–\Ë\ì\æY\äó\Ä\Z½±Luv\Ò–Ò¦rñZ\Þÿ\0:	n{D”	/W§[Š<­\ß\Îr\ä–\Zt”À¶\Zaô\æmˆJ’\ÉF\Æ\ësô¢Ý¾…¦ý#Aò«yü\é\"‘N\'hAYÂ™¤›‚ÀHUTTB¬[•2ˆ²ŠbB\nº¤9Y0ó\Ä\Ì%©\Ô\îZ*H¨[T ˆ „LI’@üD°Jt\Ã\Ì\Ü ¥OÀ=I‚hL­·rC,/öDŒd©´œ¦\ÒIv\r^µ\ÙPzº\ïŸ7ó²9Æ›ôÿ\0šú\Ò\ÅX´xÿ\0§TZ®ƒ%+ö·\ÏŸj¹–®=^\ÃP²h\ÄÙ¥\Ò\Z»2P•ŒÁÉ¥@\é0¬™üŒœ4­\Ë\æ\nK\Ì\Óy¦‹9–<£µ©ª\Æ\è\ë8jR‡©7±/ó‡0è‘”\ç“k\É=S\íªqq\'¬\Ç=6:Û²ª±tòP99‘KAS=¦ò>U\Ý:\ç§\ë\×»\âK>Î­•˜ùH8<³·ù¡ß­ù§Ô‡>oôO\Î~„\ïŠNWP@\Â\0‰±ÁYD\Å1­Bp\èN(¦Ax\ä\0‚a8@$¢%Bc\0((‰nUœ„TH`*‹	^ª\Ò\äu\ä–\á;ˆq~A\á”Ew7\r°UD\â\Ä\Ó8R\ä\ã;V²\ëv\rß³qÁþ£<Œ­X/\Ò>t\Ðýy\éò0®{¡ø\ï©<U¼†^²N”‘)P\Ðhúyy{\×/\ï\ç\Øñ\ë|ý¶‰V¶¦¯™K@\Ñ)‘\á\ëWe\ë[al¢*DRa ™_h£ÃƒY‡%j«\Î3)\ÖhöU\ÈÕœ‚l±Š¿]•‡;QHG>™1»—J\Õw87%&šil•‚\Z\ïŸq,3	Ó¾\"¯t£Ñ¥;5L\Ó\ágt\Û½ù&»\í\n\Ü9}/¢\n\Ò\í\ß2ú_¦Ç°\î†\â‰C:H\"ª‚}b‘‰\nÇ$\ÔI—“2¤¤\' \ÆJ@å“J&‡€DŽ\îR\ÂLœ†kR*À ªb\0(^3*n“ˆBqL\ï*\Z¶CŽ!ˆ‹”U\Û&)„l„\\0¾R\Ü|]\ê¼\æcJŸ‡ú\Î}-\îŒ\"\áŸLm\Ú\Zs\ÆýEghŽ>´›¶o\ÕúŸ¡Ci\æ\áVf\ï´s\í©\Æ{\"W-^|\Ú\á~w0|›Ò“\\	ô¬Z\Ë.ª¬\Ö\Ý\ÕB<|¡Ÿ&¥FœÁÊ•«ˆo2\ÞÄjõ“V¢2’P\×L‚´|Â¯†\é\à],\éj\íi \æfj\èÕ‹¾~‰I­#cÃ’Ö§m«>_ž1\Û-\îþQ¼e–è›¿¸>XúO\Íú?d\Ü\Ï=ò¦M\Ê9TT!\Äî šÅ±JSCŒ‰\Ëb¦*§YL\äñ`1Dª{¸\ì\0EI\åHUT\Îÿ\Ä\03\0\0\0\0!1A\" #2B$3%4C05Dÿ\Ú\0\0%‹Ñ®zc¦95\Íx¯=1\\Ž¼ô\ÇO}0z8\Íx\ès\Ô\n\æ±\Ô\Ö1ÓŒ\n÷\ÏLWºÐ»-,­)\Æþx\Ìù{™T›ˆ\á©õûu«¯”Ú¡o”i\áþes\Úü\àDmþIc,vºŒL-\çU{=Ä‘¿õ\Î±Ô¶Mm©‡\'4\ÙÉ¬\Z\ÚGLbŠ×Ž€QéŽ€\n5Ž·ùb¹£š\Å\nóX +\ï‘\Ót\Çð\æ…c¯¯X¬\Z5ž‚³ü^zg§Š4_\Ç\ÏLòsXéžŸj\ÏN+\Ù\é“\\P=1X®+<Ð¡š’h¢¿\"\Ò\à§ùÞ‡ÿ\0ù.™?St·?þM\Ò^~¦Z­^þ¥\ßLn>m©\Üù)buˆZ’ú\Æjý®\Ê\æ;­.{Ww{co¬42Yü\Êöÿ\0\Ì.dšû\åW\×4º…\ÔAu›º\É^TÓµO\Üm»™®:C\"•ù¯y ó“\×\Ý¼W?ÀW‘\Ó×žƒ5ž(g§ú®E{9¬\Ð\ç þç§“\Î(õ¯F(\×5\æ¶\Ñ\éë§³@\ãøƒCøŸ\\{<Vk=	=1YÀ\ÏB\Ã2\ÞAj%ù[uvþ\íû\Öùý²\Ò\á&±†ö¼s\Ú\\<Mk5I\ÞFŽ\ê’¤m\ìKT•­¬]¢ý\ÆÉ—X\Ù\ÚZ\ß\Û\ÏhCÿ\0b,LDØŠ\éX\Ö\áeˆ\ÛÊ‘&Ÿ®jš]\í…\ì:•¼Swˆb¥¨nj\ÏY¬Œ“€TŠó\\tó^ðzzñ\Ó0q¸\Öpzby(Ð¡\ç<ŠõC\Íx®+\0\Ö1Xõ\Íc§\Åy\Éò:\Ô\ã\ÅzcŠô3F·p\Í\Ðô5“Cš\Ï>\È\â….0<tÉ¡\Ô¼Q\ás\ÈûU\ÝÕµ’\ê)—ºÜ­S\êÚ„•#\Ü\ZY¬d±\Æÿ\0‘z•³µ\ã\ÕŽý	S\éP9šµ6\Z¬\Ñ\×M\×¡§6–-®?J0ˆ\Ëo%œ\Ðjb\æ\ÔÆ·Š¢a;$\à†G„À^ƒ7\ã\Ø\ê\ÒÁIóq³Jù\'\î\â\Ç[°¼He\Ü\Ë\ÍnaY=_\ÇüøòM(ùö(qY hž‡€\Ý\rs^…(Q\â¶\æ½H¡š\Ï\\f–†k\"³š\äô\Û×Žžz\nsC\Ãt\Å+^\×3^+\ïš÷\Ð\ç¡8\éŠ§¤­\Çô÷\\õ\Æ(µ3UÞ£e§E©|¹¦]O[Ekýz\æG–k«‡\í\ÝÆ¶Ú‚‚[Hºym­Zš	\"P\à\×ÿ\0¶\Ô{o/}{¤’\Õy§Kd\Ð\Þ\È$ø\î§¡o«\é/e0LÁ¢š•÷L±\Éve\"’ö\ØC,ù1}q{k˜²Ý•¹0e±”ýÁâ¾³ù–\Ý3Y°¿‘§r¾\ê\rY©y&³C\íM^hŒ\Örp+\Õz5Šj5\î‡Úœ\Öh\Z5\âOC\È\æ³\Ó5\ÆsCš\â…ž«<p<\Ðy \æ³G\È\ÏAþX×šôsMY¬\æ…{¯9\Íd\àY\è\0\é\Í{È¡\ã	4¥œ\Ýjö6-©ü\Â\í\ê\ïU·YnõF•™¡‘‚[9üt\Ýø7@´7‹NP\×}’’ñA.$X\Ú-½¤¶ºž‹y\áºh\æ[µš9#{û\ËY]7r\Â\ã÷\×t¡¦\Ë$€†v«<\Î#¼Sø\ì²¸œnc\Ê<ƒ4Ö³\ÄS/¨Æ”EMm•üú}\Ç\Ç~L÷B	m\åSQ.\á*m\'4sY+Óšõ3FPò:#Ž‚¸Ï®)z\Z?\ë\'4\Õ\âyGŒtÇš8\Î\r.O\n<\ZQ\äQ¢hq\Ð\æ‡L}sŠ¼W³ü9\ÆXWþ«ù\è<t\ÆO==.k€\Õ\Ýý½¢k,H\×RùB\ãòo.T uŽ\ÓuE¤I!ýžÜ³\érF%•º\âMO¥A0’\ÒHO\Øœ“¨«¤24mþIµžIke°mKJXe\Òod§0_ZÈ‰™\Þ:±˜¢M	5»ò ²E½«þ\"D\Î5(Ñ—Lx\çi£Ž;« v´Âˆ\Æ&ŒJK\Ëaucò[…š\×V´\ÔD&hŠ¹‘\ËY\ä6Êˆ†q\\WŽ‡\Åz\É\ì\ä’hq\\\à\Ð<mÁM{\ÉÇ³L8¦\è2hó^ÇŒŒú\àVk<f¹¡X¯uš¬óœQÀ 8<Ð¯X EdŠ5Šô+ƒ^+5\ç¡ð(ò8\'\Ô\\×ž’V­­C§­÷\Ê\âv¼\Õe¸~+m\Í\ÅC¦²›·n˜j;+V1i–Ø—L\Õ-…Í¾óqg4t\'š:¶»SM¦Á)ŸM’1´©¼/ýwb\Öc½]§‹cÈ—\Ùi\"42[\Ü\É¾‡¹]¢PDË™ÀD÷wø—d3\Ç™™Ã­½º†ˆ\Ê\×q6\æ¡sÝ‰\ÈAj-¯c¼·h\ä·ÿ\0\ío<ö3i\ß,•l\Ò‚G4JS+l? ù^+4qX\È\Ü+Žžýôõš¯~¨t+š9¯}+\Í\ày^h\×ñG§5\ÏNi|W¡\ã\Þz(\Åg4<R\Ð\é\åNwz?\Îk\Íz<P\â¼P®C\Ó \×¼^k…©¥\Û_&ù\ÄVB\ïT»\Ô\åh®d‘4kÝ¿³GVº=…~\Ùbô\ÖP«›\Ûs%\ÂÌ‡}é¥¿¹JŒ\Û\Ü!Ù™P’I{õ41’\Úd´±\Ëop²6øe)-°^\Ùm–\ê\×ò9·\Æ\á0\Ý\êÐ‹W\Ó]\â6÷·ò\êA(© ·“KU¸K@ž\Í^On\Êö’wk¶ý\í?*\×Ó°Ÿöž\éµZK+†“Cù\â\ÂöÚ¦v€&v\Ä\î&Q\È\Í{÷\Ôø>|”\èy¯¼\0xj<Ñ¡\à`P\ç ó\æ¸“^«\Ín\Åf°h\Z\Í\n\æ\ÑñŽ1@ô8À\é\ã¦(ñ@b¹éŽž+X¬\Zûd\n\ÏO^:fµ]b\ËG·\Ö>Eª\êõ,ö‘—¼VhSQž¤MY*1¨¸0j\Ê$¸Õ£\ÞÝ‚.\î±%\ì²	­U\Îom\Ê\ÝWyCZ\Þ\í­‰p’i¨\è-ÿ\0£’\Þý9­*÷Lü¸•!¬]\Ã\Ä\ä2I,–‘F\í&¯os{K+5Mò[\Å#›]f&1	7\ÙÁp\éZ\Ê$±h÷,5=°\ê1\r\Ë!m=Y¢»–^\Õ\Ì÷\Åswm8ü‹N\çr/­]\éß‘‹qªXI§ü†WHo\í\ç\n;«oö]µ\Í{\ç\ã\ßOg5Ž<\Ñ\é\È…m4(\Ð\Åx¬×ž‚½Ÿ?ó\ã¦@®zx÷\ÏL\æOK\ãz\0¡Ó€z\é\é°H¡\Íš5\ÎI­\ßf¬Š\ÏOB²)¥\Åjº\Ôvêš’\ÜMs¨K(ƒF¸¸«OJIø¼p†·†*”Ù²Ë°«j3Dd¾Wx\ï\ÐPº%ŠA\"j–\Í\\Mg,tƒp·ºxž\Þñ\\~)x.4\î\ØY•\Õe	s¬\é’Ûµ\Ón˜X\Ëø÷0÷ ¹»‚)	\ß\r\ÄxT™\Î-`G°¹U¾°¶‡¸\ÓF½\ëý»{d¼Ô¦\ïCr\ìµ†{9ˆ˜^Kÿ\0¯\Ä2“0žaÍ”¯+Áºž\Üvw¼\"\îšIÀ´’µ$a…tð3\Æz{\Íf¼#\äy¤ô_ò\Ýq‘X\à\äW¿$ó^\Í{=Ž€\×3ÐœP£\Íf±\Ëp|P\éÁ5š\æˆþ?ó\æŽ3§\ÏO5\ìySTÖµªGc³¬Kvÿ\0,‚\Ö++d¹\Ö\à\ç^¾e}CRjk»­ßŸsQj÷ð\Ð\Ô\äj’\Ùgñ$ o\"¥\Ô%Siym,‘n‘YDR~\Ýeo-£À\"·žÙ¡™\à’9m\ïžXä´š\æ#·½ý\Â\ÉmÃˆFÒ«›92«-»cSµ\\Z[¬\Ét¿\Ùo-»&‘3ˆjL,ö(EG„¿¶\Ã\ÅvK\Ëa6ò6\Ë.ÿ\0\Å{~þ€\×H¶n­<\âe…b¸Š4œY\ÍÜ¨5\ÝZ\ßZ\êq\É%¬\ÂH\Ú\à!\ïbšt \Ê\Õ\ë\Ðh\â±C\Æ8ç§ºMy¬òÇ“\Ç_Uš>E„\nM{£\Ó=Jñ\Îkš^€ôõ^üW¼\ÖEkŒ‘\Æ9\ë\æ‰\é\ÍgŒ\Ò˜«^Ö¢Ò¡\Ô5y.¤”\Æ\rÖ±mw¯)\0œ\Ò\ÐÒSé°µ> £k$uƒPýYRG=¦g–-„\"\æ\Îý\í\ê\Úò\È`X½©6þ\ZZ5\îœñrõß“\0Þµ²EyP^B\Ö\í˜µ¤\áe²÷Z\é\É\Ä.ª&·\"˜v­nu<¢²ƒ¸\Ò+~\à°env\àúErŒd•cu»ž[˜c·e†\àM%\ÂÁ2\×nghm;‚\ÒÀ\Ü)\Ð\'’—BeHluE¹\Z¶³e-Ÿ\Ì\í\Ø\Ú_Z\Þ)úù¤4\ìpW5ºˆ\Í5\æ¼\Ö8þ5š\ÇOq\Óâ±š5Á9\ÇE“\ÓÙ®GLt\Å7žEb‡\0Š\äÿ\0MŠ\ÇU¯\0ñ^O¾0(xyþ\0«\ÍE\â_\Ôg¼¸ž\ámQ\î¯\'f·f6öX¬L£ÿ\0b”_f=>\â\àþ\Ù$2…h`Üºnž\Â\ÏI¾ž\Îói“£‰¬™\ZhXL³=fu‘gµ•\ØMgIø\×Júe\Äu^£=†…W\Æ#x¡’¿€†\Ü\Ä\×qªWg*\ë‘	\Ê\\[®n-`{M\Õo%·µ\ï\ß<`O\íl©h~\îOr\Ë\Ð@¯Û–r,¤\ÛnÁ\Ì\Ç%is“}{,1@\ÍW‘\Ýö¯4\Ü$\ÉfúW\Ë5+C¦ü‚\Æø!…`š\Æ+\Ãs\\\Ðð?Ï¼ò\rXâ€¯š>W&¹¡\Åb¸ø\ÍsY¯5É¯gžœu>\Z›\ìG’\Ô<ù£\År:r(Q£^ƒx¡\Íc¢Ž<ô\ç§üô\æ®$\É\Ö~K-ö Óªi÷3„¶´·\0\Èi,¤–£Ó—r\Û\Æ\"š\ÒK™?d½c\Ò5­ñiZ…¤cBž\î§\Ó\ï-eüQZò\Ý?7PjW!6\Z,±\Íñ\ÙEMgÛ–KI†vF‚VÊ¡Ýž61\Ä\ï<\nÄŽÿ\0·-\èµg‰åƒ³H\ØIj£\"\Þ8ò¶¶l§·Ü»šß¸\Ò[š\Ú\Ý\Å\Û[l[˜$b¡¶É—f÷ú\Òz¸‡ñ\ë{¹2\Î\Õ°D«©•G\Õ\î©%–J¶»\Ô ¡¬ü‚$“\ä$/{i-4,\Z\é­ntO’\\”µ\Ôm®€e¦¬\ä·\Æz¡^‰£ž™£‘\\W°6Ð¢GOm^k Wƒ\ã¦k5ïŽ€u5žœ\ç5ï§¬tòsX¯u\ÏAY\èq\ÔV\åP\î>Iò·†s—’\É%½Jó\ËH†­\ØFÔ³\Ë(´\×ûú\Åüa\î\îÞ“^\×\ãZ\î¦JjZ¬%õMX\×\î—£\Ô5)\\rß±\ÝO(D9\Ëø°È’i\ëø\ê\Ë\Ø\á-™‹k[À“Ôºw\á\Ëgn\ë6¡§\ï—aºµüs,\×\ãñ‘k{[\æ\Þ­\rÜ¹‰…Ô¶Ø©\ìB³\Øl›´\æ\Ê\ê\ß2Mm˜t\Ë\"!’\Î3[´\Í\Ø\ÂM\ÛV$oxf\Þ,vQ^-¬mš6,[O‰-¤Ó¢\Ùmh®e²\î1¶’\ÖmV\ÅZ_s¦\éç ¬‘CŠ\Å\Znh×ŠóGž£Ž¼V1F—ø\ã \Ç\Ö+Š9\éŽkßŠ>y¬Š\ËW¡=b³Šõq\"Â¿&ùK\ÍP«1ž\Ö]§ð`^\â\ZN\Ô\íøvÛ­l‚¬Ÿ\rO¬X#\Ç?\ä\×á…³ŠTµ¨õV¦\Ô\å¼+øH¶¾Å®?E”mVö\\2T¥´;Õ»gKR²h­\\Y‡¨lP´[ª¶‡ñ\çšÀNc°\ÌqÙ’#·\íˆ-\Þ6»±Š¶\n–°Y‹{7µ0\Ù\Ü\Ù\ÉkZs\ÍwÝ¹š\Õrm[V¶·kyŽÍŒPZa¸¶Ü²X2\ëi\äI-¢ V’:X.d¡auQY\å—ñ\ìÌº®¥p\\kd[\Þ\êŠWX\Õ\Ü\Þ\ÛMZ”Õ›k”G6Õ§^\Ý\éR\éú¬:¼R\r¸®z\n\ÅžhW£\É\ëæ¹ y&ˆ¯uŸ°<\nð¿o\ãŠ4zŸ\Ïx\è(\Ñ9\è3G¦hduñY£…:–§o¦Ã¨\ëWÿ\0 žk„¥\Ïô\Ï}g›¹¯š=&%Hl¬ˆÿ\0Ò°Š’^D²M.£-¤{—U³\ÓE\Ý\ÕÖ£-¥ƒ\n ’%[XQBZTû\ê(„T–bQ–\r.BË¥<dY.\Ô\Ór?oz¸\Òó_ˆL­¦\æ®m\"™\í \Ãh\æK|Q¶\Ü\ÑX®;²š\ÛdcLþ‹{0\Ë5–¿lEg·\ì\Ëø[\ÓñðKUÞ˜;rXmV\ØüI!««¥›ö…‰otø!i\×{£³0™/\å\Ý4“³öæ­¼wNÍºK\Ù\æ¡xb\"\Æ\è\ÜY˜Z\ÖG5isgwE%\Òd´Ym„\Ë{b¬qŒZC\\¨…y¯ s\Ó\èó×•\àWž˜\â5“\ÐQ\Ïý(\ÇCY\Ç@3^F:-/C\ç\' ¡_òNÑ­k¶š=´òj\Zýñ´²\Ñ\à\Õ5…’Qpó\0¡0Zš\î\Ë\êr™“Gm§$õ1\Ç$\×2JR\Ú}–¶\0´v\ÍwP\é\Ì\Z\×NjƒK/I§\ìXôöÜšXA„iVð.{%E–@ñ\êÁ\Óâ¦´X\ÅÍƒ‚Æ„[\Óð$EA*+~\Ýve\íw\0\ÚU²°\æž¯\Æ\ÏkvÐ–h\Ûwj\îË½·Kx¿ç¦³\åµ2Ò«3¸—º+ »¶¸W6—_¶I \íi¶ômH3_‰$uøv®©\r\ÂÀ’\æ\Ú\æI-¼\Ù_¢Áos&—.‘y²D^\í)\"…\nóX\Æ\rMœ¯y\é\ÅixÂ‰\Ízh™\ãq\è´cð\É4Çš÷^zš\ätðÀéžžzæµZ-*\ÚQw©\\þlZ|w7WweŒPUŸ\å\Ö3me·R\×Ai#¼¹kmŠ+k\Zˆw%¾Ÿ#Ò¤’OÛ¶­­ƒlŽÊ£\Ó\Ìa-\Í5¡\n\æ8I¢¥B÷ ¿R#V¤N\Ý¡ò\"\Ëö\íRý\Ë\Æ	Â¢\í/F1R.h&ž•¦\\´‘.B«VÁ>\Úkxž8\ãþ\Éb\\´Y©¡\n³¥= q}§Ö©¦Y\âÔ£c-Ð£xPZ_Ù³Z9j²Š)K\î†a-Ÿ\ä\ê`‹˜Í”°\É-\Ä6Á.\ÓM½6\ÒiK\"°¥úŠðAŠõF¼P\Æ1šô<x£\ç=r+5 r}cø­\Z\Íc¡C\\×š\Ï¬s^(dV1@t=|V¡}oam}©\Üj\×ww\Å\î$s÷z·±QQ3\Äf›I0¶«¤[™5KS+j[\ë¼òU…›H\Ö\ÚR\æ\ßL(®\Ãgi´%¶Á¶)\à\Êv‚‡Ü¦9wx¢Ô‡ôQWk*ª¨G 9\Â\ÐtR€\Z# &ð¾Jd\Ã2\Ôg5\Æq¶±¶™±_\èsLI¤ÿ\0$…¥IÀ?z*@8b\Î\ZI—´m”%x¤«›Hóªh­5^\ÙGnY,²ö°ŠKRL\r$B\Þö)¡¸\Ó{\ížÀ\êV)©ZèºŒšmÜ«øs\Ý\Éø\×\Z]\Îø­®c¼¶ö_\0\ã\Ç\ì\ZS\Ðø\"³Á\è+“F±•¡Y48\ê(W¬sƒ[H¡É¯\rx¡\à|g\Éâ‰¬œð5\Å\Z»¸Š\Ú-w]º×®øa¸¹\î\Ö\åD‡cWvYjt\ërw®\Ûj\Ø h\"šj\Ót©]´\Í\âY¤t!l\ÇjdhmñQ&k¶e¥?\r+±ª¢pH¨Š¨—l\Ò\Î\î¤û\0£?\æ›*ñ…k¢¤\ÔkŠ+ŠvŠh\Î\á\á°+a\á\ã%\Ó;1J§#p“ˆ£F¢0\0™AZ\Ó\Ã\Ü7Õ¬io,6\íg²\ÈmÜˆ¤@¬A³\Õg„³iú­º³\Ã6©¢š\Òõh. ‚\ßhNt­GJ‘ š…s[¾Þ¨y\â†v×ª\'5·¯º\â¾\ÛOL}zƒÏ£E¨“\Ó9¦:ž:š\ã\"¼8¯š\êMw-´ñj—É©J\Ó\Ã\Z\ï/Zu”\×Hö\Úp¸@*OÈ¹hlž\ÜÁh%m\'Er¶:ZB°\Û‚\Ã 	Á­\Ð\Ø)[\Ã\"`¤`0]µ»A+RŠ¡¿\í\â\Ü-­LN\à8´G’v\ÖY™S\ÐRk\×À\Åy¤QX\ÛLKJ\Öÿ\0,¿MØ¦lƒ[ð®Œ	\È\r’…³S&\á&pœ$Ñ©Eµu\Ý!nk	­m	°FCh†\âf\Ód€\Çš®­=mn$·«\ÛlOcz—k¯\ÅgA½:…Å‹÷m223ò+\Ðó^³CÇ¯T8¡^+ÓŽ†‡ðGC\ãøÏšó\Ðc«£\×È¯4\ßQò\rj\"\ÌIõ¼½kÊ¸š‰\ÛV6\ÛÅŒ2\Åok¦K3^,Y\Ä1‡µ¹žm#CˆÖb±¬1*\Ð\ÝQ¨41o\Ã*\Ôro*\0¡+k`-m$ª9¡Z	_\â¿\Ã\áEm\\ª\ÐóÔ‘å±ŠzŒT¹Á\Ç8\äV\à´y 2^\ß2\íY5¸Ô‡wPn\ÓQ9¦©#\á—%ö\0·ÚŽf‹‰\âV­wCYá§·–\Ö\æ:{š+)\êò\Þ[£¿ZŒH\Õ\ÝEºSø’\Ë\Z¯\Å\'{{\ë,1n:qC§’hWš¾’I8\Å\0:cŒñ\à­\0(\Ðhs\Ó\ßðözŠŽ†¹®\ry¬ž\Ç4\ËW\×)i¡¬\rB\ëQ¡\Ó\ìLdÄ¡kO…\êþ—÷ÀMÝ–\îø\çJ²\ÏceA\nšp´¶\ê\ìE|RÊ¦£]õHJ®)HJ\î\r¦@´X`\0i	Ä–\æB!û(Z\ÃaG\Õ¸¥\0ª\ÓJ™;¢\à\Ö²¹úŠ8¥r\n…–\\Ô±±gU\Û)(v>#\0\î®\ÞóR5\èr\Z>W\"Y\ã lL¹¯h½\Å;c}.e)§Ü±xš).5­6M&¦’;«+\Ø>ñº\Í_¹;om…ž­¥†!\Å\Õf½ðºƒŽEg \Î=Vs\Ðôõ@ô¸Ÿ\á\Ï_^k“DVy<t ==b±š\àS¿\Ó\æÚšEoi\îzŽ³*>¤\ê\â„\'eœvŠ‰–Ò™VJKg‘ee%Ö™n»¡ƒe#\Zs3Y3· \á})‘³AÁ¡¿.\Õ\Ý,¦\â¼\Ñ\ÅFŒk´h2\í\0P8¨óC&•I¡N €‚¶ýp2¨	\Æ(¨\Æ1EMc4Àme\Å`\ntZx‹Q©ÿ\0\ÌJ\È\Ñ&)\Æò\É\Î\Ú#u6\ÃGp\ê³+šv\Õ\Ä4zþØ‘n\Z¤]þ\çia}+\Íôf›O\Û$¸ŒIß‚\è\Ç>¡W:~\ÝMsY¯gš÷\Ð\Ökß¿C\êy®0hbððq\\×Š\â†+\"¼\nôo>úr1^±\\\Ðóâ¹¬×½F\ê;;]FY/\îŽ\ÔmÙ¨\"\Ü[\nG\ÚA$²_\É{uƒZ\Ë\"¤‹¤\Â6ið$+y¥MšpÊ’n]¢†\í°G¹r7#¡`üý‹4;\ê\Ú\Üe\"ý0vjq\"Wq\äeŒ·4Lm›j\Ækœ–À\0‘µvö\ÔVÅ­®\Û|cul¬\rÛˆ£\Í0lf§—\rR&\Ó \ÝEsXúôuú•p\î6T±¥E)£©3ZÎž·P\Ý\éý©47’\Òx.¥kk©Muw\ß\Ç$’À÷ñ›fø\Ùº~œ{*\ß\èp^½šó^k‡Of¼Ñ¯=phù£ž£§Àx£Y\"€\Íf¼×ŽžSÑ±•Lo\Í\Å\â<÷b\ã\Îò8#O³\ÛQ\Úö%ey\Ú+xa]CQIª\Â\Õ{:lpª\áu\rÂ‡\Ô3a57Ü¬K%núG\Z\n\àˆ\Ã\nH\ËV\Ì\"ƒ´Á\ê©‘Ie„!*›‚VÓ…xâ¸¢>ª\Ê@…T\ÏÉ‘\Úr‚$\Æ\Å\ÜQZ¶]iQEmûË¦h\åiÕ;¶Š\ìõ¾®\n\ËnŽu!\îSñN)\Ï\nø•3_\'Ò·TWR\Ù\Íñ³G©c\ÞeI#ž§\â®f\Û_¿#‹…|5Š\Ç¯g\Æ3X#§zy>øëŠ>H\È\é\Ç\\u÷\ÆM{\ÏOB‡=3“\Ó‹·i«\ç:—b1gšRÔ‹Ø«h#j‡\ZmŒ..œ¤z“e U¶{%›m’\\>\êQ{Œ«µ\ÞE4¡©\Ô\æ(Ž\ßsdÕ°V5fp1\Z\Õfœñkƒôl‚Ç¶\Ô1K`¨@€\Ñ­k–ž\Ë—Dö­B[E/sL\Ç/4\Ì\Û;˜\Ò\Ø<‡òwf*P\×\ã’1G˜¬Vˆ\Í}*\î¤_Ua“ \Í>\åii©‡DP\ßÛ‹„ù’\Ð\É­Cvñ<2E,6\×/kr™\Öò\Ü¿6—–f¶‡Ž6\ß:û\Í5\î¸É®iº{j\Ï@h\Z\Îz{\ÏLtÀ¬dž†¼‹Š<t\Æ:y®Iôre‚?“j²µ\ÌgbÛ¨¢\Ã\Û@¢[Tx)2jkˆT&\r»­\ÕÝ­ahÂ…$ô£e+.Á\Ä>\îÄ³Jp±BIq[Y6(2ciShZ)G*¨h„\Ép+{š1‚»\ZU\Å2òŸb¹¢k×¢¹¥<ga\Ïl\Ö\Þrv\ï\ÅG+\Z2`6Ö¦Së‚€£\0È¤šõ\Û\Ëc\í&Ô©“\ìWe:Òœ\Ô\è\Ä£­\é¢h/´ñ§\Ùl®\Ú\Úk´auÛ’\á‰\ã¸ø¾¨5K;kŽ\ä\n;s¶Õ¡ƒ@V+ž»kš÷C¨=\Ð\ë\"¸\é\æ¸\é\â½{â‡š\ÇLÐ£\Ñzø¢\Õõ#\ä2‹]Qcu}3s\Z5ZŒÕˆ† ´k™c³¼½7S[\ÚÕ´3½Z¬q:iB5/Ñ1­¬i¾Š~\í\ç¸û=BFŠYP­<j)P0E9?\édþÄ}lU¥m²\n\ØÆ¶m¡\ä\';@P\ØT¶+e«m7úf\ËFw®\ÃEx+‚‚;Y–€SE\r*l¯±;	¯\Ãuy#*ò:\íi¸7[€Ú²Á*\å7\Ñ¦B‚V¦R’Î¹¯iˆ^X¤Rð®-n\Ú5\í\î{/ý¨.r³|V\çð\ï¬0É‚ôÈ´@º½Pó^iüûÿ\0ž‹\ç“\\\n\ç>\0ð|ô\ÅqDW8\Û^z‡Š\ÇAÓŽžk\×\Î.ƒ(&‚Û¹NË¦&K…5)¯5++)o¯f¹yõY¥«.:|PF2¥Y\éwS\Ôx\Ï%ùH\Æºð2_\0V8LPò«—\Æ)d/x…½\Z¾\ÏJY_–È£±†jFwnHßŠ\î-eZ¶VÀ)‹\Ö\èñ\Ü\Ëš\îš\ÍpC&(\ãh\n)óÜ§N~Ž\Ò\n6\Íõ8+\\Š`R¿\Ø*s(&¥™Tšd\Êê–‚\á5[ÌŽ$‰¿ùµ»\â­Ä‚{\Ë\\ÖŸ:Iqñ›ô½±\Æ+\Ùq^(ùó^‡\ÏP8÷ÿ\0#\"¸\Ç41^ŠöG_4(x\é\ìš´\×9sG§Š\ä‚+\ÍX¯\ÔVÛ¢Ë¹¤¾¹\ÛV6{Z×¹qF\ãñ\"ùû÷rCg+mgTG5n¤€£u¸\ßO\Ë\É1\îZŽ6yA¢*% úŽá¥Sp\rÀf‘BS\"5ª\Ï#Æ‘•F‘Qs\\w\Ù#\Ù\ÛUn\ÐÞˆÆ°\Ùí†®\Ð  ¶F\0\ÆÛ€vn[q Ž¼F§©K\ZGgSV\ä\à§\ÝÖ¥ˆm‘p\n\×\Ø\Ò/ö>\â]F\Ò7\Ö>Ò£\È\Z±W1‡MM1Wšz\ÉÚ«P»—ûZõ‰Ž%dŽj\Æ\ÏP;O4hV8¦É¢+\Þ\r\Åx¦óŽ}\Z\Ç\0p|óX\ä^úx\à\çš\Ís@š==W¯Lq_¨óƒj]Ö‘bx\Ùe6rdM{-\ì¯f–õsb+K0\Â\Ú\Ýfx;]\È\âP£ŠS‚­ö\ÎFr±\0hr\æ *8òbÿ\0I\Z0\í+Œ\ZŽ2]ú™]¤J\Ûý|ž\Ø\ß\ÛA(\'\é[>\ÂeT\Í\0¨B\Æ\nÆ«\\ƒ™T\È\Ò\çÄ©H¼l*€;Ž£ ²œl#€À\n»¸\ÚÚ¢”F\í¦9$\n1Š\ÝÛ§P´ñ«¬\äT\Úb\ÛL´û4d\Õò\â+­\Z£¨[\\#\ÂÖ’w`œEso§öGy¿@Ô¿:\Ë3Y®)y¬ó^:·4k\í\r\îó\ÔÑ®2|×Š4:\Z\ÇòñY\çš5š2\ç\ëú‹y¾ò.Z%$zº¹´±C;¥½´`\Ì\Ûacy\ï\Ê\Ì-\ÛJp\"\ê\\\ØU\Þ#R•±Ánˆ\ãS\Â}™‡N)1\ÅXŸª¿nIK’h²\áŽ&¼²ö\É\ÛAf´DT`o)÷9P±\á\Ú5Šl­&\í\ëAŽds†a\\\Z‘FNv\Ø-²N\Úá‰­ü¸5\"\æ¥É­¬õ·&_ `˜“´\"~—ë´š¼\î\Æòþ%Á\Õm]\ã‘;O§)Y÷É¤«LÚ’\ê|R\ÝHx5ç¡¥®3É¯u\èŠ8¬s\ä\n\æ±BLsŠ\É\é·4x¡\Íx¬æ®+\ÍtòE(¢:}jgúü¶Nþµ•¶[0÷R.\Ë[;N=Ë†‘&¼»¹wb,`‰¦\Ç\"W\Ì\ÍÚ¯5o>)J\âÛ‚„	\'˜˜\á@\éÿ\0d®À\"8\Æ·\ßpŠ5\ßÙªBwnœ.0±„P[_ÚˆW;\ÈbS\í\Ðÿ\0¬}·’$—	» »úˆ\Å0\ä±.[\ÜÊŠo±”`\Ä_3bšM´Ud®\Ñ+ý˜S\"µ\ÇLµ4E©ÀA!d­‹¶L¥/m…õ¹+¨Z‡¨n?\"=NÍ­n­$ÿ\0õh«¬1þ@\Ó;¶VW\"hŽk\ÇO?\ËVFN£\æ†z^E/“Y¡F¹þc4|Šÿ\0š>i«9¡À¯X5¨\Ü%µ•\Ã5Ö¡|¸¨7MIrHš\ÓG\Ò#½¹ž¦\Û1L®`´ši¬-Ü¯u-[ý2 bK(Ri\énŽk`@ai*À\nÊ¦\ß£_\ê\æ*Â°e=\Î]\ÉlG0\Úd&˜I\Z€û›”-+î¡p\Å3\ÎV”ò6\ZÈ¢I¨gvß±]´b\Èc´ý·ø®T•5ŒT¤\n‰¨\çp\Î\n†¢¿wVª<aÑ˜dxR­E,m™.\"Þ­•¢»ªFú³9¯\ìÌ•~”»7j6\Ísšv¤”½«Y\ÉÛž\Â\â\ê_Y¶Ž\ßT\Ðn¬›¼\Ö8\ã8\âŽh\ÒñX=GOC\È\âŽhƒŠ’‰¡š\"‰£\ÇOU’:¯‘\ãþy\Æ	¯’KzvŸvµ-‚óã–¦iã¶‡÷MJ\ë¿s\Ü6ªn¯\':}ª\â8”\Äo^U¶€¸\'‘[¹‹ü@\ØgË¶Ñ¶\Ý;qS\\v#µ¸\î/\0McœY\äõ¥\×2\Z5”\Ýõr€¨E\"\r»%¥Œ’aaF6¢¸B\ÖR÷\'k0Â¹\ËÍ¶’\ã{œ\ä\ÆE!§òUqõŒ$¡˜l%)S§\×¥c+\ÚgR$5*\n‰v\Ä\Ô\ã\r²¥ÿ\0h\Ü3?-7m^\î\ÍdFºhÆµn\æ¸\î\Ù\Ë\'nI®»öz³\Ç=‡\Çn?ºÙ¾¥k¡\Í†…x£^\ë\Ö+\ä£ŸáŽ„\âLä‘Š9¯DQ\æ\Z_óž1\Â\àS±+úv-\ÒÜ…–.eKo\Ú\à£µ·F-|ú•õœ=º\Å\ï)–\Î/³´¡kþ\çm\Õ\ÍCö¢\0x\ÎI«\\\ç‰¦êµ‡\îÁ]„8v_±P+Jhû„Røn	\Æ\í\rÁv»zª\Ô{\ÜbQ\Ü\Ô\ç\ê¥vœ1@¸¡4h \Öv\Ð\íš0.\ãWl\Ô!”\Ò\ÛMO\Øöe˜&å¢£T/4ù4¦4ûE(8 \íI}yJ½@¦VÀ¸Ub\Ù­“p\ÏW)%”—	sCsc\Ù\ï˜\"¼M	$7–þÕ¡ü;iDñykŠ¡\æ@zc“G¯4+\ÇO]<žŒšoò:(\ÑëŽ˜\âV\n>w~m\Ë*ZürÑ¥µ™{.\â\ÎñÎŸmm\é\Ö:\Ä—k¶ª\ÄCý5Àß¸\ì§5\n\ÔŒÿ\0\Ü@9P–¶]\Å\È¸ª¨\Ê\Ëÿ\0LH|sõÈ™¬ª	”­w%5\íþ”²Ë<±?å¸¥º~J\çò8Ž\àÑž&¬\ï5þÎµ°š’-\Æ8y2aZv\Üò\×²	$\Ç;Hú0\È-!¦¾\í»›ÑŒ›T}vaI“\î\Ù\á—sT­¦¤@j\ë\î%Œ\Ön\\\Z\ëºL^?\Ö;ü\Õ\äf\'–]\Í?nY,.^\Ú\é\ä]\ÛcTydž\Þóã·¨ñ¥yþ¿\ë\Åz>y¦\Ñ4Eq‘\Ó(sY¬\Ö8\è\Ô3Y¯=9Ç²Eq\\u\Æ@Ý‡k\æ·\éw­\\Ä†\Î´3\Â5+\Ùnm­µ)»o&…¦¶µ¨jW!e°²’CmoµKF)Z‘w\r\ÔPn‹\nc\ÍI!h\í†\ì\Õ\ÜRc…‹²}¨\nŠl°\æ¾\Ý\Ñƒ$2\ÖÓ•Z(In˜C\Í÷,6\Öq\\g…UÁ[Š\Â¼\Òb»¯Ž÷r¿\ë\Í¾¤\\\ÑBË†\Þy°P\Ä\áªU\ã,p\ÍË¾·cÀ’6Z¤\ÏŽ|2ýY$9(«\ÈÔ´ñŠ’SAvrõÇ«)\â:~™¨µkV\Ð^\êz-\äúv¢}!$Ñ¥¡\Íq\Ó4z\çš\Å`ƒšõ\Ó\×5\ì$ó\èøñÓGŽ˜\Íy¡\×Ð ¹\Z”\â\Þ\Ò\é\ä¹Ô®{Ž\Ë*Ám`\Ð\Ç5\Å\ÓG§\ìy¦„G£\é°\Ç\"D\"M6\Ù\Ô^j(\ëw-ô­¥œ`2@ÿ\0Z\íTŒ•T\Ír~¢3¾”\n\0\nHò\í\Å`»`g·¹J®ð\ZUM\È\Ø\Ü\\TÒ…W+ô¤]\ä¡\È\\\Ð\ÝJ\rª\ÆÚ\äù\Ûû\ä\Ö\Þ!cƒ8‚\ne\á¡Ú®»A;i™^—Xâ‹\Í8|¦\ê8z“$?	9Þ³\ß)\ÞR,³+.\0Gº¶\îS\Ã!k­\Ðk;\ëôÛ‚\Êe- º\Ûj²A}£\ÈÖ²M5\Û\ÇM¼ð¾‡B(gq\'§š<žž‰\Í¦½\n=<Š\ÆEs\Ôg\n>c~\"‹w\ÒþÓ¸\ët÷—³H;sDÓ\Ïu\Ì\èo&\Ò6ùò‘³#\Í%r¡e…!ŸH\Ís•m\Ë\nƒOÿ\0\Ø\ZEG4ƒ†]B«Oõ\Ã\Â0……]•V9R\à€\n_8Ê¨\0n_2>\Ú\Üh\îÊ©\ÎÀ\ÇfYÀ\ÂG\É\Ú¦)w-Ê“¶^öÒ¯‘Lœ°c\Ê\Ö\ß\ënjM\È#\árV‹m©6\Ôÿ\0\Ô\Îq\Üi82\ä5Ñ	‘$\É#j\Ò%I‡PL.±\æ$š;©-©\Z\ÞÓ®SXŠ\Ö\à\ìq\É\r^\ë\Õz\çwý1^\ÅfŽk#¡\èEX\áˆ\à-g¦h\ÓW\É¾óN…®µVQm&Ô¼øñYº\Ý\éb‚N\ä4ŠY·ÿ\0b33+\"¶–¢\r÷l\0R™\Å!úg…‡€2v’\Ãm$‹D©|H2R?±\ÆT\Ñ\Ük¶jM‘®\Â\Õ+€˜p‰7\ì\ã²Ô©\Ã.\âG,p\ÛÚ¸‚›š]\ÅWu>p­JH®\Öñ\Ùûö¸Sô-š1š\Æ\Ú|µ2-J2_šsŠ\æ¥\ËS\à#zÿ\0Š“\ëD\r§J¿[›}­-¬7+s¾*\Ô#>dKWÁ‡Mk‘n\Æ\Þy-d³¼ø\ÅÑŠ\í×¸#\ÏCÉ¬šõÐš\Åx£CšÀ¡\Åy¬W£\ãŠÀx\ã#ŽžüVhfŽE{µ\rkD4zýº¼%ip¢)’iµ\r.\íC‰	O€KHcÀ”˜\íû\Î\ê!A¾\Æ<\×\ÎR>I–˜\Æ(Œn\n\Ö\×Ü˜\È\Æ@Z„,sÿ\0-Ù£&\ZF\rIH\à\ÛDÍšÈ­¥¨CCŠ5\ÐH1\Ä69V¨Ìˆ 6\æ2Š_\í¤\á{‚’P\í\ÕØ©þª\ZLo\"”š³`Š\rË®¿é¾¬X1^\0oëŸ—e˜\Ò\×%‰]qª³øQ\à½\Ó\Î\æR”±µZ¾Vö\ÜOi<°\ê6ºl\ÓC©ZD{r!G^Aó\ï\Õz>(Q¦¯|\ÖzŒž±\Ó\é\ÅC9\ê8\é\èyÿ\0B\áûPj²Mø\é;ZGv§¼¥–\ËK¶.–öOkew›M6\ãdqþI¶·²G•\Ò!±Œb³¹£\ÎcZœ²ñ3QdPÀ;qJÛ©ý0À;·“€1x&f\Ë6\Ú<Ó¶k9ÁT‘ñ\Z),`:5v\ëµ\Æ\\¼Oöh¤‘U™7\ïÙŠn4Ig€\0˜Á‰ûb]Œ;;dY’\ç/\É*wª s[v\Ñ§ñ€L\Ê6Ì€R¦(°\ÚdHØ©²\à\Ðb¡ô21Z0n§\Û\"\Þ}MÍ²\ÜQM’F˜‹Gƒò\Þ6:Žª.š\ç\ã·\É}l\ëC ·SC¯hœSmŽ=ùéŽ€×º\Æz:g\ÇNk\×Àø\×\å0iú•¼\"ò[“.¡©G²ù\å7iPölû\ë[¼†Á-w,a\Þ\é¬\âüKv”m¥¨³»œ4™®w©\ÚFzŒ\0T\ns’¹Ü¢=ùûd¤\È-†¨W¸SŒ»\ë!#U\ã ¼x¨\ØQ¦¨­\ÎP5;\ÇR\É\"7u\ÅH3Yu=\ÕS<@\Ô]¬(–J™þ\Ëýqÿ\0õ`ˆó\\Tó>\ÅEa\'4\à-m\åÀÀ\æ¤oª¶\ê-€Ù¢v–dz•”QlHÍ½dZ61;\Öê›ˆ\Û.Vib–kq{¢\Ôn\Ä\Ü\Ú`\é*’O£·¾ùNš³®œ«yi£a‘5\ã§8¯^¨s^9ó\Ôô\Ïk£Œùþ>k\Ï_<W=O“pŸ ¸ˆ\ËioJòC5\î‘lf¹MKI·¸–û\å·\Öó^ª}4\èD’Kp\'¹\Ç\ÕÂ¿\Ú6\Ú\å\Æß±a„lñ¤¦qAŽ\è˜\å\Ü\ÍF\Ø(V•—\ëA\ÑBÉ½‹\ìeæ±“\Åc²©¡$Dnú#*$—1\Æb™Y$…‚Hƒ¹\Ü‘…G1)©p­nŒŠ—²†\îC[YÊ¶\êò2\ìFú1\Í=\ÜPÿ\0KÉœ\Ð\Æ]¶—|™f\ÅöÊš\å$Á\ä^\èQÿ\0\Ïs+»mq—VLR\ãc)§ª\á[¾ø\ë¬F‚C\â]¬bkAq\Ë(H.)d³ø\Ò\Çm#Z\Éo*r ô?ÀôÈ¯ÀP\Íc\ê±^\ÇLô=_|\Ök==:\äL‚G\×7.œ\Åb\ÜÒ¡0\Ã¸Š\ÛPKc›\ÍI\å\îI±n‚;D{­\í\Ê\Ì~\ê¸þ¸ØŸ\ä)\ãw(„¦\Õ\ê+¼i¯#†£»\\\Çoƒz”÷e)5O©¢“®Â¥5tÜ·\ã1\êTš¯\ß#aq¬-¼±jý»…¸¸\ßFVym\Ô\×w»Wy¨K?·‰ \È7\É%¸w#\Ê\îG\Ùi7\Æq¸*;\îôŽªÀÑ˜ŠyA­û—¾±C£S\ÜI\n¾¡¶¿2\Ö\î¶G¾D{zü¤Fî¡§lSŒ‰y)‚n#\Éÿ\0\"LWl\ÍÛ’yW\ZôÇ§b\â™ÿ\02š^\ÍÎ†½\ÛK÷1q9·Ž°:b½×º÷^kØ¡ü\È\é\ï5Š÷\Ð¬b¹\ê1\êEô†8¾Bÿ\0a {w‰®&hš\Ú\Â\ãm”Ÿ ½\í\ØX¢ÁiczkpŠ\ß\ä\ÉojQ\Ån¬\â†+\ä8F…\Â\Ä\Í5b(\â–\ç÷R¶„þ\ãsq$:•.¦cüŠ\Ö—\ç3NŸ¼\Þ\ÌË®#?\"M\Ã\äO\r/Ë¡aÈ’jüø\çKKÉ·\Û¶}:ö\â*±™ž\Æ)?\ç¢U½\Þú\'|c\èñ±±fþ\ÈAx\â\nÿ\0°¼\Õ\ÉaI1Y½÷¹|\Û\\\ê\ÔaW\äv‚¤ù>š@ùNš(|–\Ës\ëQ½>±§ù½\ØõÌ¬÷“o“SlÇ©\í6zå´‚\î\ê	$ŽM´n#\"9-\Ãlhr*\àJ>²ýOµ^u1¹n.ˆ7Ád‡\ã·me¨hòÿ\0m\âµÅ¾‹¬*Kg±‹Nœ´}\Õ[z•®:š\ÏA\ãšñ@\àWž¸Á\è(\ã\ïŠ\Ý\Íc¯ž€W‘À®k\ä?r‰öÅ£Zwõ+¢dk›¯È¸Ö§ü»û`ŒlWlz•É‚\ÖË„6 ©¾\Ô€	H(6\ne\ÝX(ž\ç\ík|ª¦þYZöü\Õ\æº\ÒLºœõ&¹\ØKv\ê\íf“P’–DŠ­µ)£?¹«‹­Aa¤›T¹\Ü^£ik%À\Ó!h£“ñq3Ë¿’K\"g_Áµ¸\ï\Éùs=„r<qlf¹c\Ì.¬‚DqŽ\×\ZX{\ïAœ\Ì\ä\â\æ\âHå¹¼\Úð\îV{\Å\Å\Ä\Ì\r\Õõ\ÍÜ·I\ë«\ÕÄš³\ï:Ì”º\ÖTk\í[\ë‘ÿ\0\"¶·«/”O$–óZ^-\Õ\â\Äðj\Öú\Ý\æ\ëR;´\Ü r\Z&Œ–®w-m/[qW£j\ê({\ÐH$kM\Ñ\ÍeŠ\ê\î²\\À°µÅ®\×\Ð.%+wŽœ\Ð\ëÿ\0#–\Å`\ÐŠæ¸¬óêšð5ƒü3ÔœQû7\È\Æo\ìÒ´JZ­\Ì}\Þ\àkŽ×–±¶\Ã!Šæ¼¸²\Úg ¸Ê¾ÖŽCL½º†\ê8ª]R\Õ+ÿ\0+\Ð\íª_io_ù2\Ü3ê¿‰R|ª\'\×ô[¡-\î…S\Éh(\ÝE%)·zŽ\ËKj‡H\Ò´O‰\é’\é?¤ÿ\0\ÕdÔ¿Gt»kh¿Ho®­®>ò-%’ò\îÁ—_¶«{Ü;\\E-É¿´i%š	§Š$Ò˜%G+ ŠvZ¼A%\Ü[jg\Ð\ÄRQNÿ\0cô©$m—Y\ê\ãc~SŠšG\Þ\\4•«k\Èe¾¸‘®Zy\é‘\Õb´¿»S¤j\ÑmRhM\Ôf)¤\Ü\â\ßGn\ßi­ª\âx¦¯\Üû÷¨smòû›WOÜ½[üù¡¨ÿ\0P4—|»A’¡\×t\é¨]\n¸›*„:\Z»9]wtm•\ÜeY+I½\Þð\æA5\ê\\µµœ²[é¶“[L‡\"‡E\êzx£GÏƒ^\èóG\ÏOx\æ±\ÏO+\ß\0×Š\Åz\èh\ç:¼loôk&¹{I\ã]\n\å\Þ( ÿ\0nóheiX4²\Ï#½Í¦BFø«\Ýb\Î\Ån¿Qôûs?\êv®jœkú”×·z˜©®»\Õoo%\Ëiÿ\0\×\îM§\éÎ¦j/Ó:¿ð_Œ¥/Ã¾5>…¢FC\Ò)>?¡-K¤\èð¯\à\è ~6„)WC\Û\Û\ÐV¦°øü¦]?O\Ö\Z\Äaÿ\0óD©¾E«%\rE‘\í5xŠ\ÚkkA­\Ú\ÍV6±\\›7ƒ0†1ý½¸£’3µ§\Å\Ì$‰ÿ\0¹Tm†r+RY1$·8Ž\Úê§™.j\ëDr|6\Ù\ÏÈ¾kSü–\îjŸ4½Xþ3ò›’¿\ÔRŽ€•ûšBü\ã\Õ…ñ±I ün¿bø\í\ãv?øö[\áz1/ú{•?Àõ8\êoŠ\ëpÔ¶zµ.¥{kIó\Â\Ñüû^‰aýF“|\ãL¸­E\ìuHYÍ­ÁVl“shú„‘Ï¨Go­ñ\Ëå’»@6Á”lŠ1\×\ÕGø{lQ£Duz\ä¹éž™¯U\ÇI>Ë«ÂŸiÚ²µŽ\ÉS\ãÍ¾s$v\ç\ë`ŸúpIØ‘\'V–\Ñß’|ª-$].£ª˜\"&°­\Ô=Ö§s-\Ý\ç\Åþ6¢ö\Z°\Ób3Z\ÛU\Ý\Ä0=¾£(C{.^ó}D…y¤/WVwr-¼71ˆô^\åZü:\å¸ø^”–ó|N;S&ƒÐ°\ÙOc\"	º\ÒôËª¹øŒ†ó\ã\ÚÎ˜G\È5GÑ¾_6ûOšBõkò½%·È´WH¯…\ÛÀAVL	B£\'zz–&jòf\\jzŽŸj—ÿ\05\Ð\à[›\Ü\Z¾ù[\ÉCY\Öo*=P¹¨þ=b)l»F©\"¦Ÿx\Õû\í~Á(¨>=#\ÒbÒ„@\Ù!cnŒ?ššÖ§¶‘D¦\\B÷¡\Ôõsoò¦F\Ô`˜Í¤iW©«|\0v\ä‰\í\'˜¤­,j\Õ÷ˆ\ÙIyv\ÖóEZr˜¤¼\ãi¶=öˆ\Æ‹i&U\ÇÉ¬\Ñ\èk\Þ:sŽzû÷C=8‡ò<õ\ë\ï¦9»co\ÛL\×7¿ú\Úr\ïƒIK‡¹\Ôu¹\à–-œO\ÜY.5±ºty?!ùz=€š[™4•šK»m³\Éc¶²OÀ´øW\Ç[W½‰£µY/\Z¿\'ú\æ¸\Ú$¹tgj‹Tq±1A¾£µ+Q\Âkñ­Þ’\égFéž…Š\Û7–“S\éqµM¦\Î\ã\ì®Ü”V¯4;ú\Õ~ñÕ…õÖŸsrñ5øÃ¯j¥þª|®Àè¿­-™­þóMB;¿ÖbÙ¯?[þS%Oú­óKº\Ñ5w\äWZ•\ß\Än¾9{t-\ÏK\Ô5ƒeñ]:ºxŽ—K…Š¡‰bƒ\êt\Ø\ét¨\ØG¥©¥\Ò\"ø6\ÅZ\Åi¬UlP±±Š:¸X£-!¥o\ì’’H\íö\Ô\ßYöRº3H¨\"¸¾qÊ´þK¢‚Â‹‘NwWè½°›ç¿¨P\é1üI,¦KOÏ´»^mp–Ñ·i7-gš÷Y¦\Å^\Í¼Ñ¯\ë§8ÿ\0šQ\àú5\ï?ÀtñX\æ½-^dGg¦\â\æòÛ½{sz}»þ0½µ†ö¥)eŒÝ–³ò$›Z¶Ò­¡–]Fø\Ç\Ù?mÚ…ÑŽ)$],­\Æ\íÆ‡ñ€\ÛRw|µÜ¤\ÊD\Ô`\ãðøŠÜol˜J\Ð\Ø(L1ù$RÞ¬fMZ\ÑU~Aa™>Obµ/\Êôñ#|’ÀŸü‹Ozý\ÑþF\ê©+ñ£ö¹	\Ñw\ãÖš´:v©qa>·k£e!²Z8‡Y¹¸g%\í¤«\Æe\Õ&µO‹|H\Þ,v1C\ZÚ¦?(À\Ã*P’\ÝLw\Ûiu\ÖCªÛ±ý\Ú\ÕX\ê‘\ËK{º¿\"2¹šÛ»_o_h\Äa\ÚþÅ¢¦»‘Ql.\'/²p\æs¶i‹_voþs¤\ä;KP\\\Ñ(þk¯«.¯{\\ ¶eƒsñÅ–M+J•\Ì+š\ç¯=2kÊŠ\ÏS^zz\ÇN\rs@f·W\à+=<t\×!H®.m\áŸT·¾\Ë\r´B®‹!“û\ä;\êiÅŒ3›T\Ä:\Úö¯´k×´»\Õ4\Ø\á¸+Ø™ö/u\Ïýy \ß2Î‘T¶\ë_Œª#‡\rµGn´BB¿—Fñv\ËòU\Ü.5‹ª‡D½º?øõ±vøÝ½>ˆ¹¸Ñ†÷Ñ¢&]„z½¡³\Ög\Ýiq\ÝŒdeqR#\Æÿ\0;\ÓÅ¾¡g¨»EfW¨\ÖD\ÔÙªñ\ÒJ6‘G,w\Ãnu\rZ\Ò\r¢+)6²Â•4\è*{˜³s¯ZBN£¨]4:N­uQün\èª|Ct’üE\ãYt[ˆ’K}B#¥«[¥¯É®£6ºüJ³DÃ»\Õv\ÝF\Êž6\ÝWQ™+·²¥“\ÈkN”¦¡ú\Ëb©\"B{l»[ôU6j?3bš¼oÙ’\Ö\äÁ& \ì÷ÿ\0¶U\Ò\ìXWø­Ù¯Nphó\Ñzø^†…sŽ„fˆ\ëš-^(u5\ë\Ð\è(}Vþ%”ˆ\ÓòftýVGž\â\ï¨91\Û)\î.Ç“ÿ\0¤º´½›\Ãtm\æ°\Ó\îofI\ßPi‰WV¦\Òm‰uÿ\0ýõxI„H\ÄVýÔ°—&=µmv¨¼¾Ž:w—´tözÓ­Œw,‘ÀbÖ´|¿\ËôÈŒÿ\0$ÒžA­\ér„‰gŽx«©,\ÒQn²[´D¬ešŒŠª.P¿\Í\â/¥Y\Ê#‡ð¥\Õ.ô¯ˆiÐ­‡\Æm^ øµ±©>=aZ·\Æ4™—Q\Ñ_Mx¹‡Ä¯®\Ú\â\Í\Ö*\â\èƒyv@ºŽòõ\á\Óm\àm>\Ú7«X¢H\í5= ¯þM¥Eysò\í5V\ëY\Ó%[›\ÛC¤‰RE¨/§³\Z\Ê\\R9uŸj.¥&†hL•%žõ¹·uyÚµo·\ë\"M2ÿ\0\×L+ôv{ko|\Æ-\"\ëVy»Kl\É=®¨¡.~\',\Ö6–\ï«…n„Y\èk\Þq\\€¼WŠ\ÇQõþ^k¯ç¡£\ÐùõX¡\ÐÐ¬ªÖ¤U\ÖwQ}¨A\Z\Ç\Üc©[¼q›•\î\È\ÏºX\È÷\Ó\\¤2jW\éy>›¥\Ép\ÐÀ°¤C\ê˜\ä’o³ø0i>EumÜ¾0©-ñJRÀi—m%\Æ\Ñs|5€\ß5­ºö¿©WV\Ö\í­%Ÿ\çr\â\ã\æ—n\È/	Ÿ[Ô¦“v°µ\Åó˜/\ï,\ßU†\îŠ\ZPZ\Ù\Úi	¶/\åzŒ\É;\ê\×\Ë	:^\îÝ¿\Åô–­\'FŒ,6Vð€¨•4@F\Å~Eg²µV²—\à ÿ\0\äB@2Gºyl6\ípJ„o­±ºÖ¿\Ý|\â\ë\'\ä\×òµ\æµz±OScû\î«Pj·¹±ù+\Ç®¹\ÊwA¤;ª[i!m\'Up]\ÂÅ¢Œ\ÔP.\Ù#\Å\\\Ú\Ñöš\Üýÿ\0Tñû/\å˜\áÐ´ˆ®¢3\åb’\ìR\ÞÁqn\ê^}Q\Ö\Þ\ã\âH­¤\Åa\â|Hz`\ã§¹\Æ\êâ¼Œœf¿\Í\ZÃŒ\Ð\ëœÑ¬\ç óK“Y¯^ÏŸX\âùCDaºö\Úô\ÉycX –U†µ{\Ý\â\×Uµµ°»¼{§Ñ´½\ÕoiÛ­»\î\Ñ\ÔnÝ¯\æü›O\Ó\èñò”E˜Àd£lTö?±˜¥;Šº}€¬†¡‘-¨\ë[&µò¼\Ô×º½Ö§fV\á4\ØÖ¾=£\ß|‡WýFøn¡úm®üV\ê\íH\ÇwD\Ó-5M#Vø;Yˆ&¸´­\è\éo¹¤¹³4–¤T1‘Z…\êY\ÃòKÖ—M\Ò\á\ï\\|6\×}AnZ¥l’M|½?õu‰E\å·Â¦\Úõ\ÓEØŠ9$h´\éf/g+y,\Õ\Í\ä·m7\Ç\î#·\Zb\Èÿ\0‹$w_\"ý*ùŽñ+Y\Z\ì˜ZN\ÜIq/\Å\'u»ü¸Z\ÛT»¶–\rUXZ\êz¹\r\ÚV®“E?mÅ¶¡sµ\Î*B	\Õ`ûE•“õe‚i¡w\Ïqòx­z¼2\Û\Ý	’8• fKo¹u«üUQôØˆ•dPBÁG\Û\×OW±žƒ5\Ïÿ\0\á\ä/^¼œQ¬W\Íb¤M\çR¶\Ùv\×«[]\Ìn0c\Ö\ï±t÷e\î%s<¶V‡»¥Y4b\æ\çñ\Î\é.$\n‚¦‹r‹	¤¯ƒ\É\Ùù%\Ì*\×M\0Z(Àv\êuB%Rµ4r´Ž\Ø:úD·šŒòV•¦\Üj7\ZV,#\Ô\"Î¥si4\Ù\ê3\Ú\Ë}u©\Üü.%ªAƒð«@t™\áBºæˆ—Nö2\ÚÊ\Þ@¶wñ,1µK²1v-å¯”ž\Ó|~h¾+lc€KBK\ÍM\ã\äpw,\Ý\Ð[\é·_=¤‰5µ³@Šn\Ö(µ=y¦©\í/.k@\ÐûOò‹ÿ\0P‘V£su¤\Ýü‹õ[\å\ß#\Ñ\ímå¾™\ìL\0CZDûG\Èth.b¾±x\Ê\î[y,e%bh\æŽ$0\Íˆm¤$£-IŠ“ýjC1F\Ë\Ï\Õ\ÙGy e¶m>ô‹\î\Ø\Ó\ç6\íqm$\Ò\î’mG\â\ê±\Ú[ª¨4¼04qü3^+¿\ÍC\ÆMqF¼u5š\âˆ\æŽ:y¯ï§š\â³\Åq\ÒOµk\Ð\âóò‹hv¶²O%ì¨°\ê\Ò]I\Ø|\éö.ò\è\Ú+¼ ‹E\Ø÷–X4i\å\èOO¥N†\Ú\å´\íjii·¥wd4\ê\ÏS~4%¤\î3BkSsw‹5Ô¶Z$’\r.\Âh¥Y\×\äºy‚öT[\í2\Ù\è\ì\í¦Y­ ²Ó¿6ûE\Ò\×NÓ¯;pû¨;ŽU\äf“X¼¸,\ï u\Ùs\n»jV«’\Þ~f± X‡JQ8\Är\Z\Îiªe5ªD>Gdm®¡gzøþ\Ûý*=56j:l‚<<o¥¤MÕ¬<v1\Â\ÑM«\éð\ßZÁñ\è÷|~\Æ2}B.õ|{KkýBnÅ¬\Zž f¦Ð®.\Å\Ç\Å*+itö·’¤«¥µÄ‘ˆ.cj\\5Ki¾žÐ­^\Ûf\r\Z×½ò?Ô‹\ï\Ë\×u+\r\È}\Éu´…ZKaq‰cºµ\Ðm!‘\æ‚	#”/\×ü’>\Ë^¨ô\Æ:c\æ³F‡Nf³\ÎkÑ¬\×=}¯ƒ\Íy\é\ÍEn5žŽûjYˆo‘nkI$izC±×¯ð´û\'¼¸}0£|sE\ÛvÝˆ§V–k;:´µ…H\rB&Œ«|®\ËñõŒ_-þ‡&+h£z6‘ÔˆŠfGÛª\Ú\Ü\Î\Ñ\è\å\r´A!²Ž\ÖY¦\ì\Ô4¾Š_Šj\Ö\ïs£\ê,§A1\ØÃ¡ks¿Æ´yô–º¾Ô¥Žh\ï§o\Åv2\éŠ\ï‘4ZD0‡\"*w\ÛZÎ¥V¶¥\î\ït(–\Â%XbMÁv­`T‚®¯\Ðm×´\Ñ<‹µÔ¿Oµ5\È\Ù‘\Éúl‹d!{Ùž\ê@7%÷\Æ\ínŒŸ›n¡ñË¯\ÊOŒü%\×f:>&—\Ó?-\ßO¶†Œ*\Éso*››\r\Õod‘\Ò\ÚV\È\ìm¤\í½4/†\ÉK˜÷Gñ\ËE†ý\ÖMS\\\Öl’>œ\ïp-D3\\Y\Ëº}õµœ+ÙŽO„\ØGp\Ö1?n\')0Hõ\ÅgŽd\ä\Ð\ç§$ø£KÁ=1Š\"‡×¨\Í\Ö:\ç§E\Óy©C\nžd62°¾²½®®ntú¼2\Þ\Éñ\í­£°\Ó?&®@&j%Bö\åM+m¨Ëš‰MN»\ëõËµyúov·?\Æø\Ö3XŠ:¹º,Ï¸\Ë,\Ô-¤–†D4T\Ä\Ñ\Ã0\Ãp\Õ\Üú\ÌTM¼el´{Yæ¾Š\Ú\ÚsKw}\É;÷%\r ,¥šõ«E\â\â/œÜ˜­¾\'oR\é]›;Bð\Åg8dV\rÐ°5p>·£u^D¿“ò½ñ/þx‘\ëPZ[¬© »t«#\Å\Ø0´ŸˆQãµŽy¤³´\ïE¦!Rª\Í “|rI\Üm†%\à‰jpŒ%·‹\r	Zƒ\ïP ¨\Ð\Z’ß·I(a81­~ºgÄ¾!n_Q’\Ûu\ì\Ü|O……¤‚e²µ´šÿ\0´Ÿã©¥h\ÖqkV·EKø÷Šzö(tñ\ÐPþt\È\Çò=84+5Žzq\Ó<DE\'\È\r4ªþ\Åv>›–ƒI†4\Óm\"üq$ox]^\ïhŠ%\ÂUžw(\â>R[\ç6“¥þ‘^\ÈY\Å’JxZ¿G¨ôºü),H-n‰RDim\ã&;t]\"%\Òv\Æ;¢ŽA±‰\è\Ú{„]Ýž\"€\á\äŠ&–\ë{\Å®\×\Z½\Î\Úù&¢/õ?i\é5Å¼@\Å+Ì %pk´µ:\Õ\Ò\äjñŸ$±‹Rø¬SÏ¦\ÝiÃ¨i·\ÙŠ—EüJIpc–6¥\ÚiVq…’\ß4`š$*\Ð)Y#UiŽDƒ¡v­h[à¢š‹*B«›R§w‹ý¨w‹\Ûø­¡‡Jš?\ë–¼šw\ç\Ø\ÙÂ³Ü”}L|wF³D\Ót+;£Ä´ûz\\Š>qC‚\Ä\Ðâ¹£\Íz\É:\çŠó\Ó\Ýx\é\ã©\éš_4r(\ÖqF³K\Å1Ê™€©%M±Ì¬\\°CùêŠ¢\Ö\ÔO¨\\È•Û‡ñ´ðÚýÃ¥\Õ\ës%³\å %\Ý[$È¸G\ÍjP%Õ—\ÆîŽƒóEt·QIoº£·MÇ·‘øK† \Æ\Ò\×\ã\Ä\0€(ƒ\è;Îµ\Ü\Í4p\ì‹f\Ý\ì\Ë;¤m=\Ò\È\íqonŸŸ3S›‰M•ƒ\îüpu\í\Åò\ÝKñm\í­d¾»ø\æ”,m\Ä]ˆ\í~†\Û$ƒ\Ý^¦®\×PRÕ¥7þ¦¯¦J.K5\Ñ.™\Ã+DEMe¢m?e\åˆ\Åq\"Tw;«»œ‚[RLi±\ín	c”$j“E¾£B)\"\ÍG¡¹ji6Ó¨f¼ú\×\È\îÎ¡¨\ÚZ­´£Œ^£\ì‹\\Ó‚Oñ}.÷Wš{­9\ìu›y•ü¤žF\ry£\àøõ^¼\ç\Å{õÓš\ÏñŠñÓŠ\r\Í{ò9pjD\Ü5NòTú]\å\Ëiº\î›P\ÏÉªdÁ¡«$²\\ËF~Í†—\"\é¶vd2¡=\È9;•\Ìg\îZ%\â\æ¾oböº‡Åµ\ÝtDÉ¥cK K¡™ò*\ÙHA²”‘ot”&:K°´·¶¦„\êÅ§†2úœBž\ìJ;ö\ä\îžVý²v¡¦•öQ¢ˆ•i\×\íªIý1½]F÷\á\Zy­­¿ª´ðñs\ïcö6ø¢ŸY¶°ºQ‹\Ô5§4v\×_1´GÇµ¯\ØþEg4wQ,;„Ñ²(Dzk%\ÃYC$\Ïf½\çI 	©On\n\ZŽh\\J\ìg¼&K›¸©/d¨!i(Dx°#\äm8\r¸\\\n0\'\äwß¦hþ\åò}^ñÃtW¶~Kj©_ž\ÏOk»Xtý.ò´ƒNù¦\r¶¡¾S“@‘F¼\Ñ\Íñž8\èht49¯UŠ5\ê¹\è\Õ\ì\ãœtõ\Ó$Vi¼ö“·«6\éž\0Ñ´\"­„\ÖOwp.SIanH\ÓuPg¸¸Ÿ/,Š-û¿\ßHÿ\0\Ô\\žð†)ò7ólKuŸÀ\Ô-³\07û›¢ˆ\Ò	ô+\Ú$þ;0\Z~\Ñ5¬À¾{#~\Ç6\Ïüv)*OŽÂ¡t›8\Äv»Sú#¥}\Í\Ø\Íˆ©\Õ\Ë—\æ\Zò\Ø[[ƒuqñ½=m µ\Z\Ê\Ò*\Égõ®\Æ\Z-‘\Æ.HCr¿[\Ø3Ep\×:{\\Áòm2K\ß\Ó_®§¥ vñ\Ù\Û_ŒŒ²[›ye³Šj:p\"[ i´˜\Ù[CFo\Ø\æ\È\ÒnÒ…¤ØŽ\Ì-Q*\ÓF1´\ÆC}]¹ÿ\0f\áUõSX‡À\íG\ã[©¨Ú–4g\îok\ë\ÎÓ¾8ò	\åºy­õ‹†¹o\Â\í^\Ù\Ê@¦°\Ý1D“^k\ßF\"‡QÀZ\ÏðóX\ç?Àœ1\Ó\ÏN(\æ³\Í2‚ÿ\0›P_ý®\Æbp’\'\ÖQýqN;\Ö\ì\è\Ìwj#µ,†A“P\åU\Øö\ã˜3!TO¾Ñ›«p\Ã\äZ%Æ“{ñÏœY\ë–v–»(ˆqþk\'?ZR\0[ˆ\ÃIu‘ŽFEŠ·,tn¶Q”’\æ`DS\ÉP\Ú*n+N¢¥Uò­r\Þ\ÂW“QºøGÇb¶¶‰m\Â\îG]‹\Zf­R½\Â\Üm”H•n—r]!\"DÁµú˜üo÷‹\ë·?\Öloâ»´ŠL”d\Â1\'²Mmh\ÂH#·öÚ´\Ö\ì”\"5³ƒ\"\"„0™8¥9jVm®E\ÛZ¦­¤\Z\íýÆ¥©i¦\ØGÀ¿\á\ê@Ì–,\'­J¯\ä±Ó³MS\Û\äi\Ðñ^:x\è1\\gŒò+œ#\Æ\ëš\Üo¬Š4:\ç\ìø£\×4|\æˆ\Ëvÿ\0®\èÍš!\Ù?k\Æ]ºŒ]‰UÍµ\Ä}µmI\ÄKk·µ!J¶¨|\Ì\ãjM°l¨4\î\ÂH/ôû+˜u‚\êºtš\'\ê©¢Iaú“ñÛ¸\ìu6øe\Øn\ÈœB‘\å3Mx3\Çf6ñÆ‹¶\0pX‰iV6¦A†8«\íZ\Ê\Ì\\|ºmn\ï\æ÷š/\Ç\Û\â\ß\r–þk{\"Bµ¿\é÷\Ûÿ\0¤hPE“@Šcº¿\Ê\Üî«Š›=\Ët\Ü\ÒA¶\ß?ø«­\ÇÀþ{?\Ä.4j\ÏVŠ9Q•Ðš˜\ÇY¶­\ÐbN\Ö6¦<%©`4£mP&b\èý¶\Ó2<Ýµ\Ö~Skhºþ tM\áº^^l\Ï\"ÿ\0;÷w¢¹{M@\Û5¦£q	\Äq\æE¶¨\í#„ÿ\0X$Ÿg\"½W¯\ä\â¸ P\êEc¯šMf‰\î¸=8£Á\Å1²\í?ý•Å¹\í+n¼¶,Eý‘.m¿¹3\ß\×\ÙÚ´ˆ÷<ó,7Vm¹b\â§«\rV\ËÇŠ*\ÍN{}\ÚH>Ú§\Å4]V;\ÏÒ”«ŸŠ|\ÇI#\äÿ\0.Òª\Çõc^¶¨?X\ã¨?W´ÊõwE¯ÿ\0*h\Òÿ\0StP?ü›ñ\ÚO\Ôÿ\0Ž\Z?©º§ýO\ÐTOú©¢—õŸMˆOú\Û!«\ß\ÕýR\äj_+¾\Ô\ßK›å·–ø,6\æ\ÛOTY\ÙR»­…q\Û|–Š¥\â/J\Ì\neúK7¼…nÉ‰§p\Æ\Ìgp\Õt¸o\íþKñ)’\ãC\ÖõŸŒ\Üiÿ\0¬H,R~?0µù~‘=E«\Ã\"\Å|Ž!=\ÌA**kˆ\è\Ü-w\ÅIv‹RjH¦mf]ü›N†¯?P´*ûõCSù–­¨˜R\Ô\ÓFø\r\åÄ¶úU½ <pjû-‘\æY¥H\Å\ë³ß¼‘Íª3\î«Kw‘á‡™—·x\íóG49½\Z_<Vhq^hsGž¼t\à×¯4h\Zó^¸È®:ñ\Ôy•	\ãQn¤\Òo²µ\î\í\ã\ÝW6\Ü\\\è\ïŽ\ÄV\Ò\ëÆ¹´•m–\à3jh6®\ãR\r«#¶”ndX°&eŽ\"X\"ª\ÎXƒÂ…•¥··™/>ñJ®ÿ\0Gþ1=?è‹/ÿ\0„g¯ÿ\0	\êõ\'è¾¹·\è\ï\È2?H¾G_þ\"\Ö\Ô\Çú=ª5\'\é\0\Þ?G´ª_\ÒoŒ\Ä?ðßˆ\éõ\Ã\é_P±\é©gRýR\ä\ìiŽi¦\Ú\Ö\å‹\Û\äG\Ð2‚ÁC\î,Œ\ä†J¸Vo.\Z ŽF£¥Cz—\Ú–rOñýù¦ý=¾E“\âÿ\00µ\ç\åvE~Iòh\ÏþuòXj?Ô¯‘­\Õ-u(~ª\ë”ßª:\ÛQýCù\Óü\Ï\äRSkúüôd\×\îJü\ä÷¦/\Óß—\\U—\é \ícú]¢YU†Ÿ§\ÛZË§˜\æ”}$n\ÑF\Å]IºÏ¾\é\Ö7¶ŠKš°¶\Ýs\"m­:\ëH±W\Ç*ˆñƒ\Ñy9\é\ê4|\Èñüýñš¹\Ãy÷^\ëÐ¢q\\\Óóš\ÛÆ¿nö\ç\é§iÂ­kn\ró¢G«\\A%\Í\ÄH÷®½—Œ?\äÛ¨Cœ	7m…ˆe\Å@šY{µjW„\Ñ\Ätd,\Æ\í\Ð~eÑ¯\Ï}Ï©:Ÿ\ÜgF†þ\âJŠ\â]³_†YZ\à5\ÑVü‡¢×¸^¹m6ø¿\ìw³U§\Æ6½®†ªV(\áŽ}‘Ô²ý¯œ\á\î>°ý²®b\ÜÎŒ(mu‰6\Ç UIe“0V«\È\Ø\×*\Ð\ËP¶h.j\âÁ]nôf¦øô‘\Ò\ÚjQ\Ôw\Z½²A^¤M\ZS6•ñÆ©´OŒv\×\ã\ß\Ù‡ñE¨4¿T6Z<t#³Ž£š‹<A\ÅÀ4eL\äIJ%È©\ÆÚžI@Wt¬Ý¶Ž\\\ê\Ó1¸øÞ›5\Ì\Ïc±d\Û)²µ\Ùp³›¤ûõõ\Åx&±Šký\Ð\â³Y¥óŠ\àuóÐŒ`-y\êy¬×ª5ŒP­\"B\"\×\Ó{^N?mµŒ*[mTš\ä¢\ß<\×mCOª\Â\Ù\Zu~\äJn“v-ÿ\0\Êdõ\ÛÖR£•UŒ\ÑÃ…G\Ý‚\r&ž’Tv0\nü4+±Œ;¤µo\àCKg\Ú\Õ˜­BÁY’\Ê:K5A–\×1 ©¢W]B7F¼»	%2S++[ˆS\íj EÂˆö2´A–Hò²\Ã\Ä\Ð:U\Â\î¨Ÿk\Ú\Ê\Åm»X‰›ñ£cûz]&))´(Ø¶„±³ü~2\Ëñ\Ø*_Ž\Å\"ÿ\0\ã¶\ïG\ãñ[/ñK-\Ïñ\Ø)¾>Â¤\Óob©Rþ9mî²¡¶\Ñ4ï±®m®¹|ó3}-‡þÄŒnoô\Å_ý\éBþB\Æ{{I¸½s\Ó\Ñðx\'Š\æ¼Q®hb†:x¡\ÅghV:s\ÐP&ƒb‰\Å\ãç¢‘Zc’upö\î?\Ö\ß\í\\]#UÒµXÚ¡¾¹y¤¹»Œ[Ic\â¿Pül\Ô\'“v\ä\Êÿ\0T‘\ÝP\íabÐªªoQUš‘™©r¥Y©` \Ââ‚¶cLº‚ib\ËF½ªµqµQ\ä1\Õõ\×m/.\äz¹w+h²\É\Å\á`ñ\àU«´‡’\Ñ\ÆÛ¢ú«¡i$·%®¢³§\Öh\ÎÒ›^Àµ™‹\Ûý\Ù!»F»l¬\n\É$ôÐ8„²\ï@{Dh¨£ÁnC\æ7TŠ*ö\Ñs†œNAI]ö\ÞöS—¹\Ïf\Ö\Â}F\î\ÇAü\Ùmm”[\ÝG‘o®w$7 E\0]=c\í\\\î¬×±G=Lñ\\c&±\Ó9\ê9¡G ñŽ:Šj\Ö~\ÍÊ•’\ÛQ³qc\nš\í¶.“\"\é{b\Î=˜˜t‰.¥¶‚;x‚f·`œb,¹¶\Î\Ô!©\Ó{Hª\Â;\ÈS\"\â4ˆ³\á—\0µAöN\Ú\àDr¸J137b‘U+` RŸª\×lÔ©…¼“jj3—þ…-Y¡³·\íT ­\ÊñIš·bDp\íXmL‚r\"§·¹ñ±®b¯‘K\Í\Í0Ì±\â•\Ìf\ÊXñi\'\×o¶Û³5õŠ‘U`hö\å^	¸´U·59+M’$|„ŽE\Æ\Æ\îS\Õ/]Ÿ¿\Ëu\îIc§I¾;H\à2\Éqp\Ñn¿‚ú™cB…\no\r\à\×\ÏA\Å\Ç5(b†(P\èyþK\È\é\ï\×==Ñ£@ò+M¸i\á×£)¨\éË”G\ÂÞµN®õ\Ú#N	ý†¤ñ¢\×3)\æ\Ù7.\î\ÔPœ¡\å†	\\\æ$smF\Z\"\ÔSz\Ç\Z\Ôhv©¡MÚ¬\Üvx\íQº\Ý\ÅM:–Y°—KjW\ê\ëu3mý¶%¬Yˆî¤¤eVøÍ¤]Ú·µy`¶\Õ$n\êÐ˜\éš4[\éB\ÕÓ±«¼\Ó\Ô\'m*n\îŒ\Ú\ÜoÝŒ\ïF¨ûh‘ÿ\0ô\Ïq\å·\Í5¶oc*–,v©l‰0´\à\ÓqR€Dª¡[†žMµýfc²÷ý}±¦[¤\Óm\Äf@qÇ‹…/M\'õÜ¹2Š5\ç¡\Å{¯g\ë^8\ê9¬t#\'ƒG§\á\ã®8¯B¹¡\ãªV‘6\Çù\ZºLJCZ«%\ÜUr”\Ðv¬#‡|Ý²«{.\éw•¥\äKþm\Ù\å^\íGœ±\Ü\ÈÊ¢Ü©%AP û–0Ý¸ƒ­@™p>¤b•·<¾IR\ÍQq\\\Ê{\×pfLÓ…©æ™ŸQ\Ìu$ý\æ²Á·=I\Â\Ý\r§ºª\ïcX\Þ\ÇZ}\Ü[?0UÎ¯,¡\ïö ¼Yjyv-ýÊ¼SHž`N~±\É¿	cq J\ÎV@%¢”…\ßK–¦»”˜Aþ©\Â\âJc\Éj8©\Å5HÄ—ÿ\0\ãwöb~\ß¿Ode·\Ò\áD\Ø\Ëñw=\ÂöT–z÷\èš\Ï¼\Ós\\c\ßOtFk\ßA“[GN:qC\Ån\â¼Ð®z8\é\ìU´½›q{‰¦œ‚Ï‹·\Å\\GW®Ý°£¸U\ë“&õ\Æ6Ô¾-\nš„\åx\Ý\r7ˆ\0„\"G3¬h¢ÁV\Ìw420‘I\Øj¡Úˆª[·QGS2“¼˜|+\Ë3 –\èl’C—uTÕ¥-u\î[\ÌT%\Ø§F,\r\\0ò€,\ï{ua¨\î\Ý,”nr3u%\ÈJ¹¾\ÝÝ\Ó\Ü\çs-Š·4ŒB¼‚­¦1½¼Ø¤Ÿ´\ít€‰Þ’\åT™C°º5MÑ½÷1\ÍH™.	£\Ü\é\É5(\Í.AœaÛ…˜\Ó\Zø\æ\Óù‡\í¹w\Ó\'\ÒF\Ý}x\ßTŽEgŽœ\×9\Íy¬\Ö9¬ñ\Ó=qš\Åsš1\Ó\n9¬8«§\ï[i\Ó\\·m—Ÿp’D«“¹l¤’ýª\å8û\æC†´?xþ·l[“ªµi\Z3Šˆn¡\êŽ.\Ú\í\áS‘6cŽ>c]¸\'5¸V\á~|…$º;§”šß‡5qº4×¥r}ÿ\0%–žûhmf)­\ÛIOtWž\ã%Xj;\×Q\rý\Õ5%÷\Ù\ï°n\ï·\é®ükGP‚­®7›!§³ûK7Z,Â–\à­EpÁQ£(’\à	¬œƒ#\È\æ¤<6	ÊŠ“\ëN©¾¢\à³söw<x¯\"¡g1–\Ã;Q\Èp‘Œ²â±Ž q\à­ŠE\Æ:{ô3Š\à\Ö+\Ð\è\Ô9þ¡¯K\ã×Šð=V)\Å1&\ßGœ4wM…{£OqŠK­\ÂLSo\Ê]ý¢N{¬*C…·_\íˆn2=I±pw´[qQf·l1l`h\å>µ‚Œ…O\æ>\Z\êF2¶Ê¸¼-R\\	uµQ®™kZBÁ$1Ÿ\É\Ê\êwr•ž\Â\â\æž\Îò\n·Öµk6·ùGtGy‹\ì*\ÊýŠ® C\êü\ìTÚˆ\Å\î«o\0½ùŒ\ÍWz¶³sV¨\Ê\Ú<÷Š°^¶Ö¸­$ž¡ˆµ,x3\ãp•U»©Ip¤eM,\ÏFR|Ïº›\î\\\â¤Êÿ\0o±™8©>\Ó\én\è\Â\\h­²\è-h:\n¿‘c·…\ÍF2=üùÀ h\ZÀ\é\ïœtÿ\0œr:\Z|hu”`:œ\á|¬ª±š·‘mn\ÎÖ¶¼	{\æjK¥&{¾m.D±\ê_ÿ\01A\Ïb[‚\Ò\Ûpû\ÓmWj§Aƒ*Ò±¬š0q’#ú×·ð•¸Šy\n•œ3Iƒ$qU¸\Í¬dRF«i\Ü]V\Ò[fŠ\ëu;G¾hdZLl·º\'ö¦C%¬\Ða\à–\Þ\ã®˜\Ê-Fð\Å·—w.usIñ†5\Ä\Û6ú´\Ð*ROµû\Ói›x 2mÉ©‹ƒ\Úe|É–…\Â=[\Ê\r4™®ø\Ü\ÉÃ°a&Ö©0¿œ\"®[-+Uø\Û$¤	\ì.lc›•¸@e­R`\É\Ü~:†¼\ÐðsB‡•\æ³\Óß’E+\Ðþ¢:\Z4<z÷\èx\Ç½ø®:\ÍF\íF\Ó5¥\ê+¾óNŽH®ô\íû0Œ_DñÖ‡xLº\Êž>>Œ2ab^\Ú\\Gk€9Z\îW52\n\0’¨\n\Ê\ÔA¥©qJÌ´‡4i\îeßõ‘S\\Æ‚K‚j\Þ&’„d\'m#.^\âß¸5--n+X\Ð&R\Ñ]\Âö×ŽŽ³÷(@%ItñGO5u¦±­2\à¬lA¢È´X\ÍV6‹µ-‘©lQQ\Z\Ô\Í¬\ÂG1i—rV™¤v\Z\ÝûMƒ1¾hºmœ4”s=\Ð!Q˜e‘U\'9Wb0YB\æ¶\Ñ\É¤ÿ\0›\Ë\Õ\Ë5He\ïÿ\0W\Ü.\áµa§\Å¤\Ú\éûªx’\Ú+‹\Èç¹·\Ã(\àzö9\è\Õ\ék\ÕdPó\æ³Y\ä\ÖI §Ž‚½\ãøb²hx¯\rx xU&‹²K\Z÷b\Ô,\ä«}U\Ô²\Õâ·ñ¨‹\Ú\ßj\Ø{]\ÛJ`Ç“”p¦\Þ0V1÷e\Ý@bÀ)¨ÚPD‘­&0\ÊA/\è[\Æv\ÍÀ¦ºsY\0¤ º:„B*Uû‚.&Œ0–\ÈH$\Ð\á”\Ýüz\ZýžX­¬\ËS[·‘d^X6E»\Ðf\Z<ocö³€b\Ò\ÍPM g\ìrl;Œ,\"Œ\Ão\Zô¨@`N»`5\' R’mU\Þ*f’4d5öJE­\ák¹º™…d½Hƒ‰ª|Ó·\Öõ~\Ë\Ì\ÚfÃ¥Ø«iQcù°Ò‹{O\ë´\\.+\×=4|ú\ÇQSŠñ\\W®ƒƒ\â¸šõY\èhŽEsX\È<tQCŠsŠõG¢Ô¿Sm0§\íÈ·±p\æ+¨\r^@\Ø\Ôm\nWs¿¡\'\ÙcSDm¿\æÚ°¸\0V‚zŒ\ä\Æô\ê\ÜT¦X­\\\Ä;©#\ì\ï;Çº\âARß¢\ÔW\ÆJ0\n\â£Rký¿b	ŽH\Î\nýn[b\É<Q–+¾U-w¦–m,0“DŒ°\Ðby#Ò£Ž£´\Ú\ÉÚŠ5T)÷ÁXØ•Ì†:TjŠm(\ÚÊ¹lbZ¯\"x(O´ÁsUW·\Ì+Ga\ÍØ¢Ë‰\n%H\îC³2\Íþ\Û\"®q\ÚLºAIô«ª—úŒ‚8\"v£©C¼ôöh\nó\Ó\Í/49¬\×5šU–=’E\nóGÈ¬ôòiO\ä×¾›j@Es´\ÛK‘y\Z:\Ù$\Ö\Â9UžK\çŠ÷G\á’Æ²QŠBV#† ¡V\Ñþ\êA£ö£¡3J¦¢lÒ·\Ôp;ø1\Ë\Æ\ì\Ñ\ÚkÀkÝ•4\ê\âYF½;i¶m`\áF¸BHY˜2‡.7tHfp\Ò]exf^\ïp%ýÙ£k°\0üaG4l#º\Å\ä\Ä\"\Ã,p\ì‘?­S¶²ý h\ë\Í#+6\Öfrn$\É\ÔH\r\ÑÍ¼\èÔ¥”	\â#\ÍL\æ·m/±–a$­G,òºðrµ¢\r\Ú-\ÑÚ­\Í <\"†™EŽ†ˆæšnhù#œÐ¯5Žƒ\È\Ã\Í<t9\Åy\é\Æ(f‰\Íx¡X¢:®OnH%\0¬¢EN\ÙÒ­fÁºœ…ž.ñ(£\Æ#?\×&v~ae4eN0al\åYE Áqƒ’Q¹q´ò\ÓI•ž\éR¡Žk·†\Þ(*\r¥e\Ê+Hiß&]Ÿy@•\Å3\ìa´\Ó\Â&tPª¹’8	£\0q4.Š–ø¦-Ô‘F«h\êxcŠ+m\Ï$?v(œF¬ü\Ä{…,¹eV“!\n&LIq”¾Ó»f\Î\áûvó¢B[*+°³€Y¤–E2\Èw5\Æú»û8f#Af\Z\îZš6\ËË‡µL/CK\ãôñ\ÐW¿ú>f±\\P¡À<u00+Š÷\ë×¯\ï\Å{\rp+Š\ç­\Ü{’&û@Ôœ\Ò/	Dj@-,[ªó(\èG\ã(dZµ\\H²}·ýcVjˆÀž\æ\n–ÀûÓžU\Ö\à+¿“+¾\'­,d¼x á‰¶=¸¥Ëª¶$.7\ï\ÅCÿ\0\Í$I[xþ\Ä*FøpGH˜Tk+4Ñš\ì\ÉOÚŒm$²Ä¦ ·fic \ÅnÛž(b;\ÅR3~\ë ’¦\n*Hk~j\Ë ›)œ\ZS¾§\â\0™iô\ìÕ¿ˆ\Û\êŽ\Ø\Þp_,v\ïvj•¸v$Ä«I±¸ÿ\0­\nÿ\0C3a*[%vU<P\ä×Ž™¬ôñX¡\ç<ô=\n\çy¬s\Ó<ŽGOg\ïýWŠ\æ±\×4\ë¼4\'¶\Å\Å!³\Åù\Ü\ã\nn™À\r\Z‘¹U\ÊZ²Å—Fq÷]\ê‘1±#\'-\Èe#k…&WaO0Agmùmöñ,	\ØT&8§\ØÑ•ÜŽp\ëõˆ.#¸¦ TdYAÊ¯ö\ÊR£#[ 5&8\ÛE1\'bž4H¨@d§Œ¦Ø™\'mòwt\Èy>Õ³\rq1Šƒ®\ïS$†iwT—BÉ¶W\Ü\"P\Ô\ì¤È†&Cš]¦Ž)z•ËµNÀÑŠ\í\Û›·KÁs°|v%“IUsöbv\× ôZ\0Ž‚‡C\\WŠ\Ç\×\ë’8ò1\Ó§qŸ\ã\ç ñ\î\\s\ì`t\Årk\Ý\\G”¶b\Z\à1\Úò\íT{\Üa*\æ2\×0\Æ2¸\Üw*\Û6e‡\Æ0\êUœ‚ÿ\0R\Õ©h˜5mÀ†\np•+\äü‰aˆ-aÚ“³\Zgº%\Û!\ÜmÀT`#­p²º¢Ú¡¢}\ír‚#<p‰eòX­F!_\ê\ÒAÀVED”T\ÃrVy­\n¡‹“’§\"3‹…Ï©\'¸Ò³”^\á\í\â/\ÈX\"Y;°\ÅzØ+*\Ì\È\Îx¤X\ÞF‹N†)&û¶\Þ\åv\ËñW[Aœý\î «.Œ\Ó8u8Vlÿ\0\\g\Ý5y¬\Ñ\éž\ZŽ(b¼×šïœ\ã\Æs\\ƒB±GŠ4\r\rq\Ó\ë\×C\âE\í43}‘¸Œ¥W\ë~iØ´ñÿ\0 ù™‹\Z‰?³ü½\ë)ö.i¸®L<\Ôh\Z\Ò9\æ.çµ…£B˜\ÍlGsL„w•©JŠ€\"‡¸È’­#€_\ìb9¤#k\Êõ\Û2L\ÇoýbF™)\'V \Ñ:	\â½p_m4Ñ±–M\Åð´³fC†r\ØœP¶vq G–=ƒd­&ø\Ìal’\åX«\Ô\Ø9«Z®\åµ**DUÂœO¼T`\èi¾òO‘}„‰Îˆ6é·¶±\îy6+\Ê*7\Þ+\Ðã§š<VxJA£\çŠ5’M\nð1\Ó\Íqü\ržýWž„P\é\Íz\éš<Wš÷Dn\nÁ\\H6B\ÊK…½bRY¸³(pfbZ(F+žŠ\Û\ÑÓŽ\n\Úo5h6\ÔKÌœ%\Ë}a‡tñ\Æ\ÇlC\ì\Ô\×\â{®&¸\É¶?#A&VK—¨\î2‰:\ïüŽc f©‘wFu\Ý\n–Ó†a1\0‹Eba(]€M\ì\Ë\Ûñ\æFEVhG­ŠŒ¡\å;£FIKû\í2©ü\Ù\Ú\à£n\í\ÛuF»w\ã9lµH\ÌQm¥ˆ<s\Ûóq\r\Ê\Z³1ŽJ1v\ê\ïÁ8¹M$*[\Ï 2\\}^\á‹RF#Q\ÕEz>8£Àu5\ÎV³\Ó¹¯4CB½ø\èz\nöÏ¯f¿\äÒŠñ\Ð\Ñ\é\ï$\Z¸‹¼-\ïò\É6(Î¬·S\\½¿Ì„\ì`”n\ÙPÍ”\ã/µ„*A8Ä…’H\éf[r¹•\Ôñem\íÀ”3\Ë\Í\Äù;\ÓJ\Û$’­¤Œ¼c–Cð*&\n\ëu“óC©†®D)õvzMfŽ°\ÄBRtž$±ù\âúôL°k\nõ.±e>»V\×3S\ê\âmT‡‹QÃ¾³c\Ôû\ïùJ*i‰­\ÇÁÌ¦¥‘¡’KÂŽ.\Ék;•\îI#-B$dbÝŠ½´akf]‘½V©\î@«©œÕ\Ò\Ücºû‹®+¹ô&[9WcÜ‘5\å\Ï\Ú\Î\í\ìx§¡\â½×‘šð1ž€W¬bb4{4µ\ä‘\Î8®h\ämMG\Ës^†y9\ÇLš\âœqsk\ë½·	‰Ë‰\ì&üEb\ÃÜ¹Ì­´\Â\á\àF~¸‰¢höAËˆ0d³v«@\ÍR)\Û$8KH›¶‹µždjš6©¥}ßš{—µ\Ù+/l=\È\íþpJ›VX\ê]l;\\\ê“oMfC_ºusBþ\ão\ïhj\Î\Ê5\Ï\î/Qk÷-Sk³	µs0]Np?q¹5û‹µ%\Ôl?>B\îi¯6, `\\F+ª\ÃS\Ý!Q9«†B.\çš%-Zd¨3\Z m£\ì“C5‘\ä\ì\â1\Õ\ÔqÛ¸¸Œ\Òl¶«X¿µ§5yRË¶{U1_Gz=\Û\Èö\Öˆ®z\n÷\ï9¬ó\Ðq\Ôñ\Ðy=ù#šZõæ€£\æ¼tæ¸¡F±X®z×ž‚ŸU\ï\Í^k\Í2Š)X\â\î2ö‹\ãü\Ì1\Ë\Í@6>K¼RWÔ¡•Š¨öÕ¹\íU›\îtÁ$®Ò\Zq0PÓ®\ä\ÔE\ZŒ÷0¯ï‚¢ù¢*üªØ«üª%ù:4Ÿ½K3E¨º´\"\ïP¥ø\íÿ\0n]*e:\'\Ã%˜„[m{B{ý#\â—Z„\Ëúw2Ö¡ús¬Y4ŸÕ¢z]\Ò\Ím¡^=iÿ\0”´Ÿ§«jº\ß\Ä\rª­¼™µø\Ô\â\ã\á\×V¦.t\ëùRÔ—V´º†úmUá¡¯8/¬3G>®Vq	\ëM¶’J†4¡:…\Ü]>¨lcH\ãnŽøö\êø¾f!š\Õp» \0\ÇWmý7YZ\Ú\Zk\Z\îkm\æ+h-‰4M{Ž8k\Ým8\Åz¡\ã\Í{\Å\nq\Ó\Í3\Ðô\Ú1Š=3BGÀ¡^+Ñ¡Y¡C¡£\ä\×“^z6Zˆ\í\Éÿ\0fA‰7‡ˆ‘4gdŠ£½öW@Hÿ\0@\0\r³okB\æ[C‘ «\Õ\ã\"Bð¥0d]:§¤[þ>¯ð\ãvš§\Åõ+Z˜I–òž\á°iaÒ¬–Xn4‰~i\ëŸC@¶k\Í&\Ê5D²\îW\Ét˜®£øÞŒ‘[%Œt\ÑB\Ð\Üi¨Eÿ\0\ÇÄº\íÆ¡T·\Ò\Õf¹™µ+\æ\ZO\Ç\â‹VÓ´D†+û(\ÚO‘üeõ-I~ia_0\ÐR\r>=rºü\×6—‚iœÁ\Ü\çIøµý\Å|s\â­GW¨\Ò8\Z\ßN†ÚŒ¶?\Ùmjµ$j*\á“T`jFt›~ä“¨­û…\ïÿ\0¬ª\í\Â|~\"1š&³\Ô\Zöhô8\ÇC@\ÖhsB‡C\Å`\Ö:{¯T:óCüŸ tõŽ™é‘Ÿ~¼WŠ\ç¡ÿ\0\\\ì\Z\æŽM](†õ\Ö1W<4ŽN\îY¹%T»\îj•r’\îJmJ³\ÆFH¿]\ëm&\ÇMµ$9$È²\Ýj-’Num\ÞA¬ü\Új…¥¥À†\Ñ-tHŒlmDüUÅ¦¡\Ê\âBš|ƒn—øwZ\åŠHšd]¨	EŒ0¦\Új\åUþ_ÿ\0R\Ó5}¨-ý¦¸V\Æ)\ä\Ün\Ø	\àh…|§d±%”W\É4ù¯5\Í?\ãm\âÈ§K\Ò-£€Ck\Z¬BD†×‘Ñµ½³\ìÓ­#Š1mo©]mdZ¸nì³¹-¥vÑ· @*ù÷¥\Ñ\ÜX„­{v[«\Ï^+\Ðã§¬\×3\Î(žEƒ d\Ññš†¡š\ãøg®xo5š\ÝB±\Ôñ\Ó\ßýdV\rz`WŸ\á\èy\×Sµwp)&§?hÁ\î\Ä78™¤Aýµ³1\ß\î¡edÜg/6’\n·ž7’\ê1*Cm,7Gv\Ò\à+\Ô\ê+\î¬A5s\nJ.t•\ÌöŽ\ÓX•i ‹m9ln\í>GÛŽ\ë\åO,:G\Èl\åŠ-nÁ+Tù6•½œ”\íº»´niW\ÈR_\ëI\é®S77(\Õe­X^kÌ‹WWkk?1†\×U_[öõýnK\ÊY5\Øi9ŸM\Ò¬­V\ÙW\Ìv\ï1KCd@«÷H\ã\Ã\Ù\Ç\Å\Í\Â šA5jLÈ“Ê€\Û 2ˆÿ\0\ÐË¾<7n\é·Fÿ\0y.Už ‹µ+5\î€®z+ü\ÐÉ¯Tžhý¨òk\ÍCŠ\â—\Åy@õ ôqŠÆ”ô÷\î¼t\Í\Zq\É<g3\Ðc _!…?X\n!M\\m4€¬±°\Ý‹¹[lˆAŽ|J´¯\Z‚º~\Ä\äUwo\îø™bb¹!–ŠóÙ§]†M’¥Îœ³	-~\Â\rô,Úš\Ë`»°6\Ööö›CÀ\Æ;h\ØÕ¶¹ª\Â\å:\Í\ä_\'r\ß0\×mV\Ï\äÿ\0&:\×þm|¾wr´ÿ\00½’§ù«5jN÷—¹¸{™À±\Ù_‡#Q³4m‚5µ¨’­m\ÌTw#¦ž¸YœTªiŠ¤f¡™±q1+5\Û \Ô.7™¹V®j\ê6q#«‚v\ÜËˆ\Óÿ\0´Hf»L•¡\\c§xk\Ù\æ˜¢x£B‡\0¦ó‚hy\â…z¬óF³\Æhm¬ô\"±üs\Éâš±\Ó\Íz\ÉÈ¯B°µu\nOj\rn\"!SqókýMo\æµ˜3T±ýmC!¶¸û\Û7pD0Ya’F\ßW^òÿ\0¼½m\í 1N©[~\×M\Í\ïØ¦•”PòK‰£´6Ú´Šöˆ¯\ÅŽ\ê\êEZ\Ø\Æ\Íûr«]YD´’#Z—iIZ§B¡b.]lð_‹ŠŒ¨µm\\\Û+¬(\"H\Ô\ÓFù¾´8¸¡nš6ŽöMôAÍ’\ÑÑ±Û„©«­\Ê#\äh‰Ý½ô3‘^z5\Zô(ôŽh\×ù\É\ÏB:û8 @&‰9¥¬ô\Æz\ZŠæ‰¯käžƒšóB³Y¢OLdy¯4+×šs\ÇÚµHQ\Üj2h³\"Û»\ZR»9Yc‘Z`$Š¦ŽŠ\Ò9«\ÆJ‚U¤þ\ÅU\Òo¡ G•ñA…³¸»yqMo¾¦·\ÙFX\ãdf\Ø	ŽÙ²¶ì®¶ò²Z[Ç¶8“pŠ=’B†Y,¥z¶±\ì¬\Ãt_Œò¯\àˆbSµ\Ö™\á8<Iq+¼‹\ÃöóB,VB•l\Ô\0 ‰f C99«\"Ö£qµ\\¡x\íòùÊ¿p\Ö-÷ñÈ‰¾°üv\0–\ät\Î(W¿5\æ³Ñ…×‚|ó\\Wš#$š?\Õ>H\äû\Ç<¸¬Q¯4<xh×Ž™\è(u\Åc¦N<tç¨¯5ò(?¨p\éþr™‰\Ïv&¥–X¢ÿ\00K\Å4hZh\ÊQ›y\n5³\îH\äú‡b}¥Q™\ZBŒ\ÊÕ”\Òn¯Eöˆ\Ê\ZuR¬‡\Ô7E™¶Û¿\Ö=Q\åQ§Š·Fðn\ÓÀ…¬„\Ø\"c0\ÉF\ÝJ\ÉðªS‡b¨ªvn­ª ¿Ò°ùµB\Ò0+M+¿a\ÍF¨ô¢¥‘jk\ÇPŸu}Ö­{˜C\ÆT…©\'*×’\î7rs\Ý%­\"ð\Z÷\\Q\Æ+À¡F— ó\Ô\Z$‹\ÏA\×\Åx\èk\ÇS\Ås^³\àŠ\"¸=Esy9ôzcŸf³\Í5ëšº.m\è˜H\à\Z%\Z­§\"HJU©aVóö\Üö¢3®úu\ÃC.ú³‘\Ø@ø6V9N\ZFm\Ð\Èø\Ï\"‚¬\Zœ„¦Œ¤fDu4+³ˆA\"ŠŠQM*\ãq*‰*T\Ú %+É·\'9Žð‡{…\"\æ|´÷8Mæ»ƒ3JµÔ‰º¶\Ð(\Ü\Òb²wc)mp\rB¬i\Ýs;ý\ïnW\Ü-ZÁTf•$‘Àí‹©Ì‘\ß7,Ù“G\'¾\ëâ¥\ç ž¢€ú\Öz\"‰£\Õx¡\\\×ú¬\æ\n5\ë4\Z‡úõ\ÔycDô4y\ë\Í\Z-G¡ÂŸB·Vy¡_\"³\ì\Ý.C™#\æ¡\0„s²5™i	4°÷&\áq‚QŽ,¦9´¸\nL­ºy*\"q1¤$v\ØAttWlX$\É\Ö}ª±;K\\Wwÿ\0Yc$B„…i\î>‹u*¤³\nš\é\\~S©Jb7O¼‰d©+6\éyðw‘[¥c\"& û¡i!À\\GŒ\Ôlˆ°É˜\âŽ(hýZ\á\Â\Å=\Ë:]JXÆ½\Ñ\Ø\Çoö2*\Í$kW\Í\ß\ÙÜ…¯B6tŽ‹\ÔG\æ\àV8¡C óC ¯­ƒš&”W®h\Z_\áœW¡€8\Íy®\rhW¼s\ëE\Z\'“^¼~:)ª\Ùþ}ŽvÐ‘[¾*\Öj´%G.*)AXrkj\íº„¸,\ËPý\ë¸\Ï¬*©c@6\Çm´§zù¡\ÜH\ØÉ“-\ÄBF\Û\ÙqºVüVd%’+uÀú5q-0þÀÒ¬‰ºJ@|\åKû \\’\á\ÌU,\Òl{f,ñ\Èkµ)¡Ù£\Û_\ì(h\êYv¿qŠ\"	7-a¥\ÃÔ³e®gþ\Ù\ß&\ÑBº.Z=\ä\Ä\èj\ç\Í\Ô\çHHÌ²\Éaoø\ÖÇ =i(WüóY\èO-\äñ@\Ñ4M\Z\Ç\0W4\rsG9\Ï@9^H W®:b³\ÐñF\ãøW\á\ÏOø¦£C\É4<c4\rgm|‚\Ä\ÙÜ¬•óô2\ÄT›d™)P\ÊÁRE(\ÑdK\Ö\íUœÑš´\ä.\äH¦Á¹h\æb\ÓEQÿ\0ô’FZŽJ\ï¦ÌŽT\ÈI\æ(TFd8§\à4rF‘%\Ã*«H©º5Nñ\\-/\äL\Î\ÝÇ•³.û˜­\ì¸hSsöö\ä\Ø\Ä\è‹\'t¶¤\Ý#\í\â5\Úa\Ë\Òãµ–wšUŒ\Ü\Þ*¬¬ÀD¨\Ímo´vµ&Ž#Ye«\É74’\nøõ¯~ôpU48¡þA\è1Šœ\ç\Õx¯uš\ÎN)@\èO òk=|×Žžzx5\èžI\è+\É<\ÖI¢E5s^i¨‘Jy¯8#mkVßŸhc•\0f\ß\Õ\Ê(J³Ÿ+	LG\'\ÛúÚ¦UjŸ¸•­E)\Ä1Q¾:…7S\ÄD¯\æû+F\ïõ ÝœQ\04YD{‰m‚;qpy\ãº\ì\ÅVÝ˜HÍ¹™7\Å\Ý\ÝrZH{†IcVˆ3\"•£\ßc‰$H¢…D\ÒÅ˜\ä\ß&¨±8ˆ3\Ð;kn\êi\Å]e82º\æ\Ý¨÷öÁ\Í<¢A;°S­K6\àš´«1egœQ==ø®(\Ð\èµ\ìô£G¸Ï¢p	\èsœP<{\ÅÁ¡\äù\Íz¬V:\Z\Ç«\Ö+\Ýz :4I¯ú\èkþ}ôð(R±©#W€E{\"aÕ°3¸‘³«\Å8\Ëð„»Wg\êËº¡RŒ“²´7;G–•v+M4‘Ýº,´b*\ËnÝ‰\"æ»ŠP\ä\Ô\å]m\ÝVûwwcZ¦4\Ïpv\Þ2\êùq$0ö€Û¬K•\Û\Z\Æj=´T%vpk¹dCF.\Ývþ¨ØŠ\0X\ËV6\ÅC÷$\nyw=\Þ÷7¯@n0G\Û/6\ÕwØ¬\Z:¸™^¯$,\Õñ\Ý=\ç¹j“É¬\àô\Ç¨G\Î75\n#äž\Ó#§¡^)E:qœÐ¯C\ÏLVzfCB³C‡€8®i³ž\r{ó\×\Þz\noó¬Û•¹– \Ô\ì`xdL)V0$ˆ«T2\ÌyY—_¼\ÊG`£¿‘»\ÕE\\¨ÿ\0¶5m\Åsµ\Ë-F2@\áBµ2v\ê]¢”`¨\í\×9@j^÷{·µ$\×f\ël)l¼‚G–‚nŸ·™YdUÜˆco©s¸ý«?T‹m÷\Äqÿ\0´…\æÛ…¸9{\0íšžA˜>\Õ\0T¦,\Ò\Ëý‹$Ø©œ±žP\ík\\O¦Ù¥¬&{¯G ¯1Ÿ4|u(\î¯#Œ\Ñ3šõâ³â–˜ž¾½tñB…sJOB03\Æy\è¤×šM75\åMz¯#’hP=5øÚ¦jx\ÉX¥e’)A\0Y\\ö\Â8QW†HT»Û¦0\Ô«ZM²r>\Ò*º$P©Ž\ãz„ŽAPªøjŒd¤…LÒ„¨e\ÊvÜÁS„D\ÂG\"OJ[h¶\Í: M©¤ \ÐX\é›q¬•µ‘Ê²Œ–JV2R\Æ6Ï¹Ÿ¯\Í6Q¦‘I\Ç3\0•/qŒ„„±RLnòmIŠ¼—(øF\Ð\ì\Z5\Æ(ôÁ¡X\èhšö?¯=\Ç\\Q5\Íf¹É£Y¡Ž¸¹\ès\\\Ð\äf…\n÷@\ã¦+&½sCžƒ\Ës^\Ñ4¯\Õf–µ\Ä&\ÖDÜ‡\ê\×1®-e`!¸©B\á\Ð\Ù8‘\nÿ\0bHÄ­\Ó\Ç,x\ï<‡zÌ­Q2Õ¶,e\î•yeWp\çF¹ŽLWuB«\ä0-\Z‹y’H;A(›L\ÒÉ„DF\ÈkbCFª\ìÒŒ\ïò*\Év½¸\'F\Û(·-%-¸2\Ç\0PK±\Ø\êÁÝ‹’ª¯–ž«“ö˜ŒoÉ‰#ˆ¬›‹0\Äób¯mK(A¡\Ùþ\áw\Z*z\ËsM\äVi€<5\n4:y¡À¯uÿ\0^ŽO5žxÇž‡\íOX\Ïðç§¾œt\ç?óæ¼œt÷\Å`\Ö:y¯òH\äVM5cžhÐ¢y\Ý@Ö¥–\Çþ.“\"5HŠ$‰‹5½\ÎY&jÓ¦u™¾Ä²\Ð+5]e/\Ö8\ËI\ïQqBE&,`N\ìŠi\'&B¸8Ë«(\Í!/Eq$\Ó\Ä2¡E–Wnr¬Di\Ûzx¢Tf}²(\í*eq2\ï¸^\Ò3É„I?\èÙ¶$icX¢š¤”\\I#c­)\\\Ý\Ê\"A4’\Ô\î\å\n±?lÿ\0š–C»¸½\ÝÀU‹ÿ\0nOŒÛŽù£\âh\àš\ë\ÍõŒô\ç4:}k8\é\à×ž‡¯\à€M\Z+×®k\"–F½Ñ¡À¯\'9\ê+Á\'‘^\Û\Ç½Q\äœ\ç\ÍŠ\àVzL¡Ñ™w8ˆ\ÓÇƒƒX\Úc”\Ä\Ð\\6È®%I\"»Ž\Þ\ê‰\ÊI3	c&Žø\ê)U9wM¹Sm·vjFýB\âˆG†0¹\î˜\ä\rÉ˜l‡i\'Rr\Ò0\"†\å©˜Â†‚W¿³¼´IÝ…X\çO\ëv\"2E²>Fe«7V«’Õ¹\Ë±$“,µ;v\Ïtn•T\Ë..f\Í]\Üq$ñ;­ô°Uø\×1š4Ù£Á\"‰\ç¡Á\ÇO~+\ÕWƒ\ïš\Ï<\ìX®s\ÏSB³Á k\Íz\Å)GF¬×Š÷G¦\ÞA^+Ù¯x£\ÓÀn§|óG 4¢¯S…¶³\íÁ\rW;…\ïŽ~\Ý5is²+[¿¥\ÌÁ’\'û\\lTw&¡•¶¡;\áÿ\0.	(c†!<¥J³R\"\î–C3\Ðb#ßš·ˆIHK\ÔJ²4ÁLVö\Å\è\Ú\æ€\ÌLlŠÁfp!_eÜ«\Z¦Œ\Â\ÞÙ\Ö]û\"šM\Î\á\"ŽS#JÈƒûfiBC\Å8úLTU\Ý\Î\á\î˜\îr\Òa%ºUY.K=\Ô\í+\ÛÚ¤T\ä\Zø\ÚcOcG§üõûRŠ \Ó\n&‡=4|09\Ï5\àô\'¦~\Þk5ÿ\09\é\ÅdŠ\ÍsX¡\àÿ\0\Ð×Ÿ\à:\ZW²z7‚hš\'=1G	®hyZ\Ô\×\Z‰\ÛF:e\ÛN¯µ\ÐÓ—Å´ŸkI\rE!#¸¢™\ãwÈ¯´\ÔrVó&\È.\é<*\É$J;hŠ\äF\r24…¶•\í»©\ÂKˆ´­¯\Üm²\Äi_^\ÜNC’\âHKO5¤HÒ‰\×Q®Ò³¤“½\Äñ\Çq¹)\ÅL;¥ nô94]*ì—¥g…d™;72÷ó<A!*{¡S>ç¾¹\Ø\ÐÁ\ÙDV-\"Z*v´Ìƒ\Ðøñ\\ŽŒ€x\É –\Î8¡\Íhš\Í=üš\Æh×¡þzóCøx¯5šæ—“B\È\É5\Å75Ž¢¸À¡\È\ä3`°§\áLý³DW\Ífµa¶ñ‚•û(f˜T\Ê\Z¤H\ÉR—.‹È¨d=\Â\Í\â\âGP^R\Z;€µmr\Û7®\è¯‚9Z\'w‘f\î#ˆÀ\í<ª‡s5m=•‰\Ã.#euD€¶\ça€û´½¸­¤\0\Ü\Êd\ÆGY¬\àM\0Ž/\ÇaYo	5r6È–\à-\ÂFŒ\\€%F]ÿ\0k‰Gzè€—÷,‹mspV\Û+SOS\Èù¹º\Ë\ÚZ÷\îÝ¾¨{j#\nÐ¯n\Zó\ÓØ¬× q\Ó\ÍcŽ‡8£^+œ(ñ\\P¯=š¡C5šzu4Æ\à\Ó\Ö(ðJ\Ñ\â²rk\Ý?òsDòF)óGÃš$P¦?m\ÄY+YSŒP^\å}J\Ë-2¨§\'j Á‰Á·o²6ÚŠ_«f‹+<\èÀ\æ\ÖR§¾Æ »\Ú\ÂBhNHK—\Ý\ÍÇŠ\Üe“¾ò<±Ð`„£0h\ÖbŠc¨\îa”\ÄD\ÓK<)~\âC\ZÅµ£¼t$Wµ\ÚG\ÖYñ5[\ÜI¹˜\\Ay„‘\Æ\Ù)y\ç0‹«¼¹¾ð27k¹¼I)®Z5k¹¡‰c]«”Gd\Ýg¨4+ž‹žž\èr=š<ô\Å{\Íz9¯=3Õ“Jx9¯]}t\ÝKGŽœ\ÓP\æ\ï£Vxó\Ð\n÷\\€¾O4\Ù\Ë\ÑcX¬\à’(œQ\ÆhuUÍ¾\Õ\í•(ˆ^7*ñ¸gn\æ§Ý›{ŠŠAŽüxwÁ\rº‹Œ¥À\Ì \Ço\Úd‰&c\rµÒ±¾ó\ç0’È²Ž\ä\n€›‚’4ŠYT‚d\Å\Ò1eI\â4ómcp%¨\î¶SË½\å•¤G«Ë•†1¨\íkYP\×`F®-£ˆÌ«,Ï¸=\îú\é\â[»§\Æ\í\Â·\Ý\\\Ã\Ûöcy\Ú\á\ì\í\Ö*H’žV\ÏÚ´¤V¯|õgÁ=ú¦È¡\Å™\àø5ìž§\ÏkÀ\"—$Ñ¯õC\ÇC\ÍCqX\Ç42(ø¡\Ðùj\Ý[°rk4<\àRø¦ðÕŠjn)ik\ÍO¿w\ßkr‡jc©ˆ\íf\âh§…’Œ›¡\nE&Ewp\Í(#%\0`\Ô?­¿!•\í.’\ÖAI\'n’n\Õw†\È\ï\ä\íe|Žómü \ên¬Ê’\Ãß’:ŠüMR\\,Žo$\î,\ÒHb7\Å\"MBX’mcq‹P‘\Äó+Á\Êù{—\×Ja¸&\à\ÎNû»¥kK»Ô«­W*$}\Ðo\îµ\Ë\Ôó#SqVÖ­PÛ´ =\×m• FZ\ì\ÐñC5\æŠÀ¯I\Ñy¯4\Õ\ÏA\ÅSW¿5Ž‚¼\Ök\Z R×ŽƒnOOT9£@ñš\Ý×š\\W\0{÷Ñ¸8¬g§Em­µ\Î[Ä›k¬×¡[¸\Î*\å‡g±\íQ*¾\çd\íÎ¬µ4nkŠ\Ú\ìUFUš“5µ”\ÌôNJÊ‰2MÜ’ $Ž¼w*J\Ë\ZÀ³+(™\Õ\í\æ\î\Ò\Ë\"¹\ÌR¨]^+‰q]’\â`û\ãI·¤’W\çÂ”nZzÙ¹Ÿñö\É/Ž[ƒ,²K†¥wi\îÁqy‰%\Ò[<×ˆd2™YXR»\n.Z£‹x·‡h\nÅ´˜&¦&¾6q¯U\ë\Þy\éÿ\0<W\Å\nnž(x\Í#žœVyÿ\0žk\Åzo%x<®z\\\Ö:dšk\æŽhñDt\Åx\ë\Í\0)5‚+œýy£þN0Ø¦\à\ÉM\åkž˜§pƒW\Õ µŠ%\ÅûÈ›\Æ\éF\Ò\áù%–\æ³g|xQ@ÒŒ\Ö~’FÌŒ\nÓ•»´Gp\Û-\îûu\r\×1\\¯o¼…+NÛ€º;â¼…ŒLÁ¤KEs!U»‘e$\ÒHF²[3‚÷W6\íûš\Ü\×yŠ™AQqn«5\é«{ò°fJ<o{z‰W—\â@\áX\Ä\ÈT ¸H\ÜR\Ûñ*ƒF‹˜&õÔ»Ut²\×9\é\Ï@hÿ\0\àVk‚\ÞÀ\Â\æ”\â³\Ñ|P®A5\ï\È\èk\Øÿ\0>\èzf³^An™‚k\Í{¬ñÁ=<P\æ¼ô÷žk\Ûyjni¨ÿ\0¬Qòh\àVµª%Œ\Z†³=\Å\í¶ó\n¡\ÈÙŠ‰\nÓ¨\Üø\Û(2ŽŒc%%+œ\íð\Z¸·5¶AY\ÍFIa#Uµ\Æ;ª\Ç:\Âýµ1)\å€\Ã\Å\Ã%CrŠ?%ªK©£\êwn»U©¥iNø”¥\à#ò$z{¯\È.Ñ…†\áQnµŠ¦Õ[™\ß$4‚;eûaAFí»2#@)÷ö¨ Vt\ÝDFŠGpi¿\'ü+¨dY¢\Í\nÁ¡\ã8-šœP5\î\é\èù\ÅhsA¨ùóCš^Iz\æ½Pç§‘^\rY\ç\×><\Ðñš\àt\Ç|\ÐëŽ„sO\É\ç\ÃóMG\Éò0j\êq|‡V7sZFó\Þ\Ú.a\nXdS+*\Ä\ÛÄ‡›…í™“c	6˜Ê°‘6\Ôyr»…nl!YB‰`Ü¦D´@\0\\m¨\ï\îYD7‘_I¼\Ü+‘6\Ö[´f\'	w>¡#²]’M\Üeš\ê\r3=1ž»\í’\í\Ù$»\í¨\\\×S\Zš^\àyyRV—4\ÚEHB»°\íˆ\Ù;™·Œ¥1 7\íÛ©\0£”Š\æHVOˆüŽK9VEzq\ÓÑ£^U‡\Û8‰Â‘\\V2A\ÍP\ç¡<õhp9è¼^hy£Y\ÏO|\ÒóB€¯=5{\'\àœQ\ÏLP\ÅrM7š*	£GÁó#\×\É5€\êc$\ß±z†&ûh\Ã\Z;X:\ìFð³¬\áž9÷\nl•´-L¤	\ìåŠ–b\Çµju¥Jš\ßi–\r\Ã\í¹¤ÛžÉ¯úY\ÂW\å\n)§Ž¤d¯\È\Å~DŒI ‰Q(HHß—¤\ÎX4\ËOt)¦\ÝM3\ÄZ\ïpHÙ†\Ä$¤‹4ˆ	E­ødû„\ÃI“G¶I\ã	5*î«ˆƒ\ä\Ü\"¤7\Û\ä–\ÚVUø†½ÞŒ\Z\ä\ÖM{¡Šnœ`°ñD\×5’:Œ\Ð\â†:\n\ÏNh\Ñ\æ¼ôJšô\'žh\Ök\Ýf½F³\É\ëšTdúŠ^‡\É\à>)\èøni\Ø­j«o©xY\Ã\îo„h\Â\Ã\ã¶\Ç5ºJw)d\Æ\Ì\×m·°·6è‘´[\Î6T	¾2¨\ÊlŽ\È\Øee@Õ·yh‡k¶¸¸–‚6H™ª‡=ˆööT„…ÒšÚ±™)­eŒm}¹‘ks%4‰_“Ü¡t~S\å\ç,Fæ¥ˆ\×\ã\í\rPèŠª¸a\ÙKö\Ä\æŽ\Õ(	1 \îGØ»aV®]\è}–÷\ëmuq7v£#\Ø\Üvøö·û¸aGš\'\ÐW}X\Å{\Ï ñ\ìy¯<\Ö@\é\âI\É®\rb±BŽzžhVk\ÅdcWüœ\í\'u5z\é\ÏP+€sY¥5\Í\ne¬n¢(Ô†µñkZ«M%\Ý\ÉvÒ­\íö«:w\Æ4ˆ\ÊÙ†ŒR™’¿\Õ\"ýSi©U•¯ù†=²%¢m¡Jv\Õ\í±Û¡L2‘L¬Œx’T\Ü(ƒ\ì\Å	8M\Ûó€´6\äF\0p\Ñ¢7Wa³\ÙÐ¡uŽ,V¶¨¬J\ÍM¹Š†\î2\ïhcTiš¼ý{‡cR\ÎZ·‡}%‘Ÿ}?ù¹V’_óªXYÜ»wl;fIáš´\ÍBM6\ëH\Ô\â\Õ-Et÷œ=gœ\ÖsY 3\\\ÖFŽ\rz\Æk\Þ:N9¡\\V«Š\Ð\èhp<P­\Ü5yP\ÍqE¸\çŠ>=y\éš\ç\nbEm£‚ñrø_“j<\ê3µ?¦\Za\Ô>Iú‹pa\Òôp\â\ÃnB3Pˆ\Ý\Å2„-¹\Òõj\ÆD±«¢öU©b\í\Õ~<Šr\Ê\èL©:)‘¡\îQ\ÌC¶\nv\Ã\É¢;\Ö.m•~a©<ýwÀ1«\03\ÓCA]k\n«·\ê#úÆ„Ž\ÓQ^;1–\ÃGD+W\Ò\áUF\Ö`\ÍH„ˆSt¶1&$À\0I¹‚c¦/€1j®\à“k\Û=C7q~=®6‘qmq\å¿?Àt“G®sX\ë\â±G€kœ#\â¼\Ñ\Æ#\É®+½b¸£\Íc¦:\â°\r`QmFjL\ã ÁV³{ø\ÑjS\Í+Ý®b\çôn·OÔ©ûñ\éÁ^\Õh.õ\à3\Ü\ÞD}ªÔ“ú\æEY-”«[¾\á \îRn\Ü\à#½<Q\Êm•£Vh\Û9F€´%Y\Ôgf)\á,9;\0¡rÚ„¡+õ\0\ÅMö)†™k\Í>\ÕC\ï]‚+²6‘ô0¶äŒ‚Pš(6dx p‘§.\ÕXÏ•U w½TôÆ¤1m¯i:ù0·<H‹s>>\rò\'°¹•vŠó\\WŠ\Åx ¹¬V¯\ÆHÀÀ\É\Å^(xÀ¯\æ¼×Š§@5Ž‹ö?ÿ\Ä\0@\0\0\0\0!1A\"Q2aq‘¡±ð #BRÁ\Ñ3\áb‚Cr’ñ$4Ss¢ÿ\Ú\0?\0\0h¤©*OU*OU˜õRz©=TžªýT©3ª’³ªJ’¤©=Tžªór§\Í«1\êžøÔ§c)\Ó\ÕGªwiÑ±\ïD;O\no\ß\Â=±†ls\Ì*½³L\èL*¦\âNS‡i\âi‚\è7¶ˆ\Î\Ëù”\ÞÖ¡¤\Ç@vU;Q¹\ä‚¥ÚŒ¨rùBk\í2>k1ê®ŒõWDžªýP”I\ê¯\Õ_ª¿U\'ª$\Ýz©(’¤©=P”\\P&Q+1RVd\èxƒ¡[ßŒ­xY‚#§À:•”B.y©>³[º­\ÚU^Ñ­P‘0Ž%Î±\0£Y®¶X(°8YËº¨\Í³‡xÊœ\ÂÛ½Ps™p\ã\'Ü›–½¼5~i\Ò×vM!÷Aù#u†\Æd°˜ù*X\Æg‘ª\ï\ZDƒ-Mt\ï÷!m\Â­\Ño\Õz\Ô~\î‹]\ßvTõ\Ùn¡J6CO>\n\Õe²h•;\r–¼.‰…V°n\ê¦9uW\\H¦nªw®—’Žm\Ó\Ëz\"nšKn\Ä*gÿ\0»¢¨\'Sp©\×u7Áº,\Õ\íþÙºq\ÊD!<\æh\æ+¼\r\'\Ï\àƒƒ§7½\Z§­Ã“k\ì\ÃuGQ’\ZüÃ¡X.Ò§P÷o\åzmi(<q•¢ß†¨„Â•<4D­”ÈŽ!\\>\Õˆ\è\ã²\n\êeB\"\ny\ìŠó\àê¡¶UñmdóÂ­5\'!¸E\Ïy»cF—öÿ\0\nI\ïNm\å¦B©]d Knƒœ5M7‘e9†·U)Çš§S–	\ÑùKWYº\âwS¡fTø\\\ÓŽx³¹š¨\ÖeA,t„\ÒAMø–ýÂµò\àDy¯$B\Ë\Ñh}ûø\ëêŽ£‰øp‹JžoÀO\r\Ö\è©U*5«3Óª{šëº¤ hi¨M}\0$M¼‚i\ÎN[ö¿ÿ\0EŸ¨€\ã€\Ý(¶‹%\ä&Ÿ\Ý7™¾c\ëøE¼\Ý\'T\Ùô^ƒt\í\\…\Û\æ–5º\råˆº‰Ž¨4’©–\"úO\ÍM\Ñ\Ôl°ø¬\Â\ã)M©(8)²Ž2Š”ü*:pZ¨_\àz\ï\Çö^\\<\×ÁYŠ\ê§sª\×\Õ\ïOx`2±xã˜±ŠñøŽ€~¾¡\Z\ØJv\Ê_\ç¢8\ÆS—mþ+¿¦\ï3\æ‹\Ü\Ó-l\Êmi\Ö~½¨C†©\Ìü\Û#k»™«#ˆ‘\á)­Øˆ!\Z$\\!MÉ´‰‹L.\êyº+¹-Ë»·0\æM§&\ãD\Úp`_e–Œþ  t²w.‹?]\Õ\n¹#¢§‰k¢J§P ùSn¤§¢\"V‹[¢,¡B…§§\rxj‹o\Â\ê\ë6\Êm×†žh ‹UiUjdõX\Üc\Þ\â`ªLÀ\ÌJ=\áú&Qk\êG\r¿u	´\'d\êA‚W)+™·Tùv\ëª\î¡\×Â›D“Y±Shˆ\æú\èƒt	´÷\Ù\nQ.‰YA\'Q¼EŠ !E¢`\'²\é”À$ÿ\0\Ê\×\Ñ¸¦\Òi\Æ\é\Í`³Ayúú\Õ6¢n\"«L*h\0@¨\Ò<\Õ:\ìx–œÁµQ\nzð<c„£\îQe&Q\ãðD/B¡’j*Jñ{\ácq¿‘—rñ\Ä2¡±\Ûu—b}Š\Â2!;\çr\å	¥ _\ÇðEß–%2•7\Ïx2õ²û-1\ä\Ü;€\å‡.æ¦¥°…1 4e\ê<Ü£m\ÓiH-ir\îi¯je/\ËùP¥Žª¥+&\Än²Á÷£HµÑ¥hS©Æ‹»ýF=:¦´ƒ¬Ÿ‚p˜\íDF\ê\ãPl³üV\ê/dz\ÃbYX¦übT{Ñ¿—8b–¿tð7C”¢\ïr(\"<\åGT÷$˜b±ùÉ§KNªÞ²»À\Ò2{\Ðsò˜Fg1\Îv@8\Û-þS#|Ç¢Ë„hS0\Ïv\ÜÉ˜N³\ïCm\×Ù´Wtt]ÁtN£\â¾\Ì\0\Ó_Šq¬h›C›D\ÚyuB„Z&ShAð£‡0mr»“:!CRBvoºv\ruO\ÃN¡U\Ãh\n\î\0<\É\Ù\Úy§¹°rQk£10\å’Ä @pµ\Ö\Z®G\æ…A\îsFmO\Çüð¸E…Âˆû€ð‚´ôR¦8\î\Äð…\íZ*µ\ZÀ\\l\Ä\âZD\ÃBy¼ü\Ç\ÑY±;¦\Ü\ÃAwT\Ì,\Ü6eS\Ã\\Â§‚v\êž1¸Ê™‚h`Áò_b¶‹ì†½,¾\ÌÙ–„\Ú3r,s;!C M¡›[ÿ\0(\Ð\ÚJ\î[ún:£‡$\Î\ÈRò®\å%w\Þ\ÔpÍ“#ESNT\ÃÇµU\ÃHò\n­.\í\ÜÀ–”^\É2\r7Í™6mƒ—wna\áRý.>¥`k\ä!µf¿O%q}Š•\Ä\äÇ¢(V¼%O8A_²<5û¯)\ï\Ëy°X\Ìaªr¶\ÍºM\ìš\Ü\Å;#fù“s>À\ß[¬5-Q\Ã@\06ÊŽº‘d(	\Êw\Ñ43p²$[U—m—wÊ…\"=h6n«$	\ÞV]\nkZ5YD’ˆ½Óš eYDL]m“Y§7¦š¢\Ð6O¦\ÒL8\Ö#\r#EˆÃ–“k$6²ÛœJ½¼%=™\\Ý¾*“\Ú\à\07ù,-~ñ\ÍmŠ§„ Š…;l´+^>€r3<?n<\Ó\Ñ9Ë´1P;¦›\ïü\'¾\èI´!\È/d\æ½\æ\Z°XA°¹Xl±\"IBˆ\0L¥dhè…„B\ÐÞ¤«\ÖE$XžT\×@ýN!\Ä`¦\Zm+K”s,,Ÿ¨·¢\Éi\ÑiDLX\"\èô!ToE^†pFIA´Ž„\\\0\ÍÊ„´ž;šýSb@vTŸQ˜ˆ¦ÿ\0ša\ë\ÃODPQ·	R8j…¸À#\Â4P£p‡¢>J~+TS¦\ç«<\Ô|Ì«—z&4žm‚{º\ê°\Ô\ßQ\Âl‹…\0K…\Õ*c\Øi“y_¤D Þ…jnV\È\Ü,°¶7žŠ\Ñk¯E¯’»NªLŽˆ‘¢õ(;u3*%Y·L°¡\ê£õ\æ@9Q\ÓT\á\íN²{A7*¤\Ðq	$»\è¦Å¼\Ó\é\ÙÊ‹¤F®§\n—„\ë÷\'bŠzß„/$Q÷!Jù¨S\nSô%v…\\ü™¬\ÔýŒ¦€\î]·D¾‰”ó\ßò… \Ò\ì\ÑeB˜\rµ€@\íBÍ²ºh´£¦«Ã£¡L‰%H‘0Vq$7”,\à\"\çh>\\3B/3º\Î-\'\à»Àf6Y\Ä \æ\Ä\èQ©\Z	Aò\ß42\ßP‹\ìŸ=½Špéº¬ÀA\ÙvŽf\"Kt*Œ\êQ‚5T#½p;ªN¦u\ã\å\Æ¯$|øn¥(#\èµ\Z\ÇªÐª®\Ñc*\æ®\é\Ñ\\ž°©ÎŠv\"eRÐ°TMMh\Ú\È|É·²&ú \ÒN°JÑ¤D£p\0\Ý\Ú:)ö©6þT˜‚}É³:“\íN‚\ë\æÿ\0\ÉS>\à}Si¶d\Éÿ\0‘ù\'5£,4+xG\Å~«\Ä\ÝrHƒ\ê„\ì\ÎX”SuprµŸ$\ã,-Qs\äT\ášV*†`N\Åc)\ZU3B£Z_”\ß©EÅµYQ»kè©¸8\Ý\nm¢uZ­6B\èð”P0Šž¨˜F\ëªJÓ‡—¬¢V \Ãz*ƒ;\Üzªm;j€\'U•¶&\åai\\;YXVCS$&\ÔI²Y:\0PqNŸb‘ÁNóÊª½ Œ¢d_¢\â\å:o¹ºksøQ{„B\ÌwEÍ‹j¦\Âóèƒ¶\"ÉºË…¾k3›\íM©~¤¡\ÌH\Ù\0r¬\Í\'˜]<e\ÐØ¨9d#ºp«\r\Çaó\ÉS\ÛÝ˜Myv¥KDˆX\'Œ…¾\åN\ëE<\'ÜœµS·\r8JŒjŽ\Z£ä¢\Ç<6…E2mºg(\0j\äo\0*L.pXf	,ª`\0!1z­Iƒ\n`z\"\ïŠ\Ì\Ò\'D_æŒº‡ð³e6\É\ÅÚÍ¢—°\0\é\Í\×U•‡4¼\én]\ÖXœ»Üœ\ëDŸ+!LÁ‡€|Ð¦\â\âk\ÐOðDˆ{§Ü»¶\\dy¬‚D\Ú\ÊH°Ž©·–ýy¬ 8B.,vfÿ\0„\ç\Üô?^\Ä^d ö\Ý¿Bœ\Ñ¬S„\ì±šA…‰¡\Ìd\"Ü®Ž‰Ž\'•a«÷o-ÿ\0F pgh[£¥¸mt.Š”`ú ¡\Þ\Ü–·Dt\án\Í8\êi»ð²õM!±h(m6Z$,<\æ\Ña[`\í\Ð\Ì6\0 ySA1d]¶KA‚uN\Þa?$i–Îš Ü¾s)€’†\ë|¡>\Zl<_$ ™æ²†»]½\Ë1‚\Òf\\N½?ô¥Ù¯²2\Øqm“žN\ÖB\'K¨\Ñ\\\\þ]§)\Þ\ë(k\ãdZA¾T^\Ê\ÒF\Éÿ\0\0¬¾pZm6iº\ÅS ºE•P€\Ê\ã\å¢®òX\Z¥Í‚tM(©ã§§¨\è®‘\Âf\Ê-øuS\'\Ñ=Ë´/\å6“ª”(tó\Í\0\Ýa>-–³„\ít\Ó\ÓT\Ç€‹–‡:\nu7F`9e6\íO5šÃ—ÚŒ>]TE¢\ÈG\é\'\àuª{\ã\ÉH#X4r“2›\ïG¦XF\Ç]¸ÿ\0¸(Øˆú\Õ	U3»®ª8\\†Àr›f˜•­\æ\á(l\ÜH+PP\èœ\'EU½ “ ‰U\Ù¯Cr¸;\Åu€qk\ÚÓ£ÿ\0dÝ–¾\ÔAM(¯^\Âãƒ‡N{’¿µ_U>ôO½<\ÊÅ¾j;ýª‹\á¦Ý¿’q\0ˆ\×\Ù0óZÿ\0²\Âª\0”tV‰š„]­¥xA~\ë5G44™sxt…\ë¢\æ#–Ð²»H…\Î7ú\Ýd$f\Ì#\Í>•C¤t¸A¯ °G¨þQ\"r\Ìy„\Ü\ÒKšZƒ[y7ø!B™¾mS©\Ó\É9\È>Ÿ\åÔµ\ÖJ¢<\"STsó\Å9¹Š›\Êg;G‹Ù–¢m¤!¨º1h+\Í_]SÁ¹Ü¬FX2!Ê°¿6ª´	…›˜:=~\nLµ§P‰óý†Š‹ó4¼%nŠ¶^‹U*Tp„­Ô¢x’ªh|•K\ÕwBJ‚mÉº\"Ù¦J ÀØŸ_U…hž‹ óY0\ÚJ¸\Ýp\ÕK¦ÁO·\ä¬]\0\'»¥¿\Âk¦\Ä\è³k~pƒ®/\ì@·¡\Ì>‚‘$T5Îƒ²\0ô[Ø©´hSCD•L¶ò\È;iæ³‘¬#S˜Í‚¦ð3ô]\à›\ÚS]\"\Þ\ÅU\ÐÑ˜n¬}h›”\ã24^Z\è:^ fñ,COª¬/\ä³5¤€µ-wM—f¼¹§Að=o\ÆQC\ê¶RŠ\0ñó_ºòDtNX§–0Ž¨I\'xM2\ÝnP¦m\ÐJ 9Äb£`\êZ-t\Ñl´è›¬Â›ÁVBA3¢$k­ ’: \Ò_.²ž\Ü\ß\áfcX\àu?ºsÆˆ]\áùJi\×\Ð!m¾¾)\ÅÀ\Ï\ÉœÃ F©\Þ\ß$k&&U‰\ÐóJƒ\î²-»lŸP¸^ò¦ì€°t\Ù3Y\é\Õˆd´\ÝUm\Ìò¬CgØˆ\0\ÇÔ¦\È N¿‹ø¾ûÿ\0)†[\æ‚Ó€±G\îX¢´Zù)DÛªõ\àD4\ï5\ÚÎ«I¾¶A¢m¢¦6;*^+EÀ\Ý\Õ²\Þò tMM³{\Ô/	‘¢s\ÉñA®}\Æ\ÈC\Z^\äÞ¤s9¬\"Ù\îŸQ·´¦»/0l©N¬Ù±‰Os¢÷T\êˆ&d„Ú›“ª/\rt¸ú\'˜\à\Ô\ìNK`›¾“·ðV`@´Bni\æ3¸f˜B<_™;õš\í:#—¬¹Ge·EPZú,LIUš \îª0)\ìn\\\Ã\Ä>+-s]¨\Ý2-\ç÷7D}\Í¶\ãuö©NpV8}Â’]\Õ) ˜€S€²§\Ê3hM–-neJÀN\èF\áA#ªlzª@\n@–\ì…Ó,~T]l³d^\Ö\ÌxWy$;`k\Ì\Ýwù¦ú\"û“¡?.©\Î·öú…Q\à<g\ÑKKA\×Øƒ€\å&a6¦Z\Ë2«ž&ç²¥”³,óû}B,\Ð\æõ5¼ƒ*/{B\ÍkVh\Ó\\ÜºÜ¢DœóM?ª\ÅOŠ\Ö\È[]•C-Ë²\ÄÓ“èª·Pœ\Ð\íUHk™út+\ìµCš…B\ZÀ8”\r8\Üš5û-Gš4o²\ÓU\Ú<®¦z&˜?rs³x<§Ú³†€\nÀ²!Ú•Oõšy·N7Ž©œº¡P7˜îŸ‰h»•LsE\æN\Ô`3™ª5\Û\Âÿ\0R¤j‡iS3–\é˜\Æ8ø—x\"ZlƒÁƒ0D}…ž%:ž`^\át7\"p.3\Òpˆ:|“Í˜Ý»õB¬“·œ#T¶gcðU1LtC´)\Ítq\í±\Íeö\Ø\æ._nñ}©™€k¦<Is¡\Ú,·œÚ d`\Ø\"\Ù\åU\Û\Ñc\ÝÛ¢s\Ï\â £L‰¦\ásoýª&@žˆAG\0Š\Ó\Ð#~\0¢c‡\Í©Ev¡9[\íTZN]÷S\ìtT\ä&S\Ìñ™a\Ú@\Z&;,\':9¶Fµ e\Õ§W¢|ó	Ý³…kò9\ß5Š\í\Ì(Ÿ@Ÿ\ÛXz“gaU1\Ì~Àz\'\âZo.·’©\Ú4\é\Ù\ï#þ%3H\éT\åÿ\0µ\ß\ÂÁUeB\ß\Å\Ó8T\Þ\Ø¡vZª|À™\Õ>£\Ü\Ð\Ö\êY[ŸÀ\à}\ès\nÎ‚\Ñ(€\Ñ1\ÌtúÐ¦\íDù*•2V&»Œ¢­V¤ô9¹\Ì\\¾\Ð.{\à}\nf0nüÐ¾Ý±*§Ž£c&}\n£\ÚAñ\ì*ž?\rgŠ¶	¸ü#­\ß\Ý}§lµ\Û\ï@µ\Í\Ì\×}UfH]¡M±)ð@W\ä9uúÿ\0+\nÀ_o\áQo+mp¡\\+¨FPP¾JvF\Ü J#Þ‡\àt]¥)’vú+\ÆsE”i´*?ÜQ\ÅQ\Â\Ò\ï*º\0÷Ÿ j\âñuCp\Ì\î\Zý\ÈÛ¬›,k14Z\ÃWjg\ètL\Ìpqq\êU*•\"5M\Ã÷„ò|\0ý—úu(\Ì\Õ§\áw¤\ßüBv ¤=\ÃøOÀáƒL[\ÓøG‚\Ì9\nÿ\0IÁÓ»\Z”ò8„\ÞÊª\ËÓ©r#´°÷\Ìj\éôU.Ø«H‘‰¡\r\ê%P\í\\%h®S\æšú 6¨r<£)¾o\ÙR¦³FþûUKb\'\Ùü*\Õi\Ò%õ^=Gò±±†a$;¼XŽÓ¯‰þ\Ó2ù\Â<f#7yQ\Ñ\ë%C°\à7÷ü\å7±\érc\ë\É\ËÃ·òÊ§\ÙøfŒ\Ý\ß×½7	†gý?¯z|(ÿ\0§õ\ï]\Ý&ŽVŸz·\Ê=­Â©Db\ÛAò·\îª`*±\ÓJ£˜\é\'ùU1øú>cŒl\âªv\Ö2k´Uo\Ö\á3\ÜDå·’ë³œ{ö“suM¶’¯÷\ê´\àT ¼ø‘\é#Uª\ífˆgOò˜\Ó\ÎM®?\Ê\0;ªp¶‘\×\Ñ1\í¤\rWœ¡v†%Øª­|þE‡\Ö\êw¾›_ &aT\ÞT\ÎÅ…cHhZ›\Þô@¼\Ûd)¯³ˆº\î&À&\á$\ÎI…\Ü\Ó»¨\Þ\ëMuE\ÃC¢©F›\åŽ\ìø«H\0\Ãÿ\0k\ê\ØZŒ£€sA\ÝS\í|c#ñœ\à:\ß÷Cú´!‰ÿ\0hþJ«\Û]£XC«ežŠ««b¹]\Äú¬g~]Vÿ\0º¥‡¦\Û€…6‚-e\áðh²Vwä·¢\îj;Vè»’»‡jªQp\ØJp\Öñ	®‘\Ês\Þe¶UR¶\í\Ùv\Ý \Î\çOÁR\Îõúý“™®>K\ÑÜ¼\Ä8À1¿•Úµv`ip7?$Á`z©\ã1\é\Ã\ä¢\ë\Éi\ìR‚r¶\ÆTðò\è¡D®\Ól¹ ›j µ®rO\ÍSmŠw%:…\Ú›~ÊµBñ™\æ\ZLz\"ß´5˜zM—ª\ÃvN3\'vÚ±U31Ï¥P~%?\Ø,$\Øt@X¦P\è*-Œ\Ä]°jo\ä‰-\Ð_®°ž\æ€3U™\è»\Æf†\Éö¨b¦=e>“›v¹T¨9·T«\æ6¸X\ïþ­S\ä±TN&0f¨-\ìT?¤ñO`{ž;&GTý`±¿\Óœ&b\ß\Ä\ròT(8×¤\×\éœŠcm1d\ÆJ¾l\Æ\å4Z]V\ä»\ÊQb\âîªaB¹‡®ò \Ð\Ù\×oª®Ü‚u•Bˆ\ÑT£˜N\è\È&D.\Ø\æ\ì\Ò?K§\äœ\ÑÜ´^j´iÒ¦\Ö\Óz\Ç\ÑTg\Î\ÅvcIÅ’oª`†‹ð?&W’\0ý\È\Ö(²ª–ú­xv£\r¼\çÞ¿KHº#B\Æ\âE˜L\rJcj\ã\ê\nT\ÄS¬g³\Í/¹Už\ÊZ;E\Ú]þ¦M\â \ÛB\ÃRrÄ•J˜>IŒ°Yxn…F\Ó\×\Å\Õb»H30a•_µjóÁ[º\Åv\ÕV08U‡<Àh™øl°½·‰.þã¥º‚JÀv¹¬ðÊƒ*u,\í–*\Ø2\âs\ÎUNƒY\rh²\í‡ª\É\ÙvU\0jsòT(H×”\Ì;#Áuov\ÇM\ÚV*žN\ÐÍ–˜*T\ÎP›L“\Z!L5Žq¶]V7´H¨YCÚ±¹Vˆq}l‘ \ßÝªom\â\ÍB&\âú…„\íj\å\ÄÊ§Ú­0!\ÝU:¬,\ä\â_\Ë:&±â …œ\Ä,C$i:pnoReƒ\É\Þ\Z•--N®\Ú\ÆÊ—)ò+²o‰}ºý{“G-õ*ÿ\0rm\Ãe<\nÓŒt<øF…h±\ì/§›ô\Â{y\ÆS\'XXš¢‹.yŽw±=\à2»=”\éÀË” øÂ—›‰v\æ	\Ô1X:š4òüGò°´?øì‘¯ð:1®\Ê\nt07UlKá¶§óXŒ#\Ûgþe‰¥—¼¦4N\Â?¼ƒ¶…3\n(—8ŽU†{IfQÌ»!‚®*8Á>iÀT*¶+\Ûô\í*®™º®\Ù~AJˆñ<\Ývn’€ŽŠ/(„Ø¼®Ð§š“‚\íFšu‹Ž#\æ»:¦zs¿4+4? —,C«Wk\é2F]DDª\ØwÑ«pa\Ë„{jfžCðL\ÂÁ\Ô¢^!Rì§¾›]\á=U5J.‚e©­%2”	F˜ \î«S9»K1kig÷Â­D\Ò\ÑRt<uN2úý—d	\ï\ÞP\Øø¡qe>ô|*7\ãe\npš™[ù(öð¥AõtU»5\ÝÓ€!\ÅÁVelóÖ¢b\ãÜ›@\ã1&¾X¥J-\æžÀ]V\Z‘h\Õa\è´\0\"Bhj\í\Ú\ã¢Í¿º\ë³©„¢|¾V^”\ì\Í>T¹\Öp²¦\ì¾gd7½1\å«vnO\á77]>J¿`aI’Ü½	º¡\ØX;f¥¿\î$ÿ\0Q\ìœ5	\ÉM±µ¾Š¦;±`#T¸ˆU °\n¬\×\âûS,È§õü, 5£\Ñ˜Ê…ˆisE\Ú\Ø>÷;b,avCœhd þ¦r‡7Q\ÕQx\ï[-\Ó\ëU‰\ÃP¬\Ãø`tØ˜:¦\\Ü½5Tÿ\0§°­¶Rñ\æ\ãû‡\ì\ì%\Ê^‚O¼\Ý\ZT\ÃrÆŠ¥&5T@-A­„ZŠ·„ƒ¢v\í8\Ù>}\ß\åb\è3!‘dúYj4TŽV\å$¸h»9†•&‡CKöMv[h¿u¢ßŒ->\èù ®µ\Ñz­HXj”\é@ñ\Ý´YË´(RsKC¥b)R§Sº§\Êªc9ýZ*,\æl*2\Z·¢\ÇR\ï°\î»©\ßAþ*-úø.ðb~$\è\Z¿¨&!2œ$¯.(\n’e\Â¥Qc´s §\Øho\ëAºn»V¸\Ã\á\ê:oú~‘«V®!û\é\æOð°ô²s)÷^ÿ\0Â˜!¡<\æ¢\ëKñ\ZKf\r\Ó(ý—´L¬\Äó7¤þ\Ê\íi¶Š…f\Ì!d\Ì9\'f‡j04@—X#¬\ìŸK6›¦Ñ…¦ªV$\Å7“ºÀ³3\ë;Pm+\Øh\êÊ¥>pî‹²0”ò\Ó0Nñ ó·½TÀÒ¨\ÑøWnŸ\É]UVwuH6•c\ê´\Õ‡¯Üž¨y/N!3û`‚\Þ\Þ\æ\Ìp±G)pv‹OûŽ\Ý\Å5\Ç;<„{Uó\ÙR\ì!´‚5N¦p] _ÿ\0K¯ý\Ãü&~,d…’˜¼I]\ã\àŒœ¨º\Ñ(T\Zû\Ñ\î¿5L³\Ñaš\è/%ýa\Z‚\r‹ÿ\0p$Ú\"YK+~º¡T<^\Ä,\Ö\è»V¿ÚªŒ3|;®\ÌÁ2…*A­‚©²3M¶M\äŸErù\Ù8\åm´X¶5\æWhá‹°\Ýý\'Ml1˜ÿ\0nð¨\ÖûFn\à&Ò±“T\ê9²\ÊûAn\ë½\îPûq\Ú\èyØ \Íú\'\Ñ»UFÀ…\Ú\Õûºa€\Ý`©e \ß;û\×h^Û§R\éEv@š,;ýþ¼\Ö\Z‹\ã;›9öù{—jS\Ë\\\Ù¢•û‡e€@ðz*gñX»5¿‡R\Ð@%7™\Ï\è%b`\à.BÅ›8tUFWR\ê°\Æ_=S\r„ì´‚ŠýV/\ÌC2–\ß\Ë\æ¨\Ô\Å`K©×¦M)³\ÅÇ¶4ôM\Æ\á\ÜmRþi¯c\ã˜YF	žd\ç7\Âª\î™\'=IoEV kŽZ3\ç:ªx… U\Î7\Ýf¹pÕ\íFPkh\Ò=ö\"·…£_UÙ½šòÿ\0´bD\Ôv\Ë\Î\í¢l®|Æ¨ó]Sc\ÖBp2z,CUFI.\rõEw\ì|\\9¤\àjžSµÿ\0/‘	Ž£ˆ§ž“\ç\æª4þ”\Ð\æ»€N¨\ç¸~PšF…1\Ô\Ã\êR\\¨\ÍyDŽ¶X\ìu8vgŒÁR\í<Q«­*g\Øô²\nm».\Ð\ÙFj“â·½vuÓ¥E±ÿ\0+\nñ-n\ÝmÞ·\×\Å~\ìp#€P†«\ÉhP½\Ó-U‡\Í`¶¬X¹‹Qß˜x”\æK‹¡c\é—9§T`\Õ\ë.ªcK¦\È\Z¦\ÜGD\Ñ\0\':˜nY2|“i—™«\Ùø|@\çÂ´Ÿ\Ô9ÿ\0\ÄO¹7±\Z\çS«V¹\ã\æÒ«v_h\ëK´‡üšñû9§ö\ÛDý¶“½¿\Ëhv\é9GuSþmþLoø\éƒÿ\0\ìbf·¯ý¦ÿ\0Í¿ÁG²{n¯Mž™Éªô­G\Ó\Å\ã\ì>7Xn\È\ì\ìt\Îò©ü\æ\çß²e0#`‹ƒŽT\Ö\ÛX„\Ý4\Ñ6si	\ì™U\Û\Ë&\Å\ÓU[\rF«J»;\Ê5\ì¿ÐŸM³€Ä‘\ä\á›\åü*´{w%\ÔF!¿í–©¸ü`µNË¨\' ÿ\0ö–S\ÂTgü]ü!Ú”´\î#ý§ø_\êsf`\ê?þ\'øM\Å\ã¢iöeC\ëeMý«THÁw`u |Ê«„\í*­2i\Ó­@HôÊŸý=\Þ<¾¾ ×€\ï?Â££…¦MoEZ…\Û\Ía\èw•\Ù\Z6?u†¥™¬$»T‡\Ö–‹­\Äð•(¨^ª \ÌpEù\Úz‚«¦F…¤\nœ‡\Öa\Z”Yk.\ÑÃ‚\Ã\Í$*Œ°p0@X A.Ñ¸	Ž¸p<\Ýóƒt\Çel\Ä\Ê\ïùÇ±}¢›de˜_l¢ÁzUqXz\Î\Ê0\ÙB\ï(\Ð‡F}P®\Ó\Íö`¾\ßM™ƒh4þÙ«”5¬\0úSZ»¹žc\á\æ¨\äÐ’>¾J¥Hò•L\É\Ön²,´hS^3óZè–¬‚«ù½X¶PuZFi˜„\Î\Ô{G\ãQ„1Ýžñ¡Û»>4½7\Ù}\Øt>AòŸ’8\Î\Î\Ë\r5Ÿ²}Lô«S›\×ùA¸\"H5\ê\n4©þBI(ºq–ÁXƒw.tG\×EÙ¸|\Ü\å²O\ÐMh\ÊÓ¡L©\Ü\Ñs\Ê\Ä\Ô\ïm3k\Â8\rº<,TAGd\n•6ŽD.!8B¡[ðiù\"S\Ëlñù|Ÿ%Œ»ú\è±t4\0Ae£ª¡O$NªU\"5(8: Z\Ö\É\ÕSvXqÔ¦3;‹\ÜlX\×:\"\î*¡\ryl@\\³#u-\0frs‰O\å˜Qù‹¢U\"\Ó\r\ë¿\×þ–h\rc.S\éº\äªV“º¦C„§Ö¦4OÄµÏ‰G`¼}Jk³Ó\ÉU˜$šhª¸µf\ët\Õÿ\0$ÎŽ¼\í\Z¦—”Ÿr¨<-\ÊC5\Õ:“H\èK6÷\'88\ÈGC;¬I‡‹){²´	úø¬Z-ae2\Ò®øÃ²›w\Õ<Ë­ û‚\Ê.¼‘û±ÀAj¨;+\\oþ#Iü³û*9fE\Ö7ò´’«\Ìë‹µnoED\Ê$.z¢\à\0³\ÔCIÍ¢$“òª;/ª’Ht\Ê8‚\ÒFkr\ÏI\Óæ»°øh˜\È\Ìy¶TiÜS\ã/šq,wªcùM\î±=ûó;,*2\ç\æt\ë²iyp\Õ0\å¥\æžù(GYU™˜z&\ÒMS˜ø}\î~´NcÁb,Cœ2\ì,T\æ1ùT\Þ\Ö`”\ã\Ë84’nŸ\á\Ö#\Ä\å@õ†g ê©€A‘:¬S †\èÄŽt*vR\0C„­V\È!\Z&xãª \ÌøF·\ÍS Y¨\Õb{Ñ›dø¸\Ý4\Üù\'\n…ÀòCEOš\Ó	¿„\Ù\'˜§Î¾\è\åÊ²ÁƒÊ¹ ‘Ô¡œüGYŠ•3Ëœ\'\äl^SY˜°ù®÷ ”\ìFo$ú“¼¯´e)¯mFkuk[DCsf)õ¤†´ Y<Ï‰D\åvº©\Ø\é4%w-0x\ëõõ\ÑUÃ†’rü„\êeÞƒ¢mšD&Pô²w\Å=9û,V¦û£p¨‰e¬˜2\nŽ™€±\ÌI™\àTð¼#\Ôl·¬ð<:Î¼tA	–¬\0. \áù…ÀôT\Ü\×4ƒ\âÉ›\\*ã”\Âe\ÜvNTw	‡x”\Â •šuºhˆ‘r²‚UÀƒ¢©O½¹\Õw\0\ê\Ù	¸f‚#E\ÝSkb/ðGû„\ì3m4UcCeQ€\Ì\ÝV£Q\Îü7œ\Ú\Ô\à¼\çX|LˆM“k4¶\åW\Åd\å\å^©þ\çvßŠfƒ›1¨\ï9)…ð›¢i—k+óšÁ0Œ†÷^\"N²,´BŒ‚ÁM\î­¢v½Sõº\ÇZ~k³\è‡\0\åI¹[1²®þî›š5*«¤Óøðßˆ\ÕB?(”F\èhŠ.šP$,¡¹\æ\áb¬óR™ÊŽ\"¥XÊ«3m¬¦xˆú\ÕHó \í‚i\0@T\È\×t2‘šò„›i	\ÃT\æt”\Z\Â<YP¥\Ì3Pƒøl	´3\×ZP¥“OEZ†k›„)o\ïU{²\Ïª33IÊœ\Òfˆq@¼\ìƒ\Ë\Í\Ó:¤\æe€fôM‘\Í\n\ÄLAM€#YE°\Ù\áIpl\ì†R$jS§¬¢\r\å8Ç¢{¶	þ\å‹™\í÷®\Î\åfXY\ÝQÁ“\r\Ýbj__GRQüQ@ð•y\à~\àQ\Ñ\0¾(\íAƒ«‚lU^BOˆ~É“x‡’ûC ´¶&=\ê°\É[IŽ©¦<\ÓP6„\Ã	¦cd&l·\"S°	Ä›þ‰f_2©@2™ô_÷\Ã`\ÝU¨\"\0Oq3<7YIòOy\\˜À\ç]\Ó+¹swT™\r\åT\Ú&\éœ\ä\r–]odû×»Øƒ¥¾I¦k^È›jªž‰\Ä#§¢\Ä\\„$S1!¡\Â=UW“˜\ì\í<¸’q›ð¸J\'„ñŽ¨‡ƒ]o	Ç¼¦\ØTwªvSS6‹g´Â·MV\áS¿^‰®¿DÇƒv¬\Þj£º\':ó²/Ì @“*“€\Õ5ò#t÷ô¼\'É“²{ˆ.…>\"!dƒ2ŸP\é9$ž’©¶³\ßK’©w™@o…\Ü6.˜ð\ÐDÜ©\0]> 6Wy¯TÚn…6¸tuY\äJ.·š.˜q„|!V(X7rºGTü\Í$L5Ê¯\åo\éEG	û¥B<b\ê-\Ðð.\r=V\ë\ì\Ã.\É\á·!pMt(\ê\Ôy”ö¦žmdªwwD\â F¨“1²sŒ\Æ\É\Ï\ËÍ²§‰B\ïd[t*–s¶‹<\Í\Ñ-Tö\\…R“ˆ‘¢\É\ïN¦A	Œ•F‘lnƒŒe\0P\Ú\é‚]seZ¦Yºï±\Z\Ó\ê…M“r\êSOK‚‰±U\r\ÞwNˆôU„µƒ©XjO\Êö“(\áó4ò\èªjŠ<#€Zq<\nÛŒð%m\Ð)?»x\èSj6¦Qù‚w5‚\í³ƒÐªf\Z\àôM\êV\Ñ\Í;ªF\0Y“ú\îšö\ÞUXw¢f¤\Ê\ïfz¢#D@hóM\îË¥\â•PŒ\Ò7F`¶A]\Õ6\\”i\Ò}ö	´©n˜Ÿ”–\É\Ï| ‘º©\ZJ¨\ãñ]\ï6º&¾J²¥ \ÞTXW&\nrq©I›ªS¨\Ú\é\Õ\0§¬JyD¢½x\Úlš…(ð;)ûj€BÉ¨€˜\çHB§P8^\Î]£Y‚€f\\\åÎ¼l€`¶L>\Ô\r“¹\\HEÐª@e8‘\è©\róF¡7L©ÿ\0’cü´LüF¦\0¹5ô˜cu\Þ\Ñý)¸š-€@Dñ„¬tÊ»œ;OŽ[ä»º\0\ÓM\0.\å\Þ`\ß\Ì*\ØznƒM\ÒV9›\Ês\ËZH\Ôj«b=‰¯3p˜\â©i®¨L‹AR3D\ÙV\0or›\áj£½\å>\Õi7[…\ËE¦û\'Us¿\í\Õ-¼Öª5û°Tõ]THQ\Âû/‚€\á0GFª©.\ZÊ¤\ì\Ò´L7;-4O\æ%@\è7UD\rn‹\Éº¯U”J­H¬_k»³²÷˜ðu’¨Sý ê€§\Z£\Ús\ÌñU{N®PKËšn\Õp¦M\ÙJ\ì\î\Ù{±*»0XþÞ¨\Ú\äS†±º,7õV\"Cj\Òe\Ìj=\ëµ¨h`©a\Í\0ú\Íò¾‰ÿ\0\Ôø\çT\åxv\Þ~K\ÛN«J£«]ôÇ½Ý¨k<S\"\Z›ýD)ŠLx—\Ô\é)Ý¹›•×…‰þ¦Ãµý\Ý:£ýU:•q—;©ó•OX\á.…‰´ú,>VÈ¿\ÐNsdD·®\è­0é€œ\ç9¨ULF\ÈúÍ›nœò\íS¸\ï\àV\èD©R£ƒ¸hµQ\Ñ\êx!d\n”S´*‘\ry	\ÆSF\áI)\áR1\ÑI-u‘j	\åUF4\ÆSÊ€½\ìš\Ü\Ã\Í5*œµ)\nƒ\Ì\'ÿ\0MöMa4\Úp\Õ\ÛiU?¥Y‘¢†*5\Íü¬Gô\Î>•.C\ß-–/±±ôh‡ºƒ²Ÿl{¦%7]˜ªuI\á\Ã[\ïeZ›\Þü\È\Ðt…ŠoyO\n­¦Á\î”(_D\Îö*… øLùl>+	„xdxœ\ä\î\ÌÆ°Qy \ì®òG²1¯|1„\r\ÖúM”jœN%Ù‹Œ\ÑSÁ¶21¹\0F˜aVMÆ…9\Ù®ª•\Îc\íUjH\å°)œÈº,ª\r\Õ\Ì\ï%·ñG\ãp¤\"¾jz¢•¢\Õnƒk„O½O’\n8Q_=VoŠ\ÒÁ2\à\'›a*Kf\è\Zól6‡—1*“-ª)Mfjœ‡)	”\ÞL,µ@-	p†\Ôff”ü>\n¥\ç\Ó}»±j;3©5¿^©ÿ\0\ÓÝœ÷\äeGü‡\ÆU_\é\Þ\Êq£r-4\n‡ô¯c×ºrž®%3±{\'\àÁƒš\×\ß\æ¿\Óð4\Îf\áX\×z\áVd˜rÓ»½\É\æO’a´€œÀ÷D\0-\rÓ„\êš@²¨\æ\è5M& \Ù;\àª£\áõ*Q\Û\Í~<>K^0µF\á\êŠ\ëÀtQ\ápiZ©\â\å^bBc¥’',1),(4,'jaquino18','f55cc3b0e8e0dba3050d66c9de131cdd','2016-10-27',NULL,1),(5,'jarumynov25','2ca7beb3259b7d2843610cd84f201070','2021-10-13',NULL,1),(6,'omaruiz2000','a395bb40c4de3a1f749a9ee6f129f06e','2021-11-23',NULL,1),(7,'xuan','9ae7095baa4798a8cfe0a061fc965d2e','2015-05-29',NULL,1),(8,'pedroper20','3ede9d5a33b4fa9323c7428faeba264e','2020-12-03',NULL,1),(9,'marinassalazar','078981e8328d4b39ad898b40f1c3477b','2021-10-13',NULL,1),(10,'albertorivera','03f3e46513a03b13e05bd91b8bb5d525','2019-10-13',NULL,1),(11,'andreapac','ee14168a1083d988c678acc61ce3b349','2017-05-21',NULL,1),(12,'gerardorami10','90758c62f02bc6ed660f26222d423a4a','2016-11-17',NULL,1),(13,'davidllanos123','c8549762ebba1dcf8ea23bbc47f012bf','2020-12-17',NULL,1),(14,'omarpal12','a395bb40c4de3a1f749a9ee6f129f06e','2020-05-21',NULL,1),(15,'lionel2001','0211cd7ad662110ecfc89815ff38000f','2022-11-21',NULL,1);
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
