-- JXC进销存系统数据库初始化脚本
-- 数据库: jxc_db
-- 字符集: utf8mb4

-- 创建数据库
CREATE DATABASE IF NOT EXISTS `jxc_db` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

USE `jxc_db`;

-- ==================== 用户表 ====================
CREATE TABLE IF NOT EXISTS `sys_user` (
    `id` BIGINT NOT NULL AUTO_INCREMENT COMMENT '用户ID',
    `username` VARCHAR(50) NOT NULL COMMENT '用户名',
    `password` VARCHAR(255) DEFAULT NULL COMMENT '密码',
    `real_name` VARCHAR(50) DEFAULT NULL COMMENT '真实姓名',
    `email` VARCHAR(100) DEFAULT NULL COMMENT '邮箱',
    `phone` VARCHAR(20) DEFAULT NULL COMMENT '手机号',
    `dept_id` BIGINT DEFAULT NULL COMMENT '部门ID',
    `status` TINYINT DEFAULT 1 COMMENT '用户状态：0-禁用 1-正常',
    `oauth2_user` TINYINT DEFAULT 0 COMMENT 'OAuth2标识：0-否 1-是',
    `oauth2_provider` VARCHAR(50) DEFAULT NULL COMMENT 'OAuth2提供商',
    `oauth2_subject` VARCHAR(255) DEFAULT NULL COMMENT 'OAuth2外部用户ID',
    `create_time` DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `update_time` DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    `deleted` TINYINT DEFAULT 0 COMMENT '逻辑删除：0-未删除 1-已删除',
    PRIMARY KEY (`id`),
    UNIQUE KEY `uk_username` (`username`),
    KEY `idx_email` (`email`),
    KEY `idx_dept_id` (`dept_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='系统用户表';

-- ==================== 商品分类表 ====================
CREATE TABLE IF NOT EXISTS `product_category` (
    `id` BIGINT NOT NULL AUTO_INCREMENT COMMENT '分类ID',
    `category_name` VARCHAR(50) NOT NULL COMMENT '分类名称',
    `category_code` VARCHAR(50) DEFAULT NULL COMMENT '分类编码',
    `parent_id` BIGINT DEFAULT 0 COMMENT '父分类ID',
    `sort_order` INT DEFAULT 0 COMMENT '排序',
    `status` TINYINT DEFAULT 1 COMMENT '状态：0-禁用 1-启用',
    `create_time` DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `update_time` DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    `deleted` TINYINT DEFAULT 0 COMMENT '逻辑删除：0-未删除 1-已删除',
    PRIMARY KEY (`id`),
    KEY `idx_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='商品分类表';

-- ==================== 商品单位表 ====================
CREATE TABLE IF NOT EXISTS `product_unit` (
    `id` BIGINT NOT NULL AUTO_INCREMENT COMMENT '单位ID',
    `unit_name` VARCHAR(20) NOT NULL COMMENT '单位名称',
    `unit_code` VARCHAR(20) DEFAULT NULL COMMENT '单位编码',
    `status` TINYINT DEFAULT 1 COMMENT '状态：0-禁用 1-启用',
    `create_time` DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `update_time` DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    `deleted` TINYINT DEFAULT 0 COMMENT '逻辑删除：0-未删除 1-已删除',
    PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='商品单位表';

-- ==================== 品牌表 ====================
CREATE TABLE IF NOT EXISTS `product_brand` (
    `id` BIGINT NOT NULL AUTO_INCREMENT COMMENT '品牌ID',
    `brand_name` VARCHAR(50) NOT NULL COMMENT '品牌名称',
    `brand_code` VARCHAR(50) DEFAULT NULL COMMENT '品牌编码',
    `status` TINYINT DEFAULT 1 COMMENT '状态：0-禁用 1-启用',
    `create_time` DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `update_time` DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    `deleted` TINYINT DEFAULT 0 COMMENT '逻辑删除：0-未删除 1-已删除',
    PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='品牌表';

-- ==================== 商品表 ====================
CREATE TABLE IF NOT EXISTS `product` (
    `id` BIGINT NOT NULL AUTO_INCREMENT COMMENT '商品ID',
    `product_code` VARCHAR(50) DEFAULT NULL COMMENT '商品编号',
    `product_name` VARCHAR(100) NOT NULL COMMENT '商品名称',
    `category_id` BIGINT DEFAULT NULL COMMENT '商品分类ID',
    `unit_id` BIGINT DEFAULT NULL COMMENT '商品单位ID',
    `specification` VARCHAR(100) DEFAULT NULL COMMENT '规格型号',
    `brand_id` BIGINT DEFAULT NULL COMMENT '品牌ID',
    `retail_price` DECIMAL(10,2) DEFAULT NULL COMMENT '零售价',
    `cost_price` DECIMAL(10,2) DEFAULT NULL COMMENT '成本价',
    `wholesale_price` DECIMAL(10,2) DEFAULT NULL COMMENT '批发价',
    `safety_stock` INT DEFAULT 0 COMMENT '安全库存',
    `barcode` VARCHAR(50) DEFAULT NULL COMMENT '商品条码',
    `image_url` VARCHAR(255) DEFAULT NULL COMMENT '商品图片',
    `description` TEXT DEFAULT NULL COMMENT '商品描述',
    `status` TINYINT DEFAULT 1 COMMENT '商品状态：0-下架 1-上架',
    `creator_id` BIGINT DEFAULT NULL COMMENT '创建人ID',
    `create_time` DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `update_time` DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    `deleted` TINYINT DEFAULT 0 COMMENT '逻辑删除：0-未删除 1-已删除',
    PRIMARY KEY (`id`),
    UNIQUE KEY `uk_product_code` (`product_code`),
    KEY `idx_category_id` (`category_id`),
    KEY `idx_brand_id` (`brand_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='商品表';

-- ==================== 仓库表 ====================
CREATE TABLE IF NOT EXISTS `warehouse` (
    `id` BIGINT NOT NULL AUTO_INCREMENT COMMENT '仓库ID',
    `warehouse_name` VARCHAR(50) NOT NULL COMMENT '仓库名称',
    `warehouse_code` VARCHAR(50) DEFAULT NULL COMMENT '仓库编码',
    `address` VARCHAR(255) DEFAULT NULL COMMENT '仓库地址',
    `manager` VARCHAR(50) DEFAULT NULL COMMENT '负责人',
    `contact_phone` VARCHAR(20) DEFAULT NULL COMMENT '联系电话',
    `status` TINYINT DEFAULT 1 COMMENT '状态：0-禁用 1-启用',
    `create_time` DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `update_time` DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    `deleted` TINYINT DEFAULT 0 COMMENT '逻辑删除：0-未删除 1-已删除',
    PRIMARY KEY (`id`),
    UNIQUE KEY `uk_warehouse_code` (`warehouse_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='仓库表';

-- ==================== 库存表 ====================
CREATE TABLE IF NOT EXISTS `inventory` (
    `id` BIGINT NOT NULL AUTO_INCREMENT COMMENT '库存ID',
    `product_id` BIGINT NOT NULL COMMENT '商品ID',
    `warehouse_id` BIGINT DEFAULT 1 COMMENT '仓库ID',
    `quantity` DECIMAL(10,2) DEFAULT 0.00 COMMENT '当前库存数量',
    `available_quantity` DECIMAL(10,2) DEFAULT 0.00 COMMENT '可用库存数量',
    `locked_quantity` DECIMAL(10,2) DEFAULT 0.00 COMMENT '锁定库存数量',
    `cost_amount` DECIMAL(10,2) DEFAULT 0.00 COMMENT '库存成本',
    `last_in_time` DATETIME DEFAULT NULL COMMENT '最后入库时间',
    `last_out_time` DATETIME DEFAULT NULL COMMENT '最后出库时间',
    `create_time` DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `update_time` DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    `deleted` TINYINT DEFAULT 0 COMMENT '逻辑删除：0-未删除 1-已删除',
    PRIMARY KEY (`id`),
    UNIQUE KEY `uk_product_warehouse` (`product_id`, `warehouse_id`),
    KEY `idx_warehouse_id` (`warehouse_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='库存表';

-- ==================== 供应商表 ====================
CREATE TABLE IF NOT EXISTS `supplier` (
    `id` BIGINT NOT NULL AUTO_INCREMENT COMMENT '供应商ID',
    `supplier_code` VARCHAR(50) DEFAULT NULL COMMENT '供应商编号',
    `supplier_name` VARCHAR(100) NOT NULL COMMENT '供应商名称',
    `contact_person` VARCHAR(50) DEFAULT NULL COMMENT '联系人',
    `contact_phone` VARCHAR(20) DEFAULT NULL COMMENT '联系电话',
    `email` VARCHAR(100) DEFAULT NULL COMMENT '联系邮箱',
    `address` VARCHAR(255) DEFAULT NULL COMMENT '供应商地址',
    `level` TINYINT DEFAULT 1 COMMENT '供应商等级：1-普通 2-优质 3-战略',
    `status` TINYINT DEFAULT 1 COMMENT '供应商状态：0-禁用 1-正常',
    `remark` VARCHAR(500) DEFAULT NULL COMMENT '备注',
    `creator_id` BIGINT DEFAULT NULL COMMENT '创建人ID',
    `create_time` DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `update_time` DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    `deleted` TINYINT DEFAULT 0 COMMENT '逻辑删除：0-未删除 1-已删除',
    PRIMARY KEY (`id`),
    UNIQUE KEY `uk_supplier_code` (`supplier_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='供应商表';

-- ==================== 客户表 ====================
CREATE TABLE IF NOT EXISTS `customer` (
    `id` BIGINT NOT NULL AUTO_INCREMENT COMMENT '客户ID',
    `customer_code` VARCHAR(50) DEFAULT NULL COMMENT '客户编号',
    `customer_name` VARCHAR(100) NOT NULL COMMENT '客户名称',
    `customer_type` TINYINT DEFAULT 1 COMMENT '客户类型：1-个人 2-企业',
    `contact_person` VARCHAR(50) DEFAULT NULL COMMENT '联系人',
    `contact_phone` VARCHAR(20) DEFAULT NULL COMMENT '联系电话',
    `email` VARCHAR(100) DEFAULT NULL COMMENT '联系邮箱',
    `address` VARCHAR(255) DEFAULT NULL COMMENT '客户地址',
    `level` TINYINT DEFAULT 1 COMMENT '客户等级：1-普通 2-优质 3-VIP',
    `credit_limit` BIGINT DEFAULT 0 COMMENT '信用额度',
    `status` TINYINT DEFAULT 1 COMMENT '客户状态：0-禁用 1-正常',
    `remark` VARCHAR(500) DEFAULT NULL COMMENT '备注',
    `creator_id` BIGINT DEFAULT NULL COMMENT '创建人ID',
    `create_time` DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `update_time` DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    `deleted` TINYINT DEFAULT 0 COMMENT '逻辑删除：0-未删除 1-已删除',
    PRIMARY KEY (`id`),
    UNIQUE KEY `uk_customer_code` (`customer_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='客户表';

-- ==================== 采购订单表 ====================
CREATE TABLE IF NOT EXISTS `purchase_order` (
    `id` BIGINT NOT NULL AUTO_INCREMENT COMMENT '采购订单ID',
    `order_no` VARCHAR(50) NOT NULL COMMENT '订单编号',
    `supplier_id` BIGINT NOT NULL COMMENT '供应商ID',
    `order_date` DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT '订单日期',
    `expected_date` DATETIME DEFAULT NULL COMMENT '预计到货日期',
    `total_amount` DECIMAL(12,2) DEFAULT 0.00 COMMENT '订单总金额',
    `total_quantity` INT DEFAULT 0 COMMENT '订单数量',
    `received_quantity` INT DEFAULT 0 COMMENT '已入库数量',
    `status` TINYINT DEFAULT 0 COMMENT '订单状态：0-待审核 1-已审核 2-已完成 3-已取消',
    `handler_id` BIGINT DEFAULT NULL COMMENT '经办人ID',
    `remark` VARCHAR(500) DEFAULT NULL COMMENT '备注',
    `creator_id` BIGINT DEFAULT NULL COMMENT '创建人ID',
    `create_time` DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `update_time` DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    `deleted` TINYINT DEFAULT 0 COMMENT '逻辑删除：0-未删除 1-已删除',
    PRIMARY KEY (`id`),
    UNIQUE KEY `uk_order_no` (`order_no`),
    KEY `idx_supplier_id` (`supplier_id`),
    KEY `idx_order_date` (`order_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='采购订单表';

-- ==================== 采购订单明细表 ====================
CREATE TABLE IF NOT EXISTS `purchase_order_item` (
    `id` BIGINT NOT NULL AUTO_INCREMENT COMMENT '明细ID',
    `order_id` BIGINT NOT NULL COMMENT '订单ID',
    `product_id` BIGINT NOT NULL COMMENT '商品ID',
    `quantity` INT DEFAULT 0 COMMENT '数量',
    `unit_price` DECIMAL(10,2) DEFAULT 0.00 COMMENT '单价',
    `amount` DECIMAL(10,2) DEFAULT 0.00 COMMENT '金额',
    `received_quantity` INT DEFAULT 0 COMMENT '已入库数量',
    `remark` VARCHAR(255) DEFAULT NULL COMMENT '备注',
    `create_time` DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `update_time` DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    `deleted` TINYINT DEFAULT 0 COMMENT '逻辑删除：0-未删除 1-已删除',
    PRIMARY KEY (`id`),
    KEY `idx_order_id` (`order_id`),
    KEY `idx_product_id` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='采购订单明细表';

-- ==================== 销售订单表 ====================
CREATE TABLE IF NOT EXISTS `sales_order` (
    `id` BIGINT NOT NULL AUTO_INCREMENT COMMENT '销售订单ID',
    `order_no` VARCHAR(50) NOT NULL COMMENT '订单编号',
    `customer_id` BIGINT NOT NULL COMMENT '客户ID',
    `order_date` DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT '订单日期',
    `total_amount` DECIMAL(12,2) DEFAULT 0.00 COMMENT '订单总金额',
    `total_quantity` INT DEFAULT 0 COMMENT '订单数量',
    `shipped_quantity` INT DEFAULT 0 COMMENT '已出库数量',
    `paid_amount` DECIMAL(12,2) DEFAULT 0.00 COMMENT '实收金额',
    `status` TINYINT DEFAULT 0 COMMENT '订单状态：0-待审核 1-已审核 2-已完成 3-已取消',
    `payment_status` TINYINT DEFAULT 0 COMMENT '付款状态：0-未付款 1-部分付款 2-已付款',
    `handler_id` BIGINT DEFAULT NULL COMMENT '经办人ID',
    `remark` VARCHAR(500) DEFAULT NULL COMMENT '备注',
    `creator_id` BIGINT DEFAULT NULL COMMENT '创建人ID',
    `create_time` DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `update_time` DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    `deleted` TINYINT DEFAULT 0 COMMENT '逻辑删除：0-未删除 1-已删除',
    PRIMARY KEY (`id`),
    UNIQUE KEY `uk_order_no` (`order_no`),
    KEY `idx_customer_id` (`customer_id`),
    KEY `idx_order_date` (`order_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='销售订单表';

-- ==================== 销售订单明细表 ====================
CREATE TABLE IF NOT EXISTS `sales_order_item` (
    `id` BIGINT NOT NULL AUTO_INCREMENT COMMENT '明细ID',
    `order_id` BIGINT NOT NULL COMMENT '订单ID',
    `product_id` BIGINT NOT NULL COMMENT '商品ID',
    `quantity` INT DEFAULT 0 COMMENT '数量',
    `unit_price` DECIMAL(10,2) DEFAULT 0.00 COMMENT '单价',
    `amount` DECIMAL(10,2) DEFAULT 0.00 COMMENT '金额',
    `shipped_quantity` INT DEFAULT 0 COMMENT '已出库数量',
    `remark` VARCHAR(255) DEFAULT NULL COMMENT '备注',
    `create_time` DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `update_time` DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    `deleted` TINYINT DEFAULT 0 COMMENT '逻辑删除：0-未删除 1-已删除',
    PRIMARY KEY (`id`),
    KEY `idx_order_id` (`order_id`),
    KEY `idx_product_id` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='销售订单明细表';

-- ==================== 初始化数据 ====================

-- 插入默认管理员用户 (密码: admin123)
INSERT INTO `sys_user` (`username`, `password`, `real_name`, `email`, `status`)
VALUES ('admin', '$2a$10$N.zmdr9k7uOCQb376NoUnuTJ8iAt6Z5EHsM8lE9lBOsl7iKTVKIUi', '系统管理员', 'admin@jxc.com', 1);

-- 插入默认仓库
INSERT INTO `warehouse` (`warehouse_name`, `warehouse_code`, `address`, `manager`, `contact_phone`)
VALUES ('主仓库', 'WH001', '北京市朝阳区', '张三', '13800138000');

-- 插入默认商品分类
INSERT INTO `product_category` (`category_name`, `category_code`, `parent_id`)
VALUES ('电子产品', 'ELEC', 0),
       ('食品饮料', 'FOOD', 0),
       ('服装鞋帽', 'CLOTH', 0);

-- 插入默认商品单位
INSERT INTO `product_unit` (`unit_name`, `unit_code`)
VALUES ('件', 'PCS'),
       ('箱', 'BOX'),
       ('台', 'SET'),
       ('公斤', 'KG');
