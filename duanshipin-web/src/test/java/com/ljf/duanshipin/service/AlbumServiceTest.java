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
        Admin admin = (Admin) adminService.findAdminByAccount("Admin");
        Album album = new Album();
        album.setTitle("测试的专辑标题").setUpdateAdminId(admin.getId())
                .setUpdateAdminName(admin.getUserName()).setTotalMun(30);
        albumService.add(album);
    }

    @Test
    public void getAlbumList() {
        log.info(albumService.getAlbumForPage(1, 10,2).toString());
    }
}
