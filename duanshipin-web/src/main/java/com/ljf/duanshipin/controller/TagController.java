package com.ljf.duanshipin.controller;

import com.ljf.duanshipin.common.dto.JsonResult;
import com.ljf.duanshipin.domain.Tag;
import com.ljf.duanshipin.service.TagService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

/**
 * @Author: LL
 * @Description:
 * @Date:Create：in 2020/10/15 16:58
 */
@RestController
@RequestMapping("/api/tag")
public class TagController extends BaseController {

    @Autowired
    private TagService tagService;

    @RequestMapping("/listForType")
    public Object list(@RequestParam(value = "pageIndex", defaultValue = "1") Integer pageIndex,
                       @RequestParam(value = "pageSize", defaultValue = "10") Integer pageSize
            , @RequestParam(value = "type", defaultValue = "1") Integer type) {
        return JsonResult.buildSuccess(tagService.getTagForPage(pageIndex, pageSize, type));
    }

    @RequestMapping("/add")
    public Object add(Tag tag) {
        tag.setUpdateAdminId(getCurrentAdmin().getId())
                .setUpdateAdminName(getCurrentAdmin().getUserName());
        tagService.insert(tag);
        return JsonResult.buildSuccess();
    }

    @RequestMapping("/delete")
    public Object del(Integer id) {
        tagService.delete(id);
        return JsonResult.buildSuccess();
    }

    @RequestMapping("/select")
    public Object select(@RequestParam(value = "pageIndex", defaultValue = "1") Integer pageIndex,
                         @RequestParam(value = "pageSize", defaultValue = "10") Integer pageSize
            , @RequestParam(value = "type", defaultValue = "1") Integer type,
                         String name) {
        return JsonResult.buildSuccess(tagService.getTagByNameAndType(pageIndex, pageSize, name, type));
    }

    /**
     * 通过父id搜索
     *
     * @param pageIndex
     * @param pageSize
     * @param type
     * @return
     */
    @RequestMapping("/selectByParentId")
    public Object selectByParentId(@RequestParam(value = "pageIndex", defaultValue = "1") Integer pageIndex,
                                   @RequestParam(value = "pageSize", defaultValue = "10") Integer pageSize,
                                   @RequestParam(value = "type", defaultValue = "1") Integer type,
                                   Integer parentId) {
        return JsonResult.buildSuccess(tagService.selectByParentId(pageIndex, pageSize, type, parentId));
    }

    /**
     * 通过多个父id搜索
     *
     * @param pageIndex
     * @param pageSize
     * @param type
     * @return
     */
    @RequestMapping("/selectByMoreParentId")
    public Object selectByMoreParentId(@RequestParam(value = "pageIndex", defaultValue = "1") Integer pageIndex,
                                       @RequestParam(value = "pageSize", defaultValue = "10") Integer pageSize,
                                       @RequestParam(value = "type", defaultValue = "1") Integer type,
                                       String parentIds) {
        return JsonResult.buildSuccess(tagService.selectByMoreParentId(pageIndex, pageSize, type, parentIds));
    }

}
