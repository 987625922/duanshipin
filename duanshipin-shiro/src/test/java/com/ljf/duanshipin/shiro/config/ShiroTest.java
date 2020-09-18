package com.ljf.duanshipin.shiro.config;

import com.ljf.duanshipin.common.utils.Md5Util;
import lombok.extern.slf4j.Slf4j;
//import org.apache.shiro.crypto.hash.SimpleHash;
import org.junit.Test;

/**
 * @Author: LL
 * @Description:
 * @Date:Create：in 2020/9/18 16:34
 */
@Slf4j
public class ShiroTest {
    @Test
    public void md5Test() {
        log.info(Md5Util.encrypt("admin", "123456"));

//        String s = new SimpleHash("md5", "123456",
//                "admin".getBytes(), 1).toHex();
//        log.info(s);
    }
}
