package com.ljf.duanshipin.mapper;

import com.ljf.duanshipin.domain.Video;

import java.util.List;

/**
 * @Author: LL
 * @Description:
 * @Date:Create：in 2020/11/10 17:56
 */
public interface VideoMapper {
    void insert(Video video);

    void update(Video video);

    Video getInfoById(Integer id);

    void deleteById(Integer id);

    List<Video> getListByType(Integer type, Integer isUserPublish);

    List<Video> getListByAlbumId(Long albumId);

    void toOnline(List<String> list);

    void toRecommend(List<String> list);

    void toRecycler(List<String> list);

    void deleteForids(List<String> list);

    List<Video> selectForPage(Integer id, String title, Integer type,
                              Integer isUserPublish, String publishAdminName);

    List<Video> selectForPageByalbumId(Long albumId,String title,Integer videoId);

    void deleteByAlbumAndVideoId(Long albumId,Integer videoId);

    void deleteByAlbumAndVideoIds(Long albumId, List<String> videoIds);
}
