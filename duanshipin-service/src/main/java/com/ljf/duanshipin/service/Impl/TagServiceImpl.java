package com.ljf.duanshipin.service.Impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.ljf.duanshipin.domain.Tag;
import com.ljf.duanshipin.mapper.TagMapper;
import com.ljf.duanshipin.service.TagService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Arrays;
import java.util.Date;
import java.util.List;

/**
 * @Author: LL
 * @Description:
 * @Date:Create：in 2020/10/15 16:54
 */
@Service
@Transactional(readOnly = true)
public class TagServiceImpl implements TagService {
    @Autowired
    private TagMapper tagMapper;

    @Override
    @Transactional(rollbackFor = Exception.class)
    public void insert(Tag tag) {
        Date date = new Date();
        tag.setCreateTime(date).setUpdateTime(date);
        tagMapper.insert(tag);
    }

    @Override
    public PageInfo<Tag> getTagForPage(Integer pageIndex, Integer pageSize, Integer type) {
        PageHelper.startPage(pageIndex, pageSize);
        List<Tag> tagList = tagMapper.getTagList(type);
        PageInfo<Tag> pageInfo = new PageInfo<>(tagList);
        pageInfo.getList().forEach(tag -> {
            if (tag.getParentTagId() != -1) {
                tag.setParentTagName(tagMapper.getTagNameById(tag.getParentTagId()));
            }
        });
        return pageInfo;
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public void delete(Integer id) {
        tagMapper.detele(id);
    }

    @Override
    public PageInfo<Tag> getTagByNameAndType(Integer pageIndex, Integer pageSize, String name, Integer type) {
        PageHelper.startPage(pageIndex, pageSize);
        List<Tag> tagList = tagMapper.getTagByNameAndType(name, type);
        PageInfo<Tag> pageInfo = new PageInfo<>(tagList);
        pageInfo.getList().forEach(tag -> {
            if (tag.getParentTagId() != -1) {
                tag.setParentTagName(tagMapper.getTagNameById(tag.getParentTagId()));
            }
        });
        return pageInfo;
    }

    @Override
    public PageInfo<Tag> selectByParentId(Integer pageIndex, Integer pageSize,
                                          Integer type, Integer parentId) {
        PageHelper.startPage(pageIndex, pageSize);
        List<Tag> tagList = tagMapper.selectByParentId(type, parentId);
        PageInfo<Tag> pageInfo = new PageInfo<>(tagList);
        return pageInfo;
    }

    @Override
    public PageInfo<Tag> selectByMoreParentId(Integer pageIndex, Integer pageSize,
                                              Integer type, String parentTagIds) {
        List<String> idList = Arrays.asList(parentTagIds.split(","));
        PageHelper.startPage(pageIndex, pageSize);
        List<Tag> tagList = tagMapper.selectByMoreParentId(type, idList);
        PageInfo<Tag> pageInfo = new PageInfo<>(tagList);
        return pageInfo;
    }

    @Override
    public Tag getTagById(Integer id) {
        return tagMapper.getTagById(id);
    }

    @Override
    public List<Tag> getTagsByIds(String ids) {
        return tagMapper.getTagsByIds(Arrays.asList(ids.split(",")));
    }
}
