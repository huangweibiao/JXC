package com.jxc.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.jxc.entity.SysUser;
import org.apache.ibatis.annotations.Mapper;

/**
 * 系统用户Mapper
 *
 * @author JXC System
 */
@Mapper
public interface SysUserMapper extends BaseMapper<SysUser> {
}
