##---------------------t_bag-------------------
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