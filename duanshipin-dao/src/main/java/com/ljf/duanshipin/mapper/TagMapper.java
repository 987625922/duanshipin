package com.ljf.duanshipin.mapper;

import com.ljf.duanshipin.domain.Tag;

import java.util.List;

/**
 * @Author: LL
 * @Description:
 * @Date:Create：in 2020/10/15 16:14
 */
public interface TagMapper {

    void insert(Tag tag);
    List<Tag> getTagList(Integer type);
}
