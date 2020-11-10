package com.ljf.duanshipin.service.Impl;

import com.ljf.duanshipin.domain.Video;
import com.ljf.duanshipin.mapper.VideoMapper;
import com.ljf.duanshipin.service.VideoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

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
}
