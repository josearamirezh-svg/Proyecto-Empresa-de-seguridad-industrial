-- MySQL dump 10.13  Distrib 8.0.42, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: db_mis_pronaltex
-- ------------------------------------------------------
-- Server version	9.3.0

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

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cliente` (
  `id_cliente` int NOT NULL AUTO_INCREMENT,
  `tipo_cliente` enum('empresa','persona') NOT NULL,
  `nombre_razon_social` varchar(150) DEFAULT NULL,
  `numero_identificacion` varchar(20) NOT NULL,
  `direccion` varchar(200) DEFAULT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  PRIMARY KEY (`id_cliente`),
  UNIQUE KEY `id_cliente` (`id_cliente`),
  UNIQUE KEY `numero_identificacion` (`numero_identificacion`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES (1,'persona','Jose Amir Ramírez Hernández','1013101266','cra 123 # 14b - 46','3202806133','josea.ramirezh@ecci.edu.co',''),(2,'persona','Laura Gómez Pérez','1024578912','Calle 45 #22-18','3115879421','laura.gomezp@gmail.com',''),(3,'empresa','Soluciones Industriales S.A.S.','900456789','Av. Las Américas #78-45','6045678901','contacto@solucionesind.com',''),(4,'persona','Carlos Andrés Mejía Rojas','1032456789','Carrera 12 #34-89','3159087123','carlosmejia89@hotmail.com',''),(5,'empresa','TecnoFuego Ltda.','901234567','Calle 80 #65-20','6013456789','ventas@tecnofuego.com',''),(6,'persona','Diana Paola Cárdenas López','1045678921','Carrera 45 #19-22','3126789012','dianacardenasl@gmail.com',''),(7,'empresa','ExtiSeguridad Colombia S.A.S.','901789654','Autopista Norte #120-30','6014578963','info@extiseguridad.co',''),(8,'persona','Edward Estiven Moreno Franco','1029384756','Calle 30 #55-18','3174567890','edward.moreno@correo.com',''),(9,'persona','Valentina Ríos Martínez','1056789234','Transversal 45 #33-12','3208765432','valentina.riosm@gmail.com',''),(10,'empresa','Fuego Control S.A.','900987654','Zona Industrial #9-25','6018765432','contacto@fuegocontrolsa.com',''),(11,'persona','Andrés Felipe Torres García','1045698723','Calle 89 #23-45','3219087654','andres.torresg@gmail.com',''),(12,'empresa','ProtecFire S.A.S.','902345678','Carrera 65 #90-21','6012349876','contacto@protecfire.com',''),(13,'persona','Mariana López Ramírez','1056789345','Transversal 12 #45-67','3156547890','mariana.lopezr@hotmail.com',''),(14,'empresa','Seguridad Total Ltda.','900654321','Calle 100 #45-10','6015678432','ventas@seguridadtotal.co',''),(15,'persona','Juan Sebastián Rincón Duarte','1023456781','Carrera 34 #15-28','3179086543','juan.rincond@gmail.com',''),(16,'empresa','Incendios & Rescate S.A.','901567234','Av. Boyacá #70-50','6017894321','info@incendiosrescate.com',''),(17,'persona','Tatiana Herrera Gómez','1047823456','Calle 67 #45-12','3109876543','tatiana.herrerag@outlook.com',''),(18,'empresa','FireControl Express S.A.S.','902678901','Zona Franca #4-60','6013456123','contacto@firecontrol.co',''),(19,'persona','Luis Fernando Castro Ortiz','1036789456','Carrera 89 #50-30','3123456789','luis.castroo@gmail.com',''),(20,'empresa','Servicios Industriales Omega Ltda.','901890234','Parque Industrial #12-55','6017892345','omega@serviciosindustriales.com','');
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detalle_venta`
--

DROP TABLE IF EXISTS `detalle_venta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `detalle_venta` (
  `id_detalle` int NOT NULL,
  `id_venta` int DEFAULT NULL,
  `id_producto` int DEFAULT NULL,
  `cantidad` int DEFAULT NULL,
  `subtotal` decimal(12,2) DEFAULT NULL,
  PRIMARY KEY (`id_detalle`),
  UNIQUE KEY `id_detalle` (`id_detalle`),
  KEY `id_venta` (`id_venta`),
  KEY `id_producto` (`id_producto`),
  CONSTRAINT `detalle_venta_ibfk_1` FOREIGN KEY (`id_venta`) REFERENCES `venta` (`id_venta`),
  CONSTRAINT `detalle_venta_ibfk_2` FOREIGN KEY (`id_producto`) REFERENCES `producto` (`id_producto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalle_venta`
--

LOCK TABLES `detalle_venta` WRITE;
/*!40000 ALTER TABLE `detalle_venta` DISABLE KEYS */;
INSERT INTO `detalle_venta` VALUES (1,1,3,2,300000.00),(2,1,1,1,150000.00),(3,2,5,2,320000.00),(4,3,2,4,950000.00),(5,4,4,1,180000.00),(6,5,6,2,650000.00),(7,6,3,1,280000.00),(8,7,7,5,1200000.00),(9,8,8,3,870000.00),(10,9,1,1,135000.00),(11,10,2,2,320000.00),(12,11,9,3,540000.00),(13,12,10,5,975000.00),(14,13,3,1,230000.00),(15,14,4,2,760000.00),(16,15,7,6,1150000.00),(17,16,5,1,98000.00),(18,17,9,2,345000.00),(19,18,8,2,420000.00),(20,19,6,3,660000.00);
/*!40000 ALTER TABLE `detalle_venta` ENABLE KEYS */;
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
  `tipo_producto` varchar(50) DEFAULT NULL,
  `descripcion` text,
  `precio_unitario` decimal(12,2) DEFAULT NULL,
  `stock_actual` int DEFAULT NULL,
  `categoria` varchar(100) NOT NULL,
  PRIMARY KEY (`id_producto`),
  UNIQUE KEY `id_producto` (`id_producto`)
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `producto`
--

LOCK TABLES `producto` WRITE;
/*!40000 ALTER TABLE `producto` DISABLE KEYS */;
INSERT INTO `producto` VALUES (1,'Extintor ABC multiproposito 5 lbrs','Extintores','Polvo quimico seco a base de fosfato. Diseñado para combatir una variedad de tipos de incendios en diferentes entornos. Clase: A (combustibles sólidos), B (combustibles líquidos), C (gases inflamables).',35000.00,25,'Equipos contra incendios'),(2,'Extintor ABC multiproposito 10 lbrs','Extintores','Polvo quimico seco a base de fosfato. Diseñado para combatir una variedad de tipos de incendios en diferentes entornos. Clase: A (combustibles sólidos), B (combustibles líquidos), C (gases inflamables).',45000.00,25,'Equipos contra incendios'),(3,'Extintor ABC multiproposito 20 lbrs','Extintores','Polvo quimico seco a base de fosfato. Diseñado para combatir una variedad de tipos de incendios en diferentes entornos. Clase: A (combustibles sólidos), B (combustibles líquidos), C (gases inflamables).',55000.00,25,'Equipos contra incendios'),(4,'Extintor ABC multiproposito 30 lbrs','Extintores','Polvo quimico seco a base de fosfato. Diseñado para combatir una variedad de tipos de incendios en diferentes entornos. Clase: A (combustibles sólidos), B (combustibles líquidos), C (gases inflamables).',65000.00,25,'Equipos contra incendios'),(5,'Extintor rodante ABC multiproposito 150 lbrs','Extintores','Polvo quimico seco a base de fosfato. Ruedas traseras de 13”, manguera de 6 metros con doble resorte y pasamanos con protector de cauchocontra oxido e intemperie.',130000.00,50,'Equipos contra incendios'),(6,'Extintor BC polvo quimico 5 lbrs','Extintores','Es un equipo de extinción que se utiliza para apagar incendios que involucran líquidos inflamables (Clase B) y equipos eléctricos energizados (Clase C). Utiliza un agente extintor en forma de polvo químico seco.',35000.00,25,'Equipos contra incendios'),(7,'Extintor BC polvo quimico 10 lbrs','Extintores','Es un equipo de extinción que se utiliza para apagar incendios que involucran líquidos inflamables (Clase B) y equipos eléctricos energizados (Clase C). Utiliza un agente extintor en forma de polvo químico seco.',45000.00,25,'Equipos contra incendios'),(8,'Extintor BC polvo quimico 20 lbrs','Extintores','Es un equipo de extinción que se utiliza para apagar incendios que involucran líquidos inflamables (Clase B) y equipos eléctricos energizados (Clase C). Utiliza un agente extintor en forma de polvo químico seco.',55000.00,25,'Equipos contra incendios'),(9,'Extintor BC polvo quimico 30 lbrs','Extintores','Es un equipo de extinción que se utiliza para apagar incendios que involucran líquidos inflamables (Clase B) y equipos eléctricos energizados (Clase C). Utiliza un agente extintor en forma de polvo químico seco.',65000.00,25,'Equipos contra incendios'),(10,'Extintor satelite rodante BC polvo químico 150 lbrs','Extintores','Es un equipo de gran capacidad de extinción que se utiliza para apagar incendios que involucran líquidos inflamables (Clase B) y equipos eléctricos energizados (Clase C). Utiliza un agente extintor en forma de polvo químico seco.',130000.00,15,'Equipos contra incendios'),(11,'Extintor de agua a presión 2.5 galones','Extintores','Extintor con agua (H2O con agente penetrante). Actúa enfriando el fuego y sofocando las llamas al eliminar el calor necesario para la combustión. Es eficaz en incendios de Clase A',25000.00,25,'Equipos contra incendios'),(12,'Extintor de agua a presión tipo satelite 18 galones','Extintores','Extintor de mayor capacidad que utiliza agua como\nagente principal para extinguir incendios de Clase A, que\ninvolucran materiales sólidos combustibles como\nmadera, papel, tela y otros elementos comunes.\"',175000.00,18,'Equipos contra incendios'),(13,'Extintor CO2 de gas carbónico 5 lbrs','Extintores','En acero al carbono plateado. Es un equipo especializado para extinguir incendios de Clase B y C. Su agente extintor, el dióxido de carbono, adecuado para apagar fuegos en equipos eléctricos y líquidos inflamables.',45000.00,12,'Equipos contra incendios'),(14,'Extintor CO2 de gas carbónico 10 lbrs','Extintores','En acero al carbono plateado. Es un equipo especializado para extinguir incendios de Clase B y C. Su agente extintor, el dióxido de carbono, adecuado para apagar fuegos en equipos eléctricos y líquidos inflamables.',65000.00,90,'Equipos contra incendios'),(15,'Extintor CO2 de gas carbónico 15 lbrs','Extintores','En acero al carbono plateado. Es un equipo especializado para extinguir incendios de Clase B y C. Su agente extintor, el dióxido de carbono, adecuado para apagar fuegos en equipos eléctricos y líquidos inflamables.',75000.00,20,'Equipos contra incendios'),(16,'Extintor rodante CO2 de gas carbónico 50 lbrs','Extintores','Es una herramienta versátil que utiliza dióxido de carbono como agente extintor para apagar incendios de Clase\r B y C. Manguera de 4 mts, ruedas antipinchazos y recubrimiento epóxico dealta resistencia en su estructura.\"',120000.00,30,'Equipos contra incendios'),(17,'Extintor rodante CO2 de gas carbónico 100 lbrs','Extintores','Es una herramienta versátil que utiliza dióxido de carbono como agente extintor para apagar incendios de Clase\r B y C. Manguera de 4 mts, ruedas antipinchazos y recubrimiento epóxico dealta resistencia en su estructura.\"',200000.00,30,'Equipos contra incendios'),(18,'Extintor rodante CO2 de gas carbónico 150 lbrs','Extintores','Es una herramienta versátil que utiliza dióxido de carbono como agente extintor para apagar incendios de Clase\nB y C. Manguera de 4 mts, ruedas antipinchazos y recubrimiento epóxico dealta resistencia en su estructura.\"',230000.00,30,'Equipos contra incendios'),(19,'Extintor solkaflam agente limpio 2.700 grm','Extintores','El agente extintor Solkaflam es una alternativa a los agentes químicos tradicionales y está diseñado para minimizar el\r impacto ambiental mientras ofrece una eficaz supresión de\r incendios. Especiales para equipos electrónicos y fuegos de\r tipo A y tipo C\"',40000.00,25,'Equipos contra incendios'),(20,'Extintor solkaflam agente limpio 3.700 grm','Extintores','El agente extintor Solkaflam es una alternativa a los agentes químicos tradicionales y está diseñado para minimizar el\nimpacto ambiental mientras ofrece una eficaz supresión de\nincendios. Especiales para equipos electrónicos y fuegos de\ntipo A y tipo C\"',55000.00,20,'Equipos contra incendios'),(21,'Extintor solkaflam agente limpio 9.000 grm','Extintores','El agente extintor Solkaflam es una alternativa a los agentes químicos tradicionales y está diseñado para minimizar el\r impacto ambiental mientras ofrece una eficaz supresión de\r incendios. Especiales para equipos electrónicos y fuegos de\r tipo A y tipo C\"',70000.00,35,'Equipos contra incendios'),(22,'Extintor húmedo tipo K 1.5 galones','Extintores','Extintor de solución húmeda. Esencial para la prevención y control de incendios en cocinas donde se manejan aceites y grasas. Estos incendios, comunes en entornos de restaurantes y cocinas comerciales',65000.00,30,'Equipos contra incendios'),(23,'Extintor húmedo tipo K 2.5 galones','Extintores','Extintor de solución húmeda. Esencial para la prevención y control de incendios en cocinas donde se manejan aceites y grasas. Estos incendios, comunes en entornos de restaurantes y cocinas comerciales',75000.00,30,'Equipos contra incendios'),(24,'Extintor húmedo tipo K 3.5 galones','Extintores','Extintor de solución húmeda. Esencial para la prevención y control de incendios en cocinas donde se manejan aceites y grasas. Estos incendios, comunes en entornos de restaurantes y cocinas comerciales',95000.00,30,'Equipos contra incendios'),(25,'Extintores de lujo 600 gr','Extintores','Diseño elegante para uso convencional.',50000.00,30,'Equipos contra incendios'),(26,'Camilla plastica','Camillas','Incluye: inmovilizador + arnés reflectivo tipo araña + señalización + soporte. Tamaño: 45 cm de ancho x 183 cm de largo. Fabricada con altos estándares de calidad; en polietileno de Alta densidad (HDPE) plástico con memoria. Con filtro uv, conserva el color a la intemperie; Inmune a todos los fluidos corporales y fáciles de descontaminar.',13500.00,90,'Equipos de emergencia'),(27,'Camilla plástica pediátrica','Camillas','Incluye: inmovilizador + arnés reflectivo tipo araña + señalización + soporte. Tamaño: 43 cm de ancho x 1.20 cm de largo x 5cm de alto. Fabricada con altos estándares de calidad; en polietileno de Alta densidad (HDPE) plástico con memoria. Con filtro uv, conserva el color a la intemperie; Inmune a todos los fluidos corporales y fáciles de descontaminar.',39000.00,50,'Equipos de emergencia'),(28,'Camilla de madera','Camillas','Incluye: inmovilizador + arnés reflectivo tipo araña + señalización + soporte. Tamaño: 45 cm de ancho x 183 cm de largo. Material: madera',135000.00,25,'Equipos de emergencia'),(29,'Camilla madera pediatrica','Camillas','Incluye: inmovilizador + arnés reflectivo tipo araña + señalización + soporte. Tamaño: 43 cm de ancho x 1.20cm de largo x 5 cm de alto. Material: madera',185000.00,12,'Equipos de emergencia'),(30,'Camilla plastica tipo Miller','Camillas','Fabricada con altos estándares de calidad; En polietileno de alta densidad (HDPE) Con correas de sujeción de hombro y arnés de cabeza que ofrece mayor seguridad y eficacia al momento de inmovilizar el paciente. Ancho: 38 cm Altura: 5cm',48000.00,30,'Equipos de emergencia'),(31,'Camilla plegable en lona con bolso','Camillas','- Tendido en tela de alta tensión. Fácil lavado, limpieza y asepsia. - Pasamanos manijas en PVC. Bisagras, soportes de piso, estructura tubular en aluminio. - Medida extendida: 208 x 55 x 13 cm',50000.00,25,'Equipos de emergencia'),(32,'Camilla tipo cuchara','Camillas','Para inmovilización de pacientes con lesiones cervicales o espinales, la tabla se puede separar en dos para levantar al paciente, viene con correas de sujeción de paciente. Medidas aproximadas: 190 x 44.5 x 7 Cm. Peso de 7 kg.',70000.00,25,'Equipos de emergencia'),(33,'Camilla tipo canastilla','Camillas','Sistema de camilla enrollable tipo capullo hecha en Polietileno de alta densidad. Desarrollada para extracción en espacios confinados o de gran dificultad de acceso. Incluye: morral, camilla enrollable, mosquetón de acero, cintas de arga e izado, 7m de cuerda.',80000.00,25,'Equipos de emergencia'),(34,'Camilla espinal corta','Camillas','Tabla espinal flotante fabricada en polietileno de alta densidad (HDPE). Ideal para maniobra de rescate en tierra y alturas. Resistente: 142kg',80000.00,25,'Equipos de emergencia'),(35,'Gabinete equipo contra incendio','Gabinete','Esta diseñado para responder de manera efectiva a diferentes tipos de incendios y situaciones de emergencia.',80000.00,25,'Equipos contra incendios'),(36,'Anillo de verificación','Piezas de extintores','Anillo de verificacion recarga actual',1000.00,25,'Equipos contra incendios'),(37,'Cilindros','Piezas de extintores','Cilindro en donde se almacena el producto',5000.00,25,'Equipos contra incendios'),(38,'Pasador','Piezas de extintores','Pasador de seguridad para el extintor',1000.00,25,'Equipos contra incendios'),(39,'Manguera','Piezas de extintores','Manguera para dirigir el polvo del extintor',2000.00,25,'Equipos contra incendios'),(40,'Válvula','Piezas de extintores','Válvula del extintor',2000.00,25,'Equipos contra incendios'),(41,'Amarres','Piezas de extintores','Amarre de seguridad del extintor',500.00,25,'Equipos contra incendios'),(42,'Correa para manguera','Piezas de extintores','Correa para acomodar la manguera del extintor',2000.00,25,'Equipos contra incendios'),(43,'Boquilla en policarbonato','Piezas de extintores','Boquilla en policarbonato de extintor',2000.00,25,'Equipos contra incendios'),(44,'Boquilla para manguera','Piezas de extintores','Boquilla para manguera del extintor',2000.00,20,'Equipos contra incendios'),(45,'Válvula extintor satélite','Piezas de extintores','Válvula extintor satélite extintor',2000.00,25,'Equipos contra incendios'),(46,'Niple en acero','Piezas de extintores','Niple en acero para extintor',1500.00,25,'Equipos contra incendios'),(47,'Vástago para extintor','Piezas de extintores','Vástago para extintor',1500.00,25,'Equipos contra incendios'),(48,'Teflón para extintor','Piezas de extintores','Teflón para extintor',1000.00,25,'Equipos contra incendios'),(49,'Manómetro de presión','Piezas de extintores','Manómetro de presión',2000.00,25,'Equipos contra incendios'),(50,'Boquillas','Piezas de extintores','Boquilla para extintor',1000.00,25,'Equipos contra incendios'),(51,'Soporte de pared','Piezas de extintores','Soporte de pared para extintor',2000.00,25,'Equipos contra incendios'),(52,'Base de canastilla negra','Piezas de extintores','Base de canastilla para extintores',10000.00,25,'Equipos contra incendios'),(53,'Soporte candado metálico negro','Piezas de extintores','Soporte candado para extintores',10000.00,25,'Equipos contra incendios'),(54,'Base pedestal ','Piezas de extintores','Base pedestal para extintores',10000.00,25,'Equipos contra incendios'),(55,'Gabinete extintor','Piezas de extintores','Gabinete extintor',20000.00,25,'Equipos contra incendios'),(56,'Manguera contra incendio','Piezas de extintores','Manguera contra incendio',25000.00,25,'Equipos contra incendios'),(57,'Forro para extintor','Piezas de extintores','Forro para extintor',15000.00,25,'Equipos contra incendios'),(58,'Inmovilizador tipo bloque','Inmovilizador','Compatible con la mayoría de modelos de camillas ya sean en madera o polietileno. Medidas: 30 cm x 20 cm x 6 cm',50000.00,25,'Equipos de emergencia'),(59,'Arnés tipo araña','Arnes de seguridad','Arnés para camilla hecho en reata de 5 cm de anchacuanta con 4 correas laterales para la sujeción a la camilla y soportar al paciente y 2 reatas superiores las cualesabrazan al paciente por la parte de los hombros.',60000.00,25,'Equipos de emergencia'),(60,'Maletín de reanimación','Maletin reanimacion','Contenido: Reanimador manual UNIVEN con válvulalimitadora de sobrepresión, mascarilla para adultos,alargadera para conectar al caudalímetro y bolsa. Además, se incluye una botella de oxígeno de 400 litros conregulador y caudalímetro ajustable de 0 a 15 l/min.',70000.00,25,'Equipos de emergencia'),(61,'Aro salvavidas adulto y niño','Aro salvavidas','Aro salvavidas en polietileno de alta densidad con relleno en poliuretano.Medidas adulto: Diámetro externo 72 cm . Diámetrointerno 45 cm.Medidas niño: 58cm diámetro exterior, 36cm diámetrointerior',65000.00,25,'Equipos de emergencia'),(62,'Chaleco salvavidas adulto y niño','Chaleco salvavidas','Fabricado en vinilo e interior con espuma de polietileno.Medidas adulto: Largo 65 cm - Alto 3cm - Ancho 43cmMedidas niño: Largo 46 cm - Alto 2.5cm - Ancho 37cm',70000.00,25,'Equipos de emergencia'),(63,'Caja herramientas de supervivencia','Caja de supervivencia','Caja de herramientas con productos de supervivencia basica.',30000.00,25,'Equipos de emergencia');
/*!40000 ALTER TABLE `producto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(100) DEFAULT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Jose Amir Ramirez Hernandez','josea.ramirezh@ecci.edu.co','$2b$10$XoYU8gx2rMQ14VVYuDBrTuLLpoYX7C6H5WAaCEZU7r/VdzDcdczy2'),(2,'Juan Jose Medina','jhernandezmed@unal.edu.co','$2b$10$MXMuN3stQnAVou2Hb3h86OMdd4JStO3CC7VCvxQ7Cwlmlk45l3BTa'),(3,'Diana Constanza Ramirez Ardila','dramirezardila@gmail.com','$2b$10$4rMkZ4e9lV6YnL7q13yIL.VavWIK1BRM8wW8MefS0Ka1tAtgJ46S6'),(4,'Alberlis Dahil Perez Zerpa','alberlisd.perezz@ecci.edu.co','$2b$10$.eDFtzo7okldiuNYKzrzt.GWs3nV1aUkhOmDX.AnM.VBUBxAtButK');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `venta`
--

DROP TABLE IF EXISTS `venta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `venta` (
  `id_venta` int NOT NULL,
  `id_cliente` int DEFAULT NULL,
  `fecha` datetime DEFAULT NULL,
  `total` decimal(12,2) DEFAULT NULL,
  `metodo_pago` enum('efectivo','transferencia','tarjeta') DEFAULT NULL,
  PRIMARY KEY (`id_venta`),
  UNIQUE KEY `id_venta` (`id_venta`),
  KEY `id_cliente` (`id_cliente`),
  CONSTRAINT `venta_ibfk_1` FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`id_cliente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `venta`
--

LOCK TABLES `venta` WRITE;
/*!40000 ALTER TABLE `venta` DISABLE KEYS */;
INSERT INTO `venta` VALUES (1,3,'2025-01-15 10:30:00',450000.00,'efectivo'),(2,7,'2025-01-20 14:45:00',320000.00,'tarjeta'),(3,5,'2025-02-03 09:10:00',950000.00,'transferencia'),(4,2,'2025-02-12 16:20:00',180000.00,'efectivo'),(5,9,'2025-03-01 11:00:00',650000.00,'tarjeta'),(6,6,'2025-03-18 15:40:00',280000.00,'transferencia'),(7,12,'2025-04-05 09:25:00',1200000.00,'transferencia'),(8,10,'2025-04-18 13:55:00',870000.00,'efectivo'),(9,4,'2025-05-03 08:45:00',135000.00,'tarjeta'),(10,8,'2025-05-25 17:15:00',320000.00,'efectivo'),(11,11,'2025-06-10 10:00:00',540000.00,'transferencia'),(12,1,'2025-06-20 12:35:00',975000.00,'tarjeta'),(13,13,'2025-07-02 09:50:00',230000.00,'efectivo'),(14,15,'2025-07-15 15:30:00',760000.00,'tarjeta'),(15,17,'2025-08-01 11:40:00',1150000.00,'transferencia'),(16,19,'2025-08-10 16:25:00',98000.00,'efectivo'),(17,14,'2025-08-22 09:05:00',345000.00,'tarjeta'),(18,18,'2025-09-05 14:50:00',420000.00,'transferencia'),(19,16,'2025-09-15 10:20:00',660000.00,'efectivo'),(20,20,'2025-09-30 13:00:00',1500000.00,'transferencia');
/*!40000 ALTER TABLE `venta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'db_mis_pronaltex'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-12-09 15:43:49
