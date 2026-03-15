package com.jxc.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.jxc.entity.SysUser;
import com.jxc.mapper.SysUserMapper;
import com.jxc.service.SysUserService;
import lombok.RequiredArgsConstructor;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

/**
 * 系统用户Service实现
 *
 * @author JXC System
 */
@Service
@RequiredArgsConstructor
public class SysUserServiceImpl extends ServiceImpl<SysUserMapper, SysUser> implements SysUserService {

    private final PasswordEncoder passwordEncoder;

    @Override
    public SysUser getByUsername(String username) {
        return this.getOne(new LambdaQueryWrapper<SysUser>()
                .eq(SysUser::getUsername, username)
                .eq(SysUser::getDeleted, 0));
    }

    @Override
    public SysUser getOrCreateOAuth2User(String username, String email, String name) {
        LambdaQueryWrapper<SysUser> wrapper = new LambdaQueryWrapper<SysUser>()
                .eq(SysUser::getUsername, username)
                .eq(SysUser::getDeleted, 0);

        SysUser user = this.getOne(wrapper);
        if (user == null) {
            // 创建新用户
            user = new SysUser();
            user.setUsername(username);
            user.setPassword(passwordEncoder.encode("oauth2_default_password"));
            user.setRealName(name);
            user.setEmail(email);
            user.setStatus(1);
            user.setOauth2User(true);
            user.setOauth2Provider("oauth2-server");
            user.setOauth2Subject(username);
            this.save(user);
        }

        return user;
    }
}
