package com.ljf.duanshipin.domain;

import lombok.Data;
import lombok.experimental.Accessors;

import java.io.Serializable;
import java.util.Date;

/**
 * @Author: LL
 * @Description: 管理员bean
 * @Date:Create：in 2020/9/18 10:30
 */
@Accessors(chain = true)
@Data
public class Admin implements Serializable {

    private static final long serialVersionUID = -6894575627133924440L;

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
    //是否是机器人
    private Integer isRobot;

}
