package com.ljf.duanshipin.mapper;

import com.ljf.duanshipin.domain.Admin;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Options;

/**
 * @Author: LL
 * @Description: 管理员
 * @Date:Create：in 2020/9/18 10:27
 */
public interface AdminMapper {

    /**
     * 添加user
     */
    @Insert("INSERT INTO admin(user_name,real_name,phone,status,create_time,last_update_time" +
            ",role_id,last_control_admin_id,password) VALUES(#{userName},#{realName},#{phone},#{status},#{createTime}" +
            ",#{lastUpdateTime},#{roleId},#{lastControlAdminId},#{password})")
    @Options(useGeneratedKeys = true, keyProperty = "id", keyColumn = "id")
//获取返回的主键id
    int insert(Admin admin);


}
