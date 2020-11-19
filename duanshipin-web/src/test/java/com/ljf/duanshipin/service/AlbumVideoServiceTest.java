package com.ljf.duanshipin.service;

import com.ljf.duanshipin.DuanShipinApplication;
import lombok.extern.slf4j.Slf4j;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

/**
 * @Author: LL
 * @Description:
 * @Date:Create：in 2020/11/19 17:17
 */
@RunWith(SpringRunner.class)//底层调用SpringJUnit4ClassRunner
@SpringBootTest(classes = {DuanShipinApplication.class})//启动整个springboot工程
@Slf4j
public class AlbumVideoServiceTest {

    @Autowired
    private AlbumVideoService albumVideoService;

    @Test
    public void add(){
        albumVideoService.add(1L,1);
    }
}
