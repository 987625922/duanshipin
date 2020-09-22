package com.ljf.duanshipin.service;

import com.ljf.duanshipin.domain.Role;

/**
 * @Author: LL
 * @Description:角色的service
 * @Date:Create：in 2020/9/22 11:41
 */
public interface RoleService {
    void addRole(Role role);

    Role findById(Long id);

    void addPermissionToRoleBaseOnRoleIdAndPermissionId(Long roleId, Long permissionId);
}
