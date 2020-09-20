package com.ljf.duanshipin.controller;

import com.ljf.duanshipin.common.utils.Md5Util;
import lombok.extern.slf4j.Slf4j;
//import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

/**
 * @Author: LL
 * @Description: 登录注册逻辑相关controller
 * @Date:Create：in 2020/9/18 17:12
 */
@Slf4j
@RestController
public class LoginController extends BaseController {

    @PostMapping("/login")
    public Object login(@RequestParam(required = false) String username,
                      @RequestParam(required = false) String password,
                      @RequestParam(required = false) String verifyCode,
                      @RequestParam(required = false) boolean rememberMe,
                      @RequestParam(required = false) HttpServletRequest request) {
        log.info(username+" "+password);
        password = Md5Util.encrypt(username.toLowerCase(), password);
        UsernamePasswordToken token = new UsernamePasswordToken(username, password, rememberMe);
        super.login(token);
        return "login test";
    }
}
