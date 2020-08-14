package com.atguigu.vod;/*
 *@Author lee
 * @date 2020/08/01
 */

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.jdbc.DataSourceAutoConfiguration;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;
import org.springframework.context.annotation.ComponentScan;
@SpringBootApplication(exclude = DataSourceAutoConfiguration.class)
@ComponentScan(basePackages = {"com.atguigu"})
@EnableDiscoveryClient    //nacos注册
public class VodApplication {


    public static void main(String[] args) {
        SpringApplication.run(VodApplication.class,args);
    }
}
