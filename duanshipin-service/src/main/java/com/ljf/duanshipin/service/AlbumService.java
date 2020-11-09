package com.ljf.duanshipin.service;

import com.github.pagehelper.PageInfo;
import com.ljf.duanshipin.domain.Album;

/**
 * 专辑的service
 */
public interface AlbumService {
    void add(Album album);
    void update(Album album);
    PageInfo<Album> getAlbumForPage(Integer pageIndex,Integer pageSize,Integer type,Integer isUserPublish);
    void onlineForids(String ids);
    void recommendForids(String ids);
    void deleteForids(String ids);
    void recyclerForids(String ids);
    PageInfo<Album> selectForPage(Long id, String title, Integer pageIndex
            , Integer pageSize, Integer type,Integer isUserPublish,Long publishAdminId);
    Album getInfoById(Long id);
}
