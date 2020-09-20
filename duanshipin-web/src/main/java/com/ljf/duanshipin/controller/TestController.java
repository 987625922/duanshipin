package com.ljf.duanshipin.controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * @Author: 98762
 * @Date: 2020/9/20 13:37
 * @Description: 测试controller类
 * @备注： 1.
 */
@RestController
@RequestMapping("/test")
public class TestController {

    @RequestMapping("/getTest")
    public Object getTest() {
        return "test body";
    }
}
