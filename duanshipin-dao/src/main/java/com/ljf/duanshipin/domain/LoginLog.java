package com.ljf.duanshipin.domain;

import lombok.Data;
import lombok.experimental.Accessors;

import java.util.Date;

/**
 * @Author: 98762
 * @Date: 2020/9/23 21:04
 * @Description:登录log
 * @备注： 1.
 */
@Data
@Accessors(chain = true)
public class LoginLog {
    private Long id;
    private Long adminId;
    private Date createTime;
    private Date lastTime;
    private Long loginMun;
}
