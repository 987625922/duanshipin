package com.ljf.duanshipin.mapper;

import com.ljf.duanshipin.domain.Role;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

/**
 * @Author: LL
 * @Description:角色mapper
 * @Date:Create：in 2020/9/22 10:34
 */
public interface RoleMapper {

    /**
     * 添加角色
     *
     * @param role
     */
    void insert(Role role);

    /**
     * 根据id获取角色
     *
     * @param id
     * @return
     */
    Role findById(Long id);

    /**
     * 根据角色id和权限id给角色添加权限
     *
     * @param roleId
     * @param permissionId
     */
    void addPermissionToRoleBaseOnRoleIdAndPermissionId(Long roleId, Long permissionId);
}
