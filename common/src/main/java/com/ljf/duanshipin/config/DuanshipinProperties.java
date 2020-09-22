package com.ljf.duanshipin.config;

import lombok.Data;
import org.springframework.boot.SpringBootConfiguration;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.context.annotation.PropertySource;

/**
 * @Author: 98762
 * @Date: 2020/9/20 15:17
 * @Description: 此项目的Properties
 * @备注： 1.
 */
@Data
@SpringBootConfiguration
@PropertySource(value = {"classpath:duanshipin.properties"})
@ConfigurationProperties(prefix = "duanshipin")
public class DuanshipinProperties {

    private ShiroProperties shiro = new ShiroProperties();

}
