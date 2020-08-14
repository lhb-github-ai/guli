package com.atguigu.educenter.service;

import com.atguigu.educenter.entity.EduCourse;
import com.atguigu.educenter.entity.frontVo.CourseFrontVo;
import com.atguigu.educenter.entity.frontVo.CourseWebVo;
import com.atguigu.educenter.entity.vo.CourseInfoVo;
import com.atguigu.educenter.entity.vo.CoursePublishVo;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.IService;

import java.util.List;
import java.util.Map;

/**
 * <p>
 * 课程 服务类
 * </p>
 *
 * @author testjava
 * @since 2020-07-27
 */
public interface EduCourseService extends IService<EduCourse> {

    String saveCourseInfo(CourseInfoVo courseInfoVo);

    CourseInfoVo getCourseInfo(String courseId);

    void updateCourseInfo(CourseInfoVo courseInfoVo);

    CoursePublishVo getPublishCourse(String courseId);

    void deleteCourse(String courseId);


    List<EduCourse> listCourse();

    Map<String, Object> getCourseList(Page<EduCourse> pagecourse, CourseFrontVo courseFrontVo);

    CourseWebVo getBaseCourseInfo(String courseId);
}
