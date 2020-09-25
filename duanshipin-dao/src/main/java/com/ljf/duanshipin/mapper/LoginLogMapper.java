package com.ljf.duanshipin.mapper;

import com.ljf.duanshipin.domain.LoginLog;

/**
 * @Author: LL
 * @Description: 登录log的mapper
 * @Date:Create：in 2020/9/18 10:27
 */
public interface LoginLogMapper {
    void insert(LoginLog loginLog);

    LoginLog findByAdminId(Long adminId);

    void updateByAdminId(LoginLog loginLog);
}
