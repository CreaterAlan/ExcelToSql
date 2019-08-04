##---------------------t_basedata-------------------
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