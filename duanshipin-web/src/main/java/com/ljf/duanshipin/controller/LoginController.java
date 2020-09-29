package com.ljf.duanshipin.controller;

import com.ljf.duanshipin.common.dto.JsonResult;
import com.ljf.duanshipin.service.Impl.ValidateCodeService;
import com.ljf.duanshipin.service.LoginLogService;
import lombok.extern.slf4j.Slf4j;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

/**
 * @Author: LL
 * @Description: 登录注册逻辑相关controller
 * @Date:Create：in 2020/9/18 17:12
 */
@Slf4j
@RestController
@RequestMapping("/api")
public class LoginController extends BaseController {

    /**
     * 登录验证码的service
     */
    @Autowired
    private ValidateCodeService validateCodeService;
    @Autowired
    private LoginLogService loginLogService;

    @PostMapping("/login")
    public Object login(String account, String password, String verifyCode,
                        String verifyKey,
                        @RequestParam(required = false) boolean rememberMe) {
//        validateCodeService.check(verifyKey, verifyCode);
        UsernamePasswordToken token = new UsernamePasswordToken(account, password,
                rememberMe);
        super.login(token);
        loginLogService.updateOrInsertByAdminId(getCurrentAdmin().getId());
        return JsonResult.buildSuccess();
    }

    @GetMapping("/captcha")
    public Object captcha() {
        return JsonResult.buildSuccess(validateCodeService.create());
    }

    @GetMapping("/changePassword")
    public Object changePassword() {

        return JsonResult.buildSuccess();
    }
}
