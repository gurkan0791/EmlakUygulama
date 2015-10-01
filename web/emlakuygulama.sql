-- phpMyAdmin SQL Dump
-- version 4.1.6
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Jan 21, 2015 at 04:41 PM
-- Server version: 5.6.16
-- PHP Version: 5.5.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `emlakuygulama`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_ev_guncelle`(IN `evid` INT(11), IN `aptadi` VARCHAR(30) CHARSET utf8, IN `mahalle` VARCHAR(30) CHARSET utf8, IN `sokak` VARCHAR(30) CHARSET utf8, IN `aciklama` VARCHAR(250) CHARSET utf8, IN `odaSayisi` VARCHAR(10) CHARSET utf8, IN `durum` VARCHAR(20) CHARSET utf8, IN `metrekare` VARCHAR(20) CHARSET utf8, IN `fiyat` VARCHAR(30) CHARSET utf8)
UPDATE emlakuygulama.evadres AS a

INNER JOIN emlakuygulama.evbilgi AS b ON a.EVID = b.EVID 
INNER JOIN emlakuygulama.evozellik AS c ON a.EVID = c.EVID 
SET    a.aptadi = aptadi,
a.mahalle=mahalle,
a.sokak=sokak,
a.aciklama=aciklama,
c.odasayisi=odaSayisi,
c.durumu=durum,
c.metrekare=metrekare,
c.fiyat =fiyat
WHERE a.EVID = evid$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_ev_kaydet`(IN `enlem` FLOAT(10,6), IN `boylam` FLOAT(10,6), IN `aptAdi` VARCHAR(255) CHARSET utf8, IN `mahalle` VARCHAR(255) CHARSET utf8, IN `sokak` VARCHAR(255) CHARSET utf8, IN `aciklama` VARCHAR(255) CHARSET utf8, IN `fiyat` VARCHAR(255) CHARSET utf8, IN `odaSayisi` VARCHAR(255) CHARSET utf8, IN `durum` VARCHAR(255) CHARSET utf8, IN `metrekare` VARCHAR(255) CHARSET utf8)
BEGIN
INSERT INTO evbilgi  VALUES(0,enlem,boylam);

INSERT INTO evadres VALUES(0,(select EVID from evbilgi WHERE EVID=LAST_INSERT_ID()),aptAdi,mahalle,sokak,aciklama);

INSERT INTO evozellik VALUES(0,(select EVID from evbilgi WHERE EVID=LAST_INSERT_ID()),odaSayisi,durum,metrekare,fiyat);
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `evadres`
--

CREATE TABLE IF NOT EXISTS `evadres` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `EVID` int(11) NOT NULL,
  `aptadi` varchar(20) CHARACTER SET latin5 NOT NULL,
  `mahalle` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `sokak` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `aciklama` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=22 ;

--
-- Dumping data for table `evadres`
--

INSERT INTO `evadres` (`ID`, `EVID`, `aptadi`, `mahalle`, `sokak`, `aciklama`) VALUES
(1, 1, 'selam', 'ben', 'gurkan', 'asdasd'),
(2, 2, 'asdasd', 'adsdasd', 'asdasd', 'asdasd'),
(3, 3, 'selam', 'ben', 'gurkan', 'sads'),
(4, 4, 'asdasd', 'dasd', 'dasd', 'dasd'),
(5, 5, 'asdasd', 'asdasdk', 'asdasd', 'asdasd'),
(6, 6, 'SeÃ§kin', 'Yeni Mah.', 'Kalkan Sok.', 'Varsa'),
(7, 7, 'lololo', 'asdasd', 'adad', 'asdasd'),
(8, 8, 'asdas', 'asdsd', 'ad', 'asdasdasd'),
(9, 9, 'SEÇKİN', 'yeni mah.', 'KALKAN SOK.', 'ASDSADASDASD'),
(10, 10, 'SEÃ?KÄ°N', 'YENÃ??Ã?Â° MAH.', 'KALKAN SOK.', 'asdasdasdasdasdasdasd'),
(11, 11, 'seckin', 'yeni mah.', 'kalkan sok', 'iller bankasi arkasi'),
(12, 12, 'asdasd', 'asd', 'asdasd', 'asdasd'),
(13, 13, 'asdsad', 'asdsd', 'asd', 'sadasdas'),
(14, 14, 'asdsad', 'asdsd', 'asd', 'sadasdas'),
(15, 15, 'ASDASD', 'ASDASD', 'DASDASD', 'ASDA'),
(16, 16, 'SDSAD', 'DSDZSDDDD', 'DSD', 'DSD'),
(17, 17, 'ADASDASDASD', 'DSD', 'ASD', 'DASDASD'),
(18, 18, 'SD', 'SADASD', 'SASD', 'SADASD'),
(19, 19, 'asdad', 'asd', 'asdasd', 'asd'),
(20, 20, 'sdasd', 'asda', 'asd', 'asd'),
(21, 21, 'gurkan', 'asdasd', 'asdasd', 'asdasd');

-- --------------------------------------------------------

--
-- Table structure for table `evbilgi`
--

CREATE TABLE IF NOT EXISTS `evbilgi` (
  `EVID` int(11) NOT NULL AUTO_INCREMENT,
  `KONUME` float(10,6) NOT NULL,
  `KONUMB` double(10,6) NOT NULL,
  PRIMARY KEY (`EVID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=22 ;

--
-- Dumping data for table `evbilgi`
--

INSERT INTO `evbilgi` (`EVID`, `KONUME`, `KONUMB`) VALUES
(1, -34.390266, 150.632126),
(2, -34.394375, 150.633759),
(3, -32.657875, 138.763336),
(4, -34.461277, 150.065262),
(5, -33.911453, 149.745972),
(6, -34.378296, 150.563263),
(7, -34.401386, 150.482574),
(8, -34.379642, 150.621750),
(9, -34.375462, 150.605606),
(10, -34.375462, 150.605606),
(11, -34.382618, 150.881119),
(12, 38.675034, 39.217510),
(13, 38.675724, 39.218552),
(14, 38.675724, 39.218552),
(15, 38.677315, 39.215939),
(16, 38.678520, 39.221432),
(17, 38.679192, 39.214222),
(18, 38.676914, 39.213535),
(19, 38.671864, 39.226849),
(20, 38.671654, 39.215164),
(21, 38.676594, 39.222656);

-- --------------------------------------------------------

--
-- Table structure for table `evozellik`
--

CREATE TABLE IF NOT EXISTS `evozellik` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `EVID` int(11) NOT NULL,
  `odasayisi` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `durumu` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `metrekare` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `fiyat` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=15 ;

--
-- Dumping data for table `evozellik`
--

INSERT INTO `evozellik` (`ID`, `EVID`, `odasayisi`, `durumu`, `metrekare`, `fiyat`) VALUES
(1, 8, 'ad', 'asadsd', 'asd', 'asd'),
(2, 9, '3+1', 'satÄ±lÄ±k', '180M2', '100.000TL'),
(3, 10, '3+1', 'SATILIK', '180M2', '100.000TL'),
(4, 11, '3+1', 'Satilik', '180m2', '100.100TL'),
(5, 12, 'asdad', 'sadads', 'asda', 'asadad'),
(6, 13, '4+1', 'KiralÄ±k', '180m2', '550'),
(7, 14, '4+1', 'Kiralik', '180m2', '500'),
(8, 15, 'SDADS', 'ASDASD', 'ASD', 'ASDA'),
(9, 16, 'ASDASD', 'SD', 'SD', 'SADASD'),
(10, 17, 'DASDASD', 'SDA', 'DS', 'ASD'),
(11, 18, 'ASDA', 'ASD', 'ASD', 'ASDASD'),
(12, 19, '3+1', 'Satilik', '180m2', '100.000TL'),
(13, 20, 'asd', 'asd', 'asd', 'asd'),
(14, 21, 'asd', 'asd', 'sad', '10000');

-- --------------------------------------------------------

--
-- Table structure for table `evresim`
--

CREATE TABLE IF NOT EXISTS `evresim` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `EVID` int(11) NOT NULL,
  `resim` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=11 ;

--
-- Dumping data for table `evresim`
--

INSERT INTO `evresim` (`ID`, `EVID`, `resim`) VALUES
(1, 10, 'ekran3.JPG'),
(2, 10, 'ekran1.JPG'),
(3, 8, 'erdiyagram.JPG'),
(4, 8, 'mimariya.JPG'),
(5, 12, 'searing-mountain.png'),
(6, 14, 'ev1.jpg'),
(7, 14, 'ev2.jpg'),
(8, 19, 'ev23.jpg'),
(9, 20, 'ev2.jpg'),
(10, 21, 'ev1.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `ev_ozellik`
--

CREATE TABLE IF NOT EXISTS `ev_ozellik` (
  `Ev_ID` int(11) NOT NULL,
  `Ozellik_ID` int(11) NOT NULL,
  `Deger` varchar(30) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `giris`
--

CREATE TABLE IF NOT EXISTS `giris` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `USERID` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `PASSWORD` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

--
-- Dumping data for table `giris`
--

INSERT INTO `giris` (`ID`, `USERID`, `PASSWORD`) VALUES
(1, 'admin', 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `ozellik`
--

CREATE TABLE IF NOT EXISTS `ozellik` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Ozellik` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=5 ;

--
-- Dumping data for table `ozellik`
--

INSERT INTO `ozellik` (`ID`, `Ozellik`) VALUES
(1, 'Fiyat'),
(2, 'Oda Sayisi'),
(3, 'Durumu'),
(4, 'Metrekare');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
