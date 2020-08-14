package com.atguigu.educenter.client;/*
 *@Author lee
 * @date 2020/08/08
 */

import com.atguigu.educenter.entity.UcenterMemberPay;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

@FeignClient(name = "service-ucenter",fallback =UcentFileDegradeFeignClient.class )
@Component
public interface UcentClient {

    @GetMapping("/educenter/ucenter-member/getMemberInfoByid/{id}")
    public UcenterMemberPay getMemberInfoByid(@PathVariable("id") String id);
}
