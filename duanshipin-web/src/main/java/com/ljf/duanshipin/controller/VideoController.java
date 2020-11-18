package com.ljf.duanshipin.controller;

import com.ljf.duanshipin.common.dto.JsonResult;
import com.ljf.duanshipin.domain.Video;
import com.ljf.duanshipin.service.VideoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;

/**
 * @Author: 98762
 * @Date: 2020/11/10 21:39
 * @Description:
 * @备注： 1.
 */
@RestController
@RequestMapping("/api/video")
public class VideoController extends BaseController {

    @Autowired
    private VideoService videoService;

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
    public Object select(Integer id, String title,
                         @RequestParam(value = "pageIndex", defaultValue = "1") Integer currentPage,
                         @RequestParam(value = "pageSize", defaultValue = "10") Integer pageSize,
                         @RequestParam(value = "type", defaultValue = "2") Integer type
            , @RequestParam(value = "isUserPublish", defaultValue = "0") Integer isUserPublish,
                         @RequestParam(required = false) String publishAdminName) {
        return JsonResult.buildSuccess(videoService.selectForPage(id, title, type, isUserPublish, publishAdminName, currentPage, pageSize));
    }


    /**
     * 添加专辑
     *
     * @return
     */
    @RequestMapping("/add")
    public Object add(String title, @RequestParam(defaultValue = "") String introduction,
                      @RequestParam(value = "cover", required = false) MultipartFile file,
                      @RequestParam(defaultValue = "2") Integer type,
                      @RequestParam(required = false) String director,
                      Integer oneClassTagId, String twoClassTagIds, String threeClassTagIds,
                      Integer isBlockSearch, String performer
    ) throws IOException {
//        if (file != null) {
//            //获取文件的后缀名
//            String fileName = file.getOriginalFilename();
//            if (!fileName.isEmpty()) {
//                String suffixName = fileName.substring(fileName.lastIndexOf("."));
//                fileName = UUID.randomUUID() + suffixName;
//                fileName = fileName.replaceAll("-","");
//                file.transferTo(new File(filePath + fileName));
//                album.setImgSrc(fileName);
//            }
//        }

        Video video = new Video();
        video.setTitle(title).setIntroduction(introduction).setControllerAdminId(getCurrentAdmin().getId())
                .setType(type).setDirector(director).setOneClassTagId(String.valueOf(oneClassTagId))
                .setTwoClassTagIds(twoClassTagIds).setThreeClassTagIds(threeClassTagIds).setPerformer(performer)
                .setIsBlockSearch(isBlockSearch).setIsUserPublish(1).setPublishAdminId(getCurrentAdmin().getId());
        videoService.add(video);
        return JsonResult.buildSuccess();
    }

    /**
     * 通过id获取详情
     *
     * @param id
     * @return
     */
    @RequestMapping("/getInfoById")
    public Object getInfoById(Integer id) {
        return JsonResult.buildSuccess(videoService.getInfoById(id));
    }

    /**
     * 更新专辑
     *
     * @return
     */
    @RequestMapping("/update")
    public Object update(Integer id, String title,
                         @RequestParam(defaultValue = "") String introduction,
                         @RequestParam(value = "cover", required = false) MultipartFile file,
                         @RequestParam(required = false) String director,
                         @RequestParam(required = false) String performer,
                         String oneClassTagId, String twoClassTagIds, String threeClassTagIds,
                         Long publishAdminId, Integer isBlockSearch
    ) {
        Video video = new Video();
        video.setId(id).setTitle(title).setIntroduction(introduction).setDirector(director)
                .setPerformer(performer).setOneClassTagId(oneClassTagId)
                .setTwoClassTagIds(twoClassTagIds).setThreeClassTagIds(threeClassTagIds)
                .setPublishAdminId(publishAdminId).setIsBlockSearch(isBlockSearch);
        videoService.update(video);
        return JsonResult.buildSuccess();
    }
}
