package com.ljf.duanshipin;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.WebApplicationType;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.servlet.MultipartConfigFactory;
import org.springframework.context.annotation.Bean;

import javax.servlet.MultipartConfigElement;

/**
 * @author LL
 */
@MapperScan("com.ljf.duanshipin.mapper")
@SpringBootApplication
public class DuanShipinApplication {

    public static void main(String[] args) {
        new SpringApplicationBuilder(DuanShipinApplication.class)
                .web(WebApplicationType.SERVLET)
                .run(args);
    }

}
