package com.ljf.duanshipin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @Author: LL
 * @Description:
 * @Date:Create：in 2020/8/14 10:50
 */
@Controller("/view")
public class ViewController {

    @RequestMapping("/")
    public String index() {
        return "index";
    }

    @RequestMapping("/login")
    public String login() {
        return "views/login";
    }
}
