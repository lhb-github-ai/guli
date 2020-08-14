package com.atguigu.educenter.client;/*
 *@Author lee
 * @date 2020/08/09
 */

import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

@Component
@FeignClient("service-order")
public interface OrdersClient {
    @GetMapping("/eduorder/order/IsBuyCourse/{orderId}/{memberId}")
    public Boolean getOrderInfo(@PathVariable("orderId") String orderId, @PathVariable("memberId") String memberId);
}
