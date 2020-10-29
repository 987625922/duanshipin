package com.ljf.duanshipin.service;

import com.ljf.duanshipin.DuanShipinApplication;
import com.ljf.duanshipin.domain.Tag;
import lombok.extern.slf4j.Slf4j;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import java.util.Date;

/**
 * @Author: LL
 * @Description:
 * @Date:Create：in 2020/10/23 15:33
 */
@RunWith(SpringRunner.class)//底层调用SpringJUnit4ClassRunner
@SpringBootTest(classes = {DuanShipinApplication.class})//启动整个springboot工程
@Slf4j
public class TagServiceTest {

    @Autowired
    private TagService tagService;

    @Test
    public void insert() {
        for (int i = 0; i < 20; i++) {
            Tag tag = new Tag();
            tag.setUpdateTime(new Date());
            tag.setUpdateAdminId(1l)
                    .setUpdateAdminName("11")
                    .setName("测试父tag为2 " + i)
                    .setCreateTime(new Date()).setType(2).setParentTagId(2);
            tagService.insert(tag);
        }
    }

    @Test
    public void selectByMoreParentId() {
        tagService.selectByMoreParentId(1, 10,
                2, "2,3").getList().forEach(tag -> {
            log.info(tag.toString());
        });
    }

}
