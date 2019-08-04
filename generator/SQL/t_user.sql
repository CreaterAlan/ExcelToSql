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