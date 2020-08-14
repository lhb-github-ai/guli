package com.atguigu.educenter.entity.vo;/*
 *@Author lee
 * @date 2020/07/29
 */

import lombok.Data;

import java.util.Date;

@Data
public class CoursePublishVo {
//    private static final long serialVersionUID = 1L;
    private String id;
    private String title;
    private String cover;
    private Integer lessonNum;
    private String subjectLevelOne;
    private String subjectLevelTwo;
    private String teacherName;
    private Date gmtCreate;
    private String status;
    private String price;//只用于显示
}
