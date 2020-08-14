package com.atguigu.educenter.service;

import com.atguigu.educenter.entity.vo.CoursePublishVo;
import com.atguigu.educenter.entity.vo.CourseQuery;
import com.baomidou.mybatisplus.extension.service.IService;

import java.util.List;

/**
 * <p>
 * 课程 服务类
 * </p>
 *
 * @author testjava
 * @since 2020-07-27
 */
public interface CourseService extends IService<CoursePublishVo> {


    List<CoursePublishVo> findResultByInfo(CourseQuery courseQuery);

    Integer totals(CourseQuery courseQuery);


}
