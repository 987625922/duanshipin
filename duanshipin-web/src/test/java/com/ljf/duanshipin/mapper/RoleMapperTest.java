package com.ljf.duanshipin.mapper;

import com.ljf.duanshipin.DuanShipinApplication;
import com.ljf.duanshipin.domain.Role;
import lombok.extern.slf4j.Slf4j;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import java.util.Date;

/**
 * @Author: LL
 * @Description:
 * @Date:Create：in 2020/9/22 10:50
 */
@RunWith(SpringRunner.class)
@SpringBootTest(classes = {DuanShipinApplication.class})
@Slf4j
public class RoleMapperTest {

    @Autowired
    private RoleMapper roleMapper;

    @Test
    public void test() {
        Date date = new Date();

        Role role = new Role();
        role.setRole("admin");
        role.setDescription("管理员");
        role.setCreateTime(date);
        role.setLastTime(date);
        role.setIsAvailable(1);
        role.setMunber(0);
        role.setLastControlAdminId(1L);

        Role role2 = new Role();
        role2.setRole("operate");
        role2.setDescription("运营");
        role2.setCreateTime(date);
        role2.setLastTime(date);
        role2.setIsAvailable(1);
        role2.setMunber(0);
        role2.setLastControlAdminId(1L);

        Role role3 = new Role();
        role3.setRole("generalStaff");
        role3.setDescription("普通人员");
        role3.setCreateTime(date);
        role3.setLastTime(date);
        role3.setIsAvailable(1);
        role3.setMunber(0);
        role3.setLastControlAdminId(1L);

        roleMapper.insert(role);
        roleMapper.insert(role2);
        roleMapper.insert(role3);
    }

    @Test
    public void testFindById() {
        Role role = roleMapper.findById(4L);
        log.info(role.toString());
    }

    @Test
    public void testRelationRolePermission(){
        roleMapper.addPermissionToRoleBaseOnRoleIdAndPermissionId(7L,2L);
    }

}
