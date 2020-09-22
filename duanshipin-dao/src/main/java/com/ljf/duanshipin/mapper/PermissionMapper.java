package com.ljf.duanshipin.mapper;

import com.ljf.duanshipin.domain.Permission;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import java.util.List;

/**
 * @Author: LL
 * @Description:权限mapper
 * @Date:Create：in 2020/9/22 11:15
 */
public interface PermissionMapper {

    /**
     * 添加权限
     *
     * @param permission
     */
    @Insert("INSERT INTO permission(name,is_catalog,url,the_last_level_catalog_id," +
            "create_time,update_time,last_control_admin_id) VALUES(" +
            "#{name},#{isCatalog},#{url},#{theLastLevelCatalogId},#{createTime}," +
            "#{updateTime},#{lastControlAdminId})")
    void insert(Permission permission);

    /**
     * 根据角色id获取其下的权限列表
     *
     * @param roleId
     * @return
     */
    @Select("SELECT * FROM permission LEFT JOIN role_permission ON " +
            "role_permission.permission_id = permission.id AND " +
            "role_permission.role_id = #{roleId}")
    List<Permission> findByPermissionListByRoleId(Long roleId);
}
