package com.ljf.duanshipin.common.utils;

import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;

/**
 * @Author: LL
 * @Description:
 * @Date:Create：in 2020/9/18 16:30
 */
@Slf4j
public class Md5UtilTest {
    @Test
    public void md5() {
        log.info(Md5Util.encrypt("admin", "123456"));
    }
}
