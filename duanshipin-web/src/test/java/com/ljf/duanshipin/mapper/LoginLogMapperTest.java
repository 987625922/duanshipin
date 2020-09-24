package com.ljf.duanshipin.mapper;

import com.ljf.duanshipin.DuanShipinApplication;
import com.ljf.duanshipin.domain.LoginLog;
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
 * @Date:Create：in 2020/9/24 15:23
 */
@RunWith(SpringRunner.class)
@SpringBootTest(classes = {DuanShipinApplication.class})
@Slf4j
public class LoginLogMapperTest {

    @Autowired
    private LoginLogMapper loginLogMapper;

    @Test
    public void insert() {
        LoginLog loginLog = new LoginLog();
        loginLog.setAdminId(9L).setCreateTime(new Date())
                .setLastTime(new Date()).setLoginMun(0L);
        loginLogMapper.insert(loginLog);
    }

    @Test
    public void findByAdminId() {
        LoginLog loginLog = loginLogMapper.findByAdminId(((9L)));
        log.info(loginLog.toString());
    }

    @Test
    public void update() {
        LoginLog loginLog = new LoginLog();
        loginLog.setAdminId(9L);
        loginLog.setLastTime(new Date());
        loginLogMapper.updateByAdminId(loginLog);
    }
}
