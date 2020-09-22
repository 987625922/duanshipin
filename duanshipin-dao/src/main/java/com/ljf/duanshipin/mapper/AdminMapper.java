package com.ljf.duanshipin.mapper;

import com.ljf.duanshipin.domain.Admin;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Options;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

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
            ",role_id,last_control_admin_id,password,account) VALUES(#{userName},#{realName},#{phone},#{status},#{createTime}" +
            ",#{lastUpdateTime},#{roleId},#{lastControlAdminId},#{password},#{account})")
    @Options(useGeneratedKeys = true, keyProperty = "id", keyColumn = "id")
    int insert(Admin admin);

    /**
     * 根据用户名获取admin
     *
     * @param userName
     * @return
     */
    @Select("SELECT id,user_name as userName,real_name as realName" +
            ",phone,status,last_update_time as lastUpdateTime,create_time as " +
            "createTime,account,last_control_admin_id as lastControlAdminId" +
            ",role_id as roleId,password FROM admin WHERE user_name = #{userName}")
    Admin findAdminByUsername(@Param("userName") String userName);

    /**
     * 根据账号获取admin
     *
     * @param account
     * @return
     */
    @Select("SELECT * FROM admin WHERE account = #{account}")
    Admin findAdminByAccount(@Param("account") String account);
}
