package com.jxc.entity;

import com.baomidou.mybatisplus.annotation.*;
import lombok.Data;

import java.math.BigDecimal;
import java.time.LocalDateTime;

/**
 * 库存实体
 *
 * @author JXC System
 */
@Data
@TableName("inventory")
public class Inventory {

    /**
     * 库存ID
     */
    @TableId(type = IdType.AUTO)
    private Long id;

    /**
     * 商品ID
     */
    private Long productId;

    /**
     * 仓库ID
     */
    private Long warehouseId;

    /**
     * 当前库存数量
     */
    private BigDecimal quantity;

    /**
     * 可用库存数量
     */
    private BigDecimal availableQuantity;

    /**
     * 锁定库存数量
     */
    private BigDecimal lockedQuantity;

    /**
     * 库存成本
     */
    private BigDecimal costAmount;

    /**
     * 最后入库时间
     */
    private LocalDateTime lastInTime;

    /**
     * 最后出库时间
     */
    private LocalDateTime lastOutTime;

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
