package com.ljf.duanshipin.service.Impl;

import com.ljf.duanshipin.domain.Admin;
import com.ljf.duanshipin.mapper.AdminMapper;
import com.ljf.duanshipin.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @Author: LL
 * @Description:
 * @Date:Create：in 2020/9/18 11:25
 */
@Service
public class AdminServiceImpl implements AdminService {

    @Autowired
    private AdminMapper adminMapper;

    @Override
    public void addAdmin(Admin admin) {
        adminMapper.insert(admin);
    }
}
