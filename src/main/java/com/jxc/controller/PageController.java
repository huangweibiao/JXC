package com.jxc.controller;

import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.oauth2.core.user.OAuth2User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

/**
 * 页面控制器
 *
 * @author JXC System
 */
@Controller
public class PageController {

    /**
     * 首页
     */
    @GetMapping("/")
    public String index(Model model, @AuthenticationPrincipal OAuth2User oauth2User) {
        if (oauth2User != null) {
            model.addAttribute("username", oauth2User.getAttribute("username"));
            model.addAttribute("name", oauth2User.getAttribute("name"));
        }
        return "index";
    }

    /**
     * 采购管理页面
     */
    @GetMapping("/purchase/orders")
    public String purchaseOrders() {
        return "purchase/orders";
    }

    /**
     * 销售管理页面
     */
    @GetMapping("/sales/orders")
    public String salesOrders() {
        return "sales/orders";
    }

    /**
     * 库存管理页面
     */
    @GetMapping("/inventory/list")
    public String inventoryList() {
        return "inventory/list";
    }

    /**
     * 商品管理页面
     */
    @GetMapping("/products")
    public String products() {
        return "products/list";
    }

    /**
     * 供应商管理页面
     */
    @GetMapping("/suppliers")
    public String suppliers() {
        return "supplier/list";
    }

    /**
     * 客户管理页面
     */
    @GetMapping("/customers")
    public String customers() {
        return "customer/list";
    }
}
