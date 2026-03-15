package com.jxc.security;

import com.alibaba.fastjson2.JSON;
import com.jxc.common.Result;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lombok.extern.slf4j.Slf4j;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.AuthenticationEntryPoint;
import org.springframework.stereotype.Component;

import java.io.IOException;
import java.nio.charset.StandardCharsets;

/**
 * 自定义认证入口点
 * 处理未认证的请求
 *
 * @author JXC System
 */
@Slf4j
@Component
public class CustomAuthenticationEntryPoint implements AuthenticationEntryPoint {

    @Override
    public void commence(HttpServletRequest request,
                         HttpServletResponse response,
                         AuthenticationException authException) throws IOException {

        log.warn("未认证访问: {} - {}", request.getRequestURI(), authException.getMessage());

        // 判断是否为API请求
        String requestUri = request.getRequestURI();
        boolean isApiRequest = requestUri.startsWith("/api/");

        if (isApiRequest) {
            // API请求返回JSON
            response.setStatus(HttpServletResponse.SC_UNAUTHORIZED);
            response.setContentType("application/json;charset=UTF-8");

            Result<Void> result = Result.error(401, "未认证，请先登录");
            response.getWriter().write(JSON.toJSONString(result));
        } else {
            // 页面请求重定向到登录页
            response.sendRedirect("/login");
        }
    }
}
