package com.ljf.duanshipin.service;

import com.ljf.duanshipin.DuanShipinApplication;
import com.ljf.duanshipin.domain.Admin;
import com.ljf.duanshipin.domain.Album;
import lombok.extern.slf4j.Slf4j;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

/**
 * @Author: 98762
 * @Date: 2020/10/5 20:08
 * @Description:专辑的service的test
 * @备注： 1.
 */
@RunWith(SpringRunner.class)//底层调用SpringJUnit4ClassRunner
@SpringBootTest(classes = {DuanShipinApplication.class})//启动整个springboot工程
@Slf4j
public class AlbumServiceTest {

    @Autowired
    private AlbumService albumService;

    @Autowired
    private AdminService adminService;

    @Test
    public void add() {
        for (int i = 0; i < 100; i++) {
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
            album.setTitle("123").setIntroduction("123").setTotalMun(12)
                    .setCurrentMun(0).setUpdateAdminId(2L)
                    .setUpdateAdminName("123").setType(1)
                    .setIsComplete(1).setDirector("123").setOneClassTagId("123")
                    .setTwoClassTagIds("123").setThreeClassTagIds("123")
                    .setPublishAdminId(2L).setIsBlockSearch(1).setIsUserPublish(1);
            albumService.add(album);
        }
    }

    @Test
    public void getAlbumList() {
        log.info(albumService.getAlbumForPage(1, 10, 2,0).toString());
    }

    @Test
    public void getAlbumById(){
        log.info(albumService.getInfoById(629L).toString());
    }

}
