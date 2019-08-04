##---------------------t_user-------------------
CREATE TABLE `t_user` (
`id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
`addTime` datetime NOT NULL COMMENT '添加时间',
`deleteStatus` bit(1) NOT NULL COMMENT '状态（0：正常，1：删除）',
`name` varchar(255) NOT NULL COMMENT '姓名',
`mobile` varchar(255) NOT NULL COMMENT '手机号',
`email` varchar(255)  COMMENT '邮件',
`password` varchar(255) NOT NULL COMMENT '密码',
`language` varchar(1) NOT NULL DEFAULT '2' COMMENT '所选语言。（1：中文，2：英文）',

PRIMARY KEY (`id`))
ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='id:数据库主键  password:MD5   '
;

﻿##---------------------t_basedata-------------------
CREATE TABLE `t_basedata` (
`id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
`addTime` datetime NOT NULL COMMENT '添加时间',
`deleteStatus` bit(1) NOT NULL COMMENT '状态（0：正常，1：删除）',
`name` varchar(100) NOT NULL COMMENT '代码名称',
`nameValue` varchar(1000) NOT NULL COMMENT '代码值',
`parent` varchar(50) NOT NULL COMMENT '父节点',
`seq` int(10) NOT NULL DEFAULT '1' COMMENT '排序',

PRIMARY KEY (`id`))
ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='id:数据库主键  parent:根节点为ROOT   '
;

﻿##---------------------t_accessory-------------------
CREATE TABLE `t_accessory` (
`id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
`addTime` datetime NOT NULL COMMENT '添加时间',
`deleteStatus` bit(1) NOT NULL COMMENT '状态（0：正常，1：删除）',
`ext` varchar(255)  COMMENT '扩展名',
`height` int(11) NOT NULL COMMENT '高度',
`name` varchar(255)  COMMENT '图片名称',
`path` varchar(255)  COMMENT '图片路径',
`size` double NOT NULL COMMENT '大小',
`width` int(11) NOT NULL COMMENT '宽度',
`user_id` bigint(20)  COMMENT '添加人',

PRIMARY KEY (`id`))
ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='id:数据库主键  '
;

﻿##---------------------t_gift-------------------
CREATE TABLE `t_gift` (
`id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
`addTime` datetime NOT NULL COMMENT '添加时间',
`deleteStatus` bit(1) NOT NULL COMMENT '状态（0：正常，1：删除）',
`name` varchar(100) NOT NULL COMMENT '礼品卡名称',
`price` decimal(10,2) NOT NULL COMMENT '礼品卡单价',
`num` int(10) NOT NULL COMMENT '礼品卡发行总量',
`beginDate` varchar(50) NOT NULL COMMENT '可用开始时间',
`endDate` varchar(50) NOT NULL COMMENT '可用结束时间',
`type` varchar(1) NOT NULL COMMENT '类型（1：现金类，2：食用类）',
`acc_id` bigint(20) NOT NULL COMMENT '详情大图片',
`bag_id` bigint(20) NOT NULL COMMENT '卡包主键',

PRIMARY KEY (`id`))
ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='id:数据库主键  num:每次购买都扣除   endDate:过期时间   type:对应t_basedata基础数据表内容显示   acc_id:关联t_accessory   bag_id:关联t_bag   '
;

﻿##---------------------t_theme-------------------
CREATE TABLE `t_theme` (
`id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
`addTime` datetime NOT NULL COMMENT '添加时间',
`deleteStatus` bit(1) NOT NULL COMMENT '状态（0：正常，1：删除）',
`themeDesc` varchar(255) NOT NULL COMMENT '主题名称',

PRIMARY KEY (`id`))
ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='id:数据库主键  '
;

﻿##---------------------t_bag-------------------
CREATE TABLE `t_bag` (
`id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
`addTime` datetime NOT NULL COMMENT '添加时间',
`deleteStatus` bit(1) NOT NULL COMMENT '状态（0：正常，1：删除）',
`name` varchar(255) NOT NULL COMMENT '卡包名称',
`bag_pic_id` bigint(20) NOT NULL COMMENT '卡面图片',
`theme_id` bigint(20) NOT NULL COMMENT '所属主题',

PRIMARY KEY (`id`))
ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='id:数据库主键  bag_pic_id:关联t_accessory   theme_id:关联t_theme   '
;

﻿##---------------------t_bag_pic-------------------
CREATE TABLE `t_bag_pic` (
`id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
`addTime` datetime NOT NULL COMMENT '添加时间',
`deleteStatus` bit(1) NOT NULL COMMENT '状态（0：正常，1：删除）',
`acc_id` bigint(20) NOT NULL COMMENT '卡面图片',
`bag_id` bigint(20) NOT NULL COMMENT '卡包主键',
`seq` int(10) NOT NULL DEFAULT '1' COMMENT '排序',

PRIMARY KEY (`id`))
ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='id:数据库主键  acc_id:关联t_accessory   bag_id:关联t_bag   '
;

﻿##---------------------t_orderform-------------------
CREATE TABLE `t_orderform` (
`id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
`addTime` datetime NOT NULL COMMENT '添加时间',
`deleteStatus` bit(1) NOT NULL COMMENT '状态（0：正常，1：删除）',
`finishTime` datetime NOT NULL COMMENT '订单完成时间',
`goods_amount` decimal(12,2) NOT NULL COMMENT '商品总价格',
`orderNumber` varchar(255) NOT NULL COMMENT '订单编号',
`order_status` int(11) NOT NULL COMMENT '0：未付款，1：已付款',
`payTime` datetime NOT NULL COMMENT '支付时间',
`paymentType` int(11) NOT NULL COMMENT '支付方式。1：微信支付，2：阿里支付，3：VISA支付',
`user_id` bigint(20) NOT NULL COMMENT '购买人的id',
`order_type` varchar(255) NOT NULL DEFAULT 'web' COMMENT '订单来源（web，wx，app）',
`merchant_order_id` varchar(255)  COMMENT '非码接口返回订单编号',
`theme_id` bigint(20) NOT NULL COMMENT '所属主题',
`bag_id` bigint(20) NOT NULL COMMENT '卡包主键',

PRIMARY KEY (`id`))
ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='id:数据库主键  theme_id:关联t_theme   bag_id:关联t_bag   '
;

﻿##---------------------t_orderformdetail-------------------
CREATE TABLE `t_orderformdetail` (
`id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
`addTime` datetime NOT NULL COMMENT '添加时间',
`deleteStatus` bit(1) NOT NULL COMMENT '状态（0：正常，1：删除）',
`orderform_id` bigint(20) NOT NULL COMMENT '订单表主键',
`gift_id` bigint(20) NOT NULL COMMENT '礼品表主键',
`purchaseNum` int(10) NOT NULL COMMENT '购买数量',
`purchasePrice` decimal(10,2) NOT NULL COMMENT '购买单价',
`totalPrice` decimal(10,2) NOT NULL COMMENT '购买总价',
`user_id` bigint(20) NOT NULL COMMENT '购买人的id',

PRIMARY KEY (`id`))
ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='id:数据库主键  orderform_id:关联t_orderform   gift_id:关联t_gift   purchaseNum:不修改此数量   '
;

﻿##---------------------t_usercard-------------------
CREATE TABLE `t_usercard` (
`id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
`addTime` datetime NOT NULL COMMENT '添加时间',
`deleteStatus` bit(1) NOT NULL COMMENT '状态（0：正常，1：删除）',
`orderform_id` bigint(20) NOT NULL COMMENT '订单表主键',
`orderformdetail_id` bigint(20) NOT NULL COMMENT '订单明细表主键',
`gift_id` bigint(20) NOT NULL COMMENT '礼品表主键',
`purchaseNum` int(10) NOT NULL COMMENT '购买数量',
`purchasePrice` decimal(10,2) NOT NULL COMMENT '购买单价',
`totalPrice` decimal(10,2) NOT NULL COMMENT '购买总价',
`user_id` bigint(20) NOT NULL COMMENT '购买人的id/赠送人的id',
`consumType` int(10) NOT NULL DEFAULT '0' COMMENT '核销状态（0：未消费，1：消费，2：赠送）',
`parentid` bigint(20) NOT NULL COMMENT '父子关联',
`blessings` varchar(255) NOT NULL COMMENT '祝福语',
`accepter` bigint(20) NOT NULL COMMENT '接受人',

PRIMARY KEY (`id`))
ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='id:数据库主键  orderform_id:关联t_orderform   orderformdetail_id:关联t_orderformdetail   gift_id:关联t_gift   purchaseNum:最大数量是1（比如：买了10张相同的卡，在这里会生成10条数量为1的记录）   accepter:consumType为2时会有接受人   '
;

