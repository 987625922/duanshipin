package com.ljf.duanshipin.utils;

import com.ljf.duanshipin.domain.Admin;
import org.apache.shiro.SecurityUtils;

/**
 * @Author: LL
 * @Description:shiro的工具类
 * @Date:Create：in 2020/9/29 14:13
 */
public class ShiroUtil {

    /**
     * 获取后台登录的bean
     * @return
     */
    public static Admin getAdmin() {
        return (Admin) SecurityUtils.getSubject().getPrincipal();
    }
}
