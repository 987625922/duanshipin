package com.ljf.duanshipin.service;

import com.ljf.duanshipin.DuanShipinApplication;
import com.ljf.duanshipin.domain.Video;
import lombok.extern.slf4j.Slf4j;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import java.util.Date;

/**
 * @Author: 98762
 * @Date: 2020/11/10 21:27
 * @Description:
 * @备注： 1.
 */
@RunWith(SpringRunner.class)//底层调用SpringJUnit4ClassRunner
@SpringBootTest(classes = {DuanShipinApplication.class})//启动整个springboot工程
@Slf4j
public class VideoServiceTest {

    @Autowired
    private VideoService videoService;

    @Test
    public void insert() {
        for (int i = 0; i < 10; i++) {
            Video video = new Video();
            video.setTitle("测试").setIntroduction("测试").setImg("测试")
                    .setNumberOfGoods(0).setNumberOfPlays(0).setUpdateTime(new Date())
                    .setControllerAdminId(1L).setCreateTime(new Date())
                    .setType(1).setIsUserPublish(1);
            videoService.add(video);
        }
    }
}
