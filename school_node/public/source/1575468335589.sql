-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: 2019-09-03 09:53:03
-- 服务器版本： 5.6.17
-- PHP Version: 5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `everyone`
--

-- --------------------------------------------------------

--
-- 表的结构 `t_activity`
--

CREATE TABLE IF NOT EXISTS `t_activity` (
  `activity_id` int(11) NOT NULL AUTO_INCREMENT,
  `activity_name` varchar(20) NOT NULL,
  `activity_type` varchar(20) NOT NULL,
  `activity_pic` varchar(300) NOT NULL,
  `activity_introduce` text NOT NULL,
  `activity_address` varchar(40) NOT NULL,
  `activity_timestart` datetime NOT NULL,
  `activity_timeend` datetime NOT NULL,
  `activity_tool` varchar(20) NOT NULL,
  `activity_limitpeople` int(11) NOT NULL,
  `activity_people` int(11) NOT NULL,
  `activity_details` varchar(2000) NOT NULL,
  PRIMARY KEY (`activity_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=22 ;

--
-- 转存表中的数据 `t_activity`
--

INSERT INTO `t_activity` (`activity_id`, `activity_name`, `activity_type`, `activity_pic`, `activity_introduce`, `activity_address`, `activity_timestart`, `activity_timeend`, `activity_tool`, `activity_limitpeople`, `activity_people`, `activity_details`) VALUES
(15, '网球1', '运动', '20190711\\a5c8eb28a7320b6ec7bdab6881d28461.JPEG', '在网球场上隔着球网用网球拍击打网球', '北京市北苑福熙大道悦溪体育馆', '2019-07-13 00:00:00', '2019-07-15 00:00:00', '网球拍，网球', 50, 0, '<p><img src="/yuejian/public/static/upload/20190724/1563953923453727.jpg" title="1563953923453727.jpg" alt="pic5.JPG" width="278" height="195"/></p>'),
(16, '马拉松', '跑步', '20190710\\31377eae94918401d94aba59b377440c.jpg', '东软三期10A806全体帅哥想你致敬', '大连市甘井子区东软街道', '2019-07-12 00:00:00', '2019-07-14 00:00:00', '跑鞋', 200, 0, '<p><img src="/yuejian/public/static/upload/20190724/1563953991605672.jpg" title="1563953991605672.jpg" alt="运动1.jpg" width="279" height="169"/></p><p><img src="/yuejian/public/static/upload/20190724/1563954007368395.jpg" title="1563954007368395.jpg" alt="运动2.jpg" width="275" height="150"/></p>'),
(17, '花样年华', '游泳类', '20190710\\e6394fefabc6275ec1f7593d8f92cc5b.png', '《花样年华》水陆表演秀”以及水上趣味运动会的形式，率先吹响全民健身的号角。', '福田体育公园恒温游泳馆', '2019-07-02 00:00:00', '2019-07-06 00:00:00', '泳衣泳裤', 200, 0, '<p><img src="/yuejian/public/static/upload/20190724/1563966357212017.jpg" title="1563966357212017.jpg" alt="123.jpg" width="283" height="161"/></p>'),
(20, '网球2', '运动', '20190711\\7946d95534e773f66e4970d02e245940.png', '在网球场上隔着球网用网球拍击打网球12', '北京市天安门城楼第二层', '2019-07-04 00:00:00', '2019-07-06 00:00:00', '网球拍', 40, 0, '<p><img src="/yuejian/public/static/upload/20190801/1564642877110944.jpg" title="1564642877110944.jpg" alt="t0158cca7d176ef1df4.jpg" width="283" height="168"/></p><p></p>'),
(21, '足球英雄杯1', '足球运动', '20190711\\889d6845354b117d96cc1d7c602384ed.jpg', '第十一届足球英雄杯开启啦，速速报名', '北京市皇姑区13号体育场', '2019-07-06 00:00:00', '2019-07-07 00:00:00', '足球鞋', 200, 0, '<p>嘿嘿嘿嘿嘿嘿嘿嘿嘿嘿哈哈哈哈啊啊啊啊啊啊啊啊啊啊啊啊啊问问</p><p><img src="/yuejian/public/static/upload/20190711/1562835024179270.png" title="1562835024179270.png" alt="activity1.png" width="272" height="104"/></p><p><img src="/yuejian/public/static/upload/20190711/1562834010713466.jpg" title="1562834010713466.jpg" width="1" height="1"/></p><p><img src="/yuejian/public/static/upload/20190711/1562834010118784.jpg" title="1562834010118784.jpg" width="271" height="82"/></p><p><br/></p>');

-- --------------------------------------------------------

--
-- 表的结构 `t_admin`
--

CREATE TABLE IF NOT EXISTS `t_admin` (
  `admin_id` int(11) NOT NULL,
  `admin_name` varchar(20) NOT NULL,
  `admin_pass` varchar(40) NOT NULL,
  PRIMARY KEY (`admin_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `t_admin`
--

INSERT INTO `t_admin` (`admin_id`, `admin_name`, `admin_pass`) VALUES
(1, 'admin', '123');

-- --------------------------------------------------------

--
-- 表的结构 `t_club`
--

CREATE TABLE IF NOT EXISTS `t_club` (
  `club_id` int(11) NOT NULL AUTO_INCREMENT,
  `club_name` varchar(20) NOT NULL,
  `club_introduce` text NOT NULL,
  `club_address` varchar(40) NOT NULL,
  `club_tel` varchar(40) NOT NULL,
  `club_time` varchar(40) NOT NULL,
  PRIMARY KEY (`club_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- 转存表中的数据 `t_club`
--

INSERT INTO `t_club` (`club_id`, `club_name`, `club_introduce`, `club_address`, `club_tel`, `club_time`) VALUES
(1, '计算机系16级跑步俱乐部', '“跑100个马拉松，不如带100个人跑马拉松。”这是跑团存在的意义之一。跑步，能改变一个人，让他变得积极，阳光。\r\n跑团口号：年轻就是跑。', '沈阳市皇姑区16号', '13042452368', '周一至周五8:00-20:00'),
(2, '东软游泳俱乐部', '一家进行游泳培训的专业俱乐部，拥有多名国家健将级运动员、教练员。', '大连市甘井子区东软信息学院', '13875117486', '周一至周六9:00-21:00'),
(3, '足球俱乐部', '是一家拥有自主研发足球培训教程的机构。从事青少年足球培训及组织国内外冬夏令营，同时承担亲子体育活动和青少年赛事。俱乐部秉承并致力于以足球运动为载体的完全人格的理想主义教育。', '张家口市中山街道168号', '15210825784', '周一至周日7:00-17:00');

-- --------------------------------------------------------

--
-- 表的结构 `t_clubadmin`
--

CREATE TABLE IF NOT EXISTS `t_clubadmin` (
  `clubadmin_id` int(11) NOT NULL,
  `clubadmin_name` varchar(20) NOT NULL,
  `clubadmin_pass` varchar(40) NOT NULL,
  `club_id` int(11) NOT NULL,
  PRIMARY KEY (`clubadmin_id`),
  KEY `club_id` (`club_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `t_clubadmin`
--

INSERT INTO `t_clubadmin` (`clubadmin_id`, `clubadmin_name`, `clubadmin_pass`, `club_id`) VALUES
(1, 'heyihang', '123', 1),
(2, 'jiazheyuan', '123', 2),
(3, 'zhangqiang', '123', 3);

-- --------------------------------------------------------

--
-- 表的结构 `t_coach`
--

CREATE TABLE IF NOT EXISTS `t_coach` (
  `coach_id` int(11) NOT NULL AUTO_INCREMENT,
  `coach_name` varchar(20) NOT NULL,
  `coach_pic` varchar(40) NOT NULL,
  `coach_gender` int(1) NOT NULL,
  `coach_introduce` text NOT NULL,
  `is_master` int(1) NOT NULL,
  `club_id` int(11) NOT NULL,
  PRIMARY KEY (`coach_id`),
  KEY `club_id` (`club_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- 转存表中的数据 `t_coach`
--

INSERT INTO `t_coach` (`coach_id`, `coach_name`, `coach_pic`, `coach_gender`, `coach_introduce`, `is_master`, `club_id`) VALUES
(1, '贾斯丁', '/images/引体向上.jpg', 1, 'xxxxxxxxxxxxxxx', 1, 1),
(2, '张大强', '/uploads\\20190712\\timg.jpg', 1, '进行的是一对一的工作，工作具有互动性、针对性等特点', 1, 1);

-- --------------------------------------------------------

--
-- 表的结构 `t_comment`
--

CREATE TABLE IF NOT EXISTS `t_comment` (
  `comment_id` int(11) NOT NULL AUTO_INCREMENT,
  `comment_text` text NOT NULL,
  `user_id` int(11) NOT NULL,
  `show_id` int(11) NOT NULL,
  PRIMARY KEY (`comment_id`),
  KEY `user_id` (`user_id`),
  KEY `show_id` (`show_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `t_course`
--

CREATE TABLE IF NOT EXISTS `t_course` (
  `course_id` int(11) NOT NULL AUTO_INCREMENT,
  `course_name` varchar(20) NOT NULL,
  `course_introduce` varchar(500) NOT NULL,
  `course_maxintro` text NOT NULL,
  `course_price` decimal(11,0) NOT NULL,
  `course_people` int(11) NOT NULL,
  `course_address` varchar(40) NOT NULL,
  `course_time` varchar(40) NOT NULL,
  `course_phonenum` varchar(40) NOT NULL,
  `is_froze` int(1) NOT NULL,
  `is_pass` int(1) NOT NULL,
  `club_id` int(11) NOT NULL,
  `coach_id` int(11) NOT NULL,
  PRIMARY KEY (`course_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- 转存表中的数据 `t_course`
--

INSERT INTO `t_course` (`course_id`, `course_name`, `course_introduce`, `course_maxintro`, `course_price`, `course_people`, `course_address`, `course_time`, `course_phonenum`, `is_froze`, `is_pass`, `club_id`, `coach_id`) VALUES
(1, '俯卧撑', '俯卧撑,常见的健身运动,有助于增加胸大肌锻炼效果', '俯卧撑,常见的健身运动有助于增加胸大肌锻炼效果 \r\n在日常锻炼和体育课上，特别是在军事体能训练中是一项基本训练。俯卧撑主要锻炼上肢、腰部及腹部的肌肉，尤其是胸肌。是很简单易行却十分有效的力量训练手段。初学者练习俯卧撑可以进行两组，每组15到20下；有一定基础的运动者则可做3组，每组20下；高水平人士可以尝试4组30到50下的俯卧撑锻炼。', '200', 200, '朱雀大街玄武胡同青龙院白虎号', '周一至周五早8：00至晚8：00', '130-7171-6060', 0, 0, 1, 1),
(2, '长跑', '长跑，消除不良情绪，提高新陈代谢', '引体向上，有时候简称引体，指依靠自身力量克服自身体重向上做功的垂吊练习。主要测试上肢肌肉力量的发展水平，以及臂力和腰腹力量，在完成一个完整的引体向上的过程中需要众多背部骨骼肌和上肢骨骼肌的共同参与做功，是一项多关节复合动作练习，是较好的锻炼上肢的方法，是所有发展背部骨骼肌肌力和肌耐力的练习方式中参与肌肉最多、运动模式最复杂、发展背部骨骼肌的肌力和肌耐力最有效的练习方式，是最基本的锻炼背部的方法，是中考和高中体育会考的考试选择项目之一，是衡量男性体质的重要参考标准和项目之一。', '220', 200, '朱雀大街玄武胡同青龙院白虎号', '周一至周五早8：00至晚8：00', '190-2121-3030', 0, 0, 1, 1);

-- --------------------------------------------------------

--
-- 表的结构 `t_match`
--

CREATE TABLE IF NOT EXISTS `t_match` (
  `match_id` int(11) NOT NULL AUTO_INCREMENT,
  `match_name` varchar(20) NOT NULL,
  `match_type` varchar(20) NOT NULL,
  `match_pic` varchar(40) NOT NULL,
  `match_introduce` text NOT NULL,
  `match_address` varchar(40) NOT NULL,
  `match_date` datetime NOT NULL,
  `match_limitpeople` int(11) NOT NULL,
  `match_people` int(11) NOT NULL,
  `match_reward` varchar(20) NOT NULL,
  PRIMARY KEY (`match_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `t_picture`
--

CREATE TABLE IF NOT EXISTS `t_picture` (
  `picture_id` int(11) NOT NULL AUTO_INCREMENT,
  `picture_address` varchar(100) NOT NULL,
  `gmt_create` datetime NOT NULL,
  `create_by` varchar(20) NOT NULL,
  `show_id` int(11) NOT NULL,
  PRIMARY KEY (`picture_id`),
  KEY `show_id` (`show_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- 转存表中的数据 `t_picture`
--

INSERT INTO `t_picture` (`picture_id`, `picture_address`, `gmt_create`, `create_by`, `show_id`) VALUES
(1, 'uploads/20190712/ca0df9f2e4da044684c347b2d8db960b.jpg', '2019-07-24 13:32:31', 'hhh', 1);

-- --------------------------------------------------------

--
-- 表的结构 `t_show`
--

CREATE TABLE IF NOT EXISTS `t_show` (
  `show_id` int(11) NOT NULL AUTO_INCREMENT,
  `show_name` varchar(20) NOT NULL,
  `gmt_create` datetime NOT NULL,
  `create_by` varchar(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`show_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- 转存表中的数据 `t_show`
--

INSERT INTO `t_show` (`show_id`, `show_name`, `gmt_create`, `create_by`, `user_id`) VALUES
(1, '贾哲远', '2019-09-02 00:00:00', 'hyh', 1);

-- --------------------------------------------------------

--
-- 表的结构 `t_train`
--

CREATE TABLE IF NOT EXISTS `t_train` (
  `train_id` int(11) NOT NULL AUTO_INCREMENT,
  `train_name` varchar(20) NOT NULL,
  `train_pic` varchar(200) NOT NULL,
  `train_minintro` varchar(500) NOT NULL,
  `train_introduce` text NOT NULL,
  `train_time` varchar(40) NOT NULL,
  `train_people` int(11) NOT NULL,
  `is_froze` int(1) NOT NULL,
  `club_id` int(11) NOT NULL,
  PRIMARY KEY (`train_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- 转存表中的数据 `t_train`
--

INSERT INTO `t_train` (`train_id`, `train_name`, `train_pic`, `train_minintro`, `train_introduce`, `train_time`, `train_people`, `is_froze`, `club_id`) VALUES
(1, '俯卧撑', '20190712\\15dc0c223e54f3d1e22864bf0aa9f8e9.png', '俯卧撑,常见的健身运动,有助于增加胸大肌锻炼效果', '俯卧撑,常见的健身运动有助于增加胸大肌锻炼效果 \r\n在日常锻炼和体育课上，特别是在军事体能训练中是一项基本训练。俯卧撑主要锻炼上肢、腰部及腹部的肌肉，尤其是胸肌。是很简单易行却十分有效的力量训练手段。初学者练习俯卧撑可以进行两组，每组15到20下；有一定基础的运动者则可做3组，每组20下；高水平人士可以尝试4组30到50下的俯卧撑锻炼。', '周一至周四早上八点到晚上八点', 200, 0, 1),
(2, '引体向上', '20190712\\f98f3b22ad11f67b46c83dda83008e86.jpg', '引体向上，指依靠自身力量克服自身体重向上做功的垂吊练习。', '引体向上，有时候简称引体，指依靠自身力量克服自身体重向上做功的垂吊练习。主要测试上肢肌肉力量的发展水平，以及臂力和腰腹力量，在完成一个完整的引体向上的过程中需要众多背部骨骼肌和上肢骨骼肌的共同参与做功，是一项多关节复合动作练习，是较好的锻炼上肢的方法，是所有发展背部骨骼肌肌力和肌耐力的练习方式中参与肌肉最多、运动模式最复杂、发展背部骨骼肌的肌力和肌耐力最有效的练习方式，是最基本的锻炼背部的方法，是中考和高中体育会考的考试选择项目之一，是衡量男性体质的重要参考标准和项目之一。', '周一至周四早上九点到晚上八点', 200, 0, 1);

-- --------------------------------------------------------

--
-- 表的结构 `t_user`
--

CREATE TABLE IF NOT EXISTS `t_user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(20) NOT NULL,
  `user_pass` varchar(20) NOT NULL,
  `user_realname` varchar(20) NOT NULL,
  `user_pic` varchar(40) NOT NULL,
  `user_gender` int(1) NOT NULL,
  `user_age` int(3) NOT NULL,
  `is_froze` int(1) NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=11 ;

--
-- 转存表中的数据 `t_user`
--

INSERT INTO `t_user` (`user_id`, `user_name`, `user_pass`, `user_realname`, `user_pic`, `user_gender`, `user_age`, `is_froze`) VALUES
(1, 'Jia', '123', '贾斯丁', '/images/touxiang0.jpg', 1, 21, 0),
(2, 'Zhang', '123', '张百忍', '/images/touxiang1.jpg', 0, 20, 0),
(3, 'He', '123456', '何仙姑', '/images/touxiang2.jpeg', 0, 18, 0),
(4, 'Liang', '123', '梁启超', '/images/touxiang1.jpg', 1, 100, 0),
(5, 'He', '43944264', '何仙姑', '/images/touxiang2.jpeg', 0, 18, 0),
(6, 'He', '123456', '何仙姑', '/images/touxiang2.jpeg', 0, 18, 0),
(7, 'He', '123456', '何仙姑', '/images/touxiang2.jpeg', 0, 18, 0),
(8, 'He', '123456', '何仙姑', '/images/touxiang2.jpeg', 0, 18, 0),
(9, 'He', '123456', '何仙姑', '/images/touxiang2.jpeg', 0, 18, 0),
(10, 'He', '123456', '何仙姑', '/images/touxiang2.jpeg', 0, 18, 0);

-- --------------------------------------------------------

--
-- 表的结构 `t_user_activity`
--

CREATE TABLE IF NOT EXISTS `t_user_activity` (
  `ua_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `activity_id` int(11) NOT NULL,
  PRIMARY KEY (`ua_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- 转存表中的数据 `t_user_activity`
--

INSERT INTO `t_user_activity` (`ua_id`, `user_id`, `activity_id`) VALUES
(1, 3, 2);

-- --------------------------------------------------------

--
-- 表的结构 `t_user_club`
--

CREATE TABLE IF NOT EXISTS `t_user_club` (
  `uclub_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `club_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`uclub_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=9 ;

--
-- 转存表中的数据 `t_user_club`
--

INSERT INTO `t_user_club` (`uclub_id`, `user_id`, `club_id`) VALUES
(1, 3, 1),
(2, 4, 1),
(3, 5, 1),
(4, 6, 1),
(5, 7, 1),
(6, 8, 1),
(7, 9, 1),
(8, 10, 1);

-- --------------------------------------------------------

--
-- 表的结构 `t_user_course`
--

CREATE TABLE IF NOT EXISTS `t_user_course` (
  `uc_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `course_id` int(11) NOT NULL,
  PRIMARY KEY (`uc_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `t_user_match`
--

CREATE TABLE IF NOT EXISTS `t_user_match` (
  `um_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `match_id` int(11) NOT NULL,
  PRIMARY KEY (`um_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `t_user_train`
--

CREATE TABLE IF NOT EXISTS `t_user_train` (
  `ut_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `train_id` int(11) NOT NULL,
  PRIMARY KEY (`ut_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `t_video`
--

CREATE TABLE IF NOT EXISTS `t_video` (
  `video_id` int(11) NOT NULL AUTO_INCREMENT,
  `video_name` varchar(20) NOT NULL,
  `video_address` varchar(300) NOT NULL,
  `train_id` int(11) NOT NULL,
  PRIMARY KEY (`video_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- 转存表中的数据 `t_video`
--

INSERT INTO `t_video` (`video_id`, `video_name`, `video_address`, `train_id`) VALUES
(1, '俯卧撑01', '20190712\\3c571c558f43c70293a4fc2271d2650a.mp4', 1),
(2, '引体向上01', '20190712\\d638ad3e5c30b563cb1b4cc0ecde3974.mp4', 2);

--
-- 限制导出的表
--

--
-- 限制表 `t_clubadmin`
--
ALTER TABLE `t_clubadmin`
  ADD CONSTRAINT `t_clubadmin_ibfk_1` FOREIGN KEY (`club_id`) REFERENCES `t_club` (`club_id`);

--
-- 限制表 `t_coach`
--
ALTER TABLE `t_coach`
  ADD CONSTRAINT `club_id` FOREIGN KEY (`club_id`) REFERENCES `t_club` (`club_id`);

--
-- 限制表 `t_comment`
--
ALTER TABLE `t_comment`
  ADD CONSTRAINT `t_comment_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `t_user` (`user_id`),
  ADD CONSTRAINT `t_comment_ibfk_2` FOREIGN KEY (`show_id`) REFERENCES `t_show` (`show_id`);

--
-- 限制表 `t_show`
--
ALTER TABLE `t_show`
  ADD CONSTRAINT `user_id` FOREIGN KEY (`user_id`) REFERENCES `t_user` (`user_id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
