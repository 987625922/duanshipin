package com.ljf.duanshipin.mapper;

import com.ljf.duanshipin.domain.Permission;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import java.util.List;

/**
 * @Author: LL
 * @Description:权限mapper
 * @Date:Create：in 2020/9/22 11:15
 */
public interface PermissionMapper {

    /**
     * 添加权限
     *
     * @param permission
     */
    void insert(Permission permission);

    /**
     * 根据角色id获取其下的权限列表
     *
     * @param roleId
     * @return
     */
    List<Permission> findByPermissionListByRoleId(Long roleId);
}
