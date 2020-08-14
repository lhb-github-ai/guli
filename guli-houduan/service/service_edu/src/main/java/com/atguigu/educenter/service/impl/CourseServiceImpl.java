package com.atguigu.educenter.service.impl;

import com.atguigu.educenter.entity.vo.CoursePublishVo;
import com.atguigu.educenter.entity.vo.CourseQuery;
import com.atguigu.educenter.mapper.CourseMapper;
import com.atguigu.educenter.service.CourseService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * <p>
 * 课程 服务实现类
 * </p>
 *
 * @author testjava
 * @since 2020-07-27
 */
@Service
public class CourseServiceImpl extends ServiceImpl<CourseMapper, CoursePublishVo> implements CourseService {


    @Autowired
    private  CourseMapper courseMapper;

    @Override
    public List<CoursePublishVo> findResultByInfo(CourseQuery courseQuery) {

        return courseMapper.findResultByInfo(courseQuery);
    }

    @Override
    public Integer totals(CourseQuery courseQuery) {
        return courseMapper.totals(courseQuery);
    }
}
