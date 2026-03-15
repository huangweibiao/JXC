package com.jxc.config;

import com.jxc.security.CustomAuthenticationEntryPoint;
import com.jxc.security.CustomLogoutSuccessHandler;
import com.jxc.security.OAuth2LoginSuccessHandler;
import lombok.RequiredArgsConstructor;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.method.configuration.EnableMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configurers.AbstractHttpConfigurer;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.security.web.authentication.AuthenticationEntryPointFailureHandler;

/**
 * Spring Security安全配置
 *
 * @author JXC System
 */
@Configuration
@EnableWebSecurity
@EnableMethodSecurity
@RequiredArgsConstructor
public class SecurityConfig {

    private final OAuth2LoginSuccessHandler oAuth2LoginSuccessHandler;
    private final CustomLogoutSuccessHandler customLogoutSuccessHandler;
    private final CustomAuthenticationEntryPoint customAuthenticationEntryPoint;

    /**
     * 配置安全过滤器链
     */
    @Bean
    public SecurityFilterChain securityFilterChain(HttpSecurity http) throws Exception {
        http
                // 禁用CSRF（Thymeleaf + Vue前后端不分离可考虑启用）
                .csrf(AbstractHttpConfigurer::disable)

                // 配置OAuth2登录
                .oauth2Login(oauth2 -> oauth2
                        .loginPage("/login")
                        .successHandler(oAuth2LoginSuccessHandler)
                        .failureHandler(new AuthenticationEntryPointFailureHandler(customAuthenticationEntryPoint))
                )

                // 配置登出
                .logout(logout -> logout
                        .logoutSuccessHandler(customLogoutSuccessHandler)
                        .deleteCookies("JSESSIONID")
                        .clearAuthentication(true)
                )

                // 配置授权规则
                .authorizeHttpRequests(auth -> auth
                        // 静态资源允许匿名访问
                        .requestMatchers(
                                "/css/**", "/js/**", "/assets/**", "/images/**", "/favicon.ico",
                                "/webjars/**", "/druid/**"
                        ).permitAll()
                        // 登录页允许匿名访问
                        .requestMatchers("/login", "/login/**").permitAll()
                        // OAuth2回调端点
                        .requestMatchers("/login/oauth2/**", "/oauth2/**").permitAll()
                        // API接口需要认证
                        .requestMatchers("/api/**").authenticated()
                        // 其他所有请求都需要认证
                        .anyRequest().authenticated()
                )

                // 配置异常处理
                .exceptionHandling(exception -> exception
                        .authenticationEntryPoint(customAuthenticationEntryPoint)
                )

                // 配置Session管理
                .sessionManagement(session -> session
                        .sessionFixation().migrateSession()
                        .maximumSessions(1)
                        .maxSessionsPreventsLogin(false)
                );

        return http.build();
    }
}
