##---------------------t_theme-------------------
CREATE TABLE `t_theme` (
`id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
`addTime` datetime NOT NULL COMMENT '添加时间',
`deleteStatus` bit(1) NOT NULL COMMENT '状态（0：正常，1：删除）',
`themeDesc` varchar(255) NOT NULL COMMENT '主题名称',

PRIMARY KEY (`id`))
ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='id:数据库主键  '
;