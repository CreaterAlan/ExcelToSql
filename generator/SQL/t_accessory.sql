##---------------------t_accessory-------------------
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