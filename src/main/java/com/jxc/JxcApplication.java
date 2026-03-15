package com.jxc;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

/**
 * 进销存系统主启动类
 *
 * @author JXC System
 * @version 1.0.0
 */
@SpringBootApplication
public class JxcApplication {

    public static void main(String[] args) {
        SpringApplication.run(JxcApplication.class, args);
        System.out.println("\n========================================");
        System.out.println("  JXC 进销存系统启动成功！");
        System.out.println("  访问地址: http://localhost:8080");
        System.out.println("========================================\n");
    }
}
