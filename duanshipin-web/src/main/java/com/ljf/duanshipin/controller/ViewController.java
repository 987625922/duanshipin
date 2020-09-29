package com.ljf.duanshipin.controller;

import com.ljf.duanshipin.domain.Admin;
import com.ljf.duanshipin.domain.LoginLog;
import com.ljf.duanshipin.domain.Role;
import com.ljf.duanshipin.service.LoginLogService;
import com.ljf.duanshipin.service.RoleService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

/**
 * @Author: LL
 * @Description:页面的控制器
 * @Date:Create：in 2020/8/14 10:50
 */
@RequestMapping("/views")
@Controller
@Slf4j
public class ViewController extends BaseController {

    @Autowired
    private RoleService roleService;
    @Autowired
    private LoginLogService loginLogService;

    /**
     * 首页
     *
     * @return
     */
    @RequestMapping({"/", "/index"})
    public Object index() {
        Admin admin = getCurrentAdmin();
        Role role = roleService.findById(admin.getRoleId());
        LoginLog loginLog = loginLogService.findByAdminId(admin.getId());
        ModelAndView mav = new ModelAndView();
        mav.setViewName("index");
        mav.addObject("userName", admin.getUserName());
        mav.addObject("role", role.getDescription());
        mav.addObject("lastLoginTime", loginLog.getLastLastTime());
        mav.addObject("loginMun", loginLog.getLoginMun());
        return mav;
    }

    /**
     * 登录界面
     *
     * @return
     */
    @GetMapping("/login")
    public Object login() {
        ModelAndView mav = new ModelAndView();
        mav.setViewName("views/login");
        return mav;
    }

    /**
     * 运营专辑管理
     */
    @RequestMapping("/content/albumManage")
    public Object albumManage() {
        ModelAndView mav = new ModelAndView();
        mav.setViewName("views/content/albumOperationVideo");
        return mav;
    }
}
