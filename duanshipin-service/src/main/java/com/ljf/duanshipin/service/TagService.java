package com.ljf.duanshipin.service;

import com.github.pagehelper.PageInfo;
import com.ljf.duanshipin.domain.Tag;

import java.util.List;

/**
 * @Author: LL
 * @Description:
 * @Date:Create：in 2020/10/15 16:54
 */
public interface TagService {
    void insert(Tag tag);

    PageInfo<Tag> getTagForPage(Integer pageIndex, Integer pageSize,Integer type);

    void delete(Integer id);

    PageInfo<Tag> getTagByNameAndType(Integer pageIndex, Integer pageSize,String name, Integer type);
}
