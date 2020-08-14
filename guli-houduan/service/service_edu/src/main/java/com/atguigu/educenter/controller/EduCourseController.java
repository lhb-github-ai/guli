package com.atguigu.educenter.controller;


import com.atguigu.commonutils.R;
import com.atguigu.educenter.entity.EduCourse;
import com.atguigu.educenter.entity.vo.CourseInfoVo;
import com.atguigu.educenter.entity.vo.CoursePublishVo;
import com.atguigu.educenter.entity.vo.CourseQuery;
import com.atguigu.educenter.service.CourseService;
import com.atguigu.educenter.service.EduCourseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * <p>
 * 课程 前端控制器
 * </p>
 *
 * @author testjava
 * @since 2020-07-27
 */
@RestController
@RequestMapping("/eduservice/edu-course")

public class EduCourseController {

    @Autowired
    private EduCourseService eduCourseService;
    @Autowired
    private CourseService courseService;


    @PostMapping("addCourseInfo")
   public R addCourseInfo(@RequestBody CourseInfoVo courseInfoVo ){

       String id=  eduCourseService.saveCourseInfo(courseInfoVo);
        return R.ok().data("courseId",id);
   }
    @GetMapping("getCourseInfo/{courseId}")
    public R getCourseInfo(@PathVariable String courseId){
        CourseInfoVo courseInfoVo=   eduCourseService.getCourseInfo(courseId);
        return R.ok().data("courseInfoVo",courseInfoVo);
    }
    @PostMapping("updateCourseInfo")
    public R updateCourseInfo(@RequestBody CourseInfoVo courseInfoVo){
        eduCourseService.updateCourseInfo(courseInfoVo);
       return R.ok();
    }
    @GetMapping("getPublishCourse/{courseId}")
    public R getPublishCourse(@PathVariable String courseId){
        CoursePublishVo coursePublishVo= eduCourseService.getPublishCourse(courseId);
        return R.ok().data("coursePublish",coursePublishVo);
    }
    @PostMapping("publishCourse/{courseId}")
    public R publishCourse(@PathVariable String courseId){
        EduCourse eduCourse = new EduCourse();
        eduCourse.setId(courseId);
        eduCourse.setStatus("Normal");
        eduCourseService.updateById(eduCourse);
        return R.ok();
    }
    @PostMapping("pageCourseCondition/{current}/{limit}")
    public R pageCourseCondition(@PathVariable long current,@PathVariable long limit,
                                  @RequestBody(required = false) CourseQuery courseQuery) {
        courseQuery.setPageNumber((int) ((current-1)*limit));
        courseQuery.setPageSize((int) limit);
        List<CoursePublishVo> coursePublishVos = courseService.findResultByInfo(courseQuery);
        int total = courseService.totals(courseQuery);
        return R.ok().data("total",total).data("rows",coursePublishVos);
    }
    @DeleteMapping("deleteCourse/{courseId}")
    public R deleteCourse(@PathVariable String courseId){
        System.out.println(courseId);
        eduCourseService.deleteCourse(courseId);
        return R.ok();
    }
}

