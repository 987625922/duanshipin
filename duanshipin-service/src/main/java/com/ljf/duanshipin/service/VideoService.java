package com.ljf.duanshipin.service;

import com.github.pagehelper.PageInfo;
import com.ljf.duanshipin.domain.Video;

import java.util.List;

public interface VideoService {
    void add(Video video);

    void getVideoById(Integer id);

    void deleteById(Integer id);

    void deleteByAlbumAndVideoIds(Long albumId,String videoIds);

    void onlineForids(String ids);

    void recommendForids(String ids);

    void deleteForids(String ids);

    void recyclerForids(String ids);

    PageInfo<Video> getPageListByType(Integer type, Integer isUserPublish, Integer currentPage, Integer pageSize);

    PageInfo<Video> getListByAlbumId(Long albumId, Integer currentPage, Integer pageSize);

    PageInfo<Video> selectForPage(Integer id, String title, Integer type,
                                  Integer isUserPublish, String publishAdminName
            , Integer currentPage, Integer pageSize);
    Video getInfoById(Integer id);

    void update(Video video);

    PageInfo<Video> selectForPageByalbumId(Long albumId,String title,Integer videoId,Integer currentPage,Integer pageSize);

    void videoAddToAlbum(Long albumId, Integer videoId);

    void videoRemoveToAlbum(Long albumId, Integer videoId);
}
