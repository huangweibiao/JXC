package com.jxc.entity;

import com.baomidou.mybatisplus.annotation.*;
import lombok.Data;

import java.math.BigDecimal;
import java.time.LocalDateTime;

/**
 * 销售订单实体
 *
 * @author JXC System
 */
@Data
@TableName("sales_order")
public class SalesOrder {

    /**
     * 销售订单ID
     */
    @TableId(type = IdType.AUTO)
    private Long id;

    /**
     * 订单编号
     */
    private String orderNo;

    /**
     * 客户ID
     */
    private Long customerId;

    /**
     * 订单日期
     */
    private LocalDateTime orderDate;

    /**
     * 订单总金额
     */
    private BigDecimal totalAmount;

    /**
     * 订单数量
     */
    private Integer totalQuantity;

    /**
     * 已出库数量
     */
    private Integer shippedQuantity;

    /**
     * 实收金额
     */
    private BigDecimal paidAmount;

    /**
     * 订单状态：0-待审核 1-已审核 2-已完成 3-已取消
     */
    private Integer status;

    /**
     * 付款状态：0-未付款 1-部分付款 2-已付款
     */
    private Integer paymentStatus;

    /**
     * 经办人ID
     */
    private Long handlerId;

    /**
     * 备注
     */
    private String remark;

    /**
     * 创建人ID
     */
    private Long creatorId;

    /**
     * 创建时间
     */
    @TableField(fill = FieldFill.INSERT)
    private LocalDateTime createTime;

    /**
     * 更新时间
     */
    @TableField(fill = FieldFill.INSERT_UPDATE)
    private LocalDateTime updateTime;

    /**
     * 逻辑删除：0-未删除 1-已删除
     */
    @TableLogic
    private Integer deleted;
}
