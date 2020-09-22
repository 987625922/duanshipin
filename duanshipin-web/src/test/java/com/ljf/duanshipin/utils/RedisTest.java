package com.ljf.duanshipin.utils;

import com.ljf.duanshipin.DuanShipinApplication;
import com.ljf.duanshipin.common.utils.RedisTemplateUtil;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

/**
 * @Author: LL
 * @Description:
 * @Date:Create：in 2020/9/22 9:18
 */
@RunWith(SpringRunner.class)
@SpringBootTest(classes = {DuanShipinApplication.class})
public class RedisTest {

    @Autowired
    private RedisTemplateUtil templateUtil;

    @Test
    public void testRedisInsert() {
        templateUtil.set("11", "111");
    }
}
