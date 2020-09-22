package com.ljf.duanshipin.service.Impl;

import com.ljf.duanshipin.domain.Admin;
import com.ljf.duanshipin.mapper.AdminMapper;
import com.ljf.duanshipin.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * @Author: LL
 * @Description:admin的serviece
 * @Date:Create：in 2020/9/18 11:25
 */
@Service
@Transactional(readOnly = true)
public class AdminServiceImpl implements AdminService {

    @Autowired
    private AdminMapper adminMapper;

    @Override
    @Transactional(rollbackFor = Exception.class)
    public void addAdmin(Admin admin) {
        adminMapper.insert(admin);
    }

    @Override
    public Object findAdminByUsername(String userName) {
        return adminMapper.findAdminByUsername(userName);
    }

    @Override
    public Object findAdminByAccount(String account) {
        return adminMapper.findAdminByAccount(account);
    }
}
