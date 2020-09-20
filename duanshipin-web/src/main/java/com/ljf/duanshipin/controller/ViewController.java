package com.ljf.duanshipin.controller;

import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
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
public class ViewController {

    /**
     * 首页
     *
     * @return
     */
    @RequestMapping("/")
    public Object index() {
        ModelAndView mav = new ModelAndView();
        mav.setViewName("index");
        return mav;
    }

    /**
     * 登录界面
     *
     * @return
     */
    @RequestMapping("/login")
    public Object login() {
        ModelAndView mav = new ModelAndView();
        mav.setViewName("views/login");
        return mav;
    }

    /**
     * 运营专辑管理
     */
    @RequestMapping("/content/albumManage")
    public Object albumManage(){
        ModelAndView mav = new ModelAndView();
        mav.setViewName("views/content/albumOperationVideo");
        return mav;
    }
}
