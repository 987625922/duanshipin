package com.ljf.duanshipin.service.Impl;

import com.ljf.duanshipin.mapper.AlbumVideoMapper;
import com.ljf.duanshipin.service.AlbumVideoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * @Author: LL
 * @Description:
 * @Date:Create：in 2020/11/19 17:15
 */
@Service
public class AlbumVideoServiceImpl implements AlbumVideoService {

    @Autowired
    private AlbumVideoMapper albumVideoMapper;

    @Transactional(rollbackFor = Exception.class)
    @Override
    public void add(Long albumId, Integer videoId) {
        albumVideoMapper.insert(albumId, videoId);
    }
}
