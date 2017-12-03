-- phpMyAdmin SQL Dump
-- version 3.5.1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Dec 29, 2015 at 03:19 PM
-- Server version: 5.5.24-log
-- PHP Version: 5.4.3

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `alcaldia_ronces`
--

-- --------------------------------------------------------

--
-- Table structure for table `alerta`
--

CREATE TABLE IF NOT EXISTS `alerta` (
  `NUM_ALE` int(11) NOT NULL AUTO_INCREMENT COMMENT 'NUMERO CONSECUTIVO DE LA ALERTA',
  `COD_DOC` varchar(3) DEFAULT NULL COMMENT 'CODIGO DEL DOCUMENTO',
  `DIA_ALE` smallint(6) DEFAULT NULL COMMENT 'DIAS ANTES DEL VENCIMIENTO PARA INICIAR LA ALERTA',
  `ORD_ALE` int(11) DEFAULT NULL COMMENT 'ORDEN DE LAS ALERTAS DEL TIPO DE DOCUMENTO, ESTO PARA SABER CUANTAS ALARMAS POR TIPO DE DOCUMENTO HAY',
  `COL_ALE` varchar(30) DEFAULT NULL COMMENT 'COLOR DE LA ALERTA, SE ALMACENA COMO COLOR ESTANDAR EN LA WEB HEXADECIMAL',
  PRIMARY KEY (`NUM_ALE`),
  KEY `FK_DOCUMENTO_ALERTA` (`COD_DOC`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 COMMENT='ENTIDAD ENCARGADA DE ALMACENAR LAS ALERTAS A EJECUTARSEN EN ' AUTO_INCREMENT=3 ;

-- --------------------------------------------------------

--
-- Table structure for table `anexo_pqrsf_ent`
--

CREATE TABLE IF NOT EXISTS `anexo_pqrsf_ent` (
  `NUM_ANE` int(11) NOT NULL AUTO_INCREMENT COMMENT 'NUMERO CONSECUTIVO DEL ANEXO ASIGNADO POR EL SISTEMA',
  `NUM_PQR` int(11) DEFAULT NULL COMMENT 'NUMERO CONSECUTIVO DE LA PQRSF. TABLA PQRSF_ENT',
  `ANIO_PQR` int(11) DEFAULT NULL COMMENT 'NUMERO DE A袿 DE TRABAJO DEL SISTEMA. TABLA PQRSF_ENT',
  `PATH_ANE` varchar(500) DEFAULT NULL COMMENT 'PATH O RUTA DE ACCESO DEL ARCHIVO ESCANEADO EN EL DISCO DURO DEL SERVIDOR.',
  PRIMARY KEY (`NUM_ANE`),
  KEY `FK_PQRSF_ENT_ANEXO` (`NUM_PQR`,`ANIO_PQR`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 COMMENT='ENTIDAD ENCARGADA DE ALMACENAR LOS DATOS ANEXOS ESCANEADOS A' AUTO_INCREMENT=101 ;

--
-- Dumping data for table `anexo_pqrsf_ent`
--

INSERT INTO `anexo_pqrsf_ent` (`NUM_ANE`, `NUM_PQR`, `ANIO_PQR`, `PATH_ANE`) VALUES
(96, 1, 2015, 'uploads/1_2015_Derecho de petici贸n, 1_2015_1'),
(97, 1, 2015, 'uploads/1_2015_Derecho de petici贸n, 1_2015_2'),
(98, 1, 2015, 'uploads/1_2015_Derecho de petici贸n, 1_2015_3'),
(99, 2, 2015, 'uploads/2_2015_Derecho de petici贸n, 2_2015_1'),
(100, 3, 2015, 'uploads/3_2015_Derecho de petici贸n, 3_2015_1');

-- --------------------------------------------------------

--
-- Table structure for table `anexo_pqrsf_sal`
--

CREATE TABLE IF NOT EXISTS `anexo_pqrsf_sal` (
  `NUM_ANE_SAL` int(11) NOT NULL AUTO_INCREMENT COMMENT 'NUMERO CONSECUTIVO DEL ANEXO ASIGNADO POR EL SISTEMA',
  `NUM_PQR_SAL` int(11) DEFAULT NULL COMMENT 'NUMERO CONSECUTIVO DE LA RESPUESTA AL PQRSF',
  `ANIO_PQR_SAL` int(11) DEFAULT NULL COMMENT 'A袿 DE TRABAJO DE LA RESPUESTA AL PQRSF',
  `PATH_ANE_SAL` varchar(500) DEFAULT NULL COMMENT 'PATH O RUTA DE ACCESO DEL ARCHIVO ESCANEADO EN EL DISCO DURO DEL SERVIDOR.',
  PRIMARY KEY (`NUM_ANE_SAL`),
  KEY `FK_PQRSF_SAL_ANEXO` (`NUM_PQR_SAL`,`ANIO_PQR_SAL`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 COMMENT='ENTIDAD ENCARGADA DE ALMACENAR LOS DATOS ANEXOS ESCANEADOS A' AUTO_INCREMENT=20 ;

--
-- Dumping data for table `anexo_pqrsf_sal`
--

INSERT INTO `anexo_pqrsf_sal` (`NUM_ANE_SAL`, `NUM_PQR_SAL`, `ANIO_PQR_SAL`, `PATH_ANE_SAL`) VALUES
(12, 4, 2015, 'uploads/1_2015_Derecho de petici贸n, 1_2015_1'),
(13, 5, 2015, 'uploads/1_2015_Derecho de petici贸n, 1_2015_1'),
(14, 6, 2015, 'uploads/1_2015_Derecho de petici贸n, 1_2015_1'),
(15, 7, 2015, 'uploads/1_2015_Derecho de petici贸n, 1_2015_1'),
(16, 7, 2015, 'uploads/1_2015_Derecho de petici贸n, 1_2015_2'),
(17, 8, 2015, 'uploads/3_2015_Derecho de petici贸n, 3_2015_1'),
(18, 9, 2015, 'uploads/3_2015_Derecho de petici贸n, 3_2015_1'),
(19, 10, 2015, 'uploads/3_2015_Derecho de petici贸n, 3_2015_1');

-- --------------------------------------------------------

--
-- Table structure for table `dependencia`
--

CREATE TABLE IF NOT EXISTS `dependencia` (
  `COD_DEP` varchar(3) NOT NULL COMMENT 'CODIGO DE LA DEPENDENCIA',
  `NOM_DEP` varchar(100) DEFAULT NULL COMMENT 'NOMBRE DE LA DEPENDENCIA',
  `PRE_DEP` int(11) DEFAULT NULL COMMENT 'NUMERO PREFIJO UTILIZADO POR LA DEPENDENCIA',
  `NUM_INT_ENT_DEP` int(11) DEFAULT NULL COMMENT 'NUMERO INTERNO DE ARCHIVO DE LAS PQRSF QUE INGRESAN.',
  `NUM_INT_SAL_DEP` int(11) DEFAULT NULL,
  PRIMARY KEY (`COD_DEP`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='ENTIDAD ENCARGADA DE ALMACENAR LAS DEPENDENCIAS DE LA PERSON';

--
-- Dumping data for table `dependencia`
--

INSERT INTO `dependencia` (`COD_DEP`, `NOM_DEP`, `PRE_DEP`, `NUM_INT_ENT_DEP`, `NUM_INT_SAL_DEP`) VALUES
('DAF', 'DIRECCION ADMINISTRATIVA Y FINANCIERA', 111, 1, 1),
('DES', 'DESPACHO', 110, 1, 1),
('DTE', 'DEPENDENCIA TEMPORAL', 100, 2, 1),
('MNP', 'MINISTERIO PUBLICO', 112, 1, 1),
('SRP', 'SERVICIO PUBLICOS', 113, 4, 1),
('VAD', 'VIGILANCIA ADMINISTRATIVA', 114, 1, 1),
('VEN', 'VENTANILLA UNICA', 0, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `documento`
--

CREATE TABLE IF NOT EXISTS `documento` (
  `COD_DOC` varchar(3) NOT NULL COMMENT 'CODIGO DEL DOCUMENTO',
  `NOM_DOC` varchar(100) DEFAULT NULL COMMENT 'NOMBRE DEL DOCUMENTO',
  `ORD_DOC` int(11) DEFAULT NULL COMMENT 'ORDEN DEL DOCUMENTO, SE UTILIZA CON EL FIN DE ORDENAR LOS DOCUMENTOS COMO DESEA EL USUARIO DE VENTANILLA UNICA DESDE LOS MAS HABITUALES',
  `NUM_DIAS` smallint(6) DEFAULT NULL COMMENT 'NUMERO DE DIAS PARA EL VENCIMIENTO DEL TERMINO, SE CONFIGURA DE ACUERDO AL TIPO DE DOCUMENTO. SINO TIENE VENCIMIENTO DE TERMINOS SE DEJA EN CERO.\r\n            \r\n            ESTE CAMPO ES PRIMORDIAL PARA LA GESTION DE LAS ALERTAS AUTOMATICAS',
  PRIMARY KEY (`COD_DOC`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='ENTIDAD ENCARGADA DE ALMACENAR LOS TIPOS DE DOCUMENTO ACEPTA';

--
-- Dumping data for table `documento`
--

INSERT INTO `documento` (`COD_DOC`, `NOM_DOC`, `ORD_DOC`, `NUM_DIAS`) VALUES
('ACP', 'Accion popular', 25, 13),
('ATU', 'Acci贸n de tutela', 26, 6),
('CAN', 'Cancelaci贸n', 17, 1),
('CIT', 'Citaci贸n', 9, 1),
('CMC', 'Comunicado', 19, 1),
('CNV', 'Convocatoria', 21, 2),
('COM', 'Comisorios', 15, 2),
('CPE', 'Copia petici贸n', 23, 1),
('CPI', 'Copia', 24, 1),
('DEP', 'Derecho de petici贸n', 1, 15),
('DEV', 'Devoluci贸n', 2, 2),
('EXC', 'Excusa', 20, 1),
('IND', 'Incidente de desataco', 27, 17),
('INF', 'Informaci贸n', 6, 3),
('INR', 'Informe', 7, 1),
('INV', 'Invitaci贸n', 4, 2),
('MCA', 'Medida cautelar', 18, 4),
('NOT', 'Notificaci贸n', 11, 3),
('PET', 'Petici贸n', 5, 2),
('PRS', 'Procesos', 29, 4),
('PTI', 'Protecci贸n de tierras', 16, 155),
('QRL', 'Querellas', 28, 1),
('QUE', 'Queja', 8, 4),
('RAP', 'Recurso de apelaci贸n', 30, 6),
('RES', 'Respuesta', 3, 3),
('RMS', 'Remisi贸n', 22, 3),
('RSL', 'Resoluci贸n', 14, 4),
('SEG', 'Seguimiento', 12, 1),
('SOL', 'Solicitud', 13, 1),
('TRS', 'Traslado', 10, 1);

-- --------------------------------------------------------

--
-- Table structure for table `funcionario`
--

CREATE TABLE IF NOT EXISTS `funcionario` (
  `COD_FUN` varchar(30) NOT NULL COMMENT 'CODIGO UNICO DEL FUNCIONARIO CON EL CUAL ACCEDE AL SISTEMA.',
  `COD_DEP` varchar(3) DEFAULT NULL COMMENT 'CODIGO DE LA DEPENDENCIA AL CUAL PERTENECE EL FUNCIONARIO. TABLA DEPENDENCIA',
  `NOM_FUN` varchar(100) DEFAULT NULL COMMENT 'NOMBRE DEL FUNCIONARIO',
  `NUM_DOC_FUN` varchar(15) DEFAULT NULL COMMENT 'NUMERO DE DOCUMENTO DE IDENTIFICACION DEL FUNCIONARIO',
  `TIPO_FUN` varchar(1) DEFAULT NULL COMMENT 'TIPO DE FUNCIONARIO, P: PLANTA, C: CONTRATISTA',
  `JEF_FUN` varchar(1) DEFAULT NULL COMMENT 'FUNCIONARIO JEFE DE DEPENDENCIA S o N',
  PRIMARY KEY (`COD_FUN`),
  KEY `FK_DEPENDENCIA_FUNCIONARIO` (`COD_DEP`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='ENTIDAD ENCARGADA DE ALMACENAR TODOS LOS FUNCIONARIOS QUE TR';

--
-- Dumping data for table `funcionario`
--

INSERT INTO `funcionario` (`COD_FUN`, `COD_DEP`, `NOM_FUN`, `NUM_DOC_FUN`, `TIPO_FUN`, `JEF_FUN`) VALUES
('funserv1', 'SRP', 'FUNCIONARIO SERV 1', '222222222222222', 'P', 'N'),
('funserv2', 'SRP', 'FUNCIONARIO SERV 2', '322222222222222', 'C', 'N'),
('heber.guifo', 'DAF', 'Heber guifo', '222222222222', 'P', 'S'),
('hector.barragan', 'VEN', 'hectorbarrangan', '1110464444', 'P', 'N'),
('jefe.mpublico', 'MNP', 'Jefe ministerio publico', '33333333333333', 'P', 'S'),
('jefe.servicios', 'SRP', 'Jefe Servicios publicos', '44444444444444', 'P', 'S'),
('jefe.vigilancia', 'VAD', 'Jefe vigilancia administrativa', '5555555555555', 'P', 'S'),
('personero', 'DES', 'JEFE DESPACHO', '111111111111111', 'P', 'S'),
('sadmin', 'DTE', 'Super Administrador', '0', 'P', 'N');

-- --------------------------------------------------------

--
-- Table structure for table `log_cron_job`
--

CREATE TABLE IF NOT EXISTS `log_cron_job` (
  `NUM_CRON` int(11) NOT NULL AUTO_INCREMENT,
  `NOM_CRON` varchar(50) DEFAULT NULL,
  `FEC_EJE_CRON` datetime DEFAULT NULL,
  PRIMARY KEY (`NUM_CRON`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='ENTIDAD ENCARGADA DE ALMACENAR LOS DATOS DE EJECUCION DE LOS' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `menu`
--

CREATE TABLE IF NOT EXISTS `menu` (
  `COD_MEN` varchar(3) NOT NULL,
  `NOM_MEN` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`COD_MEN`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='ENTIDAD ENCARGADA DE ALMACENAR LOS MENUS PRINCIPALES DE LA A';

--
-- Dumping data for table `menu`
--

INSERT INTO `menu` (`COD_MEN`, `NOM_MEN`) VALUES
('1', 'Menu Principal');

-- --------------------------------------------------------

--
-- Table structure for table `pagina`
--

CREATE TABLE IF NOT EXISTS `pagina` (
  `PATH_PAG` varchar(200) NOT NULL COMMENT 'RUTA DE ACCESO DE LA PAGINA WEB',
  `COD_MEN` varchar(3) DEFAULT NULL,
  `NOM_PAG` varchar(100) DEFAULT NULL COMMENT 'NOMBRE DE LA PAGINA WEB - EL QUE APARECE EN EL MENU',
  `TIP_PAG` varchar(1) DEFAULT NULL COMMENT 'TIPO DE PAGINA - SI ES PAGINA DE MENU PRINCIPAL O SUBMENU. P: PADRE MENU PRINCIPAL, H: HIJA SUBMENU',
  `ORD_PAG` smallint(6) DEFAULT NULL COMMENT 'ORDEN DE LA PAGINA EN EL MENU',
  `VIS_PAG` varchar(1) DEFAULT NULL COMMENT 'VISIBILIDAD DE LA PAGINA EN LA APLICACION.',
  PRIMARY KEY (`PATH_PAG`),
  KEY `FK_MENU_PAGINA` (`COD_MEN`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='ENTIDAD ENCARGADA DE ALMACENAR LAS PAGINAS WEB DEL SITIO CON';

--
-- Dumping data for table `pagina`
--

INSERT INTO `pagina` (`PATH_PAG`, `COD_MEN`, `NOM_PAG`, `TIP_PAG`, `ORD_PAG`, `VIS_PAG`) VALUES
('asignarPqrsf', '1', 'Asignaci贸n PQRSF', 'P', 2, 'S'),
('dependencias', '1', 'Dependencias', 'P', 4, 'S'),
('documentoRadicacion', '1', 'Clases Documento', 'P', 5, 'S'),
('funcionarios', '1', 'Funcionarios', 'P', 9, 'S'),
('impresionPqrsfEnt', '1', 'Impresi贸n PQRSF', 'P', 11, 'S'),
('parametros', '1', 'Par谩metros', 'P', 6, 'S'),
('radicarPqrsf', '1', 'Radicar PQRSF', 'P', 1, 'S'),
('reasignarPqrsf', '1', 'Reasignar PQRSF', 'P', 10, 'S'),
('reporteEntrega', '1', 'Reporete entrega', 'P', 12, 'S'),
('reporteGeneral', '1', 'Reporte multicriterios', 'P', 13, 'S'),
('roles', '1', 'Roles', 'P', 7, 'S'),
('seguimientoPqrsf', '1', 'Seguimiento PQRSF', 'P', 3, 'S'),
('tipoDocumento', '1', 'T铆pos de documento', 'P', 8, 'S');

-- --------------------------------------------------------

--
-- Table structure for table `pagina_rol`
--

CREATE TABLE IF NOT EXISTS `pagina_rol` (
  `COD_ROL` varchar(3) NOT NULL,
  `PATH_PAG` varchar(200) NOT NULL COMMENT 'RUTA DE ACCESO DE LA PAGINA WEB',
  PRIMARY KEY (`COD_ROL`,`PATH_PAG`),
  KEY `FK_PAGINA_X_ROL_2` (`PATH_PAG`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pagina_rol`
--

INSERT INTO `pagina_rol` (`COD_ROL`, `PATH_PAG`) VALUES
('PER', 'asignarPqrsf'),
('SEC', 'asignarPqrsf'),
('VEN', 'asignarPqrsf'),
('ADM', 'dependencias'),
('ADM', 'documentoRadicacion'),
('ADM', 'funcionarios'),
('JDP', 'impresionPqrsfEnt'),
('PER', 'impresionPqrsfEnt'),
('SEC', 'impresionPqrsfEnt'),
('VEN', 'impresionPqrsfEnt'),
('ADM', 'parametros'),
('PER', 'radicarPqrsf'),
('SEC', 'radicarPqrsf'),
('VEN', 'radicarPqrsf'),
('JDP', 'reasignarPqrsf'),
('PER', 'reasignarPqrsf'),
('VEN', 'reasignarPqrsf'),
('CIN', 'reporteEntrega'),
('PER', 'reporteEntrega'),
('SEC', 'reporteEntrega'),
('VEN', 'reporteEntrega'),
('CIN', 'reporteGeneral'),
('FUN', 'reporteGeneral'),
('JDP', 'reporteGeneral'),
('PER', 'reporteGeneral'),
('SEC', 'reporteGeneral'),
('VEN', 'reporteGeneral'),
('ADM', 'roles'),
('FUN', 'seguimientoPqrsf'),
('JDP', 'seguimientoPqrsf'),
('PER', 'seguimientoPqrsf'),
('SEC', 'seguimientoPqrsf'),
('VEN', 'seguimientoPqrsf'),
('ADM', 'tipoDocumento');

-- --------------------------------------------------------

--
-- Table structure for table `parametro`
--

CREATE TABLE IF NOT EXISTS `parametro` (
  `COD_PAR` char(10) NOT NULL,
  `NOM_PAR` varchar(100) DEFAULT NULL,
  `VAL_PAR` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`COD_PAR`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='ENTIDAD ENCARGADA DE ALMACENAR LOS PARAMETROS GENERALES DEL ';

--
-- Dumping data for table `parametro`
--

INSERT INTO `parametro` (`COD_PAR`, `NOM_PAR`, `VAL_PAR`) VALUES
('ANIOSIS', 'A脩O DE TRABAJO DEL SISTEMA', '2015'),
('NUMPQR', 'CONSECUTIVO PQRSF DE ENTRADA DEL SISTEMA', '4'),
('NUMPQRSAL', 'CONSECUTIVO PQRSF DE SALIDA', '3'),
('NUMPQRSEG', 'CONSECUTIVO DE SEGUIMIETO PARA PQRSF', '11');

-- --------------------------------------------------------

--
-- Table structure for table `persona`
--

CREATE TABLE IF NOT EXISTS `persona` (
  `NUM_PER` int(11) NOT NULL AUTO_INCREMENT COMMENT 'NUMERO CONSECUTIVO DE PERSONA ASIGNADO POR EL SISTEMA',
  `COD_TIP_PER` varchar(2) DEFAULT NULL COMMENT 'CODIGO DE TIPO DE PERSONA. PN: PERSONA NATURAL, PJ: PERSONA JURIDICA, AN: ANONIMO. TABLA TIPO_PERSONA',
  `COD_TIP_DOC` char(3) DEFAULT NULL COMMENT 'TIPO DE DOCUMENTO DE LA PERSONA NATURAL, JURIDICA O ANONIMA. TABLA TIPO_DOCUMENTO',
  `NUM_DOC_PER` varchar(15) DEFAULT NULL COMMENT 'NUMERO DE DOCUMENTO DE IDENTIDAD DE LA PERSONA NATURAL, JURIDICA O ANONIMA',
  `NOM_PER` varchar(50) DEFAULT NULL COMMENT 'NOMBRES DE LA PERSONA',
  `APE_PER` varchar(50) DEFAULT NULL COMMENT 'APELLIDOS DE LA PERSONA',
  `GEN_PER` varchar(1) DEFAULT NULL COMMENT 'GENEROS DE LA PERSONA. F: FEMENINO, M: MASCULINO',
  `DIR_CON_PER` varchar(200) DEFAULT NULL COMMENT 'DIRECCION DE CONTACTO DE LA PERSONA',
  `EMAIL_PER` varchar(100) DEFAULT NULL COMMENT 'DIRECCION ELECTRONICA DE CORRESPONDENCIA DE LA PERSONA',
  PRIMARY KEY (`NUM_PER`),
  KEY `FK_TIPO_DOCUMENTO` (`COD_TIP_DOC`),
  KEY `FK_TIPO_PERSONA` (`COD_TIP_PER`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 COMMENT='ENTIDAD ENCARGADA DE ALMACENAR LOS DATOS PERSONALES DE LAS P' AUTO_INCREMENT=120 ;

--
-- Dumping data for table `persona`
--

INSERT INTO `persona` (`NUM_PER`, `COD_TIP_PER`, `COD_TIP_DOC`, `NUM_DOC_PER`, `NOM_PER`, `APE_PER`, `GEN_PER`, `DIR_CON_PER`, `EMAIL_PER`) VALUES
(118, 'PN', 'CED', '1110464422', 'Juan carlos', 'zamorano', 'M', 'mz 31 casa 16 A', 'jc_5@gmail.com'),
(119, 'PN', 'CED', '123456789', 'Juan carlos', 'zamorano', 'M', 'mz 31 casa 16 A', 'jc_5@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `persona_telefono`
--

CREATE TABLE IF NOT EXISTS `persona_telefono` (
  `NUM_PER` int(11) NOT NULL COMMENT 'NUMERO CONSECUTIVO DE LA PERSONA. TABLA PERSONA',
  `NUM_TEL_PER` varchar(15) NOT NULL COMMENT 'NUMERO TELEFONICO DE LA PERSONA',
  PRIMARY KEY (`NUM_PER`,`NUM_TEL_PER`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='ENTIDAD ENCARGADA DE ALMACENAR LOS NUMEROS TELEFONICOS QUE T';

-- --------------------------------------------------------

--
-- Table structure for table `pqrsf_ent`
--

CREATE TABLE IF NOT EXISTS `pqrsf_ent` (
  `NUM_PQR` int(11) NOT NULL COMMENT 'NUMERO INTERNO PQRSF QUE ASIGNA EL SISTEMA',
  `ANIO_PQR` int(11) NOT NULL COMMENT 'A袿 DE TRABAJO DEL SISTEMA',
  `NUM_INT_PQR` int(11) DEFAULT NULL COMMENT 'NUMERO INTERNO DE LA PQRSF POR DEPENDENCIA',
  `NUM_PER` int(11) DEFAULT NULL COMMENT 'NUMERO CONSECUTIVO DE PERSONA. PUEDE SER NATURAL, JURIDICA O ANONIMA. TABLA PERSONA',
  `COD_DOC` varchar(3) DEFAULT NULL COMMENT 'TIPO DE DOCUMENTO DE PQRSF, TIPOS DE PETICIONES. TABLA DOCUMENTO',
  `COD_FUN` varchar(30) DEFAULT NULL COMMENT 'CODIGO UNICO DEL FUNCIONARIO QUIEN TIENE ASIGNADO LA PQRSF. TABLA FUNCIONARIO.',
  `FEC_RAC_PQR` date DEFAULT NULL COMMENT 'FECHA DE RADICACION DE LA PQRSF',
  `HOR_RAC_PQR` datetime DEFAULT NULL COMMENT 'FECHA Y HORA DE RADICACION DE LA PQRSF',
  `ASU_PQR` varchar(200) DEFAULT NULL COMMENT 'ASUNTO DE LA PQRSF',
  `CAN_FOL_PQR` smallint(6) DEFAULT NULL COMMENT 'CANTIDAD DE FOLIOS O HOJAS QUE COMPONEN LA PQRSF',
  `COD_FUN_ENT` varchar(30) DEFAULT NULL COMMENT 'CODIGO FUNCIONARIO QUIEN RECIBE LA RADICACION. NO ES MODIFICABLE DESDE LA APLICACION',
  `NUM_OFI_ENT` varchar(30) DEFAULT NULL COMMENT 'NUMERO DE OFICIO RECIBIDO CUANDO SE RECIBE UNA COPIA DE UNA PQRSF',
  `OBS_PQR` varchar(300) DEFAULT NULL COMMENT 'OBSERVACIONES ACERCA DEL PQRSF',
  `DES_PQR` varchar(500) DEFAULT NULL COMMENT 'DESCRIPCION DEL CASO PQRSF',
  `NUM_TIC_PQR` varchar(20) DEFAULT NULL COMMENT 'NUMERO DE TICKET ALFANUMERICO DE 20 CARACTERES DE LA PQRSF PARA PODER CONSULTAR Y HACER SEGUIMIENTO AL CASO VIA WEB.',
  `TIPO_COR_ENT` varchar(1) DEFAULT NULL COMMENT 'TIPO DE CORRESPONDENCIA (INTERNA-EXTERNA)',
  `GEN_REP` varchar(1) DEFAULT NULL COMMENT 'GENERACION DE REPORTE ESTO CON EL FIN DE LLEVAR UN CONTROL CUANDO SE GENERA UN REPORTE DE ENTREGA',
  `TIP_PQR_ENT` varchar(1) DEFAULT NULL COMMENT 'TIPO DE PQRSF. W: WEB, P: PRESENCIAL',
  `FEC_MAX_RES` date DEFAULT NULL COMMENT 'FECHA MAXIMA DE RESPUESTA QUE SE CALCULA CON BASE AL TIPO DE DOCUMENTO Y LOS DIAS DEL VENCIMIENTO DEL TERMINO',
  `FEC_ENT_DEP_PQR` date DEFAULT NULL COMMENT 'FECHA DE ENTREGA AL JEFE DE DEPENDENCIA O ASIGNACION AL JEFE DE DEPENDENCIA',
  `FEC_CIE_PQR` date DEFAULT NULL COMMENT 'FECHA DE CIERRE DEL CASO PQRSF O FECHA DE ARCHIVADO EL CASO',
  `EST_PQR` varchar(1) DEFAULT 'A' COMMENT 'ESTADO DE LA PQRSF',
  `COP_PQR` varchar(1) DEFAULT NULL COMMENT 'INDICA SI ES UNA COPIA DE UNA PETICION O NO',
  PRIMARY KEY (`NUM_PQR`,`ANIO_PQR`),
  KEY `FK_DOCUMENTO_PQRSF_ENT` (`COD_DOC`),
  KEY `FK_FUNCIONARIO_PQRSF` (`COD_FUN`),
  KEY `FK_PERSONA_PQRSF_ENT` (`NUM_PER`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='ENTIDAD ENCARGADA DE ALMACENAR LAS PQRSF QUE SE RECIBEN DE L';

--
-- Dumping data for table `pqrsf_ent`
--

INSERT INTO `pqrsf_ent` (`NUM_PQR`, `ANIO_PQR`, `NUM_INT_PQR`, `NUM_PER`, `COD_DOC`, `COD_FUN`, `FEC_RAC_PQR`, `HOR_RAC_PQR`, `ASU_PQR`, `CAN_FOL_PQR`, `COD_FUN_ENT`, `NUM_OFI_ENT`, `OBS_PQR`, `DES_PQR`, `NUM_TIC_PQR`, `TIPO_COR_ENT`, `GEN_REP`, `TIP_PQR_ENT`, `FEC_MAX_RES`, `FEC_ENT_DEP_PQR`, `FEC_CIE_PQR`, `EST_PQR`, `COP_PQR`) VALUES
(1, 2015, 1, 118, 'DEP', 'funserv1', '2015-12-26', '2015-12-26 15:26:02', 'Servicios publicos alumbrado', 5, 'hector.barragan', 'A21', 'Muy caro el recibo', 'El recibo me llego caro porque no lo entregaron a tiempo.', 'U8WASSBL2WZYDWDGXNGN', 'E', NULL, 'P', '2016-01-10', NULL, NULL, 'A', 'N'),
(2, 2015, 2, NULL, 'DEP', 'jefe.servicios', '2015-12-28', '2015-12-27 23:03:40', 'demanda ibal', 1, 'hector.barragan', '1233333', 'algunas observaciones', 'esta es una version anonima', 'E4YOCL86FRR4THK49428', 'E', NULL, 'P', '2016-01-12', NULL, NULL, 'A', 'N'),
(3, 2015, 3, 119, 'DEP', 'jefe.servicios', '2015-12-28', '2015-12-27 23:11:21', 'demanda ibal', 2, 'hector.barragan', '1233', 'Alguna observacion', 'se envia una kfjdakfjsdka', '5N7QM2EB2ADK0EDADY3V', 'E', NULL, 'P', '2016-01-12', NULL, NULL, 'A', 'N');

-- --------------------------------------------------------

--
-- Table structure for table `pqrsf_ent_aud`
--

CREATE TABLE IF NOT EXISTS `pqrsf_ent_aud` (
  `NUM_CON_AUD` int(11) NOT NULL AUTO_INCREMENT,
  `NUM_PQR` int(11) DEFAULT NULL COMMENT 'NUMERO INTERNO PQRSF QUE ASIGNA EL SISTEMA',
  `ANIO_PQR` int(11) DEFAULT NULL COMMENT 'A袿 DE TRABAJO DEL SISTEMA',
  `NUM_INT_PQR` int(11) DEFAULT NULL COMMENT 'NUMERO INTERNO DE LA PQRSF POR DEPENDENCIA',
  `NUM_PER` int(11) DEFAULT NULL COMMENT 'NUMERO CONSECUTIVO DE PERSONA. PUEDE SER NATURAL, JURIDICA O ANONIMA. TABLA PERSONA',
  `COD_DOC` varchar(3) DEFAULT NULL COMMENT 'TIPO DE DOCUMENTO DE PQRSF, TIPOS DE PETICIONES. TABLA DOCUMENTO',
  `COD_FUN` varchar(30) DEFAULT NULL COMMENT 'CODIGO UNICO DEL FUNCIONARIO QUIEN TIENE ASIGNADO LA PQRSF. TABLA FUNCIONARIO.',
  `FEC_RAC_PQR` date DEFAULT NULL COMMENT 'FECHA DE RADICACION DE LA PQRSF',
  `HOR_RAC_PQR` datetime DEFAULT NULL COMMENT 'FECHA Y HORA DE RADICACION DE LA PQRSF',
  `ASU_PQR` varchar(200) DEFAULT NULL COMMENT 'ASUNTO DE LA PQRSF',
  `CAN_FOL_PQR` smallint(6) DEFAULT NULL COMMENT 'CANTIDAD DE FOLIOS O HOJAS QUE COMPONEN LA PQRSF',
  `COD_FUN_ENT` int(11) DEFAULT NULL COMMENT 'CODIGO FUNCIONARIO QUIEN RECIBE LA RADICACION. NO ES MODIFICABLE DESDE LA APLICACION',
  `NUM_OFI_ENT` varchar(30) DEFAULT NULL COMMENT 'NUMERO DE OFICIO RECIBIDO CUANDO SE RECIBE UNA COPIA DE UNA PQRSF',
  `OBS_PQR` varchar(300) DEFAULT NULL COMMENT 'OBSERVACIONES ACERCA DEL PQRSF',
  `DES_PQR` varchar(500) DEFAULT NULL COMMENT 'DESCRIPCION DEL CASO PQRSF',
  `NUM_TIC_PQR` varchar(20) DEFAULT NULL COMMENT 'NUMERO DE TICKET ALFANUMERICO DE 20 CARACTERES DE LA PQRSF PARA PODER CONSULTAR Y HACER SEGUIMIENTO AL CASO VIA WEB.',
  `TIPO_COR_ENT` varchar(1) DEFAULT NULL COMMENT 'TIPO DE CORRESPONDENCIA (INTERNA-EXTERNA)',
  `GEN_REP` varchar(1) DEFAULT NULL COMMENT 'GENERACION DE REPORTE ESTO CON EL FIN DE LLEVAR UN CONTROL CUANDO SE GENERA UN REPORTE DE ENTREGA',
  `TIP_PQR_ENT` varchar(1) DEFAULT NULL COMMENT 'TIPO DE PQRSF. W: WEB, P: PRESENCIAL',
  `FEC_MAX_RES` date DEFAULT NULL COMMENT 'FECHA MAXIMA DE RESPUESTA QUE SE CALCULA CON BASE AL TIPO DE DOCUMENTO Y LOS DIAS DEL VENCIMIENTO DEL TERMINO',
  `FEC_ENT_DEP_PQR` date DEFAULT NULL COMMENT 'FECHA DE ENTREGA AL JEFE DE DEPENDENCIA O ASIGNACION AL JEFE DE DEPENDENCIA',
  `FEC_CIE_PQR` date DEFAULT NULL COMMENT 'FECHA DE CIERRE DEL CASO PQRSF',
  `EST_PQR` varchar(1) DEFAULT 'A' COMMENT 'ESTADO DE LA PQRSF',
  `COP_PQR` varchar(1) DEFAULT NULL COMMENT 'INDICA SI ES UNA COPIA DE UNA PETICION O NO',
  PRIMARY KEY (`NUM_CON_AUD`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 COMMENT='ENTIDAD ENCARGADA DE ALMACENAR LAS PQRSF OFICIALES QUE SE RE' AUTO_INCREMENT=72 ;

--
-- Dumping data for table `pqrsf_ent_aud`
--

INSERT INTO `pqrsf_ent_aud` (`NUM_CON_AUD`, `NUM_PQR`, `ANIO_PQR`, `NUM_INT_PQR`, `NUM_PER`, `COD_DOC`, `COD_FUN`, `FEC_RAC_PQR`, `HOR_RAC_PQR`, `ASU_PQR`, `CAN_FOL_PQR`, `COD_FUN_ENT`, `NUM_OFI_ENT`, `OBS_PQR`, `DES_PQR`, `NUM_TIC_PQR`, `TIPO_COR_ENT`, `GEN_REP`, `TIP_PQR_ENT`, `FEC_MAX_RES`, `FEC_ENT_DEP_PQR`, `FEC_CIE_PQR`, `EST_PQR`, `COP_PQR`) VALUES
(70, 1, 2015, 1, 118, 'DEP', 'jefe.servicios', '2015-12-26', '2015-12-26 15:26:02', 'Servicios publicos alumbrado', 5, 0, 'A21', 'Muy caro el recibo', 'El recibo me llego caro porque no lo entregaron a tiempo.', 'U8WASSBL2WZYDWDGXNGN', 'E', NULL, 'P', '2016-01-10', NULL, NULL, 'A', 'N'),
(71, 1, 2015, 1, 118, 'DEP', 'funserv1', '2015-12-26', '2015-12-26 15:26:02', 'Servicios publicos alumbrado', 5, 0, 'A21', 'Muy caro el recibo', 'El recibo me llego caro porque no lo entregaron a tiempo.', 'U8WASSBL2WZYDWDGXNGN', 'E', NULL, 'P', '2016-01-10', NULL, NULL, 'A', 'N');

-- --------------------------------------------------------

--
-- Table structure for table `pqrsf_sal`
--

CREATE TABLE IF NOT EXISTS `pqrsf_sal` (
  `NUM_PQR_SAL` int(11) NOT NULL,
  `ANIO_PQR_SAL` int(11) NOT NULL,
  `NUM_PQR` int(11) DEFAULT NULL COMMENT 'NUMERO INTERNO PQRSF QUE ASIGNA EL SISTEMA',
  `ANIO_PQR` int(11) DEFAULT NULL COMMENT 'A袿 DE TRABAJO DEL SISTEMA',
  `NUM_INT_PQR` int(11) DEFAULT NULL COMMENT 'NUMERO INTERNO DE LA PQRSF POR DEPENDENCIA',
  `FEC_OFI_SAL` date DEFAULT NULL COMMENT 'FECHA EN QUE SE GENERA EL OFICIO DE SALIDA',
  `HOR_OFI_SAL` datetime DEFAULT NULL COMMENT 'FECHA Y HORA EN QUE SE GENERA EL OFICIO DE SALIDA',
  `CAN_FOL_SAL` smallint(6) DEFAULT NULL COMMENT 'CANTIDAD DE FOLIOS O HOJAS QUE COMPONEN DEL OFICIO DE SALIDA',
  `DES_OFI_SAL` varchar(500) DEFAULT NULL COMMENT 'DESCRIPCION DEL OFICIO DE SALIDA',
  `ASU_OFI_SAL` varchar(200) DEFAULT NULL COMMENT 'ASUNTO DEL OFICIO DE SALIDA',
  PRIMARY KEY (`NUM_PQR_SAL`,`ANIO_PQR_SAL`),
  KEY `FK_PQRSF_SALIDA` (`NUM_PQR`,`ANIO_PQR`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='ENTIDAD ENCARGADA DE ALMACENAR LOS OFICIOS DE SALIDA O RESPU';

--
-- Dumping data for table `pqrsf_sal`
--

INSERT INTO `pqrsf_sal` (`NUM_PQR_SAL`, `ANIO_PQR_SAL`, `NUM_PQR`, `ANIO_PQR`, `NUM_INT_PQR`, `FEC_OFI_SAL`, `HOR_OFI_SAL`, `CAN_FOL_SAL`, `DES_OFI_SAL`, `ASU_OFI_SAL`) VALUES
(4, 2015, 1, 2015, NULL, '2015-12-25', '2015-12-26 16:46:45', 2, 'Se visito la empresa enertolima y se hizo algo', 'Visita enertolima'),
(5, 2015, 1, 2015, NULL, '2015-12-26', '2015-12-26 16:48:15', 0, 'Algo del oficio', 'Segundo seguimiento'),
(6, 2015, 1, 2015, NULL, '2015-12-26', '2015-12-26 16:54:52', 2, 'Se realiza respuesta de la solicitud del caso', 'Respuesta de la solicitud'),
(7, 2015, 1, 2015, NULL, '2015-12-26', '2015-12-26 17:07:43', 1, 'Se responde al peticionario sobre la situacion  y se anexa el documento.', 'Respuesta al caso'),
(8, 2015, 3, 2015, NULL, '2015-12-28', '2015-12-27 23:23:44', 2, 'Oficio de respuesta numero ABC123', 'Respuesta peticion'),
(9, 2015, 3, 2015, NULL, '2015-12-28', '2015-12-27 23:57:03', 2, 'Oficio de respuesta numero ABC123', 'Respuesta peticion'),
(10, 2015, 3, 2015, NULL, '2015-12-28', '2015-12-28 11:04:15', 10, 'Se realiza oficio de oficio respuesta', 'Respuesta peticion');

-- --------------------------------------------------------

--
-- Table structure for table `pqrsf_sal_cor`
--

CREATE TABLE IF NOT EXISTS `pqrsf_sal_cor` (
  `NUM_PQR_SAL` int(11) NOT NULL,
  `ANIO_PQR_SAL` int(11) NOT NULL,
  `NUM_PQR` int(11) DEFAULT NULL COMMENT 'NUMERO INTERNO PQRSF QUE ASIGNA EL SISTEMA',
  `ANIO_PQR` int(11) DEFAULT NULL COMMENT 'A脩O DE TRABAJO DEL SISTEMA',
  `NUM_INT_PQR` int(11) DEFAULT NULL COMMENT 'NUMERO INTERNO DE LA PQRSF POR DEPENDENCIA',
  `FEC_OFI_SAL` date DEFAULT NULL COMMENT 'FECHA EN QUE SE GENERA EL OFICIO DE SALIDA',
  `HOR_OFI_SAL` datetime DEFAULT NULL COMMENT 'FECHA Y HORA EN QUE SE GENERA EL OFICIO DE SALIDA',
  `CAN_FOL_SAL` smallint(6) DEFAULT NULL COMMENT 'CANTIDAD DE FOLIOS O HOJAS QUE COMPONEN DEL OFICIO DE SALIDA',
  `DES_OFI_SAL` varchar(500) DEFAULT NULL COMMENT 'DESCRIPCION DEL OFICIO DE SALIDA',
  `ASU_OFI_SAL` varchar(200) DEFAULT NULL COMMENT 'ASUNTO DEL OFICIO DE SALIDA',
  PRIMARY KEY (`NUM_PQR_SAL`,`ANIO_PQR_SAL`),
  KEY `FK_PQRSF_SALIDA_FK` (`NUM_PQR`,`ANIO_PQR`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='ENTIDAD ENCARGADA DE ALMACENAR LOS OFICIOS DE SALIDA O RESPU';

--
-- Dumping data for table `pqrsf_sal_cor`
--

INSERT INTO `pqrsf_sal_cor` (`NUM_PQR_SAL`, `ANIO_PQR_SAL`, `NUM_PQR`, `ANIO_PQR`, `NUM_INT_PQR`, `FEC_OFI_SAL`, `HOR_OFI_SAL`, `CAN_FOL_SAL`, `DES_OFI_SAL`, `ASU_OFI_SAL`) VALUES
(2, 2015, 1, 2015, NULL, '2015-12-26', '2015-12-26 17:07:43', 1, 'j kjk jfkdsa jfkdsj kfasd', 'fdjaksdj k');

-- --------------------------------------------------------

--
-- Table structure for table `rol`
--

CREATE TABLE IF NOT EXISTS `rol` (
  `COD_ROL` varchar(3) NOT NULL,
  `NOM_ROL` varchar(50) DEFAULT NULL,
  `EST_ROL` varchar(1) DEFAULT NULL COMMENT 'ESTADO DEL ROL',
  PRIMARY KEY (`COD_ROL`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='ENTIDAD ENCARGADA DE ALMACENAR LOS ROLES DEL SISTEMA';

--
-- Dumping data for table `rol`
--

INSERT INTO `rol` (`COD_ROL`, `NOM_ROL`, `EST_ROL`) VALUES
('ADM', 'Admin', 'A'),
('CIN', 'Control Interno', 'A'),
('FUN', 'Funcionario', 'A'),
('JDP', 'Jefe de dependencia', 'A'),
('PER', 'Personero', 'A'),
('SEC', 'Secretaria del personero', 'A'),
('VEN', 'Ventanilla unica', 'A');

-- --------------------------------------------------------

--
-- Table structure for table `tipo_documento`
--

CREATE TABLE IF NOT EXISTS `tipo_documento` (
  `COD_TIP_DOC` char(3) NOT NULL COMMENT 'CODIGO DEL TIPO DE DOCUMENTO',
  `NOM_TIP_DOC` varchar(100) DEFAULT NULL COMMENT 'NOMBRE DEL TIPO DE DOCUMENTO',
  PRIMARY KEY (`COD_TIP_DOC`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='ENTIDAD ENCARGADA DE ALMACENAR LOS TIPOS DE DOCUMENTO DE LAS';

--
-- Dumping data for table `tipo_documento`
--

INSERT INTO `tipo_documento` (`COD_TIP_DOC`, `NOM_TIP_DOC`) VALUES
('CED', 'C茅dula de ciudadan铆a'),
('CEX', 'C茅dula de extranjeria'),
('DNI', 'Documento nacional de identificaci贸n'),
('TI', 'Tarjeta de identidad');

-- --------------------------------------------------------

--
-- Table structure for table `tipo_persona`
--

CREATE TABLE IF NOT EXISTS `tipo_persona` (
  `COD_TIP_PER` varchar(2) NOT NULL COMMENT 'CODIGO DEL TIPO DE PERSONA',
  `NOM_TIP_PER` varchar(100) DEFAULT NULL COMMENT 'NOMBRE DEL TIPO DE PERSONA',
  PRIMARY KEY (`COD_TIP_PER`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='ENTIDAD ENCARGADA DE ALMACENAR LOS TIPOS DE PERSONAS\r\n\r\n';

--
-- Dumping data for table `tipo_persona`
--

INSERT INTO `tipo_persona` (`COD_TIP_PER`, `NOM_TIP_PER`) VALUES
('OT', 'Otros'),
('PJ', 'Persona Juridica'),
('PN', 'Persona Natural');

-- --------------------------------------------------------

--
-- Table structure for table `usuario`
--

CREATE TABLE IF NOT EXISTS `usuario` (
  `COD_FUN` varchar(30) NOT NULL COMMENT 'CODIGO UNICO DEL FUNCIONARIO',
  `COD_ROL` varchar(3) DEFAULT NULL,
  `PAS_USU` varchar(40) DEFAULT NULL COMMENT 'PASSWORD ENCRIPTADO DEL FUNCIONARIO',
  `EST_USU` varchar(1) DEFAULT NULL COMMENT 'ESTADO DEL USUARIO',
  PRIMARY KEY (`COD_FUN`),
  KEY `FK_ROL_USUARIO` (`COD_ROL`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='ENTIDAD ENCARGA DE ALMACENAR LOS USUARIOS DE INGRESO AL SIST';

--
-- Dumping data for table `usuario`
--

INSERT INTO `usuario` (`COD_FUN`, `COD_ROL`, `PAS_USU`, `EST_USU`) VALUES
('funserv1', 'FUN', 'e3a38c0bab3c502efdd8e77731ea3f13', 'A'),
('funserv2', 'FUN', 'bec8dd074d907b5f183176d34355ac4f', 'A'),
('heber.guifo', 'JDP', 'edcb81666cf02a2fe281f71b00336321', 'A'),
('hector.barragan', 'VEN', '8198f93e1b864f8854944adba2f8db3e', 'A'),
('jefe.mpublico', 'JDP', 'de81aa4b91cecbdfe975cf20125eef60', 'A'),
('jefe.servicios', 'JDP', '1c6a0edfec680066a81f567c312512d2', 'A'),
('jefe.vigilancia', 'JDP', 'cfe4a1448335952545488313e7c3c332', 'A'),
('personero', 'PER', 'a987dda10fbf55269b503ca7367db090', 'A'),
('sadmin', 'ADM', '97e6f512a7ed6d22a7d7ef9e7db8ee40', 'A');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `alerta`
--
ALTER TABLE `alerta`
  ADD CONSTRAINT `FK_DOCUMENTO_ALERTA` FOREIGN KEY (`COD_DOC`) REFERENCES `documento` (`COD_DOC`);

--
-- Constraints for table `anexo_pqrsf_ent`
--
ALTER TABLE `anexo_pqrsf_ent`
  ADD CONSTRAINT `FK_PQRSF_ENT_ANEXO` FOREIGN KEY (`NUM_PQR`, `ANIO_PQR`) REFERENCES `pqrsf_ent` (`NUM_PQR`, `ANIO_PQR`);

--
-- Constraints for table `anexo_pqrsf_sal`
--
ALTER TABLE `anexo_pqrsf_sal`
  ADD CONSTRAINT `FK_PQRSF_SAL_ANEXO` FOREIGN KEY (`NUM_PQR_SAL`, `ANIO_PQR_SAL`) REFERENCES `pqrsf_sal` (`NUM_PQR_SAL`, `ANIO_PQR_SAL`);

--
-- Constraints for table `funcionario`
--
ALTER TABLE `funcionario`
  ADD CONSTRAINT `FK_DEPENDENCIA_FUNCIONARIO` FOREIGN KEY (`COD_DEP`) REFERENCES `dependencia` (`COD_DEP`);

--
-- Constraints for table `pagina`
--
ALTER TABLE `pagina`
  ADD CONSTRAINT `FK_MENU_PAGINA` FOREIGN KEY (`COD_MEN`) REFERENCES `menu` (`COD_MEN`);

--
-- Constraints for table `pagina_rol`
--
ALTER TABLE `pagina_rol`
  ADD CONSTRAINT `FK_PAGINA_X_ROL` FOREIGN KEY (`COD_ROL`) REFERENCES `rol` (`COD_ROL`),
  ADD CONSTRAINT `FK_PAGINA_X_ROL_2` FOREIGN KEY (`PATH_PAG`) REFERENCES `pagina` (`PATH_PAG`);

--
-- Constraints for table `persona`
--
ALTER TABLE `persona`
  ADD CONSTRAINT `FK_TIPO_DOCUMENTO` FOREIGN KEY (`COD_TIP_DOC`) REFERENCES `tipo_documento` (`COD_TIP_DOC`),
  ADD CONSTRAINT `FK_TIPO_PERSONA` FOREIGN KEY (`COD_TIP_PER`) REFERENCES `tipo_persona` (`COD_TIP_PER`);

--
-- Constraints for table `persona_telefono`
--
ALTER TABLE `persona_telefono`
  ADD CONSTRAINT `FK_PERSONA_TELEFONO` FOREIGN KEY (`NUM_PER`) REFERENCES `persona` (`NUM_PER`);

--
-- Constraints for table `pqrsf_ent`
--
ALTER TABLE `pqrsf_ent`
  ADD CONSTRAINT `FK_DOCUMENTO_PQRSF_ENT` FOREIGN KEY (`COD_DOC`) REFERENCES `documento` (`COD_DOC`),
  ADD CONSTRAINT `FK_FUNCIONARIO_PQRSF` FOREIGN KEY (`COD_FUN`) REFERENCES `funcionario` (`COD_FUN`),
  ADD CONSTRAINT `FK_PERSONA_PQRSF_ENT` FOREIGN KEY (`NUM_PER`) REFERENCES `persona` (`NUM_PER`);

--
-- Constraints for table `pqrsf_sal`
--
ALTER TABLE `pqrsf_sal`
  ADD CONSTRAINT `FK_PQRSF_SALIDA` FOREIGN KEY (`NUM_PQR`, `ANIO_PQR`) REFERENCES `pqrsf_ent` (`NUM_PQR`, `ANIO_PQR`);

--
-- Constraints for table `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `FK_FUNCIONARIO_USUARIO` FOREIGN KEY (`COD_FUN`) REFERENCES `funcionario` (`COD_FUN`),
  ADD CONSTRAINT `FK_ROL_USUARIO` FOREIGN KEY (`COD_ROL`) REFERENCES `rol` (`COD_ROL`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
