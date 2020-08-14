package com.atguigu.educenter.service;

import com.atguigu.educenter.entity.EduTeacher;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.IService;

import java.util.List;
import java.util.Map;

/**
 * <p>
 * 讲师 服务类
 * </p>
 *
 * @author testjava
 * @since 2020-07-20
 */
public interface EduTeacherService extends IService<EduTeacher> {

    List<EduTeacher> listTeacher();

    Map<String, Object> getTeacherList(Page<EduTeacher> pageteacher);
}
