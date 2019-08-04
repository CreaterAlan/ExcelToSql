##---------------------t_usercard-------------------
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