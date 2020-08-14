package com.atguigu.educenter.mapper;

import com.atguigu.educenter.entity.EduCourse;
import com.atguigu.educenter.entity.frontVo.CourseWebVo;
import com.atguigu.educenter.entity.vo.CoursePublishVo;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;

/**
 * <p>
 * 课程 Mapper 接口
 * </p>
 *
 * @author testjava
 * @since 2020-07-27
 */
public interface EduCourseMapper extends BaseMapper<EduCourse> {
          public CoursePublishVo getCoursePublishVo(String courseId);

    CourseWebVo getBaseCourseInfo(String courseId);
}
