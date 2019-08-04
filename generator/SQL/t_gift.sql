##---------------------t_gift-------------------
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