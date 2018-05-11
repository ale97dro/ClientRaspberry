-- phpMyAdmin SQL Dump
-- version 4.1.4
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Mag 10, 2018 alle 15:54
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
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=17 ;

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
(16, '192.168.17.107', '70:5a:0f:b9:02:04');

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
(1, 'alessandro', '51af78a02435124ebc225e570e533ac9'),
(3, 'paolo', '969044ea4df948fb0392308cfff9cdce'),
(4, 'luca', 'ff377aff39a9345a9cca803fb5c5c081');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
