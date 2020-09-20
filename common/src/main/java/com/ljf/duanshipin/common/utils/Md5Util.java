package com.ljf.duanshipin.common.utils;

import org.apache.shiro.crypto.hash.SimpleHash;

/**
 * @Author: LL
 * @Description: MD5加密工具类
 */
public class Md5Util {

    private static final int HASH_ITERATIONS = 2;

    /**
     * 对密码进行2次md5加密，盐为账号
     *
     * @param salt     账号
     * @param password 密码
     * @return
     */
    public static String encrypt(String salt, String password) {
        if (salt.isEmpty()) {
            return null;
        }
        if (password.isEmpty()) {
            return null;
        }
        return new SimpleHash("md5", password,
                salt.getBytes(), HASH_ITERATIONS).toHex();
    }
}
