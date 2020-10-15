package com.ljf.duanshipin.service;

import com.github.pagehelper.PageInfo;
import com.ljf.duanshipin.domain.Tag;

/**
 * @Author: LL
 * @Description:
 * @Date:Create：in 2020/10/15 16:54
 */
public interface TagService {
    void insert(Tag tag);

    PageInfo<Tag> getTagForPage(Integer pageIndex, Integer pageSize,Integer type);
}
