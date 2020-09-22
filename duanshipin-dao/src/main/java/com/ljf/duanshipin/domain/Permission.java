package com.ljf.duanshipin.domain;

import lombok.Data;
import lombok.experimental.Accessors;

import java.io.Serializable;
import java.util.Date;

/**
 * @Author: LL
 * @Description:权限的bean
 * @Date:Create：in 2020/9/22 11:15
 */
@Data
@Accessors(chain = true)
public class Permission implements Serializable {
    private static final long serialVersionUID = 9201371306159293971L;
    private Long id;
    private String name;
    private Integer isCatalog;
    private String url;
    private Long theLastLevelCatalogId;
    private Date createTime;
    private Date updateTime;
    private Long lastControlAdminId;
}
