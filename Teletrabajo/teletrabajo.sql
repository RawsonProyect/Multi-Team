-- MySQL dump 10.13  Distrib 5.7.24, for Win64 (x86_64)
--
-- Host: localhost    Database: teletrabajo
-- ------------------------------------------------------
-- Server version	5.7.24-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Current Database: `teletrabajo`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `teletrabajo` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `teletrabajo`;

--
-- Table structure for table `alerta`
--

DROP TABLE IF EXISTS `alerta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `alerta` (
  `idAlerta` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(250) NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `idTarea` int(11) NOT NULL,
  `idTipoAlerta` int(11) NOT NULL,
  PRIMARY KEY (`idAlerta`),
  KEY `idTarea_idx` (`idTarea`),
  KEY `fk_alerta_tipoAlerta1_idx` (`idTipoAlerta`),
  CONSTRAINT `idTareaAlerta` FOREIGN KEY (`idTarea`) REFERENCES `tarea` (`idTarea`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `idTipoAlerta` FOREIGN KEY (`idTipoAlerta`) REFERENCES `tipoalerta` (`idTipoAlerta`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alerta`
--

LOCK TABLES `alerta` WRITE;
/*!40000 ALTER TABLE `alerta` DISABLE KEYS */;
INSERT INTO `alerta` VALUES (1,'Descripcion alerta 1','2018-07-13 11:10:11',1,3),(2,'Descripcion alerta 2','2018-10-13 11:10:11',4,2),(3,'Descripcion alerta 3','2018-05-13 11:10:11',3,4),(4,'Descripcion alerta 4','2018-12-13 12:10:11',6,5),(5,'Descripcion alerta 5','2018-11-13 12:10:11',2,1),(6,'Descripcion alerta 6','2018-10-13 11:15:11',5,6);
/*!40000 ALTER TABLE `alerta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `archivo`
--

DROP TABLE IF EXISTS `archivo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `archivo` (
  `idArchivo` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  `idProyecto` int(11) NOT NULL,
  PRIMARY KEY (`idArchivo`),
  KEY `idProyecto_idx` (`idProyecto`),
  CONSTRAINT `idProyectoArchivo` FOREIGN KEY (`idProyecto`) REFERENCES `proyecto` (`idProyecto`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `archivo`
--

LOCK TABLES `archivo` WRITE;
/*!40000 ALTER TABLE `archivo` DISABLE KEYS */;
INSERT INTO `archivo` VALUES (1,'FotoBoda.jpg',1),(2,'FotoChico.jpg',1),(3,'Jhonny.java',2),(4,'class.java',2),(5,'index.html',3),(6,'notes.doc',3);
/*!40000 ALTER TABLE `archivo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `chatgrupo`
--

DROP TABLE IF EXISTS `chatgrupo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `chatgrupo` (
  `idChatGrupo` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  PRIMARY KEY (`idChatGrupo`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chatgrupo`
--

LOCK TABLES `chatgrupo` WRITE;
/*!40000 ALTER TABLE `chatgrupo` DISABLE KEYS */;
INSERT INTO `chatgrupo` VALUES (1,'Grupo1'),(2,'Grupo2'),(3,'Grupo3'),(4,'Grupo4'),(5,'Grupo5');
/*!40000 ALTER TABLE `chatgrupo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cliente` (
  `idCliente` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  `cif` varchar(9) NOT NULL,
  PRIMARY KEY (`idCliente`),
  UNIQUE KEY `cif_UNIQUE` (`cif`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES (1,'Cliente0','000000A'),(2,'Juanito','000000B'),(3,'Marina','000000C'),(4,'Francisca','000000D');
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `informe`
--

DROP TABLE IF EXISTS `informe`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `informe` (
  `idInforme` int(11) NOT NULL AUTO_INCREMENT,
  `rutaInforme` varchar(255) NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `idUsuario` int(11) DEFAULT NULL,
  PRIMARY KEY (`idInforme`),
  KEY `idUsuario_idx` (`idUsuario`),
  CONSTRAINT `idUsuarioInforme` FOREIGN KEY (`idUsuario`) REFERENCES `usuario` (`idUsuario`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `informe`
--

LOCK TABLES `informe` WRITE;
/*!40000 ALTER TABLE `informe` DISABLE KEYS */;
INSERT INTO `informe` VALUES (1,'home0','2011-12-20 13:48:29',1),(2,'home1','2012-12-20 13:48:29',2),(3,'home2','2013-12-20 13:48:29',3),(4,'home3','2014-12-20 13:48:29',4),(5,'home4','2015-12-20 13:48:29',2);
/*!40000 ALTER TABLE `informe` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mensaje`
--

DROP TABLE IF EXISTS `mensaje`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mensaje` (
  `idMensaje` int(11) NOT NULL AUTO_INCREMENT,
  `contenido` varchar(255) NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `idChatGrupo` int(11) NOT NULL,
  `idUsuario` int(11) NOT NULL,
  PRIMARY KEY (`idMensaje`,`contenido`,`fecha`),
  KEY `idChat_grupo_idx` (`idChatGrupo`),
  KEY `idUsuario_idx` (`idUsuario`),
  CONSTRAINT `idChatGrupo` FOREIGN KEY (`idChatGrupo`) REFERENCES `chatgrupo` (`idChatGrupo`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `idUsuarioMensaje` FOREIGN KEY (`idUsuario`) REFERENCES `usuario` (`idUsuario`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mensaje`
--

LOCK TABLES `mensaje` WRITE;
/*!40000 ALTER TABLE `mensaje` DISABLE KEYS */;
INSERT INTO `mensaje` VALUES (1,'mensaje1','2018-12-20 13:48:28',1,2),(2,'mensaje2','2018-12-20 13:48:28',3,4),(3,'mensaje3','2018-12-20 13:48:28',4,3),(4,'mensaje4','2018-12-20 13:48:28',2,1),(5,'mensaje5','2018-12-20 13:48:28',4,2);
/*!40000 ALTER TABLE `mensaje` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permiso`
--

DROP TABLE IF EXISTS `permiso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `permiso` (
  `idPermiso` int(11) NOT NULL AUTO_INCREMENT,
  `objeto` varchar(45) NOT NULL,
  `idTipoPermiso` int(11) DEFAULT NULL,
  PRIMARY KEY (`idPermiso`),
  KEY `idTipoPermiso_idx` (`idTipoPermiso`),
  CONSTRAINT `idTipoPermiso` FOREIGN KEY (`idTipoPermiso`) REFERENCES `tipopermiso` (`idTipoPermiso`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permiso`
--

LOCK TABLES `permiso` WRITE;
/*!40000 ALTER TABLE `permiso` DISABLE KEYS */;
INSERT INTO `permiso` VALUES (1,'usuarios',1),(2,'usuarios',2),(3,'usuarios',3),(4,'usuarios',4);
/*!40000 ALTER TABLE `permiso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prioridad`
--

DROP TABLE IF EXISTS `prioridad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `prioridad` (
  `idPrioridad` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  PRIMARY KEY (`idPrioridad`),
  UNIQUE KEY `nombrePrioridad_UNIQUE` (`nombre`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prioridad`
--

LOCK TABLES `prioridad` WRITE;
/*!40000 ALTER TABLE `prioridad` DISABLE KEYS */;
INSERT INTO `prioridad` VALUES (4,'Alta'),(2,'Baja'),(1,'Muy Baja'),(3,'Normal'),(5,'Urgente');
/*!40000 ALTER TABLE `prioridad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proyecto`
--

DROP TABLE IF EXISTS `proyecto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `proyecto` (
  `idProyecto` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  `fip` timestamp NULL DEFAULT NULL,
  `ffp` timestamp NULL DEFAULT NULL,
  `fir` timestamp NULL DEFAULT NULL,
  `ffr` timestamp NULL DEFAULT NULL,
  `estado` bit(1) NOT NULL,
  `idCliente` int(11) DEFAULT NULL,
  PRIMARY KEY (`idProyecto`),
  KEY `idCliente_idx` (`idCliente`),
  CONSTRAINT `idClienteProyecto` FOREIGN KEY (`idCliente`) REFERENCES `cliente` (`idCliente`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proyecto`
--

LOCK TABLES `proyecto` WRITE;
/*!40000 ALTER TABLE `proyecto` DISABLE KEYS */;
INSERT INTO `proyecto` VALUES (1,'proyecto0','2018-12-20 13:48:28','2018-12-20 13:48:28','2018-12-20 13:48:28','2018-12-20 13:48:28',_binary '\0',1),(2,'proyecto1','2018-12-20 13:48:28','2018-12-20 13:48:28','2018-12-20 13:48:28','2018-12-20 13:48:28',_binary '\0',2),(3,'proyecto2','2018-12-20 13:48:28','2018-12-20 13:48:28','2018-12-20 13:48:28','2018-12-20 13:48:28',_binary '\0',3),(4,'proyecto3','2018-12-20 13:48:28','2018-12-20 13:48:28','2018-12-20 13:48:28','2018-12-20 13:48:28',_binary '\0',4);
/*!40000 ALTER TABLE `proyecto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `requisito`
--

DROP TABLE IF EXISTS `requisito`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `requisito` (
  `idRequisito` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `esIncidencia` bit(1) NOT NULL,
  `finalizado` bit(1) NOT NULL,
  `ruta` varchar(255) DEFAULT NULL,
  `idProyecto` int(11) NOT NULL,
  `idUsuario` int(11) DEFAULT NULL,
  `idPrioridad` int(11) NOT NULL,
  PRIMARY KEY (`idRequisito`),
  KEY `fk_requisitos_proyecto1_idx` (`idProyecto`),
  KEY `idUsuario_idx` (`idUsuario`),
  KEY `fk_requisitos_prioridad1_idx` (`idPrioridad`),
  CONSTRAINT `idPrioridad` FOREIGN KEY (`idPrioridad`) REFERENCES `prioridad` (`idPrioridad`) ON UPDATE CASCADE,
  CONSTRAINT `idProyecto` FOREIGN KEY (`idProyecto`) REFERENCES `proyecto` (`idProyecto`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `idUsuario` FOREIGN KEY (`idUsuario`) REFERENCES `usuario` (`idUsuario`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `requisito`
--

LOCK TABLES `requisito` WRITE;
/*!40000 ALTER TABLE `requisito` DISABLE KEYS */;
INSERT INTO `requisito` VALUES (1,'2018-07-13 11:10:11',_binary '\0',_binary '','D:/req/req1',1,2,1),(2,'2018-01-15 12:10:11',_binary '',_binary '','D:/req/req2',1,2,3),(3,'2018-03-23 12:10:11',_binary '\0',_binary '\0','D:/req/req3',1,1,1),(4,'2018-10-13 11:10:11',_binary '',_binary '\0','D:/req/req4',2,3,2),(5,'2018-10-13 11:10:11',_binary '',_binary '\0','D:/req/req5',2,2,1),(6,'2018-07-13 11:10:11',_binary '\0',_binary '','D:/req/req1',2,2,1),(7,'2018-01-15 12:10:11',_binary '',_binary '','D:/req/req2',3,2,3),(8,'2018-03-23 12:10:11',_binary '\0',_binary '\0','D:/req/req3',3,1,1),(9,'2018-10-13 11:10:11',_binary '',_binary '\0','D:/req/req4',3,3,2),(10,'2018-10-13 11:10:11',_binary '',_binary '\0','D:/req/req5',4,2,1),(11,'2018-07-13 11:10:11',_binary '\0',_binary '','D:/req/req1',4,2,1),(12,'2018-01-15 12:10:11',_binary '',_binary '','D:/req/req2',4,2,3),(13,'2019-01-02 14:00:24',_binary '',_binary '\0','ToDo-2018_8.png',1,1,2),(14,'2019-01-02 14:04:17',_binary '',_binary '\0','ToDo-2018_11.png',1,1,2),(15,'2019-01-02 14:10:25',_binary '',_binary '\0','ToDo-2018_7.png',1,1,2),(16,'2019-01-02 14:10:38',_binary '',_binary '\0','ToDo-2018_7.png',1,1,4),(17,'2019-01-02 14:14:55',_binary '',_binary '\0','ToDo-2018_8.png',1,1,2),(18,'2019-01-02 14:15:04',_binary '',_binary '\0','ToDo-2018_8.png',1,1,2),(19,'2019-01-02 14:15:13',_binary '',_binary '\0','ToDo-2018_7.png',1,1,2),(20,'2019-01-02 14:20:12',_binary '\0',_binary '\0','ToDo-2018_8.png',1,1,3),(21,'2019-01-02 14:20:44',_binary '\0',_binary '\0','ToDo-2018_1.png',1,1,5),(22,'2019-01-02 14:20:55',_binary '\0',_binary '\0','ToDo-2018_7.png',1,1,2),(23,'2019-01-02 14:32:16',_binary '\0',_binary '\0','netbeans',1,1,1),(24,'2019-01-02 14:49:43',_binary '\0',_binary '\0','ToDo-2018_1.png',1,1,4),(25,'2019-01-02 14:49:53',_binary '\0',_binary '\0','ToDo-2018_6.png',1,1,3),(26,'2019-01-02 14:50:03',_binary '\0',_binary '\0','ToDo-2018_5.png',1,1,1),(27,'2019-01-02 14:50:13',_binary '\0',_binary '\0','ToDo-2018_10.png',1,1,5),(28,'2019-01-02 14:52:29',_binary '\0',_binary '\0','ToDo-2018_11.png',1,1,1),(29,'2019-01-02 14:53:28',_binary '\0',_binary '\0','ToDo-2018_1.png',1,1,4),(30,'2019-01-02 14:53:46',_binary '\0',_binary '\0','ToDo-2018_2.png',1,1,4),(31,'2019-01-02 14:55:34',_binary '\0',_binary '\0','ToDo-2018_1.png',1,1,1),(32,'2019-01-02 14:55:57',_binary '\0',_binary '\0','ToDo-2018_3.png',1,1,2),(33,'2019-01-03 12:25:45',_binary '\0',_binary '\0','netbeans64.exe',1,1,1),(34,'2019-01-03 12:25:58',_binary '\0',_binary '\0','netbeans',1,1,3),(35,'2019-01-03 13:51:33',_binary '\0',_binary '\0','netbeans64.exe',1,1,1),(36,'2019-01-03 13:52:01',_binary '\0',_binary '\0','netbeans.exe',1,1,3),(37,'2019-01-03 14:01:10',_binary '\0',_binary '\0','netbeans',1,1,1),(38,'2019-01-03 14:10:18',_binary '\0',_binary '\0','netbeans64.exe',1,1,5),(39,'2019-01-03 14:19:32',_binary '\0',_binary '\0','soffice.exe',1,1,1),(40,'2019-01-03 14:20:16',_binary '\0',_binary '\0','printable_to_do_list_7_day_week_portrait_down.pdf',1,1,1),(41,'2019-01-03 14:24:55',_binary '\0',_binary '\0','printable-to-do-list-calendar-daily-to-do-list-template-excel-format-microsoft-excel-of-printable-to-do-list-calendar.jpg',1,1,3),(42,'2019-01-03 14:25:24',_binary '\0',_binary '\0','printable_to_do_list_7_day_week_landscape.pdf',1,1,2),(43,'2019-01-03 14:30:10',_binary '\0',_binary '\0','printable-to-do-list-calendar-daily-to-do-list-template-excel-format-microsoft-excel-of-printable-to-do-list-calendar.jpg',1,1,3),(44,'2019-01-03 14:30:34',_binary '',_binary '\0','printable_to_do_list_7_day_week_landscape.pdf',1,1,5),(45,'2019-01-04 15:03:16',_binary '\0',_binary '\0','ToDo-2018_12.png',1,1,5),(46,'2019-01-07 09:37:00',_binary '\0',_binary '\0','ToDo-2018_1.png',1,1,2),(47,'2019-01-07 09:37:28',_binary '',_binary '\0','ToDo-2018_3.png',1,1,1);
/*!40000 ALTER TABLE `requisito` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rol`
--

DROP TABLE IF EXISTS `rol`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rol` (
  `idRol` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  PRIMARY KEY (`idRol`),
  UNIQUE KEY `nombreRol_UNIQUE` (`nombre`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rol`
--

LOCK TABLES `rol` WRITE;
/*!40000 ALTER TABLE `rol` DISABLE KEYS */;
INSERT INTO `rol` VALUES (1,'administrador'),(2,'cliente'),(3,'empleado'),(4,'gestor');
/*!40000 ALTER TABLE `rol` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rol_usuario_proyecto`
--

DROP TABLE IF EXISTS `rol_usuario_proyecto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rol_usuario_proyecto` (
  `idRol` int(11) NOT NULL,
  `idUsuario` int(11) NOT NULL,
  `idProyecto` int(11) NOT NULL,
  PRIMARY KEY (`idRol`,`idUsuario`,`idProyecto`),
  KEY `fk_rol_has_usuario_has_proyecto_proyecto1_idx` (`idProyecto`),
  KEY `fk_rol_has_usuario_has_proyecto_usuario_idx` (`idUsuario`),
  CONSTRAINT `idProyectoT` FOREIGN KEY (`idProyecto`) REFERENCES `proyecto` (`idProyecto`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `idRolT` FOREIGN KEY (`idRol`) REFERENCES `rol` (`idRol`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `idUsuarioT` FOREIGN KEY (`idUsuario`) REFERENCES `usuario` (`idUsuario`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rol_usuario_proyecto`
--

LOCK TABLES `rol_usuario_proyecto` WRITE;
/*!40000 ALTER TABLE `rol_usuario_proyecto` DISABLE KEYS */;
INSERT INTO `rol_usuario_proyecto` VALUES (1,1,1),(1,4,1),(2,3,2),(3,2,3);
/*!40000 ALTER TABLE `rol_usuario_proyecto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rolpermiso`
--

DROP TABLE IF EXISTS `rolpermiso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rolpermiso` (
  `idRol` int(11) NOT NULL,
  `idPermiso` int(11) NOT NULL,
  PRIMARY KEY (`idRol`,`idPermiso`),
  KEY `fk_rol_has_permiso_permiso1_idx` (`idPermiso`),
  KEY `fk_rol_has_permiso_rol_idx` (`idRol`),
  CONSTRAINT `idPermiso` FOREIGN KEY (`idPermiso`) REFERENCES `permiso` (`idPermiso`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `idRol` FOREIGN KEY (`idRol`) REFERENCES `rol` (`idRol`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rolpermiso`
--

LOCK TABLES `rolpermiso` WRITE;
/*!40000 ALTER TABLE `rolpermiso` DISABLE KEYS */;
INSERT INTO `rolpermiso` VALUES (1,1),(2,1),(1,2),(1,3),(1,4);
/*!40000 ALTER TABLE `rolpermiso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tarea`
--

DROP TABLE IF EXISTS `tarea`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tarea` (
  `idTarea` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(250) NOT NULL,
  `fip` timestamp NULL DEFAULT NULL,
  `ffp` timestamp NULL DEFAULT NULL,
  `fir` timestamp NULL DEFAULT NULL,
  `ffr` timestamp NULL DEFAULT NULL,
  `idTareaPadre` int(11) DEFAULT NULL,
  `idRequisito` int(11) NOT NULL,
  PRIMARY KEY (`idTarea`),
  KEY `fk_Tarea_Tarea1_idx` (`idTareaPadre`),
  KEY `idReq_idx` (`idRequisito`),
  CONSTRAINT `idReq` FOREIGN KEY (`idRequisito`) REFERENCES `requisito` (`idRequisito`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `idTareaPadre` FOREIGN KEY (`idTareaPadre`) REFERENCES `tarea` (`idTarea`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tarea`
--

LOCK TABLES `tarea` WRITE;
/*!40000 ALTER TABLE `tarea` DISABLE KEYS */;
INSERT INTO `tarea` VALUES (1,'Tarea unica para','2018-12-20 13:48:28','2018-12-20 13:48:28','2018-12-20 13:48:28','2018-12-20 13:48:28',1,1),(2,'Tarea Padre de tarea3','2018-12-20 13:48:28','2018-12-20 13:48:28','2018-12-20 13:48:28','2018-12-20 13:48:28',2,2),(3,'Tarea hija de tarea2','2018-12-20 13:48:28','2018-12-20 13:48:28','2018-12-20 13:48:28','2018-12-20 13:48:28',2,2),(4,'Tarea Padre de otra que a su vez es padre','2018-12-20 13:48:28','2018-12-20 13:48:28','2018-12-20 13:48:28','2018-12-20 13:48:28',3,3),(5,'Tarea hija de tarea4 que a su vez es padre de tarea6','2018-12-20 13:48:28','2018-12-20 13:48:28','2018-12-20 13:48:28','2018-12-20 13:48:28',3,3),(6,'Tarea hija de tarea5 que a su vez es hija de tarea4','2018-12-20 13:48:28','2018-12-20 13:48:28','2018-12-20 13:48:28','2018-12-20 13:48:28',3,3);
/*!40000 ALTER TABLE `tarea` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tarea_informe`
--

DROP TABLE IF EXISTS `tarea_informe`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tarea_informe` (
  `idTarea` int(11) NOT NULL,
  `idInforme` int(11) NOT NULL,
  PRIMARY KEY (`idTarea`,`idInforme`),
  KEY `fk_Tarea_has_informe_informe1_idx` (`idInforme`),
  KEY `fk_Tarea_has_informe_Tarea1_idx` (`idTarea`),
  CONSTRAINT `idInformeTareaInforme` FOREIGN KEY (`idInforme`) REFERENCES `informe` (`idInforme`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `idTareaTareaInforme` FOREIGN KEY (`idTarea`) REFERENCES `tarea` (`idTarea`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tarea_informe`
--

LOCK TABLES `tarea_informe` WRITE;
/*!40000 ALTER TABLE `tarea_informe` DISABLE KEYS */;
INSERT INTO `tarea_informe` VALUES (1,1),(2,1),(3,4),(4,4);
/*!40000 ALTER TABLE `tarea_informe` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tarea_usuario`
--

DROP TABLE IF EXISTS `tarea_usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tarea_usuario` (
  `idTarea` int(11) NOT NULL,
  `idUsuario` int(11) NOT NULL,
  PRIMARY KEY (`idTarea`,`idUsuario`),
  KEY `fk_Tarea_has_usuario_usuario1_idx` (`idUsuario`),
  KEY `fk_Tarea_has_usuario_Tarea1_idx` (`idTarea`),
  CONSTRAINT `idTareaTareaUsuario` FOREIGN KEY (`idTarea`) REFERENCES `tarea` (`idTarea`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `idUsuarioTareaUsuario` FOREIGN KEY (`idUsuario`) REFERENCES `usuario` (`idUsuario`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tarea_usuario`
--

LOCK TABLES `tarea_usuario` WRITE;
/*!40000 ALTER TABLE `tarea_usuario` DISABLE KEYS */;
INSERT INTO `tarea_usuario` VALUES (1,1),(2,1),(3,2),(5,2),(4,3);
/*!40000 ALTER TABLE `tarea_usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipoalerta`
--

DROP TABLE IF EXISTS `tipoalerta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipoalerta` (
  `idTipoAlerta` int(11) NOT NULL AUTO_INCREMENT,
  `tipoAlerta` varchar(45) NOT NULL,
  PRIMARY KEY (`idTipoAlerta`),
  UNIQUE KEY `tipoAlerta_UNIQUE` (`tipoAlerta`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipoalerta`
--

LOCK TABLES `tipoalerta` WRITE;
/*!40000 ALTER TABLE `tipoalerta` DISABLE KEYS */;
INSERT INTO `tipoalerta` VALUES (1,'Tipo alerta 1'),(2,'Tipo alerta 2'),(3,'Tipo alerta 3'),(4,'Tipo alerta 4'),(5,'Tipo alerta 5'),(6,'Tipo alerta 6');
/*!40000 ALTER TABLE `tipoalerta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipopermiso`
--

DROP TABLE IF EXISTS `tipopermiso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipopermiso` (
  `idTipoPermiso` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  PRIMARY KEY (`idTipoPermiso`),
  UNIQUE KEY `nombre` (`nombre`),
  UNIQUE KEY `nombreTipoPermiso_UNIQUE` (`nombre`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipopermiso`
--

LOCK TABLES `tipopermiso` WRITE;
/*!40000 ALTER TABLE `tipopermiso` DISABLE KEYS */;
INSERT INTO `tipopermiso` VALUES (2,'crear'),(4,'eliminar'),(3,'modificar'),(1,'ver');
/*!40000 ALTER TABLE `tipopermiso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuario` (
  `idUsuario` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  `dni` varchar(15) NOT NULL,
  `password` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `login` varchar(45) NOT NULL,
  PRIMARY KEY (`idUsuario`),
  UNIQUE KEY `dni_UNIQUE` (`dni`),
  UNIQUE KEY `email_UNIQUE` (`email`),
  UNIQUE KEY `login_UNIQUE` (`login`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (1,'Mario','000000S','mario','mario@mario.com','mario'),(2,'Felisa','000000T','felisa','felisa@felisa.com','felisa'),(3,'Pamela','000000V','pamela','pamela@pamela.com','pamela'),(4,'Ramon','000000W','ramon','ramon@ramon.com','ramon');
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario_alerta`
--

DROP TABLE IF EXISTS `usuario_alerta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuario_alerta` (
  `idUsuario` int(11) NOT NULL,
  `idAlerta` int(11) NOT NULL,
  `fechaVisto` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`idUsuario`,`idAlerta`),
  KEY `fk_usuario_has_alerta_alerta1_idx` (`idAlerta`),
  KEY `fk_usuario_has_alerta_usuario1_idx` (`idUsuario`),
  CONSTRAINT `idAlertaUsuarioAlerta` FOREIGN KEY (`idAlerta`) REFERENCES `alerta` (`idAlerta`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `idUsuarioUsuarioAlerta` FOREIGN KEY (`idUsuario`) REFERENCES `usuario` (`idUsuario`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario_alerta`
--

LOCK TABLES `usuario_alerta` WRITE;
/*!40000 ALTER TABLE `usuario_alerta` DISABLE KEYS */;
INSERT INTO `usuario_alerta` VALUES (1,2,NULL),(2,3,NULL),(2,4,'2018-05-15 17:48:28'),(3,4,'2018-12-20 13:48:28'),(4,1,NULL);
/*!40000 ALTER TABLE `usuario_alerta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario_chatgrupo`
--

DROP TABLE IF EXISTS `usuario_chatgrupo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuario_chatgrupo` (
  `idUsuario` int(11) NOT NULL,
  `idChatGrupo` int(11) NOT NULL,
  PRIMARY KEY (`idUsuario`,`idChatGrupo`),
  KEY `fk_usuario_has_chatGrupo_chatGrupo1_idx` (`idChatGrupo`),
  KEY `fk_usuario_has_chatGrupo_usuario1_idx` (`idUsuario`),
  CONSTRAINT `idChatGrupoUsuarioChatGrupo` FOREIGN KEY (`idChatGrupo`) REFERENCES `chatgrupo` (`idChatGrupo`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `idUsuarioUsuarioChatGrupo` FOREIGN KEY (`idUsuario`) REFERENCES `usuario` (`idUsuario`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario_chatgrupo`
--

LOCK TABLES `usuario_chatgrupo` WRITE;
/*!40000 ALTER TABLE `usuario_chatgrupo` DISABLE KEYS */;
INSERT INTO `usuario_chatgrupo` VALUES (4,1),(1,2),(2,3),(2,4),(3,4);
/*!40000 ALTER TABLE `usuario_chatgrupo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario_cliente`
--

DROP TABLE IF EXISTS `usuario_cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuario_cliente` (
  `idUsuario` int(11) NOT NULL,
  `idCliente` int(11) NOT NULL,
  PRIMARY KEY (`idUsuario`,`idCliente`),
  KEY `fk_usuario_has_cliente_cliente1_idx` (`idCliente`),
  KEY `fk_usuario_has_cliente_usuario1_idx` (`idUsuario`),
  CONSTRAINT `idClienteUsuarioCliente` FOREIGN KEY (`idCliente`) REFERENCES `cliente` (`idCliente`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `idUsuarioUsuarioCliente` FOREIGN KEY (`idUsuario`) REFERENCES `usuario` (`idUsuario`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario_cliente`
--

LOCK TABLES `usuario_cliente` WRITE;
/*!40000 ALTER TABLE `usuario_cliente` DISABLE KEYS */;
INSERT INTO `usuario_cliente` VALUES (3,1);
/*!40000 ALTER TABLE `usuario_cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `version`
--

DROP TABLE IF EXISTS `version`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `version` (
  `idVersion` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `path` varchar(255) NOT NULL,
  `idArchivo` int(11) NOT NULL,
  `idUsuario` int(11) DEFAULT NULL,
  `esFinal` bit(1) DEFAULT NULL,
  PRIMARY KEY (`idVersion`),
  KEY `idArchivo_idx` (`idArchivo`),
  KEY `idUsuario_idx` (`idUsuario`),
  CONSTRAINT `idArchivo` FOREIGN KEY (`idArchivo`) REFERENCES `archivo` (`idArchivo`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `idUsuarioVersion` FOREIGN KEY (`idUsuario`) REFERENCES `usuario` (`idUsuario`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `version`
--

LOCK TABLES `version` WRITE;
/*!40000 ALTER TABLE `version` DISABLE KEYS */;
INSERT INTO `version` VALUES (1,'Pepito','2018-12-20 13:48:28','Direccion1',1,1,_binary ''),(2,'Maria','2018-12-20 13:48:28','Direccion2',2,2,_binary ''),(3,'Jhon','2018-12-20 13:48:28','Direccion3',3,3,_binary ''),(4,'La Yesi','2018-12-20 13:48:28','Direccion4',4,4,_binary ''),(5,'Manolo Cabeza Bolo','2018-12-20 13:48:28','Direccion5',5,4,_binary '');
/*!40000 ALTER TABLE `version` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-01-07 15:59:55
