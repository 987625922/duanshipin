package com.ljf.duanshipin.service;

import com.ljf.duanshipin.domain.LoginLog;

public interface LoginLogService {
    LoginLog findByAdminId(Long adminId);
    void addLoginLog(LoginLog loginLog);
}
