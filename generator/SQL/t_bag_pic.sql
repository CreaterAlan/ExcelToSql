##---------------------t_bag_pic-------------------
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