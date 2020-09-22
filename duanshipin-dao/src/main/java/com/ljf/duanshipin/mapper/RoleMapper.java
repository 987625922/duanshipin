package com.ljf.duanshipin.mapper;

import com.ljf.duanshipin.domain.Role;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

/**
 * @Author: LL
 * @Description:角色mapper
 * @Date:Create：in 2020/9/22 10:34
 */
public interface RoleMapper {

    /**
     * 添加角色
     *
     * @param role
     */
    @Insert("INSERT INTO role(role,munber,remarks,create_time,last_time," +
            "last_control_admin_id,is_available,description) VALUES(" +
            "#{role},#{munber},#{remarks},#{createTime},#{lastTime}," +
            "#{lastControlAdminId},#{isAvailable},#{description})")
    void insert(Role role);

    /**
     * 根据id获取角色
     *
     * @param id
     * @return
     */
    @Select("SELECT id,role,munber,remarks,create_time as createTime" +
            ",last_time as lastTime,last_control_admin_id as lastControlAdminId" +
            ",is_available as isAvailable,description FROM role WHERE id = #{id}")
    Role findById(Long id);

    /**
     * 根据角色id和权限id给角色添加权限
     *
     * @param roleId
     * @param permissionId
     */
    @Insert("INSERT INTO role_permission(role_id,permission_id)" +
            " VALUES(#{roleId},#{permissionId})")
    void addPermissionToRoleBaseOnRoleIdAndPermissionId(Long roleId, Long permissionId);
}
