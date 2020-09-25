package com.ljf.duanshipin.service.Impl;

import com.ljf.duanshipin.domain.LoginLog;
import com.ljf.duanshipin.mapper.LoginLogMapper;
import com.ljf.duanshipin.service.LoginLogService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @Author: 98762
 * @Date: 2020/9/23 21:19
 * @Description:登录log的service
 * @备注： 1.
 */
@Service
public class LoginLogServiceImpl implements LoginLogService {

    @Autowired
    private LoginLogMapper loginLogMapper;

    @Override
    public LoginLog findByAdminId(Long adminId) {
//        return loginLogMapper.findByAdminId(adminId);
        return null;
    }

    @Override
    public void addLoginLog(LoginLog loginLog) {
//        loginLogMapper.insert(loginLog);
    }
}
