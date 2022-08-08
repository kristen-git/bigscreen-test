drop database screen;

create database screen;

use screen;

-- 银行 信息表
drop table if exists bank;
create table bank(
      id int primary key,
	  name varchar(20) not null
);
alter table bank add unique index(name);

-- ETC 统计信息表
create table etc_monthly_volume(
      id int primary key auto_increment,
	  province_id int not null,
	  branch_id int not null,
	  month varchar(20)  not null,
	  volume int
);
alter table etc_monthly_volume add unique index(province_id, branch_id,month);

-- 信用卡开户、激活统计信息
create table credit_card_monthly_volume(
      id int primary key auto_increment,
   province_id int not null,
   branch_id int not null,
   month varchar(20)  not null,
   card_capacity int,
   active_capacity int
);
alter table credit_card_monthly_volume add unique index(province_id, branch_id,month);


INSERT INTO `bank` (`id`,`name`) 
	VALUES (1,'北京'),(2,'天津'),(3,'河北'),(4,'山西'),(5,'内蒙'),(6,'辽宁'),(7,'吉林'),
	(8,'黑龙江'),(9,'上海'),(10,'江苏'),(11,'浙江'),(12,'安徽'),(13,'福建'),(14,'江西'),(15,'山东'),
	(16,'河南'),(17,'湖北'),(18,'湖南'),(19,'广东'),(20,'广西'),(21,'重庆'),(22,'四川'),
	(23,'贵州'),(24,'云南'),(25,'陕西'),(26,'甘肃'),(27,'青海'),(28,'宁夏'),(29,'新疆');

INSERT INTO `etc_monthly_volume` (`id`,`province_id`,`branch_id`,`month`,`volume`) 
	VALUES (1,1100,1,'201901',3763),(2,1100,1,'201902',1268),(3,1100,1,'201903',1880),
	(4,1100,1,'201904',1697),(5,1100,1,'201905',1632),(6,1100,1,'201906',2350),
	(7,1100,1,'201907',2120),(8,1100,1,'201908',2281),(9,1100,1,'201909',1061),
	(10,1200,2,'201901',163),(11,1200,2,'201902',120),(12,1200,2,'201903',731),
	(13,1200,2,'201904',2478),(14,1200,2,'201905',11410),(15,1200,2,'201906',15922),
	(16,1200,2,'201907',7975),(17,1200,2,'201908',7581),(18,1200,2,'201909',3233),
	(19,1300,3,'201901',18799),(20,1300,3,'201902',10245),(21,1300,3,'201903',22509),
	(22,1300,3,'201904',18006),(23,1300,3,'201905',30584),(24,1300,3,'201906',86206),
	(25,1300,3,'201907',162319),(26,1300,3,'201908',227737),(27,1300,3,'201909',75108),
	(28,1400,4,'201901',11355),(29,1400,4,'201902',6381),(30,1400,4,'201903',12687),
	(31,1400,4,'201904',10016),(32,1400,4,'201905',10167),(33,1400,4,'201906',12468),
	(34,1400,4,'201907',15286),(35,1400,4,'201908',11952),(36,1400,4,'201909',3849),
	(37,1500,5,'201901',390),(38,1500,5,'201902',549),(39,1500,5,'201903',803),
	(40,1500,5,'201904',271),(41,1500,5,'201905',11),(42,1500,5,'201906',7),
	(43,1500,5,'201907',237),(44,1500,5,'201908',5188),(45,1500,5,'201909',4037),
	(46,2100,6,'201901',3630),(47,2100,6,'201902',1284),(48,2100,6,'201903',4051),
	(49,2100,6,'201904',4387),(50,2100,6,'201905',11530),(51,2100,6,'201906',17514),
	(52,2100,6,'201907',20986),(53,2100,6,'201908',18216),(54,2100,6,'201909',8744),
	(55,2200,7,'201901',2940),(56,2200,7,'201902',813),(57,2200,7,'201903',882),
	(58,2200,7,'201904',986),(59,2200,7,'201905',2874),(60,2200,7,'201906',8827),
	(61,2200,7,'201907',13010),(62,2200,7,'201908',8127),(63,2200,7,'201909',3404),
	(64,2300,8,'201901',4906),(65,2300,8,'201902',2578),(66,2300,8,'201903',5040),
	(67,2300,8,'201904',4471),(68,2300,8,'201905',5345),(69,2300,8,'201906',5829),
	(70,2300,8,'201907',7642),(71,2300,8,'201908',7000),(72,2300,8,'201909',5329),
	(73,3100,9,'201901',2598),(74,3100,9,'201902',618),(75,3100,9,'201903',872),
	(76,3100,9,'201904',746),(77,3100,9,'201905',672),(78,3100,9,'201906',813),
	(79,3100,9,'201907',586),(80,3100,9,'201908',485),(81,3100,9,'201909',167),
	(82,3200,10,'201901',4855),(83,3200,10,'201902',10276),(84,3200,10,'201903',1518),
	(85,3200,10,'201904',9410),(86,3200,10,'201905',7408),(87,3200,10,'201906',10992),
	(88,3200,10,'201907',14619),(89,3200,10,'201908',63868),(90,3200,10,'201909',64283),
	(91,3300,11,'201901',39014),(92,3300,11,'201902',5992),(93,3300,11,'201903',8412),
	(94,3300,11,'201904',6716),(95,3300,11,'201905',13141),(96,3300,11,'201906',43370),
	(97,3300,11,'201907',65713),(98,3300,11,'201908',37237),(99,3300,11,'201909',14537),
	(100,3400,12,'201901',9722),(101,3400,12,'201902',7879),(102,3400,12,'201903',5815),
	(103,3400,12,'201904',6692),(104,3400,12,'201905',12949),(105,3400,12,'201906',25709),
	(106,3400,12,'201907',82237),(107,3400,12,'201908',64003),(108,3400,12,'201909',26107),
	(109,3500,13,'201901',22947),(110,3500,13,'201902',8033),(111,3500,13,'201903',9379),
	(112,3500,13,'201904',10737),(113,3500,13,'201905',13240),(114,3500,13,'201906',26181),
	(115,3500,13,'201907',27986),(116,3500,13,'201908',24207),(117,3500,13,'201909',10766),
	(118,3600,14,'201901',690),(119,3600,14,'201902',285),(120,3600,14,'201903',407),
	(121,3600,14,'201904',884),(122,3600,14,'201905',1845),(123,3600,14,'201906',6494),
	(124,3600,14,'201907',73240),(125,3600,14,'201908',48852),(126,3600,14,'201909',12770),
	(127,3700,15,'201901',12577),(128,3700,15,'201902',2773),(129,3700,15,'201903',3570),
	(130,3700,15,'201904',3150),(131,3700,15,'201905',5778),(132,3700,15,'201906',6014),
	(133,3700,15,'201907',24689),(134,3700,15,'201908',12207),(135,3700,15,'201909',3222),
	(136,4100,16,'201901',6392),(137,4100,16,'201902',2455),(138,4100,16,'201903',2769),
	(139,4100,16,'201904',2644),(140,4100,16,'201905',54682),(141,4100,16,'201906',35791),
	(142,4100,16,'201907',130761),(143,4100,16,'201908',175601),(144,4100,16,'201909',102838),
	(145,4200,17,'201901',16980),(146,4200,17,'201902',9411),(147,4200,17,'201903',11519),
	(148,4200,17,'201904',12151),(149,4200,17,'201905',13292),(150,4200,17,'201906',21909),
	(151,4200,17,'201907',51913),(152,4200,17,'201908',53754),(153,4200,17,'201909',19657),
	(154,4300,18,'201901',15907),(155,4300,18,'201902',8936),(156,4300,18,'201903',6522),
	(157,4300,18,'201904',7354),(158,4300,18,'201905',16340),(159,4300,18,'201906',32756),
	(160,4300,18,'201907',43083),(161,4300,18,'201908',85949),(162,4300,18,'201909',168136),
	(163,4400,19,'201901',0),(164,4400,19,'201902',0),(165,4400,19,'201903',0),
	(166,4400,19,'201904',0),(167,4400,19,'201905',0),(168,4400,19,'201906',0),
	(169,4400,19,'201907',0),(170,4400,19,'201908',12392),(171,4400,19,'201909',26193),
	(172,4500,20,'201901',1630),(173,4500,20,'201902',1174),(174,4500,20,'201903',2799),
	(175,4500,20,'201904',3503),(176,4500,20,'201905',3767),(177,4500,20,'201906',4274),
	(178,4500,20,'201907',3652),(179,4500,20,'201908',3803),(180,4500,20,'201909',1133),
	(181,5000,21,'201901',19591),(182,5000,21,'201902',14322),(183,5000,21,'201903',9728),
	(184,5000,21,'201904',6294),(185,5000,21,'201905',9379),(186,5000,21,'201906',14730),
	(187,5000,21,'201907',6470),(188,5000,21,'201908',16599),(189,5000,21,'201909',7729),
	(190,5100,22,'201901',34975),(191,5100,22,'201902',23143),(192,5100,22,'201903',24287),
	(193,5100,22,'201904',18655),(194,5100,22,'201905',32700),(195,5100,22,'201906',59674),
	(196,5100,22,'201907',67595),(197,5100,22,'201908',76307),(198,5100,22,'201909',57869),
	(199,5200,23,'201901',466),(200,5200,23,'201902',270),(201,5200,23,'201903',422),
	(202,5200,23,'201904',614),(203,5200,23,'201905',607),(204,5200,23,'201906',2222),
	(205,5200,23,'201907',6483),(206,5200,23,'201908',4541),(207,5200,23,'201909',1352),
	(208,5300,24,'201901',0),(209,5300,24,'201902',0),(210,5300,24,'201903',0),
	(211,5300,24,'201904',285),(212,5300,24,'201905',9315),(213,5300,24,'201906',10711),
	(214,5300,24,'201907',9018),(215,5300,24,'201908',7719),(216,5300,24,'201909',3532),
	(217,6100,25,'201901',708),(218,6100,25,'201902',656),(219,6100,25,'201903',1413),
	(220,6100,25,'201904',1997),(221,6100,25,'201905',3276),(222,6100,25,'201906',2055),
	(223,6100,25,'201907',2407),(224,6100,25,'201908',2150),(225,6100,25,'201909',1483),
	(226,6200,26,'201901',6648),(227,6200,26,'201902',2872),(228,6200,26,'201903',6618),
	(229,6200,26,'201904',4407),(230,6200,26,'201905',3216),(231,6200,26,'201906',5102),
	(232,6200,26,'201907',13629),(233,6200,26,'201908',9600),(234,6200,26,'201909',1655),
	(235,6300,27,'201901',140),(236,6300,27,'201902',69),(237,6300,27,'201903',94),
	(238,6300,27,'201904',59),(239,6300,27,'201905',90),(240,6300,27,'201906',114),
	(241,6300,27,'201907',1222),(242,6300,27,'201908',5037),(243,6300,27,'201909',2762),
	(244,6400,28,'201901',0),(245,6400,28,'201902',0),(246,6400,28,'201903',0),
	(247,6400,28,'201904',0),(248,6400,28,'201905',0),(249,6400,28,'201906',1),
	(250,6400,28,'201907',482),(251,6400,28,'201908',6175),(252,6400,28,'201909',2177),
	(253,6500,29,'201901',5298),(254,6500,29,'201902',1440),(255,6500,29,'201903',2556),
	(256,6500,29,'201904',1841),(257,6500,29,'201905',2486),(258,6500,29,'201906',4194),
	(259,6500,29,'201907',7252),(260,6500,29,'201908',8029),(261,6500,29,'201909',6460);
	
INSERT INTO `credit_card_monthly_volume` (`province_id`,`branch_id`,`month`,`card_capacity`,`active_capacity`) VALUES 
(6500,29,'201901',1316,1264),(6500,29,'201902',1404,1080),(6500,29,'201903',2320,2121),(6500,29,'201904',1944,2281),
(6500,29,'201905',1893,1784),(6500,29,'201906',1318,1545),(6500,29,'201907',1526,1796),(6500,29,'201908',1335,1511),
(6400,28,'201901',507,577),(6400,28,'201902',508,410),(6400,28,'201903',412,625),(6400,28,'201904',581,498),
(6400,28,'201905',388,434),(6400,28,'201906',101,202),(6400,28,'201907',434,233),(6400,28,'201908',355,565),
(6300,27,'201901',152,177),(6300,27,'201902',122,103),(6300,27,'201903',152,196),(6300,27,'201904',159,148),
(6300,27,'201905',195,162),(6300,27,'201906',186,174),(6300,27,'201907',185,216),(6300,27,'201908',159,180),
(6200,26,'201901',2048,2321),(6200,26,'201902',1326,1263),(6200,26,'201903',2289,2335),(6200,26,'201904',1770,2013),
(6200,26,'201905',1985,1857),(6200,26,'201906',1503,1533),(6200,26,'201907',2177,2250),(6200,26,'201908',1954,2255),
(6100,25,'201901',1607,1690),(6100,25,'201902',1205,1077),(6100,25,'201903',1327,1588),(6100,25,'201904',940,1100),
(6100,25,'201905',964,982),(6100,25,'201906',967,870),(6100,25,'201907',1155,1258),(6100,25,'201908',955,1290),
(6000,30,'201901',28,40),(6000,30,'201902',28,13),(6000,30,'201903',37,42),(6000,30,'201904',46,43),
(6000,30,'201905',40,45),(6000,30,'201906',28,31),(6000,30,'201907',30,35),(6000,30,'201908',38,39),
(5300,24,'201901',833,452),(5300,24,'201902',344,649),(5300,24,'201903',359,512),(5300,24,'201904',3131,919),
(5300,24,'201905',1142,2665),(5300,24,'201906',861,971),(5300,24,'201907',990,1225),(5300,24,'201908',796,1129),
(5200,23,'201901',1290,1291),(5200,23,'201902',788,819),(5200,23,'201903',1148,1257),(5200,23,'201904',1039,1067),
(5200,23,'201905',1475,1242),(5200,23,'201906',1489,1295),(5200,23,'201907',2133,1905),(5200,23,'201908',1729,2216),
(5100,22,'201901',2856,2869),(5100,22,'201902',2211,1919),(5100,22,'201903',2985,3319),(5100,22,'201904',2600,2695),
(5100,22,'201905',2901,2553),(5100,22,'201906',2866,2784),(5100,22,'201907',3251,3449),(5100,22,'201908',2611,3376),
(5000,21,'201901',2033,1701),(5000,21,'201902',1326,1217),(5000,21,'201903',2003,2234),(5000,21,'201904',1593,1515),
(5000,21,'201905',2944,2359),(5000,21,'201906',2669,2554),(5000,21,'201907',2566,2943),(5000,21,'201908',1877,2527),
(4600,31,'201901',187,191),(4600,31,'201902',127,105),(4600,31,'201903',179,214),(4600,31,'201904',122,139),
(4600,31,'201905',167,151),(4600,31,'201906',202,167),(4600,31,'201907',208,245),(4600,31,'201908',210,223),
(4500,20,'201901',1350,1459),(4500,20,'201902',1519,1011),(4500,20,'201903',2227,2218),(4500,20,'201904',2013,2057),
(4500,20,'201905',2185,2142),(4500,20,'201906',1588,1564),(4500,20,'201907',1358,1846),(4500,20,'201908',1042,1411),
(4400,19,'201901',2362,2775),(4400,19,'201902',2836,1954),(4400,19,'201903',2869,3490),(4400,19,'201904',1606,2298),
(4400,19,'201905',2062,1839),(4400,19,'201906',1496,1491),(4400,19,'201907',3065,2864),(4400,19,'201908',2391,2834),
(4300,18,'201901',3317,3349),(4300,18,'201902',3330,2503),(4300,18,'201903',5589,5300),(4300,18,'201904',2732,3789),
(4300,18,'201905',2825,2932),(4300,18,'201906',2672,2517),(4300,18,'201907',3318,3542),(4300,18,'201908',2572,3572),
(4200,17,'201901',472,512),(4200,17,'201902',383,337),(4200,17,'201903',422,504),(4200,17,'201904',397,391),
(4200,17,'201905',458,459),(4200,17,'201906',213,820),(4200,17,'201907',683,582),(4200,17,'201908',547,555),
(4100,16,'201901',3192,3249),(4100,16,'201902',4195,3804),(4100,16,'201903',3631,4090),(4100,16,'201904',4204,3972),
(4100,16,'201905',5000,4739),(4100,16,'201906',3260,3586),(4100,16,'201907',4522,4981),(4100,16,'201908',4012,5121),
(3700,15,'201901',7062,690),(3700,15,'201902',3435,3277),(3700,15,'201903',3848,4562),(3700,15,'201904',4335,4027),
(3700,15,'201905',9029,6704),(3700,15,'201906',2926,5059),(3700,15,'201907',5308,5440),(3700,15,'201908',3684,5212),
(3600,14,'201901',1472,1781),(3600,14,'201902',1494,1037),(3600,14,'201903',1923,2294),(3600,14,'201904',1248,1397),
(3600,14,'201905',2297,1831),(3600,14,'201906',1387,1794),(3600,14,'201907',1298,1681),(3600,14,'201908',825,1130);





insert into credit_card_monthly_volume(`province_id`,`branch_id`,`month`,`card_capacity`,`active_capacity`) values(1100,1,201901,861,871);
insert into credit_card_monthly_volume(`province_id`,`branch_id`,`month`,`card_capacity`,`active_capacity`) values(1100,1,201902,876,653);
insert into credit_card_monthly_volume(`province_id`,`branch_id`,`month`,`card_capacity`,`active_capacity`) values(1100,1,201903,1281,1324);
insert into credit_card_monthly_volume(`province_id`,`branch_id`,`month`,`card_capacity`,`active_capacity`) values(1100,1,201904,887,1032);
insert into credit_card_monthly_volume(`province_id`,`branch_id`,`month`,`card_capacity`,`active_capacity`) values(1100,1,201905,660,727);
insert into credit_card_monthly_volume(`province_id`,`branch_id`,`month`,`card_capacity`,`active_capacity`) values(1100,1,201906,492,591);
insert into credit_card_monthly_volume(`province_id`,`branch_id`,`month`,`card_capacity`,`active_capacity`) values(1100,1,201907,1001,880);
insert into credit_card_monthly_volume(`province_id`,`branch_id`,`month`,`card_capacity`,`active_capacity`) values(1100,1,201908,764,963);

insert into credit_card_monthly_volume(`province_id`,`branch_id`,`month`,`card_capacity`,`active_capacity`) values(1200,2,201901,358,507);
insert into credit_card_monthly_volume(`province_id`,`branch_id`,`month`,`card_capacity`,`active_capacity`) values(1200,2,201902,381,350);
insert into credit_card_monthly_volume(`province_id`,`branch_id`,`month`,`card_capacity`,`active_capacity`) values(1200,2,201903,517,405);
insert into credit_card_monthly_volume(`province_id`,`branch_id`,`month`,`card_capacity`,`active_capacity`) values(1200,2,201904,360,525);
insert into credit_card_monthly_volume(`province_id`,`branch_id`,`month`,`card_capacity`,`active_capacity`) values(1200,2,201905,489,331);
insert into credit_card_monthly_volume(`province_id`,`branch_id`,`month`,`card_capacity`,`active_capacity`) values(1200,2,201906,397,524);
insert into credit_card_monthly_volume(`province_id`,`branch_id`,`month`,`card_capacity`,`active_capacity`) values(1200,2,201907,442,331);
insert into credit_card_monthly_volume(`province_id`,`branch_id`,`month`,`card_capacity`,`active_capacity`) values(1200,2,201908,407,546);

insert into credit_card_monthly_volume(`province_id`,`branch_id`,`month`,`card_capacity`,`active_capacity`) values(1300,3,201901,4046,2678);
insert into credit_card_monthly_volume(`province_id`,`branch_id`,`month`,`card_capacity`,`active_capacity`) values(1300,3,201902,2496,3827);
insert into credit_card_monthly_volume(`province_id`,`branch_id`,`month`,`card_capacity`,`active_capacity`) values(1300,3,201903,4531,2965);
insert into credit_card_monthly_volume(`province_id`,`branch_id`,`month`,`card_capacity`,`active_capacity`) values(1300,3,201904,3572,2321);
insert into credit_card_monthly_volume(`province_id`,`branch_id`,`month`,`card_capacity`,`active_capacity`) values(1300,3,201905,2843,2317);
insert into credit_card_monthly_volume(`province_id`,`branch_id`,`month`,`card_capacity`,`active_capacity`) values(1300,3,201906,2223,4157);
insert into credit_card_monthly_volume(`province_id`,`branch_id`,`month`,`card_capacity`,`active_capacity`) values(1300,3,201907,4087,2550);
insert into credit_card_monthly_volume(`province_id`,`branch_id`,`month`,`card_capacity`,`active_capacity`) values(1300,3,201908,3634,3669);

insert into credit_card_monthly_volume(`province_id`,`branch_id`,`month`,`card_capacity`,`active_capacity`) values(1400,4,201901,2705,2832);
insert into credit_card_monthly_volume(`province_id`,`branch_id`,`month`,`card_capacity`,`active_capacity`) values(1400,4,201902,2351,2025);
insert into credit_card_monthly_volume(`province_id`,`branch_id`,`month`,`card_capacity`,`active_capacity`) values(1400,4,201903,3875,3781);
insert into credit_card_monthly_volume(`province_id`,`branch_id`,`month`,`card_capacity`,`active_capacity`) values(1400,4,201904,3380,3519);
insert into credit_card_monthly_volume(`province_id`,`branch_id`,`month`,`card_capacity`,`active_capacity`) values(1400,4,201905,2831,2988);
insert into credit_card_monthly_volume(`province_id`,`branch_id`,`month`,`card_capacity`,`active_capacity`) values(1400,4,201906,1765,2107);
insert into credit_card_monthly_volume(`province_id`,`branch_id`,`month`,`card_capacity`,`active_capacity`) values(1400,4,201907,2277,2503);
insert into credit_card_monthly_volume(`province_id`,`branch_id`,`month`,`card_capacity`,`active_capacity`) values(1400,4,201908,1113,1959);

insert into credit_card_monthly_volume(`province_id`,`branch_id`,`month`,`card_capacity`,`active_capacity`) values(1500,5,201901,1016,966);
insert into credit_card_monthly_volume(`province_id`,`branch_id`,`month`,`card_capacity`,`active_capacity`) values(1500,5,201902,979,796);
insert into credit_card_monthly_volume(`province_id`,`branch_id`,`month`,`card_capacity`,`active_capacity`) values(1500,5,201903,1135,1318);
insert into credit_card_monthly_volume(`province_id`,`branch_id`,`month`,`card_capacity`,`active_capacity`) values(1500,5,201904,1129,1226);
insert into credit_card_monthly_volume(`province_id`,`branch_id`,`month`,`card_capacity`,`active_capacity`) values(1500,5,201905,1119,1074);
insert into credit_card_monthly_volume(`province_id`,`branch_id`,`month`,`card_capacity`,`active_capacity`) values(1500,5,201906,1061,880);
insert into credit_card_monthly_volume(`province_id`,`branch_id`,`month`,`card_capacity`,`active_capacity`) values(1500,5,201907,1515,1598);
insert into credit_card_monthly_volume(`province_id`,`branch_id`,`month`,`card_capacity`,`active_capacity`) values(1500,5,201908,1019,1456);

insert into credit_card_monthly_volume(`province_id`,`branch_id`,`month`,`card_capacity`,`active_capacity`) values(2100,6,201901,1548,1520);
insert into credit_card_monthly_volume(`province_id`,`branch_id`,`month`,`card_capacity`,`active_capacity`) values(2100,6,201902,1387,1150);
insert into credit_card_monthly_volume(`province_id`,`branch_id`,`month`,`card_capacity`,`active_capacity`) values(2100,6,201903,1671,1833);
insert into credit_card_monthly_volume(`province_id`,`branch_id`,`month`,`card_capacity`,`active_capacity`) values(2100,6,201904,1385,1497);
insert into credit_card_monthly_volume(`province_id`,`branch_id`,`month`,`card_capacity`,`active_capacity`) values(2100,6,201905,1541,1505);
insert into credit_card_monthly_volume(`province_id`,`branch_id`,`month`,`card_capacity`,`active_capacity`) values(2100,6,201906,2024,1585);
insert into credit_card_monthly_volume(`province_id`,`branch_id`,`month`,`card_capacity`,`active_capacity`) values(2100,6,201907,3285,3026);
insert into credit_card_monthly_volume(`province_id`,`branch_id`,`month`,`card_capacity`,`active_capacity`) values(2100,6,201908,2171,2949);

insert into credit_card_monthly_volume(`province_id`,`branch_id`,`month`,`card_capacity`,`active_capacity`) values(2200,7,201901,5492,4210);
insert into credit_card_monthly_volume(`province_id`,`branch_id`,`month`,`card_capacity`,`active_capacity`) values(2200,7,201902,5373,4298);
insert into credit_card_monthly_volume(`province_id`,`branch_id`,`month`,`card_capacity`,`active_capacity`) values(2200,7,201903,7034,7855);
insert into credit_card_monthly_volume(`province_id`,`branch_id`,`month`,`card_capacity`,`active_capacity`) values(2200,7,201904,3793,4740);
insert into credit_card_monthly_volume(`province_id`,`branch_id`,`month`,`card_capacity`,`active_capacity`) values(2200,7,201905,3608,3687);
insert into credit_card_monthly_volume(`province_id`,`branch_id`,`month`,`card_capacity`,`active_capacity`) values(2200,7,201906,3025,3553);
insert into credit_card_monthly_volume(`province_id`,`branch_id`,`month`,`card_capacity`,`active_capacity`) values(2200,7,201907,3702,4139);
insert into credit_card_monthly_volume(`province_id`,`branch_id`,`month`,`card_capacity`,`active_capacity`) values(2200,7,201908,2528,3511);

insert into credit_card_monthly_volume(`province_id`,`branch_id`,`month`,`card_capacity`,`active_capacity`) values(2300,8,201901,10868,8634);
insert into credit_card_monthly_volume(`province_id`,`branch_id`,`month`,`card_capacity`,`active_capacity`) values(2300,8,201902,6176,5739);
insert into credit_card_monthly_volume(`province_id`,`branch_id`,`month`,`card_capacity`,`active_capacity`) values(2300,8,201903,8836,10751);
insert into credit_card_monthly_volume(`province_id`,`branch_id`,`month`,`card_capacity`,`active_capacity`) values(2300,8,201904,8315,7532);
insert into credit_card_monthly_volume(`province_id`,`branch_id`,`month`,`card_capacity`,`active_capacity`) values(2300,8,201905,7067,7854);
insert into credit_card_monthly_volume(`province_id`,`branch_id`,`month`,`card_capacity`,`active_capacity`) values(2300,8,201906,5536,5925);
insert into credit_card_monthly_volume(`province_id`,`branch_id`,`month`,`card_capacity`,`active_capacity`) values(2300,8,201907,5141,5721);
insert into credit_card_monthly_volume(`province_id`,`branch_id`,`month`,`card_capacity`,`active_capacity`) values(2300,8,201908,5097,6366);

insert into credit_card_monthly_volume(`province_id`,`branch_id`,`month`,`card_capacity`,`active_capacity`) values(3100,9,201901,1230,1263);
insert into credit_card_monthly_volume(`province_id`,`branch_id`,`month`,`card_capacity`,`active_capacity`) values(3100,9,201902,991,931);
insert into credit_card_monthly_volume(`province_id`,`branch_id`,`month`,`card_capacity`,`active_capacity`) values(3100,9,201903,1171,1276);
insert into credit_card_monthly_volume(`province_id`,`branch_id`,`month`,`card_capacity`,`active_capacity`) values(3100,9,201904,753,858);
insert into credit_card_monthly_volume(`province_id`,`branch_id`,`month`,`card_capacity`,`active_capacity`) values(3100,9,201905,1000,1014);
insert into credit_card_monthly_volume(`province_id`,`branch_id`,`month`,`card_capacity`,`active_capacity`) values(3100,9,201906,638,682);
insert into credit_card_monthly_volume(`province_id`,`branch_id`,`month`,`card_capacity`,`active_capacity`) values(3100,9,201907,1750,1478);
insert into credit_card_monthly_volume(`province_id`,`branch_id`,`month`,`card_capacity`,`active_capacity`) values(3100,9,201908,985,1371);

insert into credit_card_monthly_volume(`province_id`,`branch_id`,`month`,`card_capacity`,`active_capacity`) values(3200,10,201901,944,1012);
insert into credit_card_monthly_volume(`province_id`,`branch_id`,`month`,`card_capacity`,`active_capacity`) values(3200,10,201902,1874,1402);
insert into credit_card_monthly_volume(`province_id`,`branch_id`,`month`,`card_capacity`,`active_capacity`) values(3200,10,201903,2019,2104);
insert into credit_card_monthly_volume(`province_id`,`branch_id`,`month`,`card_capacity`,`active_capacity`) values(3200,10,201904,1856,1960);
insert into credit_card_monthly_volume(`province_id`,`branch_id`,`month`,`card_capacity`,`active_capacity`) values(3200,10,201905,1392,1553);
insert into credit_card_monthly_volume(`province_id`,`branch_id`,`month`,`card_capacity`,`active_capacity`) values(3200,10,201906,801,995);
insert into credit_card_monthly_volume(`province_id`,`branch_id`,`month`,`card_capacity`,`active_capacity`) values(3200,10,201907,1307,1367);
insert into credit_card_monthly_volume(`province_id`,`branch_id`,`month`,`card_capacity`,`active_capacity`) values(3200,10,201908,1094,1373);

insert into credit_card_monthly_volume(`province_id`,`branch_id`,`month`,`card_capacity`,`active_capacity`) values(3300,11,201901,2474,2643);
insert into credit_card_monthly_volume(`province_id`,`branch_id`,`month`,`card_capacity`,`active_capacity`) values(3300,11,201902,1786,1439);
insert into credit_card_monthly_volume(`province_id`,`branch_id`,`month`,`card_capacity`,`active_capacity`) values(3300,11,201903,2342,2548);
insert into credit_card_monthly_volume(`province_id`,`branch_id`,`month`,`card_capacity`,`active_capacity`) values(3300,11,201904,2592,2037);
insert into credit_card_monthly_volume(`province_id`,`branch_id`,`month`,`card_capacity`,`active_capacity`) values(3300,11,201905,6621,4108);
insert into credit_card_monthly_volume(`province_id`,`branch_id`,`month`,`card_capacity`,`active_capacity`) values(3300,11,201906,4927,4415);
insert into credit_card_monthly_volume(`province_id`,`branch_id`,`month`,`card_capacity`,`active_capacity`) values(3300,11,201907,6490,7361);
insert into credit_card_monthly_volume(`province_id`,`branch_id`,`month`,`card_capacity`,`active_capacity`) values(3300,11,201908,3684,5319);

insert into credit_card_monthly_volume(`province_id`,`branch_id`,`month`,`card_capacity`,`active_capacity`) values(3400,12,201901,1562,1571);
insert into credit_card_monthly_volume(`province_id`,`branch_id`,`month`,`card_capacity`,`active_capacity`) values(3400,12,201902,1205,1138);
insert into credit_card_monthly_volume(`province_id`,`branch_id`,`month`,`card_capacity`,`active_capacity`) values(3400,12,201903,1529,1788);
insert into credit_card_monthly_volume(`province_id`,`branch_id`,`month`,`card_capacity`,`active_capacity`) values(3400,12,201904,1454,1364);
insert into credit_card_monthly_volume(`province_id`,`branch_id`,`month`,`card_capacity`,`active_capacity`) values(3400,12,201905,1427,1415);
insert into credit_card_monthly_volume(`province_id`,`branch_id`,`month`,`card_capacity`,`active_capacity`) values(3400,12,201906,901,1049);
insert into credit_card_monthly_volume(`province_id`,`branch_id`,`month`,`card_capacity`,`active_capacity`) values(3400,12,201907,3329,2618);
insert into credit_card_monthly_volume(`province_id`,`branch_id`,`month`,`card_capacity`,`active_capacity`) values(3400,12,201908,2161,2710);

insert into credit_card_monthly_volume(`province_id`,`branch_id`,`month`,`card_capacity`,`active_capacity`) values(3500,13,201901,2242,2335);
insert into credit_card_monthly_volume(`province_id`,`branch_id`,`month`,`card_capacity`,`active_capacity`) values(3500,13,201902,1394,1354);
insert into credit_card_monthly_volume(`province_id`,`branch_id`,`month`,`card_capacity`,`active_capacity`) values(3500,13,201903,1918,1924);
insert into credit_card_monthly_volume(`province_id`,`branch_id`,`month`,`card_capacity`,`active_capacity`) values(3500,13,201904,2168,1990);
insert into credit_card_monthly_volume(`province_id`,`branch_id`,`month`,`card_capacity`,`active_capacity`) values(3500,13,201905,4233,3720);
insert into credit_card_monthly_volume(`province_id`,`branch_id`,`month`,`card_capacity`,`active_capacity`) values(3500,13,201906,2500,2839);
insert into credit_card_monthly_volume(`province_id`,`branch_id`,`month`,`card_capacity`,`active_capacity`) values(3500,13,201907,2676,3137);
insert into credit_card_monthly_volume(`province_id`,`branch_id`,`month`,`card_capacity`,`active_capacity`) values(3500,13,201908,2004,2555);
