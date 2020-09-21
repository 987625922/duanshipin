package com.ljf.duanshipin.domain;

import lombok.Data;
import lombok.experimental.Accessors;

import java.util.Date;

/**
 * @Author: LL
 * @Description: 管理员bean
 * @Date:Create：in 2020/9/18 10:30
 */
@Accessors(chain = true)
@Data
public class Admin {
    private Long id;
    private String userName;
    private String realName;
    private String phone;
    private Integer status;
    private Date lastUpdateTime;
    private Date createTime;
    private String account;
    /**
     * 上一次操作该管理员的管理员id
     */
    private Long lastControlAdminId;
    /**
     * 角色id
     */
    private Long roleId;
    private String password;
}
