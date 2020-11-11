package com.ljf.duanshipin.service;

import com.github.pagehelper.PageInfo;
import com.ljf.duanshipin.domain.Video;

public interface VideoService {
    void add(Video video);

    void getVideoById(Long id);

    void deleteById(Long id);

    void onlineForids(String ids);

    void recommendForids(String ids);

    void deleteForids(String ids);

    void recyclerForids(String ids);

    PageInfo<Video> getPageListByType(Integer type, Integer isUserPublish, Integer currentPage, Integer pageSize);
}
