package com.ljf.duanshipin.service;

import com.ljf.duanshipin.DuanShipinApplication;
import com.ljf.duanshipin.common.utils.Md5Util;
import com.ljf.duanshipin.domain.Admin;
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
 * @Date:Create：in 2020/9/18 10:42
 */
@RunWith(SpringRunner.class)//底层调用SpringJUnit4ClassRunner
@SpringBootTest(classes = {DuanShipinApplication.class})//启动整个springboot工程
@Slf4j
public class AdminServiceTest {

    @Autowired
    private AdminService adminService;

    @Test
    public void insert() {
//        log.info("11");
        Admin admin = new Admin();
        admin.setUserName("admin").setStatus(1)
                .setCreateTime(new Date()).setLastControlAdminId(1L)
                .setLastUpdateTime(new Date()).setPassword(Md5Util.encrypt("admin","123456"))
                .setRoleId(1L).setRealName("");
        adminService.addAdmin(admin);
    }
}
