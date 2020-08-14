package com.atguigu.educenter.controller;


import com.atguigu.commonutils.R;
import com.atguigu.educenter.entity.Subject.OneSubject;
import com.atguigu.educenter.service.EduSubjectService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import org.springframework.web.multipart.MultipartFile;

import java.util.List;

/**
 * <p>
 * 课程科目 前端控制器
 * </p>
 *
 * @author testjava
 * @since 2020-07-25
 */
@RestController

@RequestMapping("/eduservice/edu-subject")
public class EduSubjectController {


    @Autowired
    private EduSubjectService eduSubjectService;

    @PostMapping("addSubject")
    public R  addSubject(MultipartFile file){
        eduSubjectService.saveSubject(file,eduSubjectService);
        return R.ok();
    }

    //列表显示（树形）
    @GetMapping("getAllSubject")
    public R getAllSubject(){

      List<OneSubject> list= eduSubjectService.getAllOneTwoSubject();
        return R.ok().data("list",list);
    }
}

