package com.ljf.duanshipin.domain;

import lombok.Data;
import lombok.experimental.Accessors;

import java.util.Date;

/**
 * @Author: LL
 * @Description:标签
 * @Date:Create：in 2020/10/15 16:12
 */
@Data
@Accessors(chain = true)
public class Tag {
    private Integer id;
    private String name;
    private Date createTime;
    private Date updateTime;
    private Long updateAdminId;
    private String updateAdminName;
    private Integer parentTagId;
    private Integer type;
    /**
     * 不进入数据库使用
     */
    private String parentTagName;
}
