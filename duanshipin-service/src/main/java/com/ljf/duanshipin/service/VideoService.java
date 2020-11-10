package com.ljf.duanshipin.service;

import com.ljf.duanshipin.domain.Video;

public interface VideoService {
    void add(Video video);

    void getVideoById(Long id);

    void deleteById(Long id);
}
