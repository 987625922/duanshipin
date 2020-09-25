package com.ljf.duanshipin.mapper;

import com.ljf.duanshipin.domain.Admin;
import com.ljf.duanshipin.DuanShipinApplication;
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
public class AdminMapperTest {

    @Autowired
    private AdminMapper adminMapper;

    @Test
    public void insert() {
//        log.info("11");
        Admin admin = new Admin();
        admin.setUserName("ljf@qq.com").setStatus(1)
                .setCreateTime(new Date()).setLastControlAdminId(1L)
                .setLastUpdateTime(new Date()).setPassword("123456")
                .setRoleId(1L).setRealName("").setAccount("admin2");
        adminMapper.insert(admin);
    }

    @Test
    public void findByAccount(){
        Admin admin = adminMapper.findAdminByAccount("admin2");
        log.info(admin.toString());
    }
}
