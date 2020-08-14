package com.atguigu.educenter.mapper;

import com.atguigu.educenter.entity.vo.CoursePublishVo;
import com.atguigu.educenter.entity.vo.CourseQuery;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;

import java.util.List;

/**
 * <p>
 * 课程 Mapper 接口
 * </p>
 *
 * @author testjava
 * @since 2020-07-27
 */
public interface CourseMapper extends BaseMapper<CoursePublishVo> {

    List<CoursePublishVo> findResultByInfo(CourseQuery courseQuery);
    Integer totals(CourseQuery courseQuery);
}
