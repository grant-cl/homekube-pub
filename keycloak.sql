-- MariaDB dump 10.19  Distrib 10.11.2-MariaDB, for Linux (x86_64)
--
-- Host: 192.168.2.129    Database: keycloak
-- ------------------------------------------------------
-- Server version	10.11.2-MariaDB-1:10.11.2+maria~ubu2204

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `ADMIN_EVENT_ENTITY`
--

DROP TABLE IF EXISTS `ADMIN_EVENT_ENTITY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ADMIN_EVENT_ENTITY` (
  `ID` varchar(36) NOT NULL,
  `ADMIN_EVENT_TIME` bigint(20) DEFAULT NULL,
  `REALM_ID` varchar(255) DEFAULT NULL,
  `OPERATION_TYPE` varchar(255) DEFAULT NULL,
  `AUTH_REALM_ID` varchar(255) DEFAULT NULL,
  `AUTH_CLIENT_ID` varchar(255) DEFAULT NULL,
  `AUTH_USER_ID` varchar(255) DEFAULT NULL,
  `IP_ADDRESS` varchar(255) DEFAULT NULL,
  `RESOURCE_PATH` text DEFAULT NULL,
  `REPRESENTATION` text DEFAULT NULL,
  `ERROR` varchar(255) DEFAULT NULL,
  `RESOURCE_TYPE` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_ADMIN_EVENT_TIME` (`REALM_ID`,`ADMIN_EVENT_TIME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ADMIN_EVENT_ENTITY`
--

LOCK TABLES `ADMIN_EVENT_ENTITY` WRITE;
/*!40000 ALTER TABLE `ADMIN_EVENT_ENTITY` DISABLE KEYS */;
/*!40000 ALTER TABLE `ADMIN_EVENT_ENTITY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ASSOCIATED_POLICY`
--

DROP TABLE IF EXISTS `ASSOCIATED_POLICY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ASSOCIATED_POLICY` (
  `POLICY_ID` varchar(36) NOT NULL,
  `ASSOCIATED_POLICY_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`POLICY_ID`,`ASSOCIATED_POLICY_ID`),
  KEY `IDX_ASSOC_POL_ASSOC_POL_ID` (`ASSOCIATED_POLICY_ID`),
  CONSTRAINT `FK_FRSR5S213XCX4WNKOG82SSRFY` FOREIGN KEY (`ASSOCIATED_POLICY_ID`) REFERENCES `RESOURCE_SERVER_POLICY` (`ID`),
  CONSTRAINT `FK_FRSRPAS14XCX4WNKOG82SSRFY` FOREIGN KEY (`POLICY_ID`) REFERENCES `RESOURCE_SERVER_POLICY` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ASSOCIATED_POLICY`
--

LOCK TABLES `ASSOCIATED_POLICY` WRITE;
/*!40000 ALTER TABLE `ASSOCIATED_POLICY` DISABLE KEYS */;
/*!40000 ALTER TABLE `ASSOCIATED_POLICY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AUTHENTICATION_EXECUTION`
--

DROP TABLE IF EXISTS `AUTHENTICATION_EXECUTION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `AUTHENTICATION_EXECUTION` (
  `ID` varchar(36) NOT NULL,
  `ALIAS` varchar(255) DEFAULT NULL,
  `AUTHENTICATOR` varchar(36) DEFAULT NULL,
  `REALM_ID` varchar(36) DEFAULT NULL,
  `FLOW_ID` varchar(36) DEFAULT NULL,
  `REQUIREMENT` int(11) DEFAULT NULL,
  `PRIORITY` int(11) DEFAULT NULL,
  `AUTHENTICATOR_FLOW` bit(1) NOT NULL DEFAULT b'0',
  `AUTH_FLOW_ID` varchar(36) DEFAULT NULL,
  `AUTH_CONFIG` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_AUTH_EXEC_REALM_FLOW` (`REALM_ID`,`FLOW_ID`),
  KEY `IDX_AUTH_EXEC_FLOW` (`FLOW_ID`),
  CONSTRAINT `FK_AUTH_EXEC_FLOW` FOREIGN KEY (`FLOW_ID`) REFERENCES `AUTHENTICATION_FLOW` (`ID`),
  CONSTRAINT `FK_AUTH_EXEC_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AUTHENTICATION_EXECUTION`
--

LOCK TABLES `AUTHENTICATION_EXECUTION` WRITE;
/*!40000 ALTER TABLE `AUTHENTICATION_EXECUTION` DISABLE KEYS */;
INSERT INTO `AUTHENTICATION_EXECUTION` VALUES
('03841c6d-954a-4fb5-9b3d-b6de62f5278b',NULL,NULL,'9edf1ebb-174b-478f-8959-7f2aa7617d22','e19fb20b-a246-436d-957e-2077116334ae',0,20,'','78cf9fd2-a9d1-41e5-859b-7d72ab4b1fde',NULL),
('0679c6c4-c050-4da8-ad12-70a2c90e0d72',NULL,'auth-cookie','9edf1ebb-174b-478f-8959-7f2aa7617d22','92f4fe57-533f-43ea-83ab-43ff7333efde',2,10,'\0',NULL,NULL),
('0b2eabbc-dd6e-40ac-b3ea-36d036729acc',NULL,'auth-spnego','9edf1ebb-174b-478f-8959-7f2aa7617d22','d44f5138-0b43-49e9-b33d-61c8eb2f40cf',3,30,'\0',NULL,NULL),
('127cf10c-9dc8-48fa-b5a0-2e5804e8f49d',NULL,NULL,'9edf1ebb-174b-478f-8959-7f2aa7617d22','839c4a8d-4b68-4032-8c6b-615133d57c66',1,20,'','af638b7e-048a-49ec-ba34-17394a7cd0ed',NULL),
('16233959-9cf5-4876-ad5c-34a7be7e9dcf',NULL,'client-secret','9edf1ebb-174b-478f-8959-7f2aa7617d22','4fabce82-5555-4a30-a750-51820e8948fb',2,10,'\0',NULL,NULL),
('1f854b75-aa2f-4462-acba-9a6fee05e71d',NULL,'http-basic-authenticator','9edf1ebb-174b-478f-8959-7f2aa7617d22','3a188f30-d577-498e-bf50-d442049b8508',0,10,'\0',NULL,NULL),
('1fb9d801-a249-4818-920b-81cd82ab0ad3',NULL,'idp-confirm-link','9edf1ebb-174b-478f-8959-7f2aa7617d22','e19fb20b-a246-436d-957e-2077116334ae',0,10,'\0',NULL,NULL),
('1fff9230-2cdb-4f6d-b5a5-a4d36e6515e8',NULL,'reset-credential-email','9edf1ebb-174b-478f-8959-7f2aa7617d22','8aba1b94-1d4a-4923-8cf5-86f70366191a',0,20,'\0',NULL,NULL),
('2168799d-edc0-497d-903a-c1519b0f18e2',NULL,'basic-auth-otp','9edf1ebb-174b-478f-8959-7f2aa7617d22','d44f5138-0b43-49e9-b33d-61c8eb2f40cf',3,20,'\0',NULL,NULL),
('26bb223a-753a-4b5d-824c-7af09cb2c829',NULL,'reset-otp','9edf1ebb-174b-478f-8959-7f2aa7617d22','83767b7b-c7a2-466a-93c3-709a76e4ed76',0,20,'\0',NULL,NULL),
('2d252c6c-2728-4a16-a5f5-1968297cc75b',NULL,'idp-email-verification','9edf1ebb-174b-478f-8959-7f2aa7617d22','78cf9fd2-a9d1-41e5-859b-7d72ab4b1fde',2,10,'\0',NULL,NULL),
('2f2639b3-a99f-46aa-9deb-07266b1dca0e',NULL,'conditional-user-configured','9edf1ebb-174b-478f-8959-7f2aa7617d22','83767b7b-c7a2-466a-93c3-709a76e4ed76',0,10,'\0',NULL,NULL),
('3b3f7970-c21b-4d9e-b486-ebf2a3d40e4f',NULL,'auth-otp-form','9edf1ebb-174b-478f-8959-7f2aa7617d22','b4744ab1-4e6b-4f2c-b5d4-96f9726b45e9',0,20,'\0',NULL,NULL),
('3e585105-a739-46c2-8c7c-e5fb8fdf5e4a',NULL,'client-jwt','9edf1ebb-174b-478f-8959-7f2aa7617d22','4fabce82-5555-4a30-a750-51820e8948fb',2,20,'\0',NULL,NULL),
('3f242802-7f7d-4999-b697-69c6e5c6fcbe',NULL,'reset-credentials-choose-user','9edf1ebb-174b-478f-8959-7f2aa7617d22','8aba1b94-1d4a-4923-8cf5-86f70366191a',0,10,'\0',NULL,NULL),
('48bb64d4-0712-4842-8b3f-eaffd1a26164',NULL,'basic-auth','9edf1ebb-174b-478f-8959-7f2aa7617d22','d44f5138-0b43-49e9-b33d-61c8eb2f40cf',0,10,'\0',NULL,NULL),
('49efb879-0dc1-49e7-a531-84a41d87db47',NULL,NULL,'9edf1ebb-174b-478f-8959-7f2aa7617d22','3d0bfe9c-b435-477e-bf80-989a1dac9d1c',1,20,'','b4744ab1-4e6b-4f2c-b5d4-96f9726b45e9',NULL),
('50fa12ac-7654-49ec-99b9-20693778c623',NULL,'conditional-user-configured','9edf1ebb-174b-478f-8959-7f2aa7617d22','af638b7e-048a-49ec-ba34-17394a7cd0ed',0,10,'\0',NULL,NULL),
('5a60ff07-a245-4b2d-826b-811f71146eee',NULL,'registration-user-creation','9edf1ebb-174b-478f-8959-7f2aa7617d22','f430f5c0-9294-4887-bc61-df6290684751',0,20,'\0',NULL,NULL),
('63112b67-0ef4-44fd-8104-79870f8cd25c',NULL,NULL,'9edf1ebb-174b-478f-8959-7f2aa7617d22','822275b4-c9c0-4f8b-ab45-a6d3f7a849bc',1,30,'','ec2c5e14-4812-452d-87f6-457348146d98',NULL),
('6646c299-5a77-40bf-b386-1e579cb08392',NULL,'conditional-user-configured','9edf1ebb-174b-478f-8959-7f2aa7617d22','b4744ab1-4e6b-4f2c-b5d4-96f9726b45e9',0,10,'\0',NULL,NULL),
('69d3900d-ac61-479d-80a9-c6c87e0ff5a3',NULL,'direct-grant-validate-otp','9edf1ebb-174b-478f-8959-7f2aa7617d22','ec2c5e14-4812-452d-87f6-457348146d98',0,20,'\0',NULL,NULL),
('6d64ef2b-4de0-492a-b268-64a191bfcb57',NULL,'registration-recaptcha-action','9edf1ebb-174b-478f-8959-7f2aa7617d22','f430f5c0-9294-4887-bc61-df6290684751',3,60,'\0',NULL,NULL),
('7037c828-189d-467f-801a-2d4873f6bdd7',NULL,NULL,'9edf1ebb-174b-478f-8959-7f2aa7617d22','be7bb459-c79f-4396-b02e-86a8b3d25c1e',0,20,'','ab72f585-8b5f-4a46-89ee-302a629294ac',NULL),
('747e5fcb-d0d8-4de9-ab3d-76aee92850fd',NULL,'direct-grant-validate-username','9edf1ebb-174b-478f-8959-7f2aa7617d22','822275b4-c9c0-4f8b-ab45-a6d3f7a849bc',0,10,'\0',NULL,NULL),
('7f352239-ecbc-4a0a-9610-6a7b02fa1254',NULL,'auth-username-password-form','9edf1ebb-174b-478f-8959-7f2aa7617d22','839c4a8d-4b68-4032-8c6b-615133d57c66',0,10,'\0',NULL,NULL),
('8a59fb3a-aba1-4e5c-9cfa-951f2b13793c',NULL,NULL,'9edf1ebb-174b-478f-8959-7f2aa7617d22','92f4fe57-533f-43ea-83ab-43ff7333efde',2,30,'','839c4a8d-4b68-4032-8c6b-615133d57c66',NULL),
('93e7c78d-148d-4c4d-bb6d-5e1ef74c8ba4',NULL,'idp-review-profile','9edf1ebb-174b-478f-8959-7f2aa7617d22','be7bb459-c79f-4396-b02e-86a8b3d25c1e',0,10,'\0',NULL,'bff5cfcd-959c-46c4-8b30-5a8881f1e011'),
('97d5347d-6490-483e-a9a1-66a39a61327b',NULL,NULL,'9edf1ebb-174b-478f-8959-7f2aa7617d22','ab72f585-8b5f-4a46-89ee-302a629294ac',2,20,'','e19fb20b-a246-436d-957e-2077116334ae',NULL),
('9bf2cd30-d1de-4809-afa6-32ee47924575',NULL,'auth-spnego','9edf1ebb-174b-478f-8959-7f2aa7617d22','92f4fe57-533f-43ea-83ab-43ff7333efde',3,20,'\0',NULL,NULL),
('a0e7d6dc-27ea-4fc6-b033-a8973f67b50d',NULL,'no-cookie-redirect','9edf1ebb-174b-478f-8959-7f2aa7617d22','970dd9c0-4f37-49e8-9dc1-e1b8a3d9b1b0',0,10,'\0',NULL,NULL),
('a8e70754-d0c7-4957-80c3-312656b02ba4',NULL,'idp-create-user-if-unique','9edf1ebb-174b-478f-8959-7f2aa7617d22','ab72f585-8b5f-4a46-89ee-302a629294ac',2,10,'\0',NULL,'1404cde6-9ae8-4cb9-bdcb-7a869f403d72'),
('abcbc1d2-9499-4c7e-a22d-b76d20ea0a5f',NULL,'registration-profile-action','9edf1ebb-174b-478f-8959-7f2aa7617d22','f430f5c0-9294-4887-bc61-df6290684751',0,40,'\0',NULL,NULL),
('ae6da653-1287-4344-b433-e0297ab2baa5',NULL,'auth-otp-form','9edf1ebb-174b-478f-8959-7f2aa7617d22','af638b7e-048a-49ec-ba34-17394a7cd0ed',0,20,'\0',NULL,NULL),
('af78a06b-27c3-454d-8d2b-d86c1430e782',NULL,NULL,'9edf1ebb-174b-478f-8959-7f2aa7617d22','970dd9c0-4f37-49e8-9dc1-e1b8a3d9b1b0',0,20,'','d44f5138-0b43-49e9-b33d-61c8eb2f40cf',NULL),
('bffa2d14-9c16-4151-9eac-4fc6d12274c7',NULL,'client-x509','9edf1ebb-174b-478f-8959-7f2aa7617d22','4fabce82-5555-4a30-a750-51820e8948fb',2,40,'\0',NULL,NULL),
('c02c2af4-43a6-4c11-a75b-d6ff8dce2c49',NULL,NULL,'9edf1ebb-174b-478f-8959-7f2aa7617d22','78cf9fd2-a9d1-41e5-859b-7d72ab4b1fde',2,20,'','3d0bfe9c-b435-477e-bf80-989a1dac9d1c',NULL),
('d9c99f5c-3fac-4af3-aa9f-a79315db103f',NULL,'identity-provider-redirector','9edf1ebb-174b-478f-8959-7f2aa7617d22','92f4fe57-533f-43ea-83ab-43ff7333efde',2,25,'\0',NULL,NULL),
('de8e1176-e80e-457f-b2b8-c8e977eab55a',NULL,'registration-page-form','9edf1ebb-174b-478f-8959-7f2aa7617d22','0d853956-8e83-4f01-98cb-9322a009cae6',0,10,'','f430f5c0-9294-4887-bc61-df6290684751',NULL),
('e04e58b8-79df-4282-adae-a4ef73fca370',NULL,'direct-grant-validate-password','9edf1ebb-174b-478f-8959-7f2aa7617d22','822275b4-c9c0-4f8b-ab45-a6d3f7a849bc',0,20,'\0',NULL,NULL),
('e1492cb4-38d2-4dad-8768-dadd6565b550',NULL,'conditional-user-configured','9edf1ebb-174b-478f-8959-7f2aa7617d22','ec2c5e14-4812-452d-87f6-457348146d98',0,10,'\0',NULL,NULL),
('ebd2a81d-a93e-4d31-b575-1f99bbc2c371',NULL,'reset-password','9edf1ebb-174b-478f-8959-7f2aa7617d22','8aba1b94-1d4a-4923-8cf5-86f70366191a',0,30,'\0',NULL,NULL),
('f2469ae8-a16d-4265-b668-53805f7b20fc',NULL,'client-secret-jwt','9edf1ebb-174b-478f-8959-7f2aa7617d22','4fabce82-5555-4a30-a750-51820e8948fb',2,30,'\0',NULL,NULL),
('f2b37a0c-16e2-4ee9-8add-875db428e957',NULL,'idp-username-password-form','9edf1ebb-174b-478f-8959-7f2aa7617d22','3d0bfe9c-b435-477e-bf80-989a1dac9d1c',0,10,'\0',NULL,NULL),
('f9426a81-d96b-4eb4-9c50-7b3cdbbf7b60',NULL,'registration-password-action','9edf1ebb-174b-478f-8959-7f2aa7617d22','f430f5c0-9294-4887-bc61-df6290684751',0,50,'\0',NULL,NULL),
('fb5f8b66-917a-4bb6-b400-e5483254e7c8',NULL,'docker-http-basic-authenticator','9edf1ebb-174b-478f-8959-7f2aa7617d22','a569482f-8f20-4a23-baa5-df0fcf648db7',0,10,'\0',NULL,NULL),
('fcd091e3-be0a-4254-882e-db6b25701520',NULL,NULL,'9edf1ebb-174b-478f-8959-7f2aa7617d22','8aba1b94-1d4a-4923-8cf5-86f70366191a',1,40,'','83767b7b-c7a2-466a-93c3-709a76e4ed76',NULL);
/*!40000 ALTER TABLE `AUTHENTICATION_EXECUTION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AUTHENTICATION_FLOW`
--

DROP TABLE IF EXISTS `AUTHENTICATION_FLOW`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `AUTHENTICATION_FLOW` (
  `ID` varchar(36) NOT NULL,
  `ALIAS` varchar(255) DEFAULT NULL,
  `DESCRIPTION` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `REALM_ID` varchar(36) DEFAULT NULL,
  `PROVIDER_ID` varchar(36) NOT NULL DEFAULT 'basic-flow',
  `TOP_LEVEL` bit(1) NOT NULL DEFAULT b'0',
  `BUILT_IN` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`ID`),
  KEY `IDX_AUTH_FLOW_REALM` (`REALM_ID`),
  CONSTRAINT `FK_AUTH_FLOW_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AUTHENTICATION_FLOW`
--

LOCK TABLES `AUTHENTICATION_FLOW` WRITE;
/*!40000 ALTER TABLE `AUTHENTICATION_FLOW` DISABLE KEYS */;
INSERT INTO `AUTHENTICATION_FLOW` VALUES
('0d853956-8e83-4f01-98cb-9322a009cae6','registration','registration flow','9edf1ebb-174b-478f-8959-7f2aa7617d22','basic-flow','',''),
('3a188f30-d577-498e-bf50-d442049b8508','saml ecp','SAML ECP Profile Authentication Flow','9edf1ebb-174b-478f-8959-7f2aa7617d22','basic-flow','',''),
('3d0bfe9c-b435-477e-bf80-989a1dac9d1c','Verify Existing Account by Re-authentication','Reauthentication of existing account','9edf1ebb-174b-478f-8959-7f2aa7617d22','basic-flow','\0',''),
('4fabce82-5555-4a30-a750-51820e8948fb','clients','Base authentication for clients','9edf1ebb-174b-478f-8959-7f2aa7617d22','client-flow','',''),
('78cf9fd2-a9d1-41e5-859b-7d72ab4b1fde','Account verification options','Method with which to verity the existing account','9edf1ebb-174b-478f-8959-7f2aa7617d22','basic-flow','\0',''),
('822275b4-c9c0-4f8b-ab45-a6d3f7a849bc','direct grant','OpenID Connect Resource Owner Grant','9edf1ebb-174b-478f-8959-7f2aa7617d22','basic-flow','',''),
('83767b7b-c7a2-466a-93c3-709a76e4ed76','Reset - Conditional OTP','Flow to determine if the OTP should be reset or not. Set to REQUIRED to force.','9edf1ebb-174b-478f-8959-7f2aa7617d22','basic-flow','\0',''),
('839c4a8d-4b68-4032-8c6b-615133d57c66','forms','Username, password, otp and other auth forms.','9edf1ebb-174b-478f-8959-7f2aa7617d22','basic-flow','\0',''),
('8aba1b94-1d4a-4923-8cf5-86f70366191a','reset credentials','Reset credentials for a user if they forgot their password or something','9edf1ebb-174b-478f-8959-7f2aa7617d22','basic-flow','',''),
('92f4fe57-533f-43ea-83ab-43ff7333efde','browser','browser based authentication','9edf1ebb-174b-478f-8959-7f2aa7617d22','basic-flow','',''),
('970dd9c0-4f37-49e8-9dc1-e1b8a3d9b1b0','http challenge','An authentication flow based on challenge-response HTTP Authentication Schemes','9edf1ebb-174b-478f-8959-7f2aa7617d22','basic-flow','',''),
('a569482f-8f20-4a23-baa5-df0fcf648db7','docker auth','Used by Docker clients to authenticate against the IDP','9edf1ebb-174b-478f-8959-7f2aa7617d22','basic-flow','',''),
('ab72f585-8b5f-4a46-89ee-302a629294ac','User creation or linking','Flow for the existing/non-existing user alternatives','9edf1ebb-174b-478f-8959-7f2aa7617d22','basic-flow','\0',''),
('af638b7e-048a-49ec-ba34-17394a7cd0ed','Browser - Conditional OTP','Flow to determine if the OTP is required for the authentication','9edf1ebb-174b-478f-8959-7f2aa7617d22','basic-flow','\0',''),
('b4744ab1-4e6b-4f2c-b5d4-96f9726b45e9','First broker login - Conditional OTP','Flow to determine if the OTP is required for the authentication','9edf1ebb-174b-478f-8959-7f2aa7617d22','basic-flow','\0',''),
('be7bb459-c79f-4396-b02e-86a8b3d25c1e','first broker login','Actions taken after first broker login with identity provider account, which is not yet linked to any Keycloak account','9edf1ebb-174b-478f-8959-7f2aa7617d22','basic-flow','',''),
('d44f5138-0b43-49e9-b33d-61c8eb2f40cf','Authentication Options','Authentication options.','9edf1ebb-174b-478f-8959-7f2aa7617d22','basic-flow','\0',''),
('e19fb20b-a246-436d-957e-2077116334ae','Handle Existing Account','Handle what to do if there is existing account with same email/username like authenticated identity provider','9edf1ebb-174b-478f-8959-7f2aa7617d22','basic-flow','\0',''),
('ec2c5e14-4812-452d-87f6-457348146d98','Direct Grant - Conditional OTP','Flow to determine if the OTP is required for the authentication','9edf1ebb-174b-478f-8959-7f2aa7617d22','basic-flow','\0',''),
('f430f5c0-9294-4887-bc61-df6290684751','registration form','registration form','9edf1ebb-174b-478f-8959-7f2aa7617d22','form-flow','\0','');
/*!40000 ALTER TABLE `AUTHENTICATION_FLOW` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AUTHENTICATOR_CONFIG`
--

DROP TABLE IF EXISTS `AUTHENTICATOR_CONFIG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `AUTHENTICATOR_CONFIG` (
  `ID` varchar(36) NOT NULL,
  `ALIAS` varchar(255) DEFAULT NULL,
  `REALM_ID` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_AUTH_CONFIG_REALM` (`REALM_ID`),
  CONSTRAINT `FK_AUTH_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AUTHENTICATOR_CONFIG`
--

LOCK TABLES `AUTHENTICATOR_CONFIG` WRITE;
/*!40000 ALTER TABLE `AUTHENTICATOR_CONFIG` DISABLE KEYS */;
INSERT INTO `AUTHENTICATOR_CONFIG` VALUES
('1404cde6-9ae8-4cb9-bdcb-7a869f403d72','create unique user config','9edf1ebb-174b-478f-8959-7f2aa7617d22'),
('bff5cfcd-959c-46c4-8b30-5a8881f1e011','review profile config','9edf1ebb-174b-478f-8959-7f2aa7617d22');
/*!40000 ALTER TABLE `AUTHENTICATOR_CONFIG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AUTHENTICATOR_CONFIG_ENTRY`
--

DROP TABLE IF EXISTS `AUTHENTICATOR_CONFIG_ENTRY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `AUTHENTICATOR_CONFIG_ENTRY` (
  `AUTHENTICATOR_ID` varchar(36) NOT NULL,
  `VALUE` longtext DEFAULT NULL,
  `NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`AUTHENTICATOR_ID`,`NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AUTHENTICATOR_CONFIG_ENTRY`
--

LOCK TABLES `AUTHENTICATOR_CONFIG_ENTRY` WRITE;
/*!40000 ALTER TABLE `AUTHENTICATOR_CONFIG_ENTRY` DISABLE KEYS */;
INSERT INTO `AUTHENTICATOR_CONFIG_ENTRY` VALUES
('1404cde6-9ae8-4cb9-bdcb-7a869f403d72','false','require.password.update.after.registration'),
('bff5cfcd-959c-46c4-8b30-5a8881f1e011','missing','update.profile.on.first.login');
/*!40000 ALTER TABLE `AUTHENTICATOR_CONFIG_ENTRY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `BROKER_LINK`
--

DROP TABLE IF EXISTS `BROKER_LINK`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BROKER_LINK` (
  `IDENTITY_PROVIDER` varchar(255) NOT NULL,
  `STORAGE_PROVIDER_ID` varchar(255) DEFAULT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  `BROKER_USER_ID` varchar(255) DEFAULT NULL,
  `BROKER_USERNAME` varchar(255) DEFAULT NULL,
  `TOKEN` text DEFAULT NULL,
  `USER_ID` varchar(255) NOT NULL,
  PRIMARY KEY (`IDENTITY_PROVIDER`,`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BROKER_LINK`
--

LOCK TABLES `BROKER_LINK` WRITE;
/*!40000 ALTER TABLE `BROKER_LINK` DISABLE KEYS */;
/*!40000 ALTER TABLE `BROKER_LINK` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT`
--

DROP TABLE IF EXISTS `CLIENT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CLIENT` (
  `ID` varchar(36) NOT NULL,
  `ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `FULL_SCOPE_ALLOWED` bit(1) NOT NULL DEFAULT b'0',
  `CLIENT_ID` varchar(255) DEFAULT NULL,
  `NOT_BEFORE` int(11) DEFAULT NULL,
  `PUBLIC_CLIENT` bit(1) NOT NULL DEFAULT b'0',
  `SECRET` varchar(255) DEFAULT NULL,
  `BASE_URL` varchar(255) DEFAULT NULL,
  `BEARER_ONLY` bit(1) NOT NULL DEFAULT b'0',
  `MANAGEMENT_URL` varchar(255) DEFAULT NULL,
  `SURROGATE_AUTH_REQUIRED` bit(1) NOT NULL DEFAULT b'0',
  `REALM_ID` varchar(36) DEFAULT NULL,
  `PROTOCOL` varchar(255) DEFAULT NULL,
  `NODE_REREG_TIMEOUT` int(11) DEFAULT 0,
  `FRONTCHANNEL_LOGOUT` bit(1) NOT NULL DEFAULT b'0',
  `CONSENT_REQUIRED` bit(1) NOT NULL DEFAULT b'0',
  `NAME` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `SERVICE_ACCOUNTS_ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `CLIENT_AUTHENTICATOR_TYPE` varchar(255) DEFAULT NULL,
  `ROOT_URL` varchar(255) DEFAULT NULL,
  `DESCRIPTION` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `REGISTRATION_TOKEN` varchar(255) DEFAULT NULL,
  `STANDARD_FLOW_ENABLED` bit(1) NOT NULL DEFAULT b'1',
  `IMPLICIT_FLOW_ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `DIRECT_ACCESS_GRANTS_ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `ALWAYS_DISPLAY_IN_CONSOLE` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_B71CJLBENV945RB6GCON438AT` (`REALM_ID`,`CLIENT_ID`),
  KEY `IDX_CLIENT_ID` (`CLIENT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT`
--

LOCK TABLES `CLIENT` WRITE;
/*!40000 ALTER TABLE `CLIENT` DISABLE KEYS */;
INSERT INTO `CLIENT` VALUES
('09b2aa31-8d71-4cb3-ba2a-3d791eb5f858','','\0','admin-cli',0,'',NULL,NULL,'\0',NULL,'\0','9edf1ebb-174b-478f-8959-7f2aa7617d22','openid-connect',0,'\0','\0','${client_admin-cli}','\0','client-secret',NULL,NULL,NULL,'\0','\0','','\0'),
('2fb6af61-2126-4686-9889-0239e66147cd','','\0','account',0,'',NULL,'/realms/master/account/','\0',NULL,'\0','9edf1ebb-174b-478f-8959-7f2aa7617d22','openid-connect',0,'\0','\0','${client_account}','\0','client-secret','${authBaseUrl}',NULL,NULL,'','\0','\0','\0'),
('8044d631-ffff-4219-b45d-596e49e64ce1','','','argocd',0,'\0','qXbX1xo6eAplblTJQae2rRD9tedKmYIT','https://192.168.2.150','\0','http://192.168.2.150','\0','9edf1ebb-174b-478f-8959-7f2aa7617d22','openid-connect',-1,'','\0','ArgoCD','\0','client-secret','https://192.168.2.150','ArgoCD Login',NULL,'','\0','','\0'),
('81f2cb30-de95-40ce-be55-a23ebfe18b2e','','\0','broker',0,'\0',NULL,NULL,'',NULL,'\0','9edf1ebb-174b-478f-8959-7f2aa7617d22','openid-connect',0,'\0','\0','${client_broker}','\0','client-secret',NULL,NULL,NULL,'','\0','\0','\0'),
('9d42395c-eb37-4b6d-b23d-778fdb4b677a','','\0','master-realm',0,'\0',NULL,NULL,'',NULL,'\0','9edf1ebb-174b-478f-8959-7f2aa7617d22',NULL,0,'\0','\0','master Realm','\0','client-secret',NULL,NULL,NULL,'','\0','\0','\0'),
('b1965a6e-95cb-4113-a3c1-68aab6e81d49','','\0','security-admin-console',0,'',NULL,'/admin/master/console/','\0',NULL,'\0','9edf1ebb-174b-478f-8959-7f2aa7617d22','openid-connect',0,'\0','\0','${client_security-admin-console}','\0','client-secret','${authAdminUrl}',NULL,NULL,'','\0','\0','\0'),
('fc44ee4f-6340-4d79-be98-2c78118d59e7','','\0','account-console',0,'',NULL,'/realms/master/account/','\0',NULL,'\0','9edf1ebb-174b-478f-8959-7f2aa7617d22','openid-connect',0,'\0','\0','${client_account-console}','\0','client-secret','${authBaseUrl}',NULL,NULL,'','\0','\0','\0');
/*!40000 ALTER TABLE `CLIENT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_ATTRIBUTES`
--

DROP TABLE IF EXISTS `CLIENT_ATTRIBUTES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CLIENT_ATTRIBUTES` (
  `CLIENT_ID` varchar(36) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `VALUE` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  PRIMARY KEY (`CLIENT_ID`,`NAME`),
  KEY `IDX_CLIENT_ATT_BY_NAME_VALUE` (`NAME`),
  CONSTRAINT `FK3C47C64BEACCA966` FOREIGN KEY (`CLIENT_ID`) REFERENCES `CLIENT` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_ATTRIBUTES`
--

LOCK TABLES `CLIENT_ATTRIBUTES` WRITE;
/*!40000 ALTER TABLE `CLIENT_ATTRIBUTES` DISABLE KEYS */;
INSERT INTO `CLIENT_ATTRIBUTES` VALUES
('2fb6af61-2126-4686-9889-0239e66147cd','post.logout.redirect.uris','+'),
('8044d631-ffff-4219-b45d-596e49e64ce1','backchannel.logout.revoke.offline.tokens','false'),
('8044d631-ffff-4219-b45d-596e49e64ce1','backchannel.logout.session.required','true'),
('8044d631-ffff-4219-b45d-596e49e64ce1','client.secret.creation.time','1679063489'),
('8044d631-ffff-4219-b45d-596e49e64ce1','display.on.consent.screen','false'),
('8044d631-ffff-4219-b45d-596e49e64ce1','oauth2.device.authorization.grant.enabled','false'),
('8044d631-ffff-4219-b45d-596e49e64ce1','oidc.ciba.grant.enabled','false'),
('8044d631-ffff-4219-b45d-596e49e64ce1','post.logout.redirect.uris','https://192.168.2.150'),
('b1965a6e-95cb-4113-a3c1-68aab6e81d49','pkce.code.challenge.method','S256'),
('b1965a6e-95cb-4113-a3c1-68aab6e81d49','post.logout.redirect.uris','+'),
('fc44ee4f-6340-4d79-be98-2c78118d59e7','pkce.code.challenge.method','S256'),
('fc44ee4f-6340-4d79-be98-2c78118d59e7','post.logout.redirect.uris','+');
/*!40000 ALTER TABLE `CLIENT_ATTRIBUTES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_AUTH_FLOW_BINDINGS`
--

DROP TABLE IF EXISTS `CLIENT_AUTH_FLOW_BINDINGS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CLIENT_AUTH_FLOW_BINDINGS` (
  `CLIENT_ID` varchar(36) NOT NULL,
  `FLOW_ID` varchar(36) DEFAULT NULL,
  `BINDING_NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`CLIENT_ID`,`BINDING_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_AUTH_FLOW_BINDINGS`
--

LOCK TABLES `CLIENT_AUTH_FLOW_BINDINGS` WRITE;
/*!40000 ALTER TABLE `CLIENT_AUTH_FLOW_BINDINGS` DISABLE KEYS */;
/*!40000 ALTER TABLE `CLIENT_AUTH_FLOW_BINDINGS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_INITIAL_ACCESS`
--

DROP TABLE IF EXISTS `CLIENT_INITIAL_ACCESS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CLIENT_INITIAL_ACCESS` (
  `ID` varchar(36) NOT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  `TIMESTAMP` int(11) DEFAULT NULL,
  `EXPIRATION` int(11) DEFAULT NULL,
  `COUNT` int(11) DEFAULT NULL,
  `REMAINING_COUNT` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_CLIENT_INIT_ACC_REALM` (`REALM_ID`),
  CONSTRAINT `FK_CLIENT_INIT_ACC_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_INITIAL_ACCESS`
--

LOCK TABLES `CLIENT_INITIAL_ACCESS` WRITE;
/*!40000 ALTER TABLE `CLIENT_INITIAL_ACCESS` DISABLE KEYS */;
/*!40000 ALTER TABLE `CLIENT_INITIAL_ACCESS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_NODE_REGISTRATIONS`
--

DROP TABLE IF EXISTS `CLIENT_NODE_REGISTRATIONS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CLIENT_NODE_REGISTRATIONS` (
  `CLIENT_ID` varchar(36) NOT NULL,
  `VALUE` int(11) DEFAULT NULL,
  `NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`CLIENT_ID`,`NAME`),
  CONSTRAINT `FK4129723BA992F594` FOREIGN KEY (`CLIENT_ID`) REFERENCES `CLIENT` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_NODE_REGISTRATIONS`
--

LOCK TABLES `CLIENT_NODE_REGISTRATIONS` WRITE;
/*!40000 ALTER TABLE `CLIENT_NODE_REGISTRATIONS` DISABLE KEYS */;
/*!40000 ALTER TABLE `CLIENT_NODE_REGISTRATIONS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_SCOPE`
--

DROP TABLE IF EXISTS `CLIENT_SCOPE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CLIENT_SCOPE` (
  `ID` varchar(36) NOT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  `REALM_ID` varchar(36) DEFAULT NULL,
  `DESCRIPTION` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `PROTOCOL` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_CLI_SCOPE` (`REALM_ID`,`NAME`),
  KEY `IDX_REALM_CLSCOPE` (`REALM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_SCOPE`
--

LOCK TABLES `CLIENT_SCOPE` WRITE;
/*!40000 ALTER TABLE `CLIENT_SCOPE` DISABLE KEYS */;
INSERT INTO `CLIENT_SCOPE` VALUES
('431f2ce1-8af6-4ab7-bd75-46d6aab1bc28','address','9edf1ebb-174b-478f-8959-7f2aa7617d22','OpenID Connect built-in scope: address','openid-connect'),
('58fa9b1f-cf48-45d0-b928-8908020a6e7e','offline_access','9edf1ebb-174b-478f-8959-7f2aa7617d22','OpenID Connect built-in scope: offline_access','openid-connect'),
('852c44dd-ae38-4682-9f0b-2e2a8021654d','role_list','9edf1ebb-174b-478f-8959-7f2aa7617d22','SAML role list','saml'),
('8b0efaee-6d64-4fca-8671-146a19a5e4e0','web-origins','9edf1ebb-174b-478f-8959-7f2aa7617d22','OpenID Connect scope for add allowed web origins to the access token','openid-connect'),
('8cf5e257-bdc3-4379-8b5c-37f0ec23c0c2','profile','9edf1ebb-174b-478f-8959-7f2aa7617d22','OpenID Connect built-in scope: profile','openid-connect'),
('a7e6df0d-408b-4109-9772-e34e05344732','microprofile-jwt','9edf1ebb-174b-478f-8959-7f2aa7617d22','Microprofile - JWT built-in scope','openid-connect'),
('b3717553-2a8f-4b8e-9045-11117b33fd2e','acr','9edf1ebb-174b-478f-8959-7f2aa7617d22','OpenID Connect scope for add acr (authentication context class reference) to the token','openid-connect'),
('bd17e7bb-c043-4a62-9be1-7668ea1dfbfc','phone','9edf1ebb-174b-478f-8959-7f2aa7617d22','OpenID Connect built-in scope: phone','openid-connect'),
('dbf832eb-7dbb-439f-9a83-3bd44b2c0a41','email','9edf1ebb-174b-478f-8959-7f2aa7617d22','OpenID Connect built-in scope: email','openid-connect'),
('e005dc58-bba1-4018-929a-e2e65d44297d','groups','9edf1ebb-174b-478f-8959-7f2aa7617d22','Group Membership','openid-connect'),
('ed6a4a0d-3eed-4202-8037-029ef0b450d0','roles','9edf1ebb-174b-478f-8959-7f2aa7617d22','OpenID Connect scope for add user roles to the access token','openid-connect');
/*!40000 ALTER TABLE `CLIENT_SCOPE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_SCOPE_ATTRIBUTES`
--

DROP TABLE IF EXISTS `CLIENT_SCOPE_ATTRIBUTES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CLIENT_SCOPE_ATTRIBUTES` (
  `SCOPE_ID` varchar(36) NOT NULL,
  `VALUE` text DEFAULT NULL,
  `NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`SCOPE_ID`,`NAME`),
  KEY `IDX_CLSCOPE_ATTRS` (`SCOPE_ID`),
  CONSTRAINT `FK_CL_SCOPE_ATTR_SCOPE` FOREIGN KEY (`SCOPE_ID`) REFERENCES `CLIENT_SCOPE` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_SCOPE_ATTRIBUTES`
--

LOCK TABLES `CLIENT_SCOPE_ATTRIBUTES` WRITE;
/*!40000 ALTER TABLE `CLIENT_SCOPE_ATTRIBUTES` DISABLE KEYS */;
INSERT INTO `CLIENT_SCOPE_ATTRIBUTES` VALUES
('431f2ce1-8af6-4ab7-bd75-46d6aab1bc28','${addressScopeConsentText}','consent.screen.text'),
('431f2ce1-8af6-4ab7-bd75-46d6aab1bc28','true','display.on.consent.screen'),
('431f2ce1-8af6-4ab7-bd75-46d6aab1bc28','true','include.in.token.scope'),
('58fa9b1f-cf48-45d0-b928-8908020a6e7e','${offlineAccessScopeConsentText}','consent.screen.text'),
('58fa9b1f-cf48-45d0-b928-8908020a6e7e','true','display.on.consent.screen'),
('852c44dd-ae38-4682-9f0b-2e2a8021654d','${samlRoleListScopeConsentText}','consent.screen.text'),
('852c44dd-ae38-4682-9f0b-2e2a8021654d','true','display.on.consent.screen'),
('8b0efaee-6d64-4fca-8671-146a19a5e4e0','','consent.screen.text'),
('8b0efaee-6d64-4fca-8671-146a19a5e4e0','false','display.on.consent.screen'),
('8b0efaee-6d64-4fca-8671-146a19a5e4e0','false','include.in.token.scope'),
('8cf5e257-bdc3-4379-8b5c-37f0ec23c0c2','${profileScopeConsentText}','consent.screen.text'),
('8cf5e257-bdc3-4379-8b5c-37f0ec23c0c2','true','display.on.consent.screen'),
('8cf5e257-bdc3-4379-8b5c-37f0ec23c0c2','true','include.in.token.scope'),
('a7e6df0d-408b-4109-9772-e34e05344732','false','display.on.consent.screen'),
('a7e6df0d-408b-4109-9772-e34e05344732','true','include.in.token.scope'),
('b3717553-2a8f-4b8e-9045-11117b33fd2e','false','display.on.consent.screen'),
('b3717553-2a8f-4b8e-9045-11117b33fd2e','false','include.in.token.scope'),
('bd17e7bb-c043-4a62-9be1-7668ea1dfbfc','${phoneScopeConsentText}','consent.screen.text'),
('bd17e7bb-c043-4a62-9be1-7668ea1dfbfc','true','display.on.consent.screen'),
('bd17e7bb-c043-4a62-9be1-7668ea1dfbfc','true','include.in.token.scope'),
('dbf832eb-7dbb-439f-9a83-3bd44b2c0a41','${emailScopeConsentText}','consent.screen.text'),
('dbf832eb-7dbb-439f-9a83-3bd44b2c0a41','true','display.on.consent.screen'),
('dbf832eb-7dbb-439f-9a83-3bd44b2c0a41','true','include.in.token.scope'),
('e005dc58-bba1-4018-929a-e2e65d44297d','','consent.screen.text'),
('e005dc58-bba1-4018-929a-e2e65d44297d','true','display.on.consent.screen'),
('e005dc58-bba1-4018-929a-e2e65d44297d','','gui.order'),
('e005dc58-bba1-4018-929a-e2e65d44297d','true','include.in.token.scope'),
('ed6a4a0d-3eed-4202-8037-029ef0b450d0','${rolesScopeConsentText}','consent.screen.text'),
('ed6a4a0d-3eed-4202-8037-029ef0b450d0','true','display.on.consent.screen'),
('ed6a4a0d-3eed-4202-8037-029ef0b450d0','false','include.in.token.scope');
/*!40000 ALTER TABLE `CLIENT_SCOPE_ATTRIBUTES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_SCOPE_CLIENT`
--

DROP TABLE IF EXISTS `CLIENT_SCOPE_CLIENT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CLIENT_SCOPE_CLIENT` (
  `CLIENT_ID` varchar(255) NOT NULL,
  `SCOPE_ID` varchar(255) NOT NULL,
  `DEFAULT_SCOPE` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`CLIENT_ID`,`SCOPE_ID`),
  KEY `IDX_CLSCOPE_CL` (`CLIENT_ID`),
  KEY `IDX_CL_CLSCOPE` (`SCOPE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_SCOPE_CLIENT`
--

LOCK TABLES `CLIENT_SCOPE_CLIENT` WRITE;
/*!40000 ALTER TABLE `CLIENT_SCOPE_CLIENT` DISABLE KEYS */;
INSERT INTO `CLIENT_SCOPE_CLIENT` VALUES
('09b2aa31-8d71-4cb3-ba2a-3d791eb5f858','431f2ce1-8af6-4ab7-bd75-46d6aab1bc28','\0'),
('09b2aa31-8d71-4cb3-ba2a-3d791eb5f858','58fa9b1f-cf48-45d0-b928-8908020a6e7e','\0'),
('09b2aa31-8d71-4cb3-ba2a-3d791eb5f858','8b0efaee-6d64-4fca-8671-146a19a5e4e0',''),
('09b2aa31-8d71-4cb3-ba2a-3d791eb5f858','8cf5e257-bdc3-4379-8b5c-37f0ec23c0c2',''),
('09b2aa31-8d71-4cb3-ba2a-3d791eb5f858','a7e6df0d-408b-4109-9772-e34e05344732','\0'),
('09b2aa31-8d71-4cb3-ba2a-3d791eb5f858','b3717553-2a8f-4b8e-9045-11117b33fd2e',''),
('09b2aa31-8d71-4cb3-ba2a-3d791eb5f858','bd17e7bb-c043-4a62-9be1-7668ea1dfbfc','\0'),
('09b2aa31-8d71-4cb3-ba2a-3d791eb5f858','dbf832eb-7dbb-439f-9a83-3bd44b2c0a41',''),
('09b2aa31-8d71-4cb3-ba2a-3d791eb5f858','ed6a4a0d-3eed-4202-8037-029ef0b450d0',''),
('2fb6af61-2126-4686-9889-0239e66147cd','431f2ce1-8af6-4ab7-bd75-46d6aab1bc28','\0'),
('2fb6af61-2126-4686-9889-0239e66147cd','58fa9b1f-cf48-45d0-b928-8908020a6e7e','\0'),
('2fb6af61-2126-4686-9889-0239e66147cd','8b0efaee-6d64-4fca-8671-146a19a5e4e0',''),
('2fb6af61-2126-4686-9889-0239e66147cd','8cf5e257-bdc3-4379-8b5c-37f0ec23c0c2',''),
('2fb6af61-2126-4686-9889-0239e66147cd','a7e6df0d-408b-4109-9772-e34e05344732','\0'),
('2fb6af61-2126-4686-9889-0239e66147cd','b3717553-2a8f-4b8e-9045-11117b33fd2e',''),
('2fb6af61-2126-4686-9889-0239e66147cd','bd17e7bb-c043-4a62-9be1-7668ea1dfbfc','\0'),
('2fb6af61-2126-4686-9889-0239e66147cd','dbf832eb-7dbb-439f-9a83-3bd44b2c0a41',''),
('2fb6af61-2126-4686-9889-0239e66147cd','ed6a4a0d-3eed-4202-8037-029ef0b450d0',''),
('8044d631-ffff-4219-b45d-596e49e64ce1','431f2ce1-8af6-4ab7-bd75-46d6aab1bc28','\0'),
('8044d631-ffff-4219-b45d-596e49e64ce1','58fa9b1f-cf48-45d0-b928-8908020a6e7e','\0'),
('8044d631-ffff-4219-b45d-596e49e64ce1','8b0efaee-6d64-4fca-8671-146a19a5e4e0',''),
('8044d631-ffff-4219-b45d-596e49e64ce1','8cf5e257-bdc3-4379-8b5c-37f0ec23c0c2',''),
('8044d631-ffff-4219-b45d-596e49e64ce1','a7e6df0d-408b-4109-9772-e34e05344732','\0'),
('8044d631-ffff-4219-b45d-596e49e64ce1','b3717553-2a8f-4b8e-9045-11117b33fd2e',''),
('8044d631-ffff-4219-b45d-596e49e64ce1','bd17e7bb-c043-4a62-9be1-7668ea1dfbfc','\0'),
('8044d631-ffff-4219-b45d-596e49e64ce1','dbf832eb-7dbb-439f-9a83-3bd44b2c0a41',''),
('8044d631-ffff-4219-b45d-596e49e64ce1','e005dc58-bba1-4018-929a-e2e65d44297d',''),
('8044d631-ffff-4219-b45d-596e49e64ce1','ed6a4a0d-3eed-4202-8037-029ef0b450d0',''),
('81f2cb30-de95-40ce-be55-a23ebfe18b2e','431f2ce1-8af6-4ab7-bd75-46d6aab1bc28','\0'),
('81f2cb30-de95-40ce-be55-a23ebfe18b2e','58fa9b1f-cf48-45d0-b928-8908020a6e7e','\0'),
('81f2cb30-de95-40ce-be55-a23ebfe18b2e','8b0efaee-6d64-4fca-8671-146a19a5e4e0',''),
('81f2cb30-de95-40ce-be55-a23ebfe18b2e','8cf5e257-bdc3-4379-8b5c-37f0ec23c0c2',''),
('81f2cb30-de95-40ce-be55-a23ebfe18b2e','a7e6df0d-408b-4109-9772-e34e05344732','\0'),
('81f2cb30-de95-40ce-be55-a23ebfe18b2e','b3717553-2a8f-4b8e-9045-11117b33fd2e',''),
('81f2cb30-de95-40ce-be55-a23ebfe18b2e','bd17e7bb-c043-4a62-9be1-7668ea1dfbfc','\0'),
('81f2cb30-de95-40ce-be55-a23ebfe18b2e','dbf832eb-7dbb-439f-9a83-3bd44b2c0a41',''),
('81f2cb30-de95-40ce-be55-a23ebfe18b2e','ed6a4a0d-3eed-4202-8037-029ef0b450d0',''),
('9d42395c-eb37-4b6d-b23d-778fdb4b677a','431f2ce1-8af6-4ab7-bd75-46d6aab1bc28','\0'),
('9d42395c-eb37-4b6d-b23d-778fdb4b677a','58fa9b1f-cf48-45d0-b928-8908020a6e7e','\0'),
('9d42395c-eb37-4b6d-b23d-778fdb4b677a','8b0efaee-6d64-4fca-8671-146a19a5e4e0',''),
('9d42395c-eb37-4b6d-b23d-778fdb4b677a','8cf5e257-bdc3-4379-8b5c-37f0ec23c0c2',''),
('9d42395c-eb37-4b6d-b23d-778fdb4b677a','a7e6df0d-408b-4109-9772-e34e05344732','\0'),
('9d42395c-eb37-4b6d-b23d-778fdb4b677a','b3717553-2a8f-4b8e-9045-11117b33fd2e',''),
('9d42395c-eb37-4b6d-b23d-778fdb4b677a','bd17e7bb-c043-4a62-9be1-7668ea1dfbfc','\0'),
('9d42395c-eb37-4b6d-b23d-778fdb4b677a','dbf832eb-7dbb-439f-9a83-3bd44b2c0a41',''),
('9d42395c-eb37-4b6d-b23d-778fdb4b677a','ed6a4a0d-3eed-4202-8037-029ef0b450d0',''),
('b1965a6e-95cb-4113-a3c1-68aab6e81d49','431f2ce1-8af6-4ab7-bd75-46d6aab1bc28','\0'),
('b1965a6e-95cb-4113-a3c1-68aab6e81d49','58fa9b1f-cf48-45d0-b928-8908020a6e7e','\0'),
('b1965a6e-95cb-4113-a3c1-68aab6e81d49','8b0efaee-6d64-4fca-8671-146a19a5e4e0',''),
('b1965a6e-95cb-4113-a3c1-68aab6e81d49','8cf5e257-bdc3-4379-8b5c-37f0ec23c0c2',''),
('b1965a6e-95cb-4113-a3c1-68aab6e81d49','a7e6df0d-408b-4109-9772-e34e05344732','\0'),
('b1965a6e-95cb-4113-a3c1-68aab6e81d49','b3717553-2a8f-4b8e-9045-11117b33fd2e',''),
('b1965a6e-95cb-4113-a3c1-68aab6e81d49','bd17e7bb-c043-4a62-9be1-7668ea1dfbfc','\0'),
('b1965a6e-95cb-4113-a3c1-68aab6e81d49','dbf832eb-7dbb-439f-9a83-3bd44b2c0a41',''),
('b1965a6e-95cb-4113-a3c1-68aab6e81d49','ed6a4a0d-3eed-4202-8037-029ef0b450d0',''),
('fc44ee4f-6340-4d79-be98-2c78118d59e7','431f2ce1-8af6-4ab7-bd75-46d6aab1bc28','\0'),
('fc44ee4f-6340-4d79-be98-2c78118d59e7','58fa9b1f-cf48-45d0-b928-8908020a6e7e','\0'),
('fc44ee4f-6340-4d79-be98-2c78118d59e7','8b0efaee-6d64-4fca-8671-146a19a5e4e0',''),
('fc44ee4f-6340-4d79-be98-2c78118d59e7','8cf5e257-bdc3-4379-8b5c-37f0ec23c0c2',''),
('fc44ee4f-6340-4d79-be98-2c78118d59e7','a7e6df0d-408b-4109-9772-e34e05344732','\0'),
('fc44ee4f-6340-4d79-be98-2c78118d59e7','b3717553-2a8f-4b8e-9045-11117b33fd2e',''),
('fc44ee4f-6340-4d79-be98-2c78118d59e7','bd17e7bb-c043-4a62-9be1-7668ea1dfbfc','\0'),
('fc44ee4f-6340-4d79-be98-2c78118d59e7','dbf832eb-7dbb-439f-9a83-3bd44b2c0a41',''),
('fc44ee4f-6340-4d79-be98-2c78118d59e7','ed6a4a0d-3eed-4202-8037-029ef0b450d0','');
/*!40000 ALTER TABLE `CLIENT_SCOPE_CLIENT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_SCOPE_ROLE_MAPPING`
--

DROP TABLE IF EXISTS `CLIENT_SCOPE_ROLE_MAPPING`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CLIENT_SCOPE_ROLE_MAPPING` (
  `SCOPE_ID` varchar(36) NOT NULL,
  `ROLE_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`SCOPE_ID`,`ROLE_ID`),
  KEY `IDX_CLSCOPE_ROLE` (`SCOPE_ID`),
  KEY `IDX_ROLE_CLSCOPE` (`ROLE_ID`),
  CONSTRAINT `FK_CL_SCOPE_RM_SCOPE` FOREIGN KEY (`SCOPE_ID`) REFERENCES `CLIENT_SCOPE` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_SCOPE_ROLE_MAPPING`
--

LOCK TABLES `CLIENT_SCOPE_ROLE_MAPPING` WRITE;
/*!40000 ALTER TABLE `CLIENT_SCOPE_ROLE_MAPPING` DISABLE KEYS */;
INSERT INTO `CLIENT_SCOPE_ROLE_MAPPING` VALUES
('58fa9b1f-cf48-45d0-b928-8908020a6e7e','fe8ae4c5-6d90-4a32-b8d2-f307ea32bf78');
/*!40000 ALTER TABLE `CLIENT_SCOPE_ROLE_MAPPING` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_SESSION`
--

DROP TABLE IF EXISTS `CLIENT_SESSION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CLIENT_SESSION` (
  `ID` varchar(36) NOT NULL,
  `CLIENT_ID` varchar(36) DEFAULT NULL,
  `REDIRECT_URI` varchar(255) DEFAULT NULL,
  `STATE` varchar(255) DEFAULT NULL,
  `TIMESTAMP` int(11) DEFAULT NULL,
  `SESSION_ID` varchar(36) DEFAULT NULL,
  `AUTH_METHOD` varchar(255) DEFAULT NULL,
  `REALM_ID` varchar(255) DEFAULT NULL,
  `AUTH_USER_ID` varchar(36) DEFAULT NULL,
  `CURRENT_ACTION` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_CLIENT_SESSION_SESSION` (`SESSION_ID`),
  CONSTRAINT `FK_B4AO2VCVAT6UKAU74WBWTFQO1` FOREIGN KEY (`SESSION_ID`) REFERENCES `USER_SESSION` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_SESSION`
--

LOCK TABLES `CLIENT_SESSION` WRITE;
/*!40000 ALTER TABLE `CLIENT_SESSION` DISABLE KEYS */;
/*!40000 ALTER TABLE `CLIENT_SESSION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_SESSION_AUTH_STATUS`
--

DROP TABLE IF EXISTS `CLIENT_SESSION_AUTH_STATUS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CLIENT_SESSION_AUTH_STATUS` (
  `AUTHENTICATOR` varchar(36) NOT NULL,
  `STATUS` int(11) DEFAULT NULL,
  `CLIENT_SESSION` varchar(36) NOT NULL,
  PRIMARY KEY (`CLIENT_SESSION`,`AUTHENTICATOR`),
  CONSTRAINT `AUTH_STATUS_CONSTRAINT` FOREIGN KEY (`CLIENT_SESSION`) REFERENCES `CLIENT_SESSION` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_SESSION_AUTH_STATUS`
--

LOCK TABLES `CLIENT_SESSION_AUTH_STATUS` WRITE;
/*!40000 ALTER TABLE `CLIENT_SESSION_AUTH_STATUS` DISABLE KEYS */;
/*!40000 ALTER TABLE `CLIENT_SESSION_AUTH_STATUS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_SESSION_NOTE`
--

DROP TABLE IF EXISTS `CLIENT_SESSION_NOTE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CLIENT_SESSION_NOTE` (
  `NAME` varchar(255) NOT NULL,
  `VALUE` varchar(255) DEFAULT NULL,
  `CLIENT_SESSION` varchar(36) NOT NULL,
  PRIMARY KEY (`CLIENT_SESSION`,`NAME`),
  CONSTRAINT `FK5EDFB00FF51C2736` FOREIGN KEY (`CLIENT_SESSION`) REFERENCES `CLIENT_SESSION` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_SESSION_NOTE`
--

LOCK TABLES `CLIENT_SESSION_NOTE` WRITE;
/*!40000 ALTER TABLE `CLIENT_SESSION_NOTE` DISABLE KEYS */;
/*!40000 ALTER TABLE `CLIENT_SESSION_NOTE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_SESSION_PROT_MAPPER`
--

DROP TABLE IF EXISTS `CLIENT_SESSION_PROT_MAPPER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CLIENT_SESSION_PROT_MAPPER` (
  `PROTOCOL_MAPPER_ID` varchar(36) NOT NULL,
  `CLIENT_SESSION` varchar(36) NOT NULL,
  PRIMARY KEY (`CLIENT_SESSION`,`PROTOCOL_MAPPER_ID`),
  CONSTRAINT `FK_33A8SGQW18I532811V7O2DK89` FOREIGN KEY (`CLIENT_SESSION`) REFERENCES `CLIENT_SESSION` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_SESSION_PROT_MAPPER`
--

LOCK TABLES `CLIENT_SESSION_PROT_MAPPER` WRITE;
/*!40000 ALTER TABLE `CLIENT_SESSION_PROT_MAPPER` DISABLE KEYS */;
/*!40000 ALTER TABLE `CLIENT_SESSION_PROT_MAPPER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_SESSION_ROLE`
--

DROP TABLE IF EXISTS `CLIENT_SESSION_ROLE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CLIENT_SESSION_ROLE` (
  `ROLE_ID` varchar(255) NOT NULL,
  `CLIENT_SESSION` varchar(36) NOT NULL,
  PRIMARY KEY (`CLIENT_SESSION`,`ROLE_ID`),
  CONSTRAINT `FK_11B7SGQW18I532811V7O2DV76` FOREIGN KEY (`CLIENT_SESSION`) REFERENCES `CLIENT_SESSION` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_SESSION_ROLE`
--

LOCK TABLES `CLIENT_SESSION_ROLE` WRITE;
/*!40000 ALTER TABLE `CLIENT_SESSION_ROLE` DISABLE KEYS */;
/*!40000 ALTER TABLE `CLIENT_SESSION_ROLE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_USER_SESSION_NOTE`
--

DROP TABLE IF EXISTS `CLIENT_USER_SESSION_NOTE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CLIENT_USER_SESSION_NOTE` (
  `NAME` varchar(255) NOT NULL,
  `VALUE` text DEFAULT NULL,
  `CLIENT_SESSION` varchar(36) NOT NULL,
  PRIMARY KEY (`CLIENT_SESSION`,`NAME`),
  CONSTRAINT `FK_CL_USR_SES_NOTE` FOREIGN KEY (`CLIENT_SESSION`) REFERENCES `CLIENT_SESSION` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_USER_SESSION_NOTE`
--

LOCK TABLES `CLIENT_USER_SESSION_NOTE` WRITE;
/*!40000 ALTER TABLE `CLIENT_USER_SESSION_NOTE` DISABLE KEYS */;
/*!40000 ALTER TABLE `CLIENT_USER_SESSION_NOTE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `COMPONENT`
--

DROP TABLE IF EXISTS `COMPONENT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `COMPONENT` (
  `ID` varchar(36) NOT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  `PARENT_ID` varchar(36) DEFAULT NULL,
  `PROVIDER_ID` varchar(36) DEFAULT NULL,
  `PROVIDER_TYPE` varchar(255) DEFAULT NULL,
  `REALM_ID` varchar(36) DEFAULT NULL,
  `SUB_TYPE` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_COMPONENT_REALM` (`REALM_ID`),
  KEY `IDX_COMPONENT_PROVIDER_TYPE` (`PROVIDER_TYPE`),
  CONSTRAINT `FK_COMPONENT_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `COMPONENT`
--

LOCK TABLES `COMPONENT` WRITE;
/*!40000 ALTER TABLE `COMPONENT` DISABLE KEYS */;
INSERT INTO `COMPONENT` VALUES
('06a6db23-b5ec-48e0-8ae8-9dc115214c2b','Max Clients Limit','9edf1ebb-174b-478f-8959-7f2aa7617d22','max-clients','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','9edf1ebb-174b-478f-8959-7f2aa7617d22','anonymous'),
('159378ff-b83a-4015-a297-23ed193e07de','Consent Required','9edf1ebb-174b-478f-8959-7f2aa7617d22','consent-required','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','9edf1ebb-174b-478f-8959-7f2aa7617d22','anonymous'),
('2b7ec1fe-55f9-4fea-b62d-823ba2aeac81','first name','931754d0-7966-446e-be14-a033fd4c539a','user-attribute-ldap-mapper','org.keycloak.storage.ldap.mappers.LDAPStorageMapper','9edf1ebb-174b-478f-8959-7f2aa7617d22',NULL),
('45538860-8499-43bc-86e8-a87cd15fa609','Allowed Client Scopes','9edf1ebb-174b-478f-8959-7f2aa7617d22','allowed-client-templates','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','9edf1ebb-174b-478f-8959-7f2aa7617d22','authenticated'),
('59b1c317-5356-488f-8705-3d54355a95cd','creation date','931754d0-7966-446e-be14-a033fd4c539a','user-attribute-ldap-mapper','org.keycloak.storage.ldap.mappers.LDAPStorageMapper','9edf1ebb-174b-478f-8959-7f2aa7617d22',NULL),
('61c5ba4b-c734-41e2-94a4-7216846a5970','hmac-generated','9edf1ebb-174b-478f-8959-7f2aa7617d22','hmac-generated','org.keycloak.keys.KeyProvider','9edf1ebb-174b-478f-8959-7f2aa7617d22',NULL),
('6bea8f08-d953-404e-9d7d-98b5d9dc22be','aes-generated','9edf1ebb-174b-478f-8959-7f2aa7617d22','aes-generated','org.keycloak.keys.KeyProvider','9edf1ebb-174b-478f-8959-7f2aa7617d22',NULL),
('6ccf4ce0-46d0-4207-979f-b205d6e0a0b4','rsa-enc-generated','9edf1ebb-174b-478f-8959-7f2aa7617d22','rsa-enc-generated','org.keycloak.keys.KeyProvider','9edf1ebb-174b-478f-8959-7f2aa7617d22',NULL),
('6e6d6a9e-e85f-412f-83c0-be690b3a4b7b','email','931754d0-7966-446e-be14-a033fd4c539a','user-attribute-ldap-mapper','org.keycloak.storage.ldap.mappers.LDAPStorageMapper','9edf1ebb-174b-478f-8959-7f2aa7617d22',NULL),
('7466e980-c4b2-48e3-8435-885d0882ea57','Full Scope Disabled','9edf1ebb-174b-478f-8959-7f2aa7617d22','scope','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','9edf1ebb-174b-478f-8959-7f2aa7617d22','anonymous'),
('748092f5-6532-4c28-a74a-b2f4ac3ddacb','last name','931754d0-7966-446e-be14-a033fd4c539a','user-attribute-ldap-mapper','org.keycloak.storage.ldap.mappers.LDAPStorageMapper','9edf1ebb-174b-478f-8959-7f2aa7617d22',NULL),
('8689be74-d00a-4e4b-a263-45c70c4d681e','modify date','931754d0-7966-446e-be14-a033fd4c539a','user-attribute-ldap-mapper','org.keycloak.storage.ldap.mappers.LDAPStorageMapper','9edf1ebb-174b-478f-8959-7f2aa7617d22',NULL),
('931754d0-7966-446e-be14-a033fd4c539a','ldap','9edf1ebb-174b-478f-8959-7f2aa7617d22','ldap','org.keycloak.storage.UserStorageProvider','9edf1ebb-174b-478f-8959-7f2aa7617d22',NULL),
('9d547255-4076-49ac-aead-50a32d0b3557','Allowed Protocol Mapper Types','9edf1ebb-174b-478f-8959-7f2aa7617d22','allowed-protocol-mappers','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','9edf1ebb-174b-478f-8959-7f2aa7617d22','anonymous'),
('ae6bff29-1d5b-4ed8-bcc9-7ff33de72a8e','Allowed Client Scopes','9edf1ebb-174b-478f-8959-7f2aa7617d22','allowed-client-templates','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','9edf1ebb-174b-478f-8959-7f2aa7617d22','anonymous'),
('d08e5931-1d91-40c1-96f2-aca0b4896a02','Allowed Protocol Mapper Types','9edf1ebb-174b-478f-8959-7f2aa7617d22','allowed-protocol-mappers','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','9edf1ebb-174b-478f-8959-7f2aa7617d22','authenticated'),
('d5c4776f-2d79-475d-9586-65aab9707095','Trusted Hosts','9edf1ebb-174b-478f-8959-7f2aa7617d22','trusted-hosts','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','9edf1ebb-174b-478f-8959-7f2aa7617d22','anonymous'),
('d75eddc8-583f-456f-ad95-d1365c30f371','username','931754d0-7966-446e-be14-a033fd4c539a','user-attribute-ldap-mapper','org.keycloak.storage.ldap.mappers.LDAPStorageMapper','9edf1ebb-174b-478f-8959-7f2aa7617d22',NULL),
('fa13a54e-fbc6-45ce-a772-3c046f6855df','rsa-generated','9edf1ebb-174b-478f-8959-7f2aa7617d22','rsa-generated','org.keycloak.keys.KeyProvider','9edf1ebb-174b-478f-8959-7f2aa7617d22',NULL);
/*!40000 ALTER TABLE `COMPONENT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `COMPONENT_CONFIG`
--

DROP TABLE IF EXISTS `COMPONENT_CONFIG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `COMPONENT_CONFIG` (
  `ID` varchar(36) NOT NULL,
  `COMPONENT_ID` varchar(36) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `VALUE` varchar(4000) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_COMPO_CONFIG_COMPO` (`COMPONENT_ID`),
  CONSTRAINT `FK_COMPONENT_CONFIG` FOREIGN KEY (`COMPONENT_ID`) REFERENCES `COMPONENT` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `COMPONENT_CONFIG`
--

LOCK TABLES `COMPONENT_CONFIG` WRITE;
/*!40000 ALTER TABLE `COMPONENT_CONFIG` DISABLE KEYS */;
INSERT INTO `COMPONENT_CONFIG` VALUES
('050c5371-5a12-4111-a46d-298d17cc78eb','2b7ec1fe-55f9-4fea-b62d-823ba2aeac81','user.model.attribute','firstName'),
('05bb0e43-a722-404a-b953-cab176ef9b01','61c5ba4b-c734-41e2-94a4-7216846a5970','algorithm','HS256'),
('095758bf-8f66-4273-a0a0-672bb9d3540f','931754d0-7966-446e-be14-a033fd4c539a','vendor','other'),
('0ad6205e-b163-420d-859c-192e73bd16f0','2b7ec1fe-55f9-4fea-b62d-823ba2aeac81','read.only','true'),
('0b7789c1-6f0b-4ed7-9cac-5047914e5248','59b1c317-5356-488f-8705-3d54355a95cd','is.mandatory.in.ldap','false'),
('0d5e96e1-97a2-4b55-98c3-5dd8662e1f94','8689be74-d00a-4e4b-a263-45c70c4d681e','read.only','true'),
('0ec796c4-e255-462d-96c8-1dd10869dc2a','931754d0-7966-446e-be14-a033fd4c539a','syncRegistrations','true'),
('1050d817-51d5-47cb-8979-598b488ee48a','d75eddc8-583f-456f-ad95-d1365c30f371','user.model.attribute','username'),
('1510588e-531b-47da-93fb-48ac899f707d','931754d0-7966-446e-be14-a033fd4c539a','validatePasswordPolicy','false'),
('164d528d-e78b-4825-8c39-235cfae83b5e','931754d0-7966-446e-be14-a033fd4c539a','connectionUrl','ldap://192.168.2.101'),
('1a933b86-92cc-4719-a52f-e958d8c2f529','2b7ec1fe-55f9-4fea-b62d-823ba2aeac81','is.binary.attribute','false'),
('1e9f173a-7afc-471f-a9bb-1c50a3ef86ad','fa13a54e-fbc6-45ce-a772-3c046f6855df','certificate','MIICmzCCAYMCBgGG7/GWITANBgkqhkiG9w0BAQsFADARMQ8wDQYDVQQDDAZtYXN0ZXIwHhcNMjMwMzE3MTQxODUyWhcNMzMwMzE3MTQyMDMyWjARMQ8wDQYDVQQDDAZtYXN0ZXIwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQDTg0jYHlbUHwXbPtJ0hF3vCvxFQBluJstZlasO3lJxJ+Qbs2V55MTtD7pzoXfHSY2++hVS6oRB3kmWfGQI0wD3kEHFP7jEStl09+6Si0OxZ3ml+rgOgeIfuoW0YbP6NEUuucpV+I8Kb33PiVl5TghN9rIdU/Ziiipfq8nqNWSJtdH12U5Z1BqzWn/7SnFg+xyqlWG+uRBIFyQQ2oTIQ0rarpZaPeJgYCV9r+71UUcqDQQJY9DkRnWZEzkBkg6JJLu1coU30IPRvHMhSTcQXVKb41A1DTaMDQHnTkpRU+wChRDSkiko2FWQ5pmRqwHst/A/ROv9NHhFHB1mDsDjyi0tAgMBAAEwDQYJKoZIhvcNAQELBQADggEBAB4wlTppR/78fOc5/F6imPqgJu5/EmnkaiTMCRpwvn76FTdduiM9uJpCgwcPMjuns2YfK2su3pGxEKIQRM0zEF7L4v5toSM/K33KoE6235yFXkxYp0CiSg9wQgiEZpGzQhCR2GNu7vOh14/drZCajS+LCHT6KHq3TUgFIkyu8T9VlpuiYZHYwOVdJw5a23S8fkhywOkw1SzsPAq3zDYFqOMHm5jNzOTJq+zIxx9CjQK5KtEfa6m+eiay/zP0yWgHCW7TESYoftB9VSIWIcS3BmNer9IKCdvuKxuHlJcTCT+EP48SES3BXoLtj9lys1YhUWod59PorJKs6aGLIYZnMgk='),
('209b4863-eb19-4edf-aef1-61d7ac0fc6c8','59b1c317-5356-488f-8705-3d54355a95cd','ldap.attribute','createTimestamp'),
('20b8899f-eca5-4a01-9eda-ba2835c78d3d','931754d0-7966-446e-be14-a033fd4c539a','authType','simple'),
('2540be17-fba5-4808-a0f6-32fb9a84476f','9d547255-4076-49ac-aead-50a32d0b3557','allowed-protocol-mapper-types','oidc-address-mapper'),
('29a6e615-d506-4d20-8529-88df64a89759','d08e5931-1d91-40c1-96f2-aca0b4896a02','allowed-protocol-mapper-types','oidc-usermodel-attribute-mapper'),
('29c9a7ce-57a7-4490-bb05-5a8b30141521','8689be74-d00a-4e4b-a263-45c70c4d681e','always.read.value.from.ldap','true'),
('31e42c13-bb58-460b-83d2-57c7211e6871','d5c4776f-2d79-475d-9586-65aab9707095','host-sending-registration-request-must-match','true'),
('380dd3ee-fc6b-4725-b164-de50e1a28af2','6ccf4ce0-46d0-4207-979f-b205d6e0a0b4','privateKey','MIIEogIBAAKCAQEAqPpY2NlpaKM48t+WHy6kQCRMeHfHYv/zAaWwSLKA7mr1ltV7yVvnyPbejjIS6tvsGK+5Bps7jx2rujTuaqyqFpIwZ6gKT6xnwX4hdENTjiKSdD/WI3Cs7FPfNumsjArbYwDI7R7W4syLjqtIILo78K+xSlvqit/82tcM+slIVY6A4Yf6itwrXTfk3fUUWRBohsAxhC9RKWF8BZGf6sxe3qc7DpV1VINs45MkasA0WU4W3xqk+7LJX1UEr/gxYKkcVTZX65Av/Nmx5F95V4bbZeYHxCgM8IQ+Z0bHctPjp1/gn43/VY1p3srb70b3KOVbFOG0+ekWWrLJygcceYdwBwIDAQABAoIBABsEjELVNalpZP2ltOx0xLEMx2gA9CcReDAB51ci/hfLj6D3rryErrbPN3PSRdFk1dx3Ru+WJRu+SWroc7EoEmSxfdPVERupcUgwJqE0R/PTS0oTEDtyafO6JVfeXPG3UASwZ2/3x7FTtddbQ5kYAzrPR1r1qgwHwaIr/a32PlPkxkZ1pSvDatFAYQCWFxI1hXOoDbzwP2E362S2bt5bYrlWcEe+P1L6md/wppbcS0NB+5lWQBSbXoxrvLMVUffCq1UNawkf/QqigZlaI7OQQ4uiY/zPqIUIbpVAI+B/ndbJTHKOKq85YT/KLHrnFWw3K/L9IhprQp86/N18wwxUAOECgYEA5Snr80C6taEjY8mCxL8ZJ1Ip8Rlfz4lE3aHmuj6t08TEZ6TBCfswtQeMmbex95+6Slkom6yN5udWgxLrIN8YVX/n3bU03vO2bLYGZbzlnBobvxsG76qvS2U251Y6RuQk92XVz7uVDpY8znR1T0qhLZhJzgZcT1QVkhkYwX7eylMCgYEAvMQesToXAXYZEx5fCRI3CwnYcNSpF/v86L2XuKK3KMZWbKdl82GMxulqvj5erQ0qKAphFFjdVwYoLH5ZdSqTuwP/37dfwkOvPEqxnq+9HrEdEFwI+hvBYa+2mEUqzaFXbp67rHTmM4Ow5n6sYgvjXQZSp80UQqYfclAdFg7pFP0CgYAajrgscaTxpaH/T3wbJvZYSzpXGZSz7XmQodGmZdspPpVwWXSRno2vfRd7PQGf69/f++Mr31x2lPq+p/Od1JzyU6dgVz6wU9ghUxr8sV5+r7vlctFj9wjnmOw69RA95PSvwxp7P4bvsNONLYvmy4RQT2TGPpB2FQ2G5+epjPVuxwKBgCNFqk6HgkD9plXSOQPi6XIgltcOhcI7jdiXhMA1d3AhD4kiBoTh14Jbn1yJHvvLF/N/bQB2UnWuatdVjLW+DPjHGIrfIv+T0iy78FCsmfQgOEQUToEdqpbsVHxDgGoIGeRLuNnSxikeFHIdfWycuBFr2woL4htKG1oq6iRzCM6pAoGAX2huSq7xyyhl8qxosZmuwRKSlo0u25MDv3EcYEG6HjbD+HkgI1lvlyNASA/2oc6mDAZA46HOi3DorBwUhvzt8/D5YXaDsb3K8r1dgFvMdG+IYFv5h9N5oArDSyVtYu5ObSKUbVQP50pCKU5KSHQj7nbf5MfLpR4CtufWRcNssgk='),
('397a8941-3328-4183-a83c-354863fd5de8','d75eddc8-583f-456f-ad95-d1365c30f371','read.only','true'),
('3d2b0b38-828d-4429-a0a4-e45289b3c10b','931754d0-7966-446e-be14-a033fd4c539a','editMode','READ_ONLY'),
('3f6b8375-03e0-41eb-aea5-74c99d7d00a6','61c5ba4b-c734-41e2-94a4-7216846a5970','secret','MzID0iH7t7sB2Ppz6MjaHF-yMqDcv-7j5mbX66H7b00hl4aFbMxjxUqUpA4B__Ta7bjucj6SJ1A_Grm6OOhQWA'),
('4230790c-74e1-4af0-8979-3351be35c16a','d75eddc8-583f-456f-ad95-d1365c30f371','is.mandatory.in.ldap','true'),
('44d001e5-c33a-4f17-ac96-b361bdc4126a','931754d0-7966-446e-be14-a033fd4c539a','userObjectClasses','inetOrgPerson, posixAccount'),
('4a673a93-a0ce-43b1-a027-490520cf4fb4','6e6d6a9e-e85f-412f-83c0-be690b3a4b7b','is.mandatory.in.ldap','false'),
('4b9441ae-7c6e-4443-987e-51d46a48076c','931754d0-7966-446e-be14-a033fd4c539a','rdnLDAPAttribute','uid'),
('51a1174b-366d-4f4c-9a88-b4525d34cc72','2b7ec1fe-55f9-4fea-b62d-823ba2aeac81','attribute.force.default','false'),
('51dfc3de-c5fa-4af1-96e0-fcdf803ce83a','931754d0-7966-446e-be14-a033fd4c539a','useKerberosForPasswordAuthentication','false'),
('52410706-9fac-4927-81f7-eb68862e77cc','931754d0-7966-446e-be14-a033fd4c539a','uuidLDAPAttribute','uidNumber'),
('566ea4fb-e1b4-4ebc-b0c7-857762de68cf','6ccf4ce0-46d0-4207-979f-b205d6e0a0b4','algorithm','RSA-OAEP'),
('572ba124-e7c2-4d00-8955-d74b1b44a326','6bea8f08-d953-404e-9d7d-98b5d9dc22be','priority','100'),
('5bbec54b-f883-494c-bcf5-e23b4ca96600','59b1c317-5356-488f-8705-3d54355a95cd','user.model.attribute','createTimestamp'),
('5cd7281d-1974-4c87-8bca-f44aece3c193','748092f5-6532-4c28-a74a-b2f4ac3ddacb','always.read.value.from.ldap','true'),
('5e39bbfc-ac19-408e-87c6-ea5187ab9f8e','d08e5931-1d91-40c1-96f2-aca0b4896a02','allowed-protocol-mapper-types','saml-user-property-mapper'),
('5e5fc463-6744-4e89-8530-54b7d26d8df8','6e6d6a9e-e85f-412f-83c0-be690b3a4b7b','always.read.value.from.ldap','false'),
('6070c38e-3659-4e32-bb1b-9e7eb5daac29','931754d0-7966-446e-be14-a033fd4c539a','startTls','false'),
('641c8807-3098-4998-9ed5-ae87fc965738','748092f5-6532-4c28-a74a-b2f4ac3ddacb','ldap.attribute','sn'),
('64da913c-482e-45cb-aceb-5725c894a275','2b7ec1fe-55f9-4fea-b62d-823ba2aeac81','is.mandatory.in.ldap','true'),
('655699eb-ae4e-4bf4-8744-847b7ff9c4e9','931754d0-7966-446e-be14-a033fd4c539a','bindCredential','htoupee1'),
('66be0574-55db-48ed-b522-c7652b3fc501','59b1c317-5356-488f-8705-3d54355a95cd','read.only','true'),
('6993f171-7748-42b3-9542-15115ee61c7a','d08e5931-1d91-40c1-96f2-aca0b4896a02','allowed-protocol-mapper-types','oidc-sha256-pairwise-sub-mapper'),
('6d5cb110-3011-4a0b-9ddd-15ea5b8e9032','931754d0-7966-446e-be14-a033fd4c539a','allowKerberosAuthentication','false'),
('6df141bb-2739-461b-a9d2-dbc70aa64db4','931754d0-7966-446e-be14-a033fd4c539a','pagination','false'),
('6ea58d85-a7d2-4cb8-974e-9cbd692ffd15','931754d0-7966-446e-be14-a033fd4c539a','usePasswordModifyExtendedOp','false'),
('7416f1b4-e1c0-4411-8d87-c8ef3a7e121a','8689be74-d00a-4e4b-a263-45c70c4d681e','ldap.attribute','modifyTimestamp'),
('75da210d-7165-433f-9fe0-52cc92888a1a','9d547255-4076-49ac-aead-50a32d0b3557','allowed-protocol-mapper-types','saml-user-attribute-mapper'),
('76f768c8-33b8-4fd9-88b4-9ee9ee2299f7','931754d0-7966-446e-be14-a033fd4c539a','changedSyncPeriod','-1'),
('7a50e620-70b6-41f0-a7c2-ef0a8cd49055','9d547255-4076-49ac-aead-50a32d0b3557','allowed-protocol-mapper-types','saml-user-property-mapper'),
('7abda70d-e97b-40ca-a3a4-d639bbca1730','931754d0-7966-446e-be14-a033fd4c539a','trustEmail','true'),
('7cbbbcb3-9f26-455e-b84e-735b3166d24c','45538860-8499-43bc-86e8-a87cd15fa609','allow-default-scopes','true'),
('7d72c8be-09f1-43b1-9fdd-20a5a1ce4a48','9d547255-4076-49ac-aead-50a32d0b3557','allowed-protocol-mapper-types','oidc-full-name-mapper'),
('7d76a903-482d-424b-a72f-b08355c2140f','6bea8f08-d953-404e-9d7d-98b5d9dc22be','secret','a2T9i6YFeimIKmV_kGJq9Q'),
('804c5776-eac3-4e4d-801b-544f4213f7c1','d08e5931-1d91-40c1-96f2-aca0b4896a02','allowed-protocol-mapper-types','saml-role-list-mapper'),
('80f10d82-2746-4a7a-aa7f-65d9e82562ca','d75eddc8-583f-456f-ad95-d1365c30f371','ldap.attribute','uid'),
('884f8324-b3ab-497e-a09f-7797a4d6e96a','61c5ba4b-c734-41e2-94a4-7216846a5970','priority','100'),
('88aed222-c410-4bde-86c5-af00e561b6d1','6e6d6a9e-e85f-412f-83c0-be690b3a4b7b','ldap.attribute','mail'),
('939800a6-db27-492b-acae-0e93a53361ae','931754d0-7966-446e-be14-a033fd4c539a','connectionPooling','false'),
('99575a80-a1f0-4b4b-8a9b-6102c0a19a7b','9d547255-4076-49ac-aead-50a32d0b3557','allowed-protocol-mapper-types','oidc-usermodel-attribute-mapper'),
('9aa2b4bf-483b-4eb9-905b-304369e1fdde','fa13a54e-fbc6-45ce-a772-3c046f6855df','keyUse','SIG'),
('9b51a56f-47fd-4992-b7ab-b9f74a0c12fb','8689be74-d00a-4e4b-a263-45c70c4d681e','is.mandatory.in.ldap','false'),
('9cf22ed3-e82c-4835-bada-6cd4ce29b1ff','931754d0-7966-446e-be14-a033fd4c539a','cachePolicy','DEFAULT'),
('9efeca62-b044-4b45-a376-a77e6f8ae67c','d08e5931-1d91-40c1-96f2-aca0b4896a02','allowed-protocol-mapper-types','saml-user-attribute-mapper'),
('a14ec2d6-b37f-422d-9d17-c42e24c3193f','931754d0-7966-446e-be14-a033fd4c539a','enabled','true'),
('a282dc3f-7e1f-4e1f-a28f-81d4d27b13dd','6e6d6a9e-e85f-412f-83c0-be690b3a4b7b','read.only','true'),
('a4e33dd7-5a5b-4073-afe7-cf1c88716cc3','2b7ec1fe-55f9-4fea-b62d-823ba2aeac81','always.read.value.from.ldap','true'),
('a6abee9f-cb1d-48e2-ae7e-da6ee4d3758d','931754d0-7966-446e-be14-a033fd4c539a','importEnabled','true'),
('a981cd7a-0ea8-487c-b086-913e6f083506','9d547255-4076-49ac-aead-50a32d0b3557','allowed-protocol-mapper-types','oidc-usermodel-property-mapper'),
('aca8f78e-120d-470c-91d5-7550758e72ab','931754d0-7966-446e-be14-a033fd4c539a','usersDn','ou=users,dc=home,dc=kube'),
('ad939654-1cd3-4abd-9830-08e1fa149718','d08e5931-1d91-40c1-96f2-aca0b4896a02','allowed-protocol-mapper-types','oidc-full-name-mapper'),
('b2f809fa-b79e-4661-b59c-fe233ba937ab','9d547255-4076-49ac-aead-50a32d0b3557','allowed-protocol-mapper-types','oidc-sha256-pairwise-sub-mapper'),
('b419e5c5-ac77-41f9-a592-16f02e1457aa','ae6bff29-1d5b-4ed8-bcc9-7ff33de72a8e','allow-default-scopes','true'),
('b56b7e9e-0dbd-4659-8860-585eba04e1d2','931754d0-7966-446e-be14-a033fd4c539a','useTruststoreSpi','ldapsOnly'),
('b96122d8-4849-4496-ba42-19624f44b723','d08e5931-1d91-40c1-96f2-aca0b4896a02','allowed-protocol-mapper-types','oidc-usermodel-property-mapper'),
('ba7aed67-d589-4aa3-97c3-ddc4417fd128','6bea8f08-d953-404e-9d7d-98b5d9dc22be','kid','d827f508-7176-4f6c-ac21-1c2437255750'),
('bef7a463-c771-45cb-9c91-85b46c4475cb','59b1c317-5356-488f-8705-3d54355a95cd','always.read.value.from.ldap','true'),
('c3b832d5-5f97-4e58-bf22-68f38368c9ab','61c5ba4b-c734-41e2-94a4-7216846a5970','kid','8e31c5df-1a8e-4eff-967c-39136d0badfe'),
('cd81fc1c-0102-420d-96d2-3aea7c16da1d','6e6d6a9e-e85f-412f-83c0-be690b3a4b7b','user.model.attribute','email'),
('ceb055b6-ba2d-4b3f-8033-bb17446b7ce1','06a6db23-b5ec-48e0-8ae8-9dc115214c2b','max-clients','200'),
('d17b9eab-a993-40e1-953c-7150a2706eac','931754d0-7966-446e-be14-a033fd4c539a','usernameLDAPAttribute','uid'),
('d52fe9ca-0757-498c-b366-aff4f6e10501','d08e5931-1d91-40c1-96f2-aca0b4896a02','allowed-protocol-mapper-types','oidc-address-mapper'),
('d72505b4-7980-4ec0-b168-31a6e0d554b8','2b7ec1fe-55f9-4fea-b62d-823ba2aeac81','ldap.attribute','givenName'),
('d86611a6-260b-4e74-bccd-3e78ee871aa7','748092f5-6532-4c28-a74a-b2f4ac3ddacb','user.model.attribute','lastName'),
('ddb570cd-0ad3-41ce-b390-e8c85d45fef0','748092f5-6532-4c28-a74a-b2f4ac3ddacb','is.mandatory.in.ldap','true'),
('df8a80be-56f8-4197-96d9-78ed315ba890','6ccf4ce0-46d0-4207-979f-b205d6e0a0b4','certificate','MIICmzCCAYMCBgGG7/GWhDANBgkqhkiG9w0BAQsFADARMQ8wDQYDVQQDDAZtYXN0ZXIwHhcNMjMwMzE3MTQxODUyWhcNMzMwMzE3MTQyMDMyWjARMQ8wDQYDVQQDDAZtYXN0ZXIwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQCo+ljY2Wloozjy35YfLqRAJEx4d8di//MBpbBIsoDuavWW1XvJW+fI9t6OMhLq2+wYr7kGmzuPHau6NO5qrKoWkjBnqApPrGfBfiF0Q1OOIpJ0P9YjcKzsU9826ayMCttjAMjtHtbizIuOq0ggujvwr7FKW+qK3/za1wz6yUhVjoDhh/qK3CtdN+Td9RRZEGiGwDGEL1EpYXwFkZ/qzF7epzsOlXVUg2zjkyRqwDRZThbfGqT7sslfVQSv+DFgqRxVNlfrkC/82bHkX3lXhttl5gfEKAzwhD5nRsdy0+OnX+Cfjf9VjWneytvvRvco5VsU4bT56RZassnKBxx5h3AHAgMBAAEwDQYJKoZIhvcNAQELBQADggEBAKPDAf5qciVUD50p2otXMelX7UMO25EzQBclZm9V/fe2uV17KuO03bYvhg/+66IS8ODhgMPZjtXfBFrsS/2/rZisoGtRueuxY8XO6QLCHSM5JVYqT3hlw6BfkjxYRN3T3A0lifmCl0i7OufY2x4ya44kXbZav8XxhWvqiRCn46+tPt1f03ldbmc1ylQPUcz+iPYvgK4Fw5mk5yAlCcr7h/lNsoeZ6k4nI4xN+7WJVr95a00ZYOIxI86z2B4Ek2xejsFQmI1/jlb3dg3F2k4viy6Zi/A04CWHEkXZvn7WkvBGmOxu1vhVykcfOBwWYMJYYi/6DdlBa6GUE50rKtW4uUA='),
('e17398bc-2c46-4a62-b914-d23a5a680640','8689be74-d00a-4e4b-a263-45c70c4d681e','user.model.attribute','modifyTimestamp'),
('e4cc2ab5-12c2-4505-b8ef-2556f389e4df','9d547255-4076-49ac-aead-50a32d0b3557','allowed-protocol-mapper-types','saml-role-list-mapper'),
('e70d2857-f61e-482e-bea8-1c32bfdf9197','6ccf4ce0-46d0-4207-979f-b205d6e0a0b4','keyUse','ENC'),
('e937de9f-5e5e-428a-b087-5eaef2d40f20','d75eddc8-583f-456f-ad95-d1365c30f371','always.read.value.from.ldap','false'),
('ee9c3c3e-a43a-44cb-8c0e-2a24d3c0cfb7','6ccf4ce0-46d0-4207-979f-b205d6e0a0b4','priority','100'),
('f058db6d-6548-41bb-96d7-367582d0a99b','931754d0-7966-446e-be14-a033fd4c539a','fullSyncPeriod','-1'),
('f1dd5fa8-1582-464b-8eda-939bfcf121f4','fa13a54e-fbc6-45ce-a772-3c046f6855df','priority','100'),
('f3188242-76fe-441b-b482-83a30c5ba8ae','d5c4776f-2d79-475d-9586-65aab9707095','client-uris-must-match','true'),
('f487ca39-c510-4463-b02d-6317ab61ab33','748092f5-6532-4c28-a74a-b2f4ac3ddacb','read.only','true'),
('f60642e7-36e3-4a47-90c9-2a8f61a90b32','931754d0-7966-446e-be14-a033fd4c539a','bindDn','cn=admin,dc=home,dc=kube'),
('f811dbe3-40df-433e-bc0d-9e3f82f429e9','fa13a54e-fbc6-45ce-a772-3c046f6855df','privateKey','MIIEowIBAAKCAQEA04NI2B5W1B8F2z7SdIRd7wr8RUAZbibLWZWrDt5ScSfkG7NleeTE7Q+6c6F3x0mNvvoVUuqEQd5JlnxkCNMA95BBxT+4xErZdPfukotDsWd5pfq4DoHiH7qFtGGz+jRFLrnKVfiPCm99z4lZeU4ITfayHVP2YooqX6vJ6jVkibXR9dlOWdQas1p/+0pxYPscqpVhvrkQSBckENqEyENK2q6WWj3iYGAlfa/u9VFHKg0ECWPQ5EZ1mRM5AZIOiSS7tXKFN9CD0bxzIUk3EF1Sm+NQNQ02jA0B505KUVPsAoUQ0pIpKNhVkOaZkasB7LfwP0Tr/TR4RRwdZg7A48otLQIDAQABAoIBADiV7d4Lt9UF+64dD3amlu7FtJnePS9v54Uu+lV++vVU47zZcLN8lYaKZ6pZr068idRm2V+WaA2rJ2rAGo8VzDNu/3mCw66YC7c0QTopUdHbSfsyqR0QeGtenjiUzu6IH14RzGTVm4cCLtlf+HTwgF5DOoGIHelc51sy/VDQOfZxFnvQM4l0MFUhEquti0GTcmXmF0csa9stGg3AMqlWkw/0R+kacqb/NAREqg8AXPpi1wGgShJHTvrYD/eKgCriDbDziDTxaLqknWMv9JeAELIZS/brzSZPqr1ooSDS415Wygx0hRKBtg4tpKIKNAFiY/nxrfhAws7zWaNfQbKXyQ0CgYEA8wZQuRrvsEaAUmiStlofRFZezbgSQhmx2XVlPn6NjimkHVxkZoW9bnjuVN/JyLfsu5Hm37n9f0bYzSHQc3Fzq7kc0srr+Zzz2/tqa0eOqjxt/qfu/19T2yU4jTJHZBqIyCd4gLb+sOYC3PY9R/DYr5TLLCG0vxZa+vSunA2yjasCgYEA3s5DKh910OQBYn2sqfiVUojbfo8AHphTqiTdY3ezIdq8iMUL2KqV8FXa5pV1GM/Homq8rhRoOCA4EsjIMfWfy66UujNmQqGSJIhdKBmhBs9cWZBkX1rotMvCkDsn3HjazEsL2jCo4dU478JbfThqs6xksi1e8XHUTA9UxMc8aIcCgYEAwWEUGMcjVRw0fd6yZ6H84U7s7zt6Y9i4WXZ90qW3FBl0etyLE712CBL4atcMZMhd+r9VfE8uNPn2B/zRNxte1JVfJyjLbvuCXFiJzMXK8xFU4V9V4SVEv8u1XT1V64TltIcb7yguMCtGufbCup0ef1Ch/wLvJWKvkKPk0U5g9zMCgYB9q298wdPtJ72UNPh/wmNO8zyCjNvvZdHC5RouMWTLUpoGtsWwxr7dmT9n0aMDhKbAeF3F/mKuTZXzGma4rycbdnQS9kzWhlVs37FTnekSc0FOjz/d/OPGnis2uPcJxuz6T9X2kn2fK2n66fA6l+ivQSxmx2qG2sJ4yCjy+MGc3wKBgGiaa8dotc07d1PXk8Hxv39bFEmSljoySTZPUWCqVBCA9BbaxynAGs8zedshoWVMO7F1mUozpKxElWvbDhpdoWUmc7rAp1tbsIXaTqyduqa7x2+MTAgCUnQ0vwHQ4JPN7C/Hs7D+1mUpYsb89hJsJqseIGBOmrKH0Gs84IjxYlpT');
/*!40000 ALTER TABLE `COMPONENT_CONFIG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `COMPOSITE_ROLE`
--

DROP TABLE IF EXISTS `COMPOSITE_ROLE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `COMPOSITE_ROLE` (
  `COMPOSITE` varchar(36) NOT NULL,
  `CHILD_ROLE` varchar(36) NOT NULL,
  PRIMARY KEY (`COMPOSITE`,`CHILD_ROLE`),
  KEY `IDX_COMPOSITE` (`COMPOSITE`),
  KEY `IDX_COMPOSITE_CHILD` (`CHILD_ROLE`),
  CONSTRAINT `FK_A63WVEKFTU8JO1PNJ81E7MCE2` FOREIGN KEY (`COMPOSITE`) REFERENCES `KEYCLOAK_ROLE` (`ID`),
  CONSTRAINT `FK_GR7THLLB9LU8Q4VQA4524JJY8` FOREIGN KEY (`CHILD_ROLE`) REFERENCES `KEYCLOAK_ROLE` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `COMPOSITE_ROLE`
--

LOCK TABLES `COMPOSITE_ROLE` WRITE;
/*!40000 ALTER TABLE `COMPOSITE_ROLE` DISABLE KEYS */;
INSERT INTO `COMPOSITE_ROLE` VALUES
('28d9b980-6fb1-463e-9d54-3824bbbad6cb','70b6fe7e-651f-4a6f-8858-70e2897c9c97'),
('395f4d73-14cb-40e5-8854-dc16a72be6aa','92790851-e2c4-4230-ac45-a7c169c9945e'),
('66c78894-c1a3-47a4-bdc2-176f334e5a13','56f3101c-22ff-419a-bf6c-0c13aa44507c'),
('66c78894-c1a3-47a4-bdc2-176f334e5a13','d6098b1f-49a8-4291-96c6-815f0347994e'),
('a924937c-0f91-4518-b45c-934f47074999','13be511e-cd78-4ae3-ae42-6cde3798a334'),
('a924937c-0f91-4518-b45c-934f47074999','395f4d73-14cb-40e5-8854-dc16a72be6aa'),
('a924937c-0f91-4518-b45c-934f47074999','e3d78c12-d72a-44dc-a591-1baec8b675e9'),
('a924937c-0f91-4518-b45c-934f47074999','fe8ae4c5-6d90-4a32-b8d2-f307ea32bf78'),
('a9f30435-c860-40d4-931f-8a31e60e8a91','20eba594-a329-45a3-8e64-4ce51815323b'),
('a9f30435-c860-40d4-931f-8a31e60e8a91','2255021e-924c-410b-b3ee-ec21bc5e2f5e'),
('a9f30435-c860-40d4-931f-8a31e60e8a91','2ac01fff-307a-4301-be52-2b14aca93112'),
('a9f30435-c860-40d4-931f-8a31e60e8a91','4a6d260a-0071-4f34-ab73-641365dcac91'),
('a9f30435-c860-40d4-931f-8a31e60e8a91','56f3101c-22ff-419a-bf6c-0c13aa44507c'),
('a9f30435-c860-40d4-931f-8a31e60e8a91','57839a72-de83-45d7-a58f-00d93eb444d0'),
('a9f30435-c860-40d4-931f-8a31e60e8a91','66c78894-c1a3-47a4-bdc2-176f334e5a13'),
('a9f30435-c860-40d4-931f-8a31e60e8a91','80d91362-8fb7-4dcb-a979-bfa68b4f8415'),
('a9f30435-c860-40d4-931f-8a31e60e8a91','8d9f1dfb-6cfb-41c0-8f4f-eede7269bd13'),
('a9f30435-c860-40d4-931f-8a31e60e8a91','b26ea811-6cd9-49db-9670-544feadeb332'),
('a9f30435-c860-40d4-931f-8a31e60e8a91','b3919b1b-74c4-4673-a109-696eda56bca9'),
('a9f30435-c860-40d4-931f-8a31e60e8a91','b9e411d0-4dbe-49e2-a3d6-966a7e19f291'),
('a9f30435-c860-40d4-931f-8a31e60e8a91','d3c34be6-cf43-4f6e-8058-2a9e2d2b5c71'),
('a9f30435-c860-40d4-931f-8a31e60e8a91','d6098b1f-49a8-4291-96c6-815f0347994e'),
('a9f30435-c860-40d4-931f-8a31e60e8a91','dd468ed4-1813-4a54-965d-65555dbe6101'),
('a9f30435-c860-40d4-931f-8a31e60e8a91','e1bb87ef-8533-43ec-80de-17046879eecc'),
('a9f30435-c860-40d4-931f-8a31e60e8a91','f07f7de8-fd29-419c-8906-d3e71dbefdb9'),
('a9f30435-c860-40d4-931f-8a31e60e8a91','f0b8c1ec-7de3-4c00-87b5-f3b8c71e4c07'),
('a9f30435-c860-40d4-931f-8a31e60e8a91','f2907a1a-7bef-4c5f-9fba-7574a649ece5'),
('b26ea811-6cd9-49db-9670-544feadeb332','dd468ed4-1813-4a54-965d-65555dbe6101');
/*!40000 ALTER TABLE `COMPOSITE_ROLE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CREDENTIAL`
--

DROP TABLE IF EXISTS `CREDENTIAL`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CREDENTIAL` (
  `ID` varchar(36) NOT NULL,
  `SALT` tinyblob DEFAULT NULL,
  `TYPE` varchar(255) DEFAULT NULL,
  `USER_ID` varchar(36) DEFAULT NULL,
  `CREATED_DATE` bigint(20) DEFAULT NULL,
  `USER_LABEL` varchar(255) DEFAULT NULL,
  `SECRET_DATA` longtext DEFAULT NULL,
  `CREDENTIAL_DATA` longtext DEFAULT NULL,
  `PRIORITY` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_USER_CREDENTIAL` (`USER_ID`),
  CONSTRAINT `FK_PFYR0GLASQYL0DEI3KL69R6V0` FOREIGN KEY (`USER_ID`) REFERENCES `USER_ENTITY` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CREDENTIAL`
--

LOCK TABLES `CREDENTIAL` WRITE;
/*!40000 ALTER TABLE `CREDENTIAL` DISABLE KEYS */;
INSERT INTO `CREDENTIAL` VALUES
('8497ae9c-4481-494f-bef1-15296c117ac8',NULL,'password','5bf249a2-b2b0-400e-83e8-dca97d132125',1679062834353,NULL,'{\"value\":\"F4ZWxBJMUPwWmJvFj5E2gDgW3B7ov4zCKftOIcYnLUk=\",\"salt\":\"SXjNXUAHuADNgWa4WG5yUA==\",\"additionalParameters\":{}}','{\"hashIterations\":27500,\"algorithm\":\"pbkdf2-sha256\",\"additionalParameters\":{}}',10);
/*!40000 ALTER TABLE `CREDENTIAL` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DATABASECHANGELOG`
--

DROP TABLE IF EXISTS `DATABASECHANGELOG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DATABASECHANGELOG` (
  `ID` varchar(255) NOT NULL,
  `AUTHOR` varchar(255) NOT NULL,
  `FILENAME` varchar(255) NOT NULL,
  `DATEEXECUTED` datetime NOT NULL,
  `ORDEREXECUTED` int(11) NOT NULL,
  `EXECTYPE` varchar(10) NOT NULL,
  `MD5SUM` varchar(35) DEFAULT NULL,
  `DESCRIPTION` varchar(255) DEFAULT NULL,
  `COMMENTS` varchar(255) DEFAULT NULL,
  `TAG` varchar(255) DEFAULT NULL,
  `LIQUIBASE` varchar(20) DEFAULT NULL,
  `CONTEXTS` varchar(255) DEFAULT NULL,
  `LABELS` varchar(255) DEFAULT NULL,
  `DEPLOYMENT_ID` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DATABASECHANGELOG`
--

LOCK TABLES `DATABASECHANGELOG` WRITE;
/*!40000 ALTER TABLE `DATABASECHANGELOG` DISABLE KEYS */;
INSERT INTO `DATABASECHANGELOG` VALUES
('1.0.0.Final-KEYCLOAK-5461','sthorger@redhat.com','META-INF/jpa-changelog-1.0.0.Final.xml','2023-03-17 14:18:15',1,'EXECUTED','8:bda77d94bf90182a1e30c24f1c155ec7','createTable tableName=APPLICATION_DEFAULT_ROLES; createTable tableName=CLIENT; createTable tableName=CLIENT_SESSION; createTable tableName=CLIENT_SESSION_ROLE; createTable tableName=COMPOSITE_ROLE; createTable tableName=CREDENTIAL; createTable tab...','',NULL,'4.16.1',NULL,NULL,'9062602763'),
('1.0.0.Final-KEYCLOAK-5461','sthorger@redhat.com','META-INF/db2-jpa-changelog-1.0.0.Final.xml','2023-03-17 14:18:15',2,'MARK_RAN','8:1ecb330f30986693d1cba9ab579fa219','createTable tableName=APPLICATION_DEFAULT_ROLES; createTable tableName=CLIENT; createTable tableName=CLIENT_SESSION; createTable tableName=CLIENT_SESSION_ROLE; createTable tableName=COMPOSITE_ROLE; createTable tableName=CREDENTIAL; createTable tab...','',NULL,'4.16.1',NULL,NULL,'9062602763'),
('1.1.0.Beta1','sthorger@redhat.com','META-INF/jpa-changelog-1.1.0.Beta1.xml','2023-03-17 14:18:18',3,'EXECUTED','8:cb7ace19bc6d959f305605d255d4c843','delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION; createTable tableName=CLIENT_ATTRIBUTES; createTable tableName=CLIENT_SESSION_NOTE; createTable tableName=APP_NODE_REGISTRATIONS; addColumn table...','',NULL,'4.16.1',NULL,NULL,'9062602763'),
('1.1.0.Final','sthorger@redhat.com','META-INF/jpa-changelog-1.1.0.Final.xml','2023-03-17 14:18:18',4,'EXECUTED','8:80230013e961310e6872e871be424a63','renameColumn newColumnName=EVENT_TIME, oldColumnName=TIME, tableName=EVENT_ENTITY','',NULL,'4.16.1',NULL,NULL,'9062602763'),
('1.2.0.Beta1','psilva@redhat.com','META-INF/jpa-changelog-1.2.0.Beta1.xml','2023-03-17 14:18:27',5,'EXECUTED','8:67f4c20929126adc0c8e9bf48279d244','delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION; createTable tableName=PROTOCOL_MAPPER; createTable tableName=PROTOCOL_MAPPER_CONFIG; createTable tableName=...','',NULL,'4.16.1',NULL,NULL,'9062602763'),
('1.2.0.Beta1','psilva@redhat.com','META-INF/db2-jpa-changelog-1.2.0.Beta1.xml','2023-03-17 14:18:27',6,'MARK_RAN','8:7311018b0b8179ce14628ab412bb6783','delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION; createTable tableName=PROTOCOL_MAPPER; createTable tableName=PROTOCOL_MAPPER_CONFIG; createTable tableName=...','',NULL,'4.16.1',NULL,NULL,'9062602763'),
('1.2.0.RC1','bburke@redhat.com','META-INF/jpa-changelog-1.2.0.CR1.xml','2023-03-17 14:18:37',7,'EXECUTED','8:037ba1216c3640f8785ee6b8e7c8e3c1','delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete tableName=USER_SESSION; createTable tableName=MIGRATION_MODEL; createTable tableName=IDENTITY_P...','',NULL,'4.16.1',NULL,NULL,'9062602763'),
('1.2.0.RC1','bburke@redhat.com','META-INF/db2-jpa-changelog-1.2.0.CR1.xml','2023-03-17 14:18:37',8,'MARK_RAN','8:7fe6ffe4af4df289b3157de32c624263','delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete tableName=USER_SESSION; createTable tableName=MIGRATION_MODEL; createTable tableName=IDENTITY_P...','',NULL,'4.16.1',NULL,NULL,'9062602763'),
('1.2.0.Final','keycloak','META-INF/jpa-changelog-1.2.0.Final.xml','2023-03-17 14:18:37',9,'EXECUTED','8:9c136bc3187083a98745c7d03bc8a303','update tableName=CLIENT; update tableName=CLIENT; update tableName=CLIENT','',NULL,'4.16.1',NULL,NULL,'9062602763'),
('1.3.0','bburke@redhat.com','META-INF/jpa-changelog-1.3.0.xml','2023-03-17 14:18:47',10,'EXECUTED','8:b5f09474dca81fb56a97cf5b6553d331','delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete tableName=USER_SESSION; createTable tableName=ADMI...','',NULL,'4.16.1',NULL,NULL,'9062602763'),
('1.4.0','bburke@redhat.com','META-INF/jpa-changelog-1.4.0.xml','2023-03-17 14:18:51',11,'EXECUTED','8:ca924f31bd2a3b219fdcfe78c82dacf4','delete tableName=CLIENT_SESSION_AUTH_STATUS; delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete table...','',NULL,'4.16.1',NULL,NULL,'9062602763'),
('1.4.0','bburke@redhat.com','META-INF/db2-jpa-changelog-1.4.0.xml','2023-03-17 14:18:51',12,'MARK_RAN','8:8acad7483e106416bcfa6f3b824a16cd','delete tableName=CLIENT_SESSION_AUTH_STATUS; delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete table...','',NULL,'4.16.1',NULL,NULL,'9062602763'),
('1.5.0','bburke@redhat.com','META-INF/jpa-changelog-1.5.0.xml','2023-03-17 14:18:52',13,'EXECUTED','8:9b1266d17f4f87c78226f5055408fd5e','delete tableName=CLIENT_SESSION_AUTH_STATUS; delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete table...','',NULL,'4.16.1',NULL,NULL,'9062602763'),
('1.6.1_from15','mposolda@redhat.com','META-INF/jpa-changelog-1.6.1.xml','2023-03-17 14:18:53',14,'EXECUTED','8:d80ec4ab6dbfe573550ff72396c7e910','addColumn tableName=REALM; addColumn tableName=KEYCLOAK_ROLE; addColumn tableName=CLIENT; createTable tableName=OFFLINE_USER_SESSION; createTable tableName=OFFLINE_CLIENT_SESSION; addPrimaryKey constraintName=CONSTRAINT_OFFL_US_SES_PK2, tableName=...','',NULL,'4.16.1',NULL,NULL,'9062602763'),
('1.6.1_from16-pre','mposolda@redhat.com','META-INF/jpa-changelog-1.6.1.xml','2023-03-17 14:18:53',15,'MARK_RAN','8:d86eb172171e7c20b9c849b584d147b2','delete tableName=OFFLINE_CLIENT_SESSION; delete tableName=OFFLINE_USER_SESSION','',NULL,'4.16.1',NULL,NULL,'9062602763'),
('1.6.1_from16','mposolda@redhat.com','META-INF/jpa-changelog-1.6.1.xml','2023-03-17 14:18:53',16,'MARK_RAN','8:5735f46f0fa60689deb0ecdc2a0dea22','dropPrimaryKey constraintName=CONSTRAINT_OFFLINE_US_SES_PK, tableName=OFFLINE_USER_SESSION; dropPrimaryKey constraintName=CONSTRAINT_OFFLINE_CL_SES_PK, tableName=OFFLINE_CLIENT_SESSION; addColumn tableName=OFFLINE_USER_SESSION; update tableName=OF...','',NULL,'4.16.1',NULL,NULL,'9062602763'),
('1.6.1','mposolda@redhat.com','META-INF/jpa-changelog-1.6.1.xml','2023-03-17 14:18:53',17,'EXECUTED','8:d41d8cd98f00b204e9800998ecf8427e','empty','',NULL,'4.16.1',NULL,NULL,'9062602763'),
('1.7.0','bburke@redhat.com','META-INF/jpa-changelog-1.7.0.xml','2023-03-17 14:18:59',18,'EXECUTED','8:5c1a8fd2014ac7fc43b90a700f117b23','createTable tableName=KEYCLOAK_GROUP; createTable tableName=GROUP_ROLE_MAPPING; createTable tableName=GROUP_ATTRIBUTE; createTable tableName=USER_GROUP_MEMBERSHIP; createTable tableName=REALM_DEFAULT_GROUPS; addColumn tableName=IDENTITY_PROVIDER; ...','',NULL,'4.16.1',NULL,NULL,'9062602763'),
('1.8.0','mposolda@redhat.com','META-INF/jpa-changelog-1.8.0.xml','2023-03-17 14:19:04',19,'EXECUTED','8:1f6c2c2dfc362aff4ed75b3f0ef6b331','addColumn tableName=IDENTITY_PROVIDER; createTable tableName=CLIENT_TEMPLATE; createTable tableName=CLIENT_TEMPLATE_ATTRIBUTES; createTable tableName=TEMPLATE_SCOPE_MAPPING; dropNotNullConstraint columnName=CLIENT_ID, tableName=PROTOCOL_MAPPER; ad...','',NULL,'4.16.1',NULL,NULL,'9062602763'),
('1.8.0-2','keycloak','META-INF/jpa-changelog-1.8.0.xml','2023-03-17 14:19:04',20,'EXECUTED','8:dee9246280915712591f83a127665107','dropDefaultValue columnName=ALGORITHM, tableName=CREDENTIAL; update tableName=CREDENTIAL','',NULL,'4.16.1',NULL,NULL,'9062602763'),
('1.8.0','mposolda@redhat.com','META-INF/db2-jpa-changelog-1.8.0.xml','2023-03-17 14:19:04',21,'MARK_RAN','8:9eb2ee1fa8ad1c5e426421a6f8fdfa6a','addColumn tableName=IDENTITY_PROVIDER; createTable tableName=CLIENT_TEMPLATE; createTable tableName=CLIENT_TEMPLATE_ATTRIBUTES; createTable tableName=TEMPLATE_SCOPE_MAPPING; dropNotNullConstraint columnName=CLIENT_ID, tableName=PROTOCOL_MAPPER; ad...','',NULL,'4.16.1',NULL,NULL,'9062602763'),
('1.8.0-2','keycloak','META-INF/db2-jpa-changelog-1.8.0.xml','2023-03-17 14:19:04',22,'MARK_RAN','8:dee9246280915712591f83a127665107','dropDefaultValue columnName=ALGORITHM, tableName=CREDENTIAL; update tableName=CREDENTIAL','',NULL,'4.16.1',NULL,NULL,'9062602763'),
('1.9.0','mposolda@redhat.com','META-INF/jpa-changelog-1.9.0.xml','2023-03-17 14:19:06',23,'EXECUTED','8:d9fa18ffa355320395b86270680dd4fe','update tableName=REALM; update tableName=REALM; update tableName=REALM; update tableName=REALM; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=REALM; update tableName=REALM; customChange; dr...','',NULL,'4.16.1',NULL,NULL,'9062602763'),
('1.9.1','keycloak','META-INF/jpa-changelog-1.9.1.xml','2023-03-17 14:19:06',24,'EXECUTED','8:90cff506fedb06141ffc1c71c4a1214c','modifyDataType columnName=PRIVATE_KEY, tableName=REALM; modifyDataType columnName=PUBLIC_KEY, tableName=REALM; modifyDataType columnName=CERTIFICATE, tableName=REALM','',NULL,'4.16.1',NULL,NULL,'9062602763'),
('1.9.1','keycloak','META-INF/db2-jpa-changelog-1.9.1.xml','2023-03-17 14:19:06',25,'MARK_RAN','8:11a788aed4961d6d29c427c063af828c','modifyDataType columnName=PRIVATE_KEY, tableName=REALM; modifyDataType columnName=CERTIFICATE, tableName=REALM','',NULL,'4.16.1',NULL,NULL,'9062602763'),
('1.9.2','keycloak','META-INF/jpa-changelog-1.9.2.xml','2023-03-17 14:19:08',26,'EXECUTED','8:a4218e51e1faf380518cce2af5d39b43','createIndex indexName=IDX_USER_EMAIL, tableName=USER_ENTITY; createIndex indexName=IDX_USER_ROLE_MAPPING, tableName=USER_ROLE_MAPPING; createIndex indexName=IDX_USER_GROUP_MAPPING, tableName=USER_GROUP_MEMBERSHIP; createIndex indexName=IDX_USER_CO...','',NULL,'4.16.1',NULL,NULL,'9062602763'),
('authz-2.0.0','psilva@redhat.com','META-INF/jpa-changelog-authz-2.0.0.xml','2023-03-17 14:19:17',27,'EXECUTED','8:d9e9a1bfaa644da9952456050f07bbdc','createTable tableName=RESOURCE_SERVER; addPrimaryKey constraintName=CONSTRAINT_FARS, tableName=RESOURCE_SERVER; addUniqueConstraint constraintName=UK_AU8TT6T700S9V50BU18WS5HA6, tableName=RESOURCE_SERVER; createTable tableName=RESOURCE_SERVER_RESOU...','',NULL,'4.16.1',NULL,NULL,'9062602763'),
('authz-2.5.1','psilva@redhat.com','META-INF/jpa-changelog-authz-2.5.1.xml','2023-03-17 14:19:17',28,'EXECUTED','8:d1bf991a6163c0acbfe664b615314505','update tableName=RESOURCE_SERVER_POLICY','',NULL,'4.16.1',NULL,NULL,'9062602763'),
('2.1.0-KEYCLOAK-5461','bburke@redhat.com','META-INF/jpa-changelog-2.1.0.xml','2023-03-17 14:19:23',29,'EXECUTED','8:88a743a1e87ec5e30bf603da68058a8c','createTable tableName=BROKER_LINK; createTable tableName=FED_USER_ATTRIBUTE; createTable tableName=FED_USER_CONSENT; createTable tableName=FED_USER_CONSENT_ROLE; createTable tableName=FED_USER_CONSENT_PROT_MAPPER; createTable tableName=FED_USER_CR...','',NULL,'4.16.1',NULL,NULL,'9062602763'),
('2.2.0','bburke@redhat.com','META-INF/jpa-changelog-2.2.0.xml','2023-03-17 14:19:24',30,'EXECUTED','8:c5517863c875d325dea463d00ec26d7a','addColumn tableName=ADMIN_EVENT_ENTITY; createTable tableName=CREDENTIAL_ATTRIBUTE; createTable tableName=FED_CREDENTIAL_ATTRIBUTE; modifyDataType columnName=VALUE, tableName=CREDENTIAL; addForeignKeyConstraint baseTableName=FED_CREDENTIAL_ATTRIBU...','',NULL,'4.16.1',NULL,NULL,'9062602763'),
('2.3.0','bburke@redhat.com','META-INF/jpa-changelog-2.3.0.xml','2023-03-17 14:19:25',31,'EXECUTED','8:ada8b4833b74a498f376d7136bc7d327','createTable tableName=FEDERATED_USER; addPrimaryKey constraintName=CONSTR_FEDERATED_USER, tableName=FEDERATED_USER; dropDefaultValue columnName=TOTP, tableName=USER_ENTITY; dropColumn columnName=TOTP, tableName=USER_ENTITY; addColumn tableName=IDE...','',NULL,'4.16.1',NULL,NULL,'9062602763'),
('2.4.0','bburke@redhat.com','META-INF/jpa-changelog-2.4.0.xml','2023-03-17 14:19:25',32,'EXECUTED','8:b9b73c8ea7299457f99fcbb825c263ba','customChange','',NULL,'4.16.1',NULL,NULL,'9062602763'),
('2.5.0','bburke@redhat.com','META-INF/jpa-changelog-2.5.0.xml','2023-03-17 14:19:26',33,'EXECUTED','8:07724333e625ccfcfc5adc63d57314f3','customChange; modifyDataType columnName=USER_ID, tableName=OFFLINE_USER_SESSION','',NULL,'4.16.1',NULL,NULL,'9062602763'),
('2.5.0-unicode-oracle','hmlnarik@redhat.com','META-INF/jpa-changelog-2.5.0.xml','2023-03-17 14:19:26',34,'MARK_RAN','8:8b6fd445958882efe55deb26fc541a7b','modifyDataType columnName=DESCRIPTION, tableName=AUTHENTICATION_FLOW; modifyDataType columnName=DESCRIPTION, tableName=CLIENT_TEMPLATE; modifyDataType columnName=DESCRIPTION, tableName=RESOURCE_SERVER_POLICY; modifyDataType columnName=DESCRIPTION,...','',NULL,'4.16.1',NULL,NULL,'9062602763'),
('2.5.0-unicode-other-dbs','hmlnarik@redhat.com','META-INF/jpa-changelog-2.5.0.xml','2023-03-17 14:19:28',35,'EXECUTED','8:29b29cfebfd12600897680147277a9d7','modifyDataType columnName=DESCRIPTION, tableName=AUTHENTICATION_FLOW; modifyDataType columnName=DESCRIPTION, tableName=CLIENT_TEMPLATE; modifyDataType columnName=DESCRIPTION, tableName=RESOURCE_SERVER_POLICY; modifyDataType columnName=DESCRIPTION,...','',NULL,'4.16.1',NULL,NULL,'9062602763'),
('2.5.0-duplicate-email-support','slawomir@dabek.name','META-INF/jpa-changelog-2.5.0.xml','2023-03-17 14:19:28',36,'EXECUTED','8:73ad77ca8fd0410c7f9f15a471fa52bc','addColumn tableName=REALM','',NULL,'4.16.1',NULL,NULL,'9062602763'),
('2.5.0-unique-group-names','hmlnarik@redhat.com','META-INF/jpa-changelog-2.5.0.xml','2023-03-17 14:19:29',37,'EXECUTED','8:64f27a6fdcad57f6f9153210f2ec1bdb','addUniqueConstraint constraintName=SIBLING_NAMES, tableName=KEYCLOAK_GROUP','',NULL,'4.16.1',NULL,NULL,'9062602763'),
('2.5.1','bburke@redhat.com','META-INF/jpa-changelog-2.5.1.xml','2023-03-17 14:19:29',38,'EXECUTED','8:27180251182e6c31846c2ddab4bc5781','addColumn tableName=FED_USER_CONSENT','',NULL,'4.16.1',NULL,NULL,'9062602763'),
('3.0.0','bburke@redhat.com','META-INF/jpa-changelog-3.0.0.xml','2023-03-17 14:19:29',39,'EXECUTED','8:d56f201bfcfa7a1413eb3e9bc02978f9','addColumn tableName=IDENTITY_PROVIDER','',NULL,'4.16.1',NULL,NULL,'9062602763'),
('3.2.0-fix','keycloak','META-INF/jpa-changelog-3.2.0.xml','2023-03-17 14:19:29',40,'MARK_RAN','8:91f5522bf6afdc2077dfab57fbd3455c','addNotNullConstraint columnName=REALM_ID, tableName=CLIENT_INITIAL_ACCESS','',NULL,'4.16.1',NULL,NULL,'9062602763'),
('3.2.0-fix-with-keycloak-5416','keycloak','META-INF/jpa-changelog-3.2.0.xml','2023-03-17 14:19:29',41,'MARK_RAN','8:0f01b554f256c22caeb7d8aee3a1cdc8','dropIndex indexName=IDX_CLIENT_INIT_ACC_REALM, tableName=CLIENT_INITIAL_ACCESS; addNotNullConstraint columnName=REALM_ID, tableName=CLIENT_INITIAL_ACCESS; createIndex indexName=IDX_CLIENT_INIT_ACC_REALM, tableName=CLIENT_INITIAL_ACCESS','',NULL,'4.16.1',NULL,NULL,'9062602763'),
('3.2.0-fix-offline-sessions','hmlnarik','META-INF/jpa-changelog-3.2.0.xml','2023-03-17 14:19:29',42,'EXECUTED','8:ab91cf9cee415867ade0e2df9651a947','customChange','',NULL,'4.16.1',NULL,NULL,'9062602763'),
('3.2.0-fixed','keycloak','META-INF/jpa-changelog-3.2.0.xml','2023-03-17 14:19:39',43,'EXECUTED','8:ceac9b1889e97d602caf373eadb0d4b7','addColumn tableName=REALM; dropPrimaryKey constraintName=CONSTRAINT_OFFL_CL_SES_PK2, tableName=OFFLINE_CLIENT_SESSION; dropColumn columnName=CLIENT_SESSION_ID, tableName=OFFLINE_CLIENT_SESSION; addPrimaryKey constraintName=CONSTRAINT_OFFL_CL_SES_P...','',NULL,'4.16.1',NULL,NULL,'9062602763'),
('3.3.0','keycloak','META-INF/jpa-changelog-3.3.0.xml','2023-03-17 14:19:39',44,'EXECUTED','8:84b986e628fe8f7fd8fd3c275c5259f2','addColumn tableName=USER_ENTITY','',NULL,'4.16.1',NULL,NULL,'9062602763'),
('authz-3.4.0.CR1-resource-server-pk-change-part1','glavoie@gmail.com','META-INF/jpa-changelog-authz-3.4.0.CR1.xml','2023-03-17 14:19:39',45,'EXECUTED','8:a164ae073c56ffdbc98a615493609a52','addColumn tableName=RESOURCE_SERVER_POLICY; addColumn tableName=RESOURCE_SERVER_RESOURCE; addColumn tableName=RESOURCE_SERVER_SCOPE','',NULL,'4.16.1',NULL,NULL,'9062602763'),
('authz-3.4.0.CR1-resource-server-pk-change-part2-KEYCLOAK-6095','hmlnarik@redhat.com','META-INF/jpa-changelog-authz-3.4.0.CR1.xml','2023-03-17 14:19:39',46,'EXECUTED','8:70a2b4f1f4bd4dbf487114bdb1810e64','customChange','',NULL,'4.16.1',NULL,NULL,'9062602763'),
('authz-3.4.0.CR1-resource-server-pk-change-part3-fixed','glavoie@gmail.com','META-INF/jpa-changelog-authz-3.4.0.CR1.xml','2023-03-17 14:19:39',47,'MARK_RAN','8:7be68b71d2f5b94b8df2e824f2860fa2','dropIndex indexName=IDX_RES_SERV_POL_RES_SERV, tableName=RESOURCE_SERVER_POLICY; dropIndex indexName=IDX_RES_SRV_RES_RES_SRV, tableName=RESOURCE_SERVER_RESOURCE; dropIndex indexName=IDX_RES_SRV_SCOPE_RES_SRV, tableName=RESOURCE_SERVER_SCOPE','',NULL,'4.16.1',NULL,NULL,'9062602763'),
('authz-3.4.0.CR1-resource-server-pk-change-part3-fixed-nodropindex','glavoie@gmail.com','META-INF/jpa-changelog-authz-3.4.0.CR1.xml','2023-03-17 14:19:45',48,'EXECUTED','8:bab7c631093c3861d6cf6144cd944982','addNotNullConstraint columnName=RESOURCE_SERVER_CLIENT_ID, tableName=RESOURCE_SERVER_POLICY; addNotNullConstraint columnName=RESOURCE_SERVER_CLIENT_ID, tableName=RESOURCE_SERVER_RESOURCE; addNotNullConstraint columnName=RESOURCE_SERVER_CLIENT_ID, ...','',NULL,'4.16.1',NULL,NULL,'9062602763'),
('authn-3.4.0.CR1-refresh-token-max-reuse','glavoie@gmail.com','META-INF/jpa-changelog-authz-3.4.0.CR1.xml','2023-03-17 14:19:45',49,'EXECUTED','8:fa809ac11877d74d76fe40869916daad','addColumn tableName=REALM','',NULL,'4.16.1',NULL,NULL,'9062602763'),
('3.4.0','keycloak','META-INF/jpa-changelog-3.4.0.xml','2023-03-17 14:19:51',50,'EXECUTED','8:fac23540a40208f5f5e326f6ceb4d291','addPrimaryKey constraintName=CONSTRAINT_REALM_DEFAULT_ROLES, tableName=REALM_DEFAULT_ROLES; addPrimaryKey constraintName=CONSTRAINT_COMPOSITE_ROLE, tableName=COMPOSITE_ROLE; addPrimaryKey constraintName=CONSTR_REALM_DEFAULT_GROUPS, tableName=REALM...','',NULL,'4.16.1',NULL,NULL,'9062602763'),
('3.4.0-KEYCLOAK-5230','hmlnarik@redhat.com','META-INF/jpa-changelog-3.4.0.xml','2023-03-17 14:19:53',51,'EXECUTED','8:2612d1b8a97e2b5588c346e817307593','createIndex indexName=IDX_FU_ATTRIBUTE, tableName=FED_USER_ATTRIBUTE; createIndex indexName=IDX_FU_CONSENT, tableName=FED_USER_CONSENT; createIndex indexName=IDX_FU_CONSENT_RU, tableName=FED_USER_CONSENT; createIndex indexName=IDX_FU_CREDENTIAL, t...','',NULL,'4.16.1',NULL,NULL,'9062602763'),
('3.4.1','psilva@redhat.com','META-INF/jpa-changelog-3.4.1.xml','2023-03-17 14:19:53',52,'EXECUTED','8:9842f155c5db2206c88bcb5d1046e941','modifyDataType columnName=VALUE, tableName=CLIENT_ATTRIBUTES','',NULL,'4.16.1',NULL,NULL,'9062602763'),
('3.4.2','keycloak','META-INF/jpa-changelog-3.4.2.xml','2023-03-17 14:19:53',53,'EXECUTED','8:2e12e06e45498406db72d5b3da5bbc76','update tableName=REALM','',NULL,'4.16.1',NULL,NULL,'9062602763'),
('3.4.2-KEYCLOAK-5172','mkanis@redhat.com','META-INF/jpa-changelog-3.4.2.xml','2023-03-17 14:19:53',54,'EXECUTED','8:33560e7c7989250c40da3abdabdc75a4','update tableName=CLIENT','',NULL,'4.16.1',NULL,NULL,'9062602763'),
('4.0.0-KEYCLOAK-6335','bburke@redhat.com','META-INF/jpa-changelog-4.0.0.xml','2023-03-17 14:19:53',55,'EXECUTED','8:87a8d8542046817a9107c7eb9cbad1cd','createTable tableName=CLIENT_AUTH_FLOW_BINDINGS; addPrimaryKey constraintName=C_CLI_FLOW_BIND, tableName=CLIENT_AUTH_FLOW_BINDINGS','',NULL,'4.16.1',NULL,NULL,'9062602763'),
('4.0.0-CLEANUP-UNUSED-TABLE','bburke@redhat.com','META-INF/jpa-changelog-4.0.0.xml','2023-03-17 14:19:53',56,'EXECUTED','8:3ea08490a70215ed0088c273d776311e','dropTable tableName=CLIENT_IDENTITY_PROV_MAPPING','',NULL,'4.16.1',NULL,NULL,'9062602763'),
('4.0.0-KEYCLOAK-6228','bburke@redhat.com','META-INF/jpa-changelog-4.0.0.xml','2023-03-17 14:19:56',57,'EXECUTED','8:2d56697c8723d4592ab608ce14b6ed68','dropUniqueConstraint constraintName=UK_JKUWUVD56ONTGSUHOGM8UEWRT, tableName=USER_CONSENT; dropNotNullConstraint columnName=CLIENT_ID, tableName=USER_CONSENT; addColumn tableName=USER_CONSENT; addUniqueConstraint constraintName=UK_JKUWUVD56ONTGSUHO...','',NULL,'4.16.1',NULL,NULL,'9062602763'),
('4.0.0-KEYCLOAK-5579-fixed','mposolda@redhat.com','META-INF/jpa-changelog-4.0.0.xml','2023-03-17 14:20:08',58,'EXECUTED','8:3e423e249f6068ea2bbe48bf907f9d86','dropForeignKeyConstraint baseTableName=CLIENT_TEMPLATE_ATTRIBUTES, constraintName=FK_CL_TEMPL_ATTR_TEMPL; renameTable newTableName=CLIENT_SCOPE_ATTRIBUTES, oldTableName=CLIENT_TEMPLATE_ATTRIBUTES; renameColumn newColumnName=SCOPE_ID, oldColumnName...','',NULL,'4.16.1',NULL,NULL,'9062602763'),
('authz-4.0.0.CR1','psilva@redhat.com','META-INF/jpa-changelog-authz-4.0.0.CR1.xml','2023-03-17 14:20:11',59,'EXECUTED','8:15cabee5e5df0ff099510a0fc03e4103','createTable tableName=RESOURCE_SERVER_PERM_TICKET; addPrimaryKey constraintName=CONSTRAINT_FAPMT, tableName=RESOURCE_SERVER_PERM_TICKET; addForeignKeyConstraint baseTableName=RESOURCE_SERVER_PERM_TICKET, constraintName=FK_FRSRHO213XCX4WNKOG82SSPMT...','',NULL,'4.16.1',NULL,NULL,'9062602763'),
('authz-4.0.0.Beta3','psilva@redhat.com','META-INF/jpa-changelog-authz-4.0.0.Beta3.xml','2023-03-17 14:20:11',60,'EXECUTED','8:4b80200af916ac54d2ffbfc47918ab0e','addColumn tableName=RESOURCE_SERVER_POLICY; addColumn tableName=RESOURCE_SERVER_PERM_TICKET; addForeignKeyConstraint baseTableName=RESOURCE_SERVER_PERM_TICKET, constraintName=FK_FRSRPO2128CX4WNKOG82SSRFY, referencedTableName=RESOURCE_SERVER_POLICY','',NULL,'4.16.1',NULL,NULL,'9062602763'),
('authz-4.2.0.Final','mhajas@redhat.com','META-INF/jpa-changelog-authz-4.2.0.Final.xml','2023-03-17 14:20:12',61,'EXECUTED','8:66564cd5e168045d52252c5027485bbb','createTable tableName=RESOURCE_URIS; addForeignKeyConstraint baseTableName=RESOURCE_URIS, constraintName=FK_RESOURCE_SERVER_URIS, referencedTableName=RESOURCE_SERVER_RESOURCE; customChange; dropColumn columnName=URI, tableName=RESOURCE_SERVER_RESO...','',NULL,'4.16.1',NULL,NULL,'9062602763'),
('authz-4.2.0.Final-KEYCLOAK-9944','hmlnarik@redhat.com','META-INF/jpa-changelog-authz-4.2.0.Final.xml','2023-03-17 14:20:12',62,'EXECUTED','8:1c7064fafb030222be2bd16ccf690f6f','addPrimaryKey constraintName=CONSTRAINT_RESOUR_URIS_PK, tableName=RESOURCE_URIS','',NULL,'4.16.1',NULL,NULL,'9062602763'),
('4.2.0-KEYCLOAK-6313','wadahiro@gmail.com','META-INF/jpa-changelog-4.2.0.xml','2023-03-17 14:20:12',63,'EXECUTED','8:2de18a0dce10cdda5c7e65c9b719b6e5','addColumn tableName=REQUIRED_ACTION_PROVIDER','',NULL,'4.16.1',NULL,NULL,'9062602763'),
('4.3.0-KEYCLOAK-7984','wadahiro@gmail.com','META-INF/jpa-changelog-4.3.0.xml','2023-03-17 14:20:12',64,'EXECUTED','8:03e413dd182dcbd5c57e41c34d0ef682','update tableName=REQUIRED_ACTION_PROVIDER','',NULL,'4.16.1',NULL,NULL,'9062602763'),
('4.6.0-KEYCLOAK-7950','psilva@redhat.com','META-INF/jpa-changelog-4.6.0.xml','2023-03-17 14:20:12',65,'EXECUTED','8:d27b42bb2571c18fbe3fe4e4fb7582a7','update tableName=RESOURCE_SERVER_RESOURCE','',NULL,'4.16.1',NULL,NULL,'9062602763'),
('4.6.0-KEYCLOAK-8377','keycloak','META-INF/jpa-changelog-4.6.0.xml','2023-03-17 14:20:13',66,'EXECUTED','8:698baf84d9fd0027e9192717c2154fb8','createTable tableName=ROLE_ATTRIBUTE; addPrimaryKey constraintName=CONSTRAINT_ROLE_ATTRIBUTE_PK, tableName=ROLE_ATTRIBUTE; addForeignKeyConstraint baseTableName=ROLE_ATTRIBUTE, constraintName=FK_ROLE_ATTRIBUTE_ID, referencedTableName=KEYCLOAK_ROLE...','',NULL,'4.16.1',NULL,NULL,'9062602763'),
('4.6.0-KEYCLOAK-8555','gideonray@gmail.com','META-INF/jpa-changelog-4.6.0.xml','2023-03-17 14:20:14',67,'EXECUTED','8:ced8822edf0f75ef26eb51582f9a821a','createIndex indexName=IDX_COMPONENT_PROVIDER_TYPE, tableName=COMPONENT','',NULL,'4.16.1',NULL,NULL,'9062602763'),
('4.7.0-KEYCLOAK-1267','sguilhen@redhat.com','META-INF/jpa-changelog-4.7.0.xml','2023-03-17 14:20:14',68,'EXECUTED','8:f0abba004cf429e8afc43056df06487d','addColumn tableName=REALM','',NULL,'4.16.1',NULL,NULL,'9062602763'),
('4.7.0-KEYCLOAK-7275','keycloak','META-INF/jpa-changelog-4.7.0.xml','2023-03-17 14:20:14',69,'EXECUTED','8:6662f8b0b611caa359fcf13bf63b4e24','renameColumn newColumnName=CREATED_ON, oldColumnName=LAST_SESSION_REFRESH, tableName=OFFLINE_USER_SESSION; addNotNullConstraint columnName=CREATED_ON, tableName=OFFLINE_USER_SESSION; addColumn tableName=OFFLINE_USER_SESSION; customChange; createIn...','',NULL,'4.16.1',NULL,NULL,'9062602763'),
('4.8.0-KEYCLOAK-8835','sguilhen@redhat.com','META-INF/jpa-changelog-4.8.0.xml','2023-03-17 14:20:15',70,'EXECUTED','8:9e6b8009560f684250bdbdf97670d39e','addNotNullConstraint columnName=SSO_MAX_LIFESPAN_REMEMBER_ME, tableName=REALM; addNotNullConstraint columnName=SSO_IDLE_TIMEOUT_REMEMBER_ME, tableName=REALM','',NULL,'4.16.1',NULL,NULL,'9062602763'),
('authz-7.0.0-KEYCLOAK-10443','psilva@redhat.com','META-INF/jpa-changelog-authz-7.0.0.xml','2023-03-17 14:20:15',71,'EXECUTED','8:4223f561f3b8dc655846562b57bb502e','addColumn tableName=RESOURCE_SERVER','',NULL,'4.16.1',NULL,NULL,'9062602763'),
('8.0.0-adding-credential-columns','keycloak','META-INF/jpa-changelog-8.0.0.xml','2023-03-17 14:20:15',72,'EXECUTED','8:215a31c398b363ce383a2b301202f29e','addColumn tableName=CREDENTIAL; addColumn tableName=FED_USER_CREDENTIAL','',NULL,'4.16.1',NULL,NULL,'9062602763'),
('8.0.0-updating-credential-data-not-oracle-fixed','keycloak','META-INF/jpa-changelog-8.0.0.xml','2023-03-17 14:20:16',73,'EXECUTED','8:83f7a671792ca98b3cbd3a1a34862d3d','update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL','',NULL,'4.16.1',NULL,NULL,'9062602763'),
('8.0.0-updating-credential-data-oracle-fixed','keycloak','META-INF/jpa-changelog-8.0.0.xml','2023-03-17 14:20:16',74,'MARK_RAN','8:f58ad148698cf30707a6efbdf8061aa7','update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL','',NULL,'4.16.1',NULL,NULL,'9062602763'),
('8.0.0-credential-cleanup-fixed','keycloak','META-INF/jpa-changelog-8.0.0.xml','2023-03-17 14:20:19',75,'EXECUTED','8:79e4fd6c6442980e58d52ffc3ee7b19c','dropDefaultValue columnName=COUNTER, tableName=CREDENTIAL; dropDefaultValue columnName=DIGITS, tableName=CREDENTIAL; dropDefaultValue columnName=PERIOD, tableName=CREDENTIAL; dropDefaultValue columnName=ALGORITHM, tableName=CREDENTIAL; dropColumn ...','',NULL,'4.16.1',NULL,NULL,'9062602763'),
('8.0.0-resource-tag-support','keycloak','META-INF/jpa-changelog-8.0.0.xml','2023-03-17 14:20:19',76,'EXECUTED','8:87af6a1e6d241ca4b15801d1f86a297d','addColumn tableName=MIGRATION_MODEL; createIndex indexName=IDX_UPDATE_TIME, tableName=MIGRATION_MODEL','',NULL,'4.16.1',NULL,NULL,'9062602763'),
('9.0.0-always-display-client','keycloak','META-INF/jpa-changelog-9.0.0.xml','2023-03-17 14:20:19',77,'EXECUTED','8:b44f8d9b7b6ea455305a6d72a200ed15','addColumn tableName=CLIENT','',NULL,'4.16.1',NULL,NULL,'9062602763'),
('9.0.0-drop-constraints-for-column-increase','keycloak','META-INF/jpa-changelog-9.0.0.xml','2023-03-17 14:20:19',78,'MARK_RAN','8:2d8ed5aaaeffd0cb004c046b4a903ac5','dropUniqueConstraint constraintName=UK_FRSR6T700S9V50BU18WS5PMT, tableName=RESOURCE_SERVER_PERM_TICKET; dropUniqueConstraint constraintName=UK_FRSR6T700S9V50BU18WS5HA6, tableName=RESOURCE_SERVER_RESOURCE; dropPrimaryKey constraintName=CONSTRAINT_O...','',NULL,'4.16.1',NULL,NULL,'9062602763'),
('9.0.0-increase-column-size-federated-fk','keycloak','META-INF/jpa-changelog-9.0.0.xml','2023-03-17 14:20:21',79,'EXECUTED','8:e290c01fcbc275326c511633f6e2acde','modifyDataType columnName=CLIENT_ID, tableName=FED_USER_CONSENT; modifyDataType columnName=CLIENT_REALM_CONSTRAINT, tableName=KEYCLOAK_ROLE; modifyDataType columnName=OWNER, tableName=RESOURCE_SERVER_POLICY; modifyDataType columnName=CLIENT_ID, ta...','',NULL,'4.16.1',NULL,NULL,'9062602763'),
('9.0.0-recreate-constraints-after-column-increase','keycloak','META-INF/jpa-changelog-9.0.0.xml','2023-03-17 14:20:21',80,'MARK_RAN','8:c9db8784c33cea210872ac2d805439f8','addNotNullConstraint columnName=CLIENT_ID, tableName=OFFLINE_CLIENT_SESSION; addNotNullConstraint columnName=OWNER, tableName=RESOURCE_SERVER_PERM_TICKET; addNotNullConstraint columnName=REQUESTER, tableName=RESOURCE_SERVER_PERM_TICKET; addNotNull...','',NULL,'4.16.1',NULL,NULL,'9062602763'),
('9.0.1-add-index-to-client.client_id','keycloak','META-INF/jpa-changelog-9.0.1.xml','2023-03-17 14:20:21',81,'EXECUTED','8:95b676ce8fc546a1fcfb4c92fae4add5','createIndex indexName=IDX_CLIENT_ID, tableName=CLIENT','',NULL,'4.16.1',NULL,NULL,'9062602763'),
('9.0.1-KEYCLOAK-12579-drop-constraints','keycloak','META-INF/jpa-changelog-9.0.1.xml','2023-03-17 14:20:21',82,'MARK_RAN','8:38a6b2a41f5651018b1aca93a41401e5','dropUniqueConstraint constraintName=SIBLING_NAMES, tableName=KEYCLOAK_GROUP','',NULL,'4.16.1',NULL,NULL,'9062602763'),
('9.0.1-KEYCLOAK-12579-add-not-null-constraint','keycloak','META-INF/jpa-changelog-9.0.1.xml','2023-03-17 14:20:22',83,'EXECUTED','8:3fb99bcad86a0229783123ac52f7609c','addNotNullConstraint columnName=PARENT_GROUP, tableName=KEYCLOAK_GROUP','',NULL,'4.16.1',NULL,NULL,'9062602763'),
('9.0.1-KEYCLOAK-12579-recreate-constraints','keycloak','META-INF/jpa-changelog-9.0.1.xml','2023-03-17 14:20:22',84,'MARK_RAN','8:64f27a6fdcad57f6f9153210f2ec1bdb','addUniqueConstraint constraintName=SIBLING_NAMES, tableName=KEYCLOAK_GROUP','',NULL,'4.16.1',NULL,NULL,'9062602763'),
('9.0.1-add-index-to-events','keycloak','META-INF/jpa-changelog-9.0.1.xml','2023-03-17 14:20:22',85,'EXECUTED','8:ab4f863f39adafd4c862f7ec01890abc','createIndex indexName=IDX_EVENT_TIME, tableName=EVENT_ENTITY','',NULL,'4.16.1',NULL,NULL,'9062602763'),
('map-remove-ri','keycloak','META-INF/jpa-changelog-11.0.0.xml','2023-03-17 14:20:22',86,'EXECUTED','8:13c419a0eb336e91ee3a3bf8fda6e2a7','dropForeignKeyConstraint baseTableName=REALM, constraintName=FK_TRAF444KK6QRKMS7N56AIWQ5Y; dropForeignKeyConstraint baseTableName=KEYCLOAK_ROLE, constraintName=FK_KJHO5LE2C0RAL09FL8CM9WFW9','',NULL,'4.16.1',NULL,NULL,'9062602763'),
('map-remove-ri','keycloak','META-INF/jpa-changelog-12.0.0.xml','2023-03-17 14:20:22',87,'EXECUTED','8:e3fb1e698e0471487f51af1ed80fe3ac','dropForeignKeyConstraint baseTableName=REALM_DEFAULT_GROUPS, constraintName=FK_DEF_GROUPS_GROUP; dropForeignKeyConstraint baseTableName=REALM_DEFAULT_ROLES, constraintName=FK_H4WPD7W4HSOOLNI3H0SW7BTJE; dropForeignKeyConstraint baseTableName=CLIENT...','',NULL,'4.16.1',NULL,NULL,'9062602763'),
('12.1.0-add-realm-localization-table','keycloak','META-INF/jpa-changelog-12.0.0.xml','2023-03-17 14:20:23',88,'EXECUTED','8:babadb686aab7b56562817e60bf0abd0','createTable tableName=REALM_LOCALIZATIONS; addPrimaryKey tableName=REALM_LOCALIZATIONS','',NULL,'4.16.1',NULL,NULL,'9062602763'),
('default-roles','keycloak','META-INF/jpa-changelog-13.0.0.xml','2023-03-17 14:20:23',89,'EXECUTED','8:72d03345fda8e2f17093d08801947773','addColumn tableName=REALM; customChange','',NULL,'4.16.1',NULL,NULL,'9062602763'),
('default-roles-cleanup','keycloak','META-INF/jpa-changelog-13.0.0.xml','2023-03-17 14:20:23',90,'EXECUTED','8:61c9233951bd96ffecd9ba75f7d978a4','dropTable tableName=REALM_DEFAULT_ROLES; dropTable tableName=CLIENT_DEFAULT_ROLES','',NULL,'4.16.1',NULL,NULL,'9062602763'),
('13.0.0-KEYCLOAK-16844','keycloak','META-INF/jpa-changelog-13.0.0.xml','2023-03-17 14:20:23',91,'EXECUTED','8:ea82e6ad945cec250af6372767b25525','createIndex indexName=IDX_OFFLINE_USS_PRELOAD, tableName=OFFLINE_USER_SESSION','',NULL,'4.16.1',NULL,NULL,'9062602763'),
('map-remove-ri-13.0.0','keycloak','META-INF/jpa-changelog-13.0.0.xml','2023-03-17 14:20:24',92,'EXECUTED','8:d3f4a33f41d960ddacd7e2ef30d126b3','dropForeignKeyConstraint baseTableName=DEFAULT_CLIENT_SCOPE, constraintName=FK_R_DEF_CLI_SCOPE_SCOPE; dropForeignKeyConstraint baseTableName=CLIENT_SCOPE_CLIENT, constraintName=FK_C_CLI_SCOPE_SCOPE; dropForeignKeyConstraint baseTableName=CLIENT_SC...','',NULL,'4.16.1',NULL,NULL,'9062602763'),
('13.0.0-KEYCLOAK-17992-drop-constraints','keycloak','META-INF/jpa-changelog-13.0.0.xml','2023-03-17 14:20:24',93,'MARK_RAN','8:1284a27fbd049d65831cb6fc07c8a783','dropPrimaryKey constraintName=C_CLI_SCOPE_BIND, tableName=CLIENT_SCOPE_CLIENT; dropIndex indexName=IDX_CLSCOPE_CL, tableName=CLIENT_SCOPE_CLIENT; dropIndex indexName=IDX_CL_CLSCOPE, tableName=CLIENT_SCOPE_CLIENT','',NULL,'4.16.1',NULL,NULL,'9062602763'),
('13.0.0-increase-column-size-federated','keycloak','META-INF/jpa-changelog-13.0.0.xml','2023-03-17 14:20:24',94,'EXECUTED','8:9d11b619db2ae27c25853b8a37cd0dea','modifyDataType columnName=CLIENT_ID, tableName=CLIENT_SCOPE_CLIENT; modifyDataType columnName=SCOPE_ID, tableName=CLIENT_SCOPE_CLIENT','',NULL,'4.16.1',NULL,NULL,'9062602763'),
('13.0.0-KEYCLOAK-17992-recreate-constraints','keycloak','META-INF/jpa-changelog-13.0.0.xml','2023-03-17 14:20:24',95,'MARK_RAN','8:3002bb3997451bb9e8bac5c5cd8d6327','addNotNullConstraint columnName=CLIENT_ID, tableName=CLIENT_SCOPE_CLIENT; addNotNullConstraint columnName=SCOPE_ID, tableName=CLIENT_SCOPE_CLIENT; addPrimaryKey constraintName=C_CLI_SCOPE_BIND, tableName=CLIENT_SCOPE_CLIENT; createIndex indexName=...','',NULL,'4.16.1',NULL,NULL,'9062602763'),
('json-string-accomodation-fixed','keycloak','META-INF/jpa-changelog-13.0.0.xml','2023-03-17 14:20:25',96,'EXECUTED','8:dfbee0d6237a23ef4ccbb7a4e063c163','addColumn tableName=REALM_ATTRIBUTE; update tableName=REALM_ATTRIBUTE; dropColumn columnName=VALUE, tableName=REALM_ATTRIBUTE; renameColumn newColumnName=VALUE, oldColumnName=VALUE_NEW, tableName=REALM_ATTRIBUTE','',NULL,'4.16.1',NULL,NULL,'9062602763'),
('14.0.0-KEYCLOAK-11019','keycloak','META-INF/jpa-changelog-14.0.0.xml','2023-03-17 14:20:25',97,'EXECUTED','8:75f3e372df18d38c62734eebb986b960','createIndex indexName=IDX_OFFLINE_CSS_PRELOAD, tableName=OFFLINE_CLIENT_SESSION; createIndex indexName=IDX_OFFLINE_USS_BY_USER, tableName=OFFLINE_USER_SESSION; createIndex indexName=IDX_OFFLINE_USS_BY_USERSESS, tableName=OFFLINE_USER_SESSION','',NULL,'4.16.1',NULL,NULL,'9062602763'),
('14.0.0-KEYCLOAK-18286','keycloak','META-INF/jpa-changelog-14.0.0.xml','2023-03-17 14:20:25',98,'MARK_RAN','8:7fee73eddf84a6035691512c85637eef','createIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES','',NULL,'4.16.1',NULL,NULL,'9062602763'),
('14.0.0-KEYCLOAK-18286-revert','keycloak','META-INF/jpa-changelog-14.0.0.xml','2023-03-17 14:20:25',99,'MARK_RAN','8:7a11134ab12820f999fbf3bb13c3adc8','dropIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES','',NULL,'4.16.1',NULL,NULL,'9062602763'),
('14.0.0-KEYCLOAK-18286-supported-dbs','keycloak','META-INF/jpa-changelog-14.0.0.xml','2023-03-17 14:20:25',100,'EXECUTED','8:f43dfba07ba249d5d932dc489fd2b886','createIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES','',NULL,'4.16.1',NULL,NULL,'9062602763'),
('14.0.0-KEYCLOAK-18286-unsupported-dbs','keycloak','META-INF/jpa-changelog-14.0.0.xml','2023-03-17 14:20:25',101,'MARK_RAN','8:18186f0008b86e0f0f49b0c4d0e842ac','createIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES','',NULL,'4.16.1',NULL,NULL,'9062602763'),
('KEYCLOAK-17267-add-index-to-user-attributes','keycloak','META-INF/jpa-changelog-14.0.0.xml','2023-03-17 14:20:25',102,'EXECUTED','8:09c2780bcb23b310a7019d217dc7b433','createIndex indexName=IDX_USER_ATTRIBUTE_NAME, tableName=USER_ATTRIBUTE','',NULL,'4.16.1',NULL,NULL,'9062602763'),
('KEYCLOAK-18146-add-saml-art-binding-identifier','keycloak','META-INF/jpa-changelog-14.0.0.xml','2023-03-17 14:20:25',103,'EXECUTED','8:276a44955eab693c970a42880197fff2','customChange','',NULL,'4.16.1',NULL,NULL,'9062602763'),
('15.0.0-KEYCLOAK-18467','keycloak','META-INF/jpa-changelog-15.0.0.xml','2023-03-17 14:20:26',104,'EXECUTED','8:ba8ee3b694d043f2bfc1a1079d0760d7','addColumn tableName=REALM_LOCALIZATIONS; update tableName=REALM_LOCALIZATIONS; dropColumn columnName=TEXTS, tableName=REALM_LOCALIZATIONS; renameColumn newColumnName=TEXTS, oldColumnName=TEXTS_NEW, tableName=REALM_LOCALIZATIONS; addNotNullConstrai...','',NULL,'4.16.1',NULL,NULL,'9062602763'),
('17.0.0-9562','keycloak','META-INF/jpa-changelog-17.0.0.xml','2023-03-17 14:20:26',105,'EXECUTED','8:5e06b1d75f5d17685485e610c2851b17','createIndex indexName=IDX_USER_SERVICE_ACCOUNT, tableName=USER_ENTITY','',NULL,'4.16.1',NULL,NULL,'9062602763'),
('18.0.0-10625-IDX_ADMIN_EVENT_TIME','keycloak','META-INF/jpa-changelog-18.0.0.xml','2023-03-17 14:20:26',106,'EXECUTED','8:4b80546c1dc550ac552ee7b24a4ab7c0','createIndex indexName=IDX_ADMIN_EVENT_TIME, tableName=ADMIN_EVENT_ENTITY','',NULL,'4.16.1',NULL,NULL,'9062602763'),
('19.0.0-10135','keycloak','META-INF/jpa-changelog-19.0.0.xml','2023-03-17 14:20:26',107,'EXECUTED','8:af510cd1bb2ab6339c45372f3e491696','customChange','',NULL,'4.16.1',NULL,NULL,'9062602763'),
('20.0.0-12964-supported-dbs','keycloak','META-INF/jpa-changelog-20.0.0.xml','2023-03-17 14:20:26',108,'EXECUTED','8:d00f99ed899c4d2ae9117e282badbef5','createIndex indexName=IDX_GROUP_ATT_BY_NAME_VALUE, tableName=GROUP_ATTRIBUTE','',NULL,'4.16.1',NULL,NULL,'9062602763'),
('20.0.0-12964-unsupported-dbs','keycloak','META-INF/jpa-changelog-20.0.0.xml','2023-03-17 14:20:26',109,'MARK_RAN','8:314e803baf2f1ec315b3464e398b8247','createIndex indexName=IDX_GROUP_ATT_BY_NAME_VALUE, tableName=GROUP_ATTRIBUTE','',NULL,'4.16.1',NULL,NULL,'9062602763'),
('client-attributes-string-accomodation-fixed','keycloak','META-INF/jpa-changelog-20.0.0.xml','2023-03-17 14:20:27',110,'EXECUTED','8:56e4677e7e12556f70b604c573840100','addColumn tableName=CLIENT_ATTRIBUTES; update tableName=CLIENT_ATTRIBUTES; dropColumn columnName=VALUE, tableName=CLIENT_ATTRIBUTES; renameColumn newColumnName=VALUE, oldColumnName=VALUE_NEW, tableName=CLIENT_ATTRIBUTES','',NULL,'4.16.1',NULL,NULL,'9062602763');
/*!40000 ALTER TABLE `DATABASECHANGELOG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DATABASECHANGELOGLOCK`
--

DROP TABLE IF EXISTS `DATABASECHANGELOGLOCK`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DATABASECHANGELOGLOCK` (
  `ID` int(11) NOT NULL,
  `LOCKED` bit(1) NOT NULL,
  `LOCKGRANTED` datetime DEFAULT NULL,
  `LOCKEDBY` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DATABASECHANGELOGLOCK`
--

LOCK TABLES `DATABASECHANGELOGLOCK` WRITE;
/*!40000 ALTER TABLE `DATABASECHANGELOGLOCK` DISABLE KEYS */;
INSERT INTO `DATABASECHANGELOGLOCK` VALUES
(1,'\0',NULL,NULL),
(1000,'\0',NULL,NULL),
(1001,'\0',NULL,NULL);
/*!40000 ALTER TABLE `DATABASECHANGELOGLOCK` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DEFAULT_CLIENT_SCOPE`
--

DROP TABLE IF EXISTS `DEFAULT_CLIENT_SCOPE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DEFAULT_CLIENT_SCOPE` (
  `REALM_ID` varchar(36) NOT NULL,
  `SCOPE_ID` varchar(36) NOT NULL,
  `DEFAULT_SCOPE` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`REALM_ID`,`SCOPE_ID`),
  KEY `IDX_DEFCLS_REALM` (`REALM_ID`),
  KEY `IDX_DEFCLS_SCOPE` (`SCOPE_ID`),
  CONSTRAINT `FK_R_DEF_CLI_SCOPE_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DEFAULT_CLIENT_SCOPE`
--

LOCK TABLES `DEFAULT_CLIENT_SCOPE` WRITE;
/*!40000 ALTER TABLE `DEFAULT_CLIENT_SCOPE` DISABLE KEYS */;
INSERT INTO `DEFAULT_CLIENT_SCOPE` VALUES
('9edf1ebb-174b-478f-8959-7f2aa7617d22','431f2ce1-8af6-4ab7-bd75-46d6aab1bc28','\0'),
('9edf1ebb-174b-478f-8959-7f2aa7617d22','58fa9b1f-cf48-45d0-b928-8908020a6e7e','\0'),
('9edf1ebb-174b-478f-8959-7f2aa7617d22','852c44dd-ae38-4682-9f0b-2e2a8021654d',''),
('9edf1ebb-174b-478f-8959-7f2aa7617d22','8b0efaee-6d64-4fca-8671-146a19a5e4e0',''),
('9edf1ebb-174b-478f-8959-7f2aa7617d22','8cf5e257-bdc3-4379-8b5c-37f0ec23c0c2',''),
('9edf1ebb-174b-478f-8959-7f2aa7617d22','a7e6df0d-408b-4109-9772-e34e05344732','\0'),
('9edf1ebb-174b-478f-8959-7f2aa7617d22','b3717553-2a8f-4b8e-9045-11117b33fd2e',''),
('9edf1ebb-174b-478f-8959-7f2aa7617d22','bd17e7bb-c043-4a62-9be1-7668ea1dfbfc','\0'),
('9edf1ebb-174b-478f-8959-7f2aa7617d22','dbf832eb-7dbb-439f-9a83-3bd44b2c0a41',''),
('9edf1ebb-174b-478f-8959-7f2aa7617d22','e005dc58-bba1-4018-929a-e2e65d44297d',''),
('9edf1ebb-174b-478f-8959-7f2aa7617d22','ed6a4a0d-3eed-4202-8037-029ef0b450d0','');
/*!40000 ALTER TABLE `DEFAULT_CLIENT_SCOPE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `EVENT_ENTITY`
--

DROP TABLE IF EXISTS `EVENT_ENTITY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `EVENT_ENTITY` (
  `ID` varchar(36) NOT NULL,
  `CLIENT_ID` varchar(255) DEFAULT NULL,
  `DETAILS_JSON` text DEFAULT NULL,
  `ERROR` varchar(255) DEFAULT NULL,
  `IP_ADDRESS` varchar(255) DEFAULT NULL,
  `REALM_ID` varchar(255) DEFAULT NULL,
  `SESSION_ID` varchar(255) DEFAULT NULL,
  `EVENT_TIME` bigint(20) DEFAULT NULL,
  `TYPE` varchar(255) DEFAULT NULL,
  `USER_ID` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_EVENT_TIME` (`REALM_ID`,`EVENT_TIME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `EVENT_ENTITY`
--

LOCK TABLES `EVENT_ENTITY` WRITE;
/*!40000 ALTER TABLE `EVENT_ENTITY` DISABLE KEYS */;
/*!40000 ALTER TABLE `EVENT_ENTITY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FEDERATED_IDENTITY`
--

DROP TABLE IF EXISTS `FEDERATED_IDENTITY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `FEDERATED_IDENTITY` (
  `IDENTITY_PROVIDER` varchar(255) NOT NULL,
  `REALM_ID` varchar(36) DEFAULT NULL,
  `FEDERATED_USER_ID` varchar(255) DEFAULT NULL,
  `FEDERATED_USERNAME` varchar(255) DEFAULT NULL,
  `TOKEN` text DEFAULT NULL,
  `USER_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`IDENTITY_PROVIDER`,`USER_ID`),
  KEY `IDX_FEDIDENTITY_USER` (`USER_ID`),
  KEY `IDX_FEDIDENTITY_FEDUSER` (`FEDERATED_USER_ID`),
  CONSTRAINT `FK404288B92EF007A6` FOREIGN KEY (`USER_ID`) REFERENCES `USER_ENTITY` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FEDERATED_IDENTITY`
--

LOCK TABLES `FEDERATED_IDENTITY` WRITE;
/*!40000 ALTER TABLE `FEDERATED_IDENTITY` DISABLE KEYS */;
/*!40000 ALTER TABLE `FEDERATED_IDENTITY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FEDERATED_USER`
--

DROP TABLE IF EXISTS `FEDERATED_USER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `FEDERATED_USER` (
  `ID` varchar(255) NOT NULL,
  `STORAGE_PROVIDER_ID` varchar(255) DEFAULT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FEDERATED_USER`
--

LOCK TABLES `FEDERATED_USER` WRITE;
/*!40000 ALTER TABLE `FEDERATED_USER` DISABLE KEYS */;
/*!40000 ALTER TABLE `FEDERATED_USER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FED_USER_ATTRIBUTE`
--

DROP TABLE IF EXISTS `FED_USER_ATTRIBUTE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `FED_USER_ATTRIBUTE` (
  `ID` varchar(36) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `USER_ID` varchar(255) NOT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  `STORAGE_PROVIDER_ID` varchar(36) DEFAULT NULL,
  `VALUE` text DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_FU_ATTRIBUTE` (`USER_ID`,`REALM_ID`,`NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FED_USER_ATTRIBUTE`
--

LOCK TABLES `FED_USER_ATTRIBUTE` WRITE;
/*!40000 ALTER TABLE `FED_USER_ATTRIBUTE` DISABLE KEYS */;
/*!40000 ALTER TABLE `FED_USER_ATTRIBUTE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FED_USER_CONSENT`
--

DROP TABLE IF EXISTS `FED_USER_CONSENT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `FED_USER_CONSENT` (
  `ID` varchar(36) NOT NULL,
  `CLIENT_ID` varchar(255) DEFAULT NULL,
  `USER_ID` varchar(255) NOT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  `STORAGE_PROVIDER_ID` varchar(36) DEFAULT NULL,
  `CREATED_DATE` bigint(20) DEFAULT NULL,
  `LAST_UPDATED_DATE` bigint(20) DEFAULT NULL,
  `CLIENT_STORAGE_PROVIDER` varchar(36) DEFAULT NULL,
  `EXTERNAL_CLIENT_ID` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_FU_CONSENT` (`USER_ID`,`CLIENT_ID`),
  KEY `IDX_FU_CONSENT_RU` (`REALM_ID`,`USER_ID`),
  KEY `IDX_FU_CNSNT_EXT` (`USER_ID`,`CLIENT_STORAGE_PROVIDER`,`EXTERNAL_CLIENT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FED_USER_CONSENT`
--

LOCK TABLES `FED_USER_CONSENT` WRITE;
/*!40000 ALTER TABLE `FED_USER_CONSENT` DISABLE KEYS */;
/*!40000 ALTER TABLE `FED_USER_CONSENT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FED_USER_CONSENT_CL_SCOPE`
--

DROP TABLE IF EXISTS `FED_USER_CONSENT_CL_SCOPE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `FED_USER_CONSENT_CL_SCOPE` (
  `USER_CONSENT_ID` varchar(36) NOT NULL,
  `SCOPE_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`USER_CONSENT_ID`,`SCOPE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FED_USER_CONSENT_CL_SCOPE`
--

LOCK TABLES `FED_USER_CONSENT_CL_SCOPE` WRITE;
/*!40000 ALTER TABLE `FED_USER_CONSENT_CL_SCOPE` DISABLE KEYS */;
/*!40000 ALTER TABLE `FED_USER_CONSENT_CL_SCOPE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FED_USER_CREDENTIAL`
--

DROP TABLE IF EXISTS `FED_USER_CREDENTIAL`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `FED_USER_CREDENTIAL` (
  `ID` varchar(36) NOT NULL,
  `SALT` tinyblob DEFAULT NULL,
  `TYPE` varchar(255) DEFAULT NULL,
  `CREATED_DATE` bigint(20) DEFAULT NULL,
  `USER_ID` varchar(255) NOT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  `STORAGE_PROVIDER_ID` varchar(36) DEFAULT NULL,
  `USER_LABEL` varchar(255) DEFAULT NULL,
  `SECRET_DATA` longtext DEFAULT NULL,
  `CREDENTIAL_DATA` longtext DEFAULT NULL,
  `PRIORITY` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_FU_CREDENTIAL` (`USER_ID`,`TYPE`),
  KEY `IDX_FU_CREDENTIAL_RU` (`REALM_ID`,`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FED_USER_CREDENTIAL`
--

LOCK TABLES `FED_USER_CREDENTIAL` WRITE;
/*!40000 ALTER TABLE `FED_USER_CREDENTIAL` DISABLE KEYS */;
/*!40000 ALTER TABLE `FED_USER_CREDENTIAL` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FED_USER_GROUP_MEMBERSHIP`
--

DROP TABLE IF EXISTS `FED_USER_GROUP_MEMBERSHIP`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `FED_USER_GROUP_MEMBERSHIP` (
  `GROUP_ID` varchar(36) NOT NULL,
  `USER_ID` varchar(255) NOT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  `STORAGE_PROVIDER_ID` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`GROUP_ID`,`USER_ID`),
  KEY `IDX_FU_GROUP_MEMBERSHIP` (`USER_ID`,`GROUP_ID`),
  KEY `IDX_FU_GROUP_MEMBERSHIP_RU` (`REALM_ID`,`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FED_USER_GROUP_MEMBERSHIP`
--

LOCK TABLES `FED_USER_GROUP_MEMBERSHIP` WRITE;
/*!40000 ALTER TABLE `FED_USER_GROUP_MEMBERSHIP` DISABLE KEYS */;
/*!40000 ALTER TABLE `FED_USER_GROUP_MEMBERSHIP` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FED_USER_REQUIRED_ACTION`
--

DROP TABLE IF EXISTS `FED_USER_REQUIRED_ACTION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `FED_USER_REQUIRED_ACTION` (
  `REQUIRED_ACTION` varchar(255) NOT NULL DEFAULT ' ',
  `USER_ID` varchar(255) NOT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  `STORAGE_PROVIDER_ID` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`REQUIRED_ACTION`,`USER_ID`),
  KEY `IDX_FU_REQUIRED_ACTION` (`USER_ID`,`REQUIRED_ACTION`),
  KEY `IDX_FU_REQUIRED_ACTION_RU` (`REALM_ID`,`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FED_USER_REQUIRED_ACTION`
--

LOCK TABLES `FED_USER_REQUIRED_ACTION` WRITE;
/*!40000 ALTER TABLE `FED_USER_REQUIRED_ACTION` DISABLE KEYS */;
/*!40000 ALTER TABLE `FED_USER_REQUIRED_ACTION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FED_USER_ROLE_MAPPING`
--

DROP TABLE IF EXISTS `FED_USER_ROLE_MAPPING`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `FED_USER_ROLE_MAPPING` (
  `ROLE_ID` varchar(36) NOT NULL,
  `USER_ID` varchar(255) NOT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  `STORAGE_PROVIDER_ID` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`ROLE_ID`,`USER_ID`),
  KEY `IDX_FU_ROLE_MAPPING` (`USER_ID`,`ROLE_ID`),
  KEY `IDX_FU_ROLE_MAPPING_RU` (`REALM_ID`,`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FED_USER_ROLE_MAPPING`
--

LOCK TABLES `FED_USER_ROLE_MAPPING` WRITE;
/*!40000 ALTER TABLE `FED_USER_ROLE_MAPPING` DISABLE KEYS */;
/*!40000 ALTER TABLE `FED_USER_ROLE_MAPPING` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `GROUP_ATTRIBUTE`
--

DROP TABLE IF EXISTS `GROUP_ATTRIBUTE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `GROUP_ATTRIBUTE` (
  `ID` varchar(36) NOT NULL DEFAULT 'sybase-needs-something-here',
  `NAME` varchar(255) NOT NULL,
  `VALUE` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `GROUP_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_GROUP_ATTR_GROUP` (`GROUP_ID`),
  KEY `IDX_GROUP_ATT_BY_NAME_VALUE` (`NAME`,`VALUE`),
  CONSTRAINT `FK_GROUP_ATTRIBUTE_GROUP` FOREIGN KEY (`GROUP_ID`) REFERENCES `KEYCLOAK_GROUP` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `GROUP_ATTRIBUTE`
--

LOCK TABLES `GROUP_ATTRIBUTE` WRITE;
/*!40000 ALTER TABLE `GROUP_ATTRIBUTE` DISABLE KEYS */;
/*!40000 ALTER TABLE `GROUP_ATTRIBUTE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `GROUP_ROLE_MAPPING`
--

DROP TABLE IF EXISTS `GROUP_ROLE_MAPPING`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `GROUP_ROLE_MAPPING` (
  `ROLE_ID` varchar(36) NOT NULL,
  `GROUP_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`ROLE_ID`,`GROUP_ID`),
  KEY `IDX_GROUP_ROLE_MAPP_GROUP` (`GROUP_ID`),
  CONSTRAINT `FK_GROUP_ROLE_GROUP` FOREIGN KEY (`GROUP_ID`) REFERENCES `KEYCLOAK_GROUP` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `GROUP_ROLE_MAPPING`
--

LOCK TABLES `GROUP_ROLE_MAPPING` WRITE;
/*!40000 ALTER TABLE `GROUP_ROLE_MAPPING` DISABLE KEYS */;
/*!40000 ALTER TABLE `GROUP_ROLE_MAPPING` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `IDENTITY_PROVIDER`
--

DROP TABLE IF EXISTS `IDENTITY_PROVIDER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `IDENTITY_PROVIDER` (
  `INTERNAL_ID` varchar(36) NOT NULL,
  `ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `PROVIDER_ALIAS` varchar(255) DEFAULT NULL,
  `PROVIDER_ID` varchar(255) DEFAULT NULL,
  `STORE_TOKEN` bit(1) NOT NULL DEFAULT b'0',
  `AUTHENTICATE_BY_DEFAULT` bit(1) NOT NULL DEFAULT b'0',
  `REALM_ID` varchar(36) DEFAULT NULL,
  `ADD_TOKEN_ROLE` bit(1) NOT NULL DEFAULT b'1',
  `TRUST_EMAIL` bit(1) NOT NULL DEFAULT b'0',
  `FIRST_BROKER_LOGIN_FLOW_ID` varchar(36) DEFAULT NULL,
  `POST_BROKER_LOGIN_FLOW_ID` varchar(36) DEFAULT NULL,
  `PROVIDER_DISPLAY_NAME` varchar(255) DEFAULT NULL,
  `LINK_ONLY` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`INTERNAL_ID`),
  UNIQUE KEY `UK_2DAELWNIBJI49AVXSRTUF6XJ33` (`PROVIDER_ALIAS`,`REALM_ID`),
  KEY `IDX_IDENT_PROV_REALM` (`REALM_ID`),
  CONSTRAINT `FK2B4EBC52AE5C3B34` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `IDENTITY_PROVIDER`
--

LOCK TABLES `IDENTITY_PROVIDER` WRITE;
/*!40000 ALTER TABLE `IDENTITY_PROVIDER` DISABLE KEYS */;
/*!40000 ALTER TABLE `IDENTITY_PROVIDER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `IDENTITY_PROVIDER_CONFIG`
--

DROP TABLE IF EXISTS `IDENTITY_PROVIDER_CONFIG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `IDENTITY_PROVIDER_CONFIG` (
  `IDENTITY_PROVIDER_ID` varchar(36) NOT NULL,
  `VALUE` longtext DEFAULT NULL,
  `NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`IDENTITY_PROVIDER_ID`,`NAME`),
  CONSTRAINT `FKDC4897CF864C4E43` FOREIGN KEY (`IDENTITY_PROVIDER_ID`) REFERENCES `IDENTITY_PROVIDER` (`INTERNAL_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `IDENTITY_PROVIDER_CONFIG`
--

LOCK TABLES `IDENTITY_PROVIDER_CONFIG` WRITE;
/*!40000 ALTER TABLE `IDENTITY_PROVIDER_CONFIG` DISABLE KEYS */;
/*!40000 ALTER TABLE `IDENTITY_PROVIDER_CONFIG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `IDENTITY_PROVIDER_MAPPER`
--

DROP TABLE IF EXISTS `IDENTITY_PROVIDER_MAPPER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `IDENTITY_PROVIDER_MAPPER` (
  `ID` varchar(36) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `IDP_ALIAS` varchar(255) NOT NULL,
  `IDP_MAPPER_NAME` varchar(255) NOT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_ID_PROV_MAPP_REALM` (`REALM_ID`),
  CONSTRAINT `FK_IDPM_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `IDENTITY_PROVIDER_MAPPER`
--

LOCK TABLES `IDENTITY_PROVIDER_MAPPER` WRITE;
/*!40000 ALTER TABLE `IDENTITY_PROVIDER_MAPPER` DISABLE KEYS */;
/*!40000 ALTER TABLE `IDENTITY_PROVIDER_MAPPER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `IDP_MAPPER_CONFIG`
--

DROP TABLE IF EXISTS `IDP_MAPPER_CONFIG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `IDP_MAPPER_CONFIG` (
  `IDP_MAPPER_ID` varchar(36) NOT NULL,
  `VALUE` longtext DEFAULT NULL,
  `NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`IDP_MAPPER_ID`,`NAME`),
  CONSTRAINT `FK_IDPMCONFIG` FOREIGN KEY (`IDP_MAPPER_ID`) REFERENCES `IDENTITY_PROVIDER_MAPPER` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `IDP_MAPPER_CONFIG`
--

LOCK TABLES `IDP_MAPPER_CONFIG` WRITE;
/*!40000 ALTER TABLE `IDP_MAPPER_CONFIG` DISABLE KEYS */;
/*!40000 ALTER TABLE `IDP_MAPPER_CONFIG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `KEYCLOAK_GROUP`
--

DROP TABLE IF EXISTS `KEYCLOAK_GROUP`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `KEYCLOAK_GROUP` (
  `ID` varchar(36) NOT NULL,
  `NAME` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `PARENT_GROUP` varchar(36) NOT NULL,
  `REALM_ID` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `SIBLING_NAMES` (`REALM_ID`,`PARENT_GROUP`,`NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `KEYCLOAK_GROUP`
--

LOCK TABLES `KEYCLOAK_GROUP` WRITE;
/*!40000 ALTER TABLE `KEYCLOAK_GROUP` DISABLE KEYS */;
INSERT INTO `KEYCLOAK_GROUP` VALUES
('adfbe9a5-7813-4522-b10b-15e38e189235','ArgocdAdmins',' ','9edf1ebb-174b-478f-8959-7f2aa7617d22');
/*!40000 ALTER TABLE `KEYCLOAK_GROUP` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `KEYCLOAK_ROLE`
--

DROP TABLE IF EXISTS `KEYCLOAK_ROLE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `KEYCLOAK_ROLE` (
  `ID` varchar(36) NOT NULL,
  `CLIENT_REALM_CONSTRAINT` varchar(255) DEFAULT NULL,
  `CLIENT_ROLE` bit(1) DEFAULT NULL,
  `DESCRIPTION` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `NAME` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `REALM_ID` varchar(255) DEFAULT NULL,
  `CLIENT` varchar(36) DEFAULT NULL,
  `REALM` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_J3RWUVD56ONTGSUHOGM184WW2-2` (`NAME`,`CLIENT_REALM_CONSTRAINT`),
  KEY `IDX_KEYCLOAK_ROLE_CLIENT` (`CLIENT`),
  KEY `IDX_KEYCLOAK_ROLE_REALM` (`REALM`),
  CONSTRAINT `FK_6VYQFE4CN4WLQ8R6KT5VDSJ5C` FOREIGN KEY (`REALM`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `KEYCLOAK_ROLE`
--

LOCK TABLES `KEYCLOAK_ROLE` WRITE;
/*!40000 ALTER TABLE `KEYCLOAK_ROLE` DISABLE KEYS */;
INSERT INTO `KEYCLOAK_ROLE` VALUES
('13be511e-cd78-4ae3-ae42-6cde3798a334','9edf1ebb-174b-478f-8959-7f2aa7617d22','\0','${role_uma_authorization}','uma_authorization','9edf1ebb-174b-478f-8959-7f2aa7617d22',NULL,NULL),
('20eba594-a329-45a3-8e64-4ce51815323b','9edf1ebb-174b-478f-8959-7f2aa7617d22','\0','${role_create-realm}','create-realm','9edf1ebb-174b-478f-8959-7f2aa7617d22',NULL,NULL),
('2255021e-924c-410b-b3ee-ec21bc5e2f5e','9d42395c-eb37-4b6d-b23d-778fdb4b677a','','${role_impersonation}','impersonation','9edf1ebb-174b-478f-8959-7f2aa7617d22','9d42395c-eb37-4b6d-b23d-778fdb4b677a',NULL),
('28d9b980-6fb1-463e-9d54-3824bbbad6cb','2fb6af61-2126-4686-9889-0239e66147cd','','${role_manage-consent}','manage-consent','9edf1ebb-174b-478f-8959-7f2aa7617d22','2fb6af61-2126-4686-9889-0239e66147cd',NULL),
('2ac01fff-307a-4301-be52-2b14aca93112','9d42395c-eb37-4b6d-b23d-778fdb4b677a','','${role_manage-events}','manage-events','9edf1ebb-174b-478f-8959-7f2aa7617d22','9d42395c-eb37-4b6d-b23d-778fdb4b677a',NULL),
('395f4d73-14cb-40e5-8854-dc16a72be6aa','2fb6af61-2126-4686-9889-0239e66147cd','','${role_manage-account}','manage-account','9edf1ebb-174b-478f-8959-7f2aa7617d22','2fb6af61-2126-4686-9889-0239e66147cd',NULL),
('40e15634-ff33-441e-91fb-0d85dd05f7a7','2fb6af61-2126-4686-9889-0239e66147cd','','${role_view-groups}','view-groups','9edf1ebb-174b-478f-8959-7f2aa7617d22','2fb6af61-2126-4686-9889-0239e66147cd',NULL),
('4a6d260a-0071-4f34-ab73-641365dcac91','9d42395c-eb37-4b6d-b23d-778fdb4b677a','','${role_query-realms}','query-realms','9edf1ebb-174b-478f-8959-7f2aa7617d22','9d42395c-eb37-4b6d-b23d-778fdb4b677a',NULL),
('56f3101c-22ff-419a-bf6c-0c13aa44507c','9d42395c-eb37-4b6d-b23d-778fdb4b677a','','${role_query-groups}','query-groups','9edf1ebb-174b-478f-8959-7f2aa7617d22','9d42395c-eb37-4b6d-b23d-778fdb4b677a',NULL),
('57839a72-de83-45d7-a58f-00d93eb444d0','9d42395c-eb37-4b6d-b23d-778fdb4b677a','','${role_view-events}','view-events','9edf1ebb-174b-478f-8959-7f2aa7617d22','9d42395c-eb37-4b6d-b23d-778fdb4b677a',NULL),
('66c78894-c1a3-47a4-bdc2-176f334e5a13','9d42395c-eb37-4b6d-b23d-778fdb4b677a','','${role_view-users}','view-users','9edf1ebb-174b-478f-8959-7f2aa7617d22','9d42395c-eb37-4b6d-b23d-778fdb4b677a',NULL),
('70b6fe7e-651f-4a6f-8858-70e2897c9c97','2fb6af61-2126-4686-9889-0239e66147cd','','${role_view-consent}','view-consent','9edf1ebb-174b-478f-8959-7f2aa7617d22','2fb6af61-2126-4686-9889-0239e66147cd',NULL),
('80d91362-8fb7-4dcb-a979-bfa68b4f8415','9d42395c-eb37-4b6d-b23d-778fdb4b677a','','${role_manage-identity-providers}','manage-identity-providers','9edf1ebb-174b-478f-8959-7f2aa7617d22','9d42395c-eb37-4b6d-b23d-778fdb4b677a',NULL),
('8346bbb8-eb2d-4802-a737-523f22871bf4','2fb6af61-2126-4686-9889-0239e66147cd','','${role_view-applications}','view-applications','9edf1ebb-174b-478f-8959-7f2aa7617d22','2fb6af61-2126-4686-9889-0239e66147cd',NULL),
('8d9f1dfb-6cfb-41c0-8f4f-eede7269bd13','9d42395c-eb37-4b6d-b23d-778fdb4b677a','','${role_view-authorization}','view-authorization','9edf1ebb-174b-478f-8959-7f2aa7617d22','9d42395c-eb37-4b6d-b23d-778fdb4b677a',NULL),
('92790851-e2c4-4230-ac45-a7c169c9945e','2fb6af61-2126-4686-9889-0239e66147cd','','${role_manage-account-links}','manage-account-links','9edf1ebb-174b-478f-8959-7f2aa7617d22','2fb6af61-2126-4686-9889-0239e66147cd',NULL),
('a924937c-0f91-4518-b45c-934f47074999','9edf1ebb-174b-478f-8959-7f2aa7617d22','\0','${role_default-roles}','default-roles-master','9edf1ebb-174b-478f-8959-7f2aa7617d22',NULL,NULL),
('a9f30435-c860-40d4-931f-8a31e60e8a91','9edf1ebb-174b-478f-8959-7f2aa7617d22','\0','${role_admin}','admin','9edf1ebb-174b-478f-8959-7f2aa7617d22',NULL,NULL),
('b26ea811-6cd9-49db-9670-544feadeb332','9d42395c-eb37-4b6d-b23d-778fdb4b677a','','${role_view-clients}','view-clients','9edf1ebb-174b-478f-8959-7f2aa7617d22','9d42395c-eb37-4b6d-b23d-778fdb4b677a',NULL),
('b3919b1b-74c4-4673-a109-696eda56bca9','9d42395c-eb37-4b6d-b23d-778fdb4b677a','','${role_manage-users}','manage-users','9edf1ebb-174b-478f-8959-7f2aa7617d22','9d42395c-eb37-4b6d-b23d-778fdb4b677a',NULL),
('b9e411d0-4dbe-49e2-a3d6-966a7e19f291','9d42395c-eb37-4b6d-b23d-778fdb4b677a','','${role_create-client}','create-client','9edf1ebb-174b-478f-8959-7f2aa7617d22','9d42395c-eb37-4b6d-b23d-778fdb4b677a',NULL),
('c53a43ee-e26a-426d-a9b9-2978a836bd23','2fb6af61-2126-4686-9889-0239e66147cd','','${role_delete-account}','delete-account','9edf1ebb-174b-478f-8959-7f2aa7617d22','2fb6af61-2126-4686-9889-0239e66147cd',NULL),
('d3c34be6-cf43-4f6e-8058-2a9e2d2b5c71','9d42395c-eb37-4b6d-b23d-778fdb4b677a','','${role_view-identity-providers}','view-identity-providers','9edf1ebb-174b-478f-8959-7f2aa7617d22','9d42395c-eb37-4b6d-b23d-778fdb4b677a',NULL),
('d6098b1f-49a8-4291-96c6-815f0347994e','9d42395c-eb37-4b6d-b23d-778fdb4b677a','','${role_query-users}','query-users','9edf1ebb-174b-478f-8959-7f2aa7617d22','9d42395c-eb37-4b6d-b23d-778fdb4b677a',NULL),
('dd468ed4-1813-4a54-965d-65555dbe6101','9d42395c-eb37-4b6d-b23d-778fdb4b677a','','${role_query-clients}','query-clients','9edf1ebb-174b-478f-8959-7f2aa7617d22','9d42395c-eb37-4b6d-b23d-778fdb4b677a',NULL),
('e1bb87ef-8533-43ec-80de-17046879eecc','9d42395c-eb37-4b6d-b23d-778fdb4b677a','','${role_manage-authorization}','manage-authorization','9edf1ebb-174b-478f-8959-7f2aa7617d22','9d42395c-eb37-4b6d-b23d-778fdb4b677a',NULL),
('e3d78c12-d72a-44dc-a591-1baec8b675e9','2fb6af61-2126-4686-9889-0239e66147cd','','${role_view-profile}','view-profile','9edf1ebb-174b-478f-8959-7f2aa7617d22','2fb6af61-2126-4686-9889-0239e66147cd',NULL),
('f07f7de8-fd29-419c-8906-d3e71dbefdb9','9d42395c-eb37-4b6d-b23d-778fdb4b677a','','${role_manage-realm}','manage-realm','9edf1ebb-174b-478f-8959-7f2aa7617d22','9d42395c-eb37-4b6d-b23d-778fdb4b677a',NULL),
('f0b8c1ec-7de3-4c00-87b5-f3b8c71e4c07','9d42395c-eb37-4b6d-b23d-778fdb4b677a','','${role_manage-clients}','manage-clients','9edf1ebb-174b-478f-8959-7f2aa7617d22','9d42395c-eb37-4b6d-b23d-778fdb4b677a',NULL),
('f2907a1a-7bef-4c5f-9fba-7574a649ece5','9d42395c-eb37-4b6d-b23d-778fdb4b677a','','${role_view-realm}','view-realm','9edf1ebb-174b-478f-8959-7f2aa7617d22','9d42395c-eb37-4b6d-b23d-778fdb4b677a',NULL),
('fe25c743-4518-4613-8d8f-f2090dd18e8b','81f2cb30-de95-40ce-be55-a23ebfe18b2e','','${role_read-token}','read-token','9edf1ebb-174b-478f-8959-7f2aa7617d22','81f2cb30-de95-40ce-be55-a23ebfe18b2e',NULL),
('fe8ae4c5-6d90-4a32-b8d2-f307ea32bf78','9edf1ebb-174b-478f-8959-7f2aa7617d22','\0','${role_offline-access}','offline_access','9edf1ebb-174b-478f-8959-7f2aa7617d22',NULL,NULL);
/*!40000 ALTER TABLE `KEYCLOAK_ROLE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `MIGRATION_MODEL`
--

DROP TABLE IF EXISTS `MIGRATION_MODEL`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `MIGRATION_MODEL` (
  `ID` varchar(36) NOT NULL,
  `VERSION` varchar(36) DEFAULT NULL,
  `UPDATE_TIME` bigint(20) NOT NULL DEFAULT 0,
  PRIMARY KEY (`ID`),
  KEY `IDX_UPDATE_TIME` (`UPDATE_TIME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MIGRATION_MODEL`
--

LOCK TABLES `MIGRATION_MODEL` WRITE;
/*!40000 ALTER TABLE `MIGRATION_MODEL` DISABLE KEYS */;
INSERT INTO `MIGRATION_MODEL` VALUES
('9k02b','21.0.1',1679062827);
/*!40000 ALTER TABLE `MIGRATION_MODEL` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `OFFLINE_CLIENT_SESSION`
--

DROP TABLE IF EXISTS `OFFLINE_CLIENT_SESSION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `OFFLINE_CLIENT_SESSION` (
  `USER_SESSION_ID` varchar(36) NOT NULL,
  `CLIENT_ID` varchar(255) NOT NULL,
  `OFFLINE_FLAG` varchar(4) NOT NULL,
  `TIMESTAMP` int(11) DEFAULT NULL,
  `DATA` longtext DEFAULT NULL,
  `CLIENT_STORAGE_PROVIDER` varchar(36) NOT NULL DEFAULT 'local',
  `EXTERNAL_CLIENT_ID` varchar(255) NOT NULL DEFAULT 'local',
  PRIMARY KEY (`USER_SESSION_ID`,`CLIENT_ID`,`CLIENT_STORAGE_PROVIDER`,`EXTERNAL_CLIENT_ID`,`OFFLINE_FLAG`),
  KEY `IDX_US_SESS_ID_ON_CL_SESS` (`USER_SESSION_ID`),
  KEY `IDX_OFFLINE_CSS_PRELOAD` (`CLIENT_ID`,`OFFLINE_FLAG`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `OFFLINE_CLIENT_SESSION`
--

LOCK TABLES `OFFLINE_CLIENT_SESSION` WRITE;
/*!40000 ALTER TABLE `OFFLINE_CLIENT_SESSION` DISABLE KEYS */;
/*!40000 ALTER TABLE `OFFLINE_CLIENT_SESSION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `OFFLINE_USER_SESSION`
--

DROP TABLE IF EXISTS `OFFLINE_USER_SESSION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `OFFLINE_USER_SESSION` (
  `USER_SESSION_ID` varchar(36) NOT NULL,
  `USER_ID` varchar(255) DEFAULT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  `CREATED_ON` int(11) NOT NULL,
  `OFFLINE_FLAG` varchar(4) NOT NULL,
  `DATA` longtext DEFAULT NULL,
  `LAST_SESSION_REFRESH` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`USER_SESSION_ID`,`OFFLINE_FLAG`),
  KEY `IDX_OFFLINE_USS_CREATEDON` (`CREATED_ON`),
  KEY `IDX_OFFLINE_USS_PRELOAD` (`OFFLINE_FLAG`,`CREATED_ON`,`USER_SESSION_ID`),
  KEY `IDX_OFFLINE_USS_BY_USER` (`USER_ID`,`REALM_ID`,`OFFLINE_FLAG`),
  KEY `IDX_OFFLINE_USS_BY_USERSESS` (`REALM_ID`,`OFFLINE_FLAG`,`USER_SESSION_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `OFFLINE_USER_SESSION`
--

LOCK TABLES `OFFLINE_USER_SESSION` WRITE;
/*!40000 ALTER TABLE `OFFLINE_USER_SESSION` DISABLE KEYS */;
/*!40000 ALTER TABLE `OFFLINE_USER_SESSION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `POLICY_CONFIG`
--

DROP TABLE IF EXISTS `POLICY_CONFIG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `POLICY_CONFIG` (
  `POLICY_ID` varchar(36) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `VALUE` longtext DEFAULT NULL,
  PRIMARY KEY (`POLICY_ID`,`NAME`),
  CONSTRAINT `FKDC34197CF864C4E43` FOREIGN KEY (`POLICY_ID`) REFERENCES `RESOURCE_SERVER_POLICY` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `POLICY_CONFIG`
--

LOCK TABLES `POLICY_CONFIG` WRITE;
/*!40000 ALTER TABLE `POLICY_CONFIG` DISABLE KEYS */;
/*!40000 ALTER TABLE `POLICY_CONFIG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PROTOCOL_MAPPER`
--

DROP TABLE IF EXISTS `PROTOCOL_MAPPER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PROTOCOL_MAPPER` (
  `ID` varchar(36) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `PROTOCOL` varchar(255) NOT NULL,
  `PROTOCOL_MAPPER_NAME` varchar(255) NOT NULL,
  `CLIENT_ID` varchar(36) DEFAULT NULL,
  `CLIENT_SCOPE_ID` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_PROTOCOL_MAPPER_CLIENT` (`CLIENT_ID`),
  KEY `IDX_CLSCOPE_PROTMAP` (`CLIENT_SCOPE_ID`),
  CONSTRAINT `FK_CLI_SCOPE_MAPPER` FOREIGN KEY (`CLIENT_SCOPE_ID`) REFERENCES `CLIENT_SCOPE` (`ID`),
  CONSTRAINT `FK_PCM_REALM` FOREIGN KEY (`CLIENT_ID`) REFERENCES `CLIENT` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PROTOCOL_MAPPER`
--

LOCK TABLES `PROTOCOL_MAPPER` WRITE;
/*!40000 ALTER TABLE `PROTOCOL_MAPPER` DISABLE KEYS */;
INSERT INTO `PROTOCOL_MAPPER` VALUES
('048e9cdf-fd69-40ee-87aa-2d7988127842','role list','saml','saml-role-list-mapper',NULL,'852c44dd-ae38-4682-9f0b-2e2a8021654d'),
('06e4a3a0-272d-4209-87a2-af92455cc45e','zoneinfo','openid-connect','oidc-usermodel-attribute-mapper',NULL,'8cf5e257-bdc3-4379-8b5c-37f0ec23c0c2'),
('0812bad6-7894-435c-8cbd-1575c721eaa7','middle name','openid-connect','oidc-usermodel-attribute-mapper',NULL,'8cf5e257-bdc3-4379-8b5c-37f0ec23c0c2'),
('11b49417-bb98-4269-99bc-576069aa1f9a','given name','openid-connect','oidc-usermodel-property-mapper',NULL,'8cf5e257-bdc3-4379-8b5c-37f0ec23c0c2'),
('220ca772-241a-4cf7-a558-33bcc9ae179f','picture','openid-connect','oidc-usermodel-attribute-mapper',NULL,'8cf5e257-bdc3-4379-8b5c-37f0ec23c0c2'),
('29914a78-a0ff-4b8c-a0fd-5553f642a415','phone number','openid-connect','oidc-usermodel-attribute-mapper',NULL,'bd17e7bb-c043-4a62-9be1-7668ea1dfbfc'),
('2cdc2bcd-83ce-4976-9a95-3e4db1beb745','locale','openid-connect','oidc-usermodel-attribute-mapper','b1965a6e-95cb-4113-a3c1-68aab6e81d49',NULL),
('2ed4e01a-a8cc-4e65-9006-56482b4fd73f','email','openid-connect','oidc-usermodel-property-mapper',NULL,'dbf832eb-7dbb-439f-9a83-3bd44b2c0a41'),
('4a1f2e54-f2dd-4f6f-81b8-fea1eb4397a4','nickname','openid-connect','oidc-usermodel-attribute-mapper',NULL,'8cf5e257-bdc3-4379-8b5c-37f0ec23c0c2'),
('6253906f-8b7e-4712-ad11-467637ffc7e4','acr loa level','openid-connect','oidc-acr-mapper',NULL,'b3717553-2a8f-4b8e-9045-11117b33fd2e'),
('6715aeed-e3aa-48e8-8268-0377d22e0df8','birthdate','openid-connect','oidc-usermodel-attribute-mapper',NULL,'8cf5e257-bdc3-4379-8b5c-37f0ec23c0c2'),
('72577408-f670-4fe9-ad04-9b3e5a375b56','groups','openid-connect','oidc-group-membership-mapper',NULL,'e005dc58-bba1-4018-929a-e2e65d44297d'),
('84a610b0-77f4-472a-987f-e5a682dabd95','website','openid-connect','oidc-usermodel-attribute-mapper',NULL,'8cf5e257-bdc3-4379-8b5c-37f0ec23c0c2'),
('95ee3825-4950-4758-a915-7780bdb11754','address','openid-connect','oidc-address-mapper',NULL,'431f2ce1-8af6-4ab7-bd75-46d6aab1bc28'),
('9b0c34a6-6a25-4c13-8eb6-50acc45a1c08','email verified','openid-connect','oidc-usermodel-property-mapper',NULL,'dbf832eb-7dbb-439f-9a83-3bd44b2c0a41'),
('9dcdc8f6-fd69-4ce5-8b25-e1e4b9c34316','audience resolve','openid-connect','oidc-audience-resolve-mapper',NULL,'ed6a4a0d-3eed-4202-8037-029ef0b450d0'),
('a78f567e-92e4-426d-81f7-dbfd35d45cab','profile','openid-connect','oidc-usermodel-attribute-mapper',NULL,'8cf5e257-bdc3-4379-8b5c-37f0ec23c0c2'),
('aa8988e0-018e-42df-a9f8-d9d6e8d2eb63','full name','openid-connect','oidc-full-name-mapper',NULL,'8cf5e257-bdc3-4379-8b5c-37f0ec23c0c2'),
('ab52eafa-2a66-458b-b5c0-db6eca1ccb45','username','openid-connect','oidc-usermodel-property-mapper',NULL,'8cf5e257-bdc3-4379-8b5c-37f0ec23c0c2'),
('bec1ac81-1d86-4292-a472-8849592a9640','audience resolve','openid-connect','oidc-audience-resolve-mapper','fc44ee4f-6340-4d79-be98-2c78118d59e7',NULL),
('c04296ed-7cd6-452b-9803-c9c81ec9f195','gender','openid-connect','oidc-usermodel-attribute-mapper',NULL,'8cf5e257-bdc3-4379-8b5c-37f0ec23c0c2'),
('ce4bc0cf-f72e-4153-b96b-cfaee7feb6d2','allowed web origins','openid-connect','oidc-allowed-origins-mapper',NULL,'8b0efaee-6d64-4fca-8671-146a19a5e4e0'),
('ceed6190-5fd4-48bb-96ce-f8da06b16326','upn','openid-connect','oidc-usermodel-property-mapper',NULL,'a7e6df0d-408b-4109-9772-e34e05344732'),
('cf2e76f6-fcce-43cc-b85c-1fc6f7c93f27','updated at','openid-connect','oidc-usermodel-attribute-mapper',NULL,'8cf5e257-bdc3-4379-8b5c-37f0ec23c0c2'),
('dd9d9abb-84bb-40c4-8534-671096ecf227','locale','openid-connect','oidc-usermodel-attribute-mapper',NULL,'8cf5e257-bdc3-4379-8b5c-37f0ec23c0c2'),
('ec6b78ae-3743-431c-97de-80a2d0324e16','phone number verified','openid-connect','oidc-usermodel-attribute-mapper',NULL,'bd17e7bb-c043-4a62-9be1-7668ea1dfbfc'),
('eda98229-8346-4600-b35d-d8e27ad74791','realm roles','openid-connect','oidc-usermodel-realm-role-mapper',NULL,'ed6a4a0d-3eed-4202-8037-029ef0b450d0'),
('f33a34c0-649c-4075-b0db-eede962f703d','client roles','openid-connect','oidc-usermodel-client-role-mapper',NULL,'ed6a4a0d-3eed-4202-8037-029ef0b450d0'),
('f622a80b-049f-45a4-a72f-f2a4c65f4bf3','groups','openid-connect','oidc-usermodel-realm-role-mapper',NULL,'a7e6df0d-408b-4109-9772-e34e05344732'),
('f8dec398-ccb8-440c-aeb8-33799b64aa88','family name','openid-connect','oidc-usermodel-property-mapper',NULL,'8cf5e257-bdc3-4379-8b5c-37f0ec23c0c2');
/*!40000 ALTER TABLE `PROTOCOL_MAPPER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PROTOCOL_MAPPER_CONFIG`
--

DROP TABLE IF EXISTS `PROTOCOL_MAPPER_CONFIG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PROTOCOL_MAPPER_CONFIG` (
  `PROTOCOL_MAPPER_ID` varchar(36) NOT NULL,
  `VALUE` longtext DEFAULT NULL,
  `NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`PROTOCOL_MAPPER_ID`,`NAME`),
  CONSTRAINT `FK_PMCONFIG` FOREIGN KEY (`PROTOCOL_MAPPER_ID`) REFERENCES `PROTOCOL_MAPPER` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PROTOCOL_MAPPER_CONFIG`
--

LOCK TABLES `PROTOCOL_MAPPER_CONFIG` WRITE;
/*!40000 ALTER TABLE `PROTOCOL_MAPPER_CONFIG` DISABLE KEYS */;
INSERT INTO `PROTOCOL_MAPPER_CONFIG` VALUES
('048e9cdf-fd69-40ee-87aa-2d7988127842','Role','attribute.name'),
('048e9cdf-fd69-40ee-87aa-2d7988127842','Basic','attribute.nameformat'),
('048e9cdf-fd69-40ee-87aa-2d7988127842','false','single'),
('06e4a3a0-272d-4209-87a2-af92455cc45e','true','access.token.claim'),
('06e4a3a0-272d-4209-87a2-af92455cc45e','zoneinfo','claim.name'),
('06e4a3a0-272d-4209-87a2-af92455cc45e','true','id.token.claim'),
('06e4a3a0-272d-4209-87a2-af92455cc45e','String','jsonType.label'),
('06e4a3a0-272d-4209-87a2-af92455cc45e','zoneinfo','user.attribute'),
('06e4a3a0-272d-4209-87a2-af92455cc45e','true','userinfo.token.claim'),
('0812bad6-7894-435c-8cbd-1575c721eaa7','true','access.token.claim'),
('0812bad6-7894-435c-8cbd-1575c721eaa7','middle_name','claim.name'),
('0812bad6-7894-435c-8cbd-1575c721eaa7','true','id.token.claim'),
('0812bad6-7894-435c-8cbd-1575c721eaa7','String','jsonType.label'),
('0812bad6-7894-435c-8cbd-1575c721eaa7','middleName','user.attribute'),
('0812bad6-7894-435c-8cbd-1575c721eaa7','true','userinfo.token.claim'),
('11b49417-bb98-4269-99bc-576069aa1f9a','true','access.token.claim'),
('11b49417-bb98-4269-99bc-576069aa1f9a','given_name','claim.name'),
('11b49417-bb98-4269-99bc-576069aa1f9a','true','id.token.claim'),
('11b49417-bb98-4269-99bc-576069aa1f9a','String','jsonType.label'),
('11b49417-bb98-4269-99bc-576069aa1f9a','firstName','user.attribute'),
('11b49417-bb98-4269-99bc-576069aa1f9a','true','userinfo.token.claim'),
('220ca772-241a-4cf7-a558-33bcc9ae179f','true','access.token.claim'),
('220ca772-241a-4cf7-a558-33bcc9ae179f','picture','claim.name'),
('220ca772-241a-4cf7-a558-33bcc9ae179f','true','id.token.claim'),
('220ca772-241a-4cf7-a558-33bcc9ae179f','String','jsonType.label'),
('220ca772-241a-4cf7-a558-33bcc9ae179f','picture','user.attribute'),
('220ca772-241a-4cf7-a558-33bcc9ae179f','true','userinfo.token.claim'),
('29914a78-a0ff-4b8c-a0fd-5553f642a415','true','access.token.claim'),
('29914a78-a0ff-4b8c-a0fd-5553f642a415','phone_number','claim.name'),
('29914a78-a0ff-4b8c-a0fd-5553f642a415','true','id.token.claim'),
('29914a78-a0ff-4b8c-a0fd-5553f642a415','String','jsonType.label'),
('29914a78-a0ff-4b8c-a0fd-5553f642a415','phoneNumber','user.attribute'),
('29914a78-a0ff-4b8c-a0fd-5553f642a415','true','userinfo.token.claim'),
('2cdc2bcd-83ce-4976-9a95-3e4db1beb745','true','access.token.claim'),
('2cdc2bcd-83ce-4976-9a95-3e4db1beb745','locale','claim.name'),
('2cdc2bcd-83ce-4976-9a95-3e4db1beb745','true','id.token.claim'),
('2cdc2bcd-83ce-4976-9a95-3e4db1beb745','String','jsonType.label'),
('2cdc2bcd-83ce-4976-9a95-3e4db1beb745','locale','user.attribute'),
('2cdc2bcd-83ce-4976-9a95-3e4db1beb745','true','userinfo.token.claim'),
('2ed4e01a-a8cc-4e65-9006-56482b4fd73f','true','access.token.claim'),
('2ed4e01a-a8cc-4e65-9006-56482b4fd73f','email','claim.name'),
('2ed4e01a-a8cc-4e65-9006-56482b4fd73f','true','id.token.claim'),
('2ed4e01a-a8cc-4e65-9006-56482b4fd73f','String','jsonType.label'),
('2ed4e01a-a8cc-4e65-9006-56482b4fd73f','email','user.attribute'),
('2ed4e01a-a8cc-4e65-9006-56482b4fd73f','true','userinfo.token.claim'),
('4a1f2e54-f2dd-4f6f-81b8-fea1eb4397a4','true','access.token.claim'),
('4a1f2e54-f2dd-4f6f-81b8-fea1eb4397a4','nickname','claim.name'),
('4a1f2e54-f2dd-4f6f-81b8-fea1eb4397a4','true','id.token.claim'),
('4a1f2e54-f2dd-4f6f-81b8-fea1eb4397a4','String','jsonType.label'),
('4a1f2e54-f2dd-4f6f-81b8-fea1eb4397a4','nickname','user.attribute'),
('4a1f2e54-f2dd-4f6f-81b8-fea1eb4397a4','true','userinfo.token.claim'),
('6253906f-8b7e-4712-ad11-467637ffc7e4','true','access.token.claim'),
('6253906f-8b7e-4712-ad11-467637ffc7e4','true','id.token.claim'),
('6715aeed-e3aa-48e8-8268-0377d22e0df8','true','access.token.claim'),
('6715aeed-e3aa-48e8-8268-0377d22e0df8','birthdate','claim.name'),
('6715aeed-e3aa-48e8-8268-0377d22e0df8','true','id.token.claim'),
('6715aeed-e3aa-48e8-8268-0377d22e0df8','String','jsonType.label'),
('6715aeed-e3aa-48e8-8268-0377d22e0df8','birthdate','user.attribute'),
('6715aeed-e3aa-48e8-8268-0377d22e0df8','true','userinfo.token.claim'),
('72577408-f670-4fe9-ad04-9b3e5a375b56','true','access.token.claim'),
('72577408-f670-4fe9-ad04-9b3e5a375b56','groups','claim.name'),
('72577408-f670-4fe9-ad04-9b3e5a375b56','false','full.path'),
('72577408-f670-4fe9-ad04-9b3e5a375b56','true','id.token.claim'),
('72577408-f670-4fe9-ad04-9b3e5a375b56','true','userinfo.token.claim'),
('84a610b0-77f4-472a-987f-e5a682dabd95','true','access.token.claim'),
('84a610b0-77f4-472a-987f-e5a682dabd95','website','claim.name'),
('84a610b0-77f4-472a-987f-e5a682dabd95','true','id.token.claim'),
('84a610b0-77f4-472a-987f-e5a682dabd95','String','jsonType.label'),
('84a610b0-77f4-472a-987f-e5a682dabd95','website','user.attribute'),
('84a610b0-77f4-472a-987f-e5a682dabd95','true','userinfo.token.claim'),
('95ee3825-4950-4758-a915-7780bdb11754','true','access.token.claim'),
('95ee3825-4950-4758-a915-7780bdb11754','true','id.token.claim'),
('95ee3825-4950-4758-a915-7780bdb11754','country','user.attribute.country'),
('95ee3825-4950-4758-a915-7780bdb11754','formatted','user.attribute.formatted'),
('95ee3825-4950-4758-a915-7780bdb11754','locality','user.attribute.locality'),
('95ee3825-4950-4758-a915-7780bdb11754','postal_code','user.attribute.postal_code'),
('95ee3825-4950-4758-a915-7780bdb11754','region','user.attribute.region'),
('95ee3825-4950-4758-a915-7780bdb11754','street','user.attribute.street'),
('95ee3825-4950-4758-a915-7780bdb11754','true','userinfo.token.claim'),
('9b0c34a6-6a25-4c13-8eb6-50acc45a1c08','true','access.token.claim'),
('9b0c34a6-6a25-4c13-8eb6-50acc45a1c08','email_verified','claim.name'),
('9b0c34a6-6a25-4c13-8eb6-50acc45a1c08','true','id.token.claim'),
('9b0c34a6-6a25-4c13-8eb6-50acc45a1c08','boolean','jsonType.label'),
('9b0c34a6-6a25-4c13-8eb6-50acc45a1c08','emailVerified','user.attribute'),
('9b0c34a6-6a25-4c13-8eb6-50acc45a1c08','true','userinfo.token.claim'),
('a78f567e-92e4-426d-81f7-dbfd35d45cab','true','access.token.claim'),
('a78f567e-92e4-426d-81f7-dbfd35d45cab','profile','claim.name'),
('a78f567e-92e4-426d-81f7-dbfd35d45cab','true','id.token.claim'),
('a78f567e-92e4-426d-81f7-dbfd35d45cab','String','jsonType.label'),
('a78f567e-92e4-426d-81f7-dbfd35d45cab','profile','user.attribute'),
('a78f567e-92e4-426d-81f7-dbfd35d45cab','true','userinfo.token.claim'),
('aa8988e0-018e-42df-a9f8-d9d6e8d2eb63','true','access.token.claim'),
('aa8988e0-018e-42df-a9f8-d9d6e8d2eb63','true','id.token.claim'),
('aa8988e0-018e-42df-a9f8-d9d6e8d2eb63','true','userinfo.token.claim'),
('ab52eafa-2a66-458b-b5c0-db6eca1ccb45','true','access.token.claim'),
('ab52eafa-2a66-458b-b5c0-db6eca1ccb45','preferred_username','claim.name'),
('ab52eafa-2a66-458b-b5c0-db6eca1ccb45','true','id.token.claim'),
('ab52eafa-2a66-458b-b5c0-db6eca1ccb45','String','jsonType.label'),
('ab52eafa-2a66-458b-b5c0-db6eca1ccb45','username','user.attribute'),
('ab52eafa-2a66-458b-b5c0-db6eca1ccb45','true','userinfo.token.claim'),
('c04296ed-7cd6-452b-9803-c9c81ec9f195','true','access.token.claim'),
('c04296ed-7cd6-452b-9803-c9c81ec9f195','gender','claim.name'),
('c04296ed-7cd6-452b-9803-c9c81ec9f195','true','id.token.claim'),
('c04296ed-7cd6-452b-9803-c9c81ec9f195','String','jsonType.label'),
('c04296ed-7cd6-452b-9803-c9c81ec9f195','gender','user.attribute'),
('c04296ed-7cd6-452b-9803-c9c81ec9f195','true','userinfo.token.claim'),
('ceed6190-5fd4-48bb-96ce-f8da06b16326','true','access.token.claim'),
('ceed6190-5fd4-48bb-96ce-f8da06b16326','upn','claim.name'),
('ceed6190-5fd4-48bb-96ce-f8da06b16326','true','id.token.claim'),
('ceed6190-5fd4-48bb-96ce-f8da06b16326','String','jsonType.label'),
('ceed6190-5fd4-48bb-96ce-f8da06b16326','username','user.attribute'),
('ceed6190-5fd4-48bb-96ce-f8da06b16326','true','userinfo.token.claim'),
('cf2e76f6-fcce-43cc-b85c-1fc6f7c93f27','true','access.token.claim'),
('cf2e76f6-fcce-43cc-b85c-1fc6f7c93f27','updated_at','claim.name'),
('cf2e76f6-fcce-43cc-b85c-1fc6f7c93f27','true','id.token.claim'),
('cf2e76f6-fcce-43cc-b85c-1fc6f7c93f27','long','jsonType.label'),
('cf2e76f6-fcce-43cc-b85c-1fc6f7c93f27','updatedAt','user.attribute'),
('cf2e76f6-fcce-43cc-b85c-1fc6f7c93f27','true','userinfo.token.claim'),
('dd9d9abb-84bb-40c4-8534-671096ecf227','true','access.token.claim'),
('dd9d9abb-84bb-40c4-8534-671096ecf227','locale','claim.name'),
('dd9d9abb-84bb-40c4-8534-671096ecf227','true','id.token.claim'),
('dd9d9abb-84bb-40c4-8534-671096ecf227','String','jsonType.label'),
('dd9d9abb-84bb-40c4-8534-671096ecf227','locale','user.attribute'),
('dd9d9abb-84bb-40c4-8534-671096ecf227','true','userinfo.token.claim'),
('ec6b78ae-3743-431c-97de-80a2d0324e16','true','access.token.claim'),
('ec6b78ae-3743-431c-97de-80a2d0324e16','phone_number_verified','claim.name'),
('ec6b78ae-3743-431c-97de-80a2d0324e16','true','id.token.claim'),
('ec6b78ae-3743-431c-97de-80a2d0324e16','boolean','jsonType.label'),
('ec6b78ae-3743-431c-97de-80a2d0324e16','phoneNumberVerified','user.attribute'),
('ec6b78ae-3743-431c-97de-80a2d0324e16','true','userinfo.token.claim'),
('eda98229-8346-4600-b35d-d8e27ad74791','true','access.token.claim'),
('eda98229-8346-4600-b35d-d8e27ad74791','realm_access.roles','claim.name'),
('eda98229-8346-4600-b35d-d8e27ad74791','String','jsonType.label'),
('eda98229-8346-4600-b35d-d8e27ad74791','true','multivalued'),
('eda98229-8346-4600-b35d-d8e27ad74791','foo','user.attribute'),
('f33a34c0-649c-4075-b0db-eede962f703d','true','access.token.claim'),
('f33a34c0-649c-4075-b0db-eede962f703d','resource_access.${client_id}.roles','claim.name'),
('f33a34c0-649c-4075-b0db-eede962f703d','String','jsonType.label'),
('f33a34c0-649c-4075-b0db-eede962f703d','true','multivalued'),
('f33a34c0-649c-4075-b0db-eede962f703d','foo','user.attribute'),
('f622a80b-049f-45a4-a72f-f2a4c65f4bf3','true','access.token.claim'),
('f622a80b-049f-45a4-a72f-f2a4c65f4bf3','groups','claim.name'),
('f622a80b-049f-45a4-a72f-f2a4c65f4bf3','true','id.token.claim'),
('f622a80b-049f-45a4-a72f-f2a4c65f4bf3','String','jsonType.label'),
('f622a80b-049f-45a4-a72f-f2a4c65f4bf3','true','multivalued'),
('f622a80b-049f-45a4-a72f-f2a4c65f4bf3','foo','user.attribute'),
('f8dec398-ccb8-440c-aeb8-33799b64aa88','true','access.token.claim'),
('f8dec398-ccb8-440c-aeb8-33799b64aa88','family_name','claim.name'),
('f8dec398-ccb8-440c-aeb8-33799b64aa88','true','id.token.claim'),
('f8dec398-ccb8-440c-aeb8-33799b64aa88','String','jsonType.label'),
('f8dec398-ccb8-440c-aeb8-33799b64aa88','lastName','user.attribute'),
('f8dec398-ccb8-440c-aeb8-33799b64aa88','true','userinfo.token.claim');
/*!40000 ALTER TABLE `PROTOCOL_MAPPER_CONFIG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REALM`
--

DROP TABLE IF EXISTS `REALM`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `REALM` (
  `ID` varchar(36) NOT NULL,
  `ACCESS_CODE_LIFESPAN` int(11) DEFAULT NULL,
  `USER_ACTION_LIFESPAN` int(11) DEFAULT NULL,
  `ACCESS_TOKEN_LIFESPAN` int(11) DEFAULT NULL,
  `ACCOUNT_THEME` varchar(255) DEFAULT NULL,
  `ADMIN_THEME` varchar(255) DEFAULT NULL,
  `EMAIL_THEME` varchar(255) DEFAULT NULL,
  `ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `EVENTS_ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `EVENTS_EXPIRATION` bigint(20) DEFAULT NULL,
  `LOGIN_THEME` varchar(255) DEFAULT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  `NOT_BEFORE` int(11) DEFAULT NULL,
  `PASSWORD_POLICY` text DEFAULT NULL,
  `REGISTRATION_ALLOWED` bit(1) NOT NULL DEFAULT b'0',
  `REMEMBER_ME` bit(1) NOT NULL DEFAULT b'0',
  `RESET_PASSWORD_ALLOWED` bit(1) NOT NULL DEFAULT b'0',
  `SOCIAL` bit(1) NOT NULL DEFAULT b'0',
  `SSL_REQUIRED` varchar(255) DEFAULT NULL,
  `SSO_IDLE_TIMEOUT` int(11) DEFAULT NULL,
  `SSO_MAX_LIFESPAN` int(11) DEFAULT NULL,
  `UPDATE_PROFILE_ON_SOC_LOGIN` bit(1) NOT NULL DEFAULT b'0',
  `VERIFY_EMAIL` bit(1) NOT NULL DEFAULT b'0',
  `MASTER_ADMIN_CLIENT` varchar(36) DEFAULT NULL,
  `LOGIN_LIFESPAN` int(11) DEFAULT NULL,
  `INTERNATIONALIZATION_ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `DEFAULT_LOCALE` varchar(255) DEFAULT NULL,
  `REG_EMAIL_AS_USERNAME` bit(1) NOT NULL DEFAULT b'0',
  `ADMIN_EVENTS_ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `ADMIN_EVENTS_DETAILS_ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `EDIT_USERNAME_ALLOWED` bit(1) NOT NULL DEFAULT b'0',
  `OTP_POLICY_COUNTER` int(11) DEFAULT 0,
  `OTP_POLICY_WINDOW` int(11) DEFAULT 1,
  `OTP_POLICY_PERIOD` int(11) DEFAULT 30,
  `OTP_POLICY_DIGITS` int(11) DEFAULT 6,
  `OTP_POLICY_ALG` varchar(36) DEFAULT 'HmacSHA1',
  `OTP_POLICY_TYPE` varchar(36) DEFAULT 'totp',
  `BROWSER_FLOW` varchar(36) DEFAULT NULL,
  `REGISTRATION_FLOW` varchar(36) DEFAULT NULL,
  `DIRECT_GRANT_FLOW` varchar(36) DEFAULT NULL,
  `RESET_CREDENTIALS_FLOW` varchar(36) DEFAULT NULL,
  `CLIENT_AUTH_FLOW` varchar(36) DEFAULT NULL,
  `OFFLINE_SESSION_IDLE_TIMEOUT` int(11) DEFAULT 0,
  `REVOKE_REFRESH_TOKEN` bit(1) NOT NULL DEFAULT b'0',
  `ACCESS_TOKEN_LIFE_IMPLICIT` int(11) DEFAULT 0,
  `LOGIN_WITH_EMAIL_ALLOWED` bit(1) NOT NULL DEFAULT b'1',
  `DUPLICATE_EMAILS_ALLOWED` bit(1) NOT NULL DEFAULT b'0',
  `DOCKER_AUTH_FLOW` varchar(36) DEFAULT NULL,
  `REFRESH_TOKEN_MAX_REUSE` int(11) DEFAULT 0,
  `ALLOW_USER_MANAGED_ACCESS` bit(1) NOT NULL DEFAULT b'0',
  `SSO_MAX_LIFESPAN_REMEMBER_ME` int(11) NOT NULL,
  `SSO_IDLE_TIMEOUT_REMEMBER_ME` int(11) NOT NULL,
  `DEFAULT_ROLE` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_ORVSDMLA56612EAEFIQ6WL5OI` (`NAME`),
  KEY `IDX_REALM_MASTER_ADM_CLI` (`MASTER_ADMIN_CLIENT`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REALM`
--

LOCK TABLES `REALM` WRITE;
/*!40000 ALTER TABLE `REALM` DISABLE KEYS */;
INSERT INTO `REALM` VALUES
('9edf1ebb-174b-478f-8959-7f2aa7617d22',60,300,60,NULL,NULL,NULL,'','\0',0,NULL,'master',0,NULL,'\0','\0','\0','\0','EXTERNAL',1800,36000,'\0','\0','9d42395c-eb37-4b6d-b23d-778fdb4b677a',1800,'\0',NULL,'\0','\0','\0','\0',0,1,30,6,'HmacSHA1','totp','92f4fe57-533f-43ea-83ab-43ff7333efde','0d853956-8e83-4f01-98cb-9322a009cae6','822275b4-c9c0-4f8b-ab45-a6d3f7a849bc','8aba1b94-1d4a-4923-8cf5-86f70366191a','4fabce82-5555-4a30-a750-51820e8948fb',2592000,'\0',900,'','\0','a569482f-8f20-4a23-baa5-df0fcf648db7',0,'\0',0,0,'a924937c-0f91-4518-b45c-934f47074999');
/*!40000 ALTER TABLE `REALM` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REALM_ATTRIBUTE`
--

DROP TABLE IF EXISTS `REALM_ATTRIBUTE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `REALM_ATTRIBUTE` (
  `NAME` varchar(255) NOT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  `VALUE` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  PRIMARY KEY (`NAME`,`REALM_ID`),
  KEY `IDX_REALM_ATTR_REALM` (`REALM_ID`),
  CONSTRAINT `FK_8SHXD6L3E9ATQUKACXGPFFPTW` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REALM_ATTRIBUTE`
--

LOCK TABLES `REALM_ATTRIBUTE` WRITE;
/*!40000 ALTER TABLE `REALM_ATTRIBUTE` DISABLE KEYS */;
INSERT INTO `REALM_ATTRIBUTE` VALUES
('_browser_header.contentSecurityPolicy','9edf1ebb-174b-478f-8959-7f2aa7617d22','frame-src \'self\'; frame-ancestors \'self\'; object-src \'none\';'),
('_browser_header.contentSecurityPolicyReportOnly','9edf1ebb-174b-478f-8959-7f2aa7617d22',''),
('_browser_header.strictTransportSecurity','9edf1ebb-174b-478f-8959-7f2aa7617d22','max-age=31536000; includeSubDomains'),
('_browser_header.xContentTypeOptions','9edf1ebb-174b-478f-8959-7f2aa7617d22','nosniff'),
('_browser_header.xFrameOptions','9edf1ebb-174b-478f-8959-7f2aa7617d22','SAMEORIGIN'),
('_browser_header.xRobotsTag','9edf1ebb-174b-478f-8959-7f2aa7617d22','none'),
('_browser_header.xXSSProtection','9edf1ebb-174b-478f-8959-7f2aa7617d22','1; mode=block'),
('bruteForceProtected','9edf1ebb-174b-478f-8959-7f2aa7617d22','false'),
('defaultSignatureAlgorithm','9edf1ebb-174b-478f-8959-7f2aa7617d22','RS256'),
('displayName','9edf1ebb-174b-478f-8959-7f2aa7617d22','Keycloak'),
('displayNameHtml','9edf1ebb-174b-478f-8959-7f2aa7617d22','<div class=\"kc-logo-text\"><span>Keycloak</span></div>'),
('failureFactor','9edf1ebb-174b-478f-8959-7f2aa7617d22','30'),
('maxDeltaTimeSeconds','9edf1ebb-174b-478f-8959-7f2aa7617d22','43200'),
('maxFailureWaitSeconds','9edf1ebb-174b-478f-8959-7f2aa7617d22','900'),
('minimumQuickLoginWaitSeconds','9edf1ebb-174b-478f-8959-7f2aa7617d22','60'),
('offlineSessionMaxLifespan','9edf1ebb-174b-478f-8959-7f2aa7617d22','5184000'),
('offlineSessionMaxLifespanEnabled','9edf1ebb-174b-478f-8959-7f2aa7617d22','false'),
('permanentLockout','9edf1ebb-174b-478f-8959-7f2aa7617d22','false'),
('quickLoginCheckMilliSeconds','9edf1ebb-174b-478f-8959-7f2aa7617d22','1000'),
('realmReusableOtpCode','9edf1ebb-174b-478f-8959-7f2aa7617d22','false'),
('waitIncrementSeconds','9edf1ebb-174b-478f-8959-7f2aa7617d22','60');
/*!40000 ALTER TABLE `REALM_ATTRIBUTE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REALM_DEFAULT_GROUPS`
--

DROP TABLE IF EXISTS `REALM_DEFAULT_GROUPS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `REALM_DEFAULT_GROUPS` (
  `REALM_ID` varchar(36) NOT NULL,
  `GROUP_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`REALM_ID`,`GROUP_ID`),
  UNIQUE KEY `CON_GROUP_ID_DEF_GROUPS` (`GROUP_ID`),
  KEY `IDX_REALM_DEF_GRP_REALM` (`REALM_ID`),
  CONSTRAINT `FK_DEF_GROUPS_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REALM_DEFAULT_GROUPS`
--

LOCK TABLES `REALM_DEFAULT_GROUPS` WRITE;
/*!40000 ALTER TABLE `REALM_DEFAULT_GROUPS` DISABLE KEYS */;
/*!40000 ALTER TABLE `REALM_DEFAULT_GROUPS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REALM_ENABLED_EVENT_TYPES`
--

DROP TABLE IF EXISTS `REALM_ENABLED_EVENT_TYPES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `REALM_ENABLED_EVENT_TYPES` (
  `REALM_ID` varchar(36) NOT NULL,
  `VALUE` varchar(255) NOT NULL,
  PRIMARY KEY (`REALM_ID`,`VALUE`),
  KEY `IDX_REALM_EVT_TYPES_REALM` (`REALM_ID`),
  CONSTRAINT `FK_H846O4H0W8EPX5NWEDRF5Y69J` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REALM_ENABLED_EVENT_TYPES`
--

LOCK TABLES `REALM_ENABLED_EVENT_TYPES` WRITE;
/*!40000 ALTER TABLE `REALM_ENABLED_EVENT_TYPES` DISABLE KEYS */;
/*!40000 ALTER TABLE `REALM_ENABLED_EVENT_TYPES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REALM_EVENTS_LISTENERS`
--

DROP TABLE IF EXISTS `REALM_EVENTS_LISTENERS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `REALM_EVENTS_LISTENERS` (
  `REALM_ID` varchar(36) NOT NULL,
  `VALUE` varchar(255) NOT NULL,
  PRIMARY KEY (`REALM_ID`,`VALUE`),
  KEY `IDX_REALM_EVT_LIST_REALM` (`REALM_ID`),
  CONSTRAINT `FK_H846O4H0W8EPX5NXEV9F5Y69J` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REALM_EVENTS_LISTENERS`
--

LOCK TABLES `REALM_EVENTS_LISTENERS` WRITE;
/*!40000 ALTER TABLE `REALM_EVENTS_LISTENERS` DISABLE KEYS */;
INSERT INTO `REALM_EVENTS_LISTENERS` VALUES
('9edf1ebb-174b-478f-8959-7f2aa7617d22','jboss-logging');
/*!40000 ALTER TABLE `REALM_EVENTS_LISTENERS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REALM_LOCALIZATIONS`
--

DROP TABLE IF EXISTS `REALM_LOCALIZATIONS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `REALM_LOCALIZATIONS` (
  `REALM_ID` varchar(255) NOT NULL,
  `LOCALE` varchar(255) NOT NULL,
  `TEXTS` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  PRIMARY KEY (`REALM_ID`,`LOCALE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REALM_LOCALIZATIONS`
--

LOCK TABLES `REALM_LOCALIZATIONS` WRITE;
/*!40000 ALTER TABLE `REALM_LOCALIZATIONS` DISABLE KEYS */;
/*!40000 ALTER TABLE `REALM_LOCALIZATIONS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REALM_REQUIRED_CREDENTIAL`
--

DROP TABLE IF EXISTS `REALM_REQUIRED_CREDENTIAL`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `REALM_REQUIRED_CREDENTIAL` (
  `TYPE` varchar(255) NOT NULL,
  `FORM_LABEL` varchar(255) DEFAULT NULL,
  `INPUT` bit(1) NOT NULL DEFAULT b'0',
  `SECRET` bit(1) NOT NULL DEFAULT b'0',
  `REALM_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`REALM_ID`,`TYPE`),
  CONSTRAINT `FK_5HG65LYBEVAVKQFKI3KPONH9V` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REALM_REQUIRED_CREDENTIAL`
--

LOCK TABLES `REALM_REQUIRED_CREDENTIAL` WRITE;
/*!40000 ALTER TABLE `REALM_REQUIRED_CREDENTIAL` DISABLE KEYS */;
INSERT INTO `REALM_REQUIRED_CREDENTIAL` VALUES
('password','password','','','9edf1ebb-174b-478f-8959-7f2aa7617d22');
/*!40000 ALTER TABLE `REALM_REQUIRED_CREDENTIAL` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REALM_SMTP_CONFIG`
--

DROP TABLE IF EXISTS `REALM_SMTP_CONFIG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `REALM_SMTP_CONFIG` (
  `REALM_ID` varchar(36) NOT NULL,
  `VALUE` varchar(255) DEFAULT NULL,
  `NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`REALM_ID`,`NAME`),
  CONSTRAINT `FK_70EJ8XDXGXD0B9HH6180IRR0O` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REALM_SMTP_CONFIG`
--

LOCK TABLES `REALM_SMTP_CONFIG` WRITE;
/*!40000 ALTER TABLE `REALM_SMTP_CONFIG` DISABLE KEYS */;
/*!40000 ALTER TABLE `REALM_SMTP_CONFIG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REALM_SUPPORTED_LOCALES`
--

DROP TABLE IF EXISTS `REALM_SUPPORTED_LOCALES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `REALM_SUPPORTED_LOCALES` (
  `REALM_ID` varchar(36) NOT NULL,
  `VALUE` varchar(255) NOT NULL,
  PRIMARY KEY (`REALM_ID`,`VALUE`),
  KEY `IDX_REALM_SUPP_LOCAL_REALM` (`REALM_ID`),
  CONSTRAINT `FK_SUPPORTED_LOCALES_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REALM_SUPPORTED_LOCALES`
--

LOCK TABLES `REALM_SUPPORTED_LOCALES` WRITE;
/*!40000 ALTER TABLE `REALM_SUPPORTED_LOCALES` DISABLE KEYS */;
/*!40000 ALTER TABLE `REALM_SUPPORTED_LOCALES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REDIRECT_URIS`
--

DROP TABLE IF EXISTS `REDIRECT_URIS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `REDIRECT_URIS` (
  `CLIENT_ID` varchar(36) NOT NULL,
  `VALUE` varchar(255) NOT NULL,
  PRIMARY KEY (`CLIENT_ID`,`VALUE`),
  KEY `IDX_REDIR_URI_CLIENT` (`CLIENT_ID`),
  CONSTRAINT `FK_1BURS8PB4OUJ97H5WUPPAHV9F` FOREIGN KEY (`CLIENT_ID`) REFERENCES `CLIENT` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REDIRECT_URIS`
--

LOCK TABLES `REDIRECT_URIS` WRITE;
/*!40000 ALTER TABLE `REDIRECT_URIS` DISABLE KEYS */;
INSERT INTO `REDIRECT_URIS` VALUES
('2fb6af61-2126-4686-9889-0239e66147cd','/realms/master/account/*'),
('8044d631-ffff-4219-b45d-596e49e64ce1','https://192.168.2.150/auth/callback'),
('b1965a6e-95cb-4113-a3c1-68aab6e81d49','/admin/master/console/*'),
('fc44ee4f-6340-4d79-be98-2c78118d59e7','/realms/master/account/*');
/*!40000 ALTER TABLE `REDIRECT_URIS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REQUIRED_ACTION_CONFIG`
--

DROP TABLE IF EXISTS `REQUIRED_ACTION_CONFIG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `REQUIRED_ACTION_CONFIG` (
  `REQUIRED_ACTION_ID` varchar(36) NOT NULL,
  `VALUE` longtext DEFAULT NULL,
  `NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`REQUIRED_ACTION_ID`,`NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REQUIRED_ACTION_CONFIG`
--

LOCK TABLES `REQUIRED_ACTION_CONFIG` WRITE;
/*!40000 ALTER TABLE `REQUIRED_ACTION_CONFIG` DISABLE KEYS */;
/*!40000 ALTER TABLE `REQUIRED_ACTION_CONFIG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REQUIRED_ACTION_PROVIDER`
--

DROP TABLE IF EXISTS `REQUIRED_ACTION_PROVIDER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `REQUIRED_ACTION_PROVIDER` (
  `ID` varchar(36) NOT NULL,
  `ALIAS` varchar(255) DEFAULT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  `REALM_ID` varchar(36) DEFAULT NULL,
  `ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `DEFAULT_ACTION` bit(1) NOT NULL DEFAULT b'0',
  `PROVIDER_ID` varchar(255) DEFAULT NULL,
  `PRIORITY` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_REQ_ACT_PROV_REALM` (`REALM_ID`),
  CONSTRAINT `FK_REQ_ACT_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REQUIRED_ACTION_PROVIDER`
--

LOCK TABLES `REQUIRED_ACTION_PROVIDER` WRITE;
/*!40000 ALTER TABLE `REQUIRED_ACTION_PROVIDER` DISABLE KEYS */;
INSERT INTO `REQUIRED_ACTION_PROVIDER` VALUES
('3b019122-b8b9-4aef-b53f-8d5a680fff95','delete_account','Delete Account','9edf1ebb-174b-478f-8959-7f2aa7617d22','\0','\0','delete_account',60),
('3c4dd188-3818-46e8-9ddd-ec09ce92d293','webauthn-register','Webauthn Register','9edf1ebb-174b-478f-8959-7f2aa7617d22','','\0','webauthn-register',70),
('4b8c3d9a-2d25-4c8a-b025-0ffe44d632b2','CONFIGURE_TOTP','Configure OTP','9edf1ebb-174b-478f-8959-7f2aa7617d22','','\0','CONFIGURE_TOTP',10),
('808ac88d-1478-4c99-820d-29a5b3982277','VERIFY_EMAIL','Verify Email','9edf1ebb-174b-478f-8959-7f2aa7617d22','','\0','VERIFY_EMAIL',50),
('8d379cdf-f85c-49d2-826c-0dc819e98c45','TERMS_AND_CONDITIONS','Terms and Conditions','9edf1ebb-174b-478f-8959-7f2aa7617d22','\0','\0','TERMS_AND_CONDITIONS',20),
('aeb67581-e69c-4231-a86c-1b1b74dd6c5b','webauthn-register-passwordless','Webauthn Register Passwordless','9edf1ebb-174b-478f-8959-7f2aa7617d22','','\0','webauthn-register-passwordless',80),
('cf51ab41-2a8f-4bb7-a60d-5e2816c7f6bf','update_user_locale','Update User Locale','9edf1ebb-174b-478f-8959-7f2aa7617d22','','\0','update_user_locale',1000),
('fb95209f-8cbe-4547-9819-aeb4b35385a3','UPDATE_PASSWORD','Update Password','9edf1ebb-174b-478f-8959-7f2aa7617d22','','\0','UPDATE_PASSWORD',30),
('fe91f980-c3d9-407c-beab-a0c1c995f187','UPDATE_PROFILE','Update Profile','9edf1ebb-174b-478f-8959-7f2aa7617d22','','\0','UPDATE_PROFILE',40);
/*!40000 ALTER TABLE `REQUIRED_ACTION_PROVIDER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RESOURCE_ATTRIBUTE`
--

DROP TABLE IF EXISTS `RESOURCE_ATTRIBUTE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `RESOURCE_ATTRIBUTE` (
  `ID` varchar(36) NOT NULL DEFAULT 'sybase-needs-something-here',
  `NAME` varchar(255) NOT NULL,
  `VALUE` varchar(255) DEFAULT NULL,
  `RESOURCE_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_5HRM2VLF9QL5FU022KQEPOVBR` (`RESOURCE_ID`),
  CONSTRAINT `FK_5HRM2VLF9QL5FU022KQEPOVBR` FOREIGN KEY (`RESOURCE_ID`) REFERENCES `RESOURCE_SERVER_RESOURCE` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RESOURCE_ATTRIBUTE`
--

LOCK TABLES `RESOURCE_ATTRIBUTE` WRITE;
/*!40000 ALTER TABLE `RESOURCE_ATTRIBUTE` DISABLE KEYS */;
/*!40000 ALTER TABLE `RESOURCE_ATTRIBUTE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RESOURCE_POLICY`
--

DROP TABLE IF EXISTS `RESOURCE_POLICY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `RESOURCE_POLICY` (
  `RESOURCE_ID` varchar(36) NOT NULL,
  `POLICY_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`RESOURCE_ID`,`POLICY_ID`),
  KEY `IDX_RES_POLICY_POLICY` (`POLICY_ID`),
  CONSTRAINT `FK_FRSRPOS53XCX4WNKOG82SSRFY` FOREIGN KEY (`RESOURCE_ID`) REFERENCES `RESOURCE_SERVER_RESOURCE` (`ID`),
  CONSTRAINT `FK_FRSRPP213XCX4WNKOG82SSRFY` FOREIGN KEY (`POLICY_ID`) REFERENCES `RESOURCE_SERVER_POLICY` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RESOURCE_POLICY`
--

LOCK TABLES `RESOURCE_POLICY` WRITE;
/*!40000 ALTER TABLE `RESOURCE_POLICY` DISABLE KEYS */;
/*!40000 ALTER TABLE `RESOURCE_POLICY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RESOURCE_SCOPE`
--

DROP TABLE IF EXISTS `RESOURCE_SCOPE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `RESOURCE_SCOPE` (
  `RESOURCE_ID` varchar(36) NOT NULL,
  `SCOPE_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`RESOURCE_ID`,`SCOPE_ID`),
  KEY `IDX_RES_SCOPE_SCOPE` (`SCOPE_ID`),
  CONSTRAINT `FK_FRSRPOS13XCX4WNKOG82SSRFY` FOREIGN KEY (`RESOURCE_ID`) REFERENCES `RESOURCE_SERVER_RESOURCE` (`ID`),
  CONSTRAINT `FK_FRSRPS213XCX4WNKOG82SSRFY` FOREIGN KEY (`SCOPE_ID`) REFERENCES `RESOURCE_SERVER_SCOPE` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RESOURCE_SCOPE`
--

LOCK TABLES `RESOURCE_SCOPE` WRITE;
/*!40000 ALTER TABLE `RESOURCE_SCOPE` DISABLE KEYS */;
/*!40000 ALTER TABLE `RESOURCE_SCOPE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RESOURCE_SERVER`
--

DROP TABLE IF EXISTS `RESOURCE_SERVER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `RESOURCE_SERVER` (
  `ID` varchar(36) NOT NULL,
  `ALLOW_RS_REMOTE_MGMT` bit(1) NOT NULL DEFAULT b'0',
  `POLICY_ENFORCE_MODE` varchar(15) NOT NULL,
  `DECISION_STRATEGY` tinyint(4) NOT NULL DEFAULT 1,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RESOURCE_SERVER`
--

LOCK TABLES `RESOURCE_SERVER` WRITE;
/*!40000 ALTER TABLE `RESOURCE_SERVER` DISABLE KEYS */;
/*!40000 ALTER TABLE `RESOURCE_SERVER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RESOURCE_SERVER_PERM_TICKET`
--

DROP TABLE IF EXISTS `RESOURCE_SERVER_PERM_TICKET`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `RESOURCE_SERVER_PERM_TICKET` (
  `ID` varchar(36) NOT NULL,
  `OWNER` varchar(255) DEFAULT NULL,
  `REQUESTER` varchar(255) DEFAULT NULL,
  `CREATED_TIMESTAMP` bigint(20) NOT NULL,
  `GRANTED_TIMESTAMP` bigint(20) DEFAULT NULL,
  `RESOURCE_ID` varchar(36) NOT NULL,
  `SCOPE_ID` varchar(36) DEFAULT NULL,
  `RESOURCE_SERVER_ID` varchar(36) NOT NULL,
  `POLICY_ID` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_FRSR6T700S9V50BU18WS5PMT` (`OWNER`,`REQUESTER`,`RESOURCE_SERVER_ID`,`RESOURCE_ID`,`SCOPE_ID`),
  KEY `FK_FRSRHO213XCX4WNKOG82SSPMT` (`RESOURCE_SERVER_ID`),
  KEY `FK_FRSRHO213XCX4WNKOG83SSPMT` (`RESOURCE_ID`),
  KEY `FK_FRSRHO213XCX4WNKOG84SSPMT` (`SCOPE_ID`),
  KEY `FK_FRSRPO2128CX4WNKOG82SSRFY` (`POLICY_ID`),
  CONSTRAINT `FK_FRSRHO213XCX4WNKOG82SSPMT` FOREIGN KEY (`RESOURCE_SERVER_ID`) REFERENCES `RESOURCE_SERVER` (`ID`),
  CONSTRAINT `FK_FRSRHO213XCX4WNKOG83SSPMT` FOREIGN KEY (`RESOURCE_ID`) REFERENCES `RESOURCE_SERVER_RESOURCE` (`ID`),
  CONSTRAINT `FK_FRSRHO213XCX4WNKOG84SSPMT` FOREIGN KEY (`SCOPE_ID`) REFERENCES `RESOURCE_SERVER_SCOPE` (`ID`),
  CONSTRAINT `FK_FRSRPO2128CX4WNKOG82SSRFY` FOREIGN KEY (`POLICY_ID`) REFERENCES `RESOURCE_SERVER_POLICY` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RESOURCE_SERVER_PERM_TICKET`
--

LOCK TABLES `RESOURCE_SERVER_PERM_TICKET` WRITE;
/*!40000 ALTER TABLE `RESOURCE_SERVER_PERM_TICKET` DISABLE KEYS */;
/*!40000 ALTER TABLE `RESOURCE_SERVER_PERM_TICKET` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RESOURCE_SERVER_POLICY`
--

DROP TABLE IF EXISTS `RESOURCE_SERVER_POLICY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `RESOURCE_SERVER_POLICY` (
  `ID` varchar(36) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `DESCRIPTION` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `TYPE` varchar(255) NOT NULL,
  `DECISION_STRATEGY` varchar(20) DEFAULT NULL,
  `LOGIC` varchar(20) DEFAULT NULL,
  `RESOURCE_SERVER_ID` varchar(36) DEFAULT NULL,
  `OWNER` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_FRSRPT700S9V50BU18WS5HA6` (`NAME`,`RESOURCE_SERVER_ID`),
  KEY `IDX_RES_SERV_POL_RES_SERV` (`RESOURCE_SERVER_ID`),
  CONSTRAINT `FK_FRSRPO213XCX4WNKOG82SSRFY` FOREIGN KEY (`RESOURCE_SERVER_ID`) REFERENCES `RESOURCE_SERVER` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RESOURCE_SERVER_POLICY`
--

LOCK TABLES `RESOURCE_SERVER_POLICY` WRITE;
/*!40000 ALTER TABLE `RESOURCE_SERVER_POLICY` DISABLE KEYS */;
/*!40000 ALTER TABLE `RESOURCE_SERVER_POLICY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RESOURCE_SERVER_RESOURCE`
--

DROP TABLE IF EXISTS `RESOURCE_SERVER_RESOURCE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `RESOURCE_SERVER_RESOURCE` (
  `ID` varchar(36) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `TYPE` varchar(255) DEFAULT NULL,
  `ICON_URI` varchar(255) DEFAULT NULL,
  `OWNER` varchar(255) DEFAULT NULL,
  `RESOURCE_SERVER_ID` varchar(36) DEFAULT NULL,
  `OWNER_MANAGED_ACCESS` bit(1) NOT NULL DEFAULT b'0',
  `DISPLAY_NAME` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_FRSR6T700S9V50BU18WS5HA6` (`NAME`,`OWNER`,`RESOURCE_SERVER_ID`),
  KEY `IDX_RES_SRV_RES_RES_SRV` (`RESOURCE_SERVER_ID`),
  CONSTRAINT `FK_FRSRHO213XCX4WNKOG82SSRFY` FOREIGN KEY (`RESOURCE_SERVER_ID`) REFERENCES `RESOURCE_SERVER` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RESOURCE_SERVER_RESOURCE`
--

LOCK TABLES `RESOURCE_SERVER_RESOURCE` WRITE;
/*!40000 ALTER TABLE `RESOURCE_SERVER_RESOURCE` DISABLE KEYS */;
/*!40000 ALTER TABLE `RESOURCE_SERVER_RESOURCE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RESOURCE_SERVER_SCOPE`
--

DROP TABLE IF EXISTS `RESOURCE_SERVER_SCOPE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `RESOURCE_SERVER_SCOPE` (
  `ID` varchar(36) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `ICON_URI` varchar(255) DEFAULT NULL,
  `RESOURCE_SERVER_ID` varchar(36) DEFAULT NULL,
  `DISPLAY_NAME` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_FRSRST700S9V50BU18WS5HA6` (`NAME`,`RESOURCE_SERVER_ID`),
  KEY `IDX_RES_SRV_SCOPE_RES_SRV` (`RESOURCE_SERVER_ID`),
  CONSTRAINT `FK_FRSRSO213XCX4WNKOG82SSRFY` FOREIGN KEY (`RESOURCE_SERVER_ID`) REFERENCES `RESOURCE_SERVER` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RESOURCE_SERVER_SCOPE`
--

LOCK TABLES `RESOURCE_SERVER_SCOPE` WRITE;
/*!40000 ALTER TABLE `RESOURCE_SERVER_SCOPE` DISABLE KEYS */;
/*!40000 ALTER TABLE `RESOURCE_SERVER_SCOPE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RESOURCE_URIS`
--

DROP TABLE IF EXISTS `RESOURCE_URIS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `RESOURCE_URIS` (
  `RESOURCE_ID` varchar(36) NOT NULL,
  `VALUE` varchar(255) NOT NULL,
  PRIMARY KEY (`RESOURCE_ID`,`VALUE`),
  CONSTRAINT `FK_RESOURCE_SERVER_URIS` FOREIGN KEY (`RESOURCE_ID`) REFERENCES `RESOURCE_SERVER_RESOURCE` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RESOURCE_URIS`
--

LOCK TABLES `RESOURCE_URIS` WRITE;
/*!40000 ALTER TABLE `RESOURCE_URIS` DISABLE KEYS */;
/*!40000 ALTER TABLE `RESOURCE_URIS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ROLE_ATTRIBUTE`
--

DROP TABLE IF EXISTS `ROLE_ATTRIBUTE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ROLE_ATTRIBUTE` (
  `ID` varchar(36) NOT NULL,
  `ROLE_ID` varchar(36) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `VALUE` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_ROLE_ATTRIBUTE` (`ROLE_ID`),
  CONSTRAINT `FK_ROLE_ATTRIBUTE_ID` FOREIGN KEY (`ROLE_ID`) REFERENCES `KEYCLOAK_ROLE` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ROLE_ATTRIBUTE`
--

LOCK TABLES `ROLE_ATTRIBUTE` WRITE;
/*!40000 ALTER TABLE `ROLE_ATTRIBUTE` DISABLE KEYS */;
/*!40000 ALTER TABLE `ROLE_ATTRIBUTE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SCOPE_MAPPING`
--

DROP TABLE IF EXISTS `SCOPE_MAPPING`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SCOPE_MAPPING` (
  `CLIENT_ID` varchar(36) NOT NULL,
  `ROLE_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`CLIENT_ID`,`ROLE_ID`),
  KEY `IDX_SCOPE_MAPPING_ROLE` (`ROLE_ID`),
  CONSTRAINT `FK_OUSE064PLMLR732LXJCN1Q5F1` FOREIGN KEY (`CLIENT_ID`) REFERENCES `CLIENT` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SCOPE_MAPPING`
--

LOCK TABLES `SCOPE_MAPPING` WRITE;
/*!40000 ALTER TABLE `SCOPE_MAPPING` DISABLE KEYS */;
INSERT INTO `SCOPE_MAPPING` VALUES
('fc44ee4f-6340-4d79-be98-2c78118d59e7','395f4d73-14cb-40e5-8854-dc16a72be6aa'),
('fc44ee4f-6340-4d79-be98-2c78118d59e7','40e15634-ff33-441e-91fb-0d85dd05f7a7');
/*!40000 ALTER TABLE `SCOPE_MAPPING` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SCOPE_POLICY`
--

DROP TABLE IF EXISTS `SCOPE_POLICY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SCOPE_POLICY` (
  `SCOPE_ID` varchar(36) NOT NULL,
  `POLICY_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`SCOPE_ID`,`POLICY_ID`),
  KEY `IDX_SCOPE_POLICY_POLICY` (`POLICY_ID`),
  CONSTRAINT `FK_FRSRASP13XCX4WNKOG82SSRFY` FOREIGN KEY (`POLICY_ID`) REFERENCES `RESOURCE_SERVER_POLICY` (`ID`),
  CONSTRAINT `FK_FRSRPASS3XCX4WNKOG82SSRFY` FOREIGN KEY (`SCOPE_ID`) REFERENCES `RESOURCE_SERVER_SCOPE` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SCOPE_POLICY`
--

LOCK TABLES `SCOPE_POLICY` WRITE;
/*!40000 ALTER TABLE `SCOPE_POLICY` DISABLE KEYS */;
/*!40000 ALTER TABLE `SCOPE_POLICY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USERNAME_LOGIN_FAILURE`
--

DROP TABLE IF EXISTS `USERNAME_LOGIN_FAILURE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `USERNAME_LOGIN_FAILURE` (
  `REALM_ID` varchar(36) NOT NULL,
  `USERNAME` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `FAILED_LOGIN_NOT_BEFORE` int(11) DEFAULT NULL,
  `LAST_FAILURE` bigint(20) DEFAULT NULL,
  `LAST_IP_FAILURE` varchar(255) DEFAULT NULL,
  `NUM_FAILURES` int(11) DEFAULT NULL,
  PRIMARY KEY (`REALM_ID`,`USERNAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USERNAME_LOGIN_FAILURE`
--

LOCK TABLES `USERNAME_LOGIN_FAILURE` WRITE;
/*!40000 ALTER TABLE `USERNAME_LOGIN_FAILURE` DISABLE KEYS */;
/*!40000 ALTER TABLE `USERNAME_LOGIN_FAILURE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_ATTRIBUTE`
--

DROP TABLE IF EXISTS `USER_ATTRIBUTE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `USER_ATTRIBUTE` (
  `NAME` varchar(255) NOT NULL,
  `VALUE` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `USER_ID` varchar(36) NOT NULL,
  `ID` varchar(36) NOT NULL DEFAULT 'sybase-needs-something-here',
  PRIMARY KEY (`ID`),
  KEY `IDX_USER_ATTRIBUTE` (`USER_ID`),
  KEY `IDX_USER_ATTRIBUTE_NAME` (`NAME`,`VALUE`),
  CONSTRAINT `FK_5HRM2VLF9QL5FU043KQEPOVBR` FOREIGN KEY (`USER_ID`) REFERENCES `USER_ENTITY` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_ATTRIBUTE`
--

LOCK TABLES `USER_ATTRIBUTE` WRITE;
/*!40000 ALTER TABLE `USER_ATTRIBUTE` DISABLE KEYS */;
INSERT INTO `USER_ATTRIBUTE` VALUES
('LDAP_ENTRY_DN','cn=Chris Grant,ou=users,dc=home,dc=kube','81b596cf-d586-42ab-a790-b64bdf078563','16d820dc-8e5d-4fd5-bc15-253e918749ce'),
('LDAP_ID','1002','81b596cf-d586-42ab-a790-b64bdf078563','3a2505b7-1377-4127-874e-f3ef2490956e'),
('createTimestamp','20230315120547Z','81b596cf-d586-42ab-a790-b64bdf078563','c1c10b9c-5a63-43a7-98db-3edc5f7246c2'),
('modifyTimestamp','20230316115518Z','81b596cf-d586-42ab-a790-b64bdf078563','eca498b9-40e9-4880-b389-b0aef14c4220');
/*!40000 ALTER TABLE `USER_ATTRIBUTE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_CONSENT`
--

DROP TABLE IF EXISTS `USER_CONSENT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `USER_CONSENT` (
  `ID` varchar(36) NOT NULL,
  `CLIENT_ID` varchar(255) DEFAULT NULL,
  `USER_ID` varchar(36) NOT NULL,
  `CREATED_DATE` bigint(20) DEFAULT NULL,
  `LAST_UPDATED_DATE` bigint(20) DEFAULT NULL,
  `CLIENT_STORAGE_PROVIDER` varchar(36) DEFAULT NULL,
  `EXTERNAL_CLIENT_ID` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_JKUWUVD56ONTGSUHOGM8UEWRT` (`CLIENT_ID`,`CLIENT_STORAGE_PROVIDER`,`EXTERNAL_CLIENT_ID`,`USER_ID`),
  KEY `IDX_USER_CONSENT` (`USER_ID`),
  CONSTRAINT `FK_GRNTCSNT_USER` FOREIGN KEY (`USER_ID`) REFERENCES `USER_ENTITY` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_CONSENT`
--

LOCK TABLES `USER_CONSENT` WRITE;
/*!40000 ALTER TABLE `USER_CONSENT` DISABLE KEYS */;
/*!40000 ALTER TABLE `USER_CONSENT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_CONSENT_CLIENT_SCOPE`
--

DROP TABLE IF EXISTS `USER_CONSENT_CLIENT_SCOPE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `USER_CONSENT_CLIENT_SCOPE` (
  `USER_CONSENT_ID` varchar(36) NOT NULL,
  `SCOPE_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`USER_CONSENT_ID`,`SCOPE_ID`),
  KEY `IDX_USCONSENT_CLSCOPE` (`USER_CONSENT_ID`),
  CONSTRAINT `FK_GRNTCSNT_CLSC_USC` FOREIGN KEY (`USER_CONSENT_ID`) REFERENCES `USER_CONSENT` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_CONSENT_CLIENT_SCOPE`
--

LOCK TABLES `USER_CONSENT_CLIENT_SCOPE` WRITE;
/*!40000 ALTER TABLE `USER_CONSENT_CLIENT_SCOPE` DISABLE KEYS */;
/*!40000 ALTER TABLE `USER_CONSENT_CLIENT_SCOPE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_ENTITY`
--

DROP TABLE IF EXISTS `USER_ENTITY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `USER_ENTITY` (
  `ID` varchar(36) NOT NULL,
  `EMAIL` varchar(255) DEFAULT NULL,
  `EMAIL_CONSTRAINT` varchar(255) DEFAULT NULL,
  `EMAIL_VERIFIED` bit(1) NOT NULL DEFAULT b'0',
  `ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `FEDERATION_LINK` varchar(255) DEFAULT NULL,
  `FIRST_NAME` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `LAST_NAME` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `REALM_ID` varchar(255) DEFAULT NULL,
  `USERNAME` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `CREATED_TIMESTAMP` bigint(20) DEFAULT NULL,
  `SERVICE_ACCOUNT_CLIENT_LINK` varchar(255) DEFAULT NULL,
  `NOT_BEFORE` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_DYKN684SL8UP1CRFEI6ECKHD7` (`REALM_ID`,`EMAIL_CONSTRAINT`),
  UNIQUE KEY `UK_RU8TT6T700S9V50BU18WS5HA6` (`REALM_ID`,`USERNAME`),
  KEY `IDX_USER_EMAIL` (`EMAIL`),
  KEY `IDX_USER_SERVICE_ACCOUNT` (`REALM_ID`,`SERVICE_ACCOUNT_CLIENT_LINK`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_ENTITY`
--

LOCK TABLES `USER_ENTITY` WRITE;
/*!40000 ALTER TABLE `USER_ENTITY` DISABLE KEYS */;
INSERT INTO `USER_ENTITY` VALUES
('5bf249a2-b2b0-400e-83e8-dca97d132125',NULL,'ffbfdeaa-8d36-490b-ae6e-3342581abfbe','\0','',NULL,NULL,NULL,'9edf1ebb-174b-478f-8959-7f2aa7617d22','admin',1679062834200,NULL,0),
('81b596cf-d586-42ab-a790-b64bdf078563','grantgj@gmail.com','grantgj@gmail.com','','','931754d0-7966-446e-be14-a033fd4c539a','Chris','Grant','9edf1ebb-174b-478f-8959-7f2aa7617d22','chris',1679063364414,NULL,0);
/*!40000 ALTER TABLE `USER_ENTITY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_FEDERATION_CONFIG`
--

DROP TABLE IF EXISTS `USER_FEDERATION_CONFIG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `USER_FEDERATION_CONFIG` (
  `USER_FEDERATION_PROVIDER_ID` varchar(36) NOT NULL,
  `VALUE` varchar(255) DEFAULT NULL,
  `NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`USER_FEDERATION_PROVIDER_ID`,`NAME`),
  CONSTRAINT `FK_T13HPU1J94R2EBPEKR39X5EU5` FOREIGN KEY (`USER_FEDERATION_PROVIDER_ID`) REFERENCES `USER_FEDERATION_PROVIDER` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_FEDERATION_CONFIG`
--

LOCK TABLES `USER_FEDERATION_CONFIG` WRITE;
/*!40000 ALTER TABLE `USER_FEDERATION_CONFIG` DISABLE KEYS */;
/*!40000 ALTER TABLE `USER_FEDERATION_CONFIG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_FEDERATION_MAPPER`
--

DROP TABLE IF EXISTS `USER_FEDERATION_MAPPER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `USER_FEDERATION_MAPPER` (
  `ID` varchar(36) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `FEDERATION_PROVIDER_ID` varchar(36) NOT NULL,
  `FEDERATION_MAPPER_TYPE` varchar(255) NOT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_USR_FED_MAP_FED_PRV` (`FEDERATION_PROVIDER_ID`),
  KEY `IDX_USR_FED_MAP_REALM` (`REALM_ID`),
  CONSTRAINT `FK_FEDMAPPERPM_FEDPRV` FOREIGN KEY (`FEDERATION_PROVIDER_ID`) REFERENCES `USER_FEDERATION_PROVIDER` (`ID`),
  CONSTRAINT `FK_FEDMAPPERPM_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_FEDERATION_MAPPER`
--

LOCK TABLES `USER_FEDERATION_MAPPER` WRITE;
/*!40000 ALTER TABLE `USER_FEDERATION_MAPPER` DISABLE KEYS */;
/*!40000 ALTER TABLE `USER_FEDERATION_MAPPER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_FEDERATION_MAPPER_CONFIG`
--

DROP TABLE IF EXISTS `USER_FEDERATION_MAPPER_CONFIG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `USER_FEDERATION_MAPPER_CONFIG` (
  `USER_FEDERATION_MAPPER_ID` varchar(36) NOT NULL,
  `VALUE` varchar(255) DEFAULT NULL,
  `NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`USER_FEDERATION_MAPPER_ID`,`NAME`),
  CONSTRAINT `FK_FEDMAPPER_CFG` FOREIGN KEY (`USER_FEDERATION_MAPPER_ID`) REFERENCES `USER_FEDERATION_MAPPER` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_FEDERATION_MAPPER_CONFIG`
--

LOCK TABLES `USER_FEDERATION_MAPPER_CONFIG` WRITE;
/*!40000 ALTER TABLE `USER_FEDERATION_MAPPER_CONFIG` DISABLE KEYS */;
/*!40000 ALTER TABLE `USER_FEDERATION_MAPPER_CONFIG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_FEDERATION_PROVIDER`
--

DROP TABLE IF EXISTS `USER_FEDERATION_PROVIDER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `USER_FEDERATION_PROVIDER` (
  `ID` varchar(36) NOT NULL,
  `CHANGED_SYNC_PERIOD` int(11) DEFAULT NULL,
  `DISPLAY_NAME` varchar(255) DEFAULT NULL,
  `FULL_SYNC_PERIOD` int(11) DEFAULT NULL,
  `LAST_SYNC` int(11) DEFAULT NULL,
  `PRIORITY` int(11) DEFAULT NULL,
  `PROVIDER_NAME` varchar(255) DEFAULT NULL,
  `REALM_ID` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_USR_FED_PRV_REALM` (`REALM_ID`),
  CONSTRAINT `FK_1FJ32F6PTOLW2QY60CD8N01E8` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_FEDERATION_PROVIDER`
--

LOCK TABLES `USER_FEDERATION_PROVIDER` WRITE;
/*!40000 ALTER TABLE `USER_FEDERATION_PROVIDER` DISABLE KEYS */;
/*!40000 ALTER TABLE `USER_FEDERATION_PROVIDER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_GROUP_MEMBERSHIP`
--

DROP TABLE IF EXISTS `USER_GROUP_MEMBERSHIP`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `USER_GROUP_MEMBERSHIP` (
  `GROUP_ID` varchar(36) NOT NULL,
  `USER_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`GROUP_ID`,`USER_ID`),
  KEY `IDX_USER_GROUP_MAPPING` (`USER_ID`),
  CONSTRAINT `FK_USER_GROUP_USER` FOREIGN KEY (`USER_ID`) REFERENCES `USER_ENTITY` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_GROUP_MEMBERSHIP`
--

LOCK TABLES `USER_GROUP_MEMBERSHIP` WRITE;
/*!40000 ALTER TABLE `USER_GROUP_MEMBERSHIP` DISABLE KEYS */;
INSERT INTO `USER_GROUP_MEMBERSHIP` VALUES
('adfbe9a5-7813-4522-b10b-15e38e189235','81b596cf-d586-42ab-a790-b64bdf078563');
/*!40000 ALTER TABLE `USER_GROUP_MEMBERSHIP` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_REQUIRED_ACTION`
--

DROP TABLE IF EXISTS `USER_REQUIRED_ACTION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `USER_REQUIRED_ACTION` (
  `USER_ID` varchar(36) NOT NULL,
  `REQUIRED_ACTION` varchar(255) NOT NULL DEFAULT ' ',
  PRIMARY KEY (`REQUIRED_ACTION`,`USER_ID`),
  KEY `IDX_USER_REQACTIONS` (`USER_ID`),
  CONSTRAINT `FK_6QJ3W1JW9CVAFHE19BWSIUVMD` FOREIGN KEY (`USER_ID`) REFERENCES `USER_ENTITY` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_REQUIRED_ACTION`
--

LOCK TABLES `USER_REQUIRED_ACTION` WRITE;
/*!40000 ALTER TABLE `USER_REQUIRED_ACTION` DISABLE KEYS */;
/*!40000 ALTER TABLE `USER_REQUIRED_ACTION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_ROLE_MAPPING`
--

DROP TABLE IF EXISTS `USER_ROLE_MAPPING`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `USER_ROLE_MAPPING` (
  `ROLE_ID` varchar(255) NOT NULL,
  `USER_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`ROLE_ID`,`USER_ID`),
  KEY `IDX_USER_ROLE_MAPPING` (`USER_ID`),
  CONSTRAINT `FK_C4FQV34P1MBYLLOXANG7B1Q3L` FOREIGN KEY (`USER_ID`) REFERENCES `USER_ENTITY` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_ROLE_MAPPING`
--

LOCK TABLES `USER_ROLE_MAPPING` WRITE;
/*!40000 ALTER TABLE `USER_ROLE_MAPPING` DISABLE KEYS */;
INSERT INTO `USER_ROLE_MAPPING` VALUES
('a924937c-0f91-4518-b45c-934f47074999','5bf249a2-b2b0-400e-83e8-dca97d132125'),
('a924937c-0f91-4518-b45c-934f47074999','81b596cf-d586-42ab-a790-b64bdf078563'),
('a9f30435-c860-40d4-931f-8a31e60e8a91','5bf249a2-b2b0-400e-83e8-dca97d132125'),
('a9f30435-c860-40d4-931f-8a31e60e8a91','81b596cf-d586-42ab-a790-b64bdf078563');
/*!40000 ALTER TABLE `USER_ROLE_MAPPING` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_SESSION`
--

DROP TABLE IF EXISTS `USER_SESSION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `USER_SESSION` (
  `ID` varchar(36) NOT NULL,
  `AUTH_METHOD` varchar(255) DEFAULT NULL,
  `IP_ADDRESS` varchar(255) DEFAULT NULL,
  `LAST_SESSION_REFRESH` int(11) DEFAULT NULL,
  `LOGIN_USERNAME` varchar(255) DEFAULT NULL,
  `REALM_ID` varchar(255) DEFAULT NULL,
  `REMEMBER_ME` bit(1) NOT NULL DEFAULT b'0',
  `STARTED` int(11) DEFAULT NULL,
  `USER_ID` varchar(255) DEFAULT NULL,
  `USER_SESSION_STATE` int(11) DEFAULT NULL,
  `BROKER_SESSION_ID` varchar(255) DEFAULT NULL,
  `BROKER_USER_ID` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_SESSION`
--

LOCK TABLES `USER_SESSION` WRITE;
/*!40000 ALTER TABLE `USER_SESSION` DISABLE KEYS */;
/*!40000 ALTER TABLE `USER_SESSION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_SESSION_NOTE`
--

DROP TABLE IF EXISTS `USER_SESSION_NOTE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `USER_SESSION_NOTE` (
  `USER_SESSION` varchar(36) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `VALUE` text DEFAULT NULL,
  PRIMARY KEY (`USER_SESSION`,`NAME`),
  CONSTRAINT `FK5EDFB00FF51D3472` FOREIGN KEY (`USER_SESSION`) REFERENCES `USER_SESSION` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_SESSION_NOTE`
--

LOCK TABLES `USER_SESSION_NOTE` WRITE;
/*!40000 ALTER TABLE `USER_SESSION_NOTE` DISABLE KEYS */;
/*!40000 ALTER TABLE `USER_SESSION_NOTE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `WEB_ORIGINS`
--

DROP TABLE IF EXISTS `WEB_ORIGINS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `WEB_ORIGINS` (
  `CLIENT_ID` varchar(36) NOT NULL,
  `VALUE` varchar(255) NOT NULL,
  PRIMARY KEY (`CLIENT_ID`,`VALUE`),
  KEY `IDX_WEB_ORIG_CLIENT` (`CLIENT_ID`),
  CONSTRAINT `FK_LOJPHO213XCX4WNKOG82SSRFY` FOREIGN KEY (`CLIENT_ID`) REFERENCES `CLIENT` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `WEB_ORIGINS`
--

LOCK TABLES `WEB_ORIGINS` WRITE;
/*!40000 ALTER TABLE `WEB_ORIGINS` DISABLE KEYS */;
INSERT INTO `WEB_ORIGINS` VALUES
('8044d631-ffff-4219-b45d-596e49e64ce1','https://192.168.2.150'),
('b1965a6e-95cb-4113-a3c1-68aab6e81d49','+');
/*!40000 ALTER TABLE `WEB_ORIGINS` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-03-18  7:26:25
