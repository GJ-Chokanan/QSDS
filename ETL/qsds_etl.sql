/*
 Navicat Premium Data Transfer

 Source Server         : qsds_monmai
 Source Server Type    : MySQL
 Source Server Version : 50545
 Source Host           : 164.115.42.53:3306
 Source Schema         : qsds_etl

 Target Server Type    : MySQL
 Target Server Version : 50545
 File Encoding         : 65001

 Date: 06/02/2018 09:58:37
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for r_cluster
-- ----------------------------
DROP TABLE IF EXISTS `r_cluster`;
CREATE TABLE `r_cluster`  (
  `ID_CLUSTER` bigint(20) NOT NULL,
  `NAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `BASE_PORT` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `SOCKETS_BUFFER_SIZE` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `SOCKETS_FLUSH_INTERVAL` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `SOCKETS_COMPRESSED` tinyint(1) NULL DEFAULT NULL,
  `DYNAMIC_CLUSTER` tinyint(1) NULL DEFAULT NULL,
  PRIMARY KEY (`ID_CLUSTER`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for r_cluster_slave
-- ----------------------------
DROP TABLE IF EXISTS `r_cluster_slave`;
CREATE TABLE `r_cluster_slave`  (
  `ID_CLUSTER_SLAVE` bigint(20) NOT NULL,
  `ID_CLUSTER` int(11) NULL DEFAULT NULL,
  `ID_SLAVE` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`ID_CLUSTER_SLAVE`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for r_condition
-- ----------------------------
DROP TABLE IF EXISTS `r_condition`;
CREATE TABLE `r_condition`  (
  `ID_CONDITION` bigint(20) NOT NULL,
  `ID_CONDITION_PARENT` int(11) NULL DEFAULT NULL,
  `NEGATED` tinyint(1) NULL DEFAULT NULL,
  `OPERATOR` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `LEFT_NAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CONDITION_FUNCTION` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `RIGHT_NAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ID_VALUE_RIGHT` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`ID_CONDITION`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for r_database
-- ----------------------------
DROP TABLE IF EXISTS `r_database`;
CREATE TABLE `r_database`  (
  `ID_DATABASE` bigint(20) NOT NULL,
  `NAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ID_DATABASE_TYPE` int(11) NULL DEFAULT NULL,
  `ID_DATABASE_CONTYPE` int(11) NULL DEFAULT NULL,
  `HOST_NAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `DATABASE_NAME` mediumtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `PORT` int(11) NULL DEFAULT NULL,
  `USERNAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `PASSWORD` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `SERVERNAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `DATA_TBS` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `INDEX_TBS` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID_DATABASE`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of r_database
-- ----------------------------
INSERT INTO `r_database` VALUES (1, 'qsds_report', 31, 1, '164.115.42.53', 'qsds_report', 3306, 'root', 'Encrypted 2bedcc6e4198b9892a40ebd3c8cc2fe8d', NULL, NULL, NULL);

-- ----------------------------
-- Table structure for r_database_attribute
-- ----------------------------
DROP TABLE IF EXISTS `r_database_attribute`;
CREATE TABLE `r_database_attribute`  (
  `ID_DATABASE_ATTRIBUTE` bigint(20) NOT NULL,
  `ID_DATABASE` int(11) NULL DEFAULT NULL,
  `CODE` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `VALUE_STR` mediumtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  PRIMARY KEY (`ID_DATABASE_ATTRIBUTE`) USING BTREE,
  UNIQUE INDEX `IDX_RDAT`(`ID_DATABASE`, `CODE`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of r_database_attribute
-- ----------------------------
INSERT INTO `r_database_attribute` VALUES (1, 1, 'EXTRA_OPTION_MYSQL.useCursorFetch', 'true');
INSERT INTO `r_database_attribute` VALUES (2, 1, 'USE_POOLING', 'N');
INSERT INTO `r_database_attribute` VALUES (3, 1, 'PRESERVE_RESERVED_WORD_CASE', 'N');
INSERT INTO `r_database_attribute` VALUES (4, 1, 'IS_CLUSTERED', 'N');
INSERT INTO `r_database_attribute` VALUES (5, 1, 'SUPPORTS_TIMESTAMP_DATA_TYPE', 'Y');
INSERT INTO `r_database_attribute` VALUES (6, 1, 'SUPPORTS_BOOLEAN_DATA_TYPE', 'Y');
INSERT INTO `r_database_attribute` VALUES (7, 1, 'STREAM_RESULTS', 'Y');
INSERT INTO `r_database_attribute` VALUES (8, 1, 'EXTRA_OPTION_MYSQL.defaultFetchSize', '500');
INSERT INTO `r_database_attribute` VALUES (9, 1, 'FORCE_IDENTIFIERS_TO_UPPERCASE', 'N');
INSERT INTO `r_database_attribute` VALUES (10, 1, 'PORT_NUMBER', '3306');
INSERT INTO `r_database_attribute` VALUES (11, 1, 'PREFERRED_SCHEMA_NAME', NULL);
INSERT INTO `r_database_attribute` VALUES (12, 1, 'FORCE_IDENTIFIERS_TO_LOWERCASE', 'N');
INSERT INTO `r_database_attribute` VALUES (13, 1, 'SQL_CONNECT', NULL);
INSERT INTO `r_database_attribute` VALUES (14, 1, 'QUOTE_ALL_FIELDS', 'N');

-- ----------------------------
-- Table structure for r_database_contype
-- ----------------------------
DROP TABLE IF EXISTS `r_database_contype`;
CREATE TABLE `r_database_contype`  (
  `ID_DATABASE_CONTYPE` bigint(20) NOT NULL,
  `CODE` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `DESCRIPTION` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID_DATABASE_CONTYPE`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of r_database_contype
-- ----------------------------
INSERT INTO `r_database_contype` VALUES (1, 'Native', 'Native (JDBC)');
INSERT INTO `r_database_contype` VALUES (2, 'ODBC', 'ODBC');
INSERT INTO `r_database_contype` VALUES (3, 'OCI', 'OCI');
INSERT INTO `r_database_contype` VALUES (4, 'Plugin', 'Plugin specific access method');
INSERT INTO `r_database_contype` VALUES (5, 'JNDI', 'JNDI');
INSERT INTO `r_database_contype` VALUES (6, ',', 'Custom');

-- ----------------------------
-- Table structure for r_database_type
-- ----------------------------
DROP TABLE IF EXISTS `r_database_type`;
CREATE TABLE `r_database_type`  (
  `ID_DATABASE_TYPE` bigint(20) NOT NULL,
  `CODE` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `DESCRIPTION` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID_DATABASE_TYPE`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of r_database_type
-- ----------------------------
INSERT INTO `r_database_type` VALUES (1, 'DERBY', 'Apache Derby');
INSERT INTO `r_database_type` VALUES (2, 'AS/400', 'AS/400');
INSERT INTO `r_database_type` VALUES (3, 'INTERBASE', 'Borland Interbase');
INSERT INTO `r_database_type` VALUES (4, 'INFINIDB', 'Calpont InfiniDB');
INSERT INTO `r_database_type` VALUES (5, 'DBASE', 'dBase III, IV or 5');
INSERT INTO `r_database_type` VALUES (6, 'EXASOL4', 'Exasol 4');
INSERT INTO `r_database_type` VALUES (7, 'EXTENDB', 'ExtenDB');
INSERT INTO `r_database_type` VALUES (8, 'FIREBIRD', 'Firebird SQL');
INSERT INTO `r_database_type` VALUES (9, 'GENERIC', 'Generic database');
INSERT INTO `r_database_type` VALUES (10, 'GREENPLUM', 'Greenplum');
INSERT INTO `r_database_type` VALUES (11, 'SQLBASE', 'Gupta SQL Base');
INSERT INTO `r_database_type` VALUES (12, 'H2', 'H2');
INSERT INTO `r_database_type` VALUES (13, 'HIVE', 'Hadoop Hive');
INSERT INTO `r_database_type` VALUES (14, 'HIVE2', 'Hadoop Hive 2');
INSERT INTO `r_database_type` VALUES (15, 'HYPERSONIC', 'Hypersonic');
INSERT INTO `r_database_type` VALUES (16, 'DB2', 'IBM DB2');
INSERT INTO `r_database_type` VALUES (17, 'IMPALA', 'Impala');
INSERT INTO `r_database_type` VALUES (18, 'INFOBRIGHT', 'Infobright');
INSERT INTO `r_database_type` VALUES (19, 'INFORMIX', 'Informix');
INSERT INTO `r_database_type` VALUES (20, 'INGRES', 'Ingres');
INSERT INTO `r_database_type` VALUES (21, 'VECTORWISE', 'Ingres VectorWise');
INSERT INTO `r_database_type` VALUES (22, 'CACHE', 'Intersystems Cache');
INSERT INTO `r_database_type` VALUES (23, 'KettleThin', 'Kettle thin JDBC driver');
INSERT INTO `r_database_type` VALUES (24, 'KINGBASEES', 'KingbaseES');
INSERT INTO `r_database_type` VALUES (25, 'LucidDB', 'LucidDB');
INSERT INTO `r_database_type` VALUES (26, 'SAPDB', 'MaxDB (SAP DB)');
INSERT INTO `r_database_type` VALUES (27, 'MONETDB', 'MonetDB');
INSERT INTO `r_database_type` VALUES (28, 'MSACCESS', 'MS Access');
INSERT INTO `r_database_type` VALUES (29, 'MSSQL', 'MS SQL Server');
INSERT INTO `r_database_type` VALUES (30, 'MSSQLNATIVE', 'MS SQL Server (Native)');
INSERT INTO `r_database_type` VALUES (31, 'MYSQL', 'MySQL');
INSERT INTO `r_database_type` VALUES (32, 'MONDRIAN', 'Native Mondrian');
INSERT INTO `r_database_type` VALUES (33, 'NEOVIEW', 'Neoview');
INSERT INTO `r_database_type` VALUES (34, 'NETEZZA', 'Netezza');
INSERT INTO `r_database_type` VALUES (35, 'OpenERPDatabaseMeta', 'OpenERP Server');
INSERT INTO `r_database_type` VALUES (36, 'ORACLE', 'Oracle');
INSERT INTO `r_database_type` VALUES (37, 'ORACLERDB', 'Oracle RDB');
INSERT INTO `r_database_type` VALUES (38, 'PALO', 'Palo MOLAP Server');
INSERT INTO `r_database_type` VALUES (39, 'POSTGRESQL', 'PostgreSQL');
INSERT INTO `r_database_type` VALUES (40, 'REDSHIFT', 'Redshift');
INSERT INTO `r_database_type` VALUES (41, 'REMEDY-AR-SYSTEM', 'Remedy Action Request System');
INSERT INTO `r_database_type` VALUES (42, 'SAPR3', 'SAP ERP System');
INSERT INTO `r_database_type` VALUES (43, 'SQLITE', 'SQLite');
INSERT INTO `r_database_type` VALUES (44, 'SYBASE', 'Sybase');
INSERT INTO `r_database_type` VALUES (45, 'SYBASEIQ', 'SybaseIQ');
INSERT INTO `r_database_type` VALUES (46, 'TERADATA', 'Teradata');
INSERT INTO `r_database_type` VALUES (47, 'UNIVERSE', 'UniVerse database');
INSERT INTO `r_database_type` VALUES (48, 'VERTICA', 'Vertica');
INSERT INTO `r_database_type` VALUES (49, 'VERTICA5', 'Vertica 5+');

-- ----------------------------
-- Table structure for r_dependency
-- ----------------------------
DROP TABLE IF EXISTS `r_dependency`;
CREATE TABLE `r_dependency`  (
  `ID_DEPENDENCY` bigint(20) NOT NULL,
  `ID_TRANSFORMATION` int(11) NULL DEFAULT NULL,
  `ID_DATABASE` int(11) NULL DEFAULT NULL,
  `TABLE_NAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `FIELD_NAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID_DEPENDENCY`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for r_directory
-- ----------------------------
DROP TABLE IF EXISTS `r_directory`;
CREATE TABLE `r_directory`  (
  `ID_DIRECTORY` bigint(20) NOT NULL,
  `ID_DIRECTORY_PARENT` int(11) NULL DEFAULT NULL,
  `DIRECTORY_NAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID_DIRECTORY`) USING BTREE,
  UNIQUE INDEX `IDX_RDIR`(`ID_DIRECTORY_PARENT`, `DIRECTORY_NAME`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for r_element
-- ----------------------------
DROP TABLE IF EXISTS `r_element`;
CREATE TABLE `r_element`  (
  `ID_ELEMENT` bigint(20) NOT NULL,
  `ID_ELEMENT_TYPE` int(11) NULL DEFAULT NULL,
  `NAME` mediumtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  PRIMARY KEY (`ID_ELEMENT`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for r_element_attribute
-- ----------------------------
DROP TABLE IF EXISTS `r_element_attribute`;
CREATE TABLE `r_element_attribute`  (
  `ID_ELEMENT_ATTRIBUTE` bigint(20) NOT NULL,
  `ID_ELEMENT` int(11) NULL DEFAULT NULL,
  `ID_ELEMENT_ATTRIBUTE_PARENT` int(11) NULL DEFAULT NULL,
  `ATTR_KEY` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ATTR_VALUE` mediumtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  PRIMARY KEY (`ID_ELEMENT_ATTRIBUTE`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for r_element_type
-- ----------------------------
DROP TABLE IF EXISTS `r_element_type`;
CREATE TABLE `r_element_type`  (
  `ID_ELEMENT_TYPE` bigint(20) NOT NULL,
  `ID_NAMESPACE` int(11) NULL DEFAULT NULL,
  `NAME` mediumtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `DESCRIPTION` mediumtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  PRIMARY KEY (`ID_ELEMENT_TYPE`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for r_job
-- ----------------------------
DROP TABLE IF EXISTS `r_job`;
CREATE TABLE `r_job`  (
  `ID_JOB` bigint(20) NOT NULL,
  `ID_DIRECTORY` int(11) NULL DEFAULT NULL,
  `NAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `DESCRIPTION` mediumtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `EXTENDED_DESCRIPTION` mediumtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `JOB_VERSION` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `JOB_STATUS` int(11) NULL DEFAULT NULL,
  `ID_DATABASE_LOG` int(11) NULL DEFAULT NULL,
  `TABLE_NAME_LOG` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CREATED_USER` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CREATED_DATE` datetime NULL DEFAULT NULL,
  `MODIFIED_USER` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `MODIFIED_DATE` datetime NULL DEFAULT NULL,
  `USE_BATCH_ID` tinyint(1) NULL DEFAULT NULL,
  `PASS_BATCH_ID` tinyint(1) NULL DEFAULT NULL,
  `USE_LOGFIELD` tinyint(1) NULL DEFAULT NULL,
  `SHARED_FILE` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID_JOB`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of r_job
-- ----------------------------
INSERT INTO `r_job` VALUES (1, 0, 'JobQsdsReport', NULL, NULL, NULL, 0, -1, NULL, '-', '2018-01-25 10:17:34', 'admin', '2018-01-30 20:18:47', 1, 0, 1, NULL);

-- ----------------------------
-- Table structure for r_job_attribute
-- ----------------------------
DROP TABLE IF EXISTS `r_job_attribute`;
CREATE TABLE `r_job_attribute`  (
  `ID_JOB_ATTRIBUTE` bigint(20) NOT NULL,
  `ID_JOB` int(11) NULL DEFAULT NULL,
  `NR` int(11) NULL DEFAULT NULL,
  `CODE` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `VALUE_NUM` bigint(20) NULL DEFAULT NULL,
  `VALUE_STR` mediumtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  PRIMARY KEY (`ID_JOB_ATTRIBUTE`) USING BTREE,
  UNIQUE INDEX `IDX_JATT`(`ID_JOB`, `CODE`, `NR`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of r_job_attribute
-- ----------------------------
INSERT INTO `r_job_attribute` VALUES (1, 1, 0, 'LOG_SIZE_LIMIT', 0, NULL);
INSERT INTO `r_job_attribute` VALUES (2, 1, 0, 'JOB_LOG_TABLE_CONNECTION_NAME', 0, NULL);
INSERT INTO `r_job_attribute` VALUES (3, 1, 0, 'JOB_LOG_TABLE_SCHEMA_NAME', 0, NULL);
INSERT INTO `r_job_attribute` VALUES (4, 1, 0, 'JOB_LOG_TABLE_TABLE_NAME', 0, NULL);
INSERT INTO `r_job_attribute` VALUES (5, 1, 0, 'JOB_LOG_TABLE_TIMEOUT_IN_DAYS', 0, NULL);
INSERT INTO `r_job_attribute` VALUES (6, 1, 0, 'JOB_LOG_TABLE_FIELD_ID0', 0, 'ID_JOB');
INSERT INTO `r_job_attribute` VALUES (7, 1, 0, 'JOB_LOG_TABLE_FIELD_NAME0', 0, 'ID_JOB');
INSERT INTO `r_job_attribute` VALUES (8, 1, 0, 'JOB_LOG_TABLE_FIELD_ENABLED0', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (9, 1, 0, 'JOB_LOG_TABLE_FIELD_ID1', 0, 'CHANNEL_ID');
INSERT INTO `r_job_attribute` VALUES (10, 1, 0, 'JOB_LOG_TABLE_FIELD_NAME1', 0, 'CHANNEL_ID');
INSERT INTO `r_job_attribute` VALUES (11, 1, 0, 'JOB_LOG_TABLE_FIELD_ENABLED1', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (12, 1, 0, 'JOB_LOG_TABLE_FIELD_ID2', 0, 'JOBNAME');
INSERT INTO `r_job_attribute` VALUES (13, 1, 0, 'JOB_LOG_TABLE_FIELD_NAME2', 0, 'JOBNAME');
INSERT INTO `r_job_attribute` VALUES (14, 1, 0, 'JOB_LOG_TABLE_FIELD_ENABLED2', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (15, 1, 0, 'JOB_LOG_TABLE_FIELD_ID3', 0, 'STATUS');
INSERT INTO `r_job_attribute` VALUES (16, 1, 0, 'JOB_LOG_TABLE_FIELD_NAME3', 0, 'STATUS');
INSERT INTO `r_job_attribute` VALUES (17, 1, 0, 'JOB_LOG_TABLE_FIELD_ENABLED3', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (18, 1, 0, 'JOB_LOG_TABLE_FIELD_ID4', 0, 'LINES_READ');
INSERT INTO `r_job_attribute` VALUES (19, 1, 0, 'JOB_LOG_TABLE_FIELD_NAME4', 0, 'LINES_READ');
INSERT INTO `r_job_attribute` VALUES (20, 1, 0, 'JOB_LOG_TABLE_FIELD_ENABLED4', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (21, 1, 0, 'JOB_LOG_TABLE_FIELD_ID5', 0, 'LINES_WRITTEN');
INSERT INTO `r_job_attribute` VALUES (22, 1, 0, 'JOB_LOG_TABLE_FIELD_NAME5', 0, 'LINES_WRITTEN');
INSERT INTO `r_job_attribute` VALUES (23, 1, 0, 'JOB_LOG_TABLE_FIELD_ENABLED5', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (24, 1, 0, 'JOB_LOG_TABLE_FIELD_ID6', 0, 'LINES_UPDATED');
INSERT INTO `r_job_attribute` VALUES (25, 1, 0, 'JOB_LOG_TABLE_FIELD_NAME6', 0, 'LINES_UPDATED');
INSERT INTO `r_job_attribute` VALUES (26, 1, 0, 'JOB_LOG_TABLE_FIELD_ENABLED6', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (27, 1, 0, 'JOB_LOG_TABLE_FIELD_ID7', 0, 'LINES_INPUT');
INSERT INTO `r_job_attribute` VALUES (28, 1, 0, 'JOB_LOG_TABLE_FIELD_NAME7', 0, 'LINES_INPUT');
INSERT INTO `r_job_attribute` VALUES (29, 1, 0, 'JOB_LOG_TABLE_FIELD_ENABLED7', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (30, 1, 0, 'JOB_LOG_TABLE_FIELD_ID8', 0, 'LINES_OUTPUT');
INSERT INTO `r_job_attribute` VALUES (31, 1, 0, 'JOB_LOG_TABLE_FIELD_NAME8', 0, 'LINES_OUTPUT');
INSERT INTO `r_job_attribute` VALUES (32, 1, 0, 'JOB_LOG_TABLE_FIELD_ENABLED8', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (33, 1, 0, 'JOB_LOG_TABLE_FIELD_ID9', 0, 'LINES_REJECTED');
INSERT INTO `r_job_attribute` VALUES (34, 1, 0, 'JOB_LOG_TABLE_FIELD_NAME9', 0, 'LINES_REJECTED');
INSERT INTO `r_job_attribute` VALUES (35, 1, 0, 'JOB_LOG_TABLE_FIELD_ENABLED9', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (36, 1, 0, 'JOB_LOG_TABLE_FIELD_ID10', 0, 'ERRORS');
INSERT INTO `r_job_attribute` VALUES (37, 1, 0, 'JOB_LOG_TABLE_FIELD_NAME10', 0, 'ERRORS');
INSERT INTO `r_job_attribute` VALUES (38, 1, 0, 'JOB_LOG_TABLE_FIELD_ENABLED10', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (39, 1, 0, 'JOB_LOG_TABLE_FIELD_ID11', 0, 'STARTDATE');
INSERT INTO `r_job_attribute` VALUES (40, 1, 0, 'JOB_LOG_TABLE_FIELD_NAME11', 0, 'STARTDATE');
INSERT INTO `r_job_attribute` VALUES (41, 1, 0, 'JOB_LOG_TABLE_FIELD_ENABLED11', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (42, 1, 0, 'JOB_LOG_TABLE_FIELD_ID12', 0, 'ENDDATE');
INSERT INTO `r_job_attribute` VALUES (43, 1, 0, 'JOB_LOG_TABLE_FIELD_NAME12', 0, 'ENDDATE');
INSERT INTO `r_job_attribute` VALUES (44, 1, 0, 'JOB_LOG_TABLE_FIELD_ENABLED12', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (45, 1, 0, 'JOB_LOG_TABLE_FIELD_ID13', 0, 'LOGDATE');
INSERT INTO `r_job_attribute` VALUES (46, 1, 0, 'JOB_LOG_TABLE_FIELD_NAME13', 0, 'LOGDATE');
INSERT INTO `r_job_attribute` VALUES (47, 1, 0, 'JOB_LOG_TABLE_FIELD_ENABLED13', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (48, 1, 0, 'JOB_LOG_TABLE_FIELD_ID14', 0, 'DEPDATE');
INSERT INTO `r_job_attribute` VALUES (49, 1, 0, 'JOB_LOG_TABLE_FIELD_NAME14', 0, 'DEPDATE');
INSERT INTO `r_job_attribute` VALUES (50, 1, 0, 'JOB_LOG_TABLE_FIELD_ENABLED14', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (51, 1, 0, 'JOB_LOG_TABLE_FIELD_ID15', 0, 'REPLAYDATE');
INSERT INTO `r_job_attribute` VALUES (52, 1, 0, 'JOB_LOG_TABLE_FIELD_NAME15', 0, 'REPLAYDATE');
INSERT INTO `r_job_attribute` VALUES (53, 1, 0, 'JOB_LOG_TABLE_FIELD_ENABLED15', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (54, 1, 0, 'JOB_LOG_TABLE_FIELD_ID16', 0, 'LOG_FIELD');
INSERT INTO `r_job_attribute` VALUES (55, 1, 0, 'JOB_LOG_TABLE_FIELD_NAME16', 0, 'LOG_FIELD');
INSERT INTO `r_job_attribute` VALUES (56, 1, 0, 'JOB_LOG_TABLE_FIELD_ENABLED16', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (57, 1, 0, 'JOB_LOG_TABLE_FIELD_ID17', 0, 'EXECUTING_SERVER');
INSERT INTO `r_job_attribute` VALUES (58, 1, 0, 'JOB_LOG_TABLE_FIELD_NAME17', 0, 'EXECUTING_SERVER');
INSERT INTO `r_job_attribute` VALUES (59, 1, 0, 'JOB_LOG_TABLE_FIELD_ENABLED17', 0, 'N');
INSERT INTO `r_job_attribute` VALUES (60, 1, 0, 'JOB_LOG_TABLE_FIELD_ID18', 0, 'EXECUTING_USER');
INSERT INTO `r_job_attribute` VALUES (61, 1, 0, 'JOB_LOG_TABLE_FIELD_NAME18', 0, 'EXECUTING_USER');
INSERT INTO `r_job_attribute` VALUES (62, 1, 0, 'JOB_LOG_TABLE_FIELD_ENABLED18', 0, 'N');
INSERT INTO `r_job_attribute` VALUES (63, 1, 0, 'JOB_LOG_TABLE_FIELD_ID19', 0, 'START_JOB_ENTRY');
INSERT INTO `r_job_attribute` VALUES (64, 1, 0, 'JOB_LOG_TABLE_FIELD_NAME19', 0, 'START_JOB_ENTRY');
INSERT INTO `r_job_attribute` VALUES (65, 1, 0, 'JOB_LOG_TABLE_FIELD_ENABLED19', 0, 'N');
INSERT INTO `r_job_attribute` VALUES (66, 1, 0, 'JOB_LOG_TABLE_FIELD_ID20', 0, 'CLIENT');
INSERT INTO `r_job_attribute` VALUES (67, 1, 0, 'JOB_LOG_TABLE_FIELD_NAME20', 0, 'CLIENT');
INSERT INTO `r_job_attribute` VALUES (68, 1, 0, 'JOB_LOG_TABLE_FIELD_ENABLED20', 0, 'N');
INSERT INTO `r_job_attribute` VALUES (69, 1, 0, 'JOBLOG_TABLE_INTERVAL', 0, NULL);
INSERT INTO `r_job_attribute` VALUES (70, 1, 0, 'JOBLOG_TABLE_SIZE_LIMIT', 0, NULL);
INSERT INTO `r_job_attribute` VALUES (71, 1, 0, 'JOB_ENTRY_LOG_TABLE_CONNECTION_NAME', 0, NULL);
INSERT INTO `r_job_attribute` VALUES (72, 1, 0, 'JOB_ENTRY_LOG_TABLE_SCHEMA_NAME', 0, NULL);
INSERT INTO `r_job_attribute` VALUES (73, 1, 0, 'JOB_ENTRY_LOG_TABLE_TABLE_NAME', 0, NULL);
INSERT INTO `r_job_attribute` VALUES (74, 1, 0, 'JOB_ENTRY_LOG_TABLE_TIMEOUT_IN_DAYS', 0, NULL);
INSERT INTO `r_job_attribute` VALUES (75, 1, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_ID0', 0, 'ID_BATCH');
INSERT INTO `r_job_attribute` VALUES (76, 1, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_NAME0', 0, 'ID_BATCH');
INSERT INTO `r_job_attribute` VALUES (77, 1, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_ENABLED0', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (78, 1, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_ID1', 0, 'CHANNEL_ID');
INSERT INTO `r_job_attribute` VALUES (79, 1, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_NAME1', 0, 'CHANNEL_ID');
INSERT INTO `r_job_attribute` VALUES (80, 1, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_ENABLED1', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (81, 1, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_ID2', 0, 'LOG_DATE');
INSERT INTO `r_job_attribute` VALUES (82, 1, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_NAME2', 0, 'LOG_DATE');
INSERT INTO `r_job_attribute` VALUES (83, 1, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_ENABLED2', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (84, 1, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_ID3', 0, 'JOBNAME');
INSERT INTO `r_job_attribute` VALUES (85, 1, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_NAME3', 0, 'TRANSNAME');
INSERT INTO `r_job_attribute` VALUES (86, 1, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_ENABLED3', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (87, 1, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_ID4', 0, 'JOBENTRYNAME');
INSERT INTO `r_job_attribute` VALUES (88, 1, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_NAME4', 0, 'STEPNAME');
INSERT INTO `r_job_attribute` VALUES (89, 1, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_ENABLED4', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (90, 1, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_ID5', 0, 'LINES_READ');
INSERT INTO `r_job_attribute` VALUES (91, 1, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_NAME5', 0, 'LINES_READ');
INSERT INTO `r_job_attribute` VALUES (92, 1, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_ENABLED5', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (93, 1, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_ID6', 0, 'LINES_WRITTEN');
INSERT INTO `r_job_attribute` VALUES (94, 1, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_NAME6', 0, 'LINES_WRITTEN');
INSERT INTO `r_job_attribute` VALUES (95, 1, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_ENABLED6', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (96, 1, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_ID7', 0, 'LINES_UPDATED');
INSERT INTO `r_job_attribute` VALUES (97, 1, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_NAME7', 0, 'LINES_UPDATED');
INSERT INTO `r_job_attribute` VALUES (98, 1, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_ENABLED7', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (99, 1, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_ID8', 0, 'LINES_INPUT');
INSERT INTO `r_job_attribute` VALUES (100, 1, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_NAME8', 0, 'LINES_INPUT');
INSERT INTO `r_job_attribute` VALUES (101, 1, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_ENABLED8', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (102, 1, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_ID9', 0, 'LINES_OUTPUT');
INSERT INTO `r_job_attribute` VALUES (103, 1, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_NAME9', 0, 'LINES_OUTPUT');
INSERT INTO `r_job_attribute` VALUES (104, 1, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_ENABLED9', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (105, 1, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_ID10', 0, 'LINES_REJECTED');
INSERT INTO `r_job_attribute` VALUES (106, 1, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_NAME10', 0, 'LINES_REJECTED');
INSERT INTO `r_job_attribute` VALUES (107, 1, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_ENABLED10', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (108, 1, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_ID11', 0, 'ERRORS');
INSERT INTO `r_job_attribute` VALUES (109, 1, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_NAME11', 0, 'ERRORS');
INSERT INTO `r_job_attribute` VALUES (110, 1, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_ENABLED11', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (111, 1, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_ID12', 0, 'RESULT');
INSERT INTO `r_job_attribute` VALUES (112, 1, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_NAME12', 0, 'RESULT');
INSERT INTO `r_job_attribute` VALUES (113, 1, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_ENABLED12', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (114, 1, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_ID13', 0, 'NR_RESULT_ROWS');
INSERT INTO `r_job_attribute` VALUES (115, 1, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_NAME13', 0, 'NR_RESULT_ROWS');
INSERT INTO `r_job_attribute` VALUES (116, 1, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_ENABLED13', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (117, 1, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_ID14', 0, 'NR_RESULT_FILES');
INSERT INTO `r_job_attribute` VALUES (118, 1, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_NAME14', 0, 'NR_RESULT_FILES');
INSERT INTO `r_job_attribute` VALUES (119, 1, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_ENABLED14', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (120, 1, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_ID15', 0, 'LOG_FIELD');
INSERT INTO `r_job_attribute` VALUES (121, 1, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_NAME15', 0, 'LOG_FIELD');
INSERT INTO `r_job_attribute` VALUES (122, 1, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_ENABLED15', 0, 'N');
INSERT INTO `r_job_attribute` VALUES (123, 1, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_ID16', 0, 'COPY_NR');
INSERT INTO `r_job_attribute` VALUES (124, 1, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_NAME16', 0, 'COPY_NR');
INSERT INTO `r_job_attribute` VALUES (125, 1, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_ENABLED16', 0, 'N');
INSERT INTO `r_job_attribute` VALUES (126, 1, 0, 'CHANNEL_LOG_TABLE_CONNECTION_NAME', 0, NULL);
INSERT INTO `r_job_attribute` VALUES (127, 1, 0, 'CHANNEL_LOG_TABLE_SCHEMA_NAME', 0, NULL);
INSERT INTO `r_job_attribute` VALUES (128, 1, 0, 'CHANNEL_LOG_TABLE_TABLE_NAME', 0, NULL);
INSERT INTO `r_job_attribute` VALUES (129, 1, 0, 'CHANNEL_LOG_TABLE_TIMEOUT_IN_DAYS', 0, NULL);
INSERT INTO `r_job_attribute` VALUES (130, 1, 0, 'CHANNEL_LOG_TABLE_FIELD_ID0', 0, 'ID_BATCH');
INSERT INTO `r_job_attribute` VALUES (131, 1, 0, 'CHANNEL_LOG_TABLE_FIELD_NAME0', 0, 'ID_BATCH');
INSERT INTO `r_job_attribute` VALUES (132, 1, 0, 'CHANNEL_LOG_TABLE_FIELD_ENABLED0', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (133, 1, 0, 'CHANNEL_LOG_TABLE_FIELD_ID1', 0, 'CHANNEL_ID');
INSERT INTO `r_job_attribute` VALUES (134, 1, 0, 'CHANNEL_LOG_TABLE_FIELD_NAME1', 0, 'CHANNEL_ID');
INSERT INTO `r_job_attribute` VALUES (135, 1, 0, 'CHANNEL_LOG_TABLE_FIELD_ENABLED1', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (136, 1, 0, 'CHANNEL_LOG_TABLE_FIELD_ID2', 0, 'LOG_DATE');
INSERT INTO `r_job_attribute` VALUES (137, 1, 0, 'CHANNEL_LOG_TABLE_FIELD_NAME2', 0, 'LOG_DATE');
INSERT INTO `r_job_attribute` VALUES (138, 1, 0, 'CHANNEL_LOG_TABLE_FIELD_ENABLED2', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (139, 1, 0, 'CHANNEL_LOG_TABLE_FIELD_ID3', 0, 'LOGGING_OBJECT_TYPE');
INSERT INTO `r_job_attribute` VALUES (140, 1, 0, 'CHANNEL_LOG_TABLE_FIELD_NAME3', 0, 'LOGGING_OBJECT_TYPE');
INSERT INTO `r_job_attribute` VALUES (141, 1, 0, 'CHANNEL_LOG_TABLE_FIELD_ENABLED3', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (142, 1, 0, 'CHANNEL_LOG_TABLE_FIELD_ID4', 0, 'OBJECT_NAME');
INSERT INTO `r_job_attribute` VALUES (143, 1, 0, 'CHANNEL_LOG_TABLE_FIELD_NAME4', 0, 'OBJECT_NAME');
INSERT INTO `r_job_attribute` VALUES (144, 1, 0, 'CHANNEL_LOG_TABLE_FIELD_ENABLED4', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (145, 1, 0, 'CHANNEL_LOG_TABLE_FIELD_ID5', 0, 'OBJECT_COPY');
INSERT INTO `r_job_attribute` VALUES (146, 1, 0, 'CHANNEL_LOG_TABLE_FIELD_NAME5', 0, 'OBJECT_COPY');
INSERT INTO `r_job_attribute` VALUES (147, 1, 0, 'CHANNEL_LOG_TABLE_FIELD_ENABLED5', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (148, 1, 0, 'CHANNEL_LOG_TABLE_FIELD_ID6', 0, 'REPOSITORY_DIRECTORY');
INSERT INTO `r_job_attribute` VALUES (149, 1, 0, 'CHANNEL_LOG_TABLE_FIELD_NAME6', 0, 'REPOSITORY_DIRECTORY');
INSERT INTO `r_job_attribute` VALUES (150, 1, 0, 'CHANNEL_LOG_TABLE_FIELD_ENABLED6', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (151, 1, 0, 'CHANNEL_LOG_TABLE_FIELD_ID7', 0, 'FILENAME');
INSERT INTO `r_job_attribute` VALUES (152, 1, 0, 'CHANNEL_LOG_TABLE_FIELD_NAME7', 0, 'FILENAME');
INSERT INTO `r_job_attribute` VALUES (153, 1, 0, 'CHANNEL_LOG_TABLE_FIELD_ENABLED7', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (154, 1, 0, 'CHANNEL_LOG_TABLE_FIELD_ID8', 0, 'OBJECT_ID');
INSERT INTO `r_job_attribute` VALUES (155, 1, 0, 'CHANNEL_LOG_TABLE_FIELD_NAME8', 0, 'OBJECT_ID');
INSERT INTO `r_job_attribute` VALUES (156, 1, 0, 'CHANNEL_LOG_TABLE_FIELD_ENABLED8', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (157, 1, 0, 'CHANNEL_LOG_TABLE_FIELD_ID9', 0, 'OBJECT_REVISION');
INSERT INTO `r_job_attribute` VALUES (158, 1, 0, 'CHANNEL_LOG_TABLE_FIELD_NAME9', 0, 'OBJECT_REVISION');
INSERT INTO `r_job_attribute` VALUES (159, 1, 0, 'CHANNEL_LOG_TABLE_FIELD_ENABLED9', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (160, 1, 0, 'CHANNEL_LOG_TABLE_FIELD_ID10', 0, 'PARENT_CHANNEL_ID');
INSERT INTO `r_job_attribute` VALUES (161, 1, 0, 'CHANNEL_LOG_TABLE_FIELD_NAME10', 0, 'PARENT_CHANNEL_ID');
INSERT INTO `r_job_attribute` VALUES (162, 1, 0, 'CHANNEL_LOG_TABLE_FIELD_ENABLED10', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (163, 1, 0, 'CHANNEL_LOG_TABLE_FIELD_ID11', 0, 'ROOT_CHANNEL_ID');
INSERT INTO `r_job_attribute` VALUES (164, 1, 0, 'CHANNEL_LOG_TABLE_FIELD_NAME11', 0, 'ROOT_CHANNEL_ID');
INSERT INTO `r_job_attribute` VALUES (165, 1, 0, 'CHANNEL_LOG_TABLE_FIELD_ENABLED11', 0, 'Y');

-- ----------------------------
-- Table structure for r_job_hop
-- ----------------------------
DROP TABLE IF EXISTS `r_job_hop`;
CREATE TABLE `r_job_hop`  (
  `ID_JOB_HOP` bigint(20) NOT NULL,
  `ID_JOB` int(11) NULL DEFAULT NULL,
  `ID_JOBENTRY_COPY_FROM` int(11) NULL DEFAULT NULL,
  `ID_JOBENTRY_COPY_TO` int(11) NULL DEFAULT NULL,
  `ENABLED` tinyint(1) NULL DEFAULT NULL,
  `EVALUATION` tinyint(1) NULL DEFAULT NULL,
  `UNCONDITIONAL` tinyint(1) NULL DEFAULT NULL,
  PRIMARY KEY (`ID_JOB_HOP`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of r_job_hop
-- ----------------------------
INSERT INTO `r_job_hop` VALUES (1, 1, 4, 6, 1, 1, 0);
INSERT INTO `r_job_hop` VALUES (2, 1, 6, 5, 1, 1, 0);
INSERT INTO `r_job_hop` VALUES (3, 1, 2, 7, 1, 0, 0);
INSERT INTO `r_job_hop` VALUES (4, 1, 3, 7, 1, 0, 0);
INSERT INTO `r_job_hop` VALUES (5, 1, 4, 7, 1, 0, 0);
INSERT INTO `r_job_hop` VALUES (6, 1, 6, 7, 1, 0, 0);
INSERT INTO `r_job_hop` VALUES (7, 1, 8, 7, 1, 0, 0);
INSERT INTO `r_job_hop` VALUES (8, 1, 1, 8, 1, 1, 1);
INSERT INTO `r_job_hop` VALUES (9, 1, 8, 9, 1, 1, 0);
INSERT INTO `r_job_hop` VALUES (10, 1, 9, 2, 1, 0, 0);
INSERT INTO `r_job_hop` VALUES (11, 1, 9, 10, 1, 1, 0);
INSERT INTO `r_job_hop` VALUES (12, 1, 10, 3, 1, 0, 0);
INSERT INTO `r_job_hop` VALUES (13, 1, 2, 10, 1, 1, 0);
INSERT INTO `r_job_hop` VALUES (14, 1, 3, 11, 1, 1, 0);
INSERT INTO `r_job_hop` VALUES (15, 1, 10, 11, 1, 1, 0);
INSERT INTO `r_job_hop` VALUES (16, 1, 11, 4, 1, 0, 0);
INSERT INTO `r_job_hop` VALUES (17, 1, 11, 5, 1, 1, 0);

-- ----------------------------
-- Table structure for r_job_lock
-- ----------------------------
DROP TABLE IF EXISTS `r_job_lock`;
CREATE TABLE `r_job_lock`  (
  `ID_JOB_LOCK` bigint(20) NOT NULL,
  `ID_JOB` int(11) NULL DEFAULT NULL,
  `ID_USER` int(11) NULL DEFAULT NULL,
  `LOCK_MESSAGE` mediumtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `LOCK_DATE` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`ID_JOB_LOCK`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for r_job_note
-- ----------------------------
DROP TABLE IF EXISTS `r_job_note`;
CREATE TABLE `r_job_note`  (
  `ID_JOB` int(11) NULL DEFAULT NULL,
  `ID_NOTE` int(11) NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of r_job_note
-- ----------------------------
INSERT INTO `r_job_note` VALUES (1, 18);

-- ----------------------------
-- Table structure for r_jobentry
-- ----------------------------
DROP TABLE IF EXISTS `r_jobentry`;
CREATE TABLE `r_jobentry`  (
  `ID_JOBENTRY` bigint(20) NOT NULL,
  `ID_JOB` int(11) NULL DEFAULT NULL,
  `ID_JOBENTRY_TYPE` int(11) NULL DEFAULT NULL,
  `NAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `DESCRIPTION` mediumtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  PRIMARY KEY (`ID_JOBENTRY`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of r_jobentry
-- ----------------------------
INSERT INTO `r_jobentry` VALUES (1, 1, 67, 'START', NULL);
INSERT INTO `r_jobentry` VALUES (2, 1, 77, 'itec_report_budget', NULL);
INSERT INTO `r_jobentry` VALUES (3, 1, 77, 'm_indicators', NULL);
INSERT INTO `r_jobentry` VALUES (4, 1, 77, 'itec_report_project', NULL);
INSERT INTO `r_jobentry` VALUES (5, 1, 73, 'Success', NULL);
INSERT INTO `r_jobentry` VALUES (6, 1, 77, 'UpdateFinishJob', NULL);
INSERT INTO `r_jobentry` VALUES (7, 1, 1, 'Abort job', NULL);
INSERT INTO `r_jobentry` VALUES (8, 1, 77, 'StartJob', NULL);
INSERT INTO `r_jobentry` VALUES (9, 1, 10, 'Check folder empty report_budget', NULL);
INSERT INTO `r_jobentry` VALUES (10, 1, 10, 'Check folder empty indicators', NULL);
INSERT INTO `r_jobentry` VALUES (11, 1, 10, 'Check folder empty report_project', NULL);

-- ----------------------------
-- Table structure for r_jobentry_attribute
-- ----------------------------
DROP TABLE IF EXISTS `r_jobentry_attribute`;
CREATE TABLE `r_jobentry_attribute`  (
  `ID_JOBENTRY_ATTRIBUTE` bigint(20) NOT NULL,
  `ID_JOB` int(11) NULL DEFAULT NULL,
  `ID_JOBENTRY` int(11) NULL DEFAULT NULL,
  `NR` int(11) NULL DEFAULT NULL,
  `CODE` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `VALUE_NUM` double NULL DEFAULT NULL,
  `VALUE_STR` mediumtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  PRIMARY KEY (`ID_JOBENTRY_ATTRIBUTE`) USING BTREE,
  UNIQUE INDEX `IDX_RJEA`(`ID_JOBENTRY_ATTRIBUTE`, `CODE`, `NR`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of r_jobentry_attribute
-- ----------------------------
INSERT INTO `r_jobentry_attribute` VALUES (1, 1, 1, 0, 'start', 0, 'Y');
INSERT INTO `r_jobentry_attribute` VALUES (2, 1, 1, 0, 'dummy', 0, 'N');
INSERT INTO `r_jobentry_attribute` VALUES (3, 1, 1, 0, 'repeat', 0, 'N');
INSERT INTO `r_jobentry_attribute` VALUES (4, 1, 1, 0, 'schedulerType', 0, NULL);
INSERT INTO `r_jobentry_attribute` VALUES (5, 1, 1, 0, 'intervalSeconds', 0, NULL);
INSERT INTO `r_jobentry_attribute` VALUES (6, 1, 1, 0, 'intervalMinutes', 60, NULL);
INSERT INTO `r_jobentry_attribute` VALUES (7, 1, 1, 0, 'hour', 12, NULL);
INSERT INTO `r_jobentry_attribute` VALUES (8, 1, 1, 0, 'minutes', 0, NULL);
INSERT INTO `r_jobentry_attribute` VALUES (9, 1, 1, 0, 'weekDay', 1, NULL);
INSERT INTO `r_jobentry_attribute` VALUES (10, 1, 1, 0, 'dayOfMonth', 1, NULL);
INSERT INTO `r_jobentry_attribute` VALUES (11, 1, 2, 0, 'specification_method', 0, 'rep_name');
INSERT INTO `r_jobentry_attribute` VALUES (12, 1, 2, 0, 'trans_object_id', 0, NULL);
INSERT INTO `r_jobentry_attribute` VALUES (13, 1, 2, 0, 'name', 0, 'itec_report_budget');
INSERT INTO `r_jobentry_attribute` VALUES (14, 1, 2, 0, 'dir_path', 0, '/');
INSERT INTO `r_jobentry_attribute` VALUES (15, 1, 2, 0, 'file_name', 0, NULL);
INSERT INTO `r_jobentry_attribute` VALUES (16, 1, 2, 0, 'arg_from_previous', 0, 'N');
INSERT INTO `r_jobentry_attribute` VALUES (17, 1, 2, 0, 'params_from_previous', 0, 'N');
INSERT INTO `r_jobentry_attribute` VALUES (18, 1, 2, 0, 'exec_per_row', 0, 'N');
INSERT INTO `r_jobentry_attribute` VALUES (19, 1, 2, 0, 'clear_rows', 0, 'N');
INSERT INTO `r_jobentry_attribute` VALUES (20, 1, 2, 0, 'clear_files', 0, 'N');
INSERT INTO `r_jobentry_attribute` VALUES (21, 1, 2, 0, 'set_logfile', 0, 'N');
INSERT INTO `r_jobentry_attribute` VALUES (22, 1, 2, 0, 'add_date', 0, 'N');
INSERT INTO `r_jobentry_attribute` VALUES (23, 1, 2, 0, 'add_time', 0, 'N');
INSERT INTO `r_jobentry_attribute` VALUES (24, 1, 2, 0, 'logfile', 0, NULL);
INSERT INTO `r_jobentry_attribute` VALUES (25, 1, 2, 0, 'logext', 0, NULL);
INSERT INTO `r_jobentry_attribute` VALUES (26, 1, 2, 0, 'loglevel', 0, 'Basic');
INSERT INTO `r_jobentry_attribute` VALUES (27, 1, 2, 0, 'cluster', 0, 'N');
INSERT INTO `r_jobentry_attribute` VALUES (28, 1, 2, 0, 'slave_server_name', 0, NULL);
INSERT INTO `r_jobentry_attribute` VALUES (29, 1, 2, 0, 'set_append_logfile', 0, 'N');
INSERT INTO `r_jobentry_attribute` VALUES (30, 1, 2, 0, 'wait_until_finished', 0, 'Y');
INSERT INTO `r_jobentry_attribute` VALUES (31, 1, 2, 0, 'follow_abort_remote', 0, 'N');
INSERT INTO `r_jobentry_attribute` VALUES (32, 1, 2, 0, 'create_parent_folder', 0, 'N');
INSERT INTO `r_jobentry_attribute` VALUES (33, 1, 2, 0, 'logging_remote_work', 0, 'N');
INSERT INTO `r_jobentry_attribute` VALUES (34, 1, 2, 0, 'pass_all_parameters', 0, 'Y');
INSERT INTO `r_jobentry_attribute` VALUES (35, 1, 3, 0, 'specification_method', 0, 'rep_name');
INSERT INTO `r_jobentry_attribute` VALUES (36, 1, 3, 0, 'trans_object_id', 0, NULL);
INSERT INTO `r_jobentry_attribute` VALUES (37, 1, 3, 0, 'name', 0, 'm_indicators');
INSERT INTO `r_jobentry_attribute` VALUES (38, 1, 3, 0, 'dir_path', 0, '/');
INSERT INTO `r_jobentry_attribute` VALUES (39, 1, 3, 0, 'file_name', 0, NULL);
INSERT INTO `r_jobentry_attribute` VALUES (40, 1, 3, 0, 'arg_from_previous', 0, 'N');
INSERT INTO `r_jobentry_attribute` VALUES (41, 1, 3, 0, 'params_from_previous', 0, 'N');
INSERT INTO `r_jobentry_attribute` VALUES (42, 1, 3, 0, 'exec_per_row', 0, 'N');
INSERT INTO `r_jobentry_attribute` VALUES (43, 1, 3, 0, 'clear_rows', 0, 'N');
INSERT INTO `r_jobentry_attribute` VALUES (44, 1, 3, 0, 'clear_files', 0, 'N');
INSERT INTO `r_jobentry_attribute` VALUES (45, 1, 3, 0, 'set_logfile', 0, 'N');
INSERT INTO `r_jobentry_attribute` VALUES (46, 1, 3, 0, 'add_date', 0, 'N');
INSERT INTO `r_jobentry_attribute` VALUES (47, 1, 3, 0, 'add_time', 0, 'N');
INSERT INTO `r_jobentry_attribute` VALUES (48, 1, 3, 0, 'logfile', 0, NULL);
INSERT INTO `r_jobentry_attribute` VALUES (49, 1, 3, 0, 'logext', 0, NULL);
INSERT INTO `r_jobentry_attribute` VALUES (50, 1, 3, 0, 'loglevel', 0, 'Basic');
INSERT INTO `r_jobentry_attribute` VALUES (51, 1, 3, 0, 'cluster', 0, 'N');
INSERT INTO `r_jobentry_attribute` VALUES (52, 1, 3, 0, 'slave_server_name', 0, NULL);
INSERT INTO `r_jobentry_attribute` VALUES (53, 1, 3, 0, 'set_append_logfile', 0, 'N');
INSERT INTO `r_jobentry_attribute` VALUES (54, 1, 3, 0, 'wait_until_finished', 0, 'Y');
INSERT INTO `r_jobentry_attribute` VALUES (55, 1, 3, 0, 'follow_abort_remote', 0, 'N');
INSERT INTO `r_jobentry_attribute` VALUES (56, 1, 3, 0, 'create_parent_folder', 0, 'N');
INSERT INTO `r_jobentry_attribute` VALUES (57, 1, 3, 0, 'logging_remote_work', 0, 'N');
INSERT INTO `r_jobentry_attribute` VALUES (58, 1, 3, 0, 'pass_all_parameters', 0, 'Y');
INSERT INTO `r_jobentry_attribute` VALUES (59, 1, 4, 0, 'specification_method', 0, 'rep_name');
INSERT INTO `r_jobentry_attribute` VALUES (60, 1, 4, 0, 'trans_object_id', 0, NULL);
INSERT INTO `r_jobentry_attribute` VALUES (61, 1, 4, 0, 'name', 0, 'itec_report_project');
INSERT INTO `r_jobentry_attribute` VALUES (62, 1, 4, 0, 'dir_path', 0, '/');
INSERT INTO `r_jobentry_attribute` VALUES (63, 1, 4, 0, 'file_name', 0, NULL);
INSERT INTO `r_jobentry_attribute` VALUES (64, 1, 4, 0, 'arg_from_previous', 0, 'N');
INSERT INTO `r_jobentry_attribute` VALUES (65, 1, 4, 0, 'params_from_previous', 0, 'N');
INSERT INTO `r_jobentry_attribute` VALUES (66, 1, 4, 0, 'exec_per_row', 0, 'N');
INSERT INTO `r_jobentry_attribute` VALUES (67, 1, 4, 0, 'clear_rows', 0, 'N');
INSERT INTO `r_jobentry_attribute` VALUES (68, 1, 4, 0, 'clear_files', 0, 'N');
INSERT INTO `r_jobentry_attribute` VALUES (69, 1, 4, 0, 'set_logfile', 0, 'N');
INSERT INTO `r_jobentry_attribute` VALUES (70, 1, 4, 0, 'add_date', 0, 'N');
INSERT INTO `r_jobentry_attribute` VALUES (71, 1, 4, 0, 'add_time', 0, 'N');
INSERT INTO `r_jobentry_attribute` VALUES (72, 1, 4, 0, 'logfile', 0, NULL);
INSERT INTO `r_jobentry_attribute` VALUES (73, 1, 4, 0, 'logext', 0, NULL);
INSERT INTO `r_jobentry_attribute` VALUES (74, 1, 4, 0, 'loglevel', 0, 'Basic');
INSERT INTO `r_jobentry_attribute` VALUES (75, 1, 4, 0, 'cluster', 0, 'N');
INSERT INTO `r_jobentry_attribute` VALUES (76, 1, 4, 0, 'slave_server_name', 0, NULL);
INSERT INTO `r_jobentry_attribute` VALUES (77, 1, 4, 0, 'set_append_logfile', 0, 'N');
INSERT INTO `r_jobentry_attribute` VALUES (78, 1, 4, 0, 'wait_until_finished', 0, 'Y');
INSERT INTO `r_jobentry_attribute` VALUES (79, 1, 4, 0, 'follow_abort_remote', 0, 'N');
INSERT INTO `r_jobentry_attribute` VALUES (80, 1, 4, 0, 'create_parent_folder', 0, 'N');
INSERT INTO `r_jobentry_attribute` VALUES (81, 1, 4, 0, 'logging_remote_work', 0, 'N');
INSERT INTO `r_jobentry_attribute` VALUES (82, 1, 4, 0, 'pass_all_parameters', 0, 'Y');
INSERT INTO `r_jobentry_attribute` VALUES (83, 1, 6, 0, 'specification_method', 0, 'rep_name');
INSERT INTO `r_jobentry_attribute` VALUES (84, 1, 6, 0, 'trans_object_id', 0, NULL);
INSERT INTO `r_jobentry_attribute` VALUES (85, 1, 6, 0, 'name', 0, 'UpdateFinishJob');
INSERT INTO `r_jobentry_attribute` VALUES (86, 1, 6, 0, 'dir_path', 0, '/');
INSERT INTO `r_jobentry_attribute` VALUES (87, 1, 6, 0, 'file_name', 0, NULL);
INSERT INTO `r_jobentry_attribute` VALUES (88, 1, 6, 0, 'arg_from_previous', 0, 'N');
INSERT INTO `r_jobentry_attribute` VALUES (89, 1, 6, 0, 'params_from_previous', 0, 'N');
INSERT INTO `r_jobentry_attribute` VALUES (90, 1, 6, 0, 'exec_per_row', 0, 'N');
INSERT INTO `r_jobentry_attribute` VALUES (91, 1, 6, 0, 'clear_rows', 0, 'N');
INSERT INTO `r_jobentry_attribute` VALUES (92, 1, 6, 0, 'clear_files', 0, 'N');
INSERT INTO `r_jobentry_attribute` VALUES (93, 1, 6, 0, 'set_logfile', 0, 'N');
INSERT INTO `r_jobentry_attribute` VALUES (94, 1, 6, 0, 'add_date', 0, 'N');
INSERT INTO `r_jobentry_attribute` VALUES (95, 1, 6, 0, 'add_time', 0, 'N');
INSERT INTO `r_jobentry_attribute` VALUES (96, 1, 6, 0, 'logfile', 0, NULL);
INSERT INTO `r_jobentry_attribute` VALUES (97, 1, 6, 0, 'logext', 0, NULL);
INSERT INTO `r_jobentry_attribute` VALUES (98, 1, 6, 0, 'loglevel', 0, 'Basic');
INSERT INTO `r_jobentry_attribute` VALUES (99, 1, 6, 0, 'cluster', 0, 'N');
INSERT INTO `r_jobentry_attribute` VALUES (100, 1, 6, 0, 'slave_server_name', 0, NULL);
INSERT INTO `r_jobentry_attribute` VALUES (101, 1, 6, 0, 'set_append_logfile', 0, 'N');
INSERT INTO `r_jobentry_attribute` VALUES (102, 1, 6, 0, 'wait_until_finished', 0, 'Y');
INSERT INTO `r_jobentry_attribute` VALUES (103, 1, 6, 0, 'follow_abort_remote', 0, 'N');
INSERT INTO `r_jobentry_attribute` VALUES (104, 1, 6, 0, 'create_parent_folder', 0, 'N');
INSERT INTO `r_jobentry_attribute` VALUES (105, 1, 6, 0, 'logging_remote_work', 0, 'N');
INSERT INTO `r_jobentry_attribute` VALUES (106, 1, 6, 0, 'pass_all_parameters', 0, 'Y');
INSERT INTO `r_jobentry_attribute` VALUES (107, 1, 7, 0, 'message', 0, NULL);
INSERT INTO `r_jobentry_attribute` VALUES (108, 1, 8, 0, 'specification_method', 0, 'rep_name');
INSERT INTO `r_jobentry_attribute` VALUES (109, 1, 8, 0, 'trans_object_id', 0, NULL);
INSERT INTO `r_jobentry_attribute` VALUES (110, 1, 8, 0, 'name', 0, 'StartJob');
INSERT INTO `r_jobentry_attribute` VALUES (111, 1, 8, 0, 'dir_path', 0, '/');
INSERT INTO `r_jobentry_attribute` VALUES (112, 1, 8, 0, 'file_name', 0, NULL);
INSERT INTO `r_jobentry_attribute` VALUES (113, 1, 8, 0, 'arg_from_previous', 0, 'N');
INSERT INTO `r_jobentry_attribute` VALUES (114, 1, 8, 0, 'params_from_previous', 0, 'N');
INSERT INTO `r_jobentry_attribute` VALUES (115, 1, 8, 0, 'exec_per_row', 0, 'N');
INSERT INTO `r_jobentry_attribute` VALUES (116, 1, 8, 0, 'clear_rows', 0, 'N');
INSERT INTO `r_jobentry_attribute` VALUES (117, 1, 8, 0, 'clear_files', 0, 'N');
INSERT INTO `r_jobentry_attribute` VALUES (118, 1, 8, 0, 'set_logfile', 0, 'N');
INSERT INTO `r_jobentry_attribute` VALUES (119, 1, 8, 0, 'add_date', 0, 'N');
INSERT INTO `r_jobentry_attribute` VALUES (120, 1, 8, 0, 'add_time', 0, 'N');
INSERT INTO `r_jobentry_attribute` VALUES (121, 1, 8, 0, 'logfile', 0, NULL);
INSERT INTO `r_jobentry_attribute` VALUES (122, 1, 8, 0, 'logext', 0, NULL);
INSERT INTO `r_jobentry_attribute` VALUES (123, 1, 8, 0, 'loglevel', 0, 'Basic');
INSERT INTO `r_jobentry_attribute` VALUES (124, 1, 8, 0, 'cluster', 0, 'N');
INSERT INTO `r_jobentry_attribute` VALUES (125, 1, 8, 0, 'slave_server_name', 0, NULL);
INSERT INTO `r_jobentry_attribute` VALUES (126, 1, 8, 0, 'set_append_logfile', 0, 'N');
INSERT INTO `r_jobentry_attribute` VALUES (127, 1, 8, 0, 'wait_until_finished', 0, 'Y');
INSERT INTO `r_jobentry_attribute` VALUES (128, 1, 8, 0, 'follow_abort_remote', 0, 'N');
INSERT INTO `r_jobentry_attribute` VALUES (129, 1, 8, 0, 'create_parent_folder', 0, 'N');
INSERT INTO `r_jobentry_attribute` VALUES (130, 1, 8, 0, 'logging_remote_work', 0, 'N');
INSERT INTO `r_jobentry_attribute` VALUES (131, 1, 8, 0, 'pass_all_parameters', 0, 'Y');
INSERT INTO `r_jobentry_attribute` VALUES (132, 1, 9, 0, 'foldername', 0, 'C:\\ETL Report');
INSERT INTO `r_jobentry_attribute` VALUES (133, 1, 9, 0, 'include_subfolders', 0, 'N');
INSERT INTO `r_jobentry_attribute` VALUES (134, 1, 9, 0, 'specify_wildcard', 0, 'N');
INSERT INTO `r_jobentry_attribute` VALUES (135, 1, 9, 0, 'wildcard', 0, NULL);
INSERT INTO `r_jobentry_attribute` VALUES (136, 1, 10, 0, 'foldername', 0, 'C:\\ETL Report');
INSERT INTO `r_jobentry_attribute` VALUES (137, 1, 10, 0, 'include_subfolders', 0, 'N');
INSERT INTO `r_jobentry_attribute` VALUES (138, 1, 10, 0, 'specify_wildcard', 0, 'N');
INSERT INTO `r_jobentry_attribute` VALUES (139, 1, 10, 0, 'wildcard', 0, NULL);
INSERT INTO `r_jobentry_attribute` VALUES (140, 1, 11, 0, 'foldername', 0, 'C:\\ETL Report');
INSERT INTO `r_jobentry_attribute` VALUES (141, 1, 11, 0, 'include_subfolders', 0, 'N');
INSERT INTO `r_jobentry_attribute` VALUES (142, 1, 11, 0, 'specify_wildcard', 0, 'N');
INSERT INTO `r_jobentry_attribute` VALUES (143, 1, 11, 0, 'wildcard', 0, NULL);

-- ----------------------------
-- Table structure for r_jobentry_copy
-- ----------------------------
DROP TABLE IF EXISTS `r_jobentry_copy`;
CREATE TABLE `r_jobentry_copy`  (
  `ID_JOBENTRY_COPY` bigint(20) NOT NULL,
  `ID_JOBENTRY` int(11) NULL DEFAULT NULL,
  `ID_JOB` int(11) NULL DEFAULT NULL,
  `ID_JOBENTRY_TYPE` int(11) NULL DEFAULT NULL,
  `NR` int(11) NULL DEFAULT NULL,
  `GUI_LOCATION_X` int(11) NULL DEFAULT NULL,
  `GUI_LOCATION_Y` int(11) NULL DEFAULT NULL,
  `GUI_DRAW` tinyint(1) NULL DEFAULT NULL,
  `PARALLEL` tinyint(1) NULL DEFAULT NULL,
  PRIMARY KEY (`ID_JOBENTRY_COPY`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of r_jobentry_copy
-- ----------------------------
INSERT INTO `r_jobentry_copy` VALUES (1, 1, 1, 67, 0, 92, 241, 1, 0);
INSERT INTO `r_jobentry_copy` VALUES (2, 2, 1, 77, 0, 358, 241, 1, 0);
INSERT INTO `r_jobentry_copy` VALUES (3, 3, 1, 77, 0, 485, 241, 1, 0);
INSERT INTO `r_jobentry_copy` VALUES (4, 4, 1, 77, 0, 618, 241, 1, 0);
INSERT INTO `r_jobentry_copy` VALUES (5, 5, 1, 73, 0, 914, 241, 1, 0);
INSERT INTO `r_jobentry_copy` VALUES (6, 6, 1, 77, 0, 758, 241, 1, 0);
INSERT INTO `r_jobentry_copy` VALUES (7, 7, 1, 1, 0, 485, 412, 1, 0);
INSERT INTO `r_jobentry_copy` VALUES (8, 8, 1, 77, 0, 221, 241, 1, 0);
INSERT INTO `r_jobentry_copy` VALUES (9, 9, 1, 10, 0, 321, 124, 1, 0);
INSERT INTO `r_jobentry_copy` VALUES (10, 10, 1, 10, 0, 494, 123, 1, 0);
INSERT INTO `r_jobentry_copy` VALUES (11, 11, 1, 10, 0, 671, 122, 1, 0);

-- ----------------------------
-- Table structure for r_jobentry_database
-- ----------------------------
DROP TABLE IF EXISTS `r_jobentry_database`;
CREATE TABLE `r_jobentry_database`  (
  `ID_JOB` int(11) NULL DEFAULT NULL,
  `ID_JOBENTRY` int(11) NULL DEFAULT NULL,
  `ID_DATABASE` int(11) NULL DEFAULT NULL,
  INDEX `IDX_RJD1`(`ID_JOB`) USING BTREE,
  INDEX `IDX_RJD2`(`ID_DATABASE`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for r_jobentry_type
-- ----------------------------
DROP TABLE IF EXISTS `r_jobentry_type`;
CREATE TABLE `r_jobentry_type`  (
  `ID_JOBENTRY_TYPE` bigint(20) NOT NULL,
  `CODE` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `DESCRIPTION` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID_JOBENTRY_TYPE`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of r_jobentry_type
-- ----------------------------
INSERT INTO `r_jobentry_type` VALUES (1, 'ABORT', 'Abort job');
INSERT INTO `r_jobentry_type` VALUES (2, 'ADD_RESULT_FILENAMES', 'Add filenames to result');
INSERT INTO `r_jobentry_type` VALUES (3, 'EMRJobExecutorPlugin', 'Amazon EMR Job Executor');
INSERT INTO `r_jobentry_type` VALUES (4, 'HiveJobExecutorPlugin', 'Amazon Hive Job Executor');
INSERT INTO `r_jobentry_type` VALUES (5, 'MYSQL_BULK_FILE', 'BulkLoad from Mysql into file');
INSERT INTO `r_jobentry_type` VALUES (6, 'MSSQL_BULK_LOAD', 'BulkLoad into MSSQL');
INSERT INTO `r_jobentry_type` VALUES (7, 'MYSQL_BULK_LOAD', 'BulkLoad into Mysql');
INSERT INTO `r_jobentry_type` VALUES (8, 'CHECK_DB_CONNECTIONS', 'Check Db connections');
INSERT INTO `r_jobentry_type` VALUES (9, 'CHECK_FILES_LOCKED', 'Check files locked');
INSERT INTO `r_jobentry_type` VALUES (10, 'FOLDER_IS_EMPTY', 'Check if a folder is empty');
INSERT INTO `r_jobentry_type` VALUES (11, 'CONNECTED_TO_REPOSITORY', 'Check if connected to repository');
INSERT INTO `r_jobentry_type` VALUES (12, 'XML_WELL_FORMED', 'Check if XML file is well formed');
INSERT INTO `r_jobentry_type` VALUES (13, 'WEBSERVICE_AVAILABLE', 'Check webservice availability');
INSERT INTO `r_jobentry_type` VALUES (14, 'FILES_EXIST', 'Checks if files exist');
INSERT INTO `r_jobentry_type` VALUES (15, 'COLUMNS_EXIST', 'Columns exist in a table');
INSERT INTO `r_jobentry_type` VALUES (16, 'FOLDERS_COMPARE', 'Compare folders');
INSERT INTO `r_jobentry_type` VALUES (17, 'DOS_UNIX_CONVERTER', 'Convert file between Windows and Unix');
INSERT INTO `r_jobentry_type` VALUES (18, 'COPY_FILES', 'Copy Files');
INSERT INTO `r_jobentry_type` VALUES (19, 'CREATE_FOLDER', 'Create a folder');
INSERT INTO `r_jobentry_type` VALUES (20, 'CREATE_FILE', 'Create file');
INSERT INTO `r_jobentry_type` VALUES (21, 'PGP_DECRYPT_FILES', 'Decrypt files with PGP');
INSERT INTO `r_jobentry_type` VALUES (22, 'DELETE_FILE', 'Delete file');
INSERT INTO `r_jobentry_type` VALUES (23, 'DELETE_RESULT_FILENAMES', 'Delete filenames from result');
INSERT INTO `r_jobentry_type` VALUES (24, 'DELETE_FILES', 'Delete files');
INSERT INTO `r_jobentry_type` VALUES (25, 'DELETE_FOLDERS', 'Delete folders');
INSERT INTO `r_jobentry_type` VALUES (26, 'MSGBOX_INFO', 'Display Msgbox Info');
INSERT INTO `r_jobentry_type` VALUES (27, 'DTD_VALIDATOR', 'DTD Validator');
INSERT INTO `r_jobentry_type` VALUES (28, 'PGP_ENCRYPT_FILES', 'Encrypt files with PGP');
INSERT INTO `r_jobentry_type` VALUES (29, 'EVAL_FILES_METRICS', 'Evaluate files metrics');
INSERT INTO `r_jobentry_type` VALUES (30, 'EVAL_TABLE_CONTENT', 'Evaluate rows number in a table');
INSERT INTO `r_jobentry_type` VALUES (31, 'DummyJob', 'Example plugin');
INSERT INTO `r_jobentry_type` VALUES (32, 'EXPORT_REPOSITORY', 'Export repository to XML file');
INSERT INTO `r_jobentry_type` VALUES (33, 'FILE_COMPARE', 'File Compare');
INSERT INTO `r_jobentry_type` VALUES (34, 'FILE_EXISTS', 'File Exists');
INSERT INTO `r_jobentry_type` VALUES (35, 'FTP_DELETE', 'FTP Delete');
INSERT INTO `r_jobentry_type` VALUES (36, 'FTP', 'Get a file with FTP');
INSERT INTO `r_jobentry_type` VALUES (37, 'FTPS_GET', 'Get a file with FTPS');
INSERT INTO `r_jobentry_type` VALUES (38, 'SFTP', 'Get a file with SFTP');
INSERT INTO `r_jobentry_type` VALUES (39, 'GET_POP', 'Get mails (POP3/IMAP)');
INSERT INTO `r_jobentry_type` VALUES (40, 'HadoopCopyFilesPlugin', 'Hadoop Copy Files');
INSERT INTO `r_jobentry_type` VALUES (41, 'HadoopJobExecutorPlugin', 'Hadoop Job Executor ');
INSERT INTO `r_jobentry_type` VALUES (42, 'HL7MLLPAcknowledge', 'HL7 MLLP Acknowledge');
INSERT INTO `r_jobentry_type` VALUES (43, 'HL7MLLPInput', 'HL7 MLLP Input');
INSERT INTO `r_jobentry_type` VALUES (44, 'HTTP', 'HTTP');
INSERT INTO `r_jobentry_type` VALUES (45, 'EVAL', 'JavaScript');
INSERT INTO `r_jobentry_type` VALUES (46, 'JOB', 'Job');
INSERT INTO `r_jobentry_type` VALUES (47, 'MAIL', 'Mail');
INSERT INTO `r_jobentry_type` VALUES (48, 'MAIL_VALIDATOR', 'Mail validator');
INSERT INTO `r_jobentry_type` VALUES (49, 'MOVE_FILES', 'Move Files');
INSERT INTO `r_jobentry_type` VALUES (50, 'MS_ACCESS_BULK_LOAD', 'MS Access Bulk Load');
INSERT INTO `r_jobentry_type` VALUES (51, 'OozieJobExecutor', 'Oozie Job Executor');
INSERT INTO `r_jobentry_type` VALUES (52, 'PALO_CUBE_CREATE', 'Palo Cube Create');
INSERT INTO `r_jobentry_type` VALUES (53, 'PALO_CUBE_DELETE', 'Palo Cube Delete');
INSERT INTO `r_jobentry_type` VALUES (54, 'HadoopTransJobExecutorPlugin', 'Pentaho MapReduce');
INSERT INTO `r_jobentry_type` VALUES (55, 'HadoopPigScriptExecutorPlugin', 'Pig Script Executor');
INSERT INTO `r_jobentry_type` VALUES (56, 'PING', 'Ping a host');
INSERT INTO `r_jobentry_type` VALUES (57, 'COPY_MOVE_RESULT_FILENAMES', 'Process result filenames');
INSERT INTO `r_jobentry_type` VALUES (58, 'FTP_PUT', 'Put a file with FTP');
INSERT INTO `r_jobentry_type` VALUES (59, 'SFTPPUT', 'Put a file with SFTP');
INSERT INTO `r_jobentry_type` VALUES (60, 'SYSLOG', 'Send information using Syslog');
INSERT INTO `r_jobentry_type` VALUES (61, 'SEND_NAGIOS_PASSIVE_CHECK', 'Send Nagios passive check');
INSERT INTO `r_jobentry_type` VALUES (62, 'SNMP_TRAP', 'Send SNMP trap');
INSERT INTO `r_jobentry_type` VALUES (63, 'SET_VARIABLES', 'Set variables');
INSERT INTO `r_jobentry_type` VALUES (64, 'SHELL', 'Shell');
INSERT INTO `r_jobentry_type` VALUES (65, 'SIMPLE_EVAL', 'Simple evaluation');
INSERT INTO `r_jobentry_type` VALUES (66, 'SparkSubmit', 'Spark Submit');
INSERT INTO `r_jobentry_type` VALUES (67, 'SPECIAL', 'Special entries');
INSERT INTO `r_jobentry_type` VALUES (68, 'SQL', 'SQL');
INSERT INTO `r_jobentry_type` VALUES (69, 'SqoopExport', 'Sqoop Export');
INSERT INTO `r_jobentry_type` VALUES (70, 'SqoopImport', 'Sqoop Import');
INSERT INTO `r_jobentry_type` VALUES (71, 'SSH2_GET', 'SSH2 Get');
INSERT INTO `r_jobentry_type` VALUES (72, 'SSH2_PUT', 'SSH2 Put');
INSERT INTO `r_jobentry_type` VALUES (73, 'SUCCESS', 'Success');
INSERT INTO `r_jobentry_type` VALUES (74, 'TABLE_EXISTS', 'Table exists');
INSERT INTO `r_jobentry_type` VALUES (75, 'TALEND_JOB_EXEC', 'Talend Job Execution');
INSERT INTO `r_jobentry_type` VALUES (76, 'TELNET', 'Telnet a host');
INSERT INTO `r_jobentry_type` VALUES (77, 'TRANS', 'Transformation');
INSERT INTO `r_jobentry_type` VALUES (78, 'TRUNCATE_TABLES', 'Truncate tables');
INSERT INTO `r_jobentry_type` VALUES (79, 'UNZIP', 'Unzip file');
INSERT INTO `r_jobentry_type` VALUES (80, 'FTPS_PUT', 'Upload files to FTPS');
INSERT INTO `r_jobentry_type` VALUES (81, 'PGP_VERIFY_FILES', 'Verify file signature with PGP');
INSERT INTO `r_jobentry_type` VALUES (82, 'DELAY', 'Wait for');
INSERT INTO `r_jobentry_type` VALUES (83, 'WAIT_FOR_FILE', 'Wait for file');
INSERT INTO `r_jobentry_type` VALUES (84, 'WAIT_FOR_SQL', 'Wait for SQL');
INSERT INTO `r_jobentry_type` VALUES (85, 'WRITE_TO_FILE', 'Write to file');
INSERT INTO `r_jobentry_type` VALUES (86, 'WRITE_TO_LOG', 'Write To Log');
INSERT INTO `r_jobentry_type` VALUES (87, 'XSD_VALIDATOR', 'XSD Validator');
INSERT INTO `r_jobentry_type` VALUES (88, 'XSLT', 'XSL Transformation');
INSERT INTO `r_jobentry_type` VALUES (89, 'ZIP_FILE', 'Zip file');

-- ----------------------------
-- Table structure for r_log
-- ----------------------------
DROP TABLE IF EXISTS `r_log`;
CREATE TABLE `r_log`  (
  `ID_LOG` bigint(20) NOT NULL,
  `NAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ID_LOGLEVEL` int(11) NULL DEFAULT NULL,
  `LOGTYPE` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `FILENAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `FILEEXTENTION` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ADD_DATE` tinyint(1) NULL DEFAULT NULL,
  `ADD_TIME` tinyint(1) NULL DEFAULT NULL,
  `ID_DATABASE_LOG` int(11) NULL DEFAULT NULL,
  `TABLE_NAME_LOG` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID_LOG`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for r_loglevel
-- ----------------------------
DROP TABLE IF EXISTS `r_loglevel`;
CREATE TABLE `r_loglevel`  (
  `ID_LOGLEVEL` bigint(20) NOT NULL,
  `CODE` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `DESCRIPTION` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID_LOGLEVEL`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of r_loglevel
-- ----------------------------
INSERT INTO `r_loglevel` VALUES (1, 'Error', 'Error logging only');
INSERT INTO `r_loglevel` VALUES (2, 'Minimal', 'Minimal logging');
INSERT INTO `r_loglevel` VALUES (3, 'Basic', 'Basic logging');
INSERT INTO `r_loglevel` VALUES (4, 'Detailed', 'Detailed logging');
INSERT INTO `r_loglevel` VALUES (5, 'Debug', 'Debugging');
INSERT INTO `r_loglevel` VALUES (6, 'Rowlevel', 'Rowlevel (very detailed)');

-- ----------------------------
-- Table structure for r_namespace
-- ----------------------------
DROP TABLE IF EXISTS `r_namespace`;
CREATE TABLE `r_namespace`  (
  `ID_NAMESPACE` bigint(20) NOT NULL,
  `NAME` mediumtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  PRIMARY KEY (`ID_NAMESPACE`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for r_note
-- ----------------------------
DROP TABLE IF EXISTS `r_note`;
CREATE TABLE `r_note`  (
  `ID_NOTE` bigint(20) NOT NULL,
  `VALUE_STR` mediumtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `GUI_LOCATION_X` int(11) NULL DEFAULT NULL,
  `GUI_LOCATION_Y` int(11) NULL DEFAULT NULL,
  `GUI_LOCATION_WIDTH` int(11) NULL DEFAULT NULL,
  `GUI_LOCATION_HEIGHT` int(11) NULL DEFAULT NULL,
  `FONT_NAME` mediumtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `FONT_SIZE` int(11) NULL DEFAULT NULL,
  `FONT_BOLD` tinyint(1) NULL DEFAULT NULL,
  `FONT_ITALIC` tinyint(1) NULL DEFAULT NULL,
  `FONT_COLOR_RED` int(11) NULL DEFAULT NULL,
  `FONT_COLOR_GREEN` int(11) NULL DEFAULT NULL,
  `FONT_COLOR_BLUE` int(11) NULL DEFAULT NULL,
  `FONT_BACK_GROUND_COLOR_RED` int(11) NULL DEFAULT NULL,
  `FONT_BACK_GROUND_COLOR_GREEN` int(11) NULL DEFAULT NULL,
  `FONT_BACK_GROUND_COLOR_BLUE` int(11) NULL DEFAULT NULL,
  `FONT_BORDER_COLOR_RED` int(11) NULL DEFAULT NULL,
  `FONT_BORDER_COLOR_GREEN` int(11) NULL DEFAULT NULL,
  `FONT_BORDER_COLOR_BLUE` int(11) NULL DEFAULT NULL,
  `DRAW_SHADOW` tinyint(1) NULL DEFAULT NULL,
  PRIMARY KEY (`ID_NOTE`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of r_note
-- ----------------------------
INSERT INTO `r_note` VALUES (6, '1. select now job start\r\n2. now datetime finish job\r\n3. update datetime finish job to now job start', 578, 95, 248, 58, 'Segoe UI', 9, 0, 0, 0, 0, 0, 255, 205, 112, 100, 100, 100, 1);
INSERT INTO `r_note` VALUES (11, '1. sql insert name job\r\n2. select now run job\r\n3. java select date time\r\n4. update date time for now run job', 328, 48, 198, 74, 'Segoe UI', 9, 0, 0, 0, 0, 0, 255, 205, 112, 100, 100, 100, 1);
INSERT INTO `r_note` VALUES (13, '1. input data from sheets database\r\n2. input data \'ProjectName\'\r\n3. join \'ProjectName\' and \'ProjectName\'  (change id to name)\r\n4. change path output and new name file\r\n5. output data to table\r\n6. group data for 1 record\r\n7. move file and change new name file', 627, 327, 334, 122, 'Segoe UI', 9, 0, 0, 0, 0, 0, 255, 205, 112, 100, 100, 100, 1);
INSERT INTO `r_note` VALUES (15, '1. drop table \'itec_report_project\'\r\n2. input data from excel\r\n3. change path output and new name file \r\n4. output data to table\r\n5. group data for 1 record\r\n6. move file and change new name file\r\n7. recreate teble \'itec_report_project\'\r\n\r\n** truncate table don\'t success then this table \'PK\'\r\nSolutions\r\n- drop FK from table have relationship this table \r\n- truncate table\r\n- recreate FK this table\r\n[** but, don\'t drop FK . So drop table and recreate table]', 375, 243, 303, 233, 'Segoe UI', 9, 0, 0, 0, 0, 0, 255, 205, 112, 100, 100, 100, 1);
INSERT INTO `r_note` VALUES (17, '1. input data from excel \r\n2. change path output (move file, new name file)\r\n3. output data to database\r\n4. group data for 1 record\r\n ------ insert ------\r\n  1) make name job and datetime start job\r\n  2) output table for start job\r\n ------ insert ------\r\n5. move file (change name file [new name])\r\n\r\n** move file don\'t success if data > 1 record\r\nbecause, data 2 record , ETL move file 2 times', 235, 198, 267, 201, 'Segoe UI', 9, 0, 0, 0, 0, 0, 255, 205, 112, 100, 100, 100, 1);
INSERT INTO `r_note` VALUES (18, '1. insert data 2.2 and input data start job \r\n2. insert data 2.4 [because manage table \'itec_report_project\' from 2.3]\r\n3. insert data 2.3\r\n4. update datetime finish job\r\n\r\n** then transformation error : stop job \r\n(datetime finish is null)', 632, 486, 378, 121, 'Segoe UI', 9, 0, 0, 0, 0, 0, 255, 205, 112, 100, 100, 100, 1);

-- ----------------------------
-- Table structure for r_partition
-- ----------------------------
DROP TABLE IF EXISTS `r_partition`;
CREATE TABLE `r_partition`  (
  `ID_PARTITION` bigint(20) NOT NULL,
  `ID_PARTITION_SCHEMA` int(11) NULL DEFAULT NULL,
  `PARTITION_ID` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID_PARTITION`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for r_partition_schema
-- ----------------------------
DROP TABLE IF EXISTS `r_partition_schema`;
CREATE TABLE `r_partition_schema`  (
  `ID_PARTITION_SCHEMA` bigint(20) NOT NULL,
  `NAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `DYNAMIC_DEFINITION` tinyint(1) NULL DEFAULT NULL,
  `PARTITIONS_PER_SLAVE` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID_PARTITION_SCHEMA`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for r_repository_log
-- ----------------------------
DROP TABLE IF EXISTS `r_repository_log`;
CREATE TABLE `r_repository_log`  (
  `ID_REPOSITORY_LOG` bigint(20) NOT NULL,
  `REP_VERSION` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `LOG_DATE` datetime NULL DEFAULT NULL,
  `LOG_USER` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `OPERATION_DESC` mediumtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  PRIMARY KEY (`ID_REPOSITORY_LOG`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of r_repository_log
-- ----------------------------
INSERT INTO `r_repository_log` VALUES (1, '5.0', '2018-01-25 09:00:09', 'admin', 'save transformation \'itec_report_budget\'');
INSERT INTO `r_repository_log` VALUES (2, '5.0', '2018-01-25 09:01:02', 'admin', 'save transformation \'itec_report_project\'');
INSERT INTO `r_repository_log` VALUES (3, '5.0', '2018-01-25 09:01:33', 'admin', 'save transformation \'m_indicators\'');
INSERT INTO `r_repository_log` VALUES (4, '5.0', '2018-01-25 09:03:22', 'admin', 'save transformation \'itec_report_budget\'');
INSERT INTO `r_repository_log` VALUES (5, '5.0', '2018-01-25 09:11:21', 'admin', 'save transformation \'m_indicators\'');
INSERT INTO `r_repository_log` VALUES (6, '5.0', '2018-01-25 09:13:10', 'admin', 'save transformation \'m_indicators\'');
INSERT INTO `r_repository_log` VALUES (7, '5.0', '2018-01-25 09:15:23', 'admin', 'save transformation \'m_indicators\'');
INSERT INTO `r_repository_log` VALUES (8, '5.0', '2018-01-25 09:20:13', 'admin', 'save transformation \'m_indicators\'');
INSERT INTO `r_repository_log` VALUES (9, '5.0', '2018-01-25 09:22:21', 'admin', 'save transformation \'m_indicators\'');
INSERT INTO `r_repository_log` VALUES (10, '5.0', '2018-01-25 09:23:24', 'admin', 'save transformation \'m_indicators\'');
INSERT INTO `r_repository_log` VALUES (11, '5.0', '2018-01-25 09:25:07', 'admin', 'save transformation \'m_indicators\'');
INSERT INTO `r_repository_log` VALUES (12, '5.0', '2018-01-25 09:26:58', 'admin', 'save transformation \'m_indicators\'');
INSERT INTO `r_repository_log` VALUES (13, '5.0', '2018-01-25 09:27:35', 'admin', 'save transformation \'m_indicators\'');
INSERT INTO `r_repository_log` VALUES (14, '5.0', '2018-01-25 09:29:30', 'admin', 'save transformation \'m_indicators\'');
INSERT INTO `r_repository_log` VALUES (15, '5.0', '2018-01-25 09:32:32', 'admin', 'save transformation \'m_indicators\'');
INSERT INTO `r_repository_log` VALUES (16, '5.0', '2018-01-25 09:35:49', 'admin', 'save transformation \'itec_report_budget\'');
INSERT INTO `r_repository_log` VALUES (17, '5.0', '2018-01-25 09:39:30', 'admin', 'save transformation \'itec_report_project\'');
INSERT INTO `r_repository_log` VALUES (18, '5.0', '2018-01-25 09:58:18', 'admin', 'save transformation \'m_indicators\'');
INSERT INTO `r_repository_log` VALUES (19, '5.0', '2018-01-25 09:59:13', 'admin', 'save transformation \'m_indicators\'');
INSERT INTO `r_repository_log` VALUES (20, '5.0', '2018-01-25 10:19:54', 'admin', 'save job \'JobQsdsReport\'');
INSERT INTO `r_repository_log` VALUES (21, '5.0', '2018-01-25 10:23:57', 'admin', 'save transformation \'m_indicators\'');
INSERT INTO `r_repository_log` VALUES (22, '5.0', '2018-01-25 10:30:22', 'admin', 'save transformation \'m_indicators\'');
INSERT INTO `r_repository_log` VALUES (23, '5.0', '2018-01-25 10:31:26', 'admin', 'save transformation \'m_indicators\'');
INSERT INTO `r_repository_log` VALUES (24, '5.0', '2018-01-25 10:36:40', 'admin', 'save transformation \'m_indicators\'');
INSERT INTO `r_repository_log` VALUES (25, '5.0', '2018-01-25 10:38:07', 'admin', 'save job \'JobQsdsReport\'');
INSERT INTO `r_repository_log` VALUES (26, '5.0', '2018-01-25 11:39:42', 'admin', 'save transformation \'itec_report_budget\'');
INSERT INTO `r_repository_log` VALUES (27, '5.0', '2018-01-25 11:45:47', 'admin', 'save job \'JobQsdsReport\'');
INSERT INTO `r_repository_log` VALUES (28, '5.0', '2018-01-25 14:23:44', 'admin', 'save transformation \'itec_report_budget\'');
INSERT INTO `r_repository_log` VALUES (29, '5.0', '2018-01-25 14:26:36', 'admin', 'save transformation \'itec_report_budget\'');
INSERT INTO `r_repository_log` VALUES (30, '5.0', '2018-01-25 14:29:51', 'admin', 'save transformation \'itec_report_budget\'');
INSERT INTO `r_repository_log` VALUES (31, '5.0', '2018-01-25 14:32:58', 'admin', 'save transformation \'UpdateFinishJob\'');
INSERT INTO `r_repository_log` VALUES (32, '5.0', '2018-01-25 14:34:08', 'admin', 'save transformation \'UpdateFinishJob\'');
INSERT INTO `r_repository_log` VALUES (33, '5.0', '2018-01-25 14:35:36', 'admin', 'save transformation \'itec_report_budget\'');
INSERT INTO `r_repository_log` VALUES (34, '5.0', '2018-01-25 14:41:28', 'admin', 'save job \'JobQsdsReport\'');
INSERT INTO `r_repository_log` VALUES (35, '5.0', '2018-01-25 14:44:58', 'admin', 'save transformation \'itec_report_budget\'');
INSERT INTO `r_repository_log` VALUES (36, '5.0', '2018-01-25 14:47:09', 'admin', 'save transformation \'itec_report_budget\'');
INSERT INTO `r_repository_log` VALUES (37, '5.0', '2018-01-25 14:47:12', 'admin', 'save transformation \'UpdateFinishJob\'');
INSERT INTO `r_repository_log` VALUES (38, '5.0', '2018-01-25 14:47:14', 'admin', 'save job \'JobQsdsReport\'');
INSERT INTO `r_repository_log` VALUES (39, '5.0', '2018-01-25 14:56:09', 'admin', 'save transformation \'itec_report_budget\'');
INSERT INTO `r_repository_log` VALUES (40, '5.0', '2018-01-25 15:02:58', 'admin', 'save job \'JobQsdsReport\'');
INSERT INTO `r_repository_log` VALUES (41, '5.0', '2018-01-25 15:03:35', 'admin', 'save transformation \'UpdateFinishJob\'');
INSERT INTO `r_repository_log` VALUES (42, '5.0', '2018-01-25 16:17:41', 'admin', 'save job \'JobQsdsReport\'');
INSERT INTO `r_repository_log` VALUES (43, '5.0', '2018-01-25 16:23:50', 'admin', 'save transformation \'test\'');
INSERT INTO `r_repository_log` VALUES (44, '5.0', '2018-01-25 16:24:32', 'admin', 'save transformation \'test\'');
INSERT INTO `r_repository_log` VALUES (45, '5.0', '2018-01-25 16:26:39', 'admin', 'save transformation \'test\'');
INSERT INTO `r_repository_log` VALUES (46, '5.0', '2018-01-25 16:28:58', 'admin', 'save transformation \'test\'');
INSERT INTO `r_repository_log` VALUES (47, '5.0', '2018-01-25 16:29:16', 'admin', 'save transformation \'test\'');
INSERT INTO `r_repository_log` VALUES (48, '5.0', '2018-01-25 18:01:46', 'admin', 'save transformation \'test\'');
INSERT INTO `r_repository_log` VALUES (49, '5.0', '2018-01-25 18:05:41', 'admin', 'save transformation \'test\'');
INSERT INTO `r_repository_log` VALUES (50, '5.0', '2018-01-25 18:08:01', 'admin', 'save transformation \'test\'');
INSERT INTO `r_repository_log` VALUES (51, '5.0', '2018-01-25 18:08:29', 'admin', 'save transformation \'test\'');
INSERT INTO `r_repository_log` VALUES (52, '5.0', '2018-01-26 08:58:36', 'admin', 'save transformation \'test\'');
INSERT INTO `r_repository_log` VALUES (53, '5.0', '2018-01-26 09:01:52', 'admin', 'save transformation \'test\'');
INSERT INTO `r_repository_log` VALUES (54, '5.0', '2018-01-26 09:03:37', 'admin', 'save transformation \'test\'');
INSERT INTO `r_repository_log` VALUES (55, '5.0', '2018-01-26 09:04:01', 'admin', 'Renamed from test to StartJob');
INSERT INTO `r_repository_log` VALUES (56, '5.0', '2018-01-26 09:04:28', 'admin', 'save transformation \'itec_report_budget\'');
INSERT INTO `r_repository_log` VALUES (57, '5.0', '2018-01-26 09:05:44', 'admin', 'save job \'JobQsdsReport\'');
INSERT INTO `r_repository_log` VALUES (58, '5.0', '2018-01-26 09:18:57', 'admin', 'save transformation \'StartJob\'');
INSERT INTO `r_repository_log` VALUES (59, '5.0', '2018-01-26 09:20:03', 'admin', 'save transformation \'m_indicators\'');
INSERT INTO `r_repository_log` VALUES (60, '5.0', '2018-01-26 09:20:47', 'admin', 'save transformation \'itec_report_project\'');
INSERT INTO `r_repository_log` VALUES (61, '5.0', '2018-01-26 09:23:40', 'admin', 'save transformation \'itec_report_budget\'');
INSERT INTO `r_repository_log` VALUES (62, '5.0', '2018-01-26 09:28:08', 'admin', 'save transformation \'m_indicators\'');
INSERT INTO `r_repository_log` VALUES (63, '5.0', '2018-01-26 09:32:03', 'admin', 'save transformation \'m_indicators\'');
INSERT INTO `r_repository_log` VALUES (64, '5.0', '2018-01-26 09:34:51', 'admin', 'save transformation \'m_indicators\'');
INSERT INTO `r_repository_log` VALUES (65, '5.0', '2018-01-26 09:35:49', 'admin', 'save transformation \'m_indicators\'');
INSERT INTO `r_repository_log` VALUES (66, '5.0', '2018-01-26 09:44:48', 'admin', 'save transformation \'m_indicators\'');
INSERT INTO `r_repository_log` VALUES (67, '5.0', '2018-01-26 09:52:41', 'admin', 'save transformation \'m_indicators\'');
INSERT INTO `r_repository_log` VALUES (68, '5.0', '2018-01-30 19:47:39', 'admin', 'save job \'JobQsdsReport\'');
INSERT INTO `r_repository_log` VALUES (69, '5.0', '2018-01-30 19:55:17', 'admin', 'save job \'JobQsdsReport\'');
INSERT INTO `r_repository_log` VALUES (70, '5.0', '2018-01-30 20:02:07', 'admin', 'save transformation \'itec_report_budget\'');
INSERT INTO `r_repository_log` VALUES (71, '5.0', '2018-01-30 20:14:28', 'admin', 'save job \'JobQsdsReport\'');
INSERT INTO `r_repository_log` VALUES (72, '5.0', '2018-01-30 20:15:55', 'admin', 'save job \'JobQsdsReport\'');
INSERT INTO `r_repository_log` VALUES (73, '5.0', '2018-01-30 20:18:47', 'admin', 'save job \'JobQsdsReport\'');

-- ----------------------------
-- Table structure for r_slave
-- ----------------------------
DROP TABLE IF EXISTS `r_slave`;
CREATE TABLE `r_slave`  (
  `ID_SLAVE` bigint(20) NOT NULL,
  `NAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `HOST_NAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `PORT` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `WEB_APP_NAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `USERNAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `PASSWORD` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `PROXY_HOST_NAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `PROXY_PORT` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `NON_PROXY_HOSTS` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `MASTER` tinyint(1) NULL DEFAULT NULL,
  PRIMARY KEY (`ID_SLAVE`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for r_step
-- ----------------------------
DROP TABLE IF EXISTS `r_step`;
CREATE TABLE `r_step`  (
  `ID_STEP` bigint(20) NOT NULL,
  `ID_TRANSFORMATION` int(11) NULL DEFAULT NULL,
  `NAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `DESCRIPTION` mediumtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `ID_STEP_TYPE` int(11) NULL DEFAULT NULL,
  `DISTRIBUTE` tinyint(1) NULL DEFAULT NULL,
  `COPIES` int(11) NULL DEFAULT NULL,
  `GUI_LOCATION_X` int(11) NULL DEFAULT NULL,
  `GUI_LOCATION_Y` int(11) NULL DEFAULT NULL,
  `GUI_DRAW` tinyint(1) NULL DEFAULT NULL,
  `COPIES_STRING` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID_STEP`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of r_step
-- ----------------------------
INSERT INTO `r_step` VALUES (87, 4, 'Table input_job_log', NULL, 199, 1, 1, 128, 113, 1, '1');
INSERT INTO `r_step` VALUES (88, 4, 'DateTimeFinish', NULL, 118, 1, 1, 271, 113, 1, '1');
INSERT INTO `r_step` VALUES (89, 4, 'Insert / Update', NULL, 90, 1, 1, 430, 113, 1, '1');
INSERT INTO `r_step` VALUES (99, 5, 'DateTime', NULL, 118, 1, 1, 480, 171, 1, '1');
INSERT INTO `r_step` VALUES (100, 5, 'Insert / Update DateTime', NULL, 90, 1, 1, 619, 170, 1, '1');
INSERT INTO `r_step` VALUES (101, 5, 'SQLInsertName', NULL, 50, 1, 1, 223, 171, 1, '1');
INSERT INTO `r_step` VALUES (102, 5, 'Table input job_log', NULL, 199, 1, 1, 345, 171, 1, '1');
INSERT INTO `r_step` VALUES (111, 2, 'Group by', NULL, 75, 1, 1, 842, 178, 1, '1');
INSERT INTO `r_step` VALUES (112, 2, 'InputExcel 22', NULL, 115, 1, 1, 91, 178, 1, '1');
INSERT INTO `r_step` VALUES (113, 2, 'InputExcelProjectName', NULL, 115, 1, 1, 91, 303, 1, '1');
INSERT INTO `r_step` VALUES (114, 2, 'Merge Join', NULL, 110, 1, 1, 409, 178, 1, '1');
INSERT INTO `r_step` VALUES (115, 2, 'ModifiedFileName', NULL, 118, 1, 1, 535, 178, 1, '1');
INSERT INTO `r_step` VALUES (116, 2, 'ModifiedProjectName', NULL, 118, 1, 1, 258, 178, 1, '1');
INSERT INTO `r_step` VALUES (117, 2, 'ModifiedProjectName 2', NULL, 118, 1, 1, 409, 303, 1, '1');
INSERT INTO `r_step` VALUES (118, 2, 'Process files', NULL, 143, 1, 1, 964, 178, 1, '1');
INSERT INTO `r_step` VALUES (119, 2, 'Select values', NULL, 170, 1, 1, 258, 303, 1, '1');
INSERT INTO `r_step` VALUES (120, 2, 'TableOutput_itec_report_project', NULL, 200, 1, 1, 688, 178, 1, '1');
INSERT INTO `r_step` VALUES (126, 3, 'Group by', NULL, 75, 1, 1, 741, 144, 1, '1');
INSERT INTO `r_step` VALUES (127, 3, 'If field value is null', NULL, 86, 1, 1, 291, 144, 1, '1');
INSERT INTO `r_step` VALUES (128, 3, 'InputExcel 22', NULL, 115, 1, 1, 168, 144, 1, '1');
INSERT INTO `r_step` VALUES (129, 3, 'ModifiedFileName', NULL, 118, 1, 1, 429, 144, 1, '1');
INSERT INTO `r_step` VALUES (130, 3, 'Process files move', NULL, 143, 1, 1, 873, 144, 1, '1');
INSERT INTO `r_step` VALUES (131, 3, 'Recreate FK', NULL, 50, 1, 1, 1010, 144, 1, '1');
INSERT INTO `r_step` VALUES (132, 3, 'TableOutput_m_indicators', NULL, 200, 1, 1, 597, 144, 1, '1');
INSERT INTO `r_step` VALUES (133, 1, 'Group by', NULL, 75, 1, 1, 656, 87, 1, '1');
INSERT INTO `r_step` VALUES (134, 1, 'InputExcel 22', NULL, 115, 1, 1, 122, 87, 1, '1');
INSERT INTO `r_step` VALUES (135, 1, 'ModifiedFileName', NULL, 118, 1, 1, 295, 87, 1, '1');
INSERT INTO `r_step` VALUES (136, 1, 'Process files move', NULL, 143, 1, 1, 824, 87, 1, '1');
INSERT INTO `r_step` VALUES (137, 1, 'TableOutput_itec_report_budget', NULL, 200, 1, 1, 484, 87, 1, '1');

-- ----------------------------
-- Table structure for r_step_attribute
-- ----------------------------
DROP TABLE IF EXISTS `r_step_attribute`;
CREATE TABLE `r_step_attribute`  (
  `ID_STEP_ATTRIBUTE` bigint(20) NOT NULL,
  `ID_TRANSFORMATION` int(11) NULL DEFAULT NULL,
  `ID_STEP` int(11) NULL DEFAULT NULL,
  `NR` int(11) NULL DEFAULT NULL,
  `CODE` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `VALUE_NUM` bigint(20) NULL DEFAULT NULL,
  `VALUE_STR` mediumtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  PRIMARY KEY (`ID_STEP_ATTRIBUTE`) USING BTREE,
  UNIQUE INDEX `IDX_RSAT`(`ID_STEP`, `CODE`, `NR`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of r_step_attribute
-- ----------------------------
INSERT INTO `r_step_attribute` VALUES (4240, 4, 87, 0, 'PARTITIONING_SCHEMA', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (4241, 4, 87, 0, 'PARTITIONING_METHOD', 0, 'none');
INSERT INTO `r_step_attribute` VALUES (4242, 4, 87, 0, 'id_connection', 1, NULL);
INSERT INTO `r_step_attribute` VALUES (4243, 4, 87, 0, 'sql', 0, 'SELECT MAX(job_log_id) AS id FROM job_log');
INSERT INTO `r_step_attribute` VALUES (4244, 4, 87, 0, 'limit', 0, '0');
INSERT INTO `r_step_attribute` VALUES (4245, 4, 87, 0, 'lookup', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (4246, 4, 87, 0, 'execute_each_row', 0, 'N');
INSERT INTO `r_step_attribute` VALUES (4247, 4, 87, 0, 'variables_active', 0, 'N');
INSERT INTO `r_step_attribute` VALUES (4248, 4, 87, 0, 'lazy_conversion_active', 0, 'N');
INSERT INTO `r_step_attribute` VALUES (4249, 4, 87, 0, 'cluster_schema', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (4250, 4, 87, 0, 'row_distribution_code', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (4251, 4, 88, 0, 'PARTITIONING_SCHEMA', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (4252, 4, 88, 0, 'PARTITIONING_METHOD', 0, 'none');
INSERT INTO `r_step_attribute` VALUES (4253, 4, 88, 0, 'compatible', 0, 'N');
INSERT INTO `r_step_attribute` VALUES (4254, 4, 88, 0, 'optimizationLevel', 0, '9');
INSERT INTO `r_step_attribute` VALUES (4255, 4, 88, 0, 'jsScript_name', 0, 'Script 1');
INSERT INTO `r_step_attribute` VALUES (4256, 4, 88, 0, 'jsScript_script', 0, '//Script here\r\n\r\nvar date_time = new Date();');
INSERT INTO `r_step_attribute` VALUES (4257, 4, 88, 0, 'jsScript_type', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (4258, 4, 88, 0, 'field_name', 0, 'date_time');
INSERT INTO `r_step_attribute` VALUES (4259, 4, 88, 0, 'field_rename', 0, 'date_time');
INSERT INTO `r_step_attribute` VALUES (4260, 4, 88, 0, 'field_type', 0, 'Date');
INSERT INTO `r_step_attribute` VALUES (4261, 4, 88, 0, 'field_length', -1, NULL);
INSERT INTO `r_step_attribute` VALUES (4262, 4, 88, 0, 'field_precision', -1, NULL);
INSERT INTO `r_step_attribute` VALUES (4263, 4, 88, 0, 'field_replace', 0, 'N');
INSERT INTO `r_step_attribute` VALUES (4264, 4, 88, 0, 'cluster_schema', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (4265, 4, 88, 0, 'row_distribution_code', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (4266, 4, 89, 0, 'PARTITIONING_SCHEMA', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (4267, 4, 89, 0, 'PARTITIONING_METHOD', 0, 'none');
INSERT INTO `r_step_attribute` VALUES (4268, 4, 89, 0, 'id_connection', 1, NULL);
INSERT INTO `r_step_attribute` VALUES (4269, 4, 89, 0, 'commit', 0, '100');
INSERT INTO `r_step_attribute` VALUES (4270, 4, 89, 0, 'schema', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (4271, 4, 89, 0, 'table', 0, 'job_log');
INSERT INTO `r_step_attribute` VALUES (4272, 4, 89, 0, 'update_bypassed', 0, 'N');
INSERT INTO `r_step_attribute` VALUES (4273, 4, 89, 0, 'key_name', 0, 'id');
INSERT INTO `r_step_attribute` VALUES (4274, 4, 89, 0, 'key_field', 0, 'job_log_id');
INSERT INTO `r_step_attribute` VALUES (4275, 4, 89, 0, 'key_condition', 0, '=');
INSERT INTO `r_step_attribute` VALUES (4276, 4, 89, 0, 'key_name2', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (4277, 4, 89, 0, 'value_name', 0, 'etl_finish_dttm');
INSERT INTO `r_step_attribute` VALUES (4278, 4, 89, 0, 'value_rename', 0, 'date_time');
INSERT INTO `r_step_attribute` VALUES (4279, 4, 89, 0, 'value_update', 0, 'Y');
INSERT INTO `r_step_attribute` VALUES (4280, 4, 89, 0, 'cluster_schema', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (4281, 4, 89, 0, 'row_distribution_code', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (4686, 5, 99, 0, 'PARTITIONING_SCHEMA', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (4687, 5, 99, 0, 'PARTITIONING_METHOD', 0, 'none');
INSERT INTO `r_step_attribute` VALUES (4688, 5, 99, 0, 'compatible', 0, 'N');
INSERT INTO `r_step_attribute` VALUES (4689, 5, 99, 0, 'optimizationLevel', 0, '9');
INSERT INTO `r_step_attribute` VALUES (4690, 5, 99, 0, 'jsScript_name', 0, 'Script 1');
INSERT INTO `r_step_attribute` VALUES (4691, 5, 99, 0, 'jsScript_script', 0, '//Script here\r\n\r\n\r\nvar date_time = new Date();');
INSERT INTO `r_step_attribute` VALUES (4692, 5, 99, 0, 'jsScript_type', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (4693, 5, 99, 0, 'field_name', 0, 'date_time');
INSERT INTO `r_step_attribute` VALUES (4694, 5, 99, 0, 'field_rename', 0, 'date_time');
INSERT INTO `r_step_attribute` VALUES (4695, 5, 99, 0, 'field_type', 0, 'Date');
INSERT INTO `r_step_attribute` VALUES (4696, 5, 99, 0, 'field_length', -1, NULL);
INSERT INTO `r_step_attribute` VALUES (4697, 5, 99, 0, 'field_precision', -1, NULL);
INSERT INTO `r_step_attribute` VALUES (4698, 5, 99, 0, 'field_replace', 0, 'N');
INSERT INTO `r_step_attribute` VALUES (4699, 5, 99, 0, 'cluster_schema', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (4700, 5, 99, 0, 'row_distribution_code', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (4701, 5, 100, 0, 'PARTITIONING_SCHEMA', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (4702, 5, 100, 0, 'PARTITIONING_METHOD', 0, 'none');
INSERT INTO `r_step_attribute` VALUES (4703, 5, 100, 0, 'id_connection', 1, NULL);
INSERT INTO `r_step_attribute` VALUES (4704, 5, 100, 0, 'commit', 0, '100');
INSERT INTO `r_step_attribute` VALUES (4705, 5, 100, 0, 'schema', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (4706, 5, 100, 0, 'table', 0, 'job_log');
INSERT INTO `r_step_attribute` VALUES (4707, 5, 100, 0, 'update_bypassed', 0, 'N');
INSERT INTO `r_step_attribute` VALUES (4708, 5, 100, 0, 'key_name', 0, 'id');
INSERT INTO `r_step_attribute` VALUES (4709, 5, 100, 0, 'key_field', 0, 'job_log_id');
INSERT INTO `r_step_attribute` VALUES (4710, 5, 100, 0, 'key_condition', 0, '=');
INSERT INTO `r_step_attribute` VALUES (4711, 5, 100, 0, 'key_name2', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (4712, 5, 100, 0, 'value_name', 0, 'etl_start_dttm');
INSERT INTO `r_step_attribute` VALUES (4713, 5, 100, 0, 'value_rename', 0, 'date_time');
INSERT INTO `r_step_attribute` VALUES (4714, 5, 100, 0, 'value_update', 0, 'Y');
INSERT INTO `r_step_attribute` VALUES (4715, 5, 100, 0, 'cluster_schema', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (4716, 5, 100, 0, 'row_distribution_code', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (4717, 5, 101, 0, 'PARTITIONING_SCHEMA', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (4718, 5, 101, 0, 'PARTITIONING_METHOD', 0, 'none');
INSERT INTO `r_step_attribute` VALUES (4719, 5, 101, 0, 'id_connection', 1, NULL);
INSERT INTO `r_step_attribute` VALUES (4720, 5, 101, 0, 'sql', 0, 'INSERT INTO job_log (job_log_name)\r\nVALUES (\'JobQsdsReport\');\r\n\r\n');
INSERT INTO `r_step_attribute` VALUES (4721, 5, 101, 0, 'execute_each_row', 0, 'N');
INSERT INTO `r_step_attribute` VALUES (4722, 5, 101, 0, 'single_statement', 0, 'N');
INSERT INTO `r_step_attribute` VALUES (4723, 5, 101, 0, 'replace_variables', 0, 'N');
INSERT INTO `r_step_attribute` VALUES (4724, 5, 101, 0, 'quoteString', 0, 'N');
INSERT INTO `r_step_attribute` VALUES (4725, 5, 101, 0, 'set_params', 0, 'N');
INSERT INTO `r_step_attribute` VALUES (4726, 5, 101, 0, 'insert_field', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (4727, 5, 101, 0, 'update_field', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (4728, 5, 101, 0, 'delete_field', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (4729, 5, 101, 0, 'read_field', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (4730, 5, 101, 0, 'cluster_schema', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (4731, 5, 101, 0, 'row_distribution_code', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (4732, 5, 102, 0, 'PARTITIONING_SCHEMA', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (4733, 5, 102, 0, 'PARTITIONING_METHOD', 0, 'none');
INSERT INTO `r_step_attribute` VALUES (4734, 5, 102, 0, 'id_connection', 1, NULL);
INSERT INTO `r_step_attribute` VALUES (4735, 5, 102, 0, 'sql', 0, 'SELECT MAX(job_log_id) AS id FROM job_log;');
INSERT INTO `r_step_attribute` VALUES (4736, 5, 102, 0, 'limit', 0, '0');
INSERT INTO `r_step_attribute` VALUES (4737, 5, 102, 0, 'lookup', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (4738, 5, 102, 0, 'execute_each_row', 0, 'N');
INSERT INTO `r_step_attribute` VALUES (4739, 5, 102, 0, 'variables_active', 0, 'N');
INSERT INTO `r_step_attribute` VALUES (4740, 5, 102, 0, 'lazy_conversion_active', 0, 'N');
INSERT INTO `r_step_attribute` VALUES (4741, 5, 102, 0, 'cluster_schema', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (4742, 5, 102, 0, 'row_distribution_code', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (5009, 2, 111, 0, 'PARTITIONING_SCHEMA', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (5010, 2, 111, 0, 'PARTITIONING_METHOD', 0, 'none');
INSERT INTO `r_step_attribute` VALUES (5011, 2, 111, 0, 'all_rows', 0, 'N');
INSERT INTO `r_step_attribute` VALUES (5012, 2, 111, 0, 'ignore_aggregate', 0, 'N');
INSERT INTO `r_step_attribute` VALUES (5013, 2, 111, 0, 'field_ignore', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (5014, 2, 111, 0, 'directory', 0, '%%java.io.tmpdir%%');
INSERT INTO `r_step_attribute` VALUES (5015, 2, 111, 0, 'prefix', 0, 'grp');
INSERT INTO `r_step_attribute` VALUES (5016, 2, 111, 0, 'add_linenr', 0, 'N');
INSERT INTO `r_step_attribute` VALUES (5017, 2, 111, 0, 'linenr_fieldname', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (5018, 2, 111, 0, 'give_back_row', 0, 'N');
INSERT INTO `r_step_attribute` VALUES (5019, 2, 111, 0, 'group_name', 0, 'FullPathName');
INSERT INTO `r_step_attribute` VALUES (5020, 2, 111, 1, 'group_name', 0, 'fullname_target');
INSERT INTO `r_step_attribute` VALUES (5021, 2, 111, 0, 'cluster_schema', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (5022, 2, 111, 0, 'row_distribution_code', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (5023, 2, 112, 0, 'PARTITIONING_SCHEMA', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (5024, 2, 112, 0, 'PARTITIONING_METHOD', 0, 'none');
INSERT INTO `r_step_attribute` VALUES (5025, 2, 112, 0, 'header', 0, 'Y');
INSERT INTO `r_step_attribute` VALUES (5026, 2, 112, 0, 'noempty', 0, 'Y');
INSERT INTO `r_step_attribute` VALUES (5027, 2, 112, 0, 'stoponempty', 0, 'Y');
INSERT INTO `r_step_attribute` VALUES (5028, 2, 112, 0, 'filefield', 0, 'FullPathName');
INSERT INTO `r_step_attribute` VALUES (5029, 2, 112, 0, 'sheetfield', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (5030, 2, 112, 0, 'sheetrownumfield', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (5031, 2, 112, 0, 'rownumfield', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (5032, 2, 112, 0, 'limit', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (5033, 2, 112, 0, 'encoding', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (5034, 2, 112, 0, 'add_to_result_filenames', 0, 'Y');
INSERT INTO `r_step_attribute` VALUES (5035, 2, 112, 0, 'accept_filenames', 0, 'N');
INSERT INTO `r_step_attribute` VALUES (5036, 2, 112, 0, 'accept_field', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (5037, 2, 112, 0, 'accept_stepname', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (5038, 2, 112, 0, 'file_name', 0, 'C:\\ETL Report\\ระบบที่ 5 รายงานข้อ 2.3_ETL_itec-report_project.xlsx');
INSERT INTO `r_step_attribute` VALUES (5039, 2, 112, 0, 'file_mask', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (5040, 2, 112, 0, 'exclude_file_mask', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (5041, 2, 112, 0, 'file_required', 0, 'N');
INSERT INTO `r_step_attribute` VALUES (5042, 2, 112, 0, 'include_subfolders', 0, 'N');
INSERT INTO `r_step_attribute` VALUES (5043, 2, 112, 0, 'sheet_name', 0, 'Database');
INSERT INTO `r_step_attribute` VALUES (5044, 2, 112, 0, 'sheet_startrow', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (5045, 2, 112, 0, 'sheet_startcol', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (5046, 2, 112, 0, 'field_name', 0, 'Unit_ID');
INSERT INTO `r_step_attribute` VALUES (5047, 2, 112, 0, 'field_type', 0, 'Integer');
INSERT INTO `r_step_attribute` VALUES (5048, 2, 112, 0, 'field_length', -1, NULL);
INSERT INTO `r_step_attribute` VALUES (5049, 2, 112, 0, 'field_precision', -1, NULL);
INSERT INTO `r_step_attribute` VALUES (5050, 2, 112, 0, 'field_trim_type', 0, 'none');
INSERT INTO `r_step_attribute` VALUES (5051, 2, 112, 0, 'field_repeat', 0, 'N');
INSERT INTO `r_step_attribute` VALUES (5052, 2, 112, 0, 'field_format', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (5053, 2, 112, 0, 'field_currency', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (5054, 2, 112, 0, 'field_decimal', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (5055, 2, 112, 0, 'field_group', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (5056, 2, 112, 1, 'field_name', 0, 'Owner');
INSERT INTO `r_step_attribute` VALUES (5057, 2, 112, 1, 'field_type', 0, 'String');
INSERT INTO `r_step_attribute` VALUES (5058, 2, 112, 1, 'field_length', -1, NULL);
INSERT INTO `r_step_attribute` VALUES (5059, 2, 112, 1, 'field_precision', -1, NULL);
INSERT INTO `r_step_attribute` VALUES (5060, 2, 112, 1, 'field_trim_type', 0, 'none');
INSERT INTO `r_step_attribute` VALUES (5061, 2, 112, 1, 'field_repeat', 0, 'N');
INSERT INTO `r_step_attribute` VALUES (5062, 2, 112, 1, 'field_format', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (5063, 2, 112, 1, 'field_currency', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (5064, 2, 112, 1, 'field_decimal', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (5065, 2, 112, 1, 'field_group', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (5066, 2, 112, 2, 'field_name', 0, 'PhoneNumber');
INSERT INTO `r_step_attribute` VALUES (5067, 2, 112, 2, 'field_type', 0, 'String');
INSERT INTO `r_step_attribute` VALUES (5068, 2, 112, 2, 'field_length', -1, NULL);
INSERT INTO `r_step_attribute` VALUES (5069, 2, 112, 2, 'field_precision', -1, NULL);
INSERT INTO `r_step_attribute` VALUES (5070, 2, 112, 2, 'field_trim_type', 0, 'none');
INSERT INTO `r_step_attribute` VALUES (5071, 2, 112, 2, 'field_repeat', 0, 'N');
INSERT INTO `r_step_attribute` VALUES (5072, 2, 112, 2, 'field_format', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (5073, 2, 112, 2, 'field_currency', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (5074, 2, 112, 2, 'field_decimal', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (5075, 2, 112, 2, 'field_group', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (5076, 2, 112, 3, 'field_name', 0, 'Year');
INSERT INTO `r_step_attribute` VALUES (5077, 2, 112, 3, 'field_type', 0, 'Integer');
INSERT INTO `r_step_attribute` VALUES (5078, 2, 112, 3, 'field_length', 4, NULL);
INSERT INTO `r_step_attribute` VALUES (5079, 2, 112, 3, 'field_precision', -1, NULL);
INSERT INTO `r_step_attribute` VALUES (5080, 2, 112, 3, 'field_trim_type', 0, 'none');
INSERT INTO `r_step_attribute` VALUES (5081, 2, 112, 3, 'field_repeat', 0, 'N');
INSERT INTO `r_step_attribute` VALUES (5082, 2, 112, 3, 'field_format', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (5083, 2, 112, 3, 'field_currency', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (5084, 2, 112, 3, 'field_decimal', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (5085, 2, 112, 3, 'field_group', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (5086, 2, 112, 4, 'field_name', 0, 'ProjectName');
INSERT INTO `r_step_attribute` VALUES (5087, 2, 112, 4, 'field_type', 0, 'String');
INSERT INTO `r_step_attribute` VALUES (5088, 2, 112, 4, 'field_length', -1, NULL);
INSERT INTO `r_step_attribute` VALUES (5089, 2, 112, 4, 'field_precision', -1, NULL);
INSERT INTO `r_step_attribute` VALUES (5090, 2, 112, 4, 'field_trim_type', 0, 'none');
INSERT INTO `r_step_attribute` VALUES (5091, 2, 112, 4, 'field_repeat', 0, 'N');
INSERT INTO `r_step_attribute` VALUES (5092, 2, 112, 4, 'field_format', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (5093, 2, 112, 4, 'field_currency', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (5094, 2, 112, 4, 'field_decimal', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (5095, 2, 112, 4, 'field_group', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (5096, 2, 112, 5, 'field_name', 0, 'Plans_ID');
INSERT INTO `r_step_attribute` VALUES (5097, 2, 112, 5, 'field_type', 0, 'Integer');
INSERT INTO `r_step_attribute` VALUES (5098, 2, 112, 5, 'field_length', -1, NULL);
INSERT INTO `r_step_attribute` VALUES (5099, 2, 112, 5, 'field_precision', -1, NULL);
INSERT INTO `r_step_attribute` VALUES (5100, 2, 112, 5, 'field_trim_type', 0, 'none');
INSERT INTO `r_step_attribute` VALUES (5101, 2, 112, 5, 'field_repeat', 0, 'N');
INSERT INTO `r_step_attribute` VALUES (5102, 2, 112, 5, 'field_format', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (5103, 2, 112, 5, 'field_currency', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (5104, 2, 112, 5, 'field_decimal', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (5105, 2, 112, 5, 'field_group', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (5106, 2, 112, 6, 'field_name', 0, 'Budjet');
INSERT INTO `r_step_attribute` VALUES (5107, 2, 112, 6, 'field_type', 0, 'Number');
INSERT INTO `r_step_attribute` VALUES (5108, 2, 112, 6, 'field_length', -1, NULL);
INSERT INTO `r_step_attribute` VALUES (5109, 2, 112, 6, 'field_precision', 2, NULL);
INSERT INTO `r_step_attribute` VALUES (5110, 2, 112, 6, 'field_trim_type', 0, 'none');
INSERT INTO `r_step_attribute` VALUES (5111, 2, 112, 6, 'field_repeat', 0, 'N');
INSERT INTO `r_step_attribute` VALUES (5112, 2, 112, 6, 'field_format', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (5113, 2, 112, 6, 'field_currency', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (5114, 2, 112, 6, 'field_decimal', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (5115, 2, 112, 6, 'field_group', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (5116, 2, 112, 7, 'field_name', 0, 'Indicators_ID');
INSERT INTO `r_step_attribute` VALUES (5117, 2, 112, 7, 'field_type', 0, 'Integer');
INSERT INTO `r_step_attribute` VALUES (5118, 2, 112, 7, 'field_length', -1, NULL);
INSERT INTO `r_step_attribute` VALUES (5119, 2, 112, 7, 'field_precision', -1, NULL);
INSERT INTO `r_step_attribute` VALUES (5120, 2, 112, 7, 'field_trim_type', 0, 'none');
INSERT INTO `r_step_attribute` VALUES (5121, 2, 112, 7, 'field_repeat', 0, 'N');
INSERT INTO `r_step_attribute` VALUES (5122, 2, 112, 7, 'field_format', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (5123, 2, 112, 7, 'field_currency', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (5124, 2, 112, 7, 'field_decimal', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (5125, 2, 112, 7, 'field_group', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (5126, 2, 112, 8, 'field_name', 0, 'Goal');
INSERT INTO `r_step_attribute` VALUES (5127, 2, 112, 8, 'field_type', 0, 'Integer');
INSERT INTO `r_step_attribute` VALUES (5128, 2, 112, 8, 'field_length', -1, NULL);
INSERT INTO `r_step_attribute` VALUES (5129, 2, 112, 8, 'field_precision', -1, NULL);
INSERT INTO `r_step_attribute` VALUES (5130, 2, 112, 8, 'field_trim_type', 0, 'none');
INSERT INTO `r_step_attribute` VALUES (5131, 2, 112, 8, 'field_repeat', 0, 'N');
INSERT INTO `r_step_attribute` VALUES (5132, 2, 112, 8, 'field_format', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (5133, 2, 112, 8, 'field_currency', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (5134, 2, 112, 8, 'field_decimal', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (5135, 2, 112, 8, 'field_group', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (5136, 2, 112, 9, 'field_name', 0, 'Unit');
INSERT INTO `r_step_attribute` VALUES (5137, 2, 112, 9, 'field_type', 0, 'String');
INSERT INTO `r_step_attribute` VALUES (5138, 2, 112, 9, 'field_length', -1, NULL);
INSERT INTO `r_step_attribute` VALUES (5139, 2, 112, 9, 'field_precision', -1, NULL);
INSERT INTO `r_step_attribute` VALUES (5140, 2, 112, 9, 'field_trim_type', 0, 'none');
INSERT INTO `r_step_attribute` VALUES (5141, 2, 112, 9, 'field_repeat', 0, 'N');
INSERT INTO `r_step_attribute` VALUES (5142, 2, 112, 9, 'field_format', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (5143, 2, 112, 9, 'field_currency', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (5144, 2, 112, 9, 'field_decimal', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (5145, 2, 112, 9, 'field_group', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (5146, 2, 112, 10, 'field_name', 0, 'Date_Start');
INSERT INTO `r_step_attribute` VALUES (5147, 2, 112, 10, 'field_type', 0, 'Date');
INSERT INTO `r_step_attribute` VALUES (5148, 2, 112, 10, 'field_length', -1, NULL);
INSERT INTO `r_step_attribute` VALUES (5149, 2, 112, 10, 'field_precision', -1, NULL);
INSERT INTO `r_step_attribute` VALUES (5150, 2, 112, 10, 'field_trim_type', 0, 'none');
INSERT INTO `r_step_attribute` VALUES (5151, 2, 112, 10, 'field_repeat', 0, 'N');
INSERT INTO `r_step_attribute` VALUES (5152, 2, 112, 10, 'field_format', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (5153, 2, 112, 10, 'field_currency', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (5154, 2, 112, 10, 'field_decimal', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (5155, 2, 112, 10, 'field_group', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (5156, 2, 112, 11, 'field_name', 0, 'Date_Finish');
INSERT INTO `r_step_attribute` VALUES (5157, 2, 112, 11, 'field_type', 0, 'Date');
INSERT INTO `r_step_attribute` VALUES (5158, 2, 112, 11, 'field_length', -1, NULL);
INSERT INTO `r_step_attribute` VALUES (5159, 2, 112, 11, 'field_precision', -1, NULL);
INSERT INTO `r_step_attribute` VALUES (5160, 2, 112, 11, 'field_trim_type', 0, 'none');
INSERT INTO `r_step_attribute` VALUES (5161, 2, 112, 11, 'field_repeat', 0, 'N');
INSERT INTO `r_step_attribute` VALUES (5162, 2, 112, 11, 'field_format', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (5163, 2, 112, 11, 'field_currency', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (5164, 2, 112, 11, 'field_decimal', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (5165, 2, 112, 11, 'field_group', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (5166, 2, 112, 12, 'field_name', 0, 'Report_Type_ID');
INSERT INTO `r_step_attribute` VALUES (5167, 2, 112, 12, 'field_type', 0, 'Integer');
INSERT INTO `r_step_attribute` VALUES (5168, 2, 112, 12, 'field_length', -1, NULL);
INSERT INTO `r_step_attribute` VALUES (5169, 2, 112, 12, 'field_precision', -1, NULL);
INSERT INTO `r_step_attribute` VALUES (5170, 2, 112, 12, 'field_trim_type', 0, 'none');
INSERT INTO `r_step_attribute` VALUES (5171, 2, 112, 12, 'field_repeat', 0, 'N');
INSERT INTO `r_step_attribute` VALUES (5172, 2, 112, 12, 'field_format', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (5173, 2, 112, 12, 'field_currency', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (5174, 2, 112, 12, 'field_decimal', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (5175, 2, 112, 12, 'field_group', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (5176, 2, 112, 13, 'field_name', 0, 'Month1');
INSERT INTO `r_step_attribute` VALUES (5177, 2, 112, 13, 'field_type', 0, 'Number');
INSERT INTO `r_step_attribute` VALUES (5178, 2, 112, 13, 'field_length', -1, NULL);
INSERT INTO `r_step_attribute` VALUES (5179, 2, 112, 13, 'field_precision', 2, NULL);
INSERT INTO `r_step_attribute` VALUES (5180, 2, 112, 13, 'field_trim_type', 0, 'none');
INSERT INTO `r_step_attribute` VALUES (5181, 2, 112, 13, 'field_repeat', 0, 'N');
INSERT INTO `r_step_attribute` VALUES (5182, 2, 112, 13, 'field_format', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (5183, 2, 112, 13, 'field_currency', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (5184, 2, 112, 13, 'field_decimal', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (5185, 2, 112, 13, 'field_group', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (5186, 2, 112, 14, 'field_name', 0, 'Month2');
INSERT INTO `r_step_attribute` VALUES (5187, 2, 112, 14, 'field_type', 0, 'Number');
INSERT INTO `r_step_attribute` VALUES (5188, 2, 112, 14, 'field_length', -1, NULL);
INSERT INTO `r_step_attribute` VALUES (5189, 2, 112, 14, 'field_precision', 2, NULL);
INSERT INTO `r_step_attribute` VALUES (5190, 2, 112, 14, 'field_trim_type', 0, 'none');
INSERT INTO `r_step_attribute` VALUES (5191, 2, 112, 14, 'field_repeat', 0, 'N');
INSERT INTO `r_step_attribute` VALUES (5192, 2, 112, 14, 'field_format', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (5193, 2, 112, 14, 'field_currency', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (5194, 2, 112, 14, 'field_decimal', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (5195, 2, 112, 14, 'field_group', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (5196, 2, 112, 15, 'field_name', 0, 'Month3');
INSERT INTO `r_step_attribute` VALUES (5197, 2, 112, 15, 'field_type', 0, 'Number');
INSERT INTO `r_step_attribute` VALUES (5198, 2, 112, 15, 'field_length', -1, NULL);
INSERT INTO `r_step_attribute` VALUES (5199, 2, 112, 15, 'field_precision', 2, NULL);
INSERT INTO `r_step_attribute` VALUES (5200, 2, 112, 15, 'field_trim_type', 0, 'none');
INSERT INTO `r_step_attribute` VALUES (5201, 2, 112, 15, 'field_repeat', 0, 'N');
INSERT INTO `r_step_attribute` VALUES (5202, 2, 112, 15, 'field_format', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (5203, 2, 112, 15, 'field_currency', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (5204, 2, 112, 15, 'field_decimal', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (5205, 2, 112, 15, 'field_group', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (5206, 2, 112, 16, 'field_name', 0, 'Month4');
INSERT INTO `r_step_attribute` VALUES (5207, 2, 112, 16, 'field_type', 0, 'Number');
INSERT INTO `r_step_attribute` VALUES (5208, 2, 112, 16, 'field_length', -1, NULL);
INSERT INTO `r_step_attribute` VALUES (5209, 2, 112, 16, 'field_precision', 2, NULL);
INSERT INTO `r_step_attribute` VALUES (5210, 2, 112, 16, 'field_trim_type', 0, 'none');
INSERT INTO `r_step_attribute` VALUES (5211, 2, 112, 16, 'field_repeat', 0, 'N');
INSERT INTO `r_step_attribute` VALUES (5212, 2, 112, 16, 'field_format', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (5213, 2, 112, 16, 'field_currency', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (5214, 2, 112, 16, 'field_decimal', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (5215, 2, 112, 16, 'field_group', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (5216, 2, 112, 17, 'field_name', 0, 'Month5');
INSERT INTO `r_step_attribute` VALUES (5217, 2, 112, 17, 'field_type', 0, 'Number');
INSERT INTO `r_step_attribute` VALUES (5218, 2, 112, 17, 'field_length', -1, NULL);
INSERT INTO `r_step_attribute` VALUES (5219, 2, 112, 17, 'field_precision', 2, NULL);
INSERT INTO `r_step_attribute` VALUES (5220, 2, 112, 17, 'field_trim_type', 0, 'none');
INSERT INTO `r_step_attribute` VALUES (5221, 2, 112, 17, 'field_repeat', 0, 'N');
INSERT INTO `r_step_attribute` VALUES (5222, 2, 112, 17, 'field_format', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (5223, 2, 112, 17, 'field_currency', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (5224, 2, 112, 17, 'field_decimal', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (5225, 2, 112, 17, 'field_group', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (5226, 2, 112, 18, 'field_name', 0, 'Month6');
INSERT INTO `r_step_attribute` VALUES (5227, 2, 112, 18, 'field_type', 0, 'Number');
INSERT INTO `r_step_attribute` VALUES (5228, 2, 112, 18, 'field_length', -1, NULL);
INSERT INTO `r_step_attribute` VALUES (5229, 2, 112, 18, 'field_precision', 2, NULL);
INSERT INTO `r_step_attribute` VALUES (5230, 2, 112, 18, 'field_trim_type', 0, 'none');
INSERT INTO `r_step_attribute` VALUES (5231, 2, 112, 18, 'field_repeat', 0, 'N');
INSERT INTO `r_step_attribute` VALUES (5232, 2, 112, 18, 'field_format', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (5233, 2, 112, 18, 'field_currency', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (5234, 2, 112, 18, 'field_decimal', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (5235, 2, 112, 18, 'field_group', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (5236, 2, 112, 19, 'field_name', 0, 'Month7');
INSERT INTO `r_step_attribute` VALUES (5237, 2, 112, 19, 'field_type', 0, 'Number');
INSERT INTO `r_step_attribute` VALUES (5238, 2, 112, 19, 'field_length', -1, NULL);
INSERT INTO `r_step_attribute` VALUES (5239, 2, 112, 19, 'field_precision', 2, NULL);
INSERT INTO `r_step_attribute` VALUES (5240, 2, 112, 19, 'field_trim_type', 0, 'none');
INSERT INTO `r_step_attribute` VALUES (5241, 2, 112, 19, 'field_repeat', 0, 'N');
INSERT INTO `r_step_attribute` VALUES (5242, 2, 112, 19, 'field_format', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (5243, 2, 112, 19, 'field_currency', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (5244, 2, 112, 19, 'field_decimal', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (5245, 2, 112, 19, 'field_group', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (5246, 2, 112, 20, 'field_name', 0, 'Month8');
INSERT INTO `r_step_attribute` VALUES (5247, 2, 112, 20, 'field_type', 0, 'Number');
INSERT INTO `r_step_attribute` VALUES (5248, 2, 112, 20, 'field_length', -1, NULL);
INSERT INTO `r_step_attribute` VALUES (5249, 2, 112, 20, 'field_precision', 2, NULL);
INSERT INTO `r_step_attribute` VALUES (5250, 2, 112, 20, 'field_trim_type', 0, 'none');
INSERT INTO `r_step_attribute` VALUES (5251, 2, 112, 20, 'field_repeat', 0, 'N');
INSERT INTO `r_step_attribute` VALUES (5252, 2, 112, 20, 'field_format', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (5253, 2, 112, 20, 'field_currency', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (5254, 2, 112, 20, 'field_decimal', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (5255, 2, 112, 20, 'field_group', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (5256, 2, 112, 21, 'field_name', 0, 'Month9');
INSERT INTO `r_step_attribute` VALUES (5257, 2, 112, 21, 'field_type', 0, 'Number');
INSERT INTO `r_step_attribute` VALUES (5258, 2, 112, 21, 'field_length', -1, NULL);
INSERT INTO `r_step_attribute` VALUES (5259, 2, 112, 21, 'field_precision', 2, NULL);
INSERT INTO `r_step_attribute` VALUES (5260, 2, 112, 21, 'field_trim_type', 0, 'none');
INSERT INTO `r_step_attribute` VALUES (5261, 2, 112, 21, 'field_repeat', 0, 'N');
INSERT INTO `r_step_attribute` VALUES (5262, 2, 112, 21, 'field_format', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (5263, 2, 112, 21, 'field_currency', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (5264, 2, 112, 21, 'field_decimal', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (5265, 2, 112, 21, 'field_group', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (5266, 2, 112, 22, 'field_name', 0, 'Month10');
INSERT INTO `r_step_attribute` VALUES (5267, 2, 112, 22, 'field_type', 0, 'Number');
INSERT INTO `r_step_attribute` VALUES (5268, 2, 112, 22, 'field_length', -1, NULL);
INSERT INTO `r_step_attribute` VALUES (5269, 2, 112, 22, 'field_precision', 2, NULL);
INSERT INTO `r_step_attribute` VALUES (5270, 2, 112, 22, 'field_trim_type', 0, 'none');
INSERT INTO `r_step_attribute` VALUES (5271, 2, 112, 22, 'field_repeat', 0, 'N');
INSERT INTO `r_step_attribute` VALUES (5272, 2, 112, 22, 'field_format', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (5273, 2, 112, 22, 'field_currency', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (5274, 2, 112, 22, 'field_decimal', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (5275, 2, 112, 22, 'field_group', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (5276, 2, 112, 23, 'field_name', 0, 'Month11');
INSERT INTO `r_step_attribute` VALUES (5277, 2, 112, 23, 'field_type', 0, 'Number');
INSERT INTO `r_step_attribute` VALUES (5278, 2, 112, 23, 'field_length', -1, NULL);
INSERT INTO `r_step_attribute` VALUES (5279, 2, 112, 23, 'field_precision', 2, NULL);
INSERT INTO `r_step_attribute` VALUES (5280, 2, 112, 23, 'field_trim_type', 0, 'none');
INSERT INTO `r_step_attribute` VALUES (5281, 2, 112, 23, 'field_repeat', 0, 'N');
INSERT INTO `r_step_attribute` VALUES (5282, 2, 112, 23, 'field_format', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (5283, 2, 112, 23, 'field_currency', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (5284, 2, 112, 23, 'field_decimal', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (5285, 2, 112, 23, 'field_group', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (5286, 2, 112, 24, 'field_name', 0, 'Month12');
INSERT INTO `r_step_attribute` VALUES (5287, 2, 112, 24, 'field_type', 0, 'Number');
INSERT INTO `r_step_attribute` VALUES (5288, 2, 112, 24, 'field_length', -1, NULL);
INSERT INTO `r_step_attribute` VALUES (5289, 2, 112, 24, 'field_precision', 2, NULL);
INSERT INTO `r_step_attribute` VALUES (5290, 2, 112, 24, 'field_trim_type', 0, 'none');
INSERT INTO `r_step_attribute` VALUES (5291, 2, 112, 24, 'field_repeat', 0, 'N');
INSERT INTO `r_step_attribute` VALUES (5292, 2, 112, 24, 'field_format', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (5293, 2, 112, 24, 'field_currency', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (5294, 2, 112, 24, 'field_decimal', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (5295, 2, 112, 24, 'field_group', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (5296, 2, 112, 0, 'strict_types', 0, 'N');
INSERT INTO `r_step_attribute` VALUES (5297, 2, 112, 0, 'error_ignored', 0, 'N');
INSERT INTO `r_step_attribute` VALUES (5298, 2, 112, 0, 'error_line_skipped', 0, 'N');
INSERT INTO `r_step_attribute` VALUES (5299, 2, 112, 0, 'bad_line_files_dest_dir', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (5300, 2, 112, 0, 'bad_line_files_ext', 0, 'warning');
INSERT INTO `r_step_attribute` VALUES (5301, 2, 112, 0, 'error_line_files_dest_dir', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (5302, 2, 112, 0, 'error_line_files_ext', 0, 'error');
INSERT INTO `r_step_attribute` VALUES (5303, 2, 112, 0, 'line_number_files_dest_dir', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (5304, 2, 112, 0, 'line_number_files_ext', 0, 'line');
INSERT INTO `r_step_attribute` VALUES (5305, 2, 112, 0, 'shortFileFieldName', 0, 'ShortFileName');
INSERT INTO `r_step_attribute` VALUES (5306, 2, 112, 0, 'pathFieldName', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (5307, 2, 112, 0, 'hiddenFieldName', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (5308, 2, 112, 0, 'lastModificationTimeFieldName', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (5309, 2, 112, 0, 'uriNameFieldName', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (5310, 2, 112, 0, 'rootUriNameFieldName', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (5311, 2, 112, 0, 'extensionFieldName', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (5312, 2, 112, 0, 'sizeFieldName', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (5313, 2, 112, 0, 'spreadsheet_type', 0, 'POI');
INSERT INTO `r_step_attribute` VALUES (5314, 2, 112, 0, 'cluster_schema', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (5315, 2, 112, 0, 'row_distribution_code', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (5316, 2, 113, 0, 'PARTITIONING_SCHEMA', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (5317, 2, 113, 0, 'PARTITIONING_METHOD', 0, 'none');
INSERT INTO `r_step_attribute` VALUES (5318, 2, 113, 0, 'header', 0, 'Y');
INSERT INTO `r_step_attribute` VALUES (5319, 2, 113, 0, 'noempty', 0, 'Y');
INSERT INTO `r_step_attribute` VALUES (5320, 2, 113, 0, 'stoponempty', 0, 'Y');
INSERT INTO `r_step_attribute` VALUES (5321, 2, 113, 0, 'filefield', 0, 'FullPathName');
INSERT INTO `r_step_attribute` VALUES (5322, 2, 113, 0, 'sheetfield', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (5323, 2, 113, 0, 'sheetrownumfield', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (5324, 2, 113, 0, 'rownumfield', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (5325, 2, 113, 0, 'limit', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (5326, 2, 113, 0, 'encoding', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (5327, 2, 113, 0, 'add_to_result_filenames', 0, 'Y');
INSERT INTO `r_step_attribute` VALUES (5328, 2, 113, 0, 'accept_filenames', 0, 'N');
INSERT INTO `r_step_attribute` VALUES (5329, 2, 113, 0, 'accept_field', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (5330, 2, 113, 0, 'accept_stepname', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (5331, 2, 113, 0, 'file_name', 0, 'C:\\ETL Report\\ระบบที่ 5 รายงานข้อ 2.3_ETL_itec-report_project.xlsx');
INSERT INTO `r_step_attribute` VALUES (5332, 2, 113, 0, 'file_mask', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (5333, 2, 113, 0, 'exclude_file_mask', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (5334, 2, 113, 0, 'file_required', 0, 'N');
INSERT INTO `r_step_attribute` VALUES (5335, 2, 113, 0, 'include_subfolders', 0, 'N');
INSERT INTO `r_step_attribute` VALUES (5336, 2, 113, 0, 'sheet_name', 0, 'Matching');
INSERT INTO `r_step_attribute` VALUES (5337, 2, 113, 0, 'sheet_startrow', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (5338, 2, 113, 0, 'sheet_startcol', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (5339, 2, 113, 0, 'field_name', 0, 'หน่วยงาน ');
INSERT INTO `r_step_attribute` VALUES (5340, 2, 113, 0, 'field_type', 0, 'String');
INSERT INTO `r_step_attribute` VALUES (5341, 2, 113, 0, 'field_length', -1, NULL);
INSERT INTO `r_step_attribute` VALUES (5342, 2, 113, 0, 'field_precision', -1, NULL);
INSERT INTO `r_step_attribute` VALUES (5343, 2, 113, 0, 'field_trim_type', 0, 'none');
INSERT INTO `r_step_attribute` VALUES (5344, 2, 113, 0, 'field_repeat', 0, 'N');
INSERT INTO `r_step_attribute` VALUES (5345, 2, 113, 0, 'field_format', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (5346, 2, 113, 0, 'field_currency', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (5347, 2, 113, 0, 'field_decimal', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (5348, 2, 113, 0, 'field_group', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (5349, 2, 113, 1, 'field_name', 0, 'Unit_ID');
INSERT INTO `r_step_attribute` VALUES (5350, 2, 113, 1, 'field_type', 0, 'Number');
INSERT INTO `r_step_attribute` VALUES (5351, 2, 113, 1, 'field_length', -1, NULL);
INSERT INTO `r_step_attribute` VALUES (5352, 2, 113, 1, 'field_precision', -1, NULL);
INSERT INTO `r_step_attribute` VALUES (5353, 2, 113, 1, 'field_trim_type', 0, 'none');
INSERT INTO `r_step_attribute` VALUES (5354, 2, 113, 1, 'field_repeat', 0, 'N');
INSERT INTO `r_step_attribute` VALUES (5355, 2, 113, 1, 'field_format', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (5356, 2, 113, 1, 'field_currency', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (5357, 2, 113, 1, 'field_decimal', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (5358, 2, 113, 1, 'field_group', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (5359, 2, 113, 2, 'field_name', 0, 'null');
INSERT INTO `r_step_attribute` VALUES (5360, 2, 113, 2, 'field_type', 0, 'None');
INSERT INTO `r_step_attribute` VALUES (5361, 2, 113, 2, 'field_length', -1, NULL);
INSERT INTO `r_step_attribute` VALUES (5362, 2, 113, 2, 'field_precision', -1, NULL);
INSERT INTO `r_step_attribute` VALUES (5363, 2, 113, 2, 'field_trim_type', 0, 'none');
INSERT INTO `r_step_attribute` VALUES (5364, 2, 113, 2, 'field_repeat', 0, 'N');
INSERT INTO `r_step_attribute` VALUES (5365, 2, 113, 2, 'field_format', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (5366, 2, 113, 2, 'field_currency', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (5367, 2, 113, 2, 'field_decimal', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (5368, 2, 113, 2, 'field_group', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (5369, 2, 113, 3, 'field_name', 0, 'Project');
INSERT INTO `r_step_attribute` VALUES (5370, 2, 113, 3, 'field_type', 0, 'String');
INSERT INTO `r_step_attribute` VALUES (5371, 2, 113, 3, 'field_length', -1, NULL);
INSERT INTO `r_step_attribute` VALUES (5372, 2, 113, 3, 'field_precision', -1, NULL);
INSERT INTO `r_step_attribute` VALUES (5373, 2, 113, 3, 'field_trim_type', 0, 'none');
INSERT INTO `r_step_attribute` VALUES (5374, 2, 113, 3, 'field_repeat', 0, 'N');
INSERT INTO `r_step_attribute` VALUES (5375, 2, 113, 3, 'field_format', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (5376, 2, 113, 3, 'field_currency', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (5377, 2, 113, 3, 'field_decimal', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (5378, 2, 113, 3, 'field_group', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (5379, 2, 113, 4, 'field_name', 0, 'ProjectName');
INSERT INTO `r_step_attribute` VALUES (5380, 2, 113, 4, 'field_type', 0, 'Integer');
INSERT INTO `r_step_attribute` VALUES (5381, 2, 113, 4, 'field_length', -1, NULL);
INSERT INTO `r_step_attribute` VALUES (5382, 2, 113, 4, 'field_precision', -1, NULL);
INSERT INTO `r_step_attribute` VALUES (5383, 2, 113, 4, 'field_trim_type', 0, 'none');
INSERT INTO `r_step_attribute` VALUES (5384, 2, 113, 4, 'field_repeat', 0, 'N');
INSERT INTO `r_step_attribute` VALUES (5385, 2, 113, 4, 'field_format', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (5386, 2, 113, 4, 'field_currency', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (5387, 2, 113, 4, 'field_decimal', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (5388, 2, 113, 4, 'field_group', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (5389, 2, 113, 0, 'strict_types', 0, 'N');
INSERT INTO `r_step_attribute` VALUES (5390, 2, 113, 0, 'error_ignored', 0, 'N');
INSERT INTO `r_step_attribute` VALUES (5391, 2, 113, 0, 'error_line_skipped', 0, 'N');
INSERT INTO `r_step_attribute` VALUES (5392, 2, 113, 0, 'bad_line_files_dest_dir', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (5393, 2, 113, 0, 'bad_line_files_ext', 0, 'warning');
INSERT INTO `r_step_attribute` VALUES (5394, 2, 113, 0, 'error_line_files_dest_dir', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (5395, 2, 113, 0, 'error_line_files_ext', 0, 'error');
INSERT INTO `r_step_attribute` VALUES (5396, 2, 113, 0, 'line_number_files_dest_dir', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (5397, 2, 113, 0, 'line_number_files_ext', 0, 'line');
INSERT INTO `r_step_attribute` VALUES (5398, 2, 113, 0, 'shortFileFieldName', 0, 'ShortFileName');
INSERT INTO `r_step_attribute` VALUES (5399, 2, 113, 0, 'pathFieldName', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (5400, 2, 113, 0, 'hiddenFieldName', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (5401, 2, 113, 0, 'lastModificationTimeFieldName', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (5402, 2, 113, 0, 'uriNameFieldName', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (5403, 2, 113, 0, 'rootUriNameFieldName', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (5404, 2, 113, 0, 'extensionFieldName', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (5405, 2, 113, 0, 'sizeFieldName', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (5406, 2, 113, 0, 'spreadsheet_type', 0, 'POI');
INSERT INTO `r_step_attribute` VALUES (5407, 2, 113, 0, 'cluster_schema', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (5408, 2, 113, 0, 'row_distribution_code', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (5409, 2, 114, 0, 'PARTITIONING_SCHEMA', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (5410, 2, 114, 0, 'PARTITIONING_METHOD', 0, 'none');
INSERT INTO `r_step_attribute` VALUES (5411, 2, 114, 0, 'keys_1', 0, 'ProjectName');
INSERT INTO `r_step_attribute` VALUES (5412, 2, 114, 0, 'keys_2', 0, 'ProjectName');
INSERT INTO `r_step_attribute` VALUES (5413, 2, 114, 0, 'step1', 0, 'ModifiedProjectName');
INSERT INTO `r_step_attribute` VALUES (5414, 2, 114, 0, 'step2', 0, 'ModifiedProjectName 2');
INSERT INTO `r_step_attribute` VALUES (5415, 2, 114, 0, 'join_type', 0, 'INNER');
INSERT INTO `r_step_attribute` VALUES (5416, 2, 114, 0, 'cluster_schema', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (5417, 2, 114, 0, 'row_distribution_code', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (5418, 2, 115, 0, 'PARTITIONING_SCHEMA', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (5419, 2, 115, 0, 'PARTITIONING_METHOD', 0, 'none');
INSERT INTO `r_step_attribute` VALUES (5420, 2, 115, 0, 'compatible', 0, 'N');
INSERT INTO `r_step_attribute` VALUES (5421, 2, 115, 0, 'optimizationLevel', 0, '9');
INSERT INTO `r_step_attribute` VALUES (5422, 2, 115, 0, 'jsScript_name', 0, 'Script 1');
INSERT INTO `r_step_attribute` VALUES (5423, 2, 115, 0, 'jsScript_script', 0, '//Script here\r\n\r\nvar ShortFileName = ShortFileName;\r\n\r\nvar date_time = new Date();\r\n\r\nvar mn_name = substr(date_time,4,3);\r\nif(mn_name == \"Jan\"){\r\n	var mn_num = \"01\";\r\n}else if(mn_name == \"Feb\"){\r\n	var mn_num = \"02\";\r\n}else if(mn_name == \"Mar\"){\r\n	var mn_num = \"03\";\r\n}else if(mn_name == \"Apr\"){\r\n	var mn_num = \"04\";\r\n}else if(mn_name == \"May\"){\r\n	var mn_num = \"05\";\r\n}else if(mn_name == \"Jun\"){\r\n	var mn_num = \"06\";\r\n}else if(mn_name == \"Jul\"){\r\n	var mn_num = \"07\";\r\n}else if(mn_name == \"Aug\"){\r\n	var mn_num = \"08\";\r\n}else if(mn_name == \"Sep\"){\r\n	var mn_num = \"09\";\r\n}else if(mn_name == \"Oct\"){\r\n	var mn_num = \"10\";\r\n}else if(mn_name == \"Nov\"){\r\n	var mn_num = \"11\";\r\n}else if(mn_name == \"Dec\"){\r\n	var mn_num = \"12\";\r\n}\r\n\r\nvar date_time = substr(date_time,11,4)+mn_num+substr(date_time,8,2)+\"_\"+substr(date_time,16,2)+substr(date_time,19,2)+substr(date_time,22,2);\r\n\r\nvar fullname_target = ShortFileName.replace(\'.xlsx\',\'_\'+date_time+\'.xlsx\');\r\n\r\n\r\nvar fullname_target = \'C:\\\\ETL Report\\\\Archive\\\\\'+fullname_target;\r\n\r\n//var test_path_output = \'C:\\\\ETL Report\\\\Archive\\\\\'+ShortFileName;');
INSERT INTO `r_step_attribute` VALUES (5424, 2, 115, 0, 'jsScript_type', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (5425, 2, 115, 1, 'jsScript_name', 0, 'str2date_Sample');
INSERT INTO `r_step_attribute` VALUES (5426, 2, 115, 1, 'jsScript_script', 0, '// Converts the given String to a date Value.\n//\n// Usage:\n// str2date(var);\n// 1: String - The Variable with the String to convert.\n// This call uses your localized format.\n//\n// str2date(var, var);\n// 1: String - The Variable with the String to convert.\n// 2: String - The Format:\n//        yy / yyyy - 06 / 2006\n//        MM / MMM / MMMMM - 11 / Nov / November\n//        d / dd  - 1 / 01\n//        E / EEEE - Tue / Tuesday\n//        hh / HH - 11 / 23\n//        m / mm - 5 / 05\n//        s / ss - 8 / 08\n//\n// str2date(var, var, var);\n// 1: String - The Variable with the String to convert.\n// 2: String - The Format:\n// 3: String - The Locale Parameter\n//    An valid ISO Language Code. (DE = German, EN = English, FR = France, ...)\n//\n// str2date(var, var, var, var);\n// 1: String - The Variable with the String to convert.\n// 2: String - The Format:\n// 3: String - The Locale Parameter\n//    An valid ISO Language Code. (DE = German, EN = English, FR = France, ...)\n// 4: String - The Timezone Parameter.\n//    A valid timezone: EST, GMT, ... (if invalid GMT will be selected as default)\n// \n// 2006-11-15\n//\nAlert(str2date(\"01.12.2006\",\"dd.MM.yyyy\"));\nAlert(str2date(\"01.12.2006 23:23:01\",\"dd.MM.yyyy HH:mm:ss\"));\nAlert(str2date(\"Tue.May.2006\",\"E.MMM.yyyy\",\"EN\"));\nAlert(str2date(\"22.02.2008 23:23:01\",\"dd.MM.yyyy HH:mm:ss\",\"DE\"));\nAlert(str2date(\"22.02.2008 23:23:01\",\"dd.MM.yyyy HH:mm:ss\",\"DE\", \"EST\"));');
INSERT INTO `r_step_attribute` VALUES (5427, 2, 115, 1, 'jsScript_type', -1, NULL);
INSERT INTO `r_step_attribute` VALUES (5428, 2, 115, 0, 'field_name', 0, 'ShortFileName');
INSERT INTO `r_step_attribute` VALUES (5429, 2, 115, 0, 'field_rename', 0, 'ShortFileName');
INSERT INTO `r_step_attribute` VALUES (5430, 2, 115, 0, 'field_type', 0, 'String');
INSERT INTO `r_step_attribute` VALUES (5431, 2, 115, 0, 'field_length', -1, NULL);
INSERT INTO `r_step_attribute` VALUES (5432, 2, 115, 0, 'field_precision', -1, NULL);
INSERT INTO `r_step_attribute` VALUES (5433, 2, 115, 0, 'field_replace', 0, 'Y');
INSERT INTO `r_step_attribute` VALUES (5434, 2, 115, 1, 'field_name', 0, 'date_time');
INSERT INTO `r_step_attribute` VALUES (5435, 2, 115, 1, 'field_rename', 0, 'date_time');
INSERT INTO `r_step_attribute` VALUES (5436, 2, 115, 1, 'field_type', 0, 'String');
INSERT INTO `r_step_attribute` VALUES (5437, 2, 115, 1, 'field_length', -1, NULL);
INSERT INTO `r_step_attribute` VALUES (5438, 2, 115, 1, 'field_precision', -1, NULL);
INSERT INTO `r_step_attribute` VALUES (5439, 2, 115, 1, 'field_replace', 0, 'N');
INSERT INTO `r_step_attribute` VALUES (5440, 2, 115, 2, 'field_name', 0, 'fullname_target');
INSERT INTO `r_step_attribute` VALUES (5441, 2, 115, 2, 'field_rename', 0, 'fullname_target');
INSERT INTO `r_step_attribute` VALUES (5442, 2, 115, 2, 'field_type', 0, 'String');
INSERT INTO `r_step_attribute` VALUES (5443, 2, 115, 2, 'field_length', -1, NULL);
INSERT INTO `r_step_attribute` VALUES (5444, 2, 115, 2, 'field_precision', -1, NULL);
INSERT INTO `r_step_attribute` VALUES (5445, 2, 115, 2, 'field_replace', 0, 'N');
INSERT INTO `r_step_attribute` VALUES (5446, 2, 115, 0, 'cluster_schema', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (5447, 2, 115, 0, 'row_distribution_code', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (5448, 2, 116, 0, 'PARTITIONING_SCHEMA', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (5449, 2, 116, 0, 'PARTITIONING_METHOD', 0, 'none');
INSERT INTO `r_step_attribute` VALUES (5450, 2, 116, 0, 'compatible', 0, 'N');
INSERT INTO `r_step_attribute` VALUES (5451, 2, 116, 0, 'optimizationLevel', 0, '9');
INSERT INTO `r_step_attribute` VALUES (5452, 2, 116, 0, 'jsScript_name', 0, 'Script 1');
INSERT INTO `r_step_attribute` VALUES (5453, 2, 116, 0, 'jsScript_script', 0, '//Script here\r\n\r\nvar ProjectName = substr(rtrim(ltrim(ProjectName)),0,1);\r\n\r\n');
INSERT INTO `r_step_attribute` VALUES (5454, 2, 116, 0, 'jsScript_type', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (5455, 2, 116, 0, 'field_name', 0, 'ProjectName');
INSERT INTO `r_step_attribute` VALUES (5456, 2, 116, 0, 'field_rename', 0, 'ProjectName');
INSERT INTO `r_step_attribute` VALUES (5457, 2, 116, 0, 'field_type', 0, 'String');
INSERT INTO `r_step_attribute` VALUES (5458, 2, 116, 0, 'field_length', -1, NULL);
INSERT INTO `r_step_attribute` VALUES (5459, 2, 116, 0, 'field_precision', -1, NULL);
INSERT INTO `r_step_attribute` VALUES (5460, 2, 116, 0, 'field_replace', 0, 'Y');
INSERT INTO `r_step_attribute` VALUES (5461, 2, 116, 0, 'cluster_schema', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (5462, 2, 116, 0, 'row_distribution_code', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (5463, 2, 117, 0, 'PARTITIONING_SCHEMA', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (5464, 2, 117, 0, 'PARTITIONING_METHOD', 0, 'none');
INSERT INTO `r_step_attribute` VALUES (5465, 2, 117, 0, 'compatible', 0, 'N');
INSERT INTO `r_step_attribute` VALUES (5466, 2, 117, 0, 'optimizationLevel', 0, '9');
INSERT INTO `r_step_attribute` VALUES (5467, 2, 117, 0, 'jsScript_name', 0, 'Script 1');
INSERT INTO `r_step_attribute` VALUES (5468, 2, 117, 0, 'jsScript_script', 0, '//Script here\r\n\r\nvar ProjectName = substr(rtrim(ltrim(ProjectName)),0,1);\r\n\r\n');
INSERT INTO `r_step_attribute` VALUES (5469, 2, 117, 0, 'jsScript_type', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (5470, 2, 117, 0, 'field_name', 0, 'ProjectName');
INSERT INTO `r_step_attribute` VALUES (5471, 2, 117, 0, 'field_rename', 0, 'ProjectName');
INSERT INTO `r_step_attribute` VALUES (5472, 2, 117, 0, 'field_type', 0, 'String');
INSERT INTO `r_step_attribute` VALUES (5473, 2, 117, 0, 'field_length', -1, NULL);
INSERT INTO `r_step_attribute` VALUES (5474, 2, 117, 0, 'field_precision', -1, NULL);
INSERT INTO `r_step_attribute` VALUES (5475, 2, 117, 0, 'field_replace', 0, 'Y');
INSERT INTO `r_step_attribute` VALUES (5476, 2, 117, 0, 'cluster_schema', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (5477, 2, 117, 0, 'row_distribution_code', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (5478, 2, 118, 0, 'PARTITIONING_SCHEMA', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (5479, 2, 118, 0, 'PARTITIONING_METHOD', 0, 'none');
INSERT INTO `r_step_attribute` VALUES (5480, 2, 118, 0, 'sourcefilenamefield', 0, 'FullPathName');
INSERT INTO `r_step_attribute` VALUES (5481, 2, 118, 0, 'targetfilenamefield', 0, 'fullname_target');
INSERT INTO `r_step_attribute` VALUES (5482, 2, 118, 0, 'operation_type', 0, 'move');
INSERT INTO `r_step_attribute` VALUES (5483, 2, 118, 0, 'addresultfilenames', 0, 'Y');
INSERT INTO `r_step_attribute` VALUES (5484, 2, 118, 0, 'overwritetargetfile', 0, 'Y');
INSERT INTO `r_step_attribute` VALUES (5485, 2, 118, 0, 'createparentfolder', 0, 'Y');
INSERT INTO `r_step_attribute` VALUES (5486, 2, 118, 0, 'simulate', 0, 'N');
INSERT INTO `r_step_attribute` VALUES (5487, 2, 118, 0, 'cluster_schema', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (5488, 2, 118, 0, 'row_distribution_code', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (5489, 2, 119, 0, 'PARTITIONING_SCHEMA', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (5490, 2, 119, 0, 'PARTITIONING_METHOD', 0, 'none');
INSERT INTO `r_step_attribute` VALUES (5491, 2, 119, 0, 'field_name', 0, 'Project');
INSERT INTO `r_step_attribute` VALUES (5492, 2, 119, 0, 'field_rename', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (5493, 2, 119, 0, 'field_length', -2, NULL);
INSERT INTO `r_step_attribute` VALUES (5494, 2, 119, 0, 'field_precision', -2, NULL);
INSERT INTO `r_step_attribute` VALUES (5495, 2, 119, 1, 'field_name', 0, 'ProjectName');
INSERT INTO `r_step_attribute` VALUES (5496, 2, 119, 1, 'field_rename', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (5497, 2, 119, 1, 'field_length', -2, NULL);
INSERT INTO `r_step_attribute` VALUES (5498, 2, 119, 1, 'field_precision', -2, NULL);
INSERT INTO `r_step_attribute` VALUES (5499, 2, 119, 0, 'select_unspecified', 0, 'N');
INSERT INTO `r_step_attribute` VALUES (5500, 2, 119, 0, 'cluster_schema', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (5501, 2, 119, 0, 'row_distribution_code', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (5502, 2, 120, 0, 'PARTITIONING_SCHEMA', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (5503, 2, 120, 0, 'PARTITIONING_METHOD', 0, 'none');
INSERT INTO `r_step_attribute` VALUES (5504, 2, 120, 0, 'id_connection', 1, NULL);
INSERT INTO `r_step_attribute` VALUES (5505, 2, 120, 0, 'schema', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (5506, 2, 120, 0, 'table', 0, 'itec_report_project');
INSERT INTO `r_step_attribute` VALUES (5507, 2, 120, 0, 'commit', 0, '1000');
INSERT INTO `r_step_attribute` VALUES (5508, 2, 120, 0, 'truncate', 0, 'Y');
INSERT INTO `r_step_attribute` VALUES (5509, 2, 120, 0, 'ignore_errors', 0, 'N');
INSERT INTO `r_step_attribute` VALUES (5510, 2, 120, 0, 'use_batch', 0, 'Y');
INSERT INTO `r_step_attribute` VALUES (5511, 2, 120, 0, 'specify_fields', 0, 'Y');
INSERT INTO `r_step_attribute` VALUES (5512, 2, 120, 0, 'partitioning_enabled', 0, 'N');
INSERT INTO `r_step_attribute` VALUES (5513, 2, 120, 0, 'partitioning_field', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (5514, 2, 120, 0, 'partitioning_daily', 0, 'N');
INSERT INTO `r_step_attribute` VALUES (5515, 2, 120, 0, 'partitioning_monthly', 0, 'Y');
INSERT INTO `r_step_attribute` VALUES (5516, 2, 120, 0, 'tablename_in_field', 0, 'N');
INSERT INTO `r_step_attribute` VALUES (5517, 2, 120, 0, 'tablename_field', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (5518, 2, 120, 0, 'tablename_in_table', 0, 'Y');
INSERT INTO `r_step_attribute` VALUES (5519, 2, 120, 0, 'return_keys', 0, 'N');
INSERT INTO `r_step_attribute` VALUES (5520, 2, 120, 0, 'return_field', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (5521, 2, 120, 0, 'column_name', 0, 'Unit_ID');
INSERT INTO `r_step_attribute` VALUES (5522, 2, 120, 0, 'stream_name', 0, 'Unit_ID');
INSERT INTO `r_step_attribute` VALUES (5523, 2, 120, 1, 'column_name', 0, 'Owner');
INSERT INTO `r_step_attribute` VALUES (5524, 2, 120, 1, 'stream_name', 0, 'Owner');
INSERT INTO `r_step_attribute` VALUES (5525, 2, 120, 2, 'column_name', 0, 'PhoneNumber');
INSERT INTO `r_step_attribute` VALUES (5526, 2, 120, 2, 'stream_name', 0, 'PhoneNumber');
INSERT INTO `r_step_attribute` VALUES (5527, 2, 120, 3, 'column_name', 0, 'Year');
INSERT INTO `r_step_attribute` VALUES (5528, 2, 120, 3, 'stream_name', 0, 'Year');
INSERT INTO `r_step_attribute` VALUES (5529, 2, 120, 4, 'column_name', 0, 'Plans_ID');
INSERT INTO `r_step_attribute` VALUES (5530, 2, 120, 4, 'stream_name', 0, 'Plans_ID');
INSERT INTO `r_step_attribute` VALUES (5531, 2, 120, 5, 'column_name', 0, 'Budjet');
INSERT INTO `r_step_attribute` VALUES (5532, 2, 120, 5, 'stream_name', 0, 'Budjet');
INSERT INTO `r_step_attribute` VALUES (5533, 2, 120, 6, 'column_name', 0, 'Indicators_ID');
INSERT INTO `r_step_attribute` VALUES (5534, 2, 120, 6, 'stream_name', 0, 'Indicators_ID');
INSERT INTO `r_step_attribute` VALUES (5535, 2, 120, 7, 'column_name', 0, 'Goal');
INSERT INTO `r_step_attribute` VALUES (5536, 2, 120, 7, 'stream_name', 0, 'Goal');
INSERT INTO `r_step_attribute` VALUES (5537, 2, 120, 8, 'column_name', 0, 'Unit');
INSERT INTO `r_step_attribute` VALUES (5538, 2, 120, 8, 'stream_name', 0, 'Unit');
INSERT INTO `r_step_attribute` VALUES (5539, 2, 120, 9, 'column_name', 0, 'Date_Start');
INSERT INTO `r_step_attribute` VALUES (5540, 2, 120, 9, 'stream_name', 0, 'Date_Start');
INSERT INTO `r_step_attribute` VALUES (5541, 2, 120, 10, 'column_name', 0, 'Date_Finish');
INSERT INTO `r_step_attribute` VALUES (5542, 2, 120, 10, 'stream_name', 0, 'Date_Finish');
INSERT INTO `r_step_attribute` VALUES (5543, 2, 120, 11, 'column_name', 0, 'Report_Type_ID');
INSERT INTO `r_step_attribute` VALUES (5544, 2, 120, 11, 'stream_name', 0, 'Report_Type_ID');
INSERT INTO `r_step_attribute` VALUES (5545, 2, 120, 12, 'column_name', 0, 'Month1');
INSERT INTO `r_step_attribute` VALUES (5546, 2, 120, 12, 'stream_name', 0, 'Month1');
INSERT INTO `r_step_attribute` VALUES (5547, 2, 120, 13, 'column_name', 0, 'Month2');
INSERT INTO `r_step_attribute` VALUES (5548, 2, 120, 13, 'stream_name', 0, 'Month2');
INSERT INTO `r_step_attribute` VALUES (5549, 2, 120, 14, 'column_name', 0, 'Month3');
INSERT INTO `r_step_attribute` VALUES (5550, 2, 120, 14, 'stream_name', 0, 'Month3');
INSERT INTO `r_step_attribute` VALUES (5551, 2, 120, 15, 'column_name', 0, 'Month4');
INSERT INTO `r_step_attribute` VALUES (5552, 2, 120, 15, 'stream_name', 0, 'Month4');
INSERT INTO `r_step_attribute` VALUES (5553, 2, 120, 16, 'column_name', 0, 'Month5');
INSERT INTO `r_step_attribute` VALUES (5554, 2, 120, 16, 'stream_name', 0, 'Month5');
INSERT INTO `r_step_attribute` VALUES (5555, 2, 120, 17, 'column_name', 0, 'Month6');
INSERT INTO `r_step_attribute` VALUES (5556, 2, 120, 17, 'stream_name', 0, 'Month6');
INSERT INTO `r_step_attribute` VALUES (5557, 2, 120, 18, 'column_name', 0, 'Month7');
INSERT INTO `r_step_attribute` VALUES (5558, 2, 120, 18, 'stream_name', 0, 'Month7');
INSERT INTO `r_step_attribute` VALUES (5559, 2, 120, 19, 'column_name', 0, 'Month8');
INSERT INTO `r_step_attribute` VALUES (5560, 2, 120, 19, 'stream_name', 0, 'Month8');
INSERT INTO `r_step_attribute` VALUES (5561, 2, 120, 20, 'column_name', 0, 'Month9');
INSERT INTO `r_step_attribute` VALUES (5562, 2, 120, 20, 'stream_name', 0, 'Month9');
INSERT INTO `r_step_attribute` VALUES (5563, 2, 120, 21, 'column_name', 0, 'Month10');
INSERT INTO `r_step_attribute` VALUES (5564, 2, 120, 21, 'stream_name', 0, 'Month10');
INSERT INTO `r_step_attribute` VALUES (5565, 2, 120, 22, 'column_name', 0, 'Month11');
INSERT INTO `r_step_attribute` VALUES (5566, 2, 120, 22, 'stream_name', 0, 'Month11');
INSERT INTO `r_step_attribute` VALUES (5567, 2, 120, 23, 'column_name', 0, 'Month12');
INSERT INTO `r_step_attribute` VALUES (5568, 2, 120, 23, 'stream_name', 0, 'Month12');
INSERT INTO `r_step_attribute` VALUES (5569, 2, 120, 24, 'column_name', 0, 'ProjectName');
INSERT INTO `r_step_attribute` VALUES (5570, 2, 120, 24, 'stream_name', 0, 'Project');
INSERT INTO `r_step_attribute` VALUES (5571, 2, 120, 0, 'cluster_schema', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (5572, 2, 120, 0, 'row_distribution_code', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (5920, 3, 126, 0, 'PARTITIONING_SCHEMA', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (5921, 3, 126, 0, 'PARTITIONING_METHOD', 0, 'none');
INSERT INTO `r_step_attribute` VALUES (5922, 3, 126, 0, 'all_rows', 0, 'N');
INSERT INTO `r_step_attribute` VALUES (5923, 3, 126, 0, 'ignore_aggregate', 0, 'N');
INSERT INTO `r_step_attribute` VALUES (5924, 3, 126, 0, 'field_ignore', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (5925, 3, 126, 0, 'directory', 0, '%%java.io.tmpdir%%');
INSERT INTO `r_step_attribute` VALUES (5926, 3, 126, 0, 'prefix', 0, 'grp');
INSERT INTO `r_step_attribute` VALUES (5927, 3, 126, 0, 'add_linenr', 0, 'N');
INSERT INTO `r_step_attribute` VALUES (5928, 3, 126, 0, 'linenr_fieldname', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (5929, 3, 126, 0, 'give_back_row', 0, 'N');
INSERT INTO `r_step_attribute` VALUES (5930, 3, 126, 0, 'group_name', 0, 'FullPathName');
INSERT INTO `r_step_attribute` VALUES (5931, 3, 126, 1, 'group_name', 0, 'fullname_target');
INSERT INTO `r_step_attribute` VALUES (5932, 3, 126, 0, 'cluster_schema', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (5933, 3, 126, 0, 'row_distribution_code', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (5934, 3, 127, 0, 'PARTITIONING_SCHEMA', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (5935, 3, 127, 0, 'PARTITIONING_METHOD', 0, 'none');
INSERT INTO `r_step_attribute` VALUES (5936, 3, 127, 0, 'replaceAllByValue', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (5937, 3, 127, 0, 'replaceAllMask', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (5938, 3, 127, 0, 'selectFields', 0, 'Y');
INSERT INTO `r_step_attribute` VALUES (5939, 3, 127, 0, 'selectValuesType', 0, 'N');
INSERT INTO `r_step_attribute` VALUES (5940, 3, 127, 0, 'setEmptyStringAll', 0, 'N');
INSERT INTO `r_step_attribute` VALUES (5941, 3, 127, 0, 'type_name', 0, 'Number');
INSERT INTO `r_step_attribute` VALUES (5942, 3, 127, 0, 'type_replace_value', 0, '0');
INSERT INTO `r_step_attribute` VALUES (5943, 3, 127, 0, 'type_replace_mask', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (5944, 3, 127, 0, 'set_type_empty_string', 0, 'N');
INSERT INTO `r_step_attribute` VALUES (5945, 3, 127, 1, 'type_name', 0, 'String');
INSERT INTO `r_step_attribute` VALUES (5946, 3, 127, 1, 'type_replace_value', 0, '-');
INSERT INTO `r_step_attribute` VALUES (5947, 3, 127, 1, 'type_replace_mask', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (5948, 3, 127, 1, 'set_type_empty_string', 0, 'N');
INSERT INTO `r_step_attribute` VALUES (5949, 3, 127, 0, 'field_name', 0, 'M44');
INSERT INTO `r_step_attribute` VALUES (5950, 3, 127, 0, 'replace_value', 0, '0');
INSERT INTO `r_step_attribute` VALUES (5951, 3, 127, 0, 'replace_mask', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (5952, 3, 127, 0, 'set_empty_string', 0, 'N');
INSERT INTO `r_step_attribute` VALUES (5953, 3, 127, 0, 'cluster_schema', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (5954, 3, 127, 0, 'row_distribution_code', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (5955, 3, 128, 0, 'PARTITIONING_SCHEMA', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (5956, 3, 128, 0, 'PARTITIONING_METHOD', 0, 'none');
INSERT INTO `r_step_attribute` VALUES (5957, 3, 128, 0, 'header', 0, 'Y');
INSERT INTO `r_step_attribute` VALUES (5958, 3, 128, 0, 'noempty', 0, 'Y');
INSERT INTO `r_step_attribute` VALUES (5959, 3, 128, 0, 'stoponempty', 0, 'Y');
INSERT INTO `r_step_attribute` VALUES (5960, 3, 128, 0, 'filefield', 0, 'FullPathName');
INSERT INTO `r_step_attribute` VALUES (5961, 3, 128, 0, 'sheetfield', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (5962, 3, 128, 0, 'sheetrownumfield', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (5963, 3, 128, 0, 'rownumfield', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (5964, 3, 128, 0, 'limit', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (5965, 3, 128, 0, 'encoding', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (5966, 3, 128, 0, 'add_to_result_filenames', 0, 'Y');
INSERT INTO `r_step_attribute` VALUES (5967, 3, 128, 0, 'accept_filenames', 0, 'N');
INSERT INTO `r_step_attribute` VALUES (5968, 3, 128, 0, 'accept_field', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (5969, 3, 128, 0, 'accept_stepname', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (5970, 3, 128, 0, 'file_name', 0, 'C:\\ETL Report\\ระบบที่ 5 รายงานข้อ 2.4_ETL_m_indicators.xlsx');
INSERT INTO `r_step_attribute` VALUES (5971, 3, 128, 0, 'file_mask', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (5972, 3, 128, 0, 'exclude_file_mask', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (5973, 3, 128, 0, 'file_required', 0, 'N');
INSERT INTO `r_step_attribute` VALUES (5974, 3, 128, 0, 'include_subfolders', 0, 'N');
INSERT INTO `r_step_attribute` VALUES (5975, 3, 128, 0, 'sheet_name', 0, 'Database');
INSERT INTO `r_step_attribute` VALUES (5976, 3, 128, 0, 'sheet_startrow', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (5977, 3, 128, 0, 'sheet_startcol', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (5978, 3, 128, 0, 'field_name', 0, 'Year');
INSERT INTO `r_step_attribute` VALUES (5979, 3, 128, 0, 'field_type', 0, 'Integer');
INSERT INTO `r_step_attribute` VALUES (5980, 3, 128, 0, 'field_length', -1, NULL);
INSERT INTO `r_step_attribute` VALUES (5981, 3, 128, 0, 'field_precision', -1, NULL);
INSERT INTO `r_step_attribute` VALUES (5982, 3, 128, 0, 'field_trim_type', 0, 'none');
INSERT INTO `r_step_attribute` VALUES (5983, 3, 128, 0, 'field_repeat', 0, 'N');
INSERT INTO `r_step_attribute` VALUES (5984, 3, 128, 0, 'field_format', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (5985, 3, 128, 0, 'field_currency', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (5986, 3, 128, 0, 'field_decimal', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (5987, 3, 128, 0, 'field_group', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (5988, 3, 128, 1, 'field_name', 0, 'Side_ID');
INSERT INTO `r_step_attribute` VALUES (5989, 3, 128, 1, 'field_type', 0, 'Integer');
INSERT INTO `r_step_attribute` VALUES (5990, 3, 128, 1, 'field_length', -1, NULL);
INSERT INTO `r_step_attribute` VALUES (5991, 3, 128, 1, 'field_precision', -1, NULL);
INSERT INTO `r_step_attribute` VALUES (5992, 3, 128, 1, 'field_trim_type', 0, 'none');
INSERT INTO `r_step_attribute` VALUES (5993, 3, 128, 1, 'field_repeat', 0, 'N');
INSERT INTO `r_step_attribute` VALUES (5994, 3, 128, 1, 'field_format', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (5995, 3, 128, 1, 'field_currency', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (5996, 3, 128, 1, 'field_decimal', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (5997, 3, 128, 1, 'field_group', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (5998, 3, 128, 2, 'field_name', 0, 'Type_ID');
INSERT INTO `r_step_attribute` VALUES (5999, 3, 128, 2, 'field_type', 0, 'Integer');
INSERT INTO `r_step_attribute` VALUES (6000, 3, 128, 2, 'field_length', -1, NULL);
INSERT INTO `r_step_attribute` VALUES (6001, 3, 128, 2, 'field_precision', -1, NULL);
INSERT INTO `r_step_attribute` VALUES (6002, 3, 128, 2, 'field_trim_type', 0, 'none');
INSERT INTO `r_step_attribute` VALUES (6003, 3, 128, 2, 'field_repeat', 0, 'N');
INSERT INTO `r_step_attribute` VALUES (6004, 3, 128, 2, 'field_format', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (6005, 3, 128, 2, 'field_currency', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (6006, 3, 128, 2, 'field_decimal', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (6007, 3, 128, 2, 'field_group', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (6008, 3, 128, 3, 'field_name', 0, 'Name');
INSERT INTO `r_step_attribute` VALUES (6009, 3, 128, 3, 'field_type', 0, 'String');
INSERT INTO `r_step_attribute` VALUES (6010, 3, 128, 3, 'field_length', -1, NULL);
INSERT INTO `r_step_attribute` VALUES (6011, 3, 128, 3, 'field_precision', -1, NULL);
INSERT INTO `r_step_attribute` VALUES (6012, 3, 128, 3, 'field_trim_type', 0, 'none');
INSERT INTO `r_step_attribute` VALUES (6013, 3, 128, 3, 'field_repeat', 0, 'N');
INSERT INTO `r_step_attribute` VALUES (6014, 3, 128, 3, 'field_format', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (6015, 3, 128, 3, 'field_currency', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (6016, 3, 128, 3, 'field_decimal', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (6017, 3, 128, 3, 'field_group', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (6018, 3, 128, 4, 'field_name', 0, 'Goal');
INSERT INTO `r_step_attribute` VALUES (6019, 3, 128, 4, 'field_type', 0, 'Integer');
INSERT INTO `r_step_attribute` VALUES (6020, 3, 128, 4, 'field_length', -1, NULL);
INSERT INTO `r_step_attribute` VALUES (6021, 3, 128, 4, 'field_precision', -1, NULL);
INSERT INTO `r_step_attribute` VALUES (6022, 3, 128, 4, 'field_trim_type', 0, 'none');
INSERT INTO `r_step_attribute` VALUES (6023, 3, 128, 4, 'field_repeat', 0, 'N');
INSERT INTO `r_step_attribute` VALUES (6024, 3, 128, 4, 'field_format', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (6025, 3, 128, 4, 'field_currency', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (6026, 3, 128, 4, 'field_decimal', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (6027, 3, 128, 4, 'field_group', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (6028, 3, 128, 5, 'field_name', 0, 'Unit');
INSERT INTO `r_step_attribute` VALUES (6029, 3, 128, 5, 'field_type', 0, 'String');
INSERT INTO `r_step_attribute` VALUES (6030, 3, 128, 5, 'field_length', -1, NULL);
INSERT INTO `r_step_attribute` VALUES (6031, 3, 128, 5, 'field_precision', -1, NULL);
INSERT INTO `r_step_attribute` VALUES (6032, 3, 128, 5, 'field_trim_type', 0, 'none');
INSERT INTO `r_step_attribute` VALUES (6033, 3, 128, 5, 'field_repeat', 0, 'N');
INSERT INTO `r_step_attribute` VALUES (6034, 3, 128, 5, 'field_format', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (6035, 3, 128, 5, 'field_currency', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (6036, 3, 128, 5, 'field_decimal', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (6037, 3, 128, 5, 'field_group', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (6038, 3, 128, 6, 'field_name', 0, 'M44');
INSERT INTO `r_step_attribute` VALUES (6039, 3, 128, 6, 'field_type', 0, 'Integer');
INSERT INTO `r_step_attribute` VALUES (6040, 3, 128, 6, 'field_length', -1, NULL);
INSERT INTO `r_step_attribute` VALUES (6041, 3, 128, 6, 'field_precision', -1, NULL);
INSERT INTO `r_step_attribute` VALUES (6042, 3, 128, 6, 'field_trim_type', 0, 'none');
INSERT INTO `r_step_attribute` VALUES (6043, 3, 128, 6, 'field_repeat', 0, 'N');
INSERT INTO `r_step_attribute` VALUES (6044, 3, 128, 6, 'field_format', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (6045, 3, 128, 6, 'field_currency', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (6046, 3, 128, 6, 'field_decimal', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (6047, 3, 128, 6, 'field_group', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (6048, 3, 128, 0, 'strict_types', 0, 'N');
INSERT INTO `r_step_attribute` VALUES (6049, 3, 128, 0, 'error_ignored', 0, 'N');
INSERT INTO `r_step_attribute` VALUES (6050, 3, 128, 0, 'error_line_skipped', 0, 'N');
INSERT INTO `r_step_attribute` VALUES (6051, 3, 128, 0, 'bad_line_files_dest_dir', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (6052, 3, 128, 0, 'bad_line_files_ext', 0, 'warning');
INSERT INTO `r_step_attribute` VALUES (6053, 3, 128, 0, 'error_line_files_dest_dir', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (6054, 3, 128, 0, 'error_line_files_ext', 0, 'error');
INSERT INTO `r_step_attribute` VALUES (6055, 3, 128, 0, 'line_number_files_dest_dir', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (6056, 3, 128, 0, 'line_number_files_ext', 0, 'line');
INSERT INTO `r_step_attribute` VALUES (6057, 3, 128, 0, 'shortFileFieldName', 0, 'ShortFileName');
INSERT INTO `r_step_attribute` VALUES (6058, 3, 128, 0, 'pathFieldName', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (6059, 3, 128, 0, 'hiddenFieldName', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (6060, 3, 128, 0, 'lastModificationTimeFieldName', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (6061, 3, 128, 0, 'uriNameFieldName', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (6062, 3, 128, 0, 'rootUriNameFieldName', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (6063, 3, 128, 0, 'extensionFieldName', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (6064, 3, 128, 0, 'sizeFieldName', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (6065, 3, 128, 0, 'spreadsheet_type', 0, 'POI');
INSERT INTO `r_step_attribute` VALUES (6066, 3, 128, 0, 'cluster_schema', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (6067, 3, 128, 0, 'row_distribution_code', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (6068, 3, 129, 0, 'PARTITIONING_SCHEMA', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (6069, 3, 129, 0, 'PARTITIONING_METHOD', 0, 'none');
INSERT INTO `r_step_attribute` VALUES (6070, 3, 129, 0, 'compatible', 0, 'N');
INSERT INTO `r_step_attribute` VALUES (6071, 3, 129, 0, 'optimizationLevel', 0, '9');
INSERT INTO `r_step_attribute` VALUES (6072, 3, 129, 0, 'jsScript_name', 0, 'Script 1');
INSERT INTO `r_step_attribute` VALUES (6073, 3, 129, 0, 'jsScript_script', 0, '//Script here\r\n\r\nvar ShortFileName = ShortFileName;\r\n\r\nvar date_time = new Date();\r\n\r\nvar mn_name = substr(date_time,4,3);\r\nif(mn_name == \"Jan\"){\r\n	var mn_num = \"01\";\r\n}else if(mn_name == \"Feb\"){\r\n	var mn_num = \"02\";\r\n}else if(mn_name == \"Mar\"){\r\n	var mn_num = \"03\";\r\n}else if(mn_name == \"Apr\"){\r\n	var mn_num = \"04\";\r\n}else if(mn_name == \"May\"){\r\n	var mn_num = \"05\";\r\n}else if(mn_name == \"Jun\"){\r\n	var mn_num = \"06\";\r\n}else if(mn_name == \"Jul\"){\r\n	var mn_num = \"07\";\r\n}else if(mn_name == \"Aug\"){\r\n	var mn_num = \"08\";\r\n}else if(mn_name == \"Sep\"){\r\n	var mn_num = \"09\";\r\n}else if(mn_name == \"Oct\"){\r\n	var mn_num = \"10\";\r\n}else if(mn_name == \"Nov\"){\r\n	var mn_num = \"11\";\r\n}else if(mn_name == \"Dec\"){\r\n	var mn_num = \"12\";\r\n}\r\n\r\nvar date_time = substr(date_time,11,4)+mn_num+substr(date_time,8,2)+\"_\"+substr(date_time,16,2)+substr(date_time,19,2)+substr(date_time,22,2);\r\n\r\nvar fullname_target = ShortFileName.replace(\'.xlsx\',\'_\'+date_time+\'.xlsx\');\r\n\r\n\r\n\r\nvar fullname_target = \'C:\\\\ETL Report\\\\Archive\\\\\'+fullname_target;\r\n');
INSERT INTO `r_step_attribute` VALUES (6074, 3, 129, 0, 'jsScript_type', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (6075, 3, 129, 1, 'jsScript_name', 0, 'str2date_Sample');
INSERT INTO `r_step_attribute` VALUES (6076, 3, 129, 1, 'jsScript_script', 0, '// Converts the given String to a date Value.\n//\n// Usage:\n// str2date(var);\n// 1: String - The Variable with the String to convert.\n// This call uses your localized format.\n//\n// str2date(var, var);\n// 1: String - The Variable with the String to convert.\n// 2: String - The Format:\n//        yy / yyyy - 06 / 2006\n//        MM / MMM / MMMMM - 11 / Nov / November\n//        d / dd  - 1 / 01\n//        E / EEEE - Tue / Tuesday\n//        hh / HH - 11 / 23\n//        m / mm - 5 / 05\n//        s / ss - 8 / 08\n//\n// str2date(var, var, var);\n// 1: String - The Variable with the String to convert.\n// 2: String - The Format:\n// 3: String - The Locale Parameter\n//    An valid ISO Language Code. (DE = German, EN = English, FR = France, ...)\n//\n// str2date(var, var, var, var);\n// 1: String - The Variable with the String to convert.\n// 2: String - The Format:\n// 3: String - The Locale Parameter\n//    An valid ISO Language Code. (DE = German, EN = English, FR = France, ...)\n// 4: String - The Timezone Parameter.\n//    A valid timezone: EST, GMT, ... (if invalid GMT will be selected as default)\n// \n// 2006-11-15\n//\nAlert(str2date(\"01.12.2006\",\"dd.MM.yyyy\"));\nAlert(str2date(\"01.12.2006 23:23:01\",\"dd.MM.yyyy HH:mm:ss\"));\nAlert(str2date(\"Tue.May.2006\",\"E.MMM.yyyy\",\"EN\"));\nAlert(str2date(\"22.02.2008 23:23:01\",\"dd.MM.yyyy HH:mm:ss\",\"DE\"));\nAlert(str2date(\"22.02.2008 23:23:01\",\"dd.MM.yyyy HH:mm:ss\",\"DE\", \"EST\"));');
INSERT INTO `r_step_attribute` VALUES (6077, 3, 129, 1, 'jsScript_type', -1, NULL);
INSERT INTO `r_step_attribute` VALUES (6078, 3, 129, 0, 'field_name', 0, 'ShortFileName');
INSERT INTO `r_step_attribute` VALUES (6079, 3, 129, 0, 'field_rename', 0, 'ShortFileName');
INSERT INTO `r_step_attribute` VALUES (6080, 3, 129, 0, 'field_type', 0, 'String');
INSERT INTO `r_step_attribute` VALUES (6081, 3, 129, 0, 'field_length', -1, NULL);
INSERT INTO `r_step_attribute` VALUES (6082, 3, 129, 0, 'field_precision', -1, NULL);
INSERT INTO `r_step_attribute` VALUES (6083, 3, 129, 0, 'field_replace', 0, 'Y');
INSERT INTO `r_step_attribute` VALUES (6084, 3, 129, 1, 'field_name', 0, 'date_time');
INSERT INTO `r_step_attribute` VALUES (6085, 3, 129, 1, 'field_rename', 0, 'date_time');
INSERT INTO `r_step_attribute` VALUES (6086, 3, 129, 1, 'field_type', 0, 'String');
INSERT INTO `r_step_attribute` VALUES (6087, 3, 129, 1, 'field_length', -1, NULL);
INSERT INTO `r_step_attribute` VALUES (6088, 3, 129, 1, 'field_precision', -1, NULL);
INSERT INTO `r_step_attribute` VALUES (6089, 3, 129, 1, 'field_replace', 0, 'N');
INSERT INTO `r_step_attribute` VALUES (6090, 3, 129, 2, 'field_name', 0, 'mn_name');
INSERT INTO `r_step_attribute` VALUES (6091, 3, 129, 2, 'field_rename', 0, 'mn_name');
INSERT INTO `r_step_attribute` VALUES (6092, 3, 129, 2, 'field_type', 0, 'String');
INSERT INTO `r_step_attribute` VALUES (6093, 3, 129, 2, 'field_length', -1, NULL);
INSERT INTO `r_step_attribute` VALUES (6094, 3, 129, 2, 'field_precision', -1, NULL);
INSERT INTO `r_step_attribute` VALUES (6095, 3, 129, 2, 'field_replace', 0, 'N');
INSERT INTO `r_step_attribute` VALUES (6096, 3, 129, 3, 'field_name', 0, 'mn_num');
INSERT INTO `r_step_attribute` VALUES (6097, 3, 129, 3, 'field_rename', 0, 'mn_num');
INSERT INTO `r_step_attribute` VALUES (6098, 3, 129, 3, 'field_type', 0, 'String');
INSERT INTO `r_step_attribute` VALUES (6099, 3, 129, 3, 'field_length', -1, NULL);
INSERT INTO `r_step_attribute` VALUES (6100, 3, 129, 3, 'field_precision', -1, NULL);
INSERT INTO `r_step_attribute` VALUES (6101, 3, 129, 3, 'field_replace', 0, 'N');
INSERT INTO `r_step_attribute` VALUES (6102, 3, 129, 4, 'field_name', 0, 'fullname_target');
INSERT INTO `r_step_attribute` VALUES (6103, 3, 129, 4, 'field_rename', 0, 'fullname_target');
INSERT INTO `r_step_attribute` VALUES (6104, 3, 129, 4, 'field_type', 0, 'String');
INSERT INTO `r_step_attribute` VALUES (6105, 3, 129, 4, 'field_length', -1, NULL);
INSERT INTO `r_step_attribute` VALUES (6106, 3, 129, 4, 'field_precision', -1, NULL);
INSERT INTO `r_step_attribute` VALUES (6107, 3, 129, 4, 'field_replace', 0, 'N');
INSERT INTO `r_step_attribute` VALUES (6108, 3, 129, 0, 'cluster_schema', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (6109, 3, 129, 0, 'row_distribution_code', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (6110, 3, 130, 0, 'PARTITIONING_SCHEMA', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (6111, 3, 130, 0, 'PARTITIONING_METHOD', 0, 'none');
INSERT INTO `r_step_attribute` VALUES (6112, 3, 130, 0, 'sourcefilenamefield', 0, 'FullPathName');
INSERT INTO `r_step_attribute` VALUES (6113, 3, 130, 0, 'targetfilenamefield', 0, 'fullname_target');
INSERT INTO `r_step_attribute` VALUES (6114, 3, 130, 0, 'operation_type', 0, 'move');
INSERT INTO `r_step_attribute` VALUES (6115, 3, 130, 0, 'addresultfilenames', 0, 'Y');
INSERT INTO `r_step_attribute` VALUES (6116, 3, 130, 0, 'overwritetargetfile', 0, 'Y');
INSERT INTO `r_step_attribute` VALUES (6117, 3, 130, 0, 'createparentfolder', 0, 'Y');
INSERT INTO `r_step_attribute` VALUES (6118, 3, 130, 0, 'simulate', 0, 'N');
INSERT INTO `r_step_attribute` VALUES (6119, 3, 130, 0, 'cluster_schema', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (6120, 3, 130, 0, 'row_distribution_code', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (6121, 3, 131, 0, 'PARTITIONING_SCHEMA', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (6122, 3, 131, 0, 'PARTITIONING_METHOD', 0, 'none');
INSERT INTO `r_step_attribute` VALUES (6123, 3, 131, 0, 'id_connection', 1, NULL);
INSERT INTO `r_step_attribute` VALUES (6124, 3, 131, 0, 'sql', 0, 'CREATE TABLE `itec_report_project`  (\r\n  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT \'รหัสโครงการ\',\r\n  `Unit_ID` int(11) DEFAULT NULL COMMENT \'รหัสหน่วยงาน\',\r\n  `Owner` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT \'ชื่อ - นามสกุลผู้จัดทำข้อมูล\',\r\n  `PhoneNumber` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT \'เบอร์โทรศัพท์ติดต่อ\',\r\n  `Year` int(4) DEFAULT NULL COMMENT \'ปี\',\r\n  `ProjectName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT \'ชื่อโครงการ\',\r\n  `Plans_ID` int(11) DEFAULT NULL COMMENT \'รหัสแผนงาน/กิจกรรม\',\r\n  `Budjet` double(11, 2) DEFAULT NULL COMMENT \'งบประมาณที่ได้รับ\',\r\n  `Indicators_ID` int(11) DEFAULT NULL COMMENT \'รหัสตัวชี้วัด\',\r\n  `Goal` int(11) DEFAULT NULL COMMENT \'เป้าหมายโครงการ\',\r\n  `Unit` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT \'หน่วย\',\r\n  `Date_Start` datetime DEFAULT NULL COMMENT \'วันที่เริ่มโครงการ\',\r\n  `Date_Finish` datetime DEFAULT NULL COMMENT \'วันที่สิ้นสุดโครงการ\',\r\n  `Report_Type_ID` int(11) DEFAULT NULL COMMENT \'รหัสการรายงาน\',\r\n  `Month1` double(11, 2) DEFAULT NULL COMMENT \'ข้อมูลรายงานเดือนที่ 1\',\r\n  `Month2` double(11, 2) DEFAULT NULL COMMENT \'ข้อมูลรายงานเดือนที่ 2\',\r\n  `Month3` double(11, 2) DEFAULT NULL COMMENT \'ข้อมูลรายงานเดือนที่ 3\',\r\n  `Month4` double(11, 2) DEFAULT NULL COMMENT \'ข้อมูลรายงานเดือนที่ 4\',\r\n  `Month5` double(11, 2) DEFAULT NULL COMMENT \'ข้อมูลรายงานเดือนที่ 5\',\r\n  `Month6` double(11, 2) DEFAULT NULL COMMENT \'ข้อมูลรายงานเดือนที่ 6\',\r\n  `Month7` double(11, 2) DEFAULT NULL COMMENT \'ข้อมูลรายงานเดือนที่ 7\',\r\n  `Month8` double(11, 2) DEFAULT NULL COMMENT \'ข้อมูลรายงานเดือนที่ 8\',\r\n  `Month9` double(11, 2) DEFAULT NULL COMMENT \'ข้อมูลรายงานเดือนที่ 9\',\r\n  `Month10` double(11, 2) DEFAULT NULL COMMENT \'ข้อมูลรายงานเดือนที่ 10\',\r\n  `Month11` double(11, 2) DEFAULT NULL COMMENT \'ข้อมูลรายงานเดือนที่ 11\',\r\n  `Month12` double(11, 2) DEFAULT NULL COMMENT \'ข้อมูลรายงานเดือนที่ 12\',\r\n  PRIMARY KEY (`ID`) USING BTREE,\r\n  UNIQUE INDEX `iTec_Report_Project_UK`(`Unit_ID`, `Year`, `ProjectName`, `Plans_ID`, `Indicators_ID`, `Report_Type_ID`) USING BTREE,\r\n  INDEX `Plans_ID_FK`(`Plans_ID`) USING BTREE,\r\n  INDEX `ID`(`ID`) USING BTREE,\r\n  INDEX `Report_Type_ID_FK`(`Report_Type_ID`) USING BTREE,\r\n  INDEX `Indicators_ID00_FK`(`Indicators_ID`) USING BTREE,\r\n  CONSTRAINT `Indicators_ID00_FK` FOREIGN KEY (`Indicators_ID`) REFERENCES `m_indicators` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,\r\n  CONSTRAINT `Plans_ID_FK` FOREIGN KEY (`Plans_ID`) REFERENCES `m_plans` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,\r\n  CONSTRAINT `Report_Type_ID_FK` FOREIGN KEY (`Report_Type_ID`) REFERENCES `m_report_type` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,\r\n  CONSTRAINT `Unit_ID_FK` FOREIGN KEY (`Unit_ID`) REFERENCES `m_unit` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT\r\n) ENGINE = InnoDB AUTO_INCREMENT = 79 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;');
INSERT INTO `r_step_attribute` VALUES (6125, 3, 131, 0, 'execute_each_row', 0, 'N');
INSERT INTO `r_step_attribute` VALUES (6126, 3, 131, 0, 'single_statement', 0, 'N');
INSERT INTO `r_step_attribute` VALUES (6127, 3, 131, 0, 'replace_variables', 0, 'N');
INSERT INTO `r_step_attribute` VALUES (6128, 3, 131, 0, 'quoteString', 0, 'N');
INSERT INTO `r_step_attribute` VALUES (6129, 3, 131, 0, 'set_params', 0, 'N');
INSERT INTO `r_step_attribute` VALUES (6130, 3, 131, 0, 'insert_field', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (6131, 3, 131, 0, 'update_field', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (6132, 3, 131, 0, 'delete_field', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (6133, 3, 131, 0, 'read_field', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (6134, 3, 131, 0, 'cluster_schema', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (6135, 3, 131, 0, 'row_distribution_code', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (6136, 3, 132, 0, 'PARTITIONING_SCHEMA', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (6137, 3, 132, 0, 'PARTITIONING_METHOD', 0, 'none');
INSERT INTO `r_step_attribute` VALUES (6138, 3, 132, 0, 'id_connection', 1, NULL);
INSERT INTO `r_step_attribute` VALUES (6139, 3, 132, 0, 'schema', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (6140, 3, 132, 0, 'table', 0, 'm_indicators');
INSERT INTO `r_step_attribute` VALUES (6141, 3, 132, 0, 'commit', 0, '1000');
INSERT INTO `r_step_attribute` VALUES (6142, 3, 132, 0, 'truncate', 0, 'Y');
INSERT INTO `r_step_attribute` VALUES (6143, 3, 132, 0, 'ignore_errors', 0, 'N');
INSERT INTO `r_step_attribute` VALUES (6144, 3, 132, 0, 'use_batch', 0, 'Y');
INSERT INTO `r_step_attribute` VALUES (6145, 3, 132, 0, 'specify_fields', 0, 'Y');
INSERT INTO `r_step_attribute` VALUES (6146, 3, 132, 0, 'partitioning_enabled', 0, 'N');
INSERT INTO `r_step_attribute` VALUES (6147, 3, 132, 0, 'partitioning_field', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (6148, 3, 132, 0, 'partitioning_daily', 0, 'N');
INSERT INTO `r_step_attribute` VALUES (6149, 3, 132, 0, 'partitioning_monthly', 0, 'Y');
INSERT INTO `r_step_attribute` VALUES (6150, 3, 132, 0, 'tablename_in_field', 0, 'N');
INSERT INTO `r_step_attribute` VALUES (6151, 3, 132, 0, 'tablename_field', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (6152, 3, 132, 0, 'tablename_in_table', 0, 'Y');
INSERT INTO `r_step_attribute` VALUES (6153, 3, 132, 0, 'return_keys', 0, 'N');
INSERT INTO `r_step_attribute` VALUES (6154, 3, 132, 0, 'return_field', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (6155, 3, 132, 0, 'column_name', 0, 'Year');
INSERT INTO `r_step_attribute` VALUES (6156, 3, 132, 0, 'stream_name', 0, 'Year');
INSERT INTO `r_step_attribute` VALUES (6157, 3, 132, 1, 'column_name', 0, 'Side_ID');
INSERT INTO `r_step_attribute` VALUES (6158, 3, 132, 1, 'stream_name', 0, 'Side_ID');
INSERT INTO `r_step_attribute` VALUES (6159, 3, 132, 2, 'column_name', 0, 'Type_ID');
INSERT INTO `r_step_attribute` VALUES (6160, 3, 132, 2, 'stream_name', 0, 'Type_ID');
INSERT INTO `r_step_attribute` VALUES (6161, 3, 132, 3, 'column_name', 0, 'Name');
INSERT INTO `r_step_attribute` VALUES (6162, 3, 132, 3, 'stream_name', 0, 'Name');
INSERT INTO `r_step_attribute` VALUES (6163, 3, 132, 4, 'column_name', 0, 'Goal');
INSERT INTO `r_step_attribute` VALUES (6164, 3, 132, 4, 'stream_name', 0, 'Goal');
INSERT INTO `r_step_attribute` VALUES (6165, 3, 132, 5, 'column_name', 0, 'Unit');
INSERT INTO `r_step_attribute` VALUES (6166, 3, 132, 5, 'stream_name', 0, 'Unit');
INSERT INTO `r_step_attribute` VALUES (6167, 3, 132, 6, 'column_name', 0, 'M44');
INSERT INTO `r_step_attribute` VALUES (6168, 3, 132, 6, 'stream_name', 0, 'M44');
INSERT INTO `r_step_attribute` VALUES (6169, 3, 132, 0, 'cluster_schema', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (6170, 3, 132, 0, 'row_distribution_code', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (6171, 1, 133, 0, 'PARTITIONING_SCHEMA', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (6172, 1, 133, 0, 'PARTITIONING_METHOD', 0, 'none');
INSERT INTO `r_step_attribute` VALUES (6173, 1, 133, 0, 'all_rows', 0, 'N');
INSERT INTO `r_step_attribute` VALUES (6174, 1, 133, 0, 'ignore_aggregate', 0, 'N');
INSERT INTO `r_step_attribute` VALUES (6175, 1, 133, 0, 'field_ignore', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (6176, 1, 133, 0, 'directory', 0, '%%java.io.tmpdir%%');
INSERT INTO `r_step_attribute` VALUES (6177, 1, 133, 0, 'prefix', 0, 'grp');
INSERT INTO `r_step_attribute` VALUES (6178, 1, 133, 0, 'add_linenr', 0, 'N');
INSERT INTO `r_step_attribute` VALUES (6179, 1, 133, 0, 'linenr_fieldname', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (6180, 1, 133, 0, 'give_back_row', 0, 'N');
INSERT INTO `r_step_attribute` VALUES (6181, 1, 133, 0, 'group_name', 0, 'FullPathName');
INSERT INTO `r_step_attribute` VALUES (6182, 1, 133, 1, 'group_name', 0, 'fullname_target');
INSERT INTO `r_step_attribute` VALUES (6183, 1, 133, 0, 'cluster_schema', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (6184, 1, 133, 0, 'row_distribution_code', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (6185, 1, 134, 0, 'PARTITIONING_SCHEMA', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (6186, 1, 134, 0, 'PARTITIONING_METHOD', 0, 'none');
INSERT INTO `r_step_attribute` VALUES (6187, 1, 134, 0, 'header', 0, 'Y');
INSERT INTO `r_step_attribute` VALUES (6188, 1, 134, 0, 'noempty', 0, 'Y');
INSERT INTO `r_step_attribute` VALUES (6189, 1, 134, 0, 'stoponempty', 0, 'Y');
INSERT INTO `r_step_attribute` VALUES (6190, 1, 134, 0, 'filefield', 0, 'FullPathName');
INSERT INTO `r_step_attribute` VALUES (6191, 1, 134, 0, 'sheetfield', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (6192, 1, 134, 0, 'sheetrownumfield', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (6193, 1, 134, 0, 'rownumfield', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (6194, 1, 134, 0, 'limit', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (6195, 1, 134, 0, 'encoding', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (6196, 1, 134, 0, 'add_to_result_filenames', 0, 'Y');
INSERT INTO `r_step_attribute` VALUES (6197, 1, 134, 0, 'accept_filenames', 0, 'N');
INSERT INTO `r_step_attribute` VALUES (6198, 1, 134, 0, 'accept_field', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (6199, 1, 134, 0, 'accept_stepname', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (6200, 1, 134, 0, 'file_name', 0, 'C:\\ETL Report\\ระบบที่ 5 รายงานข้อ 2.2_ETL_itec-report_budget.xlsx');
INSERT INTO `r_step_attribute` VALUES (6201, 1, 134, 0, 'file_mask', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (6202, 1, 134, 0, 'exclude_file_mask', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (6203, 1, 134, 0, 'file_required', 0, 'N');
INSERT INTO `r_step_attribute` VALUES (6204, 1, 134, 0, 'include_subfolders', 0, 'N');
INSERT INTO `r_step_attribute` VALUES (6205, 1, 134, 0, 'sheet_name', 0, 'Database');
INSERT INTO `r_step_attribute` VALUES (6206, 1, 134, 0, 'sheet_startrow', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (6207, 1, 134, 0, 'sheet_startcol', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (6208, 1, 134, 0, 'field_name', 0, 'Year');
INSERT INTO `r_step_attribute` VALUES (6209, 1, 134, 0, 'field_type', 0, 'Integer');
INSERT INTO `r_step_attribute` VALUES (6210, 1, 134, 0, 'field_length', -1, NULL);
INSERT INTO `r_step_attribute` VALUES (6211, 1, 134, 0, 'field_precision', -1, NULL);
INSERT INTO `r_step_attribute` VALUES (6212, 1, 134, 0, 'field_trim_type', 0, 'none');
INSERT INTO `r_step_attribute` VALUES (6213, 1, 134, 0, 'field_repeat', 0, 'N');
INSERT INTO `r_step_attribute` VALUES (6214, 1, 134, 0, 'field_format', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (6215, 1, 134, 0, 'field_currency', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (6216, 1, 134, 0, 'field_decimal', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (6217, 1, 134, 0, 'field_group', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (6218, 1, 134, 1, 'field_name', 0, 'Mouth');
INSERT INTO `r_step_attribute` VALUES (6219, 1, 134, 1, 'field_type', 0, 'Integer');
INSERT INTO `r_step_attribute` VALUES (6220, 1, 134, 1, 'field_length', -1, NULL);
INSERT INTO `r_step_attribute` VALUES (6221, 1, 134, 1, 'field_precision', -1, NULL);
INSERT INTO `r_step_attribute` VALUES (6222, 1, 134, 1, 'field_trim_type', 0, 'none');
INSERT INTO `r_step_attribute` VALUES (6223, 1, 134, 1, 'field_repeat', 0, 'N');
INSERT INTO `r_step_attribute` VALUES (6224, 1, 134, 1, 'field_format', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (6225, 1, 134, 1, 'field_currency', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (6226, 1, 134, 1, 'field_decimal', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (6227, 1, 134, 1, 'field_group', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (6228, 1, 134, 2, 'field_name', 0, 'Unit_id');
INSERT INTO `r_step_attribute` VALUES (6229, 1, 134, 2, 'field_type', 0, 'Integer');
INSERT INTO `r_step_attribute` VALUES (6230, 1, 134, 2, 'field_length', -1, NULL);
INSERT INTO `r_step_attribute` VALUES (6231, 1, 134, 2, 'field_precision', -1, NULL);
INSERT INTO `r_step_attribute` VALUES (6232, 1, 134, 2, 'field_trim_type', 0, 'none');
INSERT INTO `r_step_attribute` VALUES (6233, 1, 134, 2, 'field_repeat', 0, 'N');
INSERT INTO `r_step_attribute` VALUES (6234, 1, 134, 2, 'field_format', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (6235, 1, 134, 2, 'field_currency', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (6236, 1, 134, 2, 'field_decimal', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (6237, 1, 134, 2, 'field_group', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (6238, 1, 134, 3, 'field_name', 0, 'Staff_budget');
INSERT INTO `r_step_attribute` VALUES (6239, 1, 134, 3, 'field_type', 0, 'Integer');
INSERT INTO `r_step_attribute` VALUES (6240, 1, 134, 3, 'field_length', -1, NULL);
INSERT INTO `r_step_attribute` VALUES (6241, 1, 134, 3, 'field_precision', -1, NULL);
INSERT INTO `r_step_attribute` VALUES (6242, 1, 134, 3, 'field_trim_type', 0, 'none');
INSERT INTO `r_step_attribute` VALUES (6243, 1, 134, 3, 'field_repeat', 0, 'N');
INSERT INTO `r_step_attribute` VALUES (6244, 1, 134, 3, 'field_format', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (6245, 1, 134, 3, 'field_currency', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (6246, 1, 134, 3, 'field_decimal', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (6247, 1, 134, 3, 'field_group', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (6248, 1, 134, 4, 'field_name', 0, 'Staff_Used_1');
INSERT INTO `r_step_attribute` VALUES (6249, 1, 134, 4, 'field_type', 0, 'Integer');
INSERT INTO `r_step_attribute` VALUES (6250, 1, 134, 4, 'field_length', -1, NULL);
INSERT INTO `r_step_attribute` VALUES (6251, 1, 134, 4, 'field_precision', -1, NULL);
INSERT INTO `r_step_attribute` VALUES (6252, 1, 134, 4, 'field_trim_type', 0, 'none');
INSERT INTO `r_step_attribute` VALUES (6253, 1, 134, 4, 'field_repeat', 0, 'N');
INSERT INTO `r_step_attribute` VALUES (6254, 1, 134, 4, 'field_format', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (6255, 1, 134, 4, 'field_currency', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (6256, 1, 134, 4, 'field_decimal', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (6257, 1, 134, 4, 'field_group', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (6258, 1, 134, 5, 'field_name', 0, 'Staff_Used_2');
INSERT INTO `r_step_attribute` VALUES (6259, 1, 134, 5, 'field_type', 0, 'Integer');
INSERT INTO `r_step_attribute` VALUES (6260, 1, 134, 5, 'field_length', -1, NULL);
INSERT INTO `r_step_attribute` VALUES (6261, 1, 134, 5, 'field_precision', -1, NULL);
INSERT INTO `r_step_attribute` VALUES (6262, 1, 134, 5, 'field_trim_type', 0, 'none');
INSERT INTO `r_step_attribute` VALUES (6263, 1, 134, 5, 'field_repeat', 0, 'N');
INSERT INTO `r_step_attribute` VALUES (6264, 1, 134, 5, 'field_format', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (6265, 1, 134, 5, 'field_currency', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (6266, 1, 134, 5, 'field_decimal', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (6267, 1, 134, 5, 'field_group', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (6268, 1, 134, 6, 'field_name', 0, 'Proceed_Budget');
INSERT INTO `r_step_attribute` VALUES (6269, 1, 134, 6, 'field_type', 0, 'Integer');
INSERT INTO `r_step_attribute` VALUES (6270, 1, 134, 6, 'field_length', -1, NULL);
INSERT INTO `r_step_attribute` VALUES (6271, 1, 134, 6, 'field_precision', -1, NULL);
INSERT INTO `r_step_attribute` VALUES (6272, 1, 134, 6, 'field_trim_type', 0, 'none');
INSERT INTO `r_step_attribute` VALUES (6273, 1, 134, 6, 'field_repeat', 0, 'N');
INSERT INTO `r_step_attribute` VALUES (6274, 1, 134, 6, 'field_format', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (6275, 1, 134, 6, 'field_currency', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (6276, 1, 134, 6, 'field_decimal', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (6277, 1, 134, 6, 'field_group', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (6278, 1, 134, 7, 'field_name', 0, 'Proceed_Used_1');
INSERT INTO `r_step_attribute` VALUES (6279, 1, 134, 7, 'field_type', 0, 'Integer');
INSERT INTO `r_step_attribute` VALUES (6280, 1, 134, 7, 'field_length', -1, NULL);
INSERT INTO `r_step_attribute` VALUES (6281, 1, 134, 7, 'field_precision', -1, NULL);
INSERT INTO `r_step_attribute` VALUES (6282, 1, 134, 7, 'field_trim_type', 0, 'none');
INSERT INTO `r_step_attribute` VALUES (6283, 1, 134, 7, 'field_repeat', 0, 'N');
INSERT INTO `r_step_attribute` VALUES (6284, 1, 134, 7, 'field_format', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (6285, 1, 134, 7, 'field_currency', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (6286, 1, 134, 7, 'field_decimal', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (6287, 1, 134, 7, 'field_group', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (6288, 1, 134, 8, 'field_name', 0, 'Proceed_Used_2');
INSERT INTO `r_step_attribute` VALUES (6289, 1, 134, 8, 'field_type', 0, 'Integer');
INSERT INTO `r_step_attribute` VALUES (6290, 1, 134, 8, 'field_length', -1, NULL);
INSERT INTO `r_step_attribute` VALUES (6291, 1, 134, 8, 'field_precision', -1, NULL);
INSERT INTO `r_step_attribute` VALUES (6292, 1, 134, 8, 'field_trim_type', 0, 'none');
INSERT INTO `r_step_attribute` VALUES (6293, 1, 134, 8, 'field_repeat', 0, 'N');
INSERT INTO `r_step_attribute` VALUES (6294, 1, 134, 8, 'field_format', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (6295, 1, 134, 8, 'field_currency', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (6296, 1, 134, 8, 'field_decimal', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (6297, 1, 134, 8, 'field_group', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (6298, 1, 134, 9, 'field_name', 0, 'Investment_Budget');
INSERT INTO `r_step_attribute` VALUES (6299, 1, 134, 9, 'field_type', 0, 'Integer');
INSERT INTO `r_step_attribute` VALUES (6300, 1, 134, 9, 'field_length', -1, NULL);
INSERT INTO `r_step_attribute` VALUES (6301, 1, 134, 9, 'field_precision', -1, NULL);
INSERT INTO `r_step_attribute` VALUES (6302, 1, 134, 9, 'field_trim_type', 0, 'none');
INSERT INTO `r_step_attribute` VALUES (6303, 1, 134, 9, 'field_repeat', 0, 'N');
INSERT INTO `r_step_attribute` VALUES (6304, 1, 134, 9, 'field_format', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (6305, 1, 134, 9, 'field_currency', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (6306, 1, 134, 9, 'field_decimal', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (6307, 1, 134, 9, 'field_group', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (6308, 1, 134, 10, 'field_name', 0, 'Investment_Used_1');
INSERT INTO `r_step_attribute` VALUES (6309, 1, 134, 10, 'field_type', 0, 'Integer');
INSERT INTO `r_step_attribute` VALUES (6310, 1, 134, 10, 'field_length', -1, NULL);
INSERT INTO `r_step_attribute` VALUES (6311, 1, 134, 10, 'field_precision', -1, NULL);
INSERT INTO `r_step_attribute` VALUES (6312, 1, 134, 10, 'field_trim_type', 0, 'none');
INSERT INTO `r_step_attribute` VALUES (6313, 1, 134, 10, 'field_repeat', 0, 'N');
INSERT INTO `r_step_attribute` VALUES (6314, 1, 134, 10, 'field_format', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (6315, 1, 134, 10, 'field_currency', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (6316, 1, 134, 10, 'field_decimal', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (6317, 1, 134, 10, 'field_group', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (6318, 1, 134, 11, 'field_name', 0, 'Investment_Used_2');
INSERT INTO `r_step_attribute` VALUES (6319, 1, 134, 11, 'field_type', 0, 'Integer');
INSERT INTO `r_step_attribute` VALUES (6320, 1, 134, 11, 'field_length', -1, NULL);
INSERT INTO `r_step_attribute` VALUES (6321, 1, 134, 11, 'field_precision', -1, NULL);
INSERT INTO `r_step_attribute` VALUES (6322, 1, 134, 11, 'field_trim_type', 0, 'none');
INSERT INTO `r_step_attribute` VALUES (6323, 1, 134, 11, 'field_repeat', 0, 'N');
INSERT INTO `r_step_attribute` VALUES (6324, 1, 134, 11, 'field_format', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (6325, 1, 134, 11, 'field_currency', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (6326, 1, 134, 11, 'field_decimal', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (6327, 1, 134, 11, 'field_group', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (6328, 1, 134, 12, 'field_name', 0, 'Subsidize_Budget');
INSERT INTO `r_step_attribute` VALUES (6329, 1, 134, 12, 'field_type', 0, 'Integer');
INSERT INTO `r_step_attribute` VALUES (6330, 1, 134, 12, 'field_length', -1, NULL);
INSERT INTO `r_step_attribute` VALUES (6331, 1, 134, 12, 'field_precision', -1, NULL);
INSERT INTO `r_step_attribute` VALUES (6332, 1, 134, 12, 'field_trim_type', 0, 'none');
INSERT INTO `r_step_attribute` VALUES (6333, 1, 134, 12, 'field_repeat', 0, 'N');
INSERT INTO `r_step_attribute` VALUES (6334, 1, 134, 12, 'field_format', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (6335, 1, 134, 12, 'field_currency', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (6336, 1, 134, 12, 'field_decimal', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (6337, 1, 134, 12, 'field_group', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (6338, 1, 134, 13, 'field_name', 0, 'Subsidize_Used_1');
INSERT INTO `r_step_attribute` VALUES (6339, 1, 134, 13, 'field_type', 0, 'Integer');
INSERT INTO `r_step_attribute` VALUES (6340, 1, 134, 13, 'field_length', -1, NULL);
INSERT INTO `r_step_attribute` VALUES (6341, 1, 134, 13, 'field_precision', -1, NULL);
INSERT INTO `r_step_attribute` VALUES (6342, 1, 134, 13, 'field_trim_type', 0, 'none');
INSERT INTO `r_step_attribute` VALUES (6343, 1, 134, 13, 'field_repeat', 0, 'N');
INSERT INTO `r_step_attribute` VALUES (6344, 1, 134, 13, 'field_format', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (6345, 1, 134, 13, 'field_currency', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (6346, 1, 134, 13, 'field_decimal', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (6347, 1, 134, 13, 'field_group', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (6348, 1, 134, 14, 'field_name', 0, 'Subsidize_Used_2');
INSERT INTO `r_step_attribute` VALUES (6349, 1, 134, 14, 'field_type', 0, 'Integer');
INSERT INTO `r_step_attribute` VALUES (6350, 1, 134, 14, 'field_length', -1, NULL);
INSERT INTO `r_step_attribute` VALUES (6351, 1, 134, 14, 'field_precision', -1, NULL);
INSERT INTO `r_step_attribute` VALUES (6352, 1, 134, 14, 'field_trim_type', 0, 'none');
INSERT INTO `r_step_attribute` VALUES (6353, 1, 134, 14, 'field_repeat', 0, 'N');
INSERT INTO `r_step_attribute` VALUES (6354, 1, 134, 14, 'field_format', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (6355, 1, 134, 14, 'field_currency', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (6356, 1, 134, 14, 'field_decimal', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (6357, 1, 134, 14, 'field_group', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (6358, 1, 134, 15, 'field_name', 0, 'Other_Budget');
INSERT INTO `r_step_attribute` VALUES (6359, 1, 134, 15, 'field_type', 0, 'Integer');
INSERT INTO `r_step_attribute` VALUES (6360, 1, 134, 15, 'field_length', -1, NULL);
INSERT INTO `r_step_attribute` VALUES (6361, 1, 134, 15, 'field_precision', -1, NULL);
INSERT INTO `r_step_attribute` VALUES (6362, 1, 134, 15, 'field_trim_type', 0, 'none');
INSERT INTO `r_step_attribute` VALUES (6363, 1, 134, 15, 'field_repeat', 0, 'N');
INSERT INTO `r_step_attribute` VALUES (6364, 1, 134, 15, 'field_format', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (6365, 1, 134, 15, 'field_currency', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (6366, 1, 134, 15, 'field_decimal', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (6367, 1, 134, 15, 'field_group', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (6368, 1, 134, 16, 'field_name', 0, 'Other_Used_1');
INSERT INTO `r_step_attribute` VALUES (6369, 1, 134, 16, 'field_type', 0, 'Integer');
INSERT INTO `r_step_attribute` VALUES (6370, 1, 134, 16, 'field_length', -1, NULL);
INSERT INTO `r_step_attribute` VALUES (6371, 1, 134, 16, 'field_precision', -1, NULL);
INSERT INTO `r_step_attribute` VALUES (6372, 1, 134, 16, 'field_trim_type', 0, 'none');
INSERT INTO `r_step_attribute` VALUES (6373, 1, 134, 16, 'field_repeat', 0, 'N');
INSERT INTO `r_step_attribute` VALUES (6374, 1, 134, 16, 'field_format', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (6375, 1, 134, 16, 'field_currency', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (6376, 1, 134, 16, 'field_decimal', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (6377, 1, 134, 16, 'field_group', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (6378, 1, 134, 17, 'field_name', 0, 'Other_Used_2');
INSERT INTO `r_step_attribute` VALUES (6379, 1, 134, 17, 'field_type', 0, 'Integer');
INSERT INTO `r_step_attribute` VALUES (6380, 1, 134, 17, 'field_length', -1, NULL);
INSERT INTO `r_step_attribute` VALUES (6381, 1, 134, 17, 'field_precision', -1, NULL);
INSERT INTO `r_step_attribute` VALUES (6382, 1, 134, 17, 'field_trim_type', 0, 'none');
INSERT INTO `r_step_attribute` VALUES (6383, 1, 134, 17, 'field_repeat', 0, 'N');
INSERT INTO `r_step_attribute` VALUES (6384, 1, 134, 17, 'field_format', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (6385, 1, 134, 17, 'field_currency', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (6386, 1, 134, 17, 'field_decimal', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (6387, 1, 134, 17, 'field_group', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (6388, 1, 134, 0, 'strict_types', 0, 'N');
INSERT INTO `r_step_attribute` VALUES (6389, 1, 134, 0, 'error_ignored', 0, 'N');
INSERT INTO `r_step_attribute` VALUES (6390, 1, 134, 0, 'error_line_skipped', 0, 'N');
INSERT INTO `r_step_attribute` VALUES (6391, 1, 134, 0, 'bad_line_files_dest_dir', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (6392, 1, 134, 0, 'bad_line_files_ext', 0, 'warning');
INSERT INTO `r_step_attribute` VALUES (6393, 1, 134, 0, 'error_line_files_dest_dir', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (6394, 1, 134, 0, 'error_line_files_ext', 0, 'error');
INSERT INTO `r_step_attribute` VALUES (6395, 1, 134, 0, 'line_number_files_dest_dir', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (6396, 1, 134, 0, 'line_number_files_ext', 0, 'line');
INSERT INTO `r_step_attribute` VALUES (6397, 1, 134, 0, 'shortFileFieldName', 0, 'ShortFileName');
INSERT INTO `r_step_attribute` VALUES (6398, 1, 134, 0, 'pathFieldName', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (6399, 1, 134, 0, 'hiddenFieldName', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (6400, 1, 134, 0, 'lastModificationTimeFieldName', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (6401, 1, 134, 0, 'uriNameFieldName', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (6402, 1, 134, 0, 'rootUriNameFieldName', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (6403, 1, 134, 0, 'extensionFieldName', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (6404, 1, 134, 0, 'sizeFieldName', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (6405, 1, 134, 0, 'spreadsheet_type', 0, 'POI');
INSERT INTO `r_step_attribute` VALUES (6406, 1, 134, 0, 'cluster_schema', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (6407, 1, 134, 0, 'row_distribution_code', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (6408, 1, 135, 0, 'PARTITIONING_SCHEMA', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (6409, 1, 135, 0, 'PARTITIONING_METHOD', 0, 'none');
INSERT INTO `r_step_attribute` VALUES (6410, 1, 135, 0, 'compatible', 0, 'N');
INSERT INTO `r_step_attribute` VALUES (6411, 1, 135, 0, 'optimizationLevel', 0, '9');
INSERT INTO `r_step_attribute` VALUES (6412, 1, 135, 0, 'jsScript_name', 0, 'Script 1');
INSERT INTO `r_step_attribute` VALUES (6413, 1, 135, 0, 'jsScript_script', 0, '//Script here\r\n\r\nvar ShortFileName = ShortFileName;\r\n\r\nvar date_time = new Date();\r\n\r\nvar mn_name = substr(date_time,4,3);\r\nif(mn_name == \"Jan\"){\r\n	var mn_num = \"01\";\r\n}else if(mn_name == \"Feb\"){\r\n	var mn_num = \"02\";\r\n}else if(mn_name == \"Mar\"){\r\n	var mn_num = \"03\";\r\n}else if(mn_name == \"Apr\"){\r\n	var mn_num = \"04\";\r\n}else if(mn_name == \"May\"){\r\n	var mn_num = \"05\";\r\n}else if(mn_name == \"Jun\"){\r\n	var mn_num = \"06\";\r\n}else if(mn_name == \"Jul\"){\r\n	var mn_num = \"07\";\r\n}else if(mn_name == \"Aug\"){\r\n	var mn_num = \"08\";\r\n}else if(mn_name == \"Sep\"){\r\n	var mn_num = \"09\";\r\n}else if(mn_name == \"Oct\"){\r\n	var mn_num = \"10\";\r\n}else if(mn_name == \"Nov\"){\r\n	var mn_num = \"11\";\r\n}else if(mn_name == \"Dec\"){\r\n	var mn_num = \"12\";\r\n}\r\n\r\nvar date_time = substr(date_time,11,4)+mn_num+substr(date_time,8,2)+\"_\"+substr(date_time,16,2)+substr(date_time,19,2)+substr(date_time,22,2);\r\n\r\nvar fullname_target = ShortFileName.replace(\'.xlsx\',\'_\'+date_time+\'.xlsx\');\r\n\r\n\r\n\r\nvar fullname_target = \'C:\\\\ETL Report\\\\Archive\\\\\'+fullname_target;\r\n');
INSERT INTO `r_step_attribute` VALUES (6414, 1, 135, 0, 'jsScript_type', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (6415, 1, 135, 1, 'jsScript_name', 0, 'str2date_Sample');
INSERT INTO `r_step_attribute` VALUES (6416, 1, 135, 1, 'jsScript_script', 0, '// Converts the given String to a date Value.\n//\n// Usage:\n// str2date(var);\n// 1: String - The Variable with the String to convert.\n// This call uses your localized format.\n//\n// str2date(var, var);\n// 1: String - The Variable with the String to convert.\n// 2: String - The Format:\n//        yy / yyyy - 06 / 2006\n//        MM / MMM / MMMMM - 11 / Nov / November\n//        d / dd  - 1 / 01\n//        E / EEEE - Tue / Tuesday\n//        hh / HH - 11 / 23\n//        m / mm - 5 / 05\n//        s / ss - 8 / 08\n//\n// str2date(var, var, var);\n// 1: String - The Variable with the String to convert.\n// 2: String - The Format:\n// 3: String - The Locale Parameter\n//    An valid ISO Language Code. (DE = German, EN = English, FR = France, ...)\n//\n// str2date(var, var, var, var);\n// 1: String - The Variable with the String to convert.\n// 2: String - The Format:\n// 3: String - The Locale Parameter\n//    An valid ISO Language Code. (DE = German, EN = English, FR = France, ...)\n// 4: String - The Timezone Parameter.\n//    A valid timezone: EST, GMT, ... (if invalid GMT will be selected as default)\n// \n// 2006-11-15\n//\nAlert(str2date(\"01.12.2006\",\"dd.MM.yyyy\"));\nAlert(str2date(\"01.12.2006 23:23:01\",\"dd.MM.yyyy HH:mm:ss\"));\nAlert(str2date(\"Tue.May.2006\",\"E.MMM.yyyy\",\"EN\"));\nAlert(str2date(\"22.02.2008 23:23:01\",\"dd.MM.yyyy HH:mm:ss\",\"DE\"));\nAlert(str2date(\"22.02.2008 23:23:01\",\"dd.MM.yyyy HH:mm:ss\",\"DE\", \"EST\"));');
INSERT INTO `r_step_attribute` VALUES (6417, 1, 135, 1, 'jsScript_type', -1, NULL);
INSERT INTO `r_step_attribute` VALUES (6418, 1, 135, 0, 'field_name', 0, 'ShortFileName');
INSERT INTO `r_step_attribute` VALUES (6419, 1, 135, 0, 'field_rename', 0, 'ShortFileName');
INSERT INTO `r_step_attribute` VALUES (6420, 1, 135, 0, 'field_type', 0, 'String');
INSERT INTO `r_step_attribute` VALUES (6421, 1, 135, 0, 'field_length', -1, NULL);
INSERT INTO `r_step_attribute` VALUES (6422, 1, 135, 0, 'field_precision', -1, NULL);
INSERT INTO `r_step_attribute` VALUES (6423, 1, 135, 0, 'field_replace', 0, 'Y');
INSERT INTO `r_step_attribute` VALUES (6424, 1, 135, 1, 'field_name', 0, 'date_time');
INSERT INTO `r_step_attribute` VALUES (6425, 1, 135, 1, 'field_rename', 0, 'date_time');
INSERT INTO `r_step_attribute` VALUES (6426, 1, 135, 1, 'field_type', 0, 'String');
INSERT INTO `r_step_attribute` VALUES (6427, 1, 135, 1, 'field_length', -1, NULL);
INSERT INTO `r_step_attribute` VALUES (6428, 1, 135, 1, 'field_precision', -1, NULL);
INSERT INTO `r_step_attribute` VALUES (6429, 1, 135, 1, 'field_replace', 0, 'N');
INSERT INTO `r_step_attribute` VALUES (6430, 1, 135, 2, 'field_name', 0, 'mn_name');
INSERT INTO `r_step_attribute` VALUES (6431, 1, 135, 2, 'field_rename', 0, 'mn_name');
INSERT INTO `r_step_attribute` VALUES (6432, 1, 135, 2, 'field_type', 0, 'String');
INSERT INTO `r_step_attribute` VALUES (6433, 1, 135, 2, 'field_length', -1, NULL);
INSERT INTO `r_step_attribute` VALUES (6434, 1, 135, 2, 'field_precision', -1, NULL);
INSERT INTO `r_step_attribute` VALUES (6435, 1, 135, 2, 'field_replace', 0, 'N');
INSERT INTO `r_step_attribute` VALUES (6436, 1, 135, 3, 'field_name', 0, 'mn_num');
INSERT INTO `r_step_attribute` VALUES (6437, 1, 135, 3, 'field_rename', 0, 'mn_num');
INSERT INTO `r_step_attribute` VALUES (6438, 1, 135, 3, 'field_type', 0, 'String');
INSERT INTO `r_step_attribute` VALUES (6439, 1, 135, 3, 'field_length', -1, NULL);
INSERT INTO `r_step_attribute` VALUES (6440, 1, 135, 3, 'field_precision', -1, NULL);
INSERT INTO `r_step_attribute` VALUES (6441, 1, 135, 3, 'field_replace', 0, 'N');
INSERT INTO `r_step_attribute` VALUES (6442, 1, 135, 4, 'field_name', 0, 'fullname_target');
INSERT INTO `r_step_attribute` VALUES (6443, 1, 135, 4, 'field_rename', 0, 'fullname_target');
INSERT INTO `r_step_attribute` VALUES (6444, 1, 135, 4, 'field_type', 0, 'String');
INSERT INTO `r_step_attribute` VALUES (6445, 1, 135, 4, 'field_length', -1, NULL);
INSERT INTO `r_step_attribute` VALUES (6446, 1, 135, 4, 'field_precision', -1, NULL);
INSERT INTO `r_step_attribute` VALUES (6447, 1, 135, 4, 'field_replace', 0, 'N');
INSERT INTO `r_step_attribute` VALUES (6448, 1, 135, 0, 'cluster_schema', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (6449, 1, 135, 0, 'row_distribution_code', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (6450, 1, 136, 0, 'PARTITIONING_SCHEMA', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (6451, 1, 136, 0, 'PARTITIONING_METHOD', 0, 'none');
INSERT INTO `r_step_attribute` VALUES (6452, 1, 136, 0, 'sourcefilenamefield', 0, 'FullPathName');
INSERT INTO `r_step_attribute` VALUES (6453, 1, 136, 0, 'targetfilenamefield', 0, 'fullname_target');
INSERT INTO `r_step_attribute` VALUES (6454, 1, 136, 0, 'operation_type', 0, 'move');
INSERT INTO `r_step_attribute` VALUES (6455, 1, 136, 0, 'addresultfilenames', 0, 'Y');
INSERT INTO `r_step_attribute` VALUES (6456, 1, 136, 0, 'overwritetargetfile', 0, 'Y');
INSERT INTO `r_step_attribute` VALUES (6457, 1, 136, 0, 'createparentfolder', 0, 'Y');
INSERT INTO `r_step_attribute` VALUES (6458, 1, 136, 0, 'simulate', 0, 'N');
INSERT INTO `r_step_attribute` VALUES (6459, 1, 136, 0, 'cluster_schema', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (6460, 1, 136, 0, 'row_distribution_code', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (6461, 1, 137, 0, 'PARTITIONING_SCHEMA', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (6462, 1, 137, 0, 'PARTITIONING_METHOD', 0, 'none');
INSERT INTO `r_step_attribute` VALUES (6463, 1, 137, 0, 'id_connection', 1, NULL);
INSERT INTO `r_step_attribute` VALUES (6464, 1, 137, 0, 'schema', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (6465, 1, 137, 0, 'table', 0, 'itec_report_budget');
INSERT INTO `r_step_attribute` VALUES (6466, 1, 137, 0, 'commit', 0, '1000');
INSERT INTO `r_step_attribute` VALUES (6467, 1, 137, 0, 'truncate', 0, 'Y');
INSERT INTO `r_step_attribute` VALUES (6468, 1, 137, 0, 'ignore_errors', 0, 'N');
INSERT INTO `r_step_attribute` VALUES (6469, 1, 137, 0, 'use_batch', 0, 'Y');
INSERT INTO `r_step_attribute` VALUES (6470, 1, 137, 0, 'specify_fields', 0, 'Y');
INSERT INTO `r_step_attribute` VALUES (6471, 1, 137, 0, 'partitioning_enabled', 0, 'N');
INSERT INTO `r_step_attribute` VALUES (6472, 1, 137, 0, 'partitioning_field', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (6473, 1, 137, 0, 'partitioning_daily', 0, 'N');
INSERT INTO `r_step_attribute` VALUES (6474, 1, 137, 0, 'partitioning_monthly', 0, 'Y');
INSERT INTO `r_step_attribute` VALUES (6475, 1, 137, 0, 'tablename_in_field', 0, 'N');
INSERT INTO `r_step_attribute` VALUES (6476, 1, 137, 0, 'tablename_field', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (6477, 1, 137, 0, 'tablename_in_table', 0, 'Y');
INSERT INTO `r_step_attribute` VALUES (6478, 1, 137, 0, 'return_keys', 0, 'N');
INSERT INTO `r_step_attribute` VALUES (6479, 1, 137, 0, 'return_field', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (6480, 1, 137, 0, 'column_name', 0, 'Year');
INSERT INTO `r_step_attribute` VALUES (6481, 1, 137, 0, 'stream_name', 0, 'Year');
INSERT INTO `r_step_attribute` VALUES (6482, 1, 137, 1, 'column_name', 0, 'Month_ID');
INSERT INTO `r_step_attribute` VALUES (6483, 1, 137, 1, 'stream_name', 0, 'Mouth');
INSERT INTO `r_step_attribute` VALUES (6484, 1, 137, 2, 'column_name', 0, 'Unit_ID');
INSERT INTO `r_step_attribute` VALUES (6485, 1, 137, 2, 'stream_name', 0, 'Unit_id');
INSERT INTO `r_step_attribute` VALUES (6486, 1, 137, 3, 'column_name', 0, 'Staff_Budget');
INSERT INTO `r_step_attribute` VALUES (6487, 1, 137, 3, 'stream_name', 0, 'Staff_budget');
INSERT INTO `r_step_attribute` VALUES (6488, 1, 137, 4, 'column_name', 0, 'Staff_Used');
INSERT INTO `r_step_attribute` VALUES (6489, 1, 137, 4, 'stream_name', 0, 'Staff_Used_1');
INSERT INTO `r_step_attribute` VALUES (6490, 1, 137, 5, 'column_name', 0, 'Staff_Debt');
INSERT INTO `r_step_attribute` VALUES (6491, 1, 137, 5, 'stream_name', 0, 'Staff_Used_2');
INSERT INTO `r_step_attribute` VALUES (6492, 1, 137, 6, 'column_name', 0, 'Proceed_Budget');
INSERT INTO `r_step_attribute` VALUES (6493, 1, 137, 6, 'stream_name', 0, 'Proceed_Budget');
INSERT INTO `r_step_attribute` VALUES (6494, 1, 137, 7, 'column_name', 0, 'Proceed_Used');
INSERT INTO `r_step_attribute` VALUES (6495, 1, 137, 7, 'stream_name', 0, 'Proceed_Used_1');
INSERT INTO `r_step_attribute` VALUES (6496, 1, 137, 8, 'column_name', 0, 'Proceed_Debt');
INSERT INTO `r_step_attribute` VALUES (6497, 1, 137, 8, 'stream_name', 0, 'Proceed_Used_2');
INSERT INTO `r_step_attribute` VALUES (6498, 1, 137, 9, 'column_name', 0, 'Investment_Budget');
INSERT INTO `r_step_attribute` VALUES (6499, 1, 137, 9, 'stream_name', 0, 'Investment_Budget');
INSERT INTO `r_step_attribute` VALUES (6500, 1, 137, 10, 'column_name', 0, 'Investment_Used');
INSERT INTO `r_step_attribute` VALUES (6501, 1, 137, 10, 'stream_name', 0, 'Investment_Used_1');
INSERT INTO `r_step_attribute` VALUES (6502, 1, 137, 11, 'column_name', 0, 'Investment_Debt');
INSERT INTO `r_step_attribute` VALUES (6503, 1, 137, 11, 'stream_name', 0, 'Investment_Used_2');
INSERT INTO `r_step_attribute` VALUES (6504, 1, 137, 12, 'column_name', 0, 'Subsidize_Budget');
INSERT INTO `r_step_attribute` VALUES (6505, 1, 137, 12, 'stream_name', 0, 'Subsidize_Budget');
INSERT INTO `r_step_attribute` VALUES (6506, 1, 137, 13, 'column_name', 0, 'Subsidize_Used');
INSERT INTO `r_step_attribute` VALUES (6507, 1, 137, 13, 'stream_name', 0, 'Subsidize_Used_1');
INSERT INTO `r_step_attribute` VALUES (6508, 1, 137, 14, 'column_name', 0, 'Subsidize_Debt');
INSERT INTO `r_step_attribute` VALUES (6509, 1, 137, 14, 'stream_name', 0, 'Subsidize_Used_2');
INSERT INTO `r_step_attribute` VALUES (6510, 1, 137, 15, 'column_name', 0, 'Other_Budget');
INSERT INTO `r_step_attribute` VALUES (6511, 1, 137, 15, 'stream_name', 0, 'Other_Budget');
INSERT INTO `r_step_attribute` VALUES (6512, 1, 137, 16, 'column_name', 0, 'Other_Used');
INSERT INTO `r_step_attribute` VALUES (6513, 1, 137, 16, 'stream_name', 0, 'Other_Used_1');
INSERT INTO `r_step_attribute` VALUES (6514, 1, 137, 17, 'column_name', 0, 'Other_Debt');
INSERT INTO `r_step_attribute` VALUES (6515, 1, 137, 17, 'stream_name', 0, 'Other_Used_2');
INSERT INTO `r_step_attribute` VALUES (6516, 1, 137, 0, 'cluster_schema', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (6517, 1, 137, 0, 'row_distribution_code', 0, NULL);

-- ----------------------------
-- Table structure for r_step_database
-- ----------------------------
DROP TABLE IF EXISTS `r_step_database`;
CREATE TABLE `r_step_database`  (
  `ID_TRANSFORMATION` int(11) NULL DEFAULT NULL,
  `ID_STEP` int(11) NULL DEFAULT NULL,
  `ID_DATABASE` int(11) NULL DEFAULT NULL,
  INDEX `IDX_RSD1`(`ID_TRANSFORMATION`) USING BTREE,
  INDEX `IDX_RSD2`(`ID_DATABASE`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of r_step_database
-- ----------------------------
INSERT INTO `r_step_database` VALUES (4, 87, 1);
INSERT INTO `r_step_database` VALUES (4, 89, 1);
INSERT INTO `r_step_database` VALUES (5, 100, 1);
INSERT INTO `r_step_database` VALUES (5, 101, 1);
INSERT INTO `r_step_database` VALUES (5, 102, 1);
INSERT INTO `r_step_database` VALUES (2, 120, 1);
INSERT INTO `r_step_database` VALUES (3, 131, 1);
INSERT INTO `r_step_database` VALUES (3, 132, 1);
INSERT INTO `r_step_database` VALUES (1, 137, 1);

-- ----------------------------
-- Table structure for r_step_type
-- ----------------------------
DROP TABLE IF EXISTS `r_step_type`;
CREATE TABLE `r_step_type`  (
  `ID_STEP_TYPE` bigint(20) NOT NULL,
  `CODE` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `DESCRIPTION` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `HELPTEXT` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID_STEP_TYPE`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of r_step_type
-- ----------------------------
INSERT INTO `r_step_type` VALUES (1, 'Abort', 'Abort', 'Abort a transformation');
INSERT INTO `r_step_type` VALUES (2, 'CheckSum', 'Add a checksum', 'Add a checksum column for each input row');
INSERT INTO `r_step_type` VALUES (3, 'Constant', 'Add constants', 'Add one or more constants to the input rows');
INSERT INTO `r_step_type` VALUES (4, 'Sequence', 'Add sequence', 'Get the next value from an sequence');
INSERT INTO `r_step_type` VALUES (5, 'FieldsChangeSequence', 'Add value fields changing sequence', 'Add sequence depending of fields value change.\nEach time value of at least one field change, PDI will reset sequence. ');
INSERT INTO `r_step_type` VALUES (6, 'AddXML', 'Add XML', 'Encode several fields into an XML fragment');
INSERT INTO `r_step_type` VALUES (7, 'AggregateRows', 'Aggregate Rows', 'This step type allows you to aggregate rows.\nIt can\'t do groupings.');
INSERT INTO `r_step_type` VALUES (8, 'AnalyticQuery', 'Analytic Query', 'Execute analytic queries over a sorted dataset (LEAD/LAG/FIRST/LAST)');
INSERT INTO `r_step_type` VALUES (9, 'Append', 'Append streams', 'Append 2 streams in an ordered way');
INSERT INTO `r_step_type` VALUES (10, 'AutoDoc', 'Automatic Documentation Output', 'This step automatically generates documentation based on input in the form of a list of transformations and jobs');
INSERT INTO `r_step_type` VALUES (11, 'AvroInput', 'Avro Input', 'Reads data from an Avro file');
INSERT INTO `r_step_type` VALUES (12, 'BlockUntilStepsFinish', 'Block this step until steps finish', 'Block this step until selected steps finish.');
INSERT INTO `r_step_type` VALUES (13, 'BlockingStep', 'Blocking Step', 'This step blocks until all incoming rows have been processed.  Subsequent steps only recieve the last input row to this step.');
INSERT INTO `r_step_type` VALUES (14, 'Calculator', 'Calculator', 'Create new fields by performing simple calculations');
INSERT INTO `r_step_type` VALUES (15, 'DBProc', 'Call DB Procedure', 'Get back information by calling a database procedure.');
INSERT INTO `r_step_type` VALUES (16, 'CallEndpointStep', 'Call endpoint', 'Call an endpoint of the BA Server.');
INSERT INTO `r_step_type` VALUES (17, 'CassandraInput', 'Cassandra Input', 'Reads data from a Cassandra table');
INSERT INTO `r_step_type` VALUES (18, 'CassandraOutput', 'Cassandra Output', 'Writes to a Cassandra table');
INSERT INTO `r_step_type` VALUES (19, 'ChangeFileEncoding', 'Change file encoding', 'Change file encoding and create a new file');
INSERT INTO `r_step_type` VALUES (20, 'ColumnExists', 'Check if a column exists', 'Check if a column exists in a table on a specified connection.');
INSERT INTO `r_step_type` VALUES (21, 'FileLocked', 'Check if file is locked', 'Check if a file is locked by another process');
INSERT INTO `r_step_type` VALUES (22, 'WebServiceAvailable', 'Check if webservice is available', 'Check if a webservice is available');
INSERT INTO `r_step_type` VALUES (23, 'CloneRow', 'Clone row', 'Clone a row as many times as needed');
INSERT INTO `r_step_type` VALUES (24, 'ClosureGenerator', 'Closure Generator', 'This step allows you to generates a closure table using parent-child relationships.');
INSERT INTO `r_step_type` VALUES (25, 'CombinationLookup', 'Combination lookup/update', 'Update a junk dimension in a data warehouse.\nAlternatively, look up information in this dimension.\nThe primary key of a junk dimension are all the fields.');
INSERT INTO `r_step_type` VALUES (26, 'ConcatFields', 'Concat Fields', 'Concat fields together into a new field (similar to the Text File Output step)');
INSERT INTO `r_step_type` VALUES (27, 'RowsToResult', 'Copy rows to result', 'Use this step to write rows to the executing job.\nThe information will then be passed to the next entry in this job.');
INSERT INTO `r_step_type` VALUES (28, 'CouchDbInput', 'CouchDb Input', 'Reads from a Couch DB view');
INSERT INTO `r_step_type` VALUES (29, 'CreditCardValidator', 'Credit card validator', 'The Credit card validator step will help you tell:\n(1) if a credit card number is valid (uses LUHN10 (MOD-10) algorithm)\n(2) which credit card vendor handles that number\n(VISA, MasterCard, Diners Club, EnRoute, American Express (AMEX),...)');
INSERT INTO `r_step_type` VALUES (30, 'CsvInput', 'CSV file input', 'Simple CSV file input');
INSERT INTO `r_step_type` VALUES (31, 'DataGrid', 'Data Grid', 'Enter rows of static data in a grid, usually for testing, reference or demo purpose');
INSERT INTO `r_step_type` VALUES (32, 'Validator', 'Data Validator', 'Validates passing data based on a set of rules');
INSERT INTO `r_step_type` VALUES (33, 'DBJoin', 'Database join', 'Execute a database query using stream values as parameters');
INSERT INTO `r_step_type` VALUES (34, 'DBLookup', 'Database lookup', 'Look up values in a database using field values');
INSERT INTO `r_step_type` VALUES (35, 'CubeInput', 'De-serialize from file', 'Read rows of data from a data cube.');
INSERT INTO `r_step_type` VALUES (36, 'Delay', 'Delay row', 'Output each input row after a delay');
INSERT INTO `r_step_type` VALUES (37, 'Delete', 'Delete', 'Delete data in a database table based upon keys');
INSERT INTO `r_step_type` VALUES (38, 'DetectEmptyStream', 'Detect empty stream', 'This step will output one empty row if input stream is empty\n(ie when input stream does not contain any row)');
INSERT INTO `r_step_type` VALUES (39, 'DimensionLookup', 'Dimension lookup/update', 'Update a slowly changing dimension in a data warehouse.\nAlternatively, look up information in this dimension.');
INSERT INTO `r_step_type` VALUES (40, 'Dummy', 'Dummy (do nothing)', 'This step type doesn\'t do anything.\nIt\'s useful however when testing things or in certain situations where you want to split streams.');
INSERT INTO `r_step_type` VALUES (41, 'DynamicSQLRow', 'Dynamic SQL row', 'Execute dynamic SQL statement build in a previous field');
INSERT INTO `r_step_type` VALUES (42, 'TypeExitEdi2XmlStep', 'Edi to XML', 'Converts Edi text to generic XML');
INSERT INTO `r_step_type` VALUES (43, 'ElasticSearchBulk', 'ElasticSearch Bulk Insert', 'Performs bulk inserts into ElasticSearch');
INSERT INTO `r_step_type` VALUES (44, 'MailInput', 'Email messages input', 'Read POP3/IMAP server and retrieve messages');
INSERT INTO `r_step_type` VALUES (45, 'ShapeFileReader', 'ESRI Shapefile Reader', 'Reads shape file data from an ESRI shape file and linked DBF file');
INSERT INTO `r_step_type` VALUES (46, 'MetaInject', 'ETL Metadata Injection', 'This step allows you to inject metadata into an existing transformation prior to execution.  This allows for the creation of dynamic and highly flexible data integration solutions.');
INSERT INTO `r_step_type` VALUES (47, 'DummyPlugin', 'Example plugin', 'This is an example for a plugin test step');
INSERT INTO `r_step_type` VALUES (48, 'ExecProcess', 'Execute a process', 'Execute a process and return the result');
INSERT INTO `r_step_type` VALUES (49, 'ExecSQLRow', 'Execute row SQL script', 'Execute SQL script extracted from a field\ncreated in a previous step.');
INSERT INTO `r_step_type` VALUES (50, 'ExecSQL', 'Execute SQL script', 'Execute an SQL script, optionally parameterized using input rows');
INSERT INTO `r_step_type` VALUES (51, 'FileExists', 'File exists', 'Check if a file exists');
INSERT INTO `r_step_type` VALUES (52, 'FilterRows', 'Filter rows', 'Filter rows using simple equations');
INSERT INTO `r_step_type` VALUES (53, 'FixedInput', 'Fixed file input', 'Fixed file input');
INSERT INTO `r_step_type` VALUES (54, 'Formula', 'Formula', 'Calculate a formula using Pentaho\'s libformula');
INSERT INTO `r_step_type` VALUES (55, 'FuzzyMatch', 'Fuzzy match', 'Finding approximate matches to a string using matching algorithms.\nRead a field from a main stream and output approximative value from lookup stream.');
INSERT INTO `r_step_type` VALUES (56, 'RandomCCNumberGenerator', 'Generate random credit card numbers', 'Generate random valide (luhn check) credit card numbers');
INSERT INTO `r_step_type` VALUES (57, 'RandomValue', 'Generate random value', 'Generate random value');
INSERT INTO `r_step_type` VALUES (58, 'RowGenerator', 'Generate Rows', 'Generate a number of empty or equal rows.');
INSERT INTO `r_step_type` VALUES (59, 'getXMLData', 'Get data from XML', 'Get data from XML file by using XPath.\n This step also allows you to parse XML defined in a previous field.');
INSERT INTO `r_step_type` VALUES (60, 'GetFileNames', 'Get File Names', 'Get file names from the operating system and send them to the next step.');
INSERT INTO `r_step_type` VALUES (61, 'FilesFromResult', 'Get files from result', 'This step allows you to read filenames used or generated in a previous entry in a job.');
INSERT INTO `r_step_type` VALUES (62, 'GetFilesRowsCount', 'Get Files Rows Count', 'Returns rows count for text files.');
INSERT INTO `r_step_type` VALUES (63, 'GetSlaveSequence', 'Get ID from slave server', 'Retrieves unique IDs in blocks from a slave server.  The referenced sequence needs to be configured on the slave server in the XML configuration file.');
INSERT INTO `r_step_type` VALUES (64, 'GetPreviousRowField', 'Get previous row fields', 'Get fields value of previous row.');
INSERT INTO `r_step_type` VALUES (65, 'GetRepositoryNames', 'Get repository names', 'Lists detailed information about transformations and/or jobs in a repository');
INSERT INTO `r_step_type` VALUES (66, 'RowsFromResult', 'Get rows from result', 'This allows you to read rows from a previous entry in a job.');
INSERT INTO `r_step_type` VALUES (67, 'GetSessionVariableStep', 'Get session variables', 'Get session variables from the current user session.');
INSERT INTO `r_step_type` VALUES (68, 'GetSubFolders', 'Get SubFolder names', 'Read a parent folder and return all subfolders');
INSERT INTO `r_step_type` VALUES (69, 'SystemInfo', 'Get System Info', 'Get information from the system like system date, arguments, etc.');
INSERT INTO `r_step_type` VALUES (70, 'GetTableNames', 'Get table names', 'Get table names from database connection and send them to the next step');
INSERT INTO `r_step_type` VALUES (71, 'GetVariable', 'Get Variables', 'Determine the values of certain (environment or Kettle) variables and put them in field values.');
INSERT INTO `r_step_type` VALUES (72, 'TypeExitGoogleAnalyticsInputStep', 'Google Analytics', 'Fetches data from google analytics account');
INSERT INTO `r_step_type` VALUES (73, 'GPBulkLoader', 'Greenplum Bulk Loader', 'Greenplum Bulk Loader');
INSERT INTO `r_step_type` VALUES (74, 'GPLoad', 'Greenplum Load', 'Greenplum Load');
INSERT INTO `r_step_type` VALUES (75, 'GroupBy', 'Group by', 'Builds aggregates in a group by fashion.\nThis works only on a sorted input.\nIf the input is not sorted, only double consecutive rows are handled correctly.');
INSERT INTO `r_step_type` VALUES (76, 'ParallelGzipCsvInput', 'GZIP CSV Input', 'Parallel GZIP CSV file input reader');
INSERT INTO `r_step_type` VALUES (77, 'HadoopFileInputPlugin', 'Hadoop File Input', 'Process files from an HDFS location');
INSERT INTO `r_step_type` VALUES (78, 'HadoopFileOutputPlugin', 'Hadoop File Output', 'Create files in an HDFS location ');
INSERT INTO `r_step_type` VALUES (79, 'HBaseInput', 'HBase Input', 'Reads data from a HBase table according to a mapping ');
INSERT INTO `r_step_type` VALUES (80, 'HBaseOutput', 'HBase Output', 'Writes data to an HBase table according to a mapping');
INSERT INTO `r_step_type` VALUES (81, 'HBaseRowDecoder', 'HBase Row Decoder', 'Decodes an incoming key and HBase result object according to a mapping ');
INSERT INTO `r_step_type` VALUES (82, 'HL7Input', 'HL7 Input', 'Reads and parses HL7 messages and outputs a series of values from the messages');
INSERT INTO `r_step_type` VALUES (83, 'HTTP', 'HTTP Client', 'Call a web service over HTTP by supplying a base URL by allowing parameters to be set dynamically');
INSERT INTO `r_step_type` VALUES (84, 'HTTPPOST', 'HTTP Post', 'Call a web service request over HTTP by supplying a base URL by allowing parameters to be set dynamically');
INSERT INTO `r_step_type` VALUES (85, 'DetectLastRow', 'Identify last row in a stream', 'Last row will be marked');
INSERT INTO `r_step_type` VALUES (86, 'IfNull', 'If field value is null', 'Sets a field value to a constant if it is null.');
INSERT INTO `r_step_type` VALUES (87, 'InfobrightOutput', 'Infobright Loader', 'Load data to an Infobright database table');
INSERT INTO `r_step_type` VALUES (88, 'VectorWiseBulkLoader', 'Ingres VectorWise Bulk Loader', 'This step interfaces with the Ingres VectorWise Bulk Loader \"COPY TABLE\" command.');
INSERT INTO `r_step_type` VALUES (89, 'Injector', 'Injector', 'Injector step to allow to inject rows into the transformation through the java API');
INSERT INTO `r_step_type` VALUES (90, 'InsertUpdate', 'Insert / Update', 'Update or insert rows in a database based upon keys.');
INSERT INTO `r_step_type` VALUES (91, 'JavaFilter', 'Java Filter', 'Filter rows using java code');
INSERT INTO `r_step_type` VALUES (92, 'JobExecutor', 'Job Executor', 'This step executes a Pentaho Data Integration job, sets parameters and passes rows.');
INSERT INTO `r_step_type` VALUES (93, 'JoinRows', 'Join Rows (cartesian product)', 'The output of this step is the cartesian product of the input streams.\nThe number of rows is the multiplication of the number of rows in the input streams.');
INSERT INTO `r_step_type` VALUES (94, 'JsonInput', 'Json Input', 'Extract relevant portions out of JSON structures (file or incoming field) and output rows');
INSERT INTO `r_step_type` VALUES (95, 'JsonOutput', 'Json output', 'Create Json bloc and output it in a field ou a file.');
INSERT INTO `r_step_type` VALUES (96, 'LDAPInput', 'LDAP Input', 'Read data from LDAP host');
INSERT INTO `r_step_type` VALUES (97, 'LDAPOutput', 'LDAP Output', 'Perform Insert, upsert, update, add or delete operations on records based on their DN (Distinguished  Name).');
INSERT INTO `r_step_type` VALUES (98, 'LDIFInput', 'LDIF Input', 'Read data from LDIF files');
INSERT INTO `r_step_type` VALUES (99, 'LoadFileInput', 'Load file content in memory', 'Load file content in memory');
INSERT INTO `r_step_type` VALUES (100, 'LucidDBBulkLoader', 'LucidDB Bulk Loader', 'Load data into LucidDB by using their bulk load command in streaming mode. (Doesnt work on Windows!)');
INSERT INTO `r_step_type` VALUES (101, 'LucidDBStreamingLoader', 'LucidDB Streaming Loader', 'Load data into LucidDB by using Remote Rows UDX.');
INSERT INTO `r_step_type` VALUES (102, 'Mail', 'Mail', 'Send eMail.');
INSERT INTO `r_step_type` VALUES (103, 'MailValidator', 'Mail Validator', 'Check if an email address is valid.');
INSERT INTO `r_step_type` VALUES (104, 'Mapping', 'Mapping (sub-transformation)', 'Run a mapping (sub-transformation), use MappingInput and MappingOutput to specify the fields interface');
INSERT INTO `r_step_type` VALUES (105, 'MappingInput', 'Mapping input specification', 'Specify the input interface of a mapping');
INSERT INTO `r_step_type` VALUES (106, 'MappingOutput', 'Mapping output specification', 'Specify the output interface of a mapping');
INSERT INTO `r_step_type` VALUES (107, 'HadoopEnterPlugin', 'MapReduce Input', 'Enter a Hadoop Mapper or Reducer transformation');
INSERT INTO `r_step_type` VALUES (108, 'HadoopExitPlugin', 'MapReduce Output', 'Exit a Hadoop Mapper or Reducer transformation ');
INSERT INTO `r_step_type` VALUES (109, 'MemoryGroupBy', 'Memory Group by', 'Builds aggregates in a group by fashion.\nThis step doesn\'t require sorted input.');
INSERT INTO `r_step_type` VALUES (110, 'MergeJoin', 'Merge Join', 'Joins two streams on a given key and outputs a joined set. The input streams must be sorted on the join key');
INSERT INTO `r_step_type` VALUES (111, 'MergeRows', 'Merge Rows (diff)', 'Merge two streams of rows, sorted on a certain key.  The two streams are compared and the equals, changed, deleted and new rows are flagged.');
INSERT INTO `r_step_type` VALUES (112, 'StepMetastructure', 'Metadata structure of stream', 'This is a step to read the metadata of the incoming stream.');
INSERT INTO `r_step_type` VALUES (113, 'AccessInput', 'Microsoft Access Input', 'Read data from a Microsoft Access file');
INSERT INTO `r_step_type` VALUES (114, 'AccessOutput', 'Microsoft Access Output', 'Stores records into an MS-Access database table.');
INSERT INTO `r_step_type` VALUES (115, 'ExcelInput', 'Microsoft Excel Input', 'Read data from Excel and OpenOffice Workbooks (XLS, XLSX, ODS).');
INSERT INTO `r_step_type` VALUES (116, 'ExcelOutput', 'Microsoft Excel Output', 'Stores records into an Excel (XLS) document with formatting information.');
INSERT INTO `r_step_type` VALUES (117, 'TypeExitExcelWriterStep', 'Microsoft Excel Writer', 'Writes or appends data to an Excel file');
INSERT INTO `r_step_type` VALUES (118, 'ScriptValueMod', 'Modified Java Script Value', 'This is a modified plugin for the Scripting Values with improved interface and performance.\nWritten & donated to open source by Martin Lange, Proconis : http://www.proconis.de');
INSERT INTO `r_step_type` VALUES (119, 'MondrianInput', 'Mondrian Input', 'Execute and retrieve data using an MDX query against a Pentaho Analyses OLAP server (Mondrian)');
INSERT INTO `r_step_type` VALUES (120, 'MonetDBAgileMart', 'MonetDB Agile Mart', 'Load data into MonetDB for Agile BI use cases');
INSERT INTO `r_step_type` VALUES (121, 'MonetDBBulkLoader', 'MonetDB Bulk Loader', 'Load data into MonetDB by using their bulk load command in streaming mode.');
INSERT INTO `r_step_type` VALUES (122, 'MongoDbInput', 'MongoDB Input', 'Reads from a Mongo DB collection');
INSERT INTO `r_step_type` VALUES (123, 'MongoDbOutput', 'MongoDB Output', 'Writes to a Mongo DB collection');
INSERT INTO `r_step_type` VALUES (124, 'MultiwayMergeJoin', 'Multiway Merge Join', 'Multiway Merge Join');
INSERT INTO `r_step_type` VALUES (125, 'MySQLBulkLoader', 'MySQL Bulk Loader', 'MySQL bulk loader step, loading data over a named pipe (not available on MS Windows)');
INSERT INTO `r_step_type` VALUES (126, 'NullIf', 'Null if...', 'Sets a field value to null if it is equal to a constant value');
INSERT INTO `r_step_type` VALUES (127, 'NumberRange', 'Number range', 'Create ranges based on numeric field');
INSERT INTO `r_step_type` VALUES (128, 'OlapInput', 'OLAP Input', 'Execute and retrieve data using an MDX query against any XML/A OLAP datasource using olap4j');
INSERT INTO `r_step_type` VALUES (129, 'OpenERPObjectDelete', 'OpenERP Object Delete', 'Deletes OpenERP objects');
INSERT INTO `r_step_type` VALUES (130, 'OpenERPObjectInput', 'OpenERP Object Input', 'Reads data from OpenERP objects');
INSERT INTO `r_step_type` VALUES (131, 'OpenERPObjectOutputImport', 'OpenERP Object Output', 'Writes data into OpenERP objects using the object import procedure');
INSERT INTO `r_step_type` VALUES (132, 'OraBulkLoader', 'Oracle Bulk Loader', 'Use Oracle Bulk Loader to load data');
INSERT INTO `r_step_type` VALUES (133, 'StepsMetrics', 'Output steps metrics', 'Return metrics for one or several steps');
INSERT INTO `r_step_type` VALUES (134, 'PaloCellInput', 'Palo Cell Input', 'Reads data from a defined Palo Cube ');
INSERT INTO `r_step_type` VALUES (135, 'PaloCellOutput', 'Palo Cell Output', 'Writes data to a defined Palo Cube');
INSERT INTO `r_step_type` VALUES (136, 'PaloDimInput', 'Palo Dim Input', 'Reads data from a defined Palo Dimension');
INSERT INTO `r_step_type` VALUES (137, 'PaloDimOutput', 'Palo Dim Output', 'Writes data to defined Palo Dimension');
INSERT INTO `r_step_type` VALUES (138, 'PentahoReportingOutput', 'Pentaho Reporting Output', 'Executes an existing report (PRPT)');
INSERT INTO `r_step_type` VALUES (139, 'PGPDecryptStream', 'PGP Decrypt stream', 'Decrypt data stream with PGP');
INSERT INTO `r_step_type` VALUES (140, 'PGPEncryptStream', 'PGP Encrypt stream', 'Encrypt data stream with PGP');
INSERT INTO `r_step_type` VALUES (141, 'PGBulkLoader', 'PostgreSQL Bulk Loader', 'PostgreSQL Bulk Loader');
INSERT INTO `r_step_type` VALUES (142, 'PrioritizeStreams', 'Prioritize streams', 'Prioritize streams in an order way.');
INSERT INTO `r_step_type` VALUES (143, 'ProcessFiles', 'Process files', 'Process one file per row (copy or move or delete).\nThis step only accept filename in input.');
INSERT INTO `r_step_type` VALUES (144, 'PropertyOutput', 'Properties Output', 'Write data to properties file');
INSERT INTO `r_step_type` VALUES (145, 'PropertyInput', 'Property Input', 'Read data (key, value) from properties files.');
INSERT INTO `r_step_type` VALUES (146, 'RegexEval', 'Regex Evaluation', 'Regular expression Evaluation\nThis step uses a regular expression to evaluate a field. It can also extract new fields out of an existing field with capturing groups.');
INSERT INTO `r_step_type` VALUES (147, 'ReplaceString', 'Replace in string', 'Replace all occurences a word in a string with another word.');
INSERT INTO `r_step_type` VALUES (148, 'ReservoirSampling', 'Reservoir Sampling', '[Transform] Samples a fixed number of rows from the incoming stream');
INSERT INTO `r_step_type` VALUES (149, 'Rest', 'REST Client', 'Consume RESTfull services.\nREpresentational State Transfer (REST) is a key design idiom that embraces a stateless client-server\narchitecture in which the web services are viewed as resources and can be identified by their URLs');
INSERT INTO `r_step_type` VALUES (150, 'Denormaliser', 'Row denormaliser', 'Denormalises rows by looking up key-value pairs and by assigning them to new fields in the output rows.\nThis method aggregates and needs the input rows to be sorted on the grouping fields');
INSERT INTO `r_step_type` VALUES (151, 'Flattener', 'Row flattener', 'Flattens consecutive rows based on the order in which they appear in the input stream');
INSERT INTO `r_step_type` VALUES (152, 'Normaliser', 'Row Normaliser', 'De-normalised information can be normalised using this step type.');
INSERT INTO `r_step_type` VALUES (153, 'RssInput', 'RSS Input', 'Read RSS feeds');
INSERT INTO `r_step_type` VALUES (154, 'RssOutput', 'RSS Output', 'Read RSS stream.');
INSERT INTO `r_step_type` VALUES (155, 'RuleAccumulator', 'Rule Accumulator', 'Execute a rule against a set of all incoming rows');
INSERT INTO `r_step_type` VALUES (156, 'RuleExecutor', 'Rule Executor', 'Execute a rule against each row or a set of rows');
INSERT INTO `r_step_type` VALUES (157, 'SSH', 'Run SSH commands', 'Run SSH commands and returns result.');
INSERT INTO `r_step_type` VALUES (158, 'S3CSVINPUT', 'S3 CSV Input', 'S3 CSV Input');
INSERT INTO `r_step_type` VALUES (159, 'S3FileOutputPlugin', 'S3 File Output', 'Create files in an S3 location');
INSERT INTO `r_step_type` VALUES (160, 'SalesforceDelete', 'Salesforce Delete', 'Delete records in Salesforce module.');
INSERT INTO `r_step_type` VALUES (161, 'SalesforceInput', 'Salesforce Input', '!BaseStep.TypeTooltipDesc.SalesforceInput!');
INSERT INTO `r_step_type` VALUES (162, 'SalesforceInsert', 'Salesforce Insert', 'Insert records in Salesforce module.');
INSERT INTO `r_step_type` VALUES (163, 'SalesforceUpdate', 'Salesforce Update', 'Update records in Salesforce module.');
INSERT INTO `r_step_type` VALUES (164, 'SalesforceUpsert', 'Salesforce Upsert', 'Insert or update records in Salesforce module.');
INSERT INTO `r_step_type` VALUES (165, 'SampleRows', 'Sample rows', 'Filter rows based on the line number.');
INSERT INTO `r_step_type` VALUES (166, 'SapInput', 'SAP Input', 'Read data from SAP ERP, optionally with parameters');
INSERT INTO `r_step_type` VALUES (167, 'SASInput', 'SAS Input', 'This step reads files in sas7bdat (SAS) native format');
INSERT INTO `r_step_type` VALUES (168, 'Script', 'Script', 'Calculate values by scripting in Ruby, Python, Groovy, JavaScript, ... (JSR-223)');
INSERT INTO `r_step_type` VALUES (169, 'SecretKeyGenerator', 'Secret key generator', 'Generate secret key for algorithms such as DES, AES, TripleDES.');
INSERT INTO `r_step_type` VALUES (170, 'SelectValues', 'Select values', 'Select or remove fields in a row.\nOptionally, set the field meta-data: type, length and precision.');
INSERT INTO `r_step_type` VALUES (171, 'SyslogMessage', 'Send message to Syslog', 'Send message to Syslog server');
INSERT INTO `r_step_type` VALUES (172, 'CubeOutput', 'Serialize to file', 'Write rows of data to a data cube');
INSERT INTO `r_step_type` VALUES (173, 'SetValueField', 'Set field value', 'Set value of a field with another value field');
INSERT INTO `r_step_type` VALUES (174, 'SetValueConstant', 'Set field value to a constant', 'Set value of a field to a constant');
INSERT INTO `r_step_type` VALUES (175, 'FilesToResult', 'Set files in result', 'This step allows you to set filenames in the result of this transformation.\nSubsequent job entries can then use this information.');
INSERT INTO `r_step_type` VALUES (176, 'SetSessionVariableStep', 'Set session variables', 'Set session variables in the current user session.');
INSERT INTO `r_step_type` VALUES (177, 'SetVariable', 'Set Variables', 'Set environment variables based on a single input row.');
INSERT INTO `r_step_type` VALUES (178, 'SFTPPut', 'SFTP Put', 'Upload a file or a stream file to remote host via SFTP');
INSERT INTO `r_step_type` VALUES (179, 'SimpleMapping', 'Simple Mapping (sub-transformation)', 'Run a mapping (sub-transformation), use MappingInput and MappingOutput to specify the fields interface.  This is the simplified version only allowing one input and one output data set.');
INSERT INTO `r_step_type` VALUES (180, 'SingleThreader', 'Single Threader', 'Executes a transformation snippet in a single thread.  You need a standard mapping or a transformation with an Injector step where data from the parent transformation will arive in blocks.');
INSERT INTO `r_step_type` VALUES (181, 'SocketReader', 'Socket reader', 'Socket reader.  A socket client that connects to a server (Socket Writer step).');
INSERT INTO `r_step_type` VALUES (182, 'SocketWriter', 'Socket writer', 'Socket writer.  A socket server that can send rows of data to a socket reader.');
INSERT INTO `r_step_type` VALUES (183, 'SortRows', 'Sort rows', 'Sort rows based upon field values (ascending or descending)');
INSERT INTO `r_step_type` VALUES (184, 'SortedMerge', 'Sorted Merge', 'Sorted Merge');
INSERT INTO `r_step_type` VALUES (185, 'SplitFieldToRows3', 'Split field to rows', 'Splits a single string field by delimiter and creates a new row for each split term');
INSERT INTO `r_step_type` VALUES (186, 'FieldSplitter', 'Split Fields', 'When you want to split a single field into more then one, use this step type.');
INSERT INTO `r_step_type` VALUES (187, 'SQLFileOutput', 'SQL File Output', 'Output SQL INSERT statements to file');
INSERT INTO `r_step_type` VALUES (188, 'SSTableOutput', 'SSTable Output', 'Writes to a filesystem directory as a Cassandra SSTable');
INSERT INTO `r_step_type` VALUES (189, 'StreamLookup', 'Stream lookup', 'Look up values coming from another stream in the transformation.');
INSERT INTO `r_step_type` VALUES (190, 'XMLInputSax', 'Streaming XML Input', 'Read data from an XML file in a streaming fashing, working faster and consuming less memory');
INSERT INTO `r_step_type` VALUES (191, 'StringOperations', 'String operations', 'Apply certain operations like trimming, padding and others to string value.');
INSERT INTO `r_step_type` VALUES (192, 'StringCut', 'Strings cut', 'Strings cut (substring).');
INSERT INTO `r_step_type` VALUES (193, 'SwitchCase', 'Switch / Case', 'Switch a row to a certain target step based on the case value in a field.');
INSERT INTO `r_step_type` VALUES (194, 'SymmetricCryptoTrans', 'Symmetric Cryptography', 'Encrypt or decrypt a string using symmetric encryption.\nAvailable algorithms are DES, AES, TripleDES.');
INSERT INTO `r_step_type` VALUES (195, 'SynchronizeAfterMerge', 'Synchronize after merge', 'This step perform insert/update/delete in one go based on the value of a field. ');
INSERT INTO `r_step_type` VALUES (196, 'TableAgileMart', 'Table Agile Mart', 'Load data into a table for Agile BI use cases');
INSERT INTO `r_step_type` VALUES (197, 'TableCompare', 'Table Compare', 'Compares 2 tables and gives back a list of differences');
INSERT INTO `r_step_type` VALUES (198, 'TableExists', 'Table exists', 'Check if a table exists on a specified connection');
INSERT INTO `r_step_type` VALUES (199, 'TableInput', 'Table input', 'Read information from a database table.');
INSERT INTO `r_step_type` VALUES (200, 'TableOutput', 'Table output', 'Write information to a database table');
INSERT INTO `r_step_type` VALUES (201, 'TeraFast', 'Teradata Fastload Bulk Loader', 'The Teradata Fastload Bulk loader');
INSERT INTO `r_step_type` VALUES (202, 'TeraDataBulkLoader', 'Teradata TPT Bulk Loader', 'Teradata TPT bulkloader, using tbuild command');
INSERT INTO `r_step_type` VALUES (203, 'TextFileInput', 'Text file input', 'Read data from a text file in several formats.\nThis data can then be passed on to the next step(s)...');
INSERT INTO `r_step_type` VALUES (204, 'TextFileOutput', 'Text file output', 'Write rows to a text file.');
INSERT INTO `r_step_type` VALUES (205, 'TransExecutor', 'Transformation Executor', 'This step executes a Pentaho Data Integration transformation, sets parameters and passes rows.');
INSERT INTO `r_step_type` VALUES (206, 'Unique', 'Unique rows', 'Remove double rows and leave only unique occurrences.\nThis works only on a sorted input.\nIf the input is not sorted, only double consecutive rows are handled correctly.');
INSERT INTO `r_step_type` VALUES (207, 'UniqueRowsByHashSet', 'Unique rows (HashSet)', 'Remove double rows and leave only unique occurrences by using a HashSet.');
INSERT INTO `r_step_type` VALUES (208, 'UnivariateStats', 'Univariate Statistics', 'This step computes some simple stats based on a single input field');
INSERT INTO `r_step_type` VALUES (209, 'Update', 'Update', 'Update data in a database table based upon keys');
INSERT INTO `r_step_type` VALUES (210, 'UserDefinedJavaClass', 'User Defined Java Class', 'This step allows you to program a step using Java code');
INSERT INTO `r_step_type` VALUES (211, 'Janino', 'User Defined Java Expression', 'Calculate the result of a Java Expression using Janino');
INSERT INTO `r_step_type` VALUES (212, 'ValueMapper', 'Value Mapper', 'Maps values of a certain field from one value to another');
INSERT INTO `r_step_type` VALUES (213, 'WebServiceLookup', 'Web Services Lookup', 'Look up information using web services (WSDL)');
INSERT INTO `r_step_type` VALUES (214, 'WriteToLog', 'Write to log', 'Write data to log');
INSERT INTO `r_step_type` VALUES (215, 'XBaseInput', 'XBase input', 'Reads records from an XBase type of database file (DBF)');
INSERT INTO `r_step_type` VALUES (216, 'XMLInput', 'XML Input', 'Read data from an XML file');
INSERT INTO `r_step_type` VALUES (217, 'XMLInputStream', 'XML Input Stream (StAX)', 'This step is capable of processing very large and complex XML files very fast.');
INSERT INTO `r_step_type` VALUES (218, 'XMLJoin', 'XML Join', 'Joins a stream of XML-Tags into a target XML string');
INSERT INTO `r_step_type` VALUES (219, 'XMLOutput', 'XML Output', 'Write data to an XML file');
INSERT INTO `r_step_type` VALUES (220, 'XSDValidator', 'XSD Validator', 'Validate XML source (files or streams) against XML Schema Definition.');
INSERT INTO `r_step_type` VALUES (221, 'XSLT', 'XSL Transformation', 'Transform XML stream using XSL (eXtensible Stylesheet Language).');
INSERT INTO `r_step_type` VALUES (222, 'YamlInput', 'Yaml Input ', 'Read YAML source (file or stream) parse them and convert them to rows and writes these to one or more output. ');
INSERT INTO `r_step_type` VALUES (223, 'ZipFile', 'Zip file', 'Zip a file.\nFilename will be extracted from incoming stream.');

-- ----------------------------
-- Table structure for r_trans_attribute
-- ----------------------------
DROP TABLE IF EXISTS `r_trans_attribute`;
CREATE TABLE `r_trans_attribute`  (
  `ID_TRANS_ATTRIBUTE` bigint(20) NOT NULL,
  `ID_TRANSFORMATION` int(11) NULL DEFAULT NULL,
  `NR` int(11) NULL DEFAULT NULL,
  `CODE` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `VALUE_NUM` bigint(20) NULL DEFAULT NULL,
  `VALUE_STR` mediumtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  PRIMARY KEY (`ID_TRANS_ATTRIBUTE`) USING BTREE,
  UNIQUE INDEX `IDX_TATT`(`ID_TRANSFORMATION`, `CODE`, `NR`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of r_trans_attribute
-- ----------------------------
INSERT INTO `r_trans_attribute` VALUES (2887, 4, 0, 'UNIQUE_CONNECTIONS', 0, 'N');
INSERT INTO `r_trans_attribute` VALUES (2888, 4, 0, 'FEEDBACK_SHOWN', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (2889, 4, 0, 'FEEDBACK_SIZE', 50000, NULL);
INSERT INTO `r_trans_attribute` VALUES (2890, 4, 0, 'USING_THREAD_PRIORITIES', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (2891, 4, 0, 'SHARED_FILE', 0, NULL);
INSERT INTO `r_trans_attribute` VALUES (2892, 4, 0, 'CAPTURE_STEP_PERFORMANCE', 0, 'N');
INSERT INTO `r_trans_attribute` VALUES (2893, 4, 0, 'STEP_PERFORMANCE_CAPTURING_DELAY', 1000, NULL);
INSERT INTO `r_trans_attribute` VALUES (2894, 4, 0, 'STEP_PERFORMANCE_CAPTURING_SIZE_LIMIT', 0, '100');
INSERT INTO `r_trans_attribute` VALUES (2895, 4, 0, 'STEP_PERFORMANCE_LOG_TABLE', 0, NULL);
INSERT INTO `r_trans_attribute` VALUES (2896, 4, 0, 'LOG_SIZE_LIMIT', 0, NULL);
INSERT INTO `r_trans_attribute` VALUES (2897, 4, 0, 'LOG_INTERVAL', 0, NULL);
INSERT INTO `r_trans_attribute` VALUES (2898, 4, 0, 'TRANSFORMATION_TYPE', 0, 'Normal');
INSERT INTO `r_trans_attribute` VALUES (2899, 4, 0, 'SLEEP_TIME_EMPTY', 50, NULL);
INSERT INTO `r_trans_attribute` VALUES (2900, 4, 0, 'SLEEP_TIME_FULL', 50, NULL);
INSERT INTO `r_trans_attribute` VALUES (2901, 4, 0, 'TRANS_LOG_TABLE_CONNECTION_NAME', 0, NULL);
INSERT INTO `r_trans_attribute` VALUES (2902, 4, 0, 'TRANS_LOG_TABLE_SCHEMA_NAME', 0, NULL);
INSERT INTO `r_trans_attribute` VALUES (2903, 4, 0, 'TRANS_LOG_TABLE_TABLE_NAME', 0, NULL);
INSERT INTO `r_trans_attribute` VALUES (2904, 4, 0, 'TRANS_LOG_TABLE_TIMEOUT_IN_DAYS', 0, NULL);
INSERT INTO `r_trans_attribute` VALUES (2905, 4, 0, 'TRANS_LOG_TABLE_FIELD_ID0', 0, 'ID_BATCH');
INSERT INTO `r_trans_attribute` VALUES (2906, 4, 0, 'TRANS_LOG_TABLE_FIELD_NAME0', 0, 'ID_BATCH');
INSERT INTO `r_trans_attribute` VALUES (2907, 4, 0, 'TRANS_LOG_TABLE_FIELD_ENABLED0', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (2908, 4, 0, 'TRANS_LOG_TABLE_FIELD_ID1', 0, 'CHANNEL_ID');
INSERT INTO `r_trans_attribute` VALUES (2909, 4, 0, 'TRANS_LOG_TABLE_FIELD_NAME1', 0, 'CHANNEL_ID');
INSERT INTO `r_trans_attribute` VALUES (2910, 4, 0, 'TRANS_LOG_TABLE_FIELD_ENABLED1', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (2911, 4, 0, 'TRANS_LOG_TABLE_FIELD_ID2', 0, 'TRANSNAME');
INSERT INTO `r_trans_attribute` VALUES (2912, 4, 0, 'TRANS_LOG_TABLE_FIELD_NAME2', 0, 'TRANSNAME');
INSERT INTO `r_trans_attribute` VALUES (2913, 4, 0, 'TRANS_LOG_TABLE_FIELD_ENABLED2', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (2914, 4, 0, 'TRANS_LOG_TABLE_FIELD_ID3', 0, 'STATUS');
INSERT INTO `r_trans_attribute` VALUES (2915, 4, 0, 'TRANS_LOG_TABLE_FIELD_NAME3', 0, 'STATUS');
INSERT INTO `r_trans_attribute` VALUES (2916, 4, 0, 'TRANS_LOG_TABLE_FIELD_ENABLED3', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (2917, 4, 0, 'TRANS_LOG_TABLE_FIELD_ID4', 0, 'LINES_READ');
INSERT INTO `r_trans_attribute` VALUES (2918, 4, 0, 'TRANS_LOG_TABLE_FIELD_NAME4', 0, 'LINES_READ');
INSERT INTO `r_trans_attribute` VALUES (2919, 4, 0, 'TRANS_LOG_TABLE_FIELD_ENABLED4', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (2920, 4, 0, 'TRANS_LOG_TABLE_FIELD_SUBJECT4', 0, NULL);
INSERT INTO `r_trans_attribute` VALUES (2921, 4, 0, 'TRANS_LOG_TABLE_FIELD_ID5', 0, 'LINES_WRITTEN');
INSERT INTO `r_trans_attribute` VALUES (2922, 4, 0, 'TRANS_LOG_TABLE_FIELD_NAME5', 0, 'LINES_WRITTEN');
INSERT INTO `r_trans_attribute` VALUES (2923, 4, 0, 'TRANS_LOG_TABLE_FIELD_ENABLED5', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (2924, 4, 0, 'TRANS_LOG_TABLE_FIELD_SUBJECT5', 0, NULL);
INSERT INTO `r_trans_attribute` VALUES (2925, 4, 0, 'TRANS_LOG_TABLE_FIELD_ID6', 0, 'LINES_UPDATED');
INSERT INTO `r_trans_attribute` VALUES (2926, 4, 0, 'TRANS_LOG_TABLE_FIELD_NAME6', 0, 'LINES_UPDATED');
INSERT INTO `r_trans_attribute` VALUES (2927, 4, 0, 'TRANS_LOG_TABLE_FIELD_ENABLED6', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (2928, 4, 0, 'TRANS_LOG_TABLE_FIELD_SUBJECT6', 0, NULL);
INSERT INTO `r_trans_attribute` VALUES (2929, 4, 0, 'TRANS_LOG_TABLE_FIELD_ID7', 0, 'LINES_INPUT');
INSERT INTO `r_trans_attribute` VALUES (2930, 4, 0, 'TRANS_LOG_TABLE_FIELD_NAME7', 0, 'LINES_INPUT');
INSERT INTO `r_trans_attribute` VALUES (2931, 4, 0, 'TRANS_LOG_TABLE_FIELD_ENABLED7', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (2932, 4, 0, 'TRANS_LOG_TABLE_FIELD_SUBJECT7', 0, NULL);
INSERT INTO `r_trans_attribute` VALUES (2933, 4, 0, 'TRANS_LOG_TABLE_FIELD_ID8', 0, 'LINES_OUTPUT');
INSERT INTO `r_trans_attribute` VALUES (2934, 4, 0, 'TRANS_LOG_TABLE_FIELD_NAME8', 0, 'LINES_OUTPUT');
INSERT INTO `r_trans_attribute` VALUES (2935, 4, 0, 'TRANS_LOG_TABLE_FIELD_ENABLED8', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (2936, 4, 0, 'TRANS_LOG_TABLE_FIELD_SUBJECT8', 0, NULL);
INSERT INTO `r_trans_attribute` VALUES (2937, 4, 0, 'TRANS_LOG_TABLE_FIELD_ID9', 0, 'LINES_REJECTED');
INSERT INTO `r_trans_attribute` VALUES (2938, 4, 0, 'TRANS_LOG_TABLE_FIELD_NAME9', 0, 'LINES_REJECTED');
INSERT INTO `r_trans_attribute` VALUES (2939, 4, 0, 'TRANS_LOG_TABLE_FIELD_ENABLED9', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (2940, 4, 0, 'TRANS_LOG_TABLE_FIELD_SUBJECT9', 0, NULL);
INSERT INTO `r_trans_attribute` VALUES (2941, 4, 0, 'TRANS_LOG_TABLE_FIELD_ID10', 0, 'ERRORS');
INSERT INTO `r_trans_attribute` VALUES (2942, 4, 0, 'TRANS_LOG_TABLE_FIELD_NAME10', 0, 'ERRORS');
INSERT INTO `r_trans_attribute` VALUES (2943, 4, 0, 'TRANS_LOG_TABLE_FIELD_ENABLED10', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (2944, 4, 0, 'TRANS_LOG_TABLE_FIELD_ID11', 0, 'STARTDATE');
INSERT INTO `r_trans_attribute` VALUES (2945, 4, 0, 'TRANS_LOG_TABLE_FIELD_NAME11', 0, 'STARTDATE');
INSERT INTO `r_trans_attribute` VALUES (2946, 4, 0, 'TRANS_LOG_TABLE_FIELD_ENABLED11', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (2947, 4, 0, 'TRANS_LOG_TABLE_FIELD_ID12', 0, 'ENDDATE');
INSERT INTO `r_trans_attribute` VALUES (2948, 4, 0, 'TRANS_LOG_TABLE_FIELD_NAME12', 0, 'ENDDATE');
INSERT INTO `r_trans_attribute` VALUES (2949, 4, 0, 'TRANS_LOG_TABLE_FIELD_ENABLED12', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (2950, 4, 0, 'TRANS_LOG_TABLE_FIELD_ID13', 0, 'LOGDATE');
INSERT INTO `r_trans_attribute` VALUES (2951, 4, 0, 'TRANS_LOG_TABLE_FIELD_NAME13', 0, 'LOGDATE');
INSERT INTO `r_trans_attribute` VALUES (2952, 4, 0, 'TRANS_LOG_TABLE_FIELD_ENABLED13', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (2953, 4, 0, 'TRANS_LOG_TABLE_FIELD_ID14', 0, 'DEPDATE');
INSERT INTO `r_trans_attribute` VALUES (2954, 4, 0, 'TRANS_LOG_TABLE_FIELD_NAME14', 0, 'DEPDATE');
INSERT INTO `r_trans_attribute` VALUES (2955, 4, 0, 'TRANS_LOG_TABLE_FIELD_ENABLED14', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (2956, 4, 0, 'TRANS_LOG_TABLE_FIELD_ID15', 0, 'REPLAYDATE');
INSERT INTO `r_trans_attribute` VALUES (2957, 4, 0, 'TRANS_LOG_TABLE_FIELD_NAME15', 0, 'REPLAYDATE');
INSERT INTO `r_trans_attribute` VALUES (2958, 4, 0, 'TRANS_LOG_TABLE_FIELD_ENABLED15', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (2959, 4, 0, 'TRANS_LOG_TABLE_FIELD_ID16', 0, 'LOG_FIELD');
INSERT INTO `r_trans_attribute` VALUES (2960, 4, 0, 'TRANS_LOG_TABLE_FIELD_NAME16', 0, 'LOG_FIELD');
INSERT INTO `r_trans_attribute` VALUES (2961, 4, 0, 'TRANS_LOG_TABLE_FIELD_ENABLED16', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (2962, 4, 0, 'TRANS_LOG_TABLE_FIELD_ID17', 0, 'EXECUTING_SERVER');
INSERT INTO `r_trans_attribute` VALUES (2963, 4, 0, 'TRANS_LOG_TABLE_FIELD_NAME17', 0, 'EXECUTING_SERVER');
INSERT INTO `r_trans_attribute` VALUES (2964, 4, 0, 'TRANS_LOG_TABLE_FIELD_ENABLED17', 0, 'N');
INSERT INTO `r_trans_attribute` VALUES (2965, 4, 0, 'TRANS_LOG_TABLE_FIELD_ID18', 0, 'EXECUTING_USER');
INSERT INTO `r_trans_attribute` VALUES (2966, 4, 0, 'TRANS_LOG_TABLE_FIELD_NAME18', 0, 'EXECUTING_USER');
INSERT INTO `r_trans_attribute` VALUES (2967, 4, 0, 'TRANS_LOG_TABLE_FIELD_ENABLED18', 0, 'N');
INSERT INTO `r_trans_attribute` VALUES (2968, 4, 0, 'TRANS_LOG_TABLE_FIELD_ID19', 0, 'CLIENT');
INSERT INTO `r_trans_attribute` VALUES (2969, 4, 0, 'TRANS_LOG_TABLE_FIELD_NAME19', 0, 'CLIENT');
INSERT INTO `r_trans_attribute` VALUES (2970, 4, 0, 'TRANS_LOG_TABLE_FIELD_ENABLED19', 0, 'N');
INSERT INTO `r_trans_attribute` VALUES (2971, 4, 0, 'TRANSLOG_TABLE_INTERVAL', 0, NULL);
INSERT INTO `r_trans_attribute` VALUES (2972, 4, 0, 'TRANSLOG_TABLE_SIZE_LIMIT', 0, NULL);
INSERT INTO `r_trans_attribute` VALUES (2973, 4, 0, 'STEP_LOG_TABLE_CONNECTION_NAME', 0, NULL);
INSERT INTO `r_trans_attribute` VALUES (2974, 4, 0, 'STEP_LOG_TABLE_SCHEMA_NAME', 0, NULL);
INSERT INTO `r_trans_attribute` VALUES (2975, 4, 0, 'STEP_LOG_TABLE_TABLE_NAME', 0, NULL);
INSERT INTO `r_trans_attribute` VALUES (2976, 4, 0, 'STEP_LOG_TABLE_TIMEOUT_IN_DAYS', 0, NULL);
INSERT INTO `r_trans_attribute` VALUES (2977, 4, 0, 'STEP_LOG_TABLE_FIELD_ID0', 0, 'ID_BATCH');
INSERT INTO `r_trans_attribute` VALUES (2978, 4, 0, 'STEP_LOG_TABLE_FIELD_NAME0', 0, 'ID_BATCH');
INSERT INTO `r_trans_attribute` VALUES (2979, 4, 0, 'STEP_LOG_TABLE_FIELD_ENABLED0', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (2980, 4, 0, 'STEP_LOG_TABLE_FIELD_ID1', 0, 'CHANNEL_ID');
INSERT INTO `r_trans_attribute` VALUES (2981, 4, 0, 'STEP_LOG_TABLE_FIELD_NAME1', 0, 'CHANNEL_ID');
INSERT INTO `r_trans_attribute` VALUES (2982, 4, 0, 'STEP_LOG_TABLE_FIELD_ENABLED1', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (2983, 4, 0, 'STEP_LOG_TABLE_FIELD_ID2', 0, 'LOG_DATE');
INSERT INTO `r_trans_attribute` VALUES (2984, 4, 0, 'STEP_LOG_TABLE_FIELD_NAME2', 0, 'LOG_DATE');
INSERT INTO `r_trans_attribute` VALUES (2985, 4, 0, 'STEP_LOG_TABLE_FIELD_ENABLED2', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (2986, 4, 0, 'STEP_LOG_TABLE_FIELD_ID3', 0, 'TRANSNAME');
INSERT INTO `r_trans_attribute` VALUES (2987, 4, 0, 'STEP_LOG_TABLE_FIELD_NAME3', 0, 'TRANSNAME');
INSERT INTO `r_trans_attribute` VALUES (2988, 4, 0, 'STEP_LOG_TABLE_FIELD_ENABLED3', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (2989, 4, 0, 'STEP_LOG_TABLE_FIELD_ID4', 0, 'STEPNAME');
INSERT INTO `r_trans_attribute` VALUES (2990, 4, 0, 'STEP_LOG_TABLE_FIELD_NAME4', 0, 'STEPNAME');
INSERT INTO `r_trans_attribute` VALUES (2991, 4, 0, 'STEP_LOG_TABLE_FIELD_ENABLED4', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (2992, 4, 0, 'STEP_LOG_TABLE_FIELD_ID5', 0, 'STEP_COPY');
INSERT INTO `r_trans_attribute` VALUES (2993, 4, 0, 'STEP_LOG_TABLE_FIELD_NAME5', 0, 'STEP_COPY');
INSERT INTO `r_trans_attribute` VALUES (2994, 4, 0, 'STEP_LOG_TABLE_FIELD_ENABLED5', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (2995, 4, 0, 'STEP_LOG_TABLE_FIELD_ID6', 0, 'LINES_READ');
INSERT INTO `r_trans_attribute` VALUES (2996, 4, 0, 'STEP_LOG_TABLE_FIELD_NAME6', 0, 'LINES_READ');
INSERT INTO `r_trans_attribute` VALUES (2997, 4, 0, 'STEP_LOG_TABLE_FIELD_ENABLED6', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (2998, 4, 0, 'STEP_LOG_TABLE_FIELD_ID7', 0, 'LINES_WRITTEN');
INSERT INTO `r_trans_attribute` VALUES (2999, 4, 0, 'STEP_LOG_TABLE_FIELD_NAME7', 0, 'LINES_WRITTEN');
INSERT INTO `r_trans_attribute` VALUES (3000, 4, 0, 'STEP_LOG_TABLE_FIELD_ENABLED7', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (3001, 4, 0, 'STEP_LOG_TABLE_FIELD_ID8', 0, 'LINES_UPDATED');
INSERT INTO `r_trans_attribute` VALUES (3002, 4, 0, 'STEP_LOG_TABLE_FIELD_NAME8', 0, 'LINES_UPDATED');
INSERT INTO `r_trans_attribute` VALUES (3003, 4, 0, 'STEP_LOG_TABLE_FIELD_ENABLED8', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (3004, 4, 0, 'STEP_LOG_TABLE_FIELD_ID9', 0, 'LINES_INPUT');
INSERT INTO `r_trans_attribute` VALUES (3005, 4, 0, 'STEP_LOG_TABLE_FIELD_NAME9', 0, 'LINES_INPUT');
INSERT INTO `r_trans_attribute` VALUES (3006, 4, 0, 'STEP_LOG_TABLE_FIELD_ENABLED9', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (3007, 4, 0, 'STEP_LOG_TABLE_FIELD_ID10', 0, 'LINES_OUTPUT');
INSERT INTO `r_trans_attribute` VALUES (3008, 4, 0, 'STEP_LOG_TABLE_FIELD_NAME10', 0, 'LINES_OUTPUT');
INSERT INTO `r_trans_attribute` VALUES (3009, 4, 0, 'STEP_LOG_TABLE_FIELD_ENABLED10', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (3010, 4, 0, 'STEP_LOG_TABLE_FIELD_ID11', 0, 'LINES_REJECTED');
INSERT INTO `r_trans_attribute` VALUES (3011, 4, 0, 'STEP_LOG_TABLE_FIELD_NAME11', 0, 'LINES_REJECTED');
INSERT INTO `r_trans_attribute` VALUES (3012, 4, 0, 'STEP_LOG_TABLE_FIELD_ENABLED11', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (3013, 4, 0, 'STEP_LOG_TABLE_FIELD_ID12', 0, 'ERRORS');
INSERT INTO `r_trans_attribute` VALUES (3014, 4, 0, 'STEP_LOG_TABLE_FIELD_NAME12', 0, 'ERRORS');
INSERT INTO `r_trans_attribute` VALUES (3015, 4, 0, 'STEP_LOG_TABLE_FIELD_ENABLED12', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (3016, 4, 0, 'STEP_LOG_TABLE_FIELD_ID13', 0, 'LOG_FIELD');
INSERT INTO `r_trans_attribute` VALUES (3017, 4, 0, 'STEP_LOG_TABLE_FIELD_NAME13', 0, 'LOG_FIELD');
INSERT INTO `r_trans_attribute` VALUES (3018, 4, 0, 'STEP_LOG_TABLE_FIELD_ENABLED13', 0, 'N');
INSERT INTO `r_trans_attribute` VALUES (3019, 4, 0, 'PERFORMANCE_LOG_TABLE_CONNECTION_NAME', 0, NULL);
INSERT INTO `r_trans_attribute` VALUES (3020, 4, 0, 'PERFORMANCE_LOG_TABLE_SCHEMA_NAME', 0, NULL);
INSERT INTO `r_trans_attribute` VALUES (3021, 4, 0, 'PERFORMANCE_LOG_TABLE_TABLE_NAME', 0, NULL);
INSERT INTO `r_trans_attribute` VALUES (3022, 4, 0, 'PERFORMANCE_LOG_TABLE_TIMEOUT_IN_DAYS', 0, NULL);
INSERT INTO `r_trans_attribute` VALUES (3023, 4, 0, 'PERFORMANCE_LOG_TABLE_FIELD_ID0', 0, 'ID_BATCH');
INSERT INTO `r_trans_attribute` VALUES (3024, 4, 0, 'PERFORMANCE_LOG_TABLE_FIELD_NAME0', 0, 'ID_BATCH');
INSERT INTO `r_trans_attribute` VALUES (3025, 4, 0, 'PERFORMANCE_LOG_TABLE_FIELD_ENABLED0', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (3026, 4, 0, 'PERFORMANCE_LOG_TABLE_FIELD_ID1', 0, 'SEQ_NR');
INSERT INTO `r_trans_attribute` VALUES (3027, 4, 0, 'PERFORMANCE_LOG_TABLE_FIELD_NAME1', 0, 'SEQ_NR');
INSERT INTO `r_trans_attribute` VALUES (3028, 4, 0, 'PERFORMANCE_LOG_TABLE_FIELD_ENABLED1', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (3029, 4, 0, 'PERFORMANCE_LOG_TABLE_FIELD_ID2', 0, 'LOGDATE');
INSERT INTO `r_trans_attribute` VALUES (3030, 4, 0, 'PERFORMANCE_LOG_TABLE_FIELD_NAME2', 0, 'LOGDATE');
INSERT INTO `r_trans_attribute` VALUES (3031, 4, 0, 'PERFORMANCE_LOG_TABLE_FIELD_ENABLED2', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (3032, 4, 0, 'PERFORMANCE_LOG_TABLE_FIELD_ID3', 0, 'TRANSNAME');
INSERT INTO `r_trans_attribute` VALUES (3033, 4, 0, 'PERFORMANCE_LOG_TABLE_FIELD_NAME3', 0, 'TRANSNAME');
INSERT INTO `r_trans_attribute` VALUES (3034, 4, 0, 'PERFORMANCE_LOG_TABLE_FIELD_ENABLED3', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (3035, 4, 0, 'PERFORMANCE_LOG_TABLE_FIELD_ID4', 0, 'STEPNAME');
INSERT INTO `r_trans_attribute` VALUES (3036, 4, 0, 'PERFORMANCE_LOG_TABLE_FIELD_NAME4', 0, 'STEPNAME');
INSERT INTO `r_trans_attribute` VALUES (3037, 4, 0, 'PERFORMANCE_LOG_TABLE_FIELD_ENABLED4', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (3038, 4, 0, 'PERFORMANCE_LOG_TABLE_FIELD_ID5', 0, 'STEP_COPY');
INSERT INTO `r_trans_attribute` VALUES (3039, 4, 0, 'PERFORMANCE_LOG_TABLE_FIELD_NAME5', 0, 'STEP_COPY');
INSERT INTO `r_trans_attribute` VALUES (3040, 4, 0, 'PERFORMANCE_LOG_TABLE_FIELD_ENABLED5', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (3041, 4, 0, 'PERFORMANCE_LOG_TABLE_FIELD_ID6', 0, 'LINES_READ');
INSERT INTO `r_trans_attribute` VALUES (3042, 4, 0, 'PERFORMANCE_LOG_TABLE_FIELD_NAME6', 0, 'LINES_READ');
INSERT INTO `r_trans_attribute` VALUES (3043, 4, 0, 'PERFORMANCE_LOG_TABLE_FIELD_ENABLED6', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (3044, 4, 0, 'PERFORMANCE_LOG_TABLE_FIELD_ID7', 0, 'LINES_WRITTEN');
INSERT INTO `r_trans_attribute` VALUES (3045, 4, 0, 'PERFORMANCE_LOG_TABLE_FIELD_NAME7', 0, 'LINES_WRITTEN');
INSERT INTO `r_trans_attribute` VALUES (3046, 4, 0, 'PERFORMANCE_LOG_TABLE_FIELD_ENABLED7', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (3047, 4, 0, 'PERFORMANCE_LOG_TABLE_FIELD_ID8', 0, 'LINES_UPDATED');
INSERT INTO `r_trans_attribute` VALUES (3048, 4, 0, 'PERFORMANCE_LOG_TABLE_FIELD_NAME8', 0, 'LINES_UPDATED');
INSERT INTO `r_trans_attribute` VALUES (3049, 4, 0, 'PERFORMANCE_LOG_TABLE_FIELD_ENABLED8', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (3050, 4, 0, 'PERFORMANCE_LOG_TABLE_FIELD_ID9', 0, 'LINES_INPUT');
INSERT INTO `r_trans_attribute` VALUES (3051, 4, 0, 'PERFORMANCE_LOG_TABLE_FIELD_NAME9', 0, 'LINES_INPUT');
INSERT INTO `r_trans_attribute` VALUES (3052, 4, 0, 'PERFORMANCE_LOG_TABLE_FIELD_ENABLED9', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (3053, 4, 0, 'PERFORMANCE_LOG_TABLE_FIELD_ID10', 0, 'LINES_OUTPUT');
INSERT INTO `r_trans_attribute` VALUES (3054, 4, 0, 'PERFORMANCE_LOG_TABLE_FIELD_NAME10', 0, 'LINES_OUTPUT');
INSERT INTO `r_trans_attribute` VALUES (3055, 4, 0, 'PERFORMANCE_LOG_TABLE_FIELD_ENABLED10', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (3056, 4, 0, 'PERFORMANCE_LOG_TABLE_FIELD_ID11', 0, 'LINES_REJECTED');
INSERT INTO `r_trans_attribute` VALUES (3057, 4, 0, 'PERFORMANCE_LOG_TABLE_FIELD_NAME11', 0, 'LINES_REJECTED');
INSERT INTO `r_trans_attribute` VALUES (3058, 4, 0, 'PERFORMANCE_LOG_TABLE_FIELD_ENABLED11', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (3059, 4, 0, 'PERFORMANCE_LOG_TABLE_FIELD_ID12', 0, 'ERRORS');
INSERT INTO `r_trans_attribute` VALUES (3060, 4, 0, 'PERFORMANCE_LOG_TABLE_FIELD_NAME12', 0, 'ERRORS');
INSERT INTO `r_trans_attribute` VALUES (3061, 4, 0, 'PERFORMANCE_LOG_TABLE_FIELD_ENABLED12', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (3062, 4, 0, 'PERFORMANCE_LOG_TABLE_FIELD_ID13', 0, 'INPUT_BUFFER_ROWS');
INSERT INTO `r_trans_attribute` VALUES (3063, 4, 0, 'PERFORMANCE_LOG_TABLE_FIELD_NAME13', 0, 'INPUT_BUFFER_ROWS');
INSERT INTO `r_trans_attribute` VALUES (3064, 4, 0, 'PERFORMANCE_LOG_TABLE_FIELD_ENABLED13', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (3065, 4, 0, 'PERFORMANCE_LOG_TABLE_FIELD_ID14', 0, 'OUTPUT_BUFFER_ROWS');
INSERT INTO `r_trans_attribute` VALUES (3066, 4, 0, 'PERFORMANCE_LOG_TABLE_FIELD_NAME14', 0, 'OUTPUT_BUFFER_ROWS');
INSERT INTO `r_trans_attribute` VALUES (3067, 4, 0, 'PERFORMANCE_LOG_TABLE_FIELD_ENABLED14', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (3068, 4, 0, 'PERFORMANCELOG_TABLE_INTERVAL', 0, NULL);
INSERT INTO `r_trans_attribute` VALUES (3069, 4, 0, 'CHANNEL_LOG_TABLE_CONNECTION_NAME', 0, NULL);
INSERT INTO `r_trans_attribute` VALUES (3070, 4, 0, 'CHANNEL_LOG_TABLE_SCHEMA_NAME', 0, NULL);
INSERT INTO `r_trans_attribute` VALUES (3071, 4, 0, 'CHANNEL_LOG_TABLE_TABLE_NAME', 0, NULL);
INSERT INTO `r_trans_attribute` VALUES (3072, 4, 0, 'CHANNEL_LOG_TABLE_TIMEOUT_IN_DAYS', 0, NULL);
INSERT INTO `r_trans_attribute` VALUES (3073, 4, 0, 'CHANNEL_LOG_TABLE_FIELD_ID0', 0, 'ID_BATCH');
INSERT INTO `r_trans_attribute` VALUES (3074, 4, 0, 'CHANNEL_LOG_TABLE_FIELD_NAME0', 0, 'ID_BATCH');
INSERT INTO `r_trans_attribute` VALUES (3075, 4, 0, 'CHANNEL_LOG_TABLE_FIELD_ENABLED0', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (3076, 4, 0, 'CHANNEL_LOG_TABLE_FIELD_ID1', 0, 'CHANNEL_ID');
INSERT INTO `r_trans_attribute` VALUES (3077, 4, 0, 'CHANNEL_LOG_TABLE_FIELD_NAME1', 0, 'CHANNEL_ID');
INSERT INTO `r_trans_attribute` VALUES (3078, 4, 0, 'CHANNEL_LOG_TABLE_FIELD_ENABLED1', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (3079, 4, 0, 'CHANNEL_LOG_TABLE_FIELD_ID2', 0, 'LOG_DATE');
INSERT INTO `r_trans_attribute` VALUES (3080, 4, 0, 'CHANNEL_LOG_TABLE_FIELD_NAME2', 0, 'LOG_DATE');
INSERT INTO `r_trans_attribute` VALUES (3081, 4, 0, 'CHANNEL_LOG_TABLE_FIELD_ENABLED2', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (3082, 4, 0, 'CHANNEL_LOG_TABLE_FIELD_ID3', 0, 'LOGGING_OBJECT_TYPE');
INSERT INTO `r_trans_attribute` VALUES (3083, 4, 0, 'CHANNEL_LOG_TABLE_FIELD_NAME3', 0, 'LOGGING_OBJECT_TYPE');
INSERT INTO `r_trans_attribute` VALUES (3084, 4, 0, 'CHANNEL_LOG_TABLE_FIELD_ENABLED3', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (3085, 4, 0, 'CHANNEL_LOG_TABLE_FIELD_ID4', 0, 'OBJECT_NAME');
INSERT INTO `r_trans_attribute` VALUES (3086, 4, 0, 'CHANNEL_LOG_TABLE_FIELD_NAME4', 0, 'OBJECT_NAME');
INSERT INTO `r_trans_attribute` VALUES (3087, 4, 0, 'CHANNEL_LOG_TABLE_FIELD_ENABLED4', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (3088, 4, 0, 'CHANNEL_LOG_TABLE_FIELD_ID5', 0, 'OBJECT_COPY');
INSERT INTO `r_trans_attribute` VALUES (3089, 4, 0, 'CHANNEL_LOG_TABLE_FIELD_NAME5', 0, 'OBJECT_COPY');
INSERT INTO `r_trans_attribute` VALUES (3090, 4, 0, 'CHANNEL_LOG_TABLE_FIELD_ENABLED5', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (3091, 4, 0, 'CHANNEL_LOG_TABLE_FIELD_ID6', 0, 'REPOSITORY_DIRECTORY');
INSERT INTO `r_trans_attribute` VALUES (3092, 4, 0, 'CHANNEL_LOG_TABLE_FIELD_NAME6', 0, 'REPOSITORY_DIRECTORY');
INSERT INTO `r_trans_attribute` VALUES (3093, 4, 0, 'CHANNEL_LOG_TABLE_FIELD_ENABLED6', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (3094, 4, 0, 'CHANNEL_LOG_TABLE_FIELD_ID7', 0, 'FILENAME');
INSERT INTO `r_trans_attribute` VALUES (3095, 4, 0, 'CHANNEL_LOG_TABLE_FIELD_NAME7', 0, 'FILENAME');
INSERT INTO `r_trans_attribute` VALUES (3096, 4, 0, 'CHANNEL_LOG_TABLE_FIELD_ENABLED7', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (3097, 4, 0, 'CHANNEL_LOG_TABLE_FIELD_ID8', 0, 'OBJECT_ID');
INSERT INTO `r_trans_attribute` VALUES (3098, 4, 0, 'CHANNEL_LOG_TABLE_FIELD_NAME8', 0, 'OBJECT_ID');
INSERT INTO `r_trans_attribute` VALUES (3099, 4, 0, 'CHANNEL_LOG_TABLE_FIELD_ENABLED8', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (3100, 4, 0, 'CHANNEL_LOG_TABLE_FIELD_ID9', 0, 'OBJECT_REVISION');
INSERT INTO `r_trans_attribute` VALUES (3101, 4, 0, 'CHANNEL_LOG_TABLE_FIELD_NAME9', 0, 'OBJECT_REVISION');
INSERT INTO `r_trans_attribute` VALUES (3102, 4, 0, 'CHANNEL_LOG_TABLE_FIELD_ENABLED9', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (3103, 4, 0, 'CHANNEL_LOG_TABLE_FIELD_ID10', 0, 'PARENT_CHANNEL_ID');
INSERT INTO `r_trans_attribute` VALUES (3104, 4, 0, 'CHANNEL_LOG_TABLE_FIELD_NAME10', 0, 'PARENT_CHANNEL_ID');
INSERT INTO `r_trans_attribute` VALUES (3105, 4, 0, 'CHANNEL_LOG_TABLE_FIELD_ENABLED10', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (3106, 4, 0, 'CHANNEL_LOG_TABLE_FIELD_ID11', 0, 'ROOT_CHANNEL_ID');
INSERT INTO `r_trans_attribute` VALUES (3107, 4, 0, 'CHANNEL_LOG_TABLE_FIELD_NAME11', 0, 'ROOT_CHANNEL_ID');
INSERT INTO `r_trans_attribute` VALUES (3108, 4, 0, 'CHANNEL_LOG_TABLE_FIELD_ENABLED11', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (3553, 5, 0, 'UNIQUE_CONNECTIONS', 0, 'N');
INSERT INTO `r_trans_attribute` VALUES (3554, 5, 0, 'FEEDBACK_SHOWN', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (3555, 5, 0, 'FEEDBACK_SIZE', 50000, NULL);
INSERT INTO `r_trans_attribute` VALUES (3556, 5, 0, 'USING_THREAD_PRIORITIES', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (3557, 5, 0, 'SHARED_FILE', 0, NULL);
INSERT INTO `r_trans_attribute` VALUES (3558, 5, 0, 'CAPTURE_STEP_PERFORMANCE', 0, 'N');
INSERT INTO `r_trans_attribute` VALUES (3559, 5, 0, 'STEP_PERFORMANCE_CAPTURING_DELAY', 1000, NULL);
INSERT INTO `r_trans_attribute` VALUES (3560, 5, 0, 'STEP_PERFORMANCE_CAPTURING_SIZE_LIMIT', 0, '100');
INSERT INTO `r_trans_attribute` VALUES (3561, 5, 0, 'STEP_PERFORMANCE_LOG_TABLE', 0, NULL);
INSERT INTO `r_trans_attribute` VALUES (3562, 5, 0, 'LOG_SIZE_LIMIT', 0, NULL);
INSERT INTO `r_trans_attribute` VALUES (3563, 5, 0, 'LOG_INTERVAL', 0, NULL);
INSERT INTO `r_trans_attribute` VALUES (3564, 5, 0, 'TRANSFORMATION_TYPE', 0, 'Normal');
INSERT INTO `r_trans_attribute` VALUES (3565, 5, 0, 'SLEEP_TIME_EMPTY', 50, NULL);
INSERT INTO `r_trans_attribute` VALUES (3566, 5, 0, 'SLEEP_TIME_FULL', 50, NULL);
INSERT INTO `r_trans_attribute` VALUES (3567, 5, 0, 'TRANS_LOG_TABLE_CONNECTION_NAME', 0, NULL);
INSERT INTO `r_trans_attribute` VALUES (3568, 5, 0, 'TRANS_LOG_TABLE_SCHEMA_NAME', 0, NULL);
INSERT INTO `r_trans_attribute` VALUES (3569, 5, 0, 'TRANS_LOG_TABLE_TABLE_NAME', 0, NULL);
INSERT INTO `r_trans_attribute` VALUES (3570, 5, 0, 'TRANS_LOG_TABLE_TIMEOUT_IN_DAYS', 0, NULL);
INSERT INTO `r_trans_attribute` VALUES (3571, 5, 0, 'TRANS_LOG_TABLE_FIELD_ID0', 0, 'ID_BATCH');
INSERT INTO `r_trans_attribute` VALUES (3572, 5, 0, 'TRANS_LOG_TABLE_FIELD_NAME0', 0, 'ID_BATCH');
INSERT INTO `r_trans_attribute` VALUES (3573, 5, 0, 'TRANS_LOG_TABLE_FIELD_ENABLED0', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (3574, 5, 0, 'TRANS_LOG_TABLE_FIELD_ID1', 0, 'CHANNEL_ID');
INSERT INTO `r_trans_attribute` VALUES (3575, 5, 0, 'TRANS_LOG_TABLE_FIELD_NAME1', 0, 'CHANNEL_ID');
INSERT INTO `r_trans_attribute` VALUES (3576, 5, 0, 'TRANS_LOG_TABLE_FIELD_ENABLED1', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (3577, 5, 0, 'TRANS_LOG_TABLE_FIELD_ID2', 0, 'TRANSNAME');
INSERT INTO `r_trans_attribute` VALUES (3578, 5, 0, 'TRANS_LOG_TABLE_FIELD_NAME2', 0, 'TRANSNAME');
INSERT INTO `r_trans_attribute` VALUES (3579, 5, 0, 'TRANS_LOG_TABLE_FIELD_ENABLED2', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (3580, 5, 0, 'TRANS_LOG_TABLE_FIELD_ID3', 0, 'STATUS');
INSERT INTO `r_trans_attribute` VALUES (3581, 5, 0, 'TRANS_LOG_TABLE_FIELD_NAME3', 0, 'STATUS');
INSERT INTO `r_trans_attribute` VALUES (3582, 5, 0, 'TRANS_LOG_TABLE_FIELD_ENABLED3', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (3583, 5, 0, 'TRANS_LOG_TABLE_FIELD_ID4', 0, 'LINES_READ');
INSERT INTO `r_trans_attribute` VALUES (3584, 5, 0, 'TRANS_LOG_TABLE_FIELD_NAME4', 0, 'LINES_READ');
INSERT INTO `r_trans_attribute` VALUES (3585, 5, 0, 'TRANS_LOG_TABLE_FIELD_ENABLED4', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (3586, 5, 0, 'TRANS_LOG_TABLE_FIELD_SUBJECT4', 0, NULL);
INSERT INTO `r_trans_attribute` VALUES (3587, 5, 0, 'TRANS_LOG_TABLE_FIELD_ID5', 0, 'LINES_WRITTEN');
INSERT INTO `r_trans_attribute` VALUES (3588, 5, 0, 'TRANS_LOG_TABLE_FIELD_NAME5', 0, 'LINES_WRITTEN');
INSERT INTO `r_trans_attribute` VALUES (3589, 5, 0, 'TRANS_LOG_TABLE_FIELD_ENABLED5', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (3590, 5, 0, 'TRANS_LOG_TABLE_FIELD_SUBJECT5', 0, NULL);
INSERT INTO `r_trans_attribute` VALUES (3591, 5, 0, 'TRANS_LOG_TABLE_FIELD_ID6', 0, 'LINES_UPDATED');
INSERT INTO `r_trans_attribute` VALUES (3592, 5, 0, 'TRANS_LOG_TABLE_FIELD_NAME6', 0, 'LINES_UPDATED');
INSERT INTO `r_trans_attribute` VALUES (3593, 5, 0, 'TRANS_LOG_TABLE_FIELD_ENABLED6', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (3594, 5, 0, 'TRANS_LOG_TABLE_FIELD_SUBJECT6', 0, NULL);
INSERT INTO `r_trans_attribute` VALUES (3595, 5, 0, 'TRANS_LOG_TABLE_FIELD_ID7', 0, 'LINES_INPUT');
INSERT INTO `r_trans_attribute` VALUES (3596, 5, 0, 'TRANS_LOG_TABLE_FIELD_NAME7', 0, 'LINES_INPUT');
INSERT INTO `r_trans_attribute` VALUES (3597, 5, 0, 'TRANS_LOG_TABLE_FIELD_ENABLED7', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (3598, 5, 0, 'TRANS_LOG_TABLE_FIELD_SUBJECT7', 0, NULL);
INSERT INTO `r_trans_attribute` VALUES (3599, 5, 0, 'TRANS_LOG_TABLE_FIELD_ID8', 0, 'LINES_OUTPUT');
INSERT INTO `r_trans_attribute` VALUES (3600, 5, 0, 'TRANS_LOG_TABLE_FIELD_NAME8', 0, 'LINES_OUTPUT');
INSERT INTO `r_trans_attribute` VALUES (3601, 5, 0, 'TRANS_LOG_TABLE_FIELD_ENABLED8', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (3602, 5, 0, 'TRANS_LOG_TABLE_FIELD_SUBJECT8', 0, NULL);
INSERT INTO `r_trans_attribute` VALUES (3603, 5, 0, 'TRANS_LOG_TABLE_FIELD_ID9', 0, 'LINES_REJECTED');
INSERT INTO `r_trans_attribute` VALUES (3604, 5, 0, 'TRANS_LOG_TABLE_FIELD_NAME9', 0, 'LINES_REJECTED');
INSERT INTO `r_trans_attribute` VALUES (3605, 5, 0, 'TRANS_LOG_TABLE_FIELD_ENABLED9', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (3606, 5, 0, 'TRANS_LOG_TABLE_FIELD_SUBJECT9', 0, NULL);
INSERT INTO `r_trans_attribute` VALUES (3607, 5, 0, 'TRANS_LOG_TABLE_FIELD_ID10', 0, 'ERRORS');
INSERT INTO `r_trans_attribute` VALUES (3608, 5, 0, 'TRANS_LOG_TABLE_FIELD_NAME10', 0, 'ERRORS');
INSERT INTO `r_trans_attribute` VALUES (3609, 5, 0, 'TRANS_LOG_TABLE_FIELD_ENABLED10', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (3610, 5, 0, 'TRANS_LOG_TABLE_FIELD_ID11', 0, 'STARTDATE');
INSERT INTO `r_trans_attribute` VALUES (3611, 5, 0, 'TRANS_LOG_TABLE_FIELD_NAME11', 0, 'STARTDATE');
INSERT INTO `r_trans_attribute` VALUES (3612, 5, 0, 'TRANS_LOG_TABLE_FIELD_ENABLED11', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (3613, 5, 0, 'TRANS_LOG_TABLE_FIELD_ID12', 0, 'ENDDATE');
INSERT INTO `r_trans_attribute` VALUES (3614, 5, 0, 'TRANS_LOG_TABLE_FIELD_NAME12', 0, 'ENDDATE');
INSERT INTO `r_trans_attribute` VALUES (3615, 5, 0, 'TRANS_LOG_TABLE_FIELD_ENABLED12', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (3616, 5, 0, 'TRANS_LOG_TABLE_FIELD_ID13', 0, 'LOGDATE');
INSERT INTO `r_trans_attribute` VALUES (3617, 5, 0, 'TRANS_LOG_TABLE_FIELD_NAME13', 0, 'LOGDATE');
INSERT INTO `r_trans_attribute` VALUES (3618, 5, 0, 'TRANS_LOG_TABLE_FIELD_ENABLED13', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (3619, 5, 0, 'TRANS_LOG_TABLE_FIELD_ID14', 0, 'DEPDATE');
INSERT INTO `r_trans_attribute` VALUES (3620, 5, 0, 'TRANS_LOG_TABLE_FIELD_NAME14', 0, 'DEPDATE');
INSERT INTO `r_trans_attribute` VALUES (3621, 5, 0, 'TRANS_LOG_TABLE_FIELD_ENABLED14', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (3622, 5, 0, 'TRANS_LOG_TABLE_FIELD_ID15', 0, 'REPLAYDATE');
INSERT INTO `r_trans_attribute` VALUES (3623, 5, 0, 'TRANS_LOG_TABLE_FIELD_NAME15', 0, 'REPLAYDATE');
INSERT INTO `r_trans_attribute` VALUES (3624, 5, 0, 'TRANS_LOG_TABLE_FIELD_ENABLED15', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (3625, 5, 0, 'TRANS_LOG_TABLE_FIELD_ID16', 0, 'LOG_FIELD');
INSERT INTO `r_trans_attribute` VALUES (3626, 5, 0, 'TRANS_LOG_TABLE_FIELD_NAME16', 0, 'LOG_FIELD');
INSERT INTO `r_trans_attribute` VALUES (3627, 5, 0, 'TRANS_LOG_TABLE_FIELD_ENABLED16', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (3628, 5, 0, 'TRANS_LOG_TABLE_FIELD_ID17', 0, 'EXECUTING_SERVER');
INSERT INTO `r_trans_attribute` VALUES (3629, 5, 0, 'TRANS_LOG_TABLE_FIELD_NAME17', 0, 'EXECUTING_SERVER');
INSERT INTO `r_trans_attribute` VALUES (3630, 5, 0, 'TRANS_LOG_TABLE_FIELD_ENABLED17', 0, 'N');
INSERT INTO `r_trans_attribute` VALUES (3631, 5, 0, 'TRANS_LOG_TABLE_FIELD_ID18', 0, 'EXECUTING_USER');
INSERT INTO `r_trans_attribute` VALUES (3632, 5, 0, 'TRANS_LOG_TABLE_FIELD_NAME18', 0, 'EXECUTING_USER');
INSERT INTO `r_trans_attribute` VALUES (3633, 5, 0, 'TRANS_LOG_TABLE_FIELD_ENABLED18', 0, 'N');
INSERT INTO `r_trans_attribute` VALUES (3634, 5, 0, 'TRANS_LOG_TABLE_FIELD_ID19', 0, 'CLIENT');
INSERT INTO `r_trans_attribute` VALUES (3635, 5, 0, 'TRANS_LOG_TABLE_FIELD_NAME19', 0, 'CLIENT');
INSERT INTO `r_trans_attribute` VALUES (3636, 5, 0, 'TRANS_LOG_TABLE_FIELD_ENABLED19', 0, 'N');
INSERT INTO `r_trans_attribute` VALUES (3637, 5, 0, 'TRANSLOG_TABLE_INTERVAL', 0, NULL);
INSERT INTO `r_trans_attribute` VALUES (3638, 5, 0, 'TRANSLOG_TABLE_SIZE_LIMIT', 0, NULL);
INSERT INTO `r_trans_attribute` VALUES (3639, 5, 0, 'STEP_LOG_TABLE_CONNECTION_NAME', 0, NULL);
INSERT INTO `r_trans_attribute` VALUES (3640, 5, 0, 'STEP_LOG_TABLE_SCHEMA_NAME', 0, NULL);
INSERT INTO `r_trans_attribute` VALUES (3641, 5, 0, 'STEP_LOG_TABLE_TABLE_NAME', 0, NULL);
INSERT INTO `r_trans_attribute` VALUES (3642, 5, 0, 'STEP_LOG_TABLE_TIMEOUT_IN_DAYS', 0, NULL);
INSERT INTO `r_trans_attribute` VALUES (3643, 5, 0, 'STEP_LOG_TABLE_FIELD_ID0', 0, 'ID_BATCH');
INSERT INTO `r_trans_attribute` VALUES (3644, 5, 0, 'STEP_LOG_TABLE_FIELD_NAME0', 0, 'ID_BATCH');
INSERT INTO `r_trans_attribute` VALUES (3645, 5, 0, 'STEP_LOG_TABLE_FIELD_ENABLED0', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (3646, 5, 0, 'STEP_LOG_TABLE_FIELD_ID1', 0, 'CHANNEL_ID');
INSERT INTO `r_trans_attribute` VALUES (3647, 5, 0, 'STEP_LOG_TABLE_FIELD_NAME1', 0, 'CHANNEL_ID');
INSERT INTO `r_trans_attribute` VALUES (3648, 5, 0, 'STEP_LOG_TABLE_FIELD_ENABLED1', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (3649, 5, 0, 'STEP_LOG_TABLE_FIELD_ID2', 0, 'LOG_DATE');
INSERT INTO `r_trans_attribute` VALUES (3650, 5, 0, 'STEP_LOG_TABLE_FIELD_NAME2', 0, 'LOG_DATE');
INSERT INTO `r_trans_attribute` VALUES (3651, 5, 0, 'STEP_LOG_TABLE_FIELD_ENABLED2', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (3652, 5, 0, 'STEP_LOG_TABLE_FIELD_ID3', 0, 'TRANSNAME');
INSERT INTO `r_trans_attribute` VALUES (3653, 5, 0, 'STEP_LOG_TABLE_FIELD_NAME3', 0, 'TRANSNAME');
INSERT INTO `r_trans_attribute` VALUES (3654, 5, 0, 'STEP_LOG_TABLE_FIELD_ENABLED3', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (3655, 5, 0, 'STEP_LOG_TABLE_FIELD_ID4', 0, 'STEPNAME');
INSERT INTO `r_trans_attribute` VALUES (3656, 5, 0, 'STEP_LOG_TABLE_FIELD_NAME4', 0, 'STEPNAME');
INSERT INTO `r_trans_attribute` VALUES (3657, 5, 0, 'STEP_LOG_TABLE_FIELD_ENABLED4', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (3658, 5, 0, 'STEP_LOG_TABLE_FIELD_ID5', 0, 'STEP_COPY');
INSERT INTO `r_trans_attribute` VALUES (3659, 5, 0, 'STEP_LOG_TABLE_FIELD_NAME5', 0, 'STEP_COPY');
INSERT INTO `r_trans_attribute` VALUES (3660, 5, 0, 'STEP_LOG_TABLE_FIELD_ENABLED5', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (3661, 5, 0, 'STEP_LOG_TABLE_FIELD_ID6', 0, 'LINES_READ');
INSERT INTO `r_trans_attribute` VALUES (3662, 5, 0, 'STEP_LOG_TABLE_FIELD_NAME6', 0, 'LINES_READ');
INSERT INTO `r_trans_attribute` VALUES (3663, 5, 0, 'STEP_LOG_TABLE_FIELD_ENABLED6', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (3664, 5, 0, 'STEP_LOG_TABLE_FIELD_ID7', 0, 'LINES_WRITTEN');
INSERT INTO `r_trans_attribute` VALUES (3665, 5, 0, 'STEP_LOG_TABLE_FIELD_NAME7', 0, 'LINES_WRITTEN');
INSERT INTO `r_trans_attribute` VALUES (3666, 5, 0, 'STEP_LOG_TABLE_FIELD_ENABLED7', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (3667, 5, 0, 'STEP_LOG_TABLE_FIELD_ID8', 0, 'LINES_UPDATED');
INSERT INTO `r_trans_attribute` VALUES (3668, 5, 0, 'STEP_LOG_TABLE_FIELD_NAME8', 0, 'LINES_UPDATED');
INSERT INTO `r_trans_attribute` VALUES (3669, 5, 0, 'STEP_LOG_TABLE_FIELD_ENABLED8', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (3670, 5, 0, 'STEP_LOG_TABLE_FIELD_ID9', 0, 'LINES_INPUT');
INSERT INTO `r_trans_attribute` VALUES (3671, 5, 0, 'STEP_LOG_TABLE_FIELD_NAME9', 0, 'LINES_INPUT');
INSERT INTO `r_trans_attribute` VALUES (3672, 5, 0, 'STEP_LOG_TABLE_FIELD_ENABLED9', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (3673, 5, 0, 'STEP_LOG_TABLE_FIELD_ID10', 0, 'LINES_OUTPUT');
INSERT INTO `r_trans_attribute` VALUES (3674, 5, 0, 'STEP_LOG_TABLE_FIELD_NAME10', 0, 'LINES_OUTPUT');
INSERT INTO `r_trans_attribute` VALUES (3675, 5, 0, 'STEP_LOG_TABLE_FIELD_ENABLED10', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (3676, 5, 0, 'STEP_LOG_TABLE_FIELD_ID11', 0, 'LINES_REJECTED');
INSERT INTO `r_trans_attribute` VALUES (3677, 5, 0, 'STEP_LOG_TABLE_FIELD_NAME11', 0, 'LINES_REJECTED');
INSERT INTO `r_trans_attribute` VALUES (3678, 5, 0, 'STEP_LOG_TABLE_FIELD_ENABLED11', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (3679, 5, 0, 'STEP_LOG_TABLE_FIELD_ID12', 0, 'ERRORS');
INSERT INTO `r_trans_attribute` VALUES (3680, 5, 0, 'STEP_LOG_TABLE_FIELD_NAME12', 0, 'ERRORS');
INSERT INTO `r_trans_attribute` VALUES (3681, 5, 0, 'STEP_LOG_TABLE_FIELD_ENABLED12', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (3682, 5, 0, 'STEP_LOG_TABLE_FIELD_ID13', 0, 'LOG_FIELD');
INSERT INTO `r_trans_attribute` VALUES (3683, 5, 0, 'STEP_LOG_TABLE_FIELD_NAME13', 0, 'LOG_FIELD');
INSERT INTO `r_trans_attribute` VALUES (3684, 5, 0, 'STEP_LOG_TABLE_FIELD_ENABLED13', 0, 'N');
INSERT INTO `r_trans_attribute` VALUES (3685, 5, 0, 'PERFORMANCE_LOG_TABLE_CONNECTION_NAME', 0, NULL);
INSERT INTO `r_trans_attribute` VALUES (3686, 5, 0, 'PERFORMANCE_LOG_TABLE_SCHEMA_NAME', 0, NULL);
INSERT INTO `r_trans_attribute` VALUES (3687, 5, 0, 'PERFORMANCE_LOG_TABLE_TABLE_NAME', 0, NULL);
INSERT INTO `r_trans_attribute` VALUES (3688, 5, 0, 'PERFORMANCE_LOG_TABLE_TIMEOUT_IN_DAYS', 0, NULL);
INSERT INTO `r_trans_attribute` VALUES (3689, 5, 0, 'PERFORMANCE_LOG_TABLE_FIELD_ID0', 0, 'ID_BATCH');
INSERT INTO `r_trans_attribute` VALUES (3690, 5, 0, 'PERFORMANCE_LOG_TABLE_FIELD_NAME0', 0, 'ID_BATCH');
INSERT INTO `r_trans_attribute` VALUES (3691, 5, 0, 'PERFORMANCE_LOG_TABLE_FIELD_ENABLED0', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (3692, 5, 0, 'PERFORMANCE_LOG_TABLE_FIELD_ID1', 0, 'SEQ_NR');
INSERT INTO `r_trans_attribute` VALUES (3693, 5, 0, 'PERFORMANCE_LOG_TABLE_FIELD_NAME1', 0, 'SEQ_NR');
INSERT INTO `r_trans_attribute` VALUES (3694, 5, 0, 'PERFORMANCE_LOG_TABLE_FIELD_ENABLED1', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (3695, 5, 0, 'PERFORMANCE_LOG_TABLE_FIELD_ID2', 0, 'LOGDATE');
INSERT INTO `r_trans_attribute` VALUES (3696, 5, 0, 'PERFORMANCE_LOG_TABLE_FIELD_NAME2', 0, 'LOGDATE');
INSERT INTO `r_trans_attribute` VALUES (3697, 5, 0, 'PERFORMANCE_LOG_TABLE_FIELD_ENABLED2', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (3698, 5, 0, 'PERFORMANCE_LOG_TABLE_FIELD_ID3', 0, 'TRANSNAME');
INSERT INTO `r_trans_attribute` VALUES (3699, 5, 0, 'PERFORMANCE_LOG_TABLE_FIELD_NAME3', 0, 'TRANSNAME');
INSERT INTO `r_trans_attribute` VALUES (3700, 5, 0, 'PERFORMANCE_LOG_TABLE_FIELD_ENABLED3', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (3701, 5, 0, 'PERFORMANCE_LOG_TABLE_FIELD_ID4', 0, 'STEPNAME');
INSERT INTO `r_trans_attribute` VALUES (3702, 5, 0, 'PERFORMANCE_LOG_TABLE_FIELD_NAME4', 0, 'STEPNAME');
INSERT INTO `r_trans_attribute` VALUES (3703, 5, 0, 'PERFORMANCE_LOG_TABLE_FIELD_ENABLED4', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (3704, 5, 0, 'PERFORMANCE_LOG_TABLE_FIELD_ID5', 0, 'STEP_COPY');
INSERT INTO `r_trans_attribute` VALUES (3705, 5, 0, 'PERFORMANCE_LOG_TABLE_FIELD_NAME5', 0, 'STEP_COPY');
INSERT INTO `r_trans_attribute` VALUES (3706, 5, 0, 'PERFORMANCE_LOG_TABLE_FIELD_ENABLED5', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (3707, 5, 0, 'PERFORMANCE_LOG_TABLE_FIELD_ID6', 0, 'LINES_READ');
INSERT INTO `r_trans_attribute` VALUES (3708, 5, 0, 'PERFORMANCE_LOG_TABLE_FIELD_NAME6', 0, 'LINES_READ');
INSERT INTO `r_trans_attribute` VALUES (3709, 5, 0, 'PERFORMANCE_LOG_TABLE_FIELD_ENABLED6', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (3710, 5, 0, 'PERFORMANCE_LOG_TABLE_FIELD_ID7', 0, 'LINES_WRITTEN');
INSERT INTO `r_trans_attribute` VALUES (3711, 5, 0, 'PERFORMANCE_LOG_TABLE_FIELD_NAME7', 0, 'LINES_WRITTEN');
INSERT INTO `r_trans_attribute` VALUES (3712, 5, 0, 'PERFORMANCE_LOG_TABLE_FIELD_ENABLED7', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (3713, 5, 0, 'PERFORMANCE_LOG_TABLE_FIELD_ID8', 0, 'LINES_UPDATED');
INSERT INTO `r_trans_attribute` VALUES (3714, 5, 0, 'PERFORMANCE_LOG_TABLE_FIELD_NAME8', 0, 'LINES_UPDATED');
INSERT INTO `r_trans_attribute` VALUES (3715, 5, 0, 'PERFORMANCE_LOG_TABLE_FIELD_ENABLED8', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (3716, 5, 0, 'PERFORMANCE_LOG_TABLE_FIELD_ID9', 0, 'LINES_INPUT');
INSERT INTO `r_trans_attribute` VALUES (3717, 5, 0, 'PERFORMANCE_LOG_TABLE_FIELD_NAME9', 0, 'LINES_INPUT');
INSERT INTO `r_trans_attribute` VALUES (3718, 5, 0, 'PERFORMANCE_LOG_TABLE_FIELD_ENABLED9', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (3719, 5, 0, 'PERFORMANCE_LOG_TABLE_FIELD_ID10', 0, 'LINES_OUTPUT');
INSERT INTO `r_trans_attribute` VALUES (3720, 5, 0, 'PERFORMANCE_LOG_TABLE_FIELD_NAME10', 0, 'LINES_OUTPUT');
INSERT INTO `r_trans_attribute` VALUES (3721, 5, 0, 'PERFORMANCE_LOG_TABLE_FIELD_ENABLED10', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (3722, 5, 0, 'PERFORMANCE_LOG_TABLE_FIELD_ID11', 0, 'LINES_REJECTED');
INSERT INTO `r_trans_attribute` VALUES (3723, 5, 0, 'PERFORMANCE_LOG_TABLE_FIELD_NAME11', 0, 'LINES_REJECTED');
INSERT INTO `r_trans_attribute` VALUES (3724, 5, 0, 'PERFORMANCE_LOG_TABLE_FIELD_ENABLED11', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (3725, 5, 0, 'PERFORMANCE_LOG_TABLE_FIELD_ID12', 0, 'ERRORS');
INSERT INTO `r_trans_attribute` VALUES (3726, 5, 0, 'PERFORMANCE_LOG_TABLE_FIELD_NAME12', 0, 'ERRORS');
INSERT INTO `r_trans_attribute` VALUES (3727, 5, 0, 'PERFORMANCE_LOG_TABLE_FIELD_ENABLED12', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (3728, 5, 0, 'PERFORMANCE_LOG_TABLE_FIELD_ID13', 0, 'INPUT_BUFFER_ROWS');
INSERT INTO `r_trans_attribute` VALUES (3729, 5, 0, 'PERFORMANCE_LOG_TABLE_FIELD_NAME13', 0, 'INPUT_BUFFER_ROWS');
INSERT INTO `r_trans_attribute` VALUES (3730, 5, 0, 'PERFORMANCE_LOG_TABLE_FIELD_ENABLED13', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (3731, 5, 0, 'PERFORMANCE_LOG_TABLE_FIELD_ID14', 0, 'OUTPUT_BUFFER_ROWS');
INSERT INTO `r_trans_attribute` VALUES (3732, 5, 0, 'PERFORMANCE_LOG_TABLE_FIELD_NAME14', 0, 'OUTPUT_BUFFER_ROWS');
INSERT INTO `r_trans_attribute` VALUES (3733, 5, 0, 'PERFORMANCE_LOG_TABLE_FIELD_ENABLED14', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (3734, 5, 0, 'PERFORMANCELOG_TABLE_INTERVAL', 0, NULL);
INSERT INTO `r_trans_attribute` VALUES (3735, 5, 0, 'CHANNEL_LOG_TABLE_CONNECTION_NAME', 0, NULL);
INSERT INTO `r_trans_attribute` VALUES (3736, 5, 0, 'CHANNEL_LOG_TABLE_SCHEMA_NAME', 0, NULL);
INSERT INTO `r_trans_attribute` VALUES (3737, 5, 0, 'CHANNEL_LOG_TABLE_TABLE_NAME', 0, NULL);
INSERT INTO `r_trans_attribute` VALUES (3738, 5, 0, 'CHANNEL_LOG_TABLE_TIMEOUT_IN_DAYS', 0, NULL);
INSERT INTO `r_trans_attribute` VALUES (3739, 5, 0, 'CHANNEL_LOG_TABLE_FIELD_ID0', 0, 'ID_BATCH');
INSERT INTO `r_trans_attribute` VALUES (3740, 5, 0, 'CHANNEL_LOG_TABLE_FIELD_NAME0', 0, 'ID_BATCH');
INSERT INTO `r_trans_attribute` VALUES (3741, 5, 0, 'CHANNEL_LOG_TABLE_FIELD_ENABLED0', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (3742, 5, 0, 'CHANNEL_LOG_TABLE_FIELD_ID1', 0, 'CHANNEL_ID');
INSERT INTO `r_trans_attribute` VALUES (3743, 5, 0, 'CHANNEL_LOG_TABLE_FIELD_NAME1', 0, 'CHANNEL_ID');
INSERT INTO `r_trans_attribute` VALUES (3744, 5, 0, 'CHANNEL_LOG_TABLE_FIELD_ENABLED1', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (3745, 5, 0, 'CHANNEL_LOG_TABLE_FIELD_ID2', 0, 'LOG_DATE');
INSERT INTO `r_trans_attribute` VALUES (3746, 5, 0, 'CHANNEL_LOG_TABLE_FIELD_NAME2', 0, 'LOG_DATE');
INSERT INTO `r_trans_attribute` VALUES (3747, 5, 0, 'CHANNEL_LOG_TABLE_FIELD_ENABLED2', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (3748, 5, 0, 'CHANNEL_LOG_TABLE_FIELD_ID3', 0, 'LOGGING_OBJECT_TYPE');
INSERT INTO `r_trans_attribute` VALUES (3749, 5, 0, 'CHANNEL_LOG_TABLE_FIELD_NAME3', 0, 'LOGGING_OBJECT_TYPE');
INSERT INTO `r_trans_attribute` VALUES (3750, 5, 0, 'CHANNEL_LOG_TABLE_FIELD_ENABLED3', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (3751, 5, 0, 'CHANNEL_LOG_TABLE_FIELD_ID4', 0, 'OBJECT_NAME');
INSERT INTO `r_trans_attribute` VALUES (3752, 5, 0, 'CHANNEL_LOG_TABLE_FIELD_NAME4', 0, 'OBJECT_NAME');
INSERT INTO `r_trans_attribute` VALUES (3753, 5, 0, 'CHANNEL_LOG_TABLE_FIELD_ENABLED4', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (3754, 5, 0, 'CHANNEL_LOG_TABLE_FIELD_ID5', 0, 'OBJECT_COPY');
INSERT INTO `r_trans_attribute` VALUES (3755, 5, 0, 'CHANNEL_LOG_TABLE_FIELD_NAME5', 0, 'OBJECT_COPY');
INSERT INTO `r_trans_attribute` VALUES (3756, 5, 0, 'CHANNEL_LOG_TABLE_FIELD_ENABLED5', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (3757, 5, 0, 'CHANNEL_LOG_TABLE_FIELD_ID6', 0, 'REPOSITORY_DIRECTORY');
INSERT INTO `r_trans_attribute` VALUES (3758, 5, 0, 'CHANNEL_LOG_TABLE_FIELD_NAME6', 0, 'REPOSITORY_DIRECTORY');
INSERT INTO `r_trans_attribute` VALUES (3759, 5, 0, 'CHANNEL_LOG_TABLE_FIELD_ENABLED6', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (3760, 5, 0, 'CHANNEL_LOG_TABLE_FIELD_ID7', 0, 'FILENAME');
INSERT INTO `r_trans_attribute` VALUES (3761, 5, 0, 'CHANNEL_LOG_TABLE_FIELD_NAME7', 0, 'FILENAME');
INSERT INTO `r_trans_attribute` VALUES (3762, 5, 0, 'CHANNEL_LOG_TABLE_FIELD_ENABLED7', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (3763, 5, 0, 'CHANNEL_LOG_TABLE_FIELD_ID8', 0, 'OBJECT_ID');
INSERT INTO `r_trans_attribute` VALUES (3764, 5, 0, 'CHANNEL_LOG_TABLE_FIELD_NAME8', 0, 'OBJECT_ID');
INSERT INTO `r_trans_attribute` VALUES (3765, 5, 0, 'CHANNEL_LOG_TABLE_FIELD_ENABLED8', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (3766, 5, 0, 'CHANNEL_LOG_TABLE_FIELD_ID9', 0, 'OBJECT_REVISION');
INSERT INTO `r_trans_attribute` VALUES (3767, 5, 0, 'CHANNEL_LOG_TABLE_FIELD_NAME9', 0, 'OBJECT_REVISION');
INSERT INTO `r_trans_attribute` VALUES (3768, 5, 0, 'CHANNEL_LOG_TABLE_FIELD_ENABLED9', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (3769, 5, 0, 'CHANNEL_LOG_TABLE_FIELD_ID10', 0, 'PARENT_CHANNEL_ID');
INSERT INTO `r_trans_attribute` VALUES (3770, 5, 0, 'CHANNEL_LOG_TABLE_FIELD_NAME10', 0, 'PARENT_CHANNEL_ID');
INSERT INTO `r_trans_attribute` VALUES (3771, 5, 0, 'CHANNEL_LOG_TABLE_FIELD_ENABLED10', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (3772, 5, 0, 'CHANNEL_LOG_TABLE_FIELD_ID11', 0, 'ROOT_CHANNEL_ID');
INSERT INTO `r_trans_attribute` VALUES (3773, 5, 0, 'CHANNEL_LOG_TABLE_FIELD_NAME11', 0, 'ROOT_CHANNEL_ID');
INSERT INTO `r_trans_attribute` VALUES (3774, 5, 0, 'CHANNEL_LOG_TABLE_FIELD_ENABLED11', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (3997, 2, 0, 'UNIQUE_CONNECTIONS', 0, 'N');
INSERT INTO `r_trans_attribute` VALUES (3998, 2, 0, 'FEEDBACK_SHOWN', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (3999, 2, 0, 'FEEDBACK_SIZE', 50000, NULL);
INSERT INTO `r_trans_attribute` VALUES (4000, 2, 0, 'USING_THREAD_PRIORITIES', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (4001, 2, 0, 'SHARED_FILE', 0, NULL);
INSERT INTO `r_trans_attribute` VALUES (4002, 2, 0, 'CAPTURE_STEP_PERFORMANCE', 0, 'N');
INSERT INTO `r_trans_attribute` VALUES (4003, 2, 0, 'STEP_PERFORMANCE_CAPTURING_DELAY', 1000, NULL);
INSERT INTO `r_trans_attribute` VALUES (4004, 2, 0, 'STEP_PERFORMANCE_CAPTURING_SIZE_LIMIT', 0, '100');
INSERT INTO `r_trans_attribute` VALUES (4005, 2, 0, 'STEP_PERFORMANCE_LOG_TABLE', 0, NULL);
INSERT INTO `r_trans_attribute` VALUES (4006, 2, 0, 'LOG_SIZE_LIMIT', 0, NULL);
INSERT INTO `r_trans_attribute` VALUES (4007, 2, 0, 'LOG_INTERVAL', 0, NULL);
INSERT INTO `r_trans_attribute` VALUES (4008, 2, 0, 'TRANSFORMATION_TYPE', 0, 'Normal');
INSERT INTO `r_trans_attribute` VALUES (4009, 2, 0, 'SLEEP_TIME_EMPTY', 50, NULL);
INSERT INTO `r_trans_attribute` VALUES (4010, 2, 0, 'SLEEP_TIME_FULL', 50, NULL);
INSERT INTO `r_trans_attribute` VALUES (4011, 2, 0, 'TRANS_LOG_TABLE_CONNECTION_NAME', 0, NULL);
INSERT INTO `r_trans_attribute` VALUES (4012, 2, 0, 'TRANS_LOG_TABLE_SCHEMA_NAME', 0, NULL);
INSERT INTO `r_trans_attribute` VALUES (4013, 2, 0, 'TRANS_LOG_TABLE_TABLE_NAME', 0, NULL);
INSERT INTO `r_trans_attribute` VALUES (4014, 2, 0, 'TRANS_LOG_TABLE_TIMEOUT_IN_DAYS', 0, NULL);
INSERT INTO `r_trans_attribute` VALUES (4015, 2, 0, 'TRANS_LOG_TABLE_FIELD_ID0', 0, 'ID_BATCH');
INSERT INTO `r_trans_attribute` VALUES (4016, 2, 0, 'TRANS_LOG_TABLE_FIELD_NAME0', 0, 'ID_BATCH');
INSERT INTO `r_trans_attribute` VALUES (4017, 2, 0, 'TRANS_LOG_TABLE_FIELD_ENABLED0', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (4018, 2, 0, 'TRANS_LOG_TABLE_FIELD_ID1', 0, 'CHANNEL_ID');
INSERT INTO `r_trans_attribute` VALUES (4019, 2, 0, 'TRANS_LOG_TABLE_FIELD_NAME1', 0, 'CHANNEL_ID');
INSERT INTO `r_trans_attribute` VALUES (4020, 2, 0, 'TRANS_LOG_TABLE_FIELD_ENABLED1', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (4021, 2, 0, 'TRANS_LOG_TABLE_FIELD_ID2', 0, 'TRANSNAME');
INSERT INTO `r_trans_attribute` VALUES (4022, 2, 0, 'TRANS_LOG_TABLE_FIELD_NAME2', 0, 'TRANSNAME');
INSERT INTO `r_trans_attribute` VALUES (4023, 2, 0, 'TRANS_LOG_TABLE_FIELD_ENABLED2', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (4024, 2, 0, 'TRANS_LOG_TABLE_FIELD_ID3', 0, 'STATUS');
INSERT INTO `r_trans_attribute` VALUES (4025, 2, 0, 'TRANS_LOG_TABLE_FIELD_NAME3', 0, 'STATUS');
INSERT INTO `r_trans_attribute` VALUES (4026, 2, 0, 'TRANS_LOG_TABLE_FIELD_ENABLED3', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (4027, 2, 0, 'TRANS_LOG_TABLE_FIELD_ID4', 0, 'LINES_READ');
INSERT INTO `r_trans_attribute` VALUES (4028, 2, 0, 'TRANS_LOG_TABLE_FIELD_NAME4', 0, 'LINES_READ');
INSERT INTO `r_trans_attribute` VALUES (4029, 2, 0, 'TRANS_LOG_TABLE_FIELD_ENABLED4', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (4030, 2, 0, 'TRANS_LOG_TABLE_FIELD_SUBJECT4', 0, NULL);
INSERT INTO `r_trans_attribute` VALUES (4031, 2, 0, 'TRANS_LOG_TABLE_FIELD_ID5', 0, 'LINES_WRITTEN');
INSERT INTO `r_trans_attribute` VALUES (4032, 2, 0, 'TRANS_LOG_TABLE_FIELD_NAME5', 0, 'LINES_WRITTEN');
INSERT INTO `r_trans_attribute` VALUES (4033, 2, 0, 'TRANS_LOG_TABLE_FIELD_ENABLED5', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (4034, 2, 0, 'TRANS_LOG_TABLE_FIELD_SUBJECT5', 0, NULL);
INSERT INTO `r_trans_attribute` VALUES (4035, 2, 0, 'TRANS_LOG_TABLE_FIELD_ID6', 0, 'LINES_UPDATED');
INSERT INTO `r_trans_attribute` VALUES (4036, 2, 0, 'TRANS_LOG_TABLE_FIELD_NAME6', 0, 'LINES_UPDATED');
INSERT INTO `r_trans_attribute` VALUES (4037, 2, 0, 'TRANS_LOG_TABLE_FIELD_ENABLED6', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (4038, 2, 0, 'TRANS_LOG_TABLE_FIELD_SUBJECT6', 0, NULL);
INSERT INTO `r_trans_attribute` VALUES (4039, 2, 0, 'TRANS_LOG_TABLE_FIELD_ID7', 0, 'LINES_INPUT');
INSERT INTO `r_trans_attribute` VALUES (4040, 2, 0, 'TRANS_LOG_TABLE_FIELD_NAME7', 0, 'LINES_INPUT');
INSERT INTO `r_trans_attribute` VALUES (4041, 2, 0, 'TRANS_LOG_TABLE_FIELD_ENABLED7', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (4042, 2, 0, 'TRANS_LOG_TABLE_FIELD_SUBJECT7', 0, NULL);
INSERT INTO `r_trans_attribute` VALUES (4043, 2, 0, 'TRANS_LOG_TABLE_FIELD_ID8', 0, 'LINES_OUTPUT');
INSERT INTO `r_trans_attribute` VALUES (4044, 2, 0, 'TRANS_LOG_TABLE_FIELD_NAME8', 0, 'LINES_OUTPUT');
INSERT INTO `r_trans_attribute` VALUES (4045, 2, 0, 'TRANS_LOG_TABLE_FIELD_ENABLED8', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (4046, 2, 0, 'TRANS_LOG_TABLE_FIELD_SUBJECT8', 0, NULL);
INSERT INTO `r_trans_attribute` VALUES (4047, 2, 0, 'TRANS_LOG_TABLE_FIELD_ID9', 0, 'LINES_REJECTED');
INSERT INTO `r_trans_attribute` VALUES (4048, 2, 0, 'TRANS_LOG_TABLE_FIELD_NAME9', 0, 'LINES_REJECTED');
INSERT INTO `r_trans_attribute` VALUES (4049, 2, 0, 'TRANS_LOG_TABLE_FIELD_ENABLED9', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (4050, 2, 0, 'TRANS_LOG_TABLE_FIELD_SUBJECT9', 0, NULL);
INSERT INTO `r_trans_attribute` VALUES (4051, 2, 0, 'TRANS_LOG_TABLE_FIELD_ID10', 0, 'ERRORS');
INSERT INTO `r_trans_attribute` VALUES (4052, 2, 0, 'TRANS_LOG_TABLE_FIELD_NAME10', 0, 'ERRORS');
INSERT INTO `r_trans_attribute` VALUES (4053, 2, 0, 'TRANS_LOG_TABLE_FIELD_ENABLED10', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (4054, 2, 0, 'TRANS_LOG_TABLE_FIELD_ID11', 0, 'STARTDATE');
INSERT INTO `r_trans_attribute` VALUES (4055, 2, 0, 'TRANS_LOG_TABLE_FIELD_NAME11', 0, 'STARTDATE');
INSERT INTO `r_trans_attribute` VALUES (4056, 2, 0, 'TRANS_LOG_TABLE_FIELD_ENABLED11', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (4057, 2, 0, 'TRANS_LOG_TABLE_FIELD_ID12', 0, 'ENDDATE');
INSERT INTO `r_trans_attribute` VALUES (4058, 2, 0, 'TRANS_LOG_TABLE_FIELD_NAME12', 0, 'ENDDATE');
INSERT INTO `r_trans_attribute` VALUES (4059, 2, 0, 'TRANS_LOG_TABLE_FIELD_ENABLED12', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (4060, 2, 0, 'TRANS_LOG_TABLE_FIELD_ID13', 0, 'LOGDATE');
INSERT INTO `r_trans_attribute` VALUES (4061, 2, 0, 'TRANS_LOG_TABLE_FIELD_NAME13', 0, 'LOGDATE');
INSERT INTO `r_trans_attribute` VALUES (4062, 2, 0, 'TRANS_LOG_TABLE_FIELD_ENABLED13', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (4063, 2, 0, 'TRANS_LOG_TABLE_FIELD_ID14', 0, 'DEPDATE');
INSERT INTO `r_trans_attribute` VALUES (4064, 2, 0, 'TRANS_LOG_TABLE_FIELD_NAME14', 0, 'DEPDATE');
INSERT INTO `r_trans_attribute` VALUES (4065, 2, 0, 'TRANS_LOG_TABLE_FIELD_ENABLED14', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (4066, 2, 0, 'TRANS_LOG_TABLE_FIELD_ID15', 0, 'REPLAYDATE');
INSERT INTO `r_trans_attribute` VALUES (4067, 2, 0, 'TRANS_LOG_TABLE_FIELD_NAME15', 0, 'REPLAYDATE');
INSERT INTO `r_trans_attribute` VALUES (4068, 2, 0, 'TRANS_LOG_TABLE_FIELD_ENABLED15', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (4069, 2, 0, 'TRANS_LOG_TABLE_FIELD_ID16', 0, 'LOG_FIELD');
INSERT INTO `r_trans_attribute` VALUES (4070, 2, 0, 'TRANS_LOG_TABLE_FIELD_NAME16', 0, 'LOG_FIELD');
INSERT INTO `r_trans_attribute` VALUES (4071, 2, 0, 'TRANS_LOG_TABLE_FIELD_ENABLED16', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (4072, 2, 0, 'TRANS_LOG_TABLE_FIELD_ID17', 0, 'EXECUTING_SERVER');
INSERT INTO `r_trans_attribute` VALUES (4073, 2, 0, 'TRANS_LOG_TABLE_FIELD_NAME17', 0, 'EXECUTING_SERVER');
INSERT INTO `r_trans_attribute` VALUES (4074, 2, 0, 'TRANS_LOG_TABLE_FIELD_ENABLED17', 0, 'N');
INSERT INTO `r_trans_attribute` VALUES (4075, 2, 0, 'TRANS_LOG_TABLE_FIELD_ID18', 0, 'EXECUTING_USER');
INSERT INTO `r_trans_attribute` VALUES (4076, 2, 0, 'TRANS_LOG_TABLE_FIELD_NAME18', 0, 'EXECUTING_USER');
INSERT INTO `r_trans_attribute` VALUES (4077, 2, 0, 'TRANS_LOG_TABLE_FIELD_ENABLED18', 0, 'N');
INSERT INTO `r_trans_attribute` VALUES (4078, 2, 0, 'TRANS_LOG_TABLE_FIELD_ID19', 0, 'CLIENT');
INSERT INTO `r_trans_attribute` VALUES (4079, 2, 0, 'TRANS_LOG_TABLE_FIELD_NAME19', 0, 'CLIENT');
INSERT INTO `r_trans_attribute` VALUES (4080, 2, 0, 'TRANS_LOG_TABLE_FIELD_ENABLED19', 0, 'N');
INSERT INTO `r_trans_attribute` VALUES (4081, 2, 0, 'TRANSLOG_TABLE_INTERVAL', 0, NULL);
INSERT INTO `r_trans_attribute` VALUES (4082, 2, 0, 'TRANSLOG_TABLE_SIZE_LIMIT', 0, NULL);
INSERT INTO `r_trans_attribute` VALUES (4083, 2, 0, 'STEP_LOG_TABLE_CONNECTION_NAME', 0, NULL);
INSERT INTO `r_trans_attribute` VALUES (4084, 2, 0, 'STEP_LOG_TABLE_SCHEMA_NAME', 0, NULL);
INSERT INTO `r_trans_attribute` VALUES (4085, 2, 0, 'STEP_LOG_TABLE_TABLE_NAME', 0, NULL);
INSERT INTO `r_trans_attribute` VALUES (4086, 2, 0, 'STEP_LOG_TABLE_TIMEOUT_IN_DAYS', 0, NULL);
INSERT INTO `r_trans_attribute` VALUES (4087, 2, 0, 'STEP_LOG_TABLE_FIELD_ID0', 0, 'ID_BATCH');
INSERT INTO `r_trans_attribute` VALUES (4088, 2, 0, 'STEP_LOG_TABLE_FIELD_NAME0', 0, 'ID_BATCH');
INSERT INTO `r_trans_attribute` VALUES (4089, 2, 0, 'STEP_LOG_TABLE_FIELD_ENABLED0', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (4090, 2, 0, 'STEP_LOG_TABLE_FIELD_ID1', 0, 'CHANNEL_ID');
INSERT INTO `r_trans_attribute` VALUES (4091, 2, 0, 'STEP_LOG_TABLE_FIELD_NAME1', 0, 'CHANNEL_ID');
INSERT INTO `r_trans_attribute` VALUES (4092, 2, 0, 'STEP_LOG_TABLE_FIELD_ENABLED1', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (4093, 2, 0, 'STEP_LOG_TABLE_FIELD_ID2', 0, 'LOG_DATE');
INSERT INTO `r_trans_attribute` VALUES (4094, 2, 0, 'STEP_LOG_TABLE_FIELD_NAME2', 0, 'LOG_DATE');
INSERT INTO `r_trans_attribute` VALUES (4095, 2, 0, 'STEP_LOG_TABLE_FIELD_ENABLED2', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (4096, 2, 0, 'STEP_LOG_TABLE_FIELD_ID3', 0, 'TRANSNAME');
INSERT INTO `r_trans_attribute` VALUES (4097, 2, 0, 'STEP_LOG_TABLE_FIELD_NAME3', 0, 'TRANSNAME');
INSERT INTO `r_trans_attribute` VALUES (4098, 2, 0, 'STEP_LOG_TABLE_FIELD_ENABLED3', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (4099, 2, 0, 'STEP_LOG_TABLE_FIELD_ID4', 0, 'STEPNAME');
INSERT INTO `r_trans_attribute` VALUES (4100, 2, 0, 'STEP_LOG_TABLE_FIELD_NAME4', 0, 'STEPNAME');
INSERT INTO `r_trans_attribute` VALUES (4101, 2, 0, 'STEP_LOG_TABLE_FIELD_ENABLED4', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (4102, 2, 0, 'STEP_LOG_TABLE_FIELD_ID5', 0, 'STEP_COPY');
INSERT INTO `r_trans_attribute` VALUES (4103, 2, 0, 'STEP_LOG_TABLE_FIELD_NAME5', 0, 'STEP_COPY');
INSERT INTO `r_trans_attribute` VALUES (4104, 2, 0, 'STEP_LOG_TABLE_FIELD_ENABLED5', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (4105, 2, 0, 'STEP_LOG_TABLE_FIELD_ID6', 0, 'LINES_READ');
INSERT INTO `r_trans_attribute` VALUES (4106, 2, 0, 'STEP_LOG_TABLE_FIELD_NAME6', 0, 'LINES_READ');
INSERT INTO `r_trans_attribute` VALUES (4107, 2, 0, 'STEP_LOG_TABLE_FIELD_ENABLED6', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (4108, 2, 0, 'STEP_LOG_TABLE_FIELD_ID7', 0, 'LINES_WRITTEN');
INSERT INTO `r_trans_attribute` VALUES (4109, 2, 0, 'STEP_LOG_TABLE_FIELD_NAME7', 0, 'LINES_WRITTEN');
INSERT INTO `r_trans_attribute` VALUES (4110, 2, 0, 'STEP_LOG_TABLE_FIELD_ENABLED7', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (4111, 2, 0, 'STEP_LOG_TABLE_FIELD_ID8', 0, 'LINES_UPDATED');
INSERT INTO `r_trans_attribute` VALUES (4112, 2, 0, 'STEP_LOG_TABLE_FIELD_NAME8', 0, 'LINES_UPDATED');
INSERT INTO `r_trans_attribute` VALUES (4113, 2, 0, 'STEP_LOG_TABLE_FIELD_ENABLED8', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (4114, 2, 0, 'STEP_LOG_TABLE_FIELD_ID9', 0, 'LINES_INPUT');
INSERT INTO `r_trans_attribute` VALUES (4115, 2, 0, 'STEP_LOG_TABLE_FIELD_NAME9', 0, 'LINES_INPUT');
INSERT INTO `r_trans_attribute` VALUES (4116, 2, 0, 'STEP_LOG_TABLE_FIELD_ENABLED9', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (4117, 2, 0, 'STEP_LOG_TABLE_FIELD_ID10', 0, 'LINES_OUTPUT');
INSERT INTO `r_trans_attribute` VALUES (4118, 2, 0, 'STEP_LOG_TABLE_FIELD_NAME10', 0, 'LINES_OUTPUT');
INSERT INTO `r_trans_attribute` VALUES (4119, 2, 0, 'STEP_LOG_TABLE_FIELD_ENABLED10', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (4120, 2, 0, 'STEP_LOG_TABLE_FIELD_ID11', 0, 'LINES_REJECTED');
INSERT INTO `r_trans_attribute` VALUES (4121, 2, 0, 'STEP_LOG_TABLE_FIELD_NAME11', 0, 'LINES_REJECTED');
INSERT INTO `r_trans_attribute` VALUES (4122, 2, 0, 'STEP_LOG_TABLE_FIELD_ENABLED11', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (4123, 2, 0, 'STEP_LOG_TABLE_FIELD_ID12', 0, 'ERRORS');
INSERT INTO `r_trans_attribute` VALUES (4124, 2, 0, 'STEP_LOG_TABLE_FIELD_NAME12', 0, 'ERRORS');
INSERT INTO `r_trans_attribute` VALUES (4125, 2, 0, 'STEP_LOG_TABLE_FIELD_ENABLED12', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (4126, 2, 0, 'STEP_LOG_TABLE_FIELD_ID13', 0, 'LOG_FIELD');
INSERT INTO `r_trans_attribute` VALUES (4127, 2, 0, 'STEP_LOG_TABLE_FIELD_NAME13', 0, 'LOG_FIELD');
INSERT INTO `r_trans_attribute` VALUES (4128, 2, 0, 'STEP_LOG_TABLE_FIELD_ENABLED13', 0, 'N');
INSERT INTO `r_trans_attribute` VALUES (4129, 2, 0, 'PERFORMANCE_LOG_TABLE_CONNECTION_NAME', 0, NULL);
INSERT INTO `r_trans_attribute` VALUES (4130, 2, 0, 'PERFORMANCE_LOG_TABLE_SCHEMA_NAME', 0, NULL);
INSERT INTO `r_trans_attribute` VALUES (4131, 2, 0, 'PERFORMANCE_LOG_TABLE_TABLE_NAME', 0, NULL);
INSERT INTO `r_trans_attribute` VALUES (4132, 2, 0, 'PERFORMANCE_LOG_TABLE_TIMEOUT_IN_DAYS', 0, NULL);
INSERT INTO `r_trans_attribute` VALUES (4133, 2, 0, 'PERFORMANCE_LOG_TABLE_FIELD_ID0', 0, 'ID_BATCH');
INSERT INTO `r_trans_attribute` VALUES (4134, 2, 0, 'PERFORMANCE_LOG_TABLE_FIELD_NAME0', 0, 'ID_BATCH');
INSERT INTO `r_trans_attribute` VALUES (4135, 2, 0, 'PERFORMANCE_LOG_TABLE_FIELD_ENABLED0', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (4136, 2, 0, 'PERFORMANCE_LOG_TABLE_FIELD_ID1', 0, 'SEQ_NR');
INSERT INTO `r_trans_attribute` VALUES (4137, 2, 0, 'PERFORMANCE_LOG_TABLE_FIELD_NAME1', 0, 'SEQ_NR');
INSERT INTO `r_trans_attribute` VALUES (4138, 2, 0, 'PERFORMANCE_LOG_TABLE_FIELD_ENABLED1', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (4139, 2, 0, 'PERFORMANCE_LOG_TABLE_FIELD_ID2', 0, 'LOGDATE');
INSERT INTO `r_trans_attribute` VALUES (4140, 2, 0, 'PERFORMANCE_LOG_TABLE_FIELD_NAME2', 0, 'LOGDATE');
INSERT INTO `r_trans_attribute` VALUES (4141, 2, 0, 'PERFORMANCE_LOG_TABLE_FIELD_ENABLED2', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (4142, 2, 0, 'PERFORMANCE_LOG_TABLE_FIELD_ID3', 0, 'TRANSNAME');
INSERT INTO `r_trans_attribute` VALUES (4143, 2, 0, 'PERFORMANCE_LOG_TABLE_FIELD_NAME3', 0, 'TRANSNAME');
INSERT INTO `r_trans_attribute` VALUES (4144, 2, 0, 'PERFORMANCE_LOG_TABLE_FIELD_ENABLED3', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (4145, 2, 0, 'PERFORMANCE_LOG_TABLE_FIELD_ID4', 0, 'STEPNAME');
INSERT INTO `r_trans_attribute` VALUES (4146, 2, 0, 'PERFORMANCE_LOG_TABLE_FIELD_NAME4', 0, 'STEPNAME');
INSERT INTO `r_trans_attribute` VALUES (4147, 2, 0, 'PERFORMANCE_LOG_TABLE_FIELD_ENABLED4', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (4148, 2, 0, 'PERFORMANCE_LOG_TABLE_FIELD_ID5', 0, 'STEP_COPY');
INSERT INTO `r_trans_attribute` VALUES (4149, 2, 0, 'PERFORMANCE_LOG_TABLE_FIELD_NAME5', 0, 'STEP_COPY');
INSERT INTO `r_trans_attribute` VALUES (4150, 2, 0, 'PERFORMANCE_LOG_TABLE_FIELD_ENABLED5', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (4151, 2, 0, 'PERFORMANCE_LOG_TABLE_FIELD_ID6', 0, 'LINES_READ');
INSERT INTO `r_trans_attribute` VALUES (4152, 2, 0, 'PERFORMANCE_LOG_TABLE_FIELD_NAME6', 0, 'LINES_READ');
INSERT INTO `r_trans_attribute` VALUES (4153, 2, 0, 'PERFORMANCE_LOG_TABLE_FIELD_ENABLED6', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (4154, 2, 0, 'PERFORMANCE_LOG_TABLE_FIELD_ID7', 0, 'LINES_WRITTEN');
INSERT INTO `r_trans_attribute` VALUES (4155, 2, 0, 'PERFORMANCE_LOG_TABLE_FIELD_NAME7', 0, 'LINES_WRITTEN');
INSERT INTO `r_trans_attribute` VALUES (4156, 2, 0, 'PERFORMANCE_LOG_TABLE_FIELD_ENABLED7', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (4157, 2, 0, 'PERFORMANCE_LOG_TABLE_FIELD_ID8', 0, 'LINES_UPDATED');
INSERT INTO `r_trans_attribute` VALUES (4158, 2, 0, 'PERFORMANCE_LOG_TABLE_FIELD_NAME8', 0, 'LINES_UPDATED');
INSERT INTO `r_trans_attribute` VALUES (4159, 2, 0, 'PERFORMANCE_LOG_TABLE_FIELD_ENABLED8', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (4160, 2, 0, 'PERFORMANCE_LOG_TABLE_FIELD_ID9', 0, 'LINES_INPUT');
INSERT INTO `r_trans_attribute` VALUES (4161, 2, 0, 'PERFORMANCE_LOG_TABLE_FIELD_NAME9', 0, 'LINES_INPUT');
INSERT INTO `r_trans_attribute` VALUES (4162, 2, 0, 'PERFORMANCE_LOG_TABLE_FIELD_ENABLED9', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (4163, 2, 0, 'PERFORMANCE_LOG_TABLE_FIELD_ID10', 0, 'LINES_OUTPUT');
INSERT INTO `r_trans_attribute` VALUES (4164, 2, 0, 'PERFORMANCE_LOG_TABLE_FIELD_NAME10', 0, 'LINES_OUTPUT');
INSERT INTO `r_trans_attribute` VALUES (4165, 2, 0, 'PERFORMANCE_LOG_TABLE_FIELD_ENABLED10', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (4166, 2, 0, 'PERFORMANCE_LOG_TABLE_FIELD_ID11', 0, 'LINES_REJECTED');
INSERT INTO `r_trans_attribute` VALUES (4167, 2, 0, 'PERFORMANCE_LOG_TABLE_FIELD_NAME11', 0, 'LINES_REJECTED');
INSERT INTO `r_trans_attribute` VALUES (4168, 2, 0, 'PERFORMANCE_LOG_TABLE_FIELD_ENABLED11', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (4169, 2, 0, 'PERFORMANCE_LOG_TABLE_FIELD_ID12', 0, 'ERRORS');
INSERT INTO `r_trans_attribute` VALUES (4170, 2, 0, 'PERFORMANCE_LOG_TABLE_FIELD_NAME12', 0, 'ERRORS');
INSERT INTO `r_trans_attribute` VALUES (4171, 2, 0, 'PERFORMANCE_LOG_TABLE_FIELD_ENABLED12', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (4172, 2, 0, 'PERFORMANCE_LOG_TABLE_FIELD_ID13', 0, 'INPUT_BUFFER_ROWS');
INSERT INTO `r_trans_attribute` VALUES (4173, 2, 0, 'PERFORMANCE_LOG_TABLE_FIELD_NAME13', 0, 'INPUT_BUFFER_ROWS');
INSERT INTO `r_trans_attribute` VALUES (4174, 2, 0, 'PERFORMANCE_LOG_TABLE_FIELD_ENABLED13', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (4175, 2, 0, 'PERFORMANCE_LOG_TABLE_FIELD_ID14', 0, 'OUTPUT_BUFFER_ROWS');
INSERT INTO `r_trans_attribute` VALUES (4176, 2, 0, 'PERFORMANCE_LOG_TABLE_FIELD_NAME14', 0, 'OUTPUT_BUFFER_ROWS');
INSERT INTO `r_trans_attribute` VALUES (4177, 2, 0, 'PERFORMANCE_LOG_TABLE_FIELD_ENABLED14', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (4178, 2, 0, 'PERFORMANCELOG_TABLE_INTERVAL', 0, NULL);
INSERT INTO `r_trans_attribute` VALUES (4179, 2, 0, 'CHANNEL_LOG_TABLE_CONNECTION_NAME', 0, NULL);
INSERT INTO `r_trans_attribute` VALUES (4180, 2, 0, 'CHANNEL_LOG_TABLE_SCHEMA_NAME', 0, NULL);
INSERT INTO `r_trans_attribute` VALUES (4181, 2, 0, 'CHANNEL_LOG_TABLE_TABLE_NAME', 0, NULL);
INSERT INTO `r_trans_attribute` VALUES (4182, 2, 0, 'CHANNEL_LOG_TABLE_TIMEOUT_IN_DAYS', 0, NULL);
INSERT INTO `r_trans_attribute` VALUES (4183, 2, 0, 'CHANNEL_LOG_TABLE_FIELD_ID0', 0, 'ID_BATCH');
INSERT INTO `r_trans_attribute` VALUES (4184, 2, 0, 'CHANNEL_LOG_TABLE_FIELD_NAME0', 0, 'ID_BATCH');
INSERT INTO `r_trans_attribute` VALUES (4185, 2, 0, 'CHANNEL_LOG_TABLE_FIELD_ENABLED0', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (4186, 2, 0, 'CHANNEL_LOG_TABLE_FIELD_ID1', 0, 'CHANNEL_ID');
INSERT INTO `r_trans_attribute` VALUES (4187, 2, 0, 'CHANNEL_LOG_TABLE_FIELD_NAME1', 0, 'CHANNEL_ID');
INSERT INTO `r_trans_attribute` VALUES (4188, 2, 0, 'CHANNEL_LOG_TABLE_FIELD_ENABLED1', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (4189, 2, 0, 'CHANNEL_LOG_TABLE_FIELD_ID2', 0, 'LOG_DATE');
INSERT INTO `r_trans_attribute` VALUES (4190, 2, 0, 'CHANNEL_LOG_TABLE_FIELD_NAME2', 0, 'LOG_DATE');
INSERT INTO `r_trans_attribute` VALUES (4191, 2, 0, 'CHANNEL_LOG_TABLE_FIELD_ENABLED2', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (4192, 2, 0, 'CHANNEL_LOG_TABLE_FIELD_ID3', 0, 'LOGGING_OBJECT_TYPE');
INSERT INTO `r_trans_attribute` VALUES (4193, 2, 0, 'CHANNEL_LOG_TABLE_FIELD_NAME3', 0, 'LOGGING_OBJECT_TYPE');
INSERT INTO `r_trans_attribute` VALUES (4194, 2, 0, 'CHANNEL_LOG_TABLE_FIELD_ENABLED3', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (4195, 2, 0, 'CHANNEL_LOG_TABLE_FIELD_ID4', 0, 'OBJECT_NAME');
INSERT INTO `r_trans_attribute` VALUES (4196, 2, 0, 'CHANNEL_LOG_TABLE_FIELD_NAME4', 0, 'OBJECT_NAME');
INSERT INTO `r_trans_attribute` VALUES (4197, 2, 0, 'CHANNEL_LOG_TABLE_FIELD_ENABLED4', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (4198, 2, 0, 'CHANNEL_LOG_TABLE_FIELD_ID5', 0, 'OBJECT_COPY');
INSERT INTO `r_trans_attribute` VALUES (4199, 2, 0, 'CHANNEL_LOG_TABLE_FIELD_NAME5', 0, 'OBJECT_COPY');
INSERT INTO `r_trans_attribute` VALUES (4200, 2, 0, 'CHANNEL_LOG_TABLE_FIELD_ENABLED5', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (4201, 2, 0, 'CHANNEL_LOG_TABLE_FIELD_ID6', 0, 'REPOSITORY_DIRECTORY');
INSERT INTO `r_trans_attribute` VALUES (4202, 2, 0, 'CHANNEL_LOG_TABLE_FIELD_NAME6', 0, 'REPOSITORY_DIRECTORY');
INSERT INTO `r_trans_attribute` VALUES (4203, 2, 0, 'CHANNEL_LOG_TABLE_FIELD_ENABLED6', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (4204, 2, 0, 'CHANNEL_LOG_TABLE_FIELD_ID7', 0, 'FILENAME');
INSERT INTO `r_trans_attribute` VALUES (4205, 2, 0, 'CHANNEL_LOG_TABLE_FIELD_NAME7', 0, 'FILENAME');
INSERT INTO `r_trans_attribute` VALUES (4206, 2, 0, 'CHANNEL_LOG_TABLE_FIELD_ENABLED7', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (4207, 2, 0, 'CHANNEL_LOG_TABLE_FIELD_ID8', 0, 'OBJECT_ID');
INSERT INTO `r_trans_attribute` VALUES (4208, 2, 0, 'CHANNEL_LOG_TABLE_FIELD_NAME8', 0, 'OBJECT_ID');
INSERT INTO `r_trans_attribute` VALUES (4209, 2, 0, 'CHANNEL_LOG_TABLE_FIELD_ENABLED8', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (4210, 2, 0, 'CHANNEL_LOG_TABLE_FIELD_ID9', 0, 'OBJECT_REVISION');
INSERT INTO `r_trans_attribute` VALUES (4211, 2, 0, 'CHANNEL_LOG_TABLE_FIELD_NAME9', 0, 'OBJECT_REVISION');
INSERT INTO `r_trans_attribute` VALUES (4212, 2, 0, 'CHANNEL_LOG_TABLE_FIELD_ENABLED9', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (4213, 2, 0, 'CHANNEL_LOG_TABLE_FIELD_ID10', 0, 'PARENT_CHANNEL_ID');
INSERT INTO `r_trans_attribute` VALUES (4214, 2, 0, 'CHANNEL_LOG_TABLE_FIELD_NAME10', 0, 'PARENT_CHANNEL_ID');
INSERT INTO `r_trans_attribute` VALUES (4215, 2, 0, 'CHANNEL_LOG_TABLE_FIELD_ENABLED10', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (4216, 2, 0, 'CHANNEL_LOG_TABLE_FIELD_ID11', 0, 'ROOT_CHANNEL_ID');
INSERT INTO `r_trans_attribute` VALUES (4217, 2, 0, 'CHANNEL_LOG_TABLE_FIELD_NAME11', 0, 'ROOT_CHANNEL_ID');
INSERT INTO `r_trans_attribute` VALUES (4218, 2, 0, 'CHANNEL_LOG_TABLE_FIELD_ENABLED11', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (4441, 3, 0, 'UNIQUE_CONNECTIONS', 0, 'N');
INSERT INTO `r_trans_attribute` VALUES (4442, 3, 0, 'FEEDBACK_SHOWN', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (4443, 3, 0, 'FEEDBACK_SIZE', 50000, NULL);
INSERT INTO `r_trans_attribute` VALUES (4444, 3, 0, 'USING_THREAD_PRIORITIES', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (4445, 3, 0, 'SHARED_FILE', 0, NULL);
INSERT INTO `r_trans_attribute` VALUES (4446, 3, 0, 'CAPTURE_STEP_PERFORMANCE', 0, 'N');
INSERT INTO `r_trans_attribute` VALUES (4447, 3, 0, 'STEP_PERFORMANCE_CAPTURING_DELAY', 1000, NULL);
INSERT INTO `r_trans_attribute` VALUES (4448, 3, 0, 'STEP_PERFORMANCE_CAPTURING_SIZE_LIMIT', 0, '100');
INSERT INTO `r_trans_attribute` VALUES (4449, 3, 0, 'STEP_PERFORMANCE_LOG_TABLE', 0, NULL);
INSERT INTO `r_trans_attribute` VALUES (4450, 3, 0, 'LOG_SIZE_LIMIT', 0, NULL);
INSERT INTO `r_trans_attribute` VALUES (4451, 3, 0, 'LOG_INTERVAL', 0, NULL);
INSERT INTO `r_trans_attribute` VALUES (4452, 3, 0, 'TRANSFORMATION_TYPE', 0, 'Normal');
INSERT INTO `r_trans_attribute` VALUES (4453, 3, 0, 'SLEEP_TIME_EMPTY', 50, NULL);
INSERT INTO `r_trans_attribute` VALUES (4454, 3, 0, 'SLEEP_TIME_FULL', 50, NULL);
INSERT INTO `r_trans_attribute` VALUES (4455, 3, 0, 'TRANS_LOG_TABLE_CONNECTION_NAME', 0, NULL);
INSERT INTO `r_trans_attribute` VALUES (4456, 3, 0, 'TRANS_LOG_TABLE_SCHEMA_NAME', 0, NULL);
INSERT INTO `r_trans_attribute` VALUES (4457, 3, 0, 'TRANS_LOG_TABLE_TABLE_NAME', 0, NULL);
INSERT INTO `r_trans_attribute` VALUES (4458, 3, 0, 'TRANS_LOG_TABLE_TIMEOUT_IN_DAYS', 0, NULL);
INSERT INTO `r_trans_attribute` VALUES (4459, 3, 0, 'TRANS_LOG_TABLE_FIELD_ID0', 0, 'ID_BATCH');
INSERT INTO `r_trans_attribute` VALUES (4460, 3, 0, 'TRANS_LOG_TABLE_FIELD_NAME0', 0, 'ID_BATCH');
INSERT INTO `r_trans_attribute` VALUES (4461, 3, 0, 'TRANS_LOG_TABLE_FIELD_ENABLED0', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (4462, 3, 0, 'TRANS_LOG_TABLE_FIELD_ID1', 0, 'CHANNEL_ID');
INSERT INTO `r_trans_attribute` VALUES (4463, 3, 0, 'TRANS_LOG_TABLE_FIELD_NAME1', 0, 'CHANNEL_ID');
INSERT INTO `r_trans_attribute` VALUES (4464, 3, 0, 'TRANS_LOG_TABLE_FIELD_ENABLED1', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (4465, 3, 0, 'TRANS_LOG_TABLE_FIELD_ID2', 0, 'TRANSNAME');
INSERT INTO `r_trans_attribute` VALUES (4466, 3, 0, 'TRANS_LOG_TABLE_FIELD_NAME2', 0, 'TRANSNAME');
INSERT INTO `r_trans_attribute` VALUES (4467, 3, 0, 'TRANS_LOG_TABLE_FIELD_ENABLED2', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (4468, 3, 0, 'TRANS_LOG_TABLE_FIELD_ID3', 0, 'STATUS');
INSERT INTO `r_trans_attribute` VALUES (4469, 3, 0, 'TRANS_LOG_TABLE_FIELD_NAME3', 0, 'STATUS');
INSERT INTO `r_trans_attribute` VALUES (4470, 3, 0, 'TRANS_LOG_TABLE_FIELD_ENABLED3', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (4471, 3, 0, 'TRANS_LOG_TABLE_FIELD_ID4', 0, 'LINES_READ');
INSERT INTO `r_trans_attribute` VALUES (4472, 3, 0, 'TRANS_LOG_TABLE_FIELD_NAME4', 0, 'LINES_READ');
INSERT INTO `r_trans_attribute` VALUES (4473, 3, 0, 'TRANS_LOG_TABLE_FIELD_ENABLED4', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (4474, 3, 0, 'TRANS_LOG_TABLE_FIELD_SUBJECT4', 0, NULL);
INSERT INTO `r_trans_attribute` VALUES (4475, 3, 0, 'TRANS_LOG_TABLE_FIELD_ID5', 0, 'LINES_WRITTEN');
INSERT INTO `r_trans_attribute` VALUES (4476, 3, 0, 'TRANS_LOG_TABLE_FIELD_NAME5', 0, 'LINES_WRITTEN');
INSERT INTO `r_trans_attribute` VALUES (4477, 3, 0, 'TRANS_LOG_TABLE_FIELD_ENABLED5', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (4478, 3, 0, 'TRANS_LOG_TABLE_FIELD_SUBJECT5', 0, NULL);
INSERT INTO `r_trans_attribute` VALUES (4479, 3, 0, 'TRANS_LOG_TABLE_FIELD_ID6', 0, 'LINES_UPDATED');
INSERT INTO `r_trans_attribute` VALUES (4480, 3, 0, 'TRANS_LOG_TABLE_FIELD_NAME6', 0, 'LINES_UPDATED');
INSERT INTO `r_trans_attribute` VALUES (4481, 3, 0, 'TRANS_LOG_TABLE_FIELD_ENABLED6', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (4482, 3, 0, 'TRANS_LOG_TABLE_FIELD_SUBJECT6', 0, NULL);
INSERT INTO `r_trans_attribute` VALUES (4483, 3, 0, 'TRANS_LOG_TABLE_FIELD_ID7', 0, 'LINES_INPUT');
INSERT INTO `r_trans_attribute` VALUES (4484, 3, 0, 'TRANS_LOG_TABLE_FIELD_NAME7', 0, 'LINES_INPUT');
INSERT INTO `r_trans_attribute` VALUES (4485, 3, 0, 'TRANS_LOG_TABLE_FIELD_ENABLED7', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (4486, 3, 0, 'TRANS_LOG_TABLE_FIELD_SUBJECT7', 0, NULL);
INSERT INTO `r_trans_attribute` VALUES (4487, 3, 0, 'TRANS_LOG_TABLE_FIELD_ID8', 0, 'LINES_OUTPUT');
INSERT INTO `r_trans_attribute` VALUES (4488, 3, 0, 'TRANS_LOG_TABLE_FIELD_NAME8', 0, 'LINES_OUTPUT');
INSERT INTO `r_trans_attribute` VALUES (4489, 3, 0, 'TRANS_LOG_TABLE_FIELD_ENABLED8', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (4490, 3, 0, 'TRANS_LOG_TABLE_FIELD_SUBJECT8', 0, NULL);
INSERT INTO `r_trans_attribute` VALUES (4491, 3, 0, 'TRANS_LOG_TABLE_FIELD_ID9', 0, 'LINES_REJECTED');
INSERT INTO `r_trans_attribute` VALUES (4492, 3, 0, 'TRANS_LOG_TABLE_FIELD_NAME9', 0, 'LINES_REJECTED');
INSERT INTO `r_trans_attribute` VALUES (4493, 3, 0, 'TRANS_LOG_TABLE_FIELD_ENABLED9', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (4494, 3, 0, 'TRANS_LOG_TABLE_FIELD_SUBJECT9', 0, NULL);
INSERT INTO `r_trans_attribute` VALUES (4495, 3, 0, 'TRANS_LOG_TABLE_FIELD_ID10', 0, 'ERRORS');
INSERT INTO `r_trans_attribute` VALUES (4496, 3, 0, 'TRANS_LOG_TABLE_FIELD_NAME10', 0, 'ERRORS');
INSERT INTO `r_trans_attribute` VALUES (4497, 3, 0, 'TRANS_LOG_TABLE_FIELD_ENABLED10', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (4498, 3, 0, 'TRANS_LOG_TABLE_FIELD_ID11', 0, 'STARTDATE');
INSERT INTO `r_trans_attribute` VALUES (4499, 3, 0, 'TRANS_LOG_TABLE_FIELD_NAME11', 0, 'STARTDATE');
INSERT INTO `r_trans_attribute` VALUES (4500, 3, 0, 'TRANS_LOG_TABLE_FIELD_ENABLED11', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (4501, 3, 0, 'TRANS_LOG_TABLE_FIELD_ID12', 0, 'ENDDATE');
INSERT INTO `r_trans_attribute` VALUES (4502, 3, 0, 'TRANS_LOG_TABLE_FIELD_NAME12', 0, 'ENDDATE');
INSERT INTO `r_trans_attribute` VALUES (4503, 3, 0, 'TRANS_LOG_TABLE_FIELD_ENABLED12', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (4504, 3, 0, 'TRANS_LOG_TABLE_FIELD_ID13', 0, 'LOGDATE');
INSERT INTO `r_trans_attribute` VALUES (4505, 3, 0, 'TRANS_LOG_TABLE_FIELD_NAME13', 0, 'LOGDATE');
INSERT INTO `r_trans_attribute` VALUES (4506, 3, 0, 'TRANS_LOG_TABLE_FIELD_ENABLED13', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (4507, 3, 0, 'TRANS_LOG_TABLE_FIELD_ID14', 0, 'DEPDATE');
INSERT INTO `r_trans_attribute` VALUES (4508, 3, 0, 'TRANS_LOG_TABLE_FIELD_NAME14', 0, 'DEPDATE');
INSERT INTO `r_trans_attribute` VALUES (4509, 3, 0, 'TRANS_LOG_TABLE_FIELD_ENABLED14', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (4510, 3, 0, 'TRANS_LOG_TABLE_FIELD_ID15', 0, 'REPLAYDATE');
INSERT INTO `r_trans_attribute` VALUES (4511, 3, 0, 'TRANS_LOG_TABLE_FIELD_NAME15', 0, 'REPLAYDATE');
INSERT INTO `r_trans_attribute` VALUES (4512, 3, 0, 'TRANS_LOG_TABLE_FIELD_ENABLED15', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (4513, 3, 0, 'TRANS_LOG_TABLE_FIELD_ID16', 0, 'LOG_FIELD');
INSERT INTO `r_trans_attribute` VALUES (4514, 3, 0, 'TRANS_LOG_TABLE_FIELD_NAME16', 0, 'LOG_FIELD');
INSERT INTO `r_trans_attribute` VALUES (4515, 3, 0, 'TRANS_LOG_TABLE_FIELD_ENABLED16', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (4516, 3, 0, 'TRANS_LOG_TABLE_FIELD_ID17', 0, 'EXECUTING_SERVER');
INSERT INTO `r_trans_attribute` VALUES (4517, 3, 0, 'TRANS_LOG_TABLE_FIELD_NAME17', 0, 'EXECUTING_SERVER');
INSERT INTO `r_trans_attribute` VALUES (4518, 3, 0, 'TRANS_LOG_TABLE_FIELD_ENABLED17', 0, 'N');
INSERT INTO `r_trans_attribute` VALUES (4519, 3, 0, 'TRANS_LOG_TABLE_FIELD_ID18', 0, 'EXECUTING_USER');
INSERT INTO `r_trans_attribute` VALUES (4520, 3, 0, 'TRANS_LOG_TABLE_FIELD_NAME18', 0, 'EXECUTING_USER');
INSERT INTO `r_trans_attribute` VALUES (4521, 3, 0, 'TRANS_LOG_TABLE_FIELD_ENABLED18', 0, 'N');
INSERT INTO `r_trans_attribute` VALUES (4522, 3, 0, 'TRANS_LOG_TABLE_FIELD_ID19', 0, 'CLIENT');
INSERT INTO `r_trans_attribute` VALUES (4523, 3, 0, 'TRANS_LOG_TABLE_FIELD_NAME19', 0, 'CLIENT');
INSERT INTO `r_trans_attribute` VALUES (4524, 3, 0, 'TRANS_LOG_TABLE_FIELD_ENABLED19', 0, 'N');
INSERT INTO `r_trans_attribute` VALUES (4525, 3, 0, 'TRANSLOG_TABLE_INTERVAL', 0, NULL);
INSERT INTO `r_trans_attribute` VALUES (4526, 3, 0, 'TRANSLOG_TABLE_SIZE_LIMIT', 0, NULL);
INSERT INTO `r_trans_attribute` VALUES (4527, 3, 0, 'STEP_LOG_TABLE_CONNECTION_NAME', 0, NULL);
INSERT INTO `r_trans_attribute` VALUES (4528, 3, 0, 'STEP_LOG_TABLE_SCHEMA_NAME', 0, NULL);
INSERT INTO `r_trans_attribute` VALUES (4529, 3, 0, 'STEP_LOG_TABLE_TABLE_NAME', 0, NULL);
INSERT INTO `r_trans_attribute` VALUES (4530, 3, 0, 'STEP_LOG_TABLE_TIMEOUT_IN_DAYS', 0, NULL);
INSERT INTO `r_trans_attribute` VALUES (4531, 3, 0, 'STEP_LOG_TABLE_FIELD_ID0', 0, 'ID_BATCH');
INSERT INTO `r_trans_attribute` VALUES (4532, 3, 0, 'STEP_LOG_TABLE_FIELD_NAME0', 0, 'ID_BATCH');
INSERT INTO `r_trans_attribute` VALUES (4533, 3, 0, 'STEP_LOG_TABLE_FIELD_ENABLED0', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (4534, 3, 0, 'STEP_LOG_TABLE_FIELD_ID1', 0, 'CHANNEL_ID');
INSERT INTO `r_trans_attribute` VALUES (4535, 3, 0, 'STEP_LOG_TABLE_FIELD_NAME1', 0, 'CHANNEL_ID');
INSERT INTO `r_trans_attribute` VALUES (4536, 3, 0, 'STEP_LOG_TABLE_FIELD_ENABLED1', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (4537, 3, 0, 'STEP_LOG_TABLE_FIELD_ID2', 0, 'LOG_DATE');
INSERT INTO `r_trans_attribute` VALUES (4538, 3, 0, 'STEP_LOG_TABLE_FIELD_NAME2', 0, 'LOG_DATE');
INSERT INTO `r_trans_attribute` VALUES (4539, 3, 0, 'STEP_LOG_TABLE_FIELD_ENABLED2', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (4540, 3, 0, 'STEP_LOG_TABLE_FIELD_ID3', 0, 'TRANSNAME');
INSERT INTO `r_trans_attribute` VALUES (4541, 3, 0, 'STEP_LOG_TABLE_FIELD_NAME3', 0, 'TRANSNAME');
INSERT INTO `r_trans_attribute` VALUES (4542, 3, 0, 'STEP_LOG_TABLE_FIELD_ENABLED3', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (4543, 3, 0, 'STEP_LOG_TABLE_FIELD_ID4', 0, 'STEPNAME');
INSERT INTO `r_trans_attribute` VALUES (4544, 3, 0, 'STEP_LOG_TABLE_FIELD_NAME4', 0, 'STEPNAME');
INSERT INTO `r_trans_attribute` VALUES (4545, 3, 0, 'STEP_LOG_TABLE_FIELD_ENABLED4', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (4546, 3, 0, 'STEP_LOG_TABLE_FIELD_ID5', 0, 'STEP_COPY');
INSERT INTO `r_trans_attribute` VALUES (4547, 3, 0, 'STEP_LOG_TABLE_FIELD_NAME5', 0, 'STEP_COPY');
INSERT INTO `r_trans_attribute` VALUES (4548, 3, 0, 'STEP_LOG_TABLE_FIELD_ENABLED5', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (4549, 3, 0, 'STEP_LOG_TABLE_FIELD_ID6', 0, 'LINES_READ');
INSERT INTO `r_trans_attribute` VALUES (4550, 3, 0, 'STEP_LOG_TABLE_FIELD_NAME6', 0, 'LINES_READ');
INSERT INTO `r_trans_attribute` VALUES (4551, 3, 0, 'STEP_LOG_TABLE_FIELD_ENABLED6', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (4552, 3, 0, 'STEP_LOG_TABLE_FIELD_ID7', 0, 'LINES_WRITTEN');
INSERT INTO `r_trans_attribute` VALUES (4553, 3, 0, 'STEP_LOG_TABLE_FIELD_NAME7', 0, 'LINES_WRITTEN');
INSERT INTO `r_trans_attribute` VALUES (4554, 3, 0, 'STEP_LOG_TABLE_FIELD_ENABLED7', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (4555, 3, 0, 'STEP_LOG_TABLE_FIELD_ID8', 0, 'LINES_UPDATED');
INSERT INTO `r_trans_attribute` VALUES (4556, 3, 0, 'STEP_LOG_TABLE_FIELD_NAME8', 0, 'LINES_UPDATED');
INSERT INTO `r_trans_attribute` VALUES (4557, 3, 0, 'STEP_LOG_TABLE_FIELD_ENABLED8', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (4558, 3, 0, 'STEP_LOG_TABLE_FIELD_ID9', 0, 'LINES_INPUT');
INSERT INTO `r_trans_attribute` VALUES (4559, 3, 0, 'STEP_LOG_TABLE_FIELD_NAME9', 0, 'LINES_INPUT');
INSERT INTO `r_trans_attribute` VALUES (4560, 3, 0, 'STEP_LOG_TABLE_FIELD_ENABLED9', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (4561, 3, 0, 'STEP_LOG_TABLE_FIELD_ID10', 0, 'LINES_OUTPUT');
INSERT INTO `r_trans_attribute` VALUES (4562, 3, 0, 'STEP_LOG_TABLE_FIELD_NAME10', 0, 'LINES_OUTPUT');
INSERT INTO `r_trans_attribute` VALUES (4563, 3, 0, 'STEP_LOG_TABLE_FIELD_ENABLED10', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (4564, 3, 0, 'STEP_LOG_TABLE_FIELD_ID11', 0, 'LINES_REJECTED');
INSERT INTO `r_trans_attribute` VALUES (4565, 3, 0, 'STEP_LOG_TABLE_FIELD_NAME11', 0, 'LINES_REJECTED');
INSERT INTO `r_trans_attribute` VALUES (4566, 3, 0, 'STEP_LOG_TABLE_FIELD_ENABLED11', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (4567, 3, 0, 'STEP_LOG_TABLE_FIELD_ID12', 0, 'ERRORS');
INSERT INTO `r_trans_attribute` VALUES (4568, 3, 0, 'STEP_LOG_TABLE_FIELD_NAME12', 0, 'ERRORS');
INSERT INTO `r_trans_attribute` VALUES (4569, 3, 0, 'STEP_LOG_TABLE_FIELD_ENABLED12', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (4570, 3, 0, 'STEP_LOG_TABLE_FIELD_ID13', 0, 'LOG_FIELD');
INSERT INTO `r_trans_attribute` VALUES (4571, 3, 0, 'STEP_LOG_TABLE_FIELD_NAME13', 0, 'LOG_FIELD');
INSERT INTO `r_trans_attribute` VALUES (4572, 3, 0, 'STEP_LOG_TABLE_FIELD_ENABLED13', 0, 'N');
INSERT INTO `r_trans_attribute` VALUES (4573, 3, 0, 'PERFORMANCE_LOG_TABLE_CONNECTION_NAME', 0, NULL);
INSERT INTO `r_trans_attribute` VALUES (4574, 3, 0, 'PERFORMANCE_LOG_TABLE_SCHEMA_NAME', 0, NULL);
INSERT INTO `r_trans_attribute` VALUES (4575, 3, 0, 'PERFORMANCE_LOG_TABLE_TABLE_NAME', 0, NULL);
INSERT INTO `r_trans_attribute` VALUES (4576, 3, 0, 'PERFORMANCE_LOG_TABLE_TIMEOUT_IN_DAYS', 0, NULL);
INSERT INTO `r_trans_attribute` VALUES (4577, 3, 0, 'PERFORMANCE_LOG_TABLE_FIELD_ID0', 0, 'ID_BATCH');
INSERT INTO `r_trans_attribute` VALUES (4578, 3, 0, 'PERFORMANCE_LOG_TABLE_FIELD_NAME0', 0, 'ID_BATCH');
INSERT INTO `r_trans_attribute` VALUES (4579, 3, 0, 'PERFORMANCE_LOG_TABLE_FIELD_ENABLED0', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (4580, 3, 0, 'PERFORMANCE_LOG_TABLE_FIELD_ID1', 0, 'SEQ_NR');
INSERT INTO `r_trans_attribute` VALUES (4581, 3, 0, 'PERFORMANCE_LOG_TABLE_FIELD_NAME1', 0, 'SEQ_NR');
INSERT INTO `r_trans_attribute` VALUES (4582, 3, 0, 'PERFORMANCE_LOG_TABLE_FIELD_ENABLED1', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (4583, 3, 0, 'PERFORMANCE_LOG_TABLE_FIELD_ID2', 0, 'LOGDATE');
INSERT INTO `r_trans_attribute` VALUES (4584, 3, 0, 'PERFORMANCE_LOG_TABLE_FIELD_NAME2', 0, 'LOGDATE');
INSERT INTO `r_trans_attribute` VALUES (4585, 3, 0, 'PERFORMANCE_LOG_TABLE_FIELD_ENABLED2', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (4586, 3, 0, 'PERFORMANCE_LOG_TABLE_FIELD_ID3', 0, 'TRANSNAME');
INSERT INTO `r_trans_attribute` VALUES (4587, 3, 0, 'PERFORMANCE_LOG_TABLE_FIELD_NAME3', 0, 'TRANSNAME');
INSERT INTO `r_trans_attribute` VALUES (4588, 3, 0, 'PERFORMANCE_LOG_TABLE_FIELD_ENABLED3', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (4589, 3, 0, 'PERFORMANCE_LOG_TABLE_FIELD_ID4', 0, 'STEPNAME');
INSERT INTO `r_trans_attribute` VALUES (4590, 3, 0, 'PERFORMANCE_LOG_TABLE_FIELD_NAME4', 0, 'STEPNAME');
INSERT INTO `r_trans_attribute` VALUES (4591, 3, 0, 'PERFORMANCE_LOG_TABLE_FIELD_ENABLED4', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (4592, 3, 0, 'PERFORMANCE_LOG_TABLE_FIELD_ID5', 0, 'STEP_COPY');
INSERT INTO `r_trans_attribute` VALUES (4593, 3, 0, 'PERFORMANCE_LOG_TABLE_FIELD_NAME5', 0, 'STEP_COPY');
INSERT INTO `r_trans_attribute` VALUES (4594, 3, 0, 'PERFORMANCE_LOG_TABLE_FIELD_ENABLED5', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (4595, 3, 0, 'PERFORMANCE_LOG_TABLE_FIELD_ID6', 0, 'LINES_READ');
INSERT INTO `r_trans_attribute` VALUES (4596, 3, 0, 'PERFORMANCE_LOG_TABLE_FIELD_NAME6', 0, 'LINES_READ');
INSERT INTO `r_trans_attribute` VALUES (4597, 3, 0, 'PERFORMANCE_LOG_TABLE_FIELD_ENABLED6', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (4598, 3, 0, 'PERFORMANCE_LOG_TABLE_FIELD_ID7', 0, 'LINES_WRITTEN');
INSERT INTO `r_trans_attribute` VALUES (4599, 3, 0, 'PERFORMANCE_LOG_TABLE_FIELD_NAME7', 0, 'LINES_WRITTEN');
INSERT INTO `r_trans_attribute` VALUES (4600, 3, 0, 'PERFORMANCE_LOG_TABLE_FIELD_ENABLED7', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (4601, 3, 0, 'PERFORMANCE_LOG_TABLE_FIELD_ID8', 0, 'LINES_UPDATED');
INSERT INTO `r_trans_attribute` VALUES (4602, 3, 0, 'PERFORMANCE_LOG_TABLE_FIELD_NAME8', 0, 'LINES_UPDATED');
INSERT INTO `r_trans_attribute` VALUES (4603, 3, 0, 'PERFORMANCE_LOG_TABLE_FIELD_ENABLED8', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (4604, 3, 0, 'PERFORMANCE_LOG_TABLE_FIELD_ID9', 0, 'LINES_INPUT');
INSERT INTO `r_trans_attribute` VALUES (4605, 3, 0, 'PERFORMANCE_LOG_TABLE_FIELD_NAME9', 0, 'LINES_INPUT');
INSERT INTO `r_trans_attribute` VALUES (4606, 3, 0, 'PERFORMANCE_LOG_TABLE_FIELD_ENABLED9', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (4607, 3, 0, 'PERFORMANCE_LOG_TABLE_FIELD_ID10', 0, 'LINES_OUTPUT');
INSERT INTO `r_trans_attribute` VALUES (4608, 3, 0, 'PERFORMANCE_LOG_TABLE_FIELD_NAME10', 0, 'LINES_OUTPUT');
INSERT INTO `r_trans_attribute` VALUES (4609, 3, 0, 'PERFORMANCE_LOG_TABLE_FIELD_ENABLED10', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (4610, 3, 0, 'PERFORMANCE_LOG_TABLE_FIELD_ID11', 0, 'LINES_REJECTED');
INSERT INTO `r_trans_attribute` VALUES (4611, 3, 0, 'PERFORMANCE_LOG_TABLE_FIELD_NAME11', 0, 'LINES_REJECTED');
INSERT INTO `r_trans_attribute` VALUES (4612, 3, 0, 'PERFORMANCE_LOG_TABLE_FIELD_ENABLED11', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (4613, 3, 0, 'PERFORMANCE_LOG_TABLE_FIELD_ID12', 0, 'ERRORS');
INSERT INTO `r_trans_attribute` VALUES (4614, 3, 0, 'PERFORMANCE_LOG_TABLE_FIELD_NAME12', 0, 'ERRORS');
INSERT INTO `r_trans_attribute` VALUES (4615, 3, 0, 'PERFORMANCE_LOG_TABLE_FIELD_ENABLED12', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (4616, 3, 0, 'PERFORMANCE_LOG_TABLE_FIELD_ID13', 0, 'INPUT_BUFFER_ROWS');
INSERT INTO `r_trans_attribute` VALUES (4617, 3, 0, 'PERFORMANCE_LOG_TABLE_FIELD_NAME13', 0, 'INPUT_BUFFER_ROWS');
INSERT INTO `r_trans_attribute` VALUES (4618, 3, 0, 'PERFORMANCE_LOG_TABLE_FIELD_ENABLED13', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (4619, 3, 0, 'PERFORMANCE_LOG_TABLE_FIELD_ID14', 0, 'OUTPUT_BUFFER_ROWS');
INSERT INTO `r_trans_attribute` VALUES (4620, 3, 0, 'PERFORMANCE_LOG_TABLE_FIELD_NAME14', 0, 'OUTPUT_BUFFER_ROWS');
INSERT INTO `r_trans_attribute` VALUES (4621, 3, 0, 'PERFORMANCE_LOG_TABLE_FIELD_ENABLED14', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (4622, 3, 0, 'PERFORMANCELOG_TABLE_INTERVAL', 0, NULL);
INSERT INTO `r_trans_attribute` VALUES (4623, 3, 0, 'CHANNEL_LOG_TABLE_CONNECTION_NAME', 0, NULL);
INSERT INTO `r_trans_attribute` VALUES (4624, 3, 0, 'CHANNEL_LOG_TABLE_SCHEMA_NAME', 0, NULL);
INSERT INTO `r_trans_attribute` VALUES (4625, 3, 0, 'CHANNEL_LOG_TABLE_TABLE_NAME', 0, NULL);
INSERT INTO `r_trans_attribute` VALUES (4626, 3, 0, 'CHANNEL_LOG_TABLE_TIMEOUT_IN_DAYS', 0, NULL);
INSERT INTO `r_trans_attribute` VALUES (4627, 3, 0, 'CHANNEL_LOG_TABLE_FIELD_ID0', 0, 'ID_BATCH');
INSERT INTO `r_trans_attribute` VALUES (4628, 3, 0, 'CHANNEL_LOG_TABLE_FIELD_NAME0', 0, 'ID_BATCH');
INSERT INTO `r_trans_attribute` VALUES (4629, 3, 0, 'CHANNEL_LOG_TABLE_FIELD_ENABLED0', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (4630, 3, 0, 'CHANNEL_LOG_TABLE_FIELD_ID1', 0, 'CHANNEL_ID');
INSERT INTO `r_trans_attribute` VALUES (4631, 3, 0, 'CHANNEL_LOG_TABLE_FIELD_NAME1', 0, 'CHANNEL_ID');
INSERT INTO `r_trans_attribute` VALUES (4632, 3, 0, 'CHANNEL_LOG_TABLE_FIELD_ENABLED1', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (4633, 3, 0, 'CHANNEL_LOG_TABLE_FIELD_ID2', 0, 'LOG_DATE');
INSERT INTO `r_trans_attribute` VALUES (4634, 3, 0, 'CHANNEL_LOG_TABLE_FIELD_NAME2', 0, 'LOG_DATE');
INSERT INTO `r_trans_attribute` VALUES (4635, 3, 0, 'CHANNEL_LOG_TABLE_FIELD_ENABLED2', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (4636, 3, 0, 'CHANNEL_LOG_TABLE_FIELD_ID3', 0, 'LOGGING_OBJECT_TYPE');
INSERT INTO `r_trans_attribute` VALUES (4637, 3, 0, 'CHANNEL_LOG_TABLE_FIELD_NAME3', 0, 'LOGGING_OBJECT_TYPE');
INSERT INTO `r_trans_attribute` VALUES (4638, 3, 0, 'CHANNEL_LOG_TABLE_FIELD_ENABLED3', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (4639, 3, 0, 'CHANNEL_LOG_TABLE_FIELD_ID4', 0, 'OBJECT_NAME');
INSERT INTO `r_trans_attribute` VALUES (4640, 3, 0, 'CHANNEL_LOG_TABLE_FIELD_NAME4', 0, 'OBJECT_NAME');
INSERT INTO `r_trans_attribute` VALUES (4641, 3, 0, 'CHANNEL_LOG_TABLE_FIELD_ENABLED4', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (4642, 3, 0, 'CHANNEL_LOG_TABLE_FIELD_ID5', 0, 'OBJECT_COPY');
INSERT INTO `r_trans_attribute` VALUES (4643, 3, 0, 'CHANNEL_LOG_TABLE_FIELD_NAME5', 0, 'OBJECT_COPY');
INSERT INTO `r_trans_attribute` VALUES (4644, 3, 0, 'CHANNEL_LOG_TABLE_FIELD_ENABLED5', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (4645, 3, 0, 'CHANNEL_LOG_TABLE_FIELD_ID6', 0, 'REPOSITORY_DIRECTORY');
INSERT INTO `r_trans_attribute` VALUES (4646, 3, 0, 'CHANNEL_LOG_TABLE_FIELD_NAME6', 0, 'REPOSITORY_DIRECTORY');
INSERT INTO `r_trans_attribute` VALUES (4647, 3, 0, 'CHANNEL_LOG_TABLE_FIELD_ENABLED6', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (4648, 3, 0, 'CHANNEL_LOG_TABLE_FIELD_ID7', 0, 'FILENAME');
INSERT INTO `r_trans_attribute` VALUES (4649, 3, 0, 'CHANNEL_LOG_TABLE_FIELD_NAME7', 0, 'FILENAME');
INSERT INTO `r_trans_attribute` VALUES (4650, 3, 0, 'CHANNEL_LOG_TABLE_FIELD_ENABLED7', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (4651, 3, 0, 'CHANNEL_LOG_TABLE_FIELD_ID8', 0, 'OBJECT_ID');
INSERT INTO `r_trans_attribute` VALUES (4652, 3, 0, 'CHANNEL_LOG_TABLE_FIELD_NAME8', 0, 'OBJECT_ID');
INSERT INTO `r_trans_attribute` VALUES (4653, 3, 0, 'CHANNEL_LOG_TABLE_FIELD_ENABLED8', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (4654, 3, 0, 'CHANNEL_LOG_TABLE_FIELD_ID9', 0, 'OBJECT_REVISION');
INSERT INTO `r_trans_attribute` VALUES (4655, 3, 0, 'CHANNEL_LOG_TABLE_FIELD_NAME9', 0, 'OBJECT_REVISION');
INSERT INTO `r_trans_attribute` VALUES (4656, 3, 0, 'CHANNEL_LOG_TABLE_FIELD_ENABLED9', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (4657, 3, 0, 'CHANNEL_LOG_TABLE_FIELD_ID10', 0, 'PARENT_CHANNEL_ID');
INSERT INTO `r_trans_attribute` VALUES (4658, 3, 0, 'CHANNEL_LOG_TABLE_FIELD_NAME10', 0, 'PARENT_CHANNEL_ID');
INSERT INTO `r_trans_attribute` VALUES (4659, 3, 0, 'CHANNEL_LOG_TABLE_FIELD_ENABLED10', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (4660, 3, 0, 'CHANNEL_LOG_TABLE_FIELD_ID11', 0, 'ROOT_CHANNEL_ID');
INSERT INTO `r_trans_attribute` VALUES (4661, 3, 0, 'CHANNEL_LOG_TABLE_FIELD_NAME11', 0, 'ROOT_CHANNEL_ID');
INSERT INTO `r_trans_attribute` VALUES (4662, 3, 0, 'CHANNEL_LOG_TABLE_FIELD_ENABLED11', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (4663, 1, 0, 'UNIQUE_CONNECTIONS', 0, 'N');
INSERT INTO `r_trans_attribute` VALUES (4664, 1, 0, 'FEEDBACK_SHOWN', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (4665, 1, 0, 'FEEDBACK_SIZE', 50000, NULL);
INSERT INTO `r_trans_attribute` VALUES (4666, 1, 0, 'USING_THREAD_PRIORITIES', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (4667, 1, 0, 'SHARED_FILE', 0, NULL);
INSERT INTO `r_trans_attribute` VALUES (4668, 1, 0, 'CAPTURE_STEP_PERFORMANCE', 0, 'N');
INSERT INTO `r_trans_attribute` VALUES (4669, 1, 0, 'STEP_PERFORMANCE_CAPTURING_DELAY', 1000, NULL);
INSERT INTO `r_trans_attribute` VALUES (4670, 1, 0, 'STEP_PERFORMANCE_CAPTURING_SIZE_LIMIT', 0, '100');
INSERT INTO `r_trans_attribute` VALUES (4671, 1, 0, 'STEP_PERFORMANCE_LOG_TABLE', 0, NULL);
INSERT INTO `r_trans_attribute` VALUES (4672, 1, 0, 'LOG_SIZE_LIMIT', 0, NULL);
INSERT INTO `r_trans_attribute` VALUES (4673, 1, 0, 'LOG_INTERVAL', 0, NULL);
INSERT INTO `r_trans_attribute` VALUES (4674, 1, 0, 'TRANSFORMATION_TYPE', 0, 'Normal');
INSERT INTO `r_trans_attribute` VALUES (4675, 1, 0, 'SLEEP_TIME_EMPTY', 50, NULL);
INSERT INTO `r_trans_attribute` VALUES (4676, 1, 0, 'SLEEP_TIME_FULL', 50, NULL);
INSERT INTO `r_trans_attribute` VALUES (4677, 1, 0, 'TRANS_LOG_TABLE_CONNECTION_NAME', 0, NULL);
INSERT INTO `r_trans_attribute` VALUES (4678, 1, 0, 'TRANS_LOG_TABLE_SCHEMA_NAME', 0, NULL);
INSERT INTO `r_trans_attribute` VALUES (4679, 1, 0, 'TRANS_LOG_TABLE_TABLE_NAME', 0, NULL);
INSERT INTO `r_trans_attribute` VALUES (4680, 1, 0, 'TRANS_LOG_TABLE_TIMEOUT_IN_DAYS', 0, NULL);
INSERT INTO `r_trans_attribute` VALUES (4681, 1, 0, 'TRANS_LOG_TABLE_FIELD_ID0', 0, 'ID_BATCH');
INSERT INTO `r_trans_attribute` VALUES (4682, 1, 0, 'TRANS_LOG_TABLE_FIELD_NAME0', 0, 'ID_BATCH');
INSERT INTO `r_trans_attribute` VALUES (4683, 1, 0, 'TRANS_LOG_TABLE_FIELD_ENABLED0', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (4684, 1, 0, 'TRANS_LOG_TABLE_FIELD_ID1', 0, 'CHANNEL_ID');
INSERT INTO `r_trans_attribute` VALUES (4685, 1, 0, 'TRANS_LOG_TABLE_FIELD_NAME1', 0, 'CHANNEL_ID');
INSERT INTO `r_trans_attribute` VALUES (4686, 1, 0, 'TRANS_LOG_TABLE_FIELD_ENABLED1', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (4687, 1, 0, 'TRANS_LOG_TABLE_FIELD_ID2', 0, 'TRANSNAME');
INSERT INTO `r_trans_attribute` VALUES (4688, 1, 0, 'TRANS_LOG_TABLE_FIELD_NAME2', 0, 'TRANSNAME');
INSERT INTO `r_trans_attribute` VALUES (4689, 1, 0, 'TRANS_LOG_TABLE_FIELD_ENABLED2', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (4690, 1, 0, 'TRANS_LOG_TABLE_FIELD_ID3', 0, 'STATUS');
INSERT INTO `r_trans_attribute` VALUES (4691, 1, 0, 'TRANS_LOG_TABLE_FIELD_NAME3', 0, 'STATUS');
INSERT INTO `r_trans_attribute` VALUES (4692, 1, 0, 'TRANS_LOG_TABLE_FIELD_ENABLED3', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (4693, 1, 0, 'TRANS_LOG_TABLE_FIELD_ID4', 0, 'LINES_READ');
INSERT INTO `r_trans_attribute` VALUES (4694, 1, 0, 'TRANS_LOG_TABLE_FIELD_NAME4', 0, 'LINES_READ');
INSERT INTO `r_trans_attribute` VALUES (4695, 1, 0, 'TRANS_LOG_TABLE_FIELD_ENABLED4', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (4696, 1, 0, 'TRANS_LOG_TABLE_FIELD_SUBJECT4', 0, NULL);
INSERT INTO `r_trans_attribute` VALUES (4697, 1, 0, 'TRANS_LOG_TABLE_FIELD_ID5', 0, 'LINES_WRITTEN');
INSERT INTO `r_trans_attribute` VALUES (4698, 1, 0, 'TRANS_LOG_TABLE_FIELD_NAME5', 0, 'LINES_WRITTEN');
INSERT INTO `r_trans_attribute` VALUES (4699, 1, 0, 'TRANS_LOG_TABLE_FIELD_ENABLED5', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (4700, 1, 0, 'TRANS_LOG_TABLE_FIELD_SUBJECT5', 0, NULL);
INSERT INTO `r_trans_attribute` VALUES (4701, 1, 0, 'TRANS_LOG_TABLE_FIELD_ID6', 0, 'LINES_UPDATED');
INSERT INTO `r_trans_attribute` VALUES (4702, 1, 0, 'TRANS_LOG_TABLE_FIELD_NAME6', 0, 'LINES_UPDATED');
INSERT INTO `r_trans_attribute` VALUES (4703, 1, 0, 'TRANS_LOG_TABLE_FIELD_ENABLED6', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (4704, 1, 0, 'TRANS_LOG_TABLE_FIELD_SUBJECT6', 0, NULL);
INSERT INTO `r_trans_attribute` VALUES (4705, 1, 0, 'TRANS_LOG_TABLE_FIELD_ID7', 0, 'LINES_INPUT');
INSERT INTO `r_trans_attribute` VALUES (4706, 1, 0, 'TRANS_LOG_TABLE_FIELD_NAME7', 0, 'LINES_INPUT');
INSERT INTO `r_trans_attribute` VALUES (4707, 1, 0, 'TRANS_LOG_TABLE_FIELD_ENABLED7', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (4708, 1, 0, 'TRANS_LOG_TABLE_FIELD_SUBJECT7', 0, NULL);
INSERT INTO `r_trans_attribute` VALUES (4709, 1, 0, 'TRANS_LOG_TABLE_FIELD_ID8', 0, 'LINES_OUTPUT');
INSERT INTO `r_trans_attribute` VALUES (4710, 1, 0, 'TRANS_LOG_TABLE_FIELD_NAME8', 0, 'LINES_OUTPUT');
INSERT INTO `r_trans_attribute` VALUES (4711, 1, 0, 'TRANS_LOG_TABLE_FIELD_ENABLED8', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (4712, 1, 0, 'TRANS_LOG_TABLE_FIELD_SUBJECT8', 0, NULL);
INSERT INTO `r_trans_attribute` VALUES (4713, 1, 0, 'TRANS_LOG_TABLE_FIELD_ID9', 0, 'LINES_REJECTED');
INSERT INTO `r_trans_attribute` VALUES (4714, 1, 0, 'TRANS_LOG_TABLE_FIELD_NAME9', 0, 'LINES_REJECTED');
INSERT INTO `r_trans_attribute` VALUES (4715, 1, 0, 'TRANS_LOG_TABLE_FIELD_ENABLED9', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (4716, 1, 0, 'TRANS_LOG_TABLE_FIELD_SUBJECT9', 0, NULL);
INSERT INTO `r_trans_attribute` VALUES (4717, 1, 0, 'TRANS_LOG_TABLE_FIELD_ID10', 0, 'ERRORS');
INSERT INTO `r_trans_attribute` VALUES (4718, 1, 0, 'TRANS_LOG_TABLE_FIELD_NAME10', 0, 'ERRORS');
INSERT INTO `r_trans_attribute` VALUES (4719, 1, 0, 'TRANS_LOG_TABLE_FIELD_ENABLED10', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (4720, 1, 0, 'TRANS_LOG_TABLE_FIELD_ID11', 0, 'STARTDATE');
INSERT INTO `r_trans_attribute` VALUES (4721, 1, 0, 'TRANS_LOG_TABLE_FIELD_NAME11', 0, 'STARTDATE');
INSERT INTO `r_trans_attribute` VALUES (4722, 1, 0, 'TRANS_LOG_TABLE_FIELD_ENABLED11', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (4723, 1, 0, 'TRANS_LOG_TABLE_FIELD_ID12', 0, 'ENDDATE');
INSERT INTO `r_trans_attribute` VALUES (4724, 1, 0, 'TRANS_LOG_TABLE_FIELD_NAME12', 0, 'ENDDATE');
INSERT INTO `r_trans_attribute` VALUES (4725, 1, 0, 'TRANS_LOG_TABLE_FIELD_ENABLED12', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (4726, 1, 0, 'TRANS_LOG_TABLE_FIELD_ID13', 0, 'LOGDATE');
INSERT INTO `r_trans_attribute` VALUES (4727, 1, 0, 'TRANS_LOG_TABLE_FIELD_NAME13', 0, 'LOGDATE');
INSERT INTO `r_trans_attribute` VALUES (4728, 1, 0, 'TRANS_LOG_TABLE_FIELD_ENABLED13', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (4729, 1, 0, 'TRANS_LOG_TABLE_FIELD_ID14', 0, 'DEPDATE');
INSERT INTO `r_trans_attribute` VALUES (4730, 1, 0, 'TRANS_LOG_TABLE_FIELD_NAME14', 0, 'DEPDATE');
INSERT INTO `r_trans_attribute` VALUES (4731, 1, 0, 'TRANS_LOG_TABLE_FIELD_ENABLED14', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (4732, 1, 0, 'TRANS_LOG_TABLE_FIELD_ID15', 0, 'REPLAYDATE');
INSERT INTO `r_trans_attribute` VALUES (4733, 1, 0, 'TRANS_LOG_TABLE_FIELD_NAME15', 0, 'REPLAYDATE');
INSERT INTO `r_trans_attribute` VALUES (4734, 1, 0, 'TRANS_LOG_TABLE_FIELD_ENABLED15', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (4735, 1, 0, 'TRANS_LOG_TABLE_FIELD_ID16', 0, 'LOG_FIELD');
INSERT INTO `r_trans_attribute` VALUES (4736, 1, 0, 'TRANS_LOG_TABLE_FIELD_NAME16', 0, 'LOG_FIELD');
INSERT INTO `r_trans_attribute` VALUES (4737, 1, 0, 'TRANS_LOG_TABLE_FIELD_ENABLED16', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (4738, 1, 0, 'TRANS_LOG_TABLE_FIELD_ID17', 0, 'EXECUTING_SERVER');
INSERT INTO `r_trans_attribute` VALUES (4739, 1, 0, 'TRANS_LOG_TABLE_FIELD_NAME17', 0, 'EXECUTING_SERVER');
INSERT INTO `r_trans_attribute` VALUES (4740, 1, 0, 'TRANS_LOG_TABLE_FIELD_ENABLED17', 0, 'N');
INSERT INTO `r_trans_attribute` VALUES (4741, 1, 0, 'TRANS_LOG_TABLE_FIELD_ID18', 0, 'EXECUTING_USER');
INSERT INTO `r_trans_attribute` VALUES (4742, 1, 0, 'TRANS_LOG_TABLE_FIELD_NAME18', 0, 'EXECUTING_USER');
INSERT INTO `r_trans_attribute` VALUES (4743, 1, 0, 'TRANS_LOG_TABLE_FIELD_ENABLED18', 0, 'N');
INSERT INTO `r_trans_attribute` VALUES (4744, 1, 0, 'TRANS_LOG_TABLE_FIELD_ID19', 0, 'CLIENT');
INSERT INTO `r_trans_attribute` VALUES (4745, 1, 0, 'TRANS_LOG_TABLE_FIELD_NAME19', 0, 'CLIENT');
INSERT INTO `r_trans_attribute` VALUES (4746, 1, 0, 'TRANS_LOG_TABLE_FIELD_ENABLED19', 0, 'N');
INSERT INTO `r_trans_attribute` VALUES (4747, 1, 0, 'TRANSLOG_TABLE_INTERVAL', 0, NULL);
INSERT INTO `r_trans_attribute` VALUES (4748, 1, 0, 'TRANSLOG_TABLE_SIZE_LIMIT', 0, NULL);
INSERT INTO `r_trans_attribute` VALUES (4749, 1, 0, 'STEP_LOG_TABLE_CONNECTION_NAME', 0, NULL);
INSERT INTO `r_trans_attribute` VALUES (4750, 1, 0, 'STEP_LOG_TABLE_SCHEMA_NAME', 0, NULL);
INSERT INTO `r_trans_attribute` VALUES (4751, 1, 0, 'STEP_LOG_TABLE_TABLE_NAME', 0, NULL);
INSERT INTO `r_trans_attribute` VALUES (4752, 1, 0, 'STEP_LOG_TABLE_TIMEOUT_IN_DAYS', 0, NULL);
INSERT INTO `r_trans_attribute` VALUES (4753, 1, 0, 'STEP_LOG_TABLE_FIELD_ID0', 0, 'ID_BATCH');
INSERT INTO `r_trans_attribute` VALUES (4754, 1, 0, 'STEP_LOG_TABLE_FIELD_NAME0', 0, 'ID_BATCH');
INSERT INTO `r_trans_attribute` VALUES (4755, 1, 0, 'STEP_LOG_TABLE_FIELD_ENABLED0', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (4756, 1, 0, 'STEP_LOG_TABLE_FIELD_ID1', 0, 'CHANNEL_ID');
INSERT INTO `r_trans_attribute` VALUES (4757, 1, 0, 'STEP_LOG_TABLE_FIELD_NAME1', 0, 'CHANNEL_ID');
INSERT INTO `r_trans_attribute` VALUES (4758, 1, 0, 'STEP_LOG_TABLE_FIELD_ENABLED1', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (4759, 1, 0, 'STEP_LOG_TABLE_FIELD_ID2', 0, 'LOG_DATE');
INSERT INTO `r_trans_attribute` VALUES (4760, 1, 0, 'STEP_LOG_TABLE_FIELD_NAME2', 0, 'LOG_DATE');
INSERT INTO `r_trans_attribute` VALUES (4761, 1, 0, 'STEP_LOG_TABLE_FIELD_ENABLED2', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (4762, 1, 0, 'STEP_LOG_TABLE_FIELD_ID3', 0, 'TRANSNAME');
INSERT INTO `r_trans_attribute` VALUES (4763, 1, 0, 'STEP_LOG_TABLE_FIELD_NAME3', 0, 'TRANSNAME');
INSERT INTO `r_trans_attribute` VALUES (4764, 1, 0, 'STEP_LOG_TABLE_FIELD_ENABLED3', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (4765, 1, 0, 'STEP_LOG_TABLE_FIELD_ID4', 0, 'STEPNAME');
INSERT INTO `r_trans_attribute` VALUES (4766, 1, 0, 'STEP_LOG_TABLE_FIELD_NAME4', 0, 'STEPNAME');
INSERT INTO `r_trans_attribute` VALUES (4767, 1, 0, 'STEP_LOG_TABLE_FIELD_ENABLED4', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (4768, 1, 0, 'STEP_LOG_TABLE_FIELD_ID5', 0, 'STEP_COPY');
INSERT INTO `r_trans_attribute` VALUES (4769, 1, 0, 'STEP_LOG_TABLE_FIELD_NAME5', 0, 'STEP_COPY');
INSERT INTO `r_trans_attribute` VALUES (4770, 1, 0, 'STEP_LOG_TABLE_FIELD_ENABLED5', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (4771, 1, 0, 'STEP_LOG_TABLE_FIELD_ID6', 0, 'LINES_READ');
INSERT INTO `r_trans_attribute` VALUES (4772, 1, 0, 'STEP_LOG_TABLE_FIELD_NAME6', 0, 'LINES_READ');
INSERT INTO `r_trans_attribute` VALUES (4773, 1, 0, 'STEP_LOG_TABLE_FIELD_ENABLED6', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (4774, 1, 0, 'STEP_LOG_TABLE_FIELD_ID7', 0, 'LINES_WRITTEN');
INSERT INTO `r_trans_attribute` VALUES (4775, 1, 0, 'STEP_LOG_TABLE_FIELD_NAME7', 0, 'LINES_WRITTEN');
INSERT INTO `r_trans_attribute` VALUES (4776, 1, 0, 'STEP_LOG_TABLE_FIELD_ENABLED7', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (4777, 1, 0, 'STEP_LOG_TABLE_FIELD_ID8', 0, 'LINES_UPDATED');
INSERT INTO `r_trans_attribute` VALUES (4778, 1, 0, 'STEP_LOG_TABLE_FIELD_NAME8', 0, 'LINES_UPDATED');
INSERT INTO `r_trans_attribute` VALUES (4779, 1, 0, 'STEP_LOG_TABLE_FIELD_ENABLED8', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (4780, 1, 0, 'STEP_LOG_TABLE_FIELD_ID9', 0, 'LINES_INPUT');
INSERT INTO `r_trans_attribute` VALUES (4781, 1, 0, 'STEP_LOG_TABLE_FIELD_NAME9', 0, 'LINES_INPUT');
INSERT INTO `r_trans_attribute` VALUES (4782, 1, 0, 'STEP_LOG_TABLE_FIELD_ENABLED9', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (4783, 1, 0, 'STEP_LOG_TABLE_FIELD_ID10', 0, 'LINES_OUTPUT');
INSERT INTO `r_trans_attribute` VALUES (4784, 1, 0, 'STEP_LOG_TABLE_FIELD_NAME10', 0, 'LINES_OUTPUT');
INSERT INTO `r_trans_attribute` VALUES (4785, 1, 0, 'STEP_LOG_TABLE_FIELD_ENABLED10', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (4786, 1, 0, 'STEP_LOG_TABLE_FIELD_ID11', 0, 'LINES_REJECTED');
INSERT INTO `r_trans_attribute` VALUES (4787, 1, 0, 'STEP_LOG_TABLE_FIELD_NAME11', 0, 'LINES_REJECTED');
INSERT INTO `r_trans_attribute` VALUES (4788, 1, 0, 'STEP_LOG_TABLE_FIELD_ENABLED11', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (4789, 1, 0, 'STEP_LOG_TABLE_FIELD_ID12', 0, 'ERRORS');
INSERT INTO `r_trans_attribute` VALUES (4790, 1, 0, 'STEP_LOG_TABLE_FIELD_NAME12', 0, 'ERRORS');
INSERT INTO `r_trans_attribute` VALUES (4791, 1, 0, 'STEP_LOG_TABLE_FIELD_ENABLED12', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (4792, 1, 0, 'STEP_LOG_TABLE_FIELD_ID13', 0, 'LOG_FIELD');
INSERT INTO `r_trans_attribute` VALUES (4793, 1, 0, 'STEP_LOG_TABLE_FIELD_NAME13', 0, 'LOG_FIELD');
INSERT INTO `r_trans_attribute` VALUES (4794, 1, 0, 'STEP_LOG_TABLE_FIELD_ENABLED13', 0, 'N');
INSERT INTO `r_trans_attribute` VALUES (4795, 1, 0, 'PERFORMANCE_LOG_TABLE_CONNECTION_NAME', 0, NULL);
INSERT INTO `r_trans_attribute` VALUES (4796, 1, 0, 'PERFORMANCE_LOG_TABLE_SCHEMA_NAME', 0, NULL);
INSERT INTO `r_trans_attribute` VALUES (4797, 1, 0, 'PERFORMANCE_LOG_TABLE_TABLE_NAME', 0, NULL);
INSERT INTO `r_trans_attribute` VALUES (4798, 1, 0, 'PERFORMANCE_LOG_TABLE_TIMEOUT_IN_DAYS', 0, NULL);
INSERT INTO `r_trans_attribute` VALUES (4799, 1, 0, 'PERFORMANCE_LOG_TABLE_FIELD_ID0', 0, 'ID_BATCH');
INSERT INTO `r_trans_attribute` VALUES (4800, 1, 0, 'PERFORMANCE_LOG_TABLE_FIELD_NAME0', 0, 'ID_BATCH');
INSERT INTO `r_trans_attribute` VALUES (4801, 1, 0, 'PERFORMANCE_LOG_TABLE_FIELD_ENABLED0', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (4802, 1, 0, 'PERFORMANCE_LOG_TABLE_FIELD_ID1', 0, 'SEQ_NR');
INSERT INTO `r_trans_attribute` VALUES (4803, 1, 0, 'PERFORMANCE_LOG_TABLE_FIELD_NAME1', 0, 'SEQ_NR');
INSERT INTO `r_trans_attribute` VALUES (4804, 1, 0, 'PERFORMANCE_LOG_TABLE_FIELD_ENABLED1', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (4805, 1, 0, 'PERFORMANCE_LOG_TABLE_FIELD_ID2', 0, 'LOGDATE');
INSERT INTO `r_trans_attribute` VALUES (4806, 1, 0, 'PERFORMANCE_LOG_TABLE_FIELD_NAME2', 0, 'LOGDATE');
INSERT INTO `r_trans_attribute` VALUES (4807, 1, 0, 'PERFORMANCE_LOG_TABLE_FIELD_ENABLED2', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (4808, 1, 0, 'PERFORMANCE_LOG_TABLE_FIELD_ID3', 0, 'TRANSNAME');
INSERT INTO `r_trans_attribute` VALUES (4809, 1, 0, 'PERFORMANCE_LOG_TABLE_FIELD_NAME3', 0, 'TRANSNAME');
INSERT INTO `r_trans_attribute` VALUES (4810, 1, 0, 'PERFORMANCE_LOG_TABLE_FIELD_ENABLED3', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (4811, 1, 0, 'PERFORMANCE_LOG_TABLE_FIELD_ID4', 0, 'STEPNAME');
INSERT INTO `r_trans_attribute` VALUES (4812, 1, 0, 'PERFORMANCE_LOG_TABLE_FIELD_NAME4', 0, 'STEPNAME');
INSERT INTO `r_trans_attribute` VALUES (4813, 1, 0, 'PERFORMANCE_LOG_TABLE_FIELD_ENABLED4', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (4814, 1, 0, 'PERFORMANCE_LOG_TABLE_FIELD_ID5', 0, 'STEP_COPY');
INSERT INTO `r_trans_attribute` VALUES (4815, 1, 0, 'PERFORMANCE_LOG_TABLE_FIELD_NAME5', 0, 'STEP_COPY');
INSERT INTO `r_trans_attribute` VALUES (4816, 1, 0, 'PERFORMANCE_LOG_TABLE_FIELD_ENABLED5', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (4817, 1, 0, 'PERFORMANCE_LOG_TABLE_FIELD_ID6', 0, 'LINES_READ');
INSERT INTO `r_trans_attribute` VALUES (4818, 1, 0, 'PERFORMANCE_LOG_TABLE_FIELD_NAME6', 0, 'LINES_READ');
INSERT INTO `r_trans_attribute` VALUES (4819, 1, 0, 'PERFORMANCE_LOG_TABLE_FIELD_ENABLED6', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (4820, 1, 0, 'PERFORMANCE_LOG_TABLE_FIELD_ID7', 0, 'LINES_WRITTEN');
INSERT INTO `r_trans_attribute` VALUES (4821, 1, 0, 'PERFORMANCE_LOG_TABLE_FIELD_NAME7', 0, 'LINES_WRITTEN');
INSERT INTO `r_trans_attribute` VALUES (4822, 1, 0, 'PERFORMANCE_LOG_TABLE_FIELD_ENABLED7', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (4823, 1, 0, 'PERFORMANCE_LOG_TABLE_FIELD_ID8', 0, 'LINES_UPDATED');
INSERT INTO `r_trans_attribute` VALUES (4824, 1, 0, 'PERFORMANCE_LOG_TABLE_FIELD_NAME8', 0, 'LINES_UPDATED');
INSERT INTO `r_trans_attribute` VALUES (4825, 1, 0, 'PERFORMANCE_LOG_TABLE_FIELD_ENABLED8', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (4826, 1, 0, 'PERFORMANCE_LOG_TABLE_FIELD_ID9', 0, 'LINES_INPUT');
INSERT INTO `r_trans_attribute` VALUES (4827, 1, 0, 'PERFORMANCE_LOG_TABLE_FIELD_NAME9', 0, 'LINES_INPUT');
INSERT INTO `r_trans_attribute` VALUES (4828, 1, 0, 'PERFORMANCE_LOG_TABLE_FIELD_ENABLED9', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (4829, 1, 0, 'PERFORMANCE_LOG_TABLE_FIELD_ID10', 0, 'LINES_OUTPUT');
INSERT INTO `r_trans_attribute` VALUES (4830, 1, 0, 'PERFORMANCE_LOG_TABLE_FIELD_NAME10', 0, 'LINES_OUTPUT');
INSERT INTO `r_trans_attribute` VALUES (4831, 1, 0, 'PERFORMANCE_LOG_TABLE_FIELD_ENABLED10', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (4832, 1, 0, 'PERFORMANCE_LOG_TABLE_FIELD_ID11', 0, 'LINES_REJECTED');
INSERT INTO `r_trans_attribute` VALUES (4833, 1, 0, 'PERFORMANCE_LOG_TABLE_FIELD_NAME11', 0, 'LINES_REJECTED');
INSERT INTO `r_trans_attribute` VALUES (4834, 1, 0, 'PERFORMANCE_LOG_TABLE_FIELD_ENABLED11', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (4835, 1, 0, 'PERFORMANCE_LOG_TABLE_FIELD_ID12', 0, 'ERRORS');
INSERT INTO `r_trans_attribute` VALUES (4836, 1, 0, 'PERFORMANCE_LOG_TABLE_FIELD_NAME12', 0, 'ERRORS');
INSERT INTO `r_trans_attribute` VALUES (4837, 1, 0, 'PERFORMANCE_LOG_TABLE_FIELD_ENABLED12', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (4838, 1, 0, 'PERFORMANCE_LOG_TABLE_FIELD_ID13', 0, 'INPUT_BUFFER_ROWS');
INSERT INTO `r_trans_attribute` VALUES (4839, 1, 0, 'PERFORMANCE_LOG_TABLE_FIELD_NAME13', 0, 'INPUT_BUFFER_ROWS');
INSERT INTO `r_trans_attribute` VALUES (4840, 1, 0, 'PERFORMANCE_LOG_TABLE_FIELD_ENABLED13', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (4841, 1, 0, 'PERFORMANCE_LOG_TABLE_FIELD_ID14', 0, 'OUTPUT_BUFFER_ROWS');
INSERT INTO `r_trans_attribute` VALUES (4842, 1, 0, 'PERFORMANCE_LOG_TABLE_FIELD_NAME14', 0, 'OUTPUT_BUFFER_ROWS');
INSERT INTO `r_trans_attribute` VALUES (4843, 1, 0, 'PERFORMANCE_LOG_TABLE_FIELD_ENABLED14', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (4844, 1, 0, 'PERFORMANCELOG_TABLE_INTERVAL', 0, NULL);
INSERT INTO `r_trans_attribute` VALUES (4845, 1, 0, 'CHANNEL_LOG_TABLE_CONNECTION_NAME', 0, NULL);
INSERT INTO `r_trans_attribute` VALUES (4846, 1, 0, 'CHANNEL_LOG_TABLE_SCHEMA_NAME', 0, NULL);
INSERT INTO `r_trans_attribute` VALUES (4847, 1, 0, 'CHANNEL_LOG_TABLE_TABLE_NAME', 0, NULL);
INSERT INTO `r_trans_attribute` VALUES (4848, 1, 0, 'CHANNEL_LOG_TABLE_TIMEOUT_IN_DAYS', 0, NULL);
INSERT INTO `r_trans_attribute` VALUES (4849, 1, 0, 'CHANNEL_LOG_TABLE_FIELD_ID0', 0, 'ID_BATCH');
INSERT INTO `r_trans_attribute` VALUES (4850, 1, 0, 'CHANNEL_LOG_TABLE_FIELD_NAME0', 0, 'ID_BATCH');
INSERT INTO `r_trans_attribute` VALUES (4851, 1, 0, 'CHANNEL_LOG_TABLE_FIELD_ENABLED0', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (4852, 1, 0, 'CHANNEL_LOG_TABLE_FIELD_ID1', 0, 'CHANNEL_ID');
INSERT INTO `r_trans_attribute` VALUES (4853, 1, 0, 'CHANNEL_LOG_TABLE_FIELD_NAME1', 0, 'CHANNEL_ID');
INSERT INTO `r_trans_attribute` VALUES (4854, 1, 0, 'CHANNEL_LOG_TABLE_FIELD_ENABLED1', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (4855, 1, 0, 'CHANNEL_LOG_TABLE_FIELD_ID2', 0, 'LOG_DATE');
INSERT INTO `r_trans_attribute` VALUES (4856, 1, 0, 'CHANNEL_LOG_TABLE_FIELD_NAME2', 0, 'LOG_DATE');
INSERT INTO `r_trans_attribute` VALUES (4857, 1, 0, 'CHANNEL_LOG_TABLE_FIELD_ENABLED2', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (4858, 1, 0, 'CHANNEL_LOG_TABLE_FIELD_ID3', 0, 'LOGGING_OBJECT_TYPE');
INSERT INTO `r_trans_attribute` VALUES (4859, 1, 0, 'CHANNEL_LOG_TABLE_FIELD_NAME3', 0, 'LOGGING_OBJECT_TYPE');
INSERT INTO `r_trans_attribute` VALUES (4860, 1, 0, 'CHANNEL_LOG_TABLE_FIELD_ENABLED3', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (4861, 1, 0, 'CHANNEL_LOG_TABLE_FIELD_ID4', 0, 'OBJECT_NAME');
INSERT INTO `r_trans_attribute` VALUES (4862, 1, 0, 'CHANNEL_LOG_TABLE_FIELD_NAME4', 0, 'OBJECT_NAME');
INSERT INTO `r_trans_attribute` VALUES (4863, 1, 0, 'CHANNEL_LOG_TABLE_FIELD_ENABLED4', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (4864, 1, 0, 'CHANNEL_LOG_TABLE_FIELD_ID5', 0, 'OBJECT_COPY');
INSERT INTO `r_trans_attribute` VALUES (4865, 1, 0, 'CHANNEL_LOG_TABLE_FIELD_NAME5', 0, 'OBJECT_COPY');
INSERT INTO `r_trans_attribute` VALUES (4866, 1, 0, 'CHANNEL_LOG_TABLE_FIELD_ENABLED5', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (4867, 1, 0, 'CHANNEL_LOG_TABLE_FIELD_ID6', 0, 'REPOSITORY_DIRECTORY');
INSERT INTO `r_trans_attribute` VALUES (4868, 1, 0, 'CHANNEL_LOG_TABLE_FIELD_NAME6', 0, 'REPOSITORY_DIRECTORY');
INSERT INTO `r_trans_attribute` VALUES (4869, 1, 0, 'CHANNEL_LOG_TABLE_FIELD_ENABLED6', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (4870, 1, 0, 'CHANNEL_LOG_TABLE_FIELD_ID7', 0, 'FILENAME');
INSERT INTO `r_trans_attribute` VALUES (4871, 1, 0, 'CHANNEL_LOG_TABLE_FIELD_NAME7', 0, 'FILENAME');
INSERT INTO `r_trans_attribute` VALUES (4872, 1, 0, 'CHANNEL_LOG_TABLE_FIELD_ENABLED7', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (4873, 1, 0, 'CHANNEL_LOG_TABLE_FIELD_ID8', 0, 'OBJECT_ID');
INSERT INTO `r_trans_attribute` VALUES (4874, 1, 0, 'CHANNEL_LOG_TABLE_FIELD_NAME8', 0, 'OBJECT_ID');
INSERT INTO `r_trans_attribute` VALUES (4875, 1, 0, 'CHANNEL_LOG_TABLE_FIELD_ENABLED8', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (4876, 1, 0, 'CHANNEL_LOG_TABLE_FIELD_ID9', 0, 'OBJECT_REVISION');
INSERT INTO `r_trans_attribute` VALUES (4877, 1, 0, 'CHANNEL_LOG_TABLE_FIELD_NAME9', 0, 'OBJECT_REVISION');
INSERT INTO `r_trans_attribute` VALUES (4878, 1, 0, 'CHANNEL_LOG_TABLE_FIELD_ENABLED9', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (4879, 1, 0, 'CHANNEL_LOG_TABLE_FIELD_ID10', 0, 'PARENT_CHANNEL_ID');
INSERT INTO `r_trans_attribute` VALUES (4880, 1, 0, 'CHANNEL_LOG_TABLE_FIELD_NAME10', 0, 'PARENT_CHANNEL_ID');
INSERT INTO `r_trans_attribute` VALUES (4881, 1, 0, 'CHANNEL_LOG_TABLE_FIELD_ENABLED10', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (4882, 1, 0, 'CHANNEL_LOG_TABLE_FIELD_ID11', 0, 'ROOT_CHANNEL_ID');
INSERT INTO `r_trans_attribute` VALUES (4883, 1, 0, 'CHANNEL_LOG_TABLE_FIELD_NAME11', 0, 'ROOT_CHANNEL_ID');
INSERT INTO `r_trans_attribute` VALUES (4884, 1, 0, 'CHANNEL_LOG_TABLE_FIELD_ENABLED11', 0, 'Y');

-- ----------------------------
-- Table structure for r_trans_cluster
-- ----------------------------
DROP TABLE IF EXISTS `r_trans_cluster`;
CREATE TABLE `r_trans_cluster`  (
  `ID_TRANS_CLUSTER` bigint(20) NOT NULL,
  `ID_TRANSFORMATION` int(11) NULL DEFAULT NULL,
  `ID_CLUSTER` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`ID_TRANS_CLUSTER`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for r_trans_hop
-- ----------------------------
DROP TABLE IF EXISTS `r_trans_hop`;
CREATE TABLE `r_trans_hop`  (
  `ID_TRANS_HOP` bigint(20) NOT NULL,
  `ID_TRANSFORMATION` int(11) NULL DEFAULT NULL,
  `ID_STEP_FROM` int(11) NULL DEFAULT NULL,
  `ID_STEP_TO` int(11) NULL DEFAULT NULL,
  `ENABLED` tinyint(1) NULL DEFAULT NULL,
  PRIMARY KEY (`ID_TRANS_HOP`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of r_trans_hop
-- ----------------------------
INSERT INTO `r_trans_hop` VALUES (76, 4, 87, 88, 1);
INSERT INTO `r_trans_hop` VALUES (77, 4, 88, 89, 1);
INSERT INTO `r_trans_hop` VALUES (85, 5, 99, 100, 1);
INSERT INTO `r_trans_hop` VALUES (86, 5, 101, 102, 1);
INSERT INTO `r_trans_hop` VALUES (87, 5, 102, 99, 1);
INSERT INTO `r_trans_hop` VALUES (95, 2, 111, 118, 1);
INSERT INTO `r_trans_hop` VALUES (96, 2, 112, 116, 1);
INSERT INTO `r_trans_hop` VALUES (97, 2, 113, 119, 1);
INSERT INTO `r_trans_hop` VALUES (98, 2, 114, 115, 1);
INSERT INTO `r_trans_hop` VALUES (99, 2, 115, 120, 1);
INSERT INTO `r_trans_hop` VALUES (100, 2, 116, 114, 1);
INSERT INTO `r_trans_hop` VALUES (101, 2, 117, 114, 1);
INSERT INTO `r_trans_hop` VALUES (102, 2, 119, 117, 1);
INSERT INTO `r_trans_hop` VALUES (103, 2, 120, 111, 1);
INSERT INTO `r_trans_hop` VALUES (108, 3, 126, 130, 1);
INSERT INTO `r_trans_hop` VALUES (109, 3, 127, 129, 1);
INSERT INTO `r_trans_hop` VALUES (110, 3, 128, 127, 1);
INSERT INTO `r_trans_hop` VALUES (111, 3, 129, 132, 1);
INSERT INTO `r_trans_hop` VALUES (112, 3, 130, 131, 0);
INSERT INTO `r_trans_hop` VALUES (113, 3, 132, 126, 1);
INSERT INTO `r_trans_hop` VALUES (114, 1, 134, 135, 1);
INSERT INTO `r_trans_hop` VALUES (115, 1, 135, 137, 1);
INSERT INTO `r_trans_hop` VALUES (116, 1, 137, 133, 1);
INSERT INTO `r_trans_hop` VALUES (117, 1, 133, 136, 1);

-- ----------------------------
-- Table structure for r_trans_lock
-- ----------------------------
DROP TABLE IF EXISTS `r_trans_lock`;
CREATE TABLE `r_trans_lock`  (
  `ID_TRANS_LOCK` bigint(20) NOT NULL,
  `ID_TRANSFORMATION` int(11) NULL DEFAULT NULL,
  `ID_USER` int(11) NULL DEFAULT NULL,
  `LOCK_MESSAGE` mediumtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `LOCK_DATE` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`ID_TRANS_LOCK`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for r_trans_note
-- ----------------------------
DROP TABLE IF EXISTS `r_trans_note`;
CREATE TABLE `r_trans_note`  (
  `ID_TRANSFORMATION` int(11) NULL DEFAULT NULL,
  `ID_NOTE` int(11) NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of r_trans_note
-- ----------------------------
INSERT INTO `r_trans_note` VALUES (4, 6);
INSERT INTO `r_trans_note` VALUES (5, 11);
INSERT INTO `r_trans_note` VALUES (2, 13);
INSERT INTO `r_trans_note` VALUES (3, 15);
INSERT INTO `r_trans_note` VALUES (1, 17);

-- ----------------------------
-- Table structure for r_trans_partition_schema
-- ----------------------------
DROP TABLE IF EXISTS `r_trans_partition_schema`;
CREATE TABLE `r_trans_partition_schema`  (
  `ID_TRANS_PARTITION_SCHEMA` bigint(20) NOT NULL,
  `ID_TRANSFORMATION` int(11) NULL DEFAULT NULL,
  `ID_PARTITION_SCHEMA` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`ID_TRANS_PARTITION_SCHEMA`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for r_trans_slave
-- ----------------------------
DROP TABLE IF EXISTS `r_trans_slave`;
CREATE TABLE `r_trans_slave`  (
  `ID_TRANS_SLAVE` bigint(20) NOT NULL,
  `ID_TRANSFORMATION` int(11) NULL DEFAULT NULL,
  `ID_SLAVE` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`ID_TRANS_SLAVE`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for r_trans_step_condition
-- ----------------------------
DROP TABLE IF EXISTS `r_trans_step_condition`;
CREATE TABLE `r_trans_step_condition`  (
  `ID_TRANSFORMATION` int(11) NULL DEFAULT NULL,
  `ID_STEP` int(11) NULL DEFAULT NULL,
  `ID_CONDITION` int(11) NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for r_transformation
-- ----------------------------
DROP TABLE IF EXISTS `r_transformation`;
CREATE TABLE `r_transformation`  (
  `ID_TRANSFORMATION` bigint(20) NOT NULL,
  `ID_DIRECTORY` int(11) NULL DEFAULT NULL,
  `NAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `DESCRIPTION` mediumtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `EXTENDED_DESCRIPTION` mediumtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `TRANS_VERSION` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `TRANS_STATUS` int(11) NULL DEFAULT NULL,
  `ID_STEP_READ` int(11) NULL DEFAULT NULL,
  `ID_STEP_WRITE` int(11) NULL DEFAULT NULL,
  `ID_STEP_INPUT` int(11) NULL DEFAULT NULL,
  `ID_STEP_OUTPUT` int(11) NULL DEFAULT NULL,
  `ID_STEP_UPDATE` int(11) NULL DEFAULT NULL,
  `ID_DATABASE_LOG` int(11) NULL DEFAULT NULL,
  `TABLE_NAME_LOG` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `USE_BATCHID` tinyint(1) NULL DEFAULT NULL,
  `USE_LOGFIELD` tinyint(1) NULL DEFAULT NULL,
  `ID_DATABASE_MAXDATE` int(11) NULL DEFAULT NULL,
  `TABLE_NAME_MAXDATE` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `FIELD_NAME_MAXDATE` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `OFFSET_MAXDATE` double NULL DEFAULT NULL,
  `DIFF_MAXDATE` double NULL DEFAULT NULL,
  `CREATED_USER` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CREATED_DATE` datetime NULL DEFAULT NULL,
  `MODIFIED_USER` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `MODIFIED_DATE` datetime NULL DEFAULT NULL,
  `SIZE_ROWSET` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`ID_TRANSFORMATION`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of r_transformation
-- ----------------------------
INSERT INTO `r_transformation` VALUES (1, 0, 'itec_report_budget', NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, -1, NULL, 1, 1, -1, NULL, NULL, 0, 0, '-', '2018-01-25 08:57:55', 'admin', '2018-01-30 20:02:07', 10000);
INSERT INTO `r_transformation` VALUES (2, 0, 'itec_report_project', NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, -1, NULL, 1, 1, -1, NULL, NULL, 0, 0, '-', '2018-01-25 08:59:23', 'admin', '2018-01-26 09:20:47', 10000);
INSERT INTO `r_transformation` VALUES (3, 0, 'm_indicators', NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, -1, NULL, 1, 1, -1, NULL, NULL, 0, 0, '-', '2018-01-25 09:01:17', 'admin', '2018-01-26 09:52:41', 10000);
INSERT INTO `r_transformation` VALUES (4, 0, 'UpdateFinishJob', NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, -1, NULL, 1, 1, -1, NULL, NULL, 0, 0, '-', '2018-01-25 14:30:17', 'admin', '2018-01-25 15:03:35', 10000);
INSERT INTO `r_transformation` VALUES (5, 0, 'StartJob', NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, -1, NULL, 1, 1, -1, NULL, NULL, 0, 0, '-', '2018-01-25 17:57:54', 'admin', '2018-01-26 09:18:57', 10000);

-- ----------------------------
-- Table structure for r_user
-- ----------------------------
DROP TABLE IF EXISTS `r_user`;
CREATE TABLE `r_user`  (
  `ID_USER` bigint(20) NOT NULL,
  `LOGIN` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `PASSWORD` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `NAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `DESCRIPTION` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ENABLED` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID_USER`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of r_user
-- ----------------------------
INSERT INTO `r_user` VALUES (1, 'admin', '2be98afc86aa7f2e4cb79ce71da9fa6d4', 'Administrator', 'User manager', 'Y');
INSERT INTO `r_user` VALUES (2, 'guest', '2be98afc86aa7f2e4cb79ce77cb97bcce', 'Guest account', 'Read-only guest account', 'Y');

-- ----------------------------
-- Table structure for r_value
-- ----------------------------
DROP TABLE IF EXISTS `r_value`;
CREATE TABLE `r_value`  (
  `ID_VALUE` bigint(20) NOT NULL,
  `NAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `VALUE_TYPE` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `VALUE_STR` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `IS_NULL` tinyint(1) NULL DEFAULT NULL,
  PRIMARY KEY (`ID_VALUE`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for r_version
-- ----------------------------
DROP TABLE IF EXISTS `r_version`;
CREATE TABLE `r_version`  (
  `ID_VERSION` bigint(20) NOT NULL,
  `MAJOR_VERSION` int(11) NULL DEFAULT NULL,
  `MINOR_VERSION` int(11) NULL DEFAULT NULL,
  `UPGRADE_DATE` datetime NULL DEFAULT NULL,
  `IS_UPGRADE` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID_VERSION`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of r_version
-- ----------------------------
INSERT INTO `r_version` VALUES (1, 5, 0, '2018-01-24 10:33:25', 'N');

SET FOREIGN_KEY_CHECKS = 1;
