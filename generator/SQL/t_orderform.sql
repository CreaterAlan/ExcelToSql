##---------------------t_orderform-------------------
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