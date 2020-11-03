package com.ljf.duanshipin.config;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

/**
 * @Author: LL
 * @Description:
 * @Date:Create：in 2020/11/3 17:08
 */
@Configuration
@PropertySource({"classpath:resource.properties"})
public class WebConfig implements WebMvcConfigurer {

    @Value("${web.file.web.path}")
    private String filePath;

    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        registry.addResourceHandler("/img/**")
                .addResourceLocations("file:D:/duanshipin/");
    }
}
