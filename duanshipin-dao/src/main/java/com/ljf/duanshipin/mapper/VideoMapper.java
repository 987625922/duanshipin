package com.ljf.duanshipin.mapper;

import com.ljf.duanshipin.domain.Video;

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
}
