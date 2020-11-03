package com.ljf.duanshipin.controller;

import com.ljf.duanshipin.common.dto.JsonResult;
import com.ljf.duanshipin.domain.Album;
import com.ljf.duanshipin.service.AlbumService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

/**
 * @Author: LL
 * @Description:
 * @Date:Create：in 2020/11/2 15:49
 */
@RestController
@RequestMapping("/api/user/album")
@PropertySource({"classpath:resource.properties"})
public class UserAlbumController extends BaseController {

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
//        if (file != null) {
//            //获取文件的后缀名
//            String fileName = file.getOriginalFilename();
//            if (!fileName.isEmpty()) {
//                String suffixName = fileName.substring(fileName.lastIndexOf("."));
//                fileName = UUID.randomUUID() + suffixName;
//                fileName = fileName.replaceAll("-", "");
//                file.transferTo(new File(filePath + fileName));
//                album.setImgSrc(fileName);
//            }
//        }
        album.setTitle(title).setIntroduction(introduction).setTotalMun(totalMun)
                .setCurrentMun(currentMun).setUpdateAdminId(getCurrentAdmin().getId())
                .setUpdateAdminName(getCurrentAdmin().getUserName()).setType(type)
                .setIsComplete(isComplete).setDirector(director).setOneClassTagId(String.valueOf(oneClassTagId))
                .setTwoClassTagIds(twoClassTagIds).setThreeClassTagIds(threeClassTagIds)
                .setPublishAdminId(publishAdminId).setIsBlockSearch(isBlockSearch).setIsUserPublish(1);
        albumService.add(album);
        return JsonResult.buildSuccess();
    }

}
