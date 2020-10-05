package com.ljf.duanshipin.service.Impl;

import com.ljf.duanshipin.domain.Album;
import com.ljf.duanshipin.mapper.AlbumMapper;
import com.ljf.duanshipin.service.AlbumService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;

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
}
