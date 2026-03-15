package com.jxc.security;

import com.jxc.entity.SysUser;
import com.jxc.service.SysUserService;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.oauth2.client.authentication.OAuth2AuthenticationToken;
import org.springframework.security.oauth2.core.user.DefaultOAuth2User;
import org.springframework.security.oauth2.core.user.OAuth2User;
import org.springframework.security.web.authentication.SimpleUrlAuthenticationSuccessHandler;
import org.springframework.stereotype.Component;

import java.io.IOException;
import java.util.Collections;

/**
 * OAuth2登录成功处理器
 *
 * @author JXC System
 */
@Slf4j
@Component
@RequiredArgsConstructor
public class OAuth2LoginSuccessHandler extends SimpleUrlAuthenticationSuccessHandler {

    private final SysUserService sysUserService;

    @Override
    public void onAuthenticationSuccess(HttpServletRequest request,
                                         HttpServletResponse response,
                                         Authentication authentication) throws IOException, ServletException {

        OAuth2AuthenticationToken oauth2Token = (OAuth2AuthenticationToken) authentication;
        OAuth2User oauth2User = oauth2Token.getPrincipal();

        // 获取OAuth2用户信息
        String username = oauth2User.getAttribute("username");
        String email = oauth2User.getAttribute("email");
        String name = oauth2User.getAttribute("name");

        log.info("OAuth2用户登录成功: username={}, email={}, name={}", username, email, name);

        // 同步或创建本地用户
        SysUser sysUser = sysUserService.getOrCreateOAuth2User(username, email, name);

        // 创建新的认证对象，包含本地用户信息
        UserPrincipal userPrincipal = UserPrincipal.create(sysUser);

        // 替换当前认证对象
        OAuth2AuthenticationToken newAuthentication = new OAuth2AuthenticationToken(
                userPrincipal,
                Collections.singletonList(new SimpleGrantedAuthority("ROLE_USER")),
                oauth2Token.getAuthorizedClientRegistrationId()
        );

        // 更新SecurityContext
        super.onAuthenticationSuccess(request, response, newAuthentication);

        // 重定向到首页
        setDefaultTargetUrl("/");
        super.onAuthenticationSuccess(request, response, newAuthentication);
    }
}
