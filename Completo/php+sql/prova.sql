-- phpMyAdmin SQL Dump
-- version 4.1.4
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Mag 13, 2018 alle 19:10
-- Versione del server: 5.6.15-log
-- PHP Version: 5.5.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `prova`
--

-- --------------------------------------------------------

--
-- Struttura della tabella `dati`
--

CREATE TABLE IF NOT EXISTS `dati` (
  `id` int(6) unsigned NOT NULL AUTO_INCREMENT,
  `IP` varchar(20) NOT NULL,
  `MAC` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=35 ;

--
-- Dump dei dati per la tabella `dati`
--

INSERT INTO `dati` (`id`, `IP`, `MAC`) VALUES
(5, '192.168.17.106', '2c:4d:54:35:10:04'),
(3, '192.168.17.106', '2c:4d:54:35:10:04'),
(4, '192.168.17.107', '70:5a:0f:b9:02:04'),
(6, '192.168.17.107', '70:5a:0f:b9:02:04'),
(7, '192.168.17.106', '2c:4d:54:35:10:04'),
(8, '192.168.17.107', '70:5a:0f:b9:02:04'),
(9, '192.168.17.106', '2c:4d:54:35:10:04'),
(10, '192.168.17.107', '70:5a:0f:b9:02:04'),
(11, '192.168.17.106', '2c:4d:54:35:10:04'),
(12, '192.168.17.107', '70:5a:0f:b9:02:04'),
(13, '192.168.17.106', '2c:4d:54:35:10:04'),
(14, '192.168.17.107', '70:5a:0f:b9:02:04'),
(15, '192.168.17.106', '2c:4d:54:35:10:04'),
(16, '192.168.17.107', '70:5a:0f:b9:02:04'),
(17, '192.168.0.102', '48:27:ea:6c:bc:7e'),
(18, '192.168.0.1', 'c4:a8:1d:83:47:3c'),
(19, '192.168.0.104', '20:68:9d:21:28:b9'),
(20, '192.168.0.118', '10:02:b5:e0:c2:3e'),
(21, '192.168.0.102', '48:27:ea:6c:bc:7e'),
(22, '192.168.0.1', 'c4:a8:1d:83:47:3c'),
(23, '192.168.0.104', '20:68:9d:21:28:b9'),
(24, '192.168.0.118', '10:02:b5:e0:c2:3e'),
(25, '192.168.0.1', 'c4:a8:1d:83:47:3c'),
(26, '192.168.0.104', '<incomplete>'),
(27, '192.168.0.118', '10:02:b5:e0:c2:3e'),
(28, '192.168.0.105', 'b8:27:eb:87:a0:f7'),
(29, '192.168.0.102', '<incomplete>'),
(30, '192.168.0.1', 'c4:a8:1d:83:47:3c'),
(31, '192.168.0.104', '<incomplete>'),
(32, '192.168.0.118', '10:02:b5:e0:c2:3e'),
(33, '192.168.0.105', 'b8:27:eb:87:a0:f7'),
(34, '192.168.0.102', '<incomplete>');

-- --------------------------------------------------------

--
-- Struttura della tabella `dati_nmap`
--

CREATE TABLE IF NOT EXISTS `dati_nmap` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ip` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `porta` varchar(10) COLLATE utf8_bin DEFAULT NULL,
  `servizio` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `protocollo` varchar(10) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=52 ;

--
-- Dump dei dati per la tabella `dati_nmap`
--

INSERT INTO `dati_nmap` (`id`, `ip`, `porta`, `servizio`, `protocollo`) VALUES
(1, '192.168.0.1', '53', 'domain', 'tcp'),
(2, '192.168.0.1', '80', 'http', 'tcp'),
(3, '192.168.0.1', '139', 'netbios-ssn', 'tcp'),
(4, '192.168.0.1', '443', 'https', 'tcp'),
(5, '192.168.0.1', '445', 'microsoft-ds', 'tcp'),
(6, '192.168.0.1', '8181', 'intermapper', 'tcp'),
(7, '192.168.0.1', '49152', 'unknown', 'tcp'),
(8, '192.168.0.1', '53', 'domain', 'tcp'),
(9, '192.168.0.1', '80', 'http', 'tcp'),
(10, '192.168.0.1', '139', 'netbios-ssn', 'tcp'),
(11, '192.168.0.1', '443', 'https', 'tcp'),
(12, '192.168.0.1', '445', 'microsoft-ds', 'tcp'),
(13, '192.168.0.1', '8181', 'intermapper', 'tcp'),
(14, '192.168.0.1', '49152', 'unknown', 'tcp'),
(15, '192.168.0.1', '53', 'domain', 'tcp'),
(16, '192.168.0.1', '80', 'http', 'tcp'),
(17, '192.168.0.1', '139', 'netbios-ssn', 'tcp'),
(18, '192.168.0.1', '443', 'https', 'tcp'),
(19, '192.168.0.1', '445', 'microsoft-ds', 'tcp'),
(20, '192.168.0.1', '8181', 'intermapper', 'tcp'),
(21, '192.168.0.1', '49152', 'unknown', 'tcp'),
(22, '192.168.0.1', '53', 'domain', 'tcp'),
(23, '192.168.0.1', '80', 'http', 'tcp'),
(24, '192.168.0.1', '139', 'netbios-ssn', 'tcp'),
(25, '192.168.0.1', '443', 'https', 'tcp'),
(26, '192.168.0.1', '445', 'microsoft-ds', 'tcp'),
(27, '192.168.0.1', '8181', 'intermapper', 'tcp'),
(28, '192.168.0.1', '49152', 'unknown', 'tcp'),
(29, '192.168.0.105', '21', 'ftp', 'tcp'),
(30, '192.168.0.105', '22', 'ssh', 'tcp'),
(31, '192.168.0.105', '80', 'http', 'tcp'),
(32, '192.168.0.105', '139', 'netbios-ssn', 'tcp'),
(33, '192.168.0.105', '445', 'microsoft-ds', 'tcp'),
(34, '192.168.0.105', '3306', 'mysql', 'tcp'),
(35, '192.168.0.105', '3389', 'ms-wbt-server', 'tcp'),
(36, '192.168.0.105', '9091', 'xmltec-xmlmail', 'tcp'),
(37, '192.168.0.1', '53', 'domain', 'tcp'),
(38, '192.168.0.1', '80', 'http', 'tcp'),
(39, '192.168.0.1', '139', 'netbios-ssn', 'tcp'),
(40, '192.168.0.1', '443', 'https', 'tcp'),
(41, '192.168.0.1', '445', 'microsoft-ds', 'tcp'),
(42, '192.168.0.1', '8181', 'intermapper', 'tcp'),
(43, '192.168.0.1', '49152', 'unknown', 'tcp'),
(44, '192.168.0.105', '21', 'ftp', 'tcp'),
(45, '192.168.0.105', '22', 'ssh', 'tcp'),
(46, '192.168.0.105', '80', 'http', 'tcp'),
(47, '192.168.0.105', '139', 'netbios-ssn', 'tcp'),
(48, '192.168.0.105', '445', 'microsoft-ds', 'tcp'),
(49, '192.168.0.105', '3306', 'mysql', 'tcp'),
(50, '192.168.0.105', '3389', 'ms-wbt-server', 'tcp'),
(51, '192.168.0.105', '9091', 'xmltec-xmlmail', 'tcp');

-- --------------------------------------------------------

--
-- Struttura della tabella `utenti`
--

CREATE TABLE IF NOT EXISTS `utenti` (
  `id` int(6) unsigned NOT NULL AUTO_INCREMENT,
  `NOME` varchar(30) NOT NULL,
  `PASSWORD` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dump dei dati per la tabella `utenti`
--

INSERT INTO `utenti` (`id`, `NOME`, `PASSWORD`) VALUES
(1, 'alessandro', '8b555452b14c8d3570608964a1ce406429731746211d45dd3c92c21fb35cb039'),
(3, 'paolo', '254835d73cc88095a30fc74133beabe9d8463b2954493227b205ea326c8a9c86'),
(4, 'luca', 'd70f47790f689414789eeff231703429c7f88a10210775906460edbf38589d90');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
