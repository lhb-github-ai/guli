package com.atguigu.educenter.client;/*
 *@Author lee
 * @date 2020/08/02
 */

import com.atguigu.commonutils.R;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@FeignClient(name = "service-vod",fallback =VodFileDegradeFeignClient.class )
@Component
public interface VodClient {

    //定义调用的方法
    @DeleteMapping("/eduvideo/video/remove/{id}")
    public R remove(@PathVariable("id") String id);

    //删除多个
    @DeleteMapping("/eduvideo/video/delete-batch")
    public R deleteBatch(@RequestParam("videoIdList") List<String> videoIdList);
}
