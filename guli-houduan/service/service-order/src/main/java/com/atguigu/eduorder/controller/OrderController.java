package com.atguigu.eduorder.controller;


import com.atguigu.commonutils.JwtUtils;
import com.atguigu.commonutils.R;
import com.atguigu.eduorder.entity.Order;
import com.atguigu.eduorder.service.OrderService;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;

/**
 * <p>
 * 订单 前端控制器
 * </p>
 *
 * @author testjava
 * @since 2020-08-08
 */
@RestController
@RequestMapping("/eduorder/order")
@CrossOrigin

public class OrderController {

    @Autowired
    private OrderService orderService;

    @PostMapping("createOrder/{courseId}")
    public R createOrder(@PathVariable String courseId, HttpServletRequest request){
        System.out.println("======================"+JwtUtils.getMemberIdByJwtToken(request));
        if (JwtUtils.getMemberIdByJwtToken(request)==null||JwtUtils.getMemberIdByJwtToken(request)==""){
            return R.error().code(28004);
        }
        String  orderNo= orderService.createOrder(courseId, JwtUtils.getMemberIdByJwtToken(request));

        return R.ok().data("orderId",orderNo);
    }
    @GetMapping("getOrderInfo/{orderId}")
    public R getOrderInfo(@PathVariable String orderId){
        QueryWrapper<Order> wrapper = new QueryWrapper<>();
        wrapper.eq("order_no",orderId);
        Order order = orderService.getOne(wrapper);

        return R.ok().data("order",order);
    }
    @GetMapping("IsBuyCourse/{orderId}/{memberId}")
    public Boolean getOrderInfo(@PathVariable String orderId, @PathVariable String memberId){
        QueryWrapper<Order> wrapper = new QueryWrapper<>();
        wrapper.eq("course_id",orderId);
        wrapper.eq("member_id",memberId);
        wrapper.eq("status",1);
        int count= orderService.count(wrapper);
        if (count>0){
            return true;
        }else {
            return false;
        }

    }
}

