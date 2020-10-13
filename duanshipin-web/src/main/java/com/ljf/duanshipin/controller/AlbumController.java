package com.ljf.duanshipin.controller;

import com.github.pagehelper.PageInfo;
import com.ljf.duanshipin.common.dto.JsonResult;
import com.ljf.duanshipin.domain.Album;
import com.ljf.duanshipin.service.AlbumService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

/**
 * @Author: 98762
 * @Date: 2020/10/5 19:22
 * @Description: 专辑的controller
 * @备注： 1.
 */
@RestController
@RequestMapping("/api/album")
public class AlbumController {

    @Autowired
    private AlbumService albumService;

    /**
     * 添加专辑
     *
     * @param album
     * @return
     */
    @RequestMapping("/add")
    public Object add(Album album) {
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
            , @RequestParam(value = "type", defaultValue = "2") Integer type) {
        PageInfo<Album> page = albumService.getAlbumForPage(pageIndex, pageSize, type);
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
                         @RequestParam(value = "type", defaultValue = "2") Integer type) {
        return JsonResult.buildSuccess(albumService.selectForPage(id, title, pageIndex, pageSize, type));
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
