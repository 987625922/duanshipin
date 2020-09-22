package com.ljf.duanshipin.service.Impl;

import com.ljf.duanshipin.domain.Permission;
import com.ljf.duanshipin.mapper.PermissionMapper;
import com.ljf.duanshipin.service.PermissionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * @Author: LL
 * @Description: 权限service的实现
 * @Date:Create：in 2020/9/22 13:36
 */
@Transactional(readOnly = true)
public class PermissionServiceImpl implements PermissionService {

    @Autowired
    private PermissionMapper permissionMapper;

    @Override
    public List<Permission> findByPermissionListByRoleId(Long roleId) {
        return permissionMapper.findByPermissionListByRoleId(roleId);
    }
}
