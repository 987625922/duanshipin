package com.ljf.duanshipin.service.Impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.ljf.duanshipin.domain.Album;
import com.ljf.duanshipin.mapper.AlbumMapper;
import com.ljf.duanshipin.service.AlbumService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Arrays;
import java.util.Date;
import java.util.List;

/**
 * @Author: 98762
 * @Date: 2020/10/5 19:59
 * @Description:专辑的service
 * @备注： 1.
 */
@Service
@Transactional(readOnly = true)
public class AlbumServiceImpl implements AlbumService {

    @Autowired
    private AlbumMapper albumMapper;

    @Override
    @Transactional(rollbackFor = Exception.class)
    public void add(Album album) {
        Date date = new Date();
        album.setUpdateTime(date).setCreateTime(date)
                .setCurrentMun(0);
        albumMapper.insert(album);
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public void update(Album album) {
        Date date = new Date();
        album.setUpdateTime(date);
        albumMapper.update(album);
    }

    @Override
    public PageInfo<Album> getAlbumForPage(Integer pageIndex, Integer pageSize, Integer type, Integer isUserPublish) {
        PageHelper.startPage(pageIndex, pageSize);
        List<Album> albumList = albumMapper.getAlbumList(type, isUserPublish);
        PageInfo<Album> pageInfo = new PageInfo<>(albumList);
        return pageInfo;
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public void onlineForids(String ids) {
        List<String> idList = Arrays.asList(ids.split(","));
        albumMapper.toOnline(idList);
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public void recommendForids(String ids) {
        List<String> idList = Arrays.asList(ids.split(","));
        albumMapper.toRecommend(idList);
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public void deleteForids(String ids) {
        List<String> idList = Arrays.asList(ids.split(","));
        albumMapper.deleteForids(idList);
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public void recyclerForids(String ids) {
        List<String> idList = Arrays.asList(ids.split(","));
        albumMapper.toRecycler(idList);
    }

    @Override
    public PageInfo<Album> selectForPage(Long id, String title, Integer pageIndex, Integer pageSize
            , Integer type, Integer isUserPublish) {
        PageHelper.startPage(pageIndex, pageSize);
        List<Album> albumList = albumMapper.selectForPage(id, title, type, isUserPublish);
        PageInfo<Album> pageInfo = new PageInfo<>(albumList);
        return pageInfo;
    }

    @Override
    public Album getInfoById(Long id) {
        return albumMapper.getInfoById(id);
    }
}
