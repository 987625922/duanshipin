package com.ljf.duanshipin.service.Impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.ljf.duanshipin.domain.Video;
import com.ljf.duanshipin.mapper.VideoMapper;
import com.ljf.duanshipin.service.VideoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Arrays;
import java.util.List;

/**
 * @Author: 98762
 * @Date: 2020/11/10 21:19
 * @Description:
 * @备注： 1.
 */
@Transactional(readOnly = true)
@Service
public class VideoServiceImpl implements VideoService {

    @Autowired
    private VideoMapper videoMapper;

    @Transactional(rollbackFor = Exception.class)
    @Override
    public void add(Video video) {
        videoMapper.insert(video);
    }

    @Override
    public void getVideoById(Long id) {
        videoMapper.selectById(id);
    }

    @Transactional(rollbackFor = Exception.class)
    @Override
    public void deleteById(Long id) {
        videoMapper.deleteById(id);
    }

    @Transactional(rollbackFor = Exception.class)
    @Override
    public void onlineForids(String ids) {
        List<String> idList = Arrays.asList(ids.split(","));
        videoMapper.toOnline(idList);
    }

    @Transactional(rollbackFor = Exception.class)
    @Override
    public void recommendForids(String ids) {
        List<String> idList = Arrays.asList(ids.split(","));
        videoMapper.toRecommend(idList);
    }

    @Transactional(rollbackFor = Exception.class)
    @Override
    public void deleteForids(String ids) {
        List<String> idList = Arrays.asList(ids.split(","));
        videoMapper.deleteForids(idList);
    }

    @Transactional(rollbackFor = Exception.class)
    @Override
    public void recyclerForids(String ids) {
        List<String> idList = Arrays.asList(ids.split(","));
        videoMapper.toRecycler(idList);
    }

    @Override
    public PageInfo<Video> getPageListByType(Integer type, Integer isUserPublish, Integer currentPage, Integer pageSize) {
        PageHelper.startPage(currentPage, pageSize);
        List<Video> tagList = videoMapper.getListByType(type, isUserPublish);
        PageInfo<Video> pageInfo = new PageInfo<>(tagList);
        return pageInfo;
    }

    @Override
    public PageInfo<Video> selectForPage(Long id, String title, Integer type, Integer isUserPublish
            , String publishAdminName, Integer currentPage, Integer pageSize) {
        PageHelper.startPage(currentPage, pageSize);
        List<Video> tagList = videoMapper.selectForPage(id, title, type, isUserPublish, publishAdminName);
        PageInfo<Video> pageInfo = new PageInfo<>(tagList);
        return pageInfo;
    }
}
