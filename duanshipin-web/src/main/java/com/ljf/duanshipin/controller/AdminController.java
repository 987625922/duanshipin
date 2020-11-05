package com.ljf.duanshipin.controller;

import com.ljf.duanshipin.common.dto.JsonResult;
import com.ljf.duanshipin.common.exception.StatusEnum;
import com.ljf.duanshipin.common.utils.Md5Util;
import com.ljf.duanshipin.domain.Admin;
import com.ljf.duanshipin.service.AdminService;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.validation.constraints.NotBlank;

/**
 * @Author: LL
 * @Description:admin的controller
 * @Date:Create：in 2020/9/29 13:48
 */
@Slf4j
@RestController
@RequestMapping("/api/admin")
public class AdminController extends BaseController {

    @Autowired
    private AdminService adminService;

    /**
     * 修改密码
     *
     * @param oldPassword
     * @param newPassword
     * @return
     */
    @GetMapping("/changePassword")
    public Object changePassword(@NotBlank(message = "{required}") String oldPassword,
                                 @NotBlank(message = "{required}") String newPassword) {
        if (!StringUtils.equals(getCurrentAdmin().getPassword(),
                Md5Util.encrypt(getCurrentAdmin().getPassword(), oldPassword))) {
            return JsonResult.buildStatus(StatusEnum.ACCOUNT_PASSWORD_ERROR);
        }
        adminService.updatePassword(getCurrentAdmin().getId(), getCurrentAdmin().getAccount(), newPassword);
        return JsonResult.buildSuccess();
    }

    @PostMapping("/update")
    public Object update(Admin admin) {
        admin.setId(getCurrentAdmin().getId());
        adminService.update(admin);
        return JsonResult.buildSuccess();
    }

    @RequestMapping("/getByIsRobot")
    public Object getByIsRobot(@RequestParam(value = "pageIndex", defaultValue = "1") Integer pageIndex,
                               @RequestParam(value = "pageSize", defaultValue = "10") Integer pageSize,
                               @RequestParam(defaultValue = "0") Integer isRobot) {
        return JsonResult.buildSuccess(adminService.findAdminByIsRobot(pageIndex, pageSize, isRobot));
    }


    @RequestMapping("/getAdminById")
    public Object getAdminById(Long id){
        return JsonResult.buildSuccess(adminService.getAdminById(id));
    }
}
