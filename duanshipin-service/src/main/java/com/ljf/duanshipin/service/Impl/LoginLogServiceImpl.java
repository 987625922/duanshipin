package com.ljf.duanshipin.service.Impl;

import com.ljf.duanshipin.domain.LoginLog;
import com.ljf.duanshipin.mapper.LoginLogMapper;
import com.ljf.duanshipin.service.LoginLogService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;

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
        return loginLogMapper.findByAdminId(adminId);
    }

    @Override
    public void addLoginLog(LoginLog loginLog) {
        loginLogMapper.insert(loginLog);
    }

    @Override
    public void updateByAdminId(LoginLog loginLog) {
        loginLogMapper.updateByAdminId(loginLog);
    }

    @Override
    public void updateOrInsertByAdminId(Long adminId) {
        Date date = new Date();
        LoginLog loginLog = findByAdminId(adminId);
        if (loginLog != null) {
            loginLog.setLastTime(date)
                    .setAdminId(adminId)
                    .setLoginMun(loginLog.getLoginMun() + 1);
            updateByAdminId(loginLog);
        } else {
            loginLog = new LoginLog();
            loginLog.setCreateTime(date)
                    .setAdminId(adminId)
                    .setLastTime(date)
                    .setLoginMun(0L);
            addLoginLog(loginLog);
        }
    }
}
