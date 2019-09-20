/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50096
Source Host           : localhost:3306
Source Database       : mavendb

Target Server Type    : MYSQL
Target Server Version : 50096
File Encoding         : 65001

Date: 2018-12-17 11:31:01
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for tb_admin
-- ----------------------------
DROP TABLE IF EXISTS `tb_admin`;
CREATE TABLE `tb_admin` (
  `id` int(30) NOT NULL auto_increment,
  `ad_username` varchar(50) NOT NULL,
  `ad_pass` varchar(50) NOT NULL,
  `ad_zctime` date default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_admin
-- ----------------------------
INSERT INTO `tb_admin` VALUES ('1', 'admin', 'admin123', '2018-12-13');
INSERT INTO `tb_admin` VALUES ('7', '1233', '123', '2018-12-13');
INSERT INTO `tb_admin` VALUES ('8', '12333', '123', '2018-12-13');
INSERT INTO `tb_admin` VALUES ('9', '123333', '123', '2018-12-13');
INSERT INTO `tb_admin` VALUES ('10', '12412312', '1111', '2018-12-13');
INSERT INTO `tb_admin` VALUES ('12', '12341', '123', '2018-12-13');
INSERT INTO `tb_admin` VALUES ('13', '12334', '111', '2018-12-13');
INSERT INTO `tb_admin` VALUES ('14', '123123111', '1231', '2018-12-13');
INSERT INTO `tb_admin` VALUES ('15', '1231233', '123123', '2018-12-13');
INSERT INTO `tb_admin` VALUES ('16', '123123123', '123123', '2018-12-13');
INSERT INTO `tb_admin` VALUES ('17', '1231231', '123123123', '2018-12-13');
INSERT INTO `tb_admin` VALUES ('18', 'admin2', 'admin123', '2018-12-13');

-- ----------------------------
-- Table structure for tb_book
-- ----------------------------
DROP TABLE IF EXISTS `tb_book`;
CREATE TABLE `tb_book` (
  `BOOKID` int(11) NOT NULL auto_increment,
  `BOOKNAME` varchar(255) default NULL,
  `TYPEID` int(11) default NULL,
  `CASEID` int(11) default NULL,
  `AUTHOR` varchar(255) default NULL,
  `PRICE` varchar(255) default NULL,
  `BORROWSUM` int(11) default NULL,
  `CONCERN` varchar(255) default NULL,
  PRIMARY KEY  (`BOOKID`),
  KEY `TYPEID` (`TYPEID`),
  KEY `CASEID` (`CASEID`),
  CONSTRAINT `tb_book_ibfk_2` FOREIGN KEY (`CASEID`) REFERENCES `tb_bookcase` (`CASEID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tb_book_ibfk_1` FOREIGN KEY (`TYPEID`) REFERENCES `tb_booktype` (`TYPEID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_book
-- ----------------------------
INSERT INTO `tb_book` VALUES ('1', '西游记', '3', '1', '吴承恩', '50', '198', '新华');
INSERT INTO `tb_book` VALUES ('2', '三国演义', '3', '2', '罗贯中', '50', '99', '新华');
INSERT INTO `tb_book` VALUES ('5', '小时代', '1', '1', '郭敬明', '80', '49', '网络');
INSERT INTO `tb_book` VALUES ('6', 'test', '1', '1', 'test', '1', '99', '123');

-- ----------------------------
-- Table structure for tb_bookcase
-- ----------------------------
DROP TABLE IF EXISTS `tb_bookcase`;
CREATE TABLE `tb_bookcase` (
  `CASEID` int(11) NOT NULL auto_increment,
  `CASENAME` varchar(255) default NULL,
  PRIMARY KEY  (`CASEID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_bookcase
-- ----------------------------
INSERT INTO `tb_bookcase` VALUES ('1', '1号书架');
INSERT INTO `tb_bookcase` VALUES ('2', '2号书架');
INSERT INTO `tb_bookcase` VALUES ('3', '3号书架');
INSERT INTO `tb_bookcase` VALUES ('4', '4号书架');
INSERT INTO `tb_bookcase` VALUES ('5', '5号书架');
INSERT INTO `tb_bookcase` VALUES ('6', '6号书架');
INSERT INTO `tb_bookcase` VALUES ('7', '7号书架');
INSERT INTO `tb_bookcase` VALUES ('8', '8号书架');
INSERT INTO `tb_bookcase` VALUES ('9', '9号书架');
INSERT INTO `tb_bookcase` VALUES ('10', '10号书架');

-- ----------------------------
-- Table structure for tb_booktype
-- ----------------------------
DROP TABLE IF EXISTS `tb_booktype`;
CREATE TABLE `tb_booktype` (
  `TYPEID` int(11) NOT NULL auto_increment,
  `TYPENAME` varchar(255) default NULL,
  `BORROWDAY` int(11) default NULL,
  PRIMARY KEY  (`TYPEID`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_booktype
-- ----------------------------
INSERT INTO `tb_booktype` VALUES ('1', '名著畅销文学', '30');
INSERT INTO `tb_booktype` VALUES ('2', '儿童文学', '15');
INSERT INTO `tb_booktype` VALUES ('3', '经典名著', '30');
INSERT INTO `tb_booktype` VALUES ('4', '古典文学', '7');
INSERT INTO `tb_booktype` VALUES ('5', '历史地理', '7');
INSERT INTO `tb_booktype` VALUES ('6', '专业图书', '7');
INSERT INTO `tb_booktype` VALUES ('7', '哲学', '30');
INSERT INTO `tb_booktype` VALUES ('8', '社会科学', '15');
INSERT INTO `tb_booktype` VALUES ('9', '工具书', '15');

-- ----------------------------
-- Table structure for tb_borrow
-- ----------------------------
DROP TABLE IF EXISTS `tb_borrow`;
CREATE TABLE `tb_borrow` (
  `ID` int(11) NOT NULL auto_increment,
  `READER_ID` int(11) default NULL,
  `BOOK_ID` int(11) default NULL,
  `BORROWTIME` datetime default NULL,
  `RETURNTIME` datetime default NULL,
  `ISRETURN` int(2) default NULL,
  PRIMARY KEY  (`ID`),
  KEY `READER_ID` (`READER_ID`),
  KEY `BOOK_ID` (`BOOK_ID`),
  CONSTRAINT `tb_borrow_ibfk_2` FOREIGN KEY (`BOOK_ID`) REFERENCES `tb_book` (`BOOKID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tb_borrow_ibfk_1` FOREIGN KEY (`READER_ID`) REFERENCES `tb_reader` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_borrow
-- ----------------------------
INSERT INTO `tb_borrow` VALUES ('4', '3', '1', '2018-12-15 21:31:22', '2019-01-14 21:31:22', '1');
INSERT INTO `tb_borrow` VALUES ('5', '3', '2', '2018-12-15 21:31:25', '2019-01-14 21:31:25', '0');
INSERT INTO `tb_borrow` VALUES ('8', '3', '6', '2018-12-17 10:07:20', '2019-01-16 10:07:20', '2');

-- ----------------------------
-- Table structure for tb_feedback
-- ----------------------------
DROP TABLE IF EXISTS `tb_feedback`;
CREATE TABLE `tb_feedback` (
  `id` int(10) NOT NULL auto_increment,
  `rd_id` int(10) NOT NULL,
  `fb_title` varchar(100) NOT NULL,
  `fb_text` text,
  `fb_time` datetime NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_feedback
-- ----------------------------
INSERT INTO `tb_feedback` VALUES ('2', '3', '123', '这是一个很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长的反馈', '2018-12-17 00:01:45');
INSERT INTO `tb_feedback` VALUES ('3', '1', '123', '123', '2018-12-17 00:13:24');

-- ----------------------------
-- Table structure for tb_libraryinfo
-- ----------------------------
DROP TABLE IF EXISTS `tb_libraryinfo`;
CREATE TABLE `tb_libraryinfo` (
  `id` int(11) NOT NULL auto_increment,
  `library_name` varchar(20) default NULL,
  `master_name` varchar(20) default NULL,
  `bulid_time` varchar(20) default NULL,
  `contact_email` varchar(20) default NULL,
  `contact_address` varchar(50) default NULL,
  `contact_phone` varchar(20) default NULL,
  `contact_web` varchar(50) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_libraryinfo
-- ----------------------------
INSERT INTO `tb_libraryinfo` VALUES ('1', '图书馆', '姜洋', '1979-09-04', '1159137348@qq.com', '浙江机电职业技术学院', '15158284229', 'www.jidian.com');

-- ----------------------------
-- Table structure for tb_picture
-- ----------------------------
DROP TABLE IF EXISTS `tb_picture`;
CREATE TABLE `tb_picture` (
  `id` int(10) NOT NULL auto_increment,
  `pic_name` varchar(255) NOT NULL default '' COMMENT '图片名称',
  `pic_file_path` varchar(255) NOT NULL COMMENT '图片路径',
  `pic_update_time` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_picture
-- ----------------------------
INSERT INTO `tb_picture` VALUES ('20', '1233', '/static/index/images/banner/f6ff13df-1a13-4d6a-9b90-84d0f13ee014.jpg', '2018-12-16 16:25:53');
INSERT INTO `tb_picture` VALUES ('21', 'banner1', '/static/index/images/banner/181a06bf-a1ae-4123-8adf-65665490e0c2.jpg', '2018-12-16 22:44:43');
INSERT INTO `tb_picture` VALUES ('22', 'banner2', '/static/index/images/banner/d9d72b38-207c-411f-935f-e53e642f2031.jpg', '2018-12-16 22:44:50');
INSERT INTO `tb_picture` VALUES ('23', 'banner3', '/static/index/images/banner/42c9bd6f-b969-41fe-85ab-9145b6e6bf0a.jpg', '2018-12-16 22:44:57');

-- ----------------------------
-- Table structure for tb_reader
-- ----------------------------
DROP TABLE IF EXISTS `tb_reader`;
CREATE TABLE `tb_reader` (
  `ID` int(11) NOT NULL auto_increment,
  `READERNAME` varchar(255) default NULL,
  `READER_TYPEID` int(11) default NULL,
  `SEX` varchar(255) default NULL,
  `TEL` varchar(255) default NULL,
  `EMAIL` varchar(255) default NULL,
  `REMARK` varchar(255) default NULL,
  PRIMARY KEY  (`ID`),
  KEY `tb_reader_ibfk` (`READER_TYPEID`),
  CONSTRAINT `tb_reader_ibfk` FOREIGN KEY (`READER_TYPEID`) REFERENCES `tb_readertype` (`READER_TYPEID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_reader
-- ----------------------------
INSERT INTO `tb_reader` VALUES ('3', '程标', '1', '男', '54321', '54321@qq.com', '123');
INSERT INTO `tb_reader` VALUES ('4', '姜洋', '2', '男', '911', '911@qq.com', '123');
INSERT INTO `tb_reader` VALUES ('5', '沈月峰', '1', '男', '120', '120@qq.com', '123');

-- ----------------------------
-- Table structure for tb_readertype
-- ----------------------------
DROP TABLE IF EXISTS `tb_readertype`;
CREATE TABLE `tb_readertype` (
  `READER_TYPEID` int(11) NOT NULL auto_increment,
  `TYPENAME` varchar(255) default NULL,
  `NUM` varchar(255) default NULL,
  PRIMARY KEY  (`READER_TYPEID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_readertype
-- ----------------------------
INSERT INTO `tb_readertype` VALUES ('1', '学生', '50');
INSERT INTO `tb_readertype` VALUES ('2', '老师', '100');
INSERT INTO `tb_readertype` VALUES ('3', '医生', '100');
