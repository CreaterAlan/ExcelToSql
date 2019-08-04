##---------------------t_orderformdetail-------------------
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