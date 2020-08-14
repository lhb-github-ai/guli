package com.atguigu.eduorder.client;/*
 *@Author lee
 * @date 2020/08/09
 */

import com.atguigu.commonutils.orderVo.CourseWebVoOrder;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

@Component
@FeignClient("service-edu")
public interface EduClient {
    @PostMapping("/eduservice/coursefront/GetCourseInfoOrder/{id}")
    public CourseWebVoOrder GetCourseInfoOrder(@PathVariable("id") String id);
}
