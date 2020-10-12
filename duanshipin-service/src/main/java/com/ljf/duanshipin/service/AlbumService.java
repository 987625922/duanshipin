package com.ljf.duanshipin.service;

import com.github.pagehelper.PageInfo;
import com.ljf.duanshipin.domain.Album;

/**
 * 专辑的service
 */
public interface AlbumService {
    void add(Album album);
    PageInfo<Album> getAlbumForPage(Integer pageIndex,Integer pageSize,Integer type);
    void toOnline(String ids);
}
