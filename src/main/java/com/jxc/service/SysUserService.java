package com.jxc.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.jxc.entity.SysUser;

/**
 * 系统用户Service
 *
 * @author JXC System
 */
public interface SysUserService extends IService<SysUser> {

    /**
     * 根据用户名获取用户
     */
    SysUser getByUsername(String username);

    /**
     * 同步或创建OAuth2用户
     */
    SysUser getOrCreateOAuth2User(String username, String email, String name);
}
