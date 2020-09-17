package com.ljf.duanshipin.config;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Configuration;

import javax.annotation.PostConstruct;

/**
 * @Author: LL
 * @Description:freemarker的config类
 * @Date:Create：in 2020/9/17 14:01
 */
@Slf4j
@Configuration
@Data
@NoArgsConstructor
@AllArgsConstructor
public class FreeMarkerConfig {

    @Autowired
    private freemarker.template.Configuration configuration;

    /**
     * 设置host
     */
    @Value("${freemarker.host}")
    private String host;

    @PostConstruct
    public void setConfigure() throws Exception {
        //设置全局的freemarker参数
        configuration.setSharedVariable("apphost", host);
    }

}