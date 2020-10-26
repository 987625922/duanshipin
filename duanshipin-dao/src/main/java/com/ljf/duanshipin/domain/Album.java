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
    //简介
    private String introduction;
    //推荐语
    private String recommendation;
    private String imgSrc;
    private Integer totalMun;
    private Integer currentMun;
    private Date createTime;
    private Date updateTime;
    private Long updateAdminId;
    private String updateAdminName;
    //是否完结
    private Integer isComplete;
    //导演
    private String director;
    //一级标签id
    private Integer oneClassTagsId;
    //二级标签id
    private Integer twoClassTagsId;
    //三级标签id
    private Integer threeClassTagsId;
    //绑定客户
    private Long adminId;
    //是否屏蔽搜索
    private Integer isBlockSearch;
}
