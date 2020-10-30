package com.ljf.duanshipin.service.Impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.ljf.duanshipin.common.utils.Md5Util;
import com.ljf.duanshipin.domain.Admin;
import com.ljf.duanshipin.mapper.AdminMapper;
import com.ljf.duanshipin.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

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

    @Override
    public void updateById(Admin admin) {
        adminMapper.updateById(admin);
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public void updatePassword(Long id, String account, String password) {
        Admin admin = new Admin();
        admin.setId(id).setPassword(Md5Util.encrypt(account, password));
        adminMapper.updateById(admin);
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public void update(Admin admin) {
        admin.setAccount(null);
        admin.setPassword(null);
        adminMapper.updateById(admin);
    }

    @Override
    public void toOnline(String albumIds) {
        String[] menuIdsArray = albumIds.split(",");
    }

    @Override
    public PageInfo<Admin> findAdminByIsRobot(Integer pageIndex, Integer pageSize, Integer isRobot) {
        PageHelper.startPage(pageIndex, pageSize);
        List<Admin> list = adminMapper.findAdminByIsRobot(isRobot);
        PageInfo<Admin> pageInfo = new PageInfo<>(list);
        return pageInfo;
    }
}
