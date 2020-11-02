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

    List<Album> getAlbumList(Integer type,Integer isUserPublish);

    void toOnline(List<String> list);

    void toRecommend(List<String> list);

    void toRecycler(List<String> list);

    void deleteForids(List<String> list);

    List<Album> selectForPage(Long id,String title,Integer type,
                              Integer isUserPublish);
}
