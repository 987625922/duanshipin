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

    Video selectById(Long id);

    void deleteById(Long id);

    List<Video> getListByType(Integer type, Integer isUserPublish);

    void toOnline(List<String> list);

    void toRecommend(List<String> list);

    void toRecycler(List<String> list);

    void deleteForids(List<String> list);
}
