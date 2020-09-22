package com.ljf.duanshipin.mapper;

import com.ljf.duanshipin.DuanShipinApplication;
import com.ljf.duanshipin.domain.Permission;
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
 * @Date:Create：in 2020/9/22 11:39
 */
@RunWith(SpringRunner.class)
@SpringBootTest(classes = {DuanShipinApplication.class})
@Slf4j
public class PermissionMapperTest {

    @Autowired
    private PermissionMapper permissionMapper;

    @Test
    public void testInsert() {
        Permission permission = new Permission();
        permission.setIsCatalog(0).setCreateTime(new Date())
                .setLastControlAdminId(1L).setName("测试")
                .setUpdateTime(new Date()).setUrl("");
        permissionMapper.insert(permission);
    }

    @Test
    public void findByPermissionListByRoleId() {
        permissionMapper.findByPermissionListByRoleId(4L).forEach(bean -> {
            log.info(bean.toString());
        });
    }
}
