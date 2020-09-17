package com.ljf.duanshipin.controller;

import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @Author: LL
 * @Description:页面的控制器
 * @Date:Create：in 2020/8/14 10:50
 */
@RequestMapping("/view")
@Controller
@Slf4j
public class ViewController {
    /**
     * 首页
     *
     * @return
     */
    @RequestMapping("/")
    public String index() {
        return "index";
    }

    /**
     * 登录界面
     *
     * @return
     */
    @RequestMapping("/login")
    public String login() {
        return "views/login";
    }

    /**
     * 运营专辑管理
     */
    @RequestMapping("/content/albumManage")
    public String albumManage(){
        return "views/content/albumOperationVideo";
    }
}
