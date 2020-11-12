package com.ljf.duanshipin.domain;

import lombok.Data;
import lombok.experimental.Accessors;

import java.util.Date;

/**
 * @Author: LL
 * @Description:
 * @Date:Create：in 2020/11/10 17:53
 */
@Data
@Accessors(chain = true)
public class Video {
    private Integer id;
    private String title;
    private String introduction;
    private String img;
    private Integer numberOfPlays;
    private Integer numberOfGoods;
    private Date updateTime;
    private Long controllerAdminId;
    private Date createTime;
    private Integer type;
    private Integer isUserPublish;
    private Admin admin;
}
