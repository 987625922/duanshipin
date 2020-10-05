package com.ljf.duanshipin.domain;

import lombok.Data;
import lombok.experimental.Accessors;

import java.util.Date;

/**
 * @Author: 98762
 * @Date: 2020/10/5 19:25
 * @Description:专辑bean
 * @备注： 1.
 */
@Data
@Accessors(chain = true)
public class Album {
    private Long id;
    private String title;
    private String introduction;
    private String imgSrc;
    private Integer totalMun;
    private Integer currentMun;
    private Date createTime;
    private Date updateTime;
    private Long updateAdminId;
}
