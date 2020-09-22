package com.ljf.duanshipin.service.Impl;

import com.ljf.duanshipin.domain.Role;
import com.ljf.duanshipin.mapper.RoleMapper;
import com.ljf.duanshipin.service.RoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * @Author: LL
 * @Description:角色的service
 * @Date:Create：in 2020/9/22 11:41
 */
@Service
@Transactional(readOnly = true)
public class RoleServiceImpl implements RoleService {

    @Autowired
    private RoleMapper roleMapper;

    @Transactional(rollbackFor = Exception.class)
    @Override
    public void addRole(Role role) {
        roleMapper.insert(role);
    }

    @Override
    public Role findById(Long id) {
        return roleMapper.findById(id);
    }

    @Override
    public void addPermissionToRoleBaseOnRoleIdAndPermissionId(Long roleId, Long permissionId) {
        roleMapper.addPermissionToRoleBaseOnRoleIdAndPermissionId(roleId, permissionId);
    }
}
