package com.jxc.security;

import com.jxc.entity.SysUser;
import lombok.Data;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.oauth2.core.user.OAuth2User;

import java.util.Collection;
import java.util.Collections;
import java.util.Map;

/**
 * 用户主体类
 * 实现UserDetails和OAuth2User接口
 *
 * @author JXC System
 */
@Data
public class UserPrincipal implements UserDetails, OAuth2User {

    private Long id;
    private String username;
    private String password;
    private String email;
    private String realName;
    private String phone;
    private Integer status;
    private Collection<? extends GrantedAuthority> authorities;
    private Map<String, Object> attributes;

    /**
     * 从SysUser创建UserPrincipal
     */
    public static UserPrincipal create(SysUser user) {
        UserPrincipal userPrincipal = new UserPrincipal();
        userPrincipal.setId(user.getId());
        userPrincipal.setUsername(user.getUsername());
        userPrincipal.setPassword(user.getPassword());
        userPrincipal.setEmail(user.getEmail());
        userPrincipal.setRealName(user.getRealName());
        userPrincipal.setPhone(user.getPhone());
        userPrincipal.setStatus(user.getStatus());
        userPrincipal.setAuthorities(Collections.singletonList(
                new SimpleGrantedAuthority("ROLE_USER")
        ));
        return userPrincipal;
    }

    /**
     * 从OAuth2属性创建UserPrincipal
     */
    public static UserPrincipal create(SysUser user, Map<String, Object> attributes) {
        UserPrincipal userPrincipal = UserPrincipal.create(user);
        userPrincipal.setAttributes(attributes);
        return userPrincipal;
    }

    // UserDetails接口实现
    @Override
    public Collection<? extends GrantedAuthority> getAuthorities() {
        return authorities;
    }

    @Override
    public String getPassword() {
        return password;
    }

    @Override
    public String getUsername() {
        return username;
    }

    @Override
    public boolean isAccountNonExpired() {
        return true;
    }

    @Override
    public boolean isAccountNonLocked() {
        return status != 0;
    }

    @Override
    public boolean isCredentialsNonExpired() {
        return true;
    }

    @Override
    public boolean isEnabled() {
        return status == 1;
    }

    // OAuth2User接口实现
    @Override
    public Map<String, Object> getAttributes() {
        return attributes;
    }

    @Override
    public String getName() {
        return String.valueOf(id);
    }
}
