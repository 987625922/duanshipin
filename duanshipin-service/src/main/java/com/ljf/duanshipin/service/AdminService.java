package com.ljf.duanshipin.service;

import com.github.pagehelper.PageInfo;
import com.ljf.duanshipin.domain.Admin;

/**
 * @Author: LL
 * @Description:
 * @Date:Create：in 2020/9/18 11:24
 */
public interface AdminService {
    void addAdmin(Admin admin);

    Object findAdminByUsername(String userName);

    Object findAdminByAccount(String account);

    void updateById(Admin admin);

    void updatePassword(Long id,String account,String password);

    void update(Admin admin);

    void toOnline(String albumIds);

    PageInfo<Admin> findAdminByIsRobot(Integer pageIndex, Integer pageSize, Integer isRobot);

    Admin getAdminById(Long id);

    PageInfo<Admin> getAdminsByPage(Integer currentPage,Integer pageSize);
}
