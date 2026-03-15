package com.jxc.security;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lombok.extern.slf4j.Slf4j;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.logout.LogoutSuccessHandler;
import org.springframework.stereotype.Component;

import java.io.IOException;

/**
 * 自定义登出成功处理器
 *
 * @author JXC System
 */
@Slf4j
@Component
public class CustomLogoutSuccessHandler implements LogoutSuccessHandler {

    @Override
    public void onLogoutSuccess(HttpServletRequest request,
                                HttpServletResponse response,
                                Authentication authentication) throws IOException {

        String username = authentication != null ? authentication.getName() : "unknown";
        log.info("用户登出成功: {}", username);

        // 重定向到OAuth2服务端的登出页面，然后跳转到登录页
        String oauth2LogoutUrl = "http://localhost:8081/logout?redirect_uri=http://localhost:8080/login";
        response.sendRedirect(oauth2LogoutUrl);
    }
}
