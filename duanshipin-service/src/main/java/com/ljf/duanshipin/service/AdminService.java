package com.ljf.duanshipin.service;

import com.ljf.duanshipin.domain.Admin;

/**
 * @Author: LL
 * @Description:
 * @Date:Create：in 2020/9/18 11:24
 */
public interface AdminService {
    void addAdmin(Admin admin);
    Object findUsernameByUser(String userName);
    Object findAccountByUser(String account);
}
