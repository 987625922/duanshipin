package com.ljf.duanshipin.mapper;

import com.ljf.duanshipin.domain.Album;

import java.util.List;

/**
 * @Author: LL
 * @Description: 专辑的mapper
 * @Date:Create：in 2020/9/18 10:27
 */
public interface AlbumMapper {
    int insert(Album album);

    List<Album> getAlbumList(Integer type);

    void toOnline(String ids);

    void toRecommend(String ids);

    void toRecycler(String ids);

    void deleteForids(String ids);

    List<Album> selectForPage(Long id,String title,Integer type);
}
