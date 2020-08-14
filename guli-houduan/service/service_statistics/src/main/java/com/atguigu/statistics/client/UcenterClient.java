package com.atguigu.statistics.client;/*
 *@Author lee
 * @date 2020/08/09
 */

import com.atguigu.commonutils.R;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

@Component
@FeignClient("service-ucenter")
public interface UcenterClient {
    @GetMapping("/educenter/ucenter-member/countRegister/{day}")
    public R countRegister(@PathVariable("day") String day);
}
