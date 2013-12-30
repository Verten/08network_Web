/*
MySQL Data Transfer
Source Host: localhost
Source Database: 08network
Target Host: localhost
Target Database: 08network
Date: 2013/12/30 15:40:29
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for network_wei_blog
-- ----------------------------
CREATE TABLE `network_wei_blog` (
  `id` int(5) NOT NULL auto_increment,
  `blog_title` varchar(255) NOT NULL,
  `blog_content` varchar(255) NOT NULL,
  `blog_user` varchar(100) NOT NULL,
  `blog_date` date NOT NULL,
  `blog_up_count` int(10) default NULL,
  `blog_down_count` int(10) default NULL,
  `remark` varchar(255) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for network_wei_comment
-- ----------------------------
CREATE TABLE `network_wei_comment` (
  `id` int(10) NOT NULL auto_increment,
  `comment_user` varchar(100) NOT NULL,
  `comment_content` varchar(255) NOT NULL,
  `comment_date` timestamp NOT NULL default '0000-00-00 00:00:00' on update CURRENT_TIMESTAMP,
  `blog_id` int(10) NOT NULL,
  `remark` varchar(255) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for network_wei_user
-- ----------------------------
CREATE TABLE `network_wei_user` (
  `id` int(10) NOT NULL auto_increment,
  `username` varchar(40) NOT NULL,
  `password` varchar(40) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records 
-- ----------------------------
INSERT INTO `network_wei_blog` VALUES ('1', '11111', '11111', '2008045143035', '2013-06-24', '0', '0', null);
INSERT INTO `network_wei_blog` VALUES ('2', '1111111', '1111111', '2008045143035', '2013-06-24', '19', '0', null);
INSERT INTO `network_wei_blog` VALUES ('3', '测试成功？', '测试成功？', '2008045143035', '2013-06-24', '4', '0', null);
INSERT INTO `network_wei_blog` VALUES ('4', '#新手卡#《洛奇英雄传》新篇章“时光沙漠”开测！领取《洛奇英雄传》新浪时光沙漠礼包：http://t.cn/zQ5zDZN【奖励道具】生命恢复药水*20；佣兵团高级疲劳恢复药水（赠送）*3；女神的羽毛*3；经验值航海祝福石*3；内衣自由使用券7天*1；发型自由使用券7天*1；守护的铜项链*1', '#新手卡#《洛奇英雄传》新篇章“时光沙漠”开测！领取《洛奇英雄传》新浪时光沙漠礼包：http://t.cn/zQ5zDZN【奖励道具】生命恢复药水*20；佣兵团高级疲劳恢复药水（赠送）*3；女神的羽毛*3；经验值航海祝福石*3；内衣自由使用券7天*1；发型自由使用券7天*1；守护的铜项链*1', '2008045143035', '2013-07-19', '0', '0', null);
INSERT INTO `network_wei_blog` VALUES ('5', '1985年，一架48年前由菲律宾飞往民琴那峨岛失踪了半个世纪的客机，在新几内亚的沼泽内被发现。更令人无法理解的是，这架飞机看来就像它失踪时一样簇新。在机舱内找到的报纸，日期是1937年1 月的第3个星期日，保温瓶内还有滚烫的咖啡，味道完全没变电池仍充满电，调查人员无不悚然。@999个未解之谜', '1985年，一架48年前由菲律宾飞往民琴那峨岛失踪了半个世纪的客机，在新几内亚的沼泽内被发现。更令人无法理解的是，这架飞机看来就像它失踪时一样簇新。在机舱内找到的报纸，日期是1937年1 月的第3个星期日，保温瓶内还有滚烫的咖啡，味道完全没变电池仍充满电，调查人员无不悚然。@999个未解之谜', '2008045143035', '2013-07-19', '0', '0', null);
INSERT INTO `network_wei_blog` VALUES ('6', '【推荐！28个超酷的单色背景网页设计欣赏】每个设计师在成长的过程中，在配色上肯定有被同事喷过。你的网站给人的第一感觉怎样，色彩可以说起着决定性作用，今天在这里欣赏一些单色背景的网页，看它们是怎样让我们眼前一亮的。', '【推荐！28个超酷的单色背景网页设计欣赏】每个设计师在成长的过程中，在配色上肯定有被同事喷过。你的网站给人的第一感觉怎样，色彩可以说起着决定性作用，今天在这里欣赏一些单色背景的网页，看它们是怎样让我们眼前一亮的。', '2008045143035', '2013-07-19', '0', '0', null);
INSERT INTO `network_wei_blog` VALUES ('7', '#他们是在排队买雪糕吗？#最近，有人问蜀黍：这车一停，就有很多人围上来，这大热天的，他们是不是在排队买雪糕和汽水啊？蜀黍非常严肃地告诉大家，这是蜀黍的车管e站啊！是一个流动的@深圳交警车管所 ，是为大家上门办理车驾管业务的！！！卖什么雪糕啊！！！卖什么汽水啊！！！卖什么卖啊！！！', '#他们是在排队买雪糕吗？#最近，有人问蜀黍：这车一停，就有很多人围上来，这大热天的，他们是不是在排队买雪糕和汽水啊？蜀黍非常严肃地告诉大家，这是蜀黍的车管e站啊！是一个流动的@深圳交警车管所 ，是为大家上门办理车驾管业务的！！！卖什么雪糕啊！！！卖什么汽水啊！！！卖什么卖啊！！！', '2008045143035', '2013-07-19', '0', '0', null);
INSERT INTO `network_wei_blog` VALUES ('8', '【强烈推荐！50个Photoshop人像处理精品教程】@南辰_designer 你是否经常会有这种感觉？当你坐下来在电脑上观察你拍摄的照片时，你会发现照片并不像拍摄时的真实场景那样吸引你。今天为大家带来50个人像修饰教程，让你在实践中学习到PS强大的技巧，你可以按照步骤一步一步来！→http://t.cn/zHkGNVh', '【强烈推荐！50个Photoshop人像处理精品教程】@南辰_designer 你是否经常会有这种感觉？当你坐下来在电脑上观察你拍摄的照片时，你会发现照片并不像拍摄时的真实场景那样吸引你。今天为大家带来50个人像修饰教程，让你在实践中学习到PS强大的技巧，你可以按照步骤一步一步来！→http://t.cn/zHkGNVh', '2008045143035', '2013-07-19', '0', '0', null);
INSERT INTO `network_wei_blog` VALUES ('9', '不许黑大皇军。在电影《小兵张嘎》中，小兵张嘎在路边摆摊卖瓜，看到皇军胖翻译官走来，没有拔腿就跑，反而大声吆喝。胖翻译官只是蹲下来吃了只西瓜，一没有驱赶，二没有收苛捐杂税，更没有把卖瓜者殴打致死然后抢夺尸体。//@互联网的那点事: 皇军都不敢这么干！', '不许黑大皇军。在电影《小兵张嘎》中，小兵张嘎在路边摆摊卖瓜，看到皇军胖翻译官走来，没有拔腿就跑，反而大声吆喝。胖翻译官只是蹲下来吃了只西瓜，一没有驱赶，二没有收苛捐杂税，更没有把卖瓜者殴打致死然后抢夺尸体。//@互联网的那点事: 皇军都不敢这么干！', '2008045143035', '2013-07-19', '17', '0', null);
INSERT INTO `network_wei_blog` VALUES ('10', '我就是瓜农邓正加的女儿邓艳玲，现在临武所有参与将我父亲的事情发微博和其他论坛的，逐渐被叫去谈话，要求停止转发与评论。昨天尸检解剖出来颅内大量瘀血，并伴有头皮下出血，但是政府正着手掩盖事实，我父亲“被”心脏病或者其他突发性疾病，政府这样的做法是我们完全不能接受的！！！！！', '我就是瓜农邓正加的女儿邓艳玲，现在临武所有参与将我父亲的事情发微博和其他论坛的，逐渐被叫去谈话，要求停止转发与评论。昨天尸检解剖出来颅内大量瘀血，并伴有头皮下出血，但是政府正着手掩盖事实，我父亲“被”心脏病或者其他突发性疾病，政府这样的做法是我们完全不能接受的！！！！！', '2008045143035', '2013-07-19', '0', '0', null);
INSERT INTO `network_wei_blog` VALUES ('11', '1626年，北京宣武门一带发生了一场惨重的灾变。5.20日早上忽震一声，昏黑如夜。顺城门大街至刑部街，上万间房屋，数万人成粉碎状，瓦砾盈空而下，人头及臂、腿等纷纷从空中落下。街面上碎尸杂叠，血腥味浓；人亡惨痛，驴马鸡亦同。详情可百度，至今仍无科学定论！★神秘，我们正在解释★@神秘震惊事件', '1626年，北京宣武门一带发生了一场惨重的灾变。5.20日早上忽震一声，昏黑如夜。顺城门大街至刑部街，上万间房屋，数万人成粉碎状，瓦砾盈空而下，人头及臂、腿等纷纷从空中落下。街面上碎尸杂叠，血腥味浓；人亡惨痛，驴马鸡亦同。详情可百度，至今仍无科学定论！★神秘，我们正在解释★@神秘震惊事件', '2008045143035', '2013-07-19', '0', '0', null);
INSERT INTO `network_wei_blog` VALUES ('12', '【iPhone播放音乐会跟着一起动的智能摇篮】4moms率先推出了一款能根据iPhone等移动设备播放音乐而摇摆的智能摇篮。这款名为mamaRoo的摇篮内置3.5mm音频接口，可支持多种音频设备的Line-in输入。mamaRoo喇叭声音非常轻柔，很适合婴幼儿使用。有了mamaRoo，宝宝们可以听着更多音乐和有声读物入睡了。', '【iPhone播放音乐会跟着一起动的智能摇篮】4moms率先推出了一款能根据iPhone等移动设备播放音乐而摇摆的智能摇篮。这款名为mamaRoo的摇篮内置3.5mm音频接口，可支持多种音频设备的Line-in输入。mamaRoo喇叭声音非常轻柔，很适合婴幼儿使用。有了mamaRoo，宝宝们可以听着更多音乐和有声读物入睡了。', '2008045143035', '2013-07-19', '0', '0', null);
INSERT INTO `network_wei_blog` VALUES ('13', '智讯互动，在社会化的新环境下，依靠技术的融合改变营销行业的未来，期待您的加入！GEEK、IT工程师、设计师、创意疯子、互联网狂热爱好者，用户体验控... 我们期待着一颗改变世界的心，来吧。。。', '智讯互动，在社会化的新环境下，依靠技术的融合改变营销行业的未来，期待您的加入！GEEK、IT工程师、设计师、创意疯子、互联网狂热爱好者，用户体验控... 我们期待着一颗改变世界的心，来吧。。。', '2008045143035', '2013-07-19', '0', '0', null);
INSERT INTO `network_wei_blog` VALUES ('14', '弟子问：＂师父您有时候打人、骂人；有时候对人又彬彬有礼，这里面有什么玄机吗？＂ 师父说：对待上等人直指人心，可打可骂，以真面目待他；对待中等人最多隐喻他，要讲分寸，他受不起打骂；对待下等人要面带微笑，双手合十，他很脆弱、心眼小，装不下太多指责和训斥，他只配用世俗的礼节！（转）', '弟子问：＂师父您有时候打人、骂人；有时候对人又彬彬有礼，这里面有什么玄机吗？＂ 师父说：对待上等人直指人心，可打可骂，以真面目待他；对待中等人最多隐喻他，要讲分寸，他受不起打骂；对待下等人要面带微笑，双手合十，他很脆弱、心眼小，装不下太多指责和训斥，他只配用世俗的礼节！（转）', '2008045143035', '2013-07-19', '0', '0', null);
INSERT INTO `network_wei_blog` VALUES ('15', '即日起至7/26中午12:00在话题#虫群之心好玩吗#里留下评价，我们将选出10名最言之有物的玩家赠送虫群之心Tshirt一件。同时从中选出3名上海玩家，参加7/27在上海的“直面大维京”玩家座谈会，与David Kim面对面，畅谈虫群之心。除了Tshirt，与会的玩家也将获得David Kim签名的虫群之心海报和DVD。', '即日起至7/26中午12:00在话题#虫群之心好玩吗#里留下评价，我们将选出10名最言之有物的玩家赠送虫群之心Tshirt一件。同时从中选出3名上海玩家，参加7/27在上海的“直面大维京”玩家座谈会，与David Kim面对面，畅谈虫群之心。除了Tshirt，与会的玩家也将获得David Kim签名的虫群之心海报和DVD。', '2008045143035', '2013-07-19', '0', '2', null);
INSERT INTO `network_wei_comment` VALUES ('1', '2008045143001', '....', '2013-06-24 14:50:11', '3', null);
INSERT INTO `network_wei_comment` VALUES ('2', '2008045143001', '444444444', '2013-06-24 14:50:43', '2', null);
INSERT INTO `network_wei_comment` VALUES ('3', '2008045143001', '11111', '2013-06-24 14:53:00', '3', null);
INSERT INTO `network_wei_comment` VALUES ('4', '2008045143001', '44444444444', '2013-06-24 14:53:26', '1', null);
INSERT INTO `network_wei_comment` VALUES ('5', '2008045143001', '1111', '2013-06-24 14:58:07', '3', null);
INSERT INTO `network_wei_comment` VALUES ('6', '2008045143001', 'wocao~', '2013-06-24 14:58:23', '1', null);
INSERT INTO `network_wei_comment` VALUES ('7', '2008045143035', 'Yooooooooo', '2013-07-24 21:46:23', '15', null);
INSERT INTO `network_wei_user` VALUES ('41', '2008045143001', '48c4e3ce7a09daed3855f06cac051eff');
INSERT INTO `network_wei_user` VALUES ('42', '2008045143002', '6c6ebc8c8a69ec2c53427476e6587663');
INSERT INTO `network_wei_user` VALUES ('43', '2008045143003', 'a9ebef13d616940a9cb4df707b858d2e');
INSERT INTO `network_wei_user` VALUES ('44', '2008045143004', '89c70bebbd82e2851a6d6f97365bcd19');
INSERT INTO `network_wei_user` VALUES ('45', '2008045143005', '0cab7aa4710acdc14f760fee514d6708');
INSERT INTO `network_wei_user` VALUES ('46', '2008045143006', 'e3c1ce7dd02b2c104dd6a97f36d637f7');
INSERT INTO `network_wei_user` VALUES ('47', '2008045143007', 'ac84a989ab777218a12e8577d721fb64');
INSERT INTO `network_wei_user` VALUES ('48', '2008045143008', '2867f560f52fb6370e008f99d24a71d0');
INSERT INTO `network_wei_user` VALUES ('49', '2008045143009', 'f7a728ffa7c643d1acf965a1de2ed7b4');
INSERT INTO `network_wei_user` VALUES ('50', '2008045143010', 'fdadfb4aa9ecd0d788bbb8a8a86e6ab6');
INSERT INTO `network_wei_user` VALUES ('51', '2008045143011', '83ce0da2936c1417a5252662ab2cd244');
INSERT INTO `network_wei_user` VALUES ('52', '2008045143012', 'eaeec96850acb92a828d0589c97ef8d6');
INSERT INTO `network_wei_user` VALUES ('53', '2008045143013', '91af2298763cb939f679f693232450b6');
INSERT INTO `network_wei_user` VALUES ('54', '2008045143014', 'b289574610c762bd83f73ae16d36ff06');
INSERT INTO `network_wei_user` VALUES ('55', '2008045143015', '764593a79ed6d531097171cd1eef6041');
INSERT INTO `network_wei_user` VALUES ('56', '2008045143016', '0436d14a28a4a60716986a9425650bc4');
INSERT INTO `network_wei_user` VALUES ('57', '2008045143017', 'cb578f7dcc33ca042ef2bed0d4cb6a90');
INSERT INTO `network_wei_user` VALUES ('58', '2008045143018', 'ab5746023a8f8c1cc68126a9ad94a3b2');
INSERT INTO `network_wei_user` VALUES ('59', '2008045143019', '332b5b001b40a884daadf90918a2bcc0');
INSERT INTO `network_wei_user` VALUES ('60', '2008045143020', '28ee2caceb784f85a2e0d6806812574d');
INSERT INTO `network_wei_user` VALUES ('61', '2008045143021', 'b64045939e39c9f39ec665648c5ab8b9');
INSERT INTO `network_wei_user` VALUES ('62', '2008045143022', '6ffded2265e1e94d595a6258ce97dbf1');
INSERT INTO `network_wei_user` VALUES ('63', '2008045143023', '782d8c550ab2e9eb5a26c6a3d0f2fbfa');
INSERT INTO `network_wei_user` VALUES ('64', '2008045143024', '197de4a0d1a257dd45765a837cadfbb9');
INSERT INTO `network_wei_user` VALUES ('65', '2008045143025', 'fa913b933fa0950a63b9edd1f1b19400');
INSERT INTO `network_wei_user` VALUES ('66', '2008045143026', '05c9c74cb48191aaecd34e0eb4541086');
INSERT INTO `network_wei_user` VALUES ('67', '2008045143027', '4db6fda47aca083063cc44483282598c');
INSERT INTO `network_wei_user` VALUES ('68', '2008045143028', '0bae92a4b4f64670e23acd8967526b84');
INSERT INTO `network_wei_user` VALUES ('69', '2008045143029', '5c8591cf1242920e1f4a8fbb950e4a11');
INSERT INTO `network_wei_user` VALUES ('70', '2008045143030', '5a26bcaea0164725e5513100f04f2067');
INSERT INTO `network_wei_user` VALUES ('71', '2008045143031', '9394b49a655a86e3bd3049bf55e3fc30');
INSERT INTO `network_wei_user` VALUES ('72', '2008045143032', '3c8381d5727ebffdeba1ea7471f99c2e');
INSERT INTO `network_wei_user` VALUES ('73', '2008045143033', 'cda0776146423532bd2c0739633589de');
INSERT INTO `network_wei_user` VALUES ('74', '2008045143034', 'a90f16f2542db7ffef7f333467b0a7a5');
INSERT INTO `network_wei_user` VALUES ('75', '2008045143035', '53cccf802b28fb23f8a9c8db7fe9d60c');
INSERT INTO `network_wei_user` VALUES ('76', '2008045143036', '05e1fdc8032c9b587788a4594161df65');
INSERT INTO `network_wei_user` VALUES ('77', '2008045143037', '4d25992f1a36b611bfebac35b59f3071');
INSERT INTO `network_wei_user` VALUES ('78', '2008045143038', '2bfd1a2d965c0b5926759c728aede4fd');
INSERT INTO `network_wei_user` VALUES ('79', '2008045143039', '93b5b484e679d7a966b4803e1a7ab563');
INSERT INTO `network_wei_user` VALUES ('80', '2008045143040', '68a501b91d4881a972c38feb45cc3989');
