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
     * 内容 -》 专辑管理
     */
    @RequestMapping("/content/albumOperationVideo")
    public Object albumManage() {
        ModelAndView mav = new ModelAndView();
        mav.setViewName("views/content/albumOperationVideo");
        return mav;
    }

    /**
     * 内容 -》 影视管理
     */
    @RequestMapping("/content/videoOperation")
    public Object videoOperation() {
        ModelAndView mav = new ModelAndView();
        mav.setViewName("views/content/videoOperation");
        return mav;
    }

    /**
     * 内容 -》 标签管理
     */
    @RequestMapping("/content/tags")
    public Object tags() {
        ModelAndView mav = new ModelAndView();
        mav.setViewName("views/content/tags");
        return mav;
    }

    /**
     * 内容 -》 专辑管理 -》 用户视频池
     */
    @RequestMapping("/content/albumUserVideo")
    public Object albumUserVideo() {
        ModelAndView mav = new ModelAndView();
        mav.setViewName("views/content/albumUserVideo");
        return mav;
    }

    /**
     * 内容 -》 专辑管理 -》 用户视频池
     */
    @RequestMapping("/content/videoUser")
    public Object videoUser() {
        ModelAndView mav = new ModelAndView();
        mav.setViewName("views/content/videoUser");
        return mav;
    }


    /**
     * 内容 -》 专辑管理 -》 发布专辑
     */
    @RequestMapping("/content/publishAlbum")
    public Object publishAlbum() {
        ModelAndView mav = new ModelAndView();
        mav.setViewName("views/content/publishAlbum");
        return mav;
    }

    /**
     * 内容 -》 专辑管理 -》 修改专辑
     */
    @RequestMapping("/content/editAlbum")
    public Object editAlbum() {
        ModelAndView mav = new ModelAndView();
        mav.setViewName("views/content/editAlbum");
        return mav;
    }

    @RequestMapping("/content/albumVideoManager")
    public Object albumVideoManager() {
        ModelAndView mav = new ModelAndView();
        mav.setViewName("views/content/albumVideoManager");
        return mav;
    }

    @RequestMapping("/content/albumpreview")
    public Object albumpreview() {
        ModelAndView mav = new ModelAndView();
        mav.setViewName("views/content/albumpreview");
        return mav;
    }

    @RequestMapping("/content/videoPreview")
    public Object videopreview() {
        ModelAndView mav = new ModelAndView();
        mav.setViewName("views/content/videoPreview");
        return mav;
    }

    @RequestMapping("/content/publishVideo")
    public Object publishVideo() {
        ModelAndView mav = new ModelAndView();
        mav.setViewName("views/content/publishVideo");
        return mav;
    }

    @RequestMapping("/content/commentManager")
    public Object commentManager() {
        ModelAndView mav = new ModelAndView();
        mav.setViewName("views/content/commentManager");
        return mav;
    }

    @RequestMapping("/content/editVideo")
    public Object editVideo(){
        ModelAndView mav = new ModelAndView();
        mav.setViewName("views/content/editVideo");
        return mav;
    }

}
