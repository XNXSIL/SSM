-- --------------------------------------------------------
-- 主机:                           127.0.0.1
-- 服务器版本:                        8.0.11 - MySQL Community Server - GPL
-- 服务器操作系统:                      Win64
-- HeidiSQL 版本:                  9.5.0.5196
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- 导出  表 blog.comments 结构
DROP TABLE IF EXISTS `comments`;
CREATE TABLE IF NOT EXISTS `comments` (
  `username` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `comments` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `date` varchar(50) COLLATE utf8_bin NOT NULL,
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- 正在导出表  blog.comments 的数据：~4 rows (大约)
DELETE FROM `comments`;
/*!40000 ALTER TABLE `comments` DISABLE KEYS */;
/*!40000 ALTER TABLE `comments` ENABLE KEYS */;

-- 导出  表 blog.fan 结构
DROP TABLE IF EXISTS `fan`;
CREATE TABLE IF NOT EXISTS `fan` (
  `username` varchar(50) COLLATE utf8_bin NOT NULL,
  `fan_name` varchar(50) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- 正在导出表  blog.fan 的数据：~2 rows (大约)
DELETE FROM `fan`;
/*!40000 ALTER TABLE `fan` DISABLE KEYS */;
/*!40000 ALTER TABLE `fan` ENABLE KEYS */;

-- 导出  表 blog.goods 结构
DROP TABLE IF EXISTS `goods`;
CREATE TABLE IF NOT EXISTS `goods` (
  `username` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- 正在导出表  blog.goods 的数据：~3 rows (大约)
DELETE FROM `goods`;
/*!40000 ALTER TABLE `goods` DISABLE KEYS */;
/*!40000 ALTER TABLE `goods` ENABLE KEYS */;

-- 导出  表 blog.message 结构
DROP TABLE IF EXISTS `message`;
CREATE TABLE IF NOT EXISTS `message` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) COLLATE utf8_bin NOT NULL DEFAULT '0',
  `content` varchar(50) COLLATE utf8_bin NOT NULL DEFAULT '0',
  `date` varchar(50) COLLATE utf8_bin NOT NULL DEFAULT '0',
  `store_count` int(11) NOT NULL DEFAULT '0',
  `comment_count` int(11) NOT NULL DEFAULT '0',
  `good_count` int(11) NOT NULL DEFAULT '0',
  KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- 正在导出表  blog.message 的数据：~18 rows (大约)
DELETE FROM `message`;
/*!40000 ALTER TABLE `message` DISABLE KEYS */;
/*!40000 ALTER TABLE `message` ENABLE KEYS */;

-- 导出  表 blog.pictures 结构
DROP TABLE IF EXISTS `pictures`;
CREATE TABLE IF NOT EXISTS `pictures` (
  `username` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `pictures` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- 正在导出表  blog.pictures 的数据：~16 rows (大约)
DELETE FROM `pictures`;
/*!40000 ALTER TABLE `pictures` DISABLE KEYS */;
/*!40000 ALTER TABLE `pictures` ENABLE KEYS */;

-- 导出  表 blog.stores 结构
DROP TABLE IF EXISTS `stores`;
CREATE TABLE IF NOT EXISTS `stores` (
  `username` varchar(50) COLLATE utf8_bin NOT NULL,
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- 正在导出表  blog.stores 的数据：~2 rows (大约)
DELETE FROM `stores`;
/*!40000 ALTER TABLE `stores` DISABLE KEYS */;
/*!40000 ALTER TABLE `stores` ENABLE KEYS */;

-- 导出  表 blog.user 结构
DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `username` varchar(64) NOT NULL,
  `password` varchar(64) NOT NULL,
  `head_protrait` varchar(64) NOT NULL DEFAULT 'user.jpg',
  `fans_num` int(11) NOT NULL DEFAULT '0',
  `messages_num` int(11) NOT NULL DEFAULT '0',
  `phone` varchar(50) NOT NULL DEFAULT '00000000000',
  `personal_tag` varchar(50) NOT NULL DEFAULT 'Hello World',
  `institute` varchar(50) NOT NULL DEFAULT 'institute',
  `real_name` varchar(50) NOT NULL DEFAULT '小明'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  blog.user 的数据：~3 rows (大约)
DELETE FROM `user`;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
/*!40000 ALTER TABLE `user` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
