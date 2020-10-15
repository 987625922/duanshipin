package com.ljf.duanshipin.service.Impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.ljf.duanshipin.domain.Tag;
import com.ljf.duanshipin.mapper.TagMapper;
import com.ljf.duanshipin.service.TagService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

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
    public PageInfo<Tag> getTagForPage(Integer pageIndex, Integer pageSize,Integer type) {
        PageHelper.startPage(pageIndex, pageSize);
        List<Tag> tagList = tagMapper.getTagList(type);
        PageInfo<Tag> pageInfo = new PageInfo<>(tagList);
        return pageInfo;
    }
}
