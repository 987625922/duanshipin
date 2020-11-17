package com.ljf.duanshipin.service;

import com.github.pagehelper.PageInfo;
import com.ljf.duanshipin.domain.Video;

public interface VideoService {
    void add(Video video);

    void getVideoById(Integer id);

    void deleteById(Integer id);

    void onlineForids(String ids);

    void recommendForids(String ids);

    void deleteForids(String ids);

    void recyclerForids(String ids);

    PageInfo<Video> getPageListByType(Integer type, Integer isUserPublish, Integer currentPage, Integer pageSize);

    PageInfo<Video> selectForPage(Integer id, String title, Integer type,
                                  Integer isUserPublish, String publishAdminName
            , Integer currentPage, Integer pageSize);
    Video getInfoById(Integer id);
}
