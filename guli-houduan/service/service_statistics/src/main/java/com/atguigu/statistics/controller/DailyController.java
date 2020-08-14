package com.atguigu.statistics.controller;


import com.atguigu.commonutils.R;
import com.atguigu.statistics.client.UcenterClient;
import com.atguigu.statistics.service.DailyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.Map;

/**
 * <p>
 * 网站统计日数据 前端控制器
 * </p>
 *
 * @author testjava
 * @since 2020-08-09
 */
@RestController
@RequestMapping("/statistics/daily")
//@CrossOrigin
public class DailyController {


    @Autowired
    private DailyService dailyService;

    @PostMapping("registerCount/{day}")
    public R registerCount(@PathVariable String day){
        dailyService.registerCount(day);
        return R.ok();
    }
    @GetMapping("showData/{type}/{begin}/{end}")
    public R showData(@PathVariable String type,@PathVariable String begin ,@PathVariable String end){
      Map<String,Object> map =  dailyService.showData(type,begin,end);
      return  R.ok().data(map);
    }
}

