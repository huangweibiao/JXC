package com.jxc.entity;

import com.baomidou.mybatisplus.annotation.*;
import lombok.Data;

import java.math.BigDecimal;
import java.time.LocalDateTime;

/**
 * 商品信息实体
 *
 * @author JXC System
 */
@Data
@TableName("product")
public class Product {

    /**
     * 商品ID
     */
    @TableId(type = IdType.AUTO)
    private Long id;

    /**
     * 商品编号
     */
    private String productCode;

    /**
     * 商品名称
     */
    private String productName;

    /**
     * 商品分类ID
     */
    private Long categoryId;

    /**
     * 商品单位ID
     */
    private Long unitId;

    /**
     * 规格型号
     */
    private String specification;

    /**
     * 品牌ID
     */
    private Long brandId;

    /**
     * 零售价
     */
    private BigDecimal retailPrice;

    /**
     * 成本价
     */
    private BigDecimal costPrice;

    /**
     * 批发价
     */
    private BigDecimal wholesalePrice;

    /**
     * 安全库存
     */
    private Integer safetyStock;

    /**
     * 商品条码
     */
    private String barcode;

    /**
     * 商品图片
     */
    private String imageUrl;

    /**
     * 商品描述
     */
    private String description;

    /**
     * 商品状态：0-下架 1-上架
     */
    private Integer status;

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
