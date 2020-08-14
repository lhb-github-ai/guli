package com.atguigu.eduorder;/*
 *@Author lee
 * @date 2020/08/08
 */


import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;
import org.springframework.cloud.openfeign.EnableFeignClients;
import org.springframework.context.annotation.ComponentScan;
@SpringBootApplication
@EnableDiscoveryClient
@EnableFeignClients
@ComponentScan({"com.atguigu"}) //指定扫描位置
@MapperScan("com.atguigu.eduorder.mapper")
public class ServiceOrderApplication {


    public static void main(String[] args) {
        SpringApplication.run(ServiceOrderApplication.class, args);
    }

}
