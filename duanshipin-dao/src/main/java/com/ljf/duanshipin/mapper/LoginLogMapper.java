package com.ljf.duanshipin.mapper;

import com.ljf.duanshipin.domain.LoginLog;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Options;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

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
