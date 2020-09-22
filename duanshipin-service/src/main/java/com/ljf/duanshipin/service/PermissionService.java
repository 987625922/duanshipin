package com.ljf.duanshipin.service;

import com.ljf.duanshipin.domain.Permission;

import java.util.List;

/**
 * @Author: LL
 * @Description:权限的service
 * @Date:Create：in 2020/9/22 13:36
 */
public interface PermissionService {

    /**
     * 根据角色id获取权限集合
     *
     * @param roleId
     * @return
     */
    List<Permission> findByPermissionListByRoleId(Long roleId);

}
