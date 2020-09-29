package com.ljf.duanshipin.mapper;

import com.ljf.duanshipin.domain.Admin;

/**
 * @Author: LL
 * @Description: 管理员
 * @Date:Create：in 2020/9/18 10:27
 */
public interface AdminMapper {

    /**
     * 添加user
     */
    int insert(Admin admin);

    /**
     * 根据用户名获取admin
     *
     * @param userName
     * @return
     */
    Admin findAdminByUsername(String userName);

    /**
     * 根据账号获取admin
     *
     * @param account
     * @return
     */
    Admin findAdminByAccount(String account);

    /**
     * 更新
     * @param admin
     */
    void updateById(Admin admin);
}
