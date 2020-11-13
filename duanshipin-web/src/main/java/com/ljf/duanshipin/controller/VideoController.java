package com.ljf.duanshipin.controller;

import com.ljf.duanshipin.common.dto.JsonResult;
import com.ljf.duanshipin.domain.Video;
import com.ljf.duanshipin.service.VideoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

/**
 * @Author: 98762
 * @Date: 2020/11/10 21:39
 * @Description:
 * @备注： 1.
 */
@RestController
@RequestMapping("/api/video")
public class VideoController {

    @Autowired
    private VideoService videoService;

    @RequestMapping("/add")
    public Object add(Video video) {
        videoService.add(video);
        return JsonResult.buildSuccess();
    }

    @RequestMapping("/list")
    public Object add(Integer type, Integer isUserPublish, Integer currentPage, Integer pageSize) {
        return JsonResult.buildSuccess(videoService.getPageListByType(type, isUserPublish, currentPage, pageSize));
    }

    /**
     * 视频改成上线
     *
     * @param ids
     * @return
     */
    @RequestMapping("/onlineForids")
    @ResponseBody
    public Object albumOnline(String ids) {
        videoService.onlineForids(ids);
        return JsonResult.buildSuccess();
    }

    /**
     * 专辑推荐
     *
     * @param ids
     * @return
     */
    @RequestMapping("/recommendForids")
    @ResponseBody
    public Object albumRecommend(String ids) {
        videoService.recommendForids(ids);
        return JsonResult.buildSuccess();
    }

    /**
     * 专辑回收
     *
     * @param ids
     * @return
     */
    @RequestMapping("/recyclerForids")
    @ResponseBody
    public Object recyclerForids(String ids) {
        videoService.recyclerForids(ids);
        return JsonResult.buildSuccess();
    }

    /**
     * 批量删除
     *
     * @param ids
     * @return
     */
    @RequestMapping("/deleteForids")
    @ResponseBody
    public Object deleteForids(String ids) {
        videoService.deleteForids(ids);
        return JsonResult.buildSuccess();
    }

    /**
     * 专辑搜索
     *
     * @return
     */
    @RequestMapping("/select")
    @ResponseBody
    public Object select(Long id, String title,
                         @RequestParam(value = "pageIndex", defaultValue = "1") Integer currentPage,
                         @RequestParam(value = "pageSize", defaultValue = "10") Integer pageSize,
                         @RequestParam(value = "type", defaultValue = "2") Integer type
            , @RequestParam(value = "isUserPublish", defaultValue = "0") Integer isUserPublish,
                         @RequestParam(required = false) String publishAdminName) {
        return JsonResult.buildSuccess(videoService.selectForPage(id, title, type, isUserPublish, publishAdminName, currentPage, pageSize));
    }
}
