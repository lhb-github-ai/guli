package com.atguigu.statistics.service;

import com.atguigu.statistics.entity.Daily;
import com.baomidou.mybatisplus.extension.service.IService;

import java.util.Map;

/**
 * <p>
 * 网站统计日数据 服务类
 * </p>
 *
 * @author testjava
 * @since 2020-08-09
 */
public interface DailyService extends IService<Daily> {

    void registerCount(String day);

    Map<String, Object> showData(String type, String begin, String end);
}
