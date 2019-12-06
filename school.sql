/*
Navicat MySQL Data Transfer

Source Server         : Trunks
Source Server Version : 50721
Source Host           : localhost:3306
Source Database       : school

Target Server Type    : MYSQL
Target Server Version : 50721
File Encoding         : 65001

Date: 2019-12-06 11:06:48
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for s_course
-- ----------------------------
DROP TABLE IF EXISTS `s_course`;
CREATE TABLE `s_course` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `course_name` varchar(255) NOT NULL,
  `course_info` varchar(255) NOT NULL,
  `teacher_id` int(10) NOT NULL,
  `paper_id` int(10) DEFAULT NULL,
  `sort_id` int(10) NOT NULL,
  `course_url` varchar(255) DEFAULT NULL,
  `course_source_url` varchar(255) DEFAULT NULL,
  `course_source_name` varchar(255) DEFAULT NULL,
  `students_map_id` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of s_course
-- ----------------------------
INSERT INTO `s_course` VALUES ('1', '软件工程', '计算机ｉｕ我二日ｕｗｅｒｇｗｉｅｒfsdfsdfwerwqr', '5', null, '1', 'http://localhost:7788/public/source/1575468918249.jpeg', 'http://localhost:7788/public/source/1575468948893.octet-stream,http://localhost:7788/public/source/1575468970039.jpeg', '1575468948893.octet-stream,1575468970039.jpeg', null);
INSERT INTO `s_course` VALUES ('2', '数据结构', '全球我而且我而且而去我而特务人特务额特', '5', null, '5', 'http://localhost:7788/public/source/1575469774522.jpeg', 'http://localhost:7788/public/source/1575469776639.jpeg,http://localhost:7788/public/source/1575469781610.jpeg', '1575469776639.jpeg,1575469781610.jpeg', null);
INSERT INTO `s_course` VALUES ('4', 'ohwqiuqiw', 'qwgporewjweirhgoweinownreoigniweourhgiweurgwergwergwerg', '5', null, '3', 'http://localhost:7788/public/source/1575469970293.jpeg', 'http://localhost:7788/public/source/1575469973129.jpeg,http://localhost:7788/public/source/1575469976569.jpeg', '1575469973129.jpeg,1575469976569.jpeg', null);
INSERT INTO `s_course` VALUES ('5', '大数据', '的玩儿哦我回家哦ｉｅｈｒｇｉｕｗｅｏｉｇｕｈｅｒｗｉｏｇｅ额外如果我而个', '5', null, '1', 'http://localhost:7788/public/source/1575477504333.jpeg', 'http://localhost:7788/public/source/1575477509772.jpeg', '1575477509772.jpeg', null);
INSERT INTO `s_course` VALUES ('6', 'python程序设计', 'qweqwequytyoiui', '5', null, '5', 'http://localhost:7788/public/source/1575477537591.jpeg', 'http://localhost:7788/public/source/1575477509772.jpeg,http://localhost:7788/public/source/1575477539254.jpeg', '1575477509772.jpeg,1575477539254.jpeg', null);
INSERT INTO `s_course` VALUES ('7', '呵呵哈哈哈哈', '打算的去我确认让他也ｕｔｙｔｙｒｔ认为太热有', '5', null, '7', 'http://localhost:7788/public/source/1575477762792.jpeg', 'http://localhost:7788/public/source/1575477765528.jpeg', '1575477765528.jpeg', null);
INSERT INTO `s_course` VALUES ('9', '跨平台互联网应用开发', '反而而退ｕｙｔｉｙｕｉｋｕｙｆｇｄｂｆｄ撒风格人个', '5', null, '1', 'http://localhost:7788/public/source/1575477846425.jpeg', 'http://localhost:7788/public/source/1575477848564.jpeg', '1575477848564.jpeg', null);
INSERT INTO `s_course` VALUES ('10', '高等数学', '啊是否玩儿我而我而我热我额我而我', '6', null, '2', 'http://localhost:7788/public/source/1575559533596.jpeg', 'http://localhost:7788/public/source/1575559535461.jpeg', '1575559535461.jpeg', null);
INSERT INTO `s_course` VALUES ('11', '大学物理', '啊虽然问题我而我我而额外人', '6', null, '3', 'http://localhost:7788/public/source/1575559566642.jpeg', 'http://localhost:7788/public/source/1575559571250.jpeg', '1575559571250.jpeg', null);
INSERT INTO `s_course` VALUES ('13', '嘻嘻哈哈或许', '去我而且我而且完全我沃尔沃而我而我而玩儿我而且我', '6', null, '5', 'http://localhost:7788/public/source/1575560062712.jpeg', 'http://localhost:7788/public/source/1575560072484.jpeg', '1575560072484.jpeg', null);
INSERT INTO `s_course` VALUES ('14', '人生如戏', '让他而儿童炎热让他还有认为额儿童因为让他我儿童有儿童', '5', null, '6', 'http://localhost:7788/public/source/1575560934698.jpeg', 'http://localhost:7788/public/source/1575560936882.jpeg', '1575560936882.jpeg', null);
INSERT INTO `s_course` VALUES ('15', 'IOS程序设计', '是的反而个儿歌人通过儿童个', '5', null, '1', 'http://localhost:7788/public/source/1575561482213.jpeg', 'http://localhost:7788/public/source/1575561484845.jpeg', '1575561484845.jpeg', null);
INSERT INTO `s_course` VALUES ('16', '测试好似是', '阿斯顿的哦脾气我去我ｉｅｈｑｗｏｅ　去我恶化去', '12', null, '3', 'http://localhost:7788/public/source/1575561674356.jpeg', 'http://localhost:7788/public/source/1575561683922.sql,http://localhost:7788/public/source/1575561690214.jpeg', '1575561683922.sql,1575561690214.jpeg', null);
INSERT INTO `s_course` VALUES ('17', '测试和ｉｈｉｈｉｏｈｏｑｉｗｏｑｅ', '服务儿童还有让他有', '16', null, '3', 'http://localhost:7788/public/source/1575595663995.jpeg', 'http://localhost:7788/public/source/1575595668455.jpeg,http://localhost:7788/public/source/1575595676769.octet-stream', '1575595668455.jpeg,1575595676769.octet-stream', null);

-- ----------------------------
-- Table structure for s_course_sort
-- ----------------------------
DROP TABLE IF EXISTS `s_course_sort`;
CREATE TABLE `s_course_sort` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `sort_name` varchar(255) NOT NULL,
  `user_id` int(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of s_course_sort
-- ----------------------------
INSERT INTO `s_course_sort` VALUES ('1', '计算机类', '5');
INSERT INTO `s_course_sort` VALUES ('2', '土木类', '5');
INSERT INTO `s_course_sort` VALUES ('3', '电商', '5');
INSERT INTO `s_course_sort` VALUES ('5', '数字媒体艺术', '5');
INSERT INTO `s_course_sort` VALUES ('6', '好好学习', '5');
INSERT INTO `s_course_sort` VALUES ('7', '天天向上', '5');

-- ----------------------------
-- Table structure for s_paper
-- ----------------------------
DROP TABLE IF EXISTS `s_paper`;
CREATE TABLE `s_paper` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `course_id` int(10) NOT NULL,
  `question_ids` varchar(255) NOT NULL,
  `teacher_id` int(10) NOT NULL,
  `is_show` int(2) NOT NULL DEFAULT '0',
  `paper_type` int(2) NOT NULL DEFAULT '0',
  `end_time` datetime NOT NULL,
  `paper_name` varchar(255) NOT NULL,
  `paper_time` int(10) NOT NULL DEFAULT '30',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of s_paper
-- ----------------------------
INSERT INTO `s_paper` VALUES ('2', '1', '1,3,4', '5', '1', '0', '2019-12-25 00:00:00', 'qweqweqw', '30');
INSERT INTO `s_paper` VALUES ('3', '10', '5,6,7,8,9,10,11,12', '6', '1', '1', '2019-12-28 00:00:00', '高数第一学期期中考试', '90');
INSERT INTO `s_paper` VALUES ('4', '16', '13,14,15', '12', '1', '1', '2019-12-30 00:00:00', '期中考试', '60');
INSERT INTO `s_paper` VALUES ('5', '17', '16,17,18', '16', '1', '0', '2019-12-18 00:00:00', '测试考试和死亡而我而', '90');

-- ----------------------------
-- Table structure for s_question
-- ----------------------------
DROP TABLE IF EXISTS `s_question`;
CREATE TABLE `s_question` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `question_article` varchar(255) NOT NULL,
  `question_type` int(10) NOT NULL,
  `question_answer` varchar(255) NOT NULL,
  `is_question_answer` int(2) DEFAULT NULL,
  `question_error` varchar(255) DEFAULT NULL,
  `course_id` int(10) NOT NULL,
  `score` int(10) NOT NULL DEFAULT '10',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COMMENT='question_type:题目类型，0选择题，１判断题，２填空题\r\nis_question_answer:判断题题目答案，０为错，1为对';

-- ----------------------------
-- Records of s_question
-- ----------------------------
INSERT INTO `s_question` VALUES ('1', 'rwe', '1', 'qeqweqwe', '1', 'qwe;rtyr;yt', '1', '10');
INSERT INTO `s_question` VALUES ('3', 'qweqwe', '2', 'qweqw', '9', '', '1', '10');
INSERT INTO `s_question` VALUES ('4', 'qwrqwrqwrq', '0', 'qweqwe', '9', 'qwrq;qweq;qw', '1', '10');
INSERT INTO `s_question` VALUES ('5', '先有鸡还还是现有蛋', '2', '不知道', '9', '', '10', '10');
INSERT INTO `s_question` VALUES ('6', '挨打我的突然我儿童图ｕｔｉｏｉｈｅｗｏｈｒｅｗ哦我和认为哦ｉｗｅｈｗｏｉｅｕｒ玩儿偶然我和', '1', '', '1', '', '10', '10');
INSERT INTO `s_question` VALUES ('7', '呵呵哈哈哈哈哈哈哈对ｉｕｆｗｅｏ我恶化哦我而玩儿偶然好哦我ｉｅｒ哦我恶化认为', '0', '我而规范反而', '9', '而让他我;然后我为ｕｒｗ;ｇｅ我而给我', '10', '10');
INSERT INTO `s_question` VALUES ('8', 'ihowieiuwewgbeiyuweuvy:fhwoieewfio?hwe', '0', 'qweqgerretyyrtu', '9', 'asda eweqr;asdadwq;w我而玩儿', '10', '10');
INSERT INTO `s_question` VALUES ('9', '去我而且我规范我而且热完全去我而且我全额儿童和让他认为儿童', '1', '', '0', '', '10', '10');
INSERT INTO `s_question` VALUES ('10', '去我个人他如火如荼他我地方规定如果儿童合同让他机会突然有让他一句话', '1', '', '1', '', '10', '10');
INSERT INTO `s_question` VALUES ('11', '儿童而特价犹太人具体ｕｏｕｉｏｕｓｄｆｗｑｑ我认为额', '2', 'hh', '9', '', '10', '10');
INSERT INTO `s_question` VALUES ('12', 'oifwoiuwoeiu哦毫无我ｉｗｕｅｇｒｗ玩儿偶然和我ｉｏｅｒ我而和给我诶偶尔个人哦我', '0', '我而我我而', '1', '我认为人;我我而;我而我', '10', '10');
INSERT INTO `s_question` VALUES ('13', '啊的完全哦的好哦去', '0', '111', '9', 'asdaddwq;qeqwe;qweqwvs', '16', '10');
INSERT INTO `s_question` VALUES ('14', 'dasdqwq', '1', '', '1', '', '16', '10');
INSERT INTO `s_question` VALUES ('15', '现有及还是现有的那', '2', '不知道', '9', '', '16', '10');
INSERT INTO `s_question` VALUES ('16', '好哦我好哦网球和去我ｉｈｅｑｗ', '0', '１１１', '9', '去我而且;qeqqwgt;wrwet', '17', '10');
INSERT INTO `s_question` VALUES ('17', 'werwegrtyuuyiyut', '1', '', '1', '', '17', '10');
INSERT INTO `s_question` VALUES ('18', 'qweyuiuyoiuouoip[', '2', '123', '9', '', '17', '10');

-- ----------------------------
-- Table structure for s_school_report
-- ----------------------------
DROP TABLE IF EXISTS `s_school_report`;
CREATE TABLE `s_school_report` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `report_level` varchar(10) NOT NULL,
  `student_id` int(10) NOT NULL,
  `paper_id` int(10) NOT NULL,
  `score_final` int(10) NOT NULL,
  `teacher_id` int(10) NOT NULL,
  `create_time` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of s_school_report
-- ----------------------------
INSERT INTO `s_school_report` VALUES ('1', 'D', '4', '2', '0', '5', '2019-12-05 22:05:51.722368');
INSERT INTO `s_school_report` VALUES ('2', 'D', '4', '2', '0', '5', '2019-12-05 22:07:01.995614');
INSERT INTO `s_school_report` VALUES ('3', 'A', '4', '2', '30', '5', '2019-12-05 22:13:56.039781');
INSERT INTO `s_school_report` VALUES ('4', 'C', '5', '2', '20', '5', '2019-12-05 22:54:01.134284');
INSERT INTO `s_school_report` VALUES ('5', 'D', '6', '3', '40', '6', '2019-12-05 23:40:17.921909');
INSERT INTO `s_school_report` VALUES ('6', 'D', '12', '2', '0', '5', '2019-12-06 00:00:38.948909');
INSERT INTO `s_school_report` VALUES ('7', 'A', '13', '4', '30', '12', '2019-12-06 00:05:39.405468');
INSERT INTO `s_school_report` VALUES ('8', 'D', '13', '4', '0', '12', '2019-12-06 00:05:55.623270');
INSERT INTO `s_school_report` VALUES ('9', 'C', '5', '2', '20', '5', '2019-12-06 09:02:59.106548');
INSERT INTO `s_school_report` VALUES ('10', 'C', '5', '3', '50', '6', '2019-12-06 09:09:27.915042');
INSERT INTO `s_school_report` VALUES ('11', 'D', '15', '3', '40', '6', '2019-12-06 09:26:19.768912');
INSERT INTO `s_school_report` VALUES ('12', 'A', '15', '5', '30', '16', '2019-12-06 09:30:11.519537');

-- ----------------------------
-- Table structure for s_students_course_map
-- ----------------------------
DROP TABLE IF EXISTS `s_students_course_map`;
CREATE TABLE `s_students_course_map` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `student_id` int(10) NOT NULL,
  `course_id` int(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of s_students_course_map
-- ----------------------------
INSERT INTO `s_students_course_map` VALUES ('1', '4', '1');
INSERT INTO `s_students_course_map` VALUES ('2', '5', '5');
INSERT INTO `s_students_course_map` VALUES ('3', '5', '1');
INSERT INTO `s_students_course_map` VALUES ('4', '5', '6');
INSERT INTO `s_students_course_map` VALUES ('5', '6', '10');
INSERT INTO `s_students_course_map` VALUES ('6', '12', '1');
INSERT INTO `s_students_course_map` VALUES ('7', '13', '16');
INSERT INTO `s_students_course_map` VALUES ('8', '5', '10');
INSERT INTO `s_students_course_map` VALUES ('9', '15', '10');
INSERT INTO `s_students_course_map` VALUES ('10', '15', '17');

-- ----------------------------
-- Table structure for s_user
-- ----------------------------
DROP TABLE IF EXISTS `s_user`;
CREATE TABLE `s_user` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(255) NOT NULL,
  `pass_word` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `permission` int(3) NOT NULL DEFAULT '0',
  `email` varchar(255) DEFAULT NULL,
  `introduce` varchar(255) DEFAULT NULL,
  `student_number` varchar(11) DEFAULT NULL,
  `teacher_number` varchar(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of s_user
-- ----------------------------
INSERT INTO `s_user` VALUES ('4', '111', '111', '111', '0', '111@qe.123', '', '11111111111', null);
INSERT INTO `s_user` VALUES ('5', '222', '222', '222', '2', '222@222.com', 'hhhhh', null, '22222222222');
INSERT INTO `s_user` VALUES ('6', '小牛', '333', '猎人牛', '1', '333@135.com', '', null, '33333333333');
INSERT INTO `s_user` VALUES ('7', '小啥', '444', '张大傻', '0', 'eew@erw.vom', '', '44444444444', null);
INSERT INTO `s_user` VALUES ('8', '555', '555', '555', '0', '555@sad.f', '', '55555555555', null);
INSERT INTO `s_user` VALUES ('9', '666', '666', '666', '0', 'ewr@erw.t', '', '66666666666', null);
INSERT INTO `s_user` VALUES ('10', '777', '777', '777', '1', 'qweq@qwe.qwe', '', null, '77777777777');
INSERT INTO `s_user` VALUES ('11', '888', '888', '8888888888', '0', '888@dg.ftt', '', '88888888888', null);
INSERT INTO `s_user` VALUES ('12', '999', '999', '999999999', '2', '9999@fwe.tryr', '', null, '99999999999');
INSERT INTO `s_user` VALUES ('13', '000', '000', '000', '0', '000@sfs.ty', 'asdadwqqwrqr', '00000000000', null);
INSERT INTO `s_user` VALUES ('14', '123', '123', '123', '1', '123@fsf.uty', '', null, '12345678911');
INSERT INTO `s_user` VALUES ('15', '123', '123', '123', '0', '123@fdwe.uuy', 'hhhhh', '12345678911', null);
INSERT INTO `s_user` VALUES ('16', '777', '777', '777', '1', '777@fer.iuu', '', null, '12345677777');
INSERT INTO `s_user` VALUES ('17', '111', '111', '111', '2', '111@ew.ytu', '', null, '11122233311');
