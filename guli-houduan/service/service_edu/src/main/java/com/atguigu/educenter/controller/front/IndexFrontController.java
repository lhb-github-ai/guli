package com.atguigu.educenter.controller.front;/*
 *@Author lee
 * @date 2020/08/03
 */

import com.atguigu.commonutils.R;
import com.atguigu.educenter.entity.EduCourse;
import com.atguigu.educenter.entity.EduTeacher;
import com.atguigu.educenter.service.EduCourseService;
import com.atguigu.educenter.service.EduTeacherService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/eduservice/indexfront")
@CrossOrigin
public class IndexFrontController {

    @Autowired
    private EduCourseService courseService;
    @Autowired
    private EduTeacherService teacherService;

    @GetMapping("index")
    public R index(){

        List<EduCourse> list = courseService.listCourse();
        List<EduTeacher> eduTeachers = teacherService.listTeacher();
        return  R.ok().data("course",list).data("teacher",eduTeachers);
     }
}
