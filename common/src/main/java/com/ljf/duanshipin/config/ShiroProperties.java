package com.ljf.duanshipin.config;

import lombok.Data;

/**
 * @Author: 98762
 * @Date: 2020/9/20 15:17
 * @Description: 此项目的shiro的Properties
 * @备注： 1.
 */
@Data
public class ShiroProperties {

    private long sessionTimeout;
    private int cookieTimeout;
    private String anonUrl;
    private String loginUrl;
    private String successUrl;
    private String logoutUrl;
    private String unauthorizedUrl;
}
