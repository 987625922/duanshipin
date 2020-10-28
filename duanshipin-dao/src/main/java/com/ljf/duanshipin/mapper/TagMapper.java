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

    Tag getTagById(Integer id);

    String getTagNameById(Integer id);

    void detele(Integer id);

    List<Tag> getTagByNameAndType(String name, Integer type);

    List<Tag> selectByParentId(Integer type, Integer parentTagId);
}
