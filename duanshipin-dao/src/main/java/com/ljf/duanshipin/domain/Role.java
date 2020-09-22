package com.ljf.duanshipin.domain;

import lombok.Data;
import lombok.experimental.Accessors;

import java.io.Serializable;
import java.util.Date;

/**
 * @Author: LL
 * @Descriptin:角色的bean
 * @Date:Create：in 2020/9/22 10:43
 */
@Data
@Accessors(chain = true)
public class Role implements Serializable {
    private static final long serialVersionUID = -3165005657044182593L;
    private Long id;
    private String role;
    private Integer munber;
    private String remarks;
    private Date createTime;
    private Date lastTime;
    private Long lastControlAdminId;
//    是否可以使用
    private Integer isAvailable;
    private String description;
}
