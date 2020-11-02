package com.ljf.duanshipin.controller;

import com.github.pagehelper.PageInfo;
import com.ljf.duanshipin.common.dto.JsonResult;
import com.ljf.duanshipin.domain.Album;
import com.ljf.duanshipin.service.AlbumService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

/**
 * @Author: 98762
 * @Date: 2020/10/5 19:22
 * @Description: 专辑的controller
 * @备注： 1.
 */
@RestController
@RequestMapping("/api/album")
@PropertySource({"classpath:resource.properties"})
public class AlbumController extends BaseController {

    @Autowired
    private AlbumService albumService;


    @Value("${web.file.path}")
    private String filePath;

    /**
     * 添加专辑
     *
     * @return
     */
    @RequestMapping("/add")
    public Object add(String title, @RequestParam(defaultValue = "") String introduction,
                      @RequestParam(defaultValue = "0") Integer totalMun,
                      @RequestParam(defaultValue = "0") Integer currentMun,
                      @RequestParam(value = "cover", required = false) MultipartFile file,
                      @RequestParam(defaultValue = "2") Integer type,
                      @RequestParam(defaultValue = "2") Integer isComplete,
                      @RequestParam(required = false) String director,
                      Integer oneClassTagId, String twoClassTagIds, String threeClassTagIds,
                      Long publishAdminId, Integer isBlockSearch
    )
            throws IOException {
        Album album = new Album();
        if (file != null) {
            //获取文件的后缀名
            String fileName = file.getOriginalFilename();
            if (!fileName.isEmpty()) {
                String suffixName = fileName.substring(fileName.lastIndexOf("."));
                fileName = UUID.randomUUID() + suffixName;
                file.transferTo(new File(filePath + fileName));
                album.setImgSrc(fileName);
            }
        }
        album.setTitle(title).setIntroduction(introduction).setTotalMun(totalMun)
                .setCurrentMun(currentMun).setUpdateAdminId(getCurrentAdmin().getId())
                .setUpdateAdminName(getCurrentAdmin().getUserName()).setType(type)
                .setIsComplete(isComplete).setDirector(director).setOneClassTagId(String.valueOf(oneClassTagId))
                .setTwoClassTagIds(twoClassTagIds).setThreeClassTagIds(threeClassTagIds)
                .setPublishAdminId(publishAdminId).setIsBlockSearch(isBlockSearch).setIsUserPublish(1);
        albumService.add(album);
        return JsonResult.buildSuccess();
    }

    /**
     * 专辑列表
     *
     * @param pageIndex
     * @param pageSize
     * @param type
     * @return
     */
    @RequestMapping("/list")
    @ResponseBody
    public Object list(@RequestParam(value = "pageIndex", defaultValue = "1") Integer pageIndex,
                       @RequestParam(value = "pageSize", defaultValue = "10") Integer pageSize
            , @RequestParam(value = "type", defaultValue = "2") Integer type
            , @RequestParam(value = "isUserPublish", defaultValue = "0") Integer isUserPublish) {
        PageInfo<Album> page = albumService.getAlbumForPage(pageIndex, pageSize, type, isUserPublish);
        return JsonResult.buildSuccess(page);
    }

    /**
     * 专辑改成上线
     *
     * @param ids
     * @return
     */
    @RequestMapping("/onlineForids")
    @ResponseBody
    public Object albumOnline(String ids) {
        albumService.onlineForids(ids);
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
        albumService.recommendForids(ids);
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
        albumService.recyclerForids(ids);
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
                         @RequestParam(value = "pageIndex", defaultValue = "1") Integer pageIndex,
                         @RequestParam(value = "pageSize", defaultValue = "10") Integer pageSize,
                         @RequestParam(value = "type", defaultValue = "2") Integer type
            , @RequestParam(value = "isUserPublish", defaultValue = "0") Integer isUserPublish) {
        return JsonResult.buildSuccess(albumService.selectForPage(id, title, pageIndex, pageSize, type,isUserPublish));
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
        albumService.deleteForids(ids);
        return JsonResult.buildSuccess();
    }


}
