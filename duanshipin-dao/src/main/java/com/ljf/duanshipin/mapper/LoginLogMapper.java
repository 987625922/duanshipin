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

    @Insert("INSERT INTO login_log(admin_id,create_time,last_time,login_mun) VALUES(#{adminId}" +
            ",#{createTime},#{lastTime},#{loginMun})")
    @Options(useGeneratedKeys = true, keyProperty = "id", keyColumn = "id")
    void insert(LoginLog loginLog);

    @Select("SELECT * FROM login_log WHERE admin_id = #{adminId}")
    LoginLog findByAdminId(Long adminId);

    void updateByAdminId(LoginLog loginLog);
}
