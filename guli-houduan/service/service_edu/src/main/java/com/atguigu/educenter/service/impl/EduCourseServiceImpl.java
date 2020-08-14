package com.atguigu.educenter.service.impl;

import com.atguigu.educenter.entity.EduCourse;
import com.atguigu.educenter.entity.EduCourseDescription;
import com.atguigu.educenter.entity.EduTeacher;
import com.atguigu.educenter.entity.frontVo.CourseFrontVo;
import com.atguigu.educenter.entity.frontVo.CourseWebVo;
import com.atguigu.educenter.entity.vo.CourseInfoVo;
import com.atguigu.educenter.entity.vo.CoursePublishVo;
import com.atguigu.educenter.mapper.EduCourseMapper;
import com.atguigu.educenter.service.EduChapterService;
import com.atguigu.educenter.service.EduCourseDescriptionService;
import com.atguigu.educenter.service.EduCourseService;
import com.atguigu.educenter.service.EduVideoService;
import com.atguigu.servicebase.exceptionhandler.GuliException;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * <p>
 * 课程 服务实现类
 * </p>
 *
 * @author testjava
 * @since 2020-07-27
 */
@Service
public class EduCourseServiceImpl extends ServiceImpl<EduCourseMapper, EduCourse> implements EduCourseService {


    @Autowired
    private EduCourseDescriptionService eduCourseDescriptionService;

    @Autowired
    private EduVideoService eduVideoService;
    @Autowired
    private EduChapterService eduChapterService;

    @Override
    public String saveCourseInfo(CourseInfoVo courseInfoVo) {
        EduCourse eduCourse=new EduCourse();
        BeanUtils.copyProperties(courseInfoVo,eduCourse);
        int insert = baseMapper.insert(eduCourse);
        if (insert==0){
            throw  new GuliException(20001,"添加课程信息失败");
        }
        String cid = eduCourse.getId();
        EduCourseDescription eduCourseDescription = new EduCourseDescription();
        BeanUtils.copyProperties(courseInfoVo,eduCourseDescription);
        eduCourseDescription.setId(cid);
        eduCourseDescriptionService.save(eduCourseDescription);
        return cid;
    }

    @Override
    public CourseInfoVo getCourseInfo(String courseId) {
        CourseInfoVo courseInfoVo = new CourseInfoVo();

        EduCourse eduCourse = baseMapper.selectById(courseId);
        BeanUtils.copyProperties(eduCourse,courseInfoVo);

        EduCourseDescription courseDescriptionServiceById = eduCourseDescriptionService.getById(courseId);
        BeanUtils.copyProperties(courseDescriptionServiceById,courseInfoVo);
        return courseInfoVo;
    }

    @Override
    public void updateCourseInfo(CourseInfoVo courseInfoVo) {
        EduCourse eduCourse = new EduCourse();
        BeanUtils.copyProperties(courseInfoVo,eduCourse);
        int i = baseMapper.updateById(eduCourse);
        if (i==0){
            throw new GuliException(20001,"修改信息失败");
        }
        EduCourseDescription eduCourseDescription = new EduCourseDescription();
        BeanUtils.copyProperties(courseInfoVo,eduCourseDescription);
        eduCourseDescriptionService.updateById(eduCourseDescription);

    }

    @Override
    public CoursePublishVo getPublishCourse(String courseId) {
        CoursePublishVo coursePublishVo = baseMapper.getCoursePublishVo(courseId);

        return coursePublishVo;
    }

    @Override
    public void deleteCourse(String courseId) {
        eduVideoService.removeByCourseId(courseId);
        eduChapterService.removeByCourseId(courseId);
        eduCourseDescriptionService.removeById(courseId);
        int count = baseMapper.deleteById(courseId);
        if (count==0){
            throw new GuliException(20001,"删除章节失败");
        }

    }

    @Cacheable(value = "course", key = "'courseList'")
    @Override
    public List<EduCourse> listCourse() {
        QueryWrapper<EduCourse> wrapper = new QueryWrapper<>();
        wrapper.orderByDesc("id");
        wrapper.last("limit 8");
        List<EduCourse> eduCourses = baseMapper.selectList(wrapper);
        return eduCourses;
    }

    @Override
    public Map<String, Object> getCourseList(Page<EduCourse> pagecourse, CourseFrontVo courseFrontVo) {
        QueryWrapper<EduCourse> wrapper = new QueryWrapper<>();
        if (!StringUtils.isEmpty(courseFrontVo.getSubjectParentId())){
            wrapper.eq("subject_parent_id",courseFrontVo.getSubjectParentId());
        }
        if (!StringUtils.isEmpty(courseFrontVo.getSubjectId())){
            wrapper.eq("subject_id",courseFrontVo.getSubjectId());
        }
        if (!StringUtils.isEmpty(courseFrontVo.getBuyCountSort())){
            wrapper.orderByDesc("buy_count");
        }
        if (!StringUtils.isEmpty(courseFrontVo.getGmtCreateSort())){
            wrapper.orderByDesc("gmt_create");
        }
        if (!StringUtils.isEmpty(courseFrontVo.getPriceSort())){
            wrapper.orderByDesc("price");
        }
        baseMapper.selectPage(pagecourse,wrapper);
        List<EduCourse> records = pagecourse.getRecords();
        long current = pagecourse.getCurrent();
        long pages = pagecourse.getPages();
        long size = pagecourse.getSize();
        long total = pagecourse.getTotal();

        boolean hasNext = pagecourse.hasNext();
        boolean hasPrevious = pagecourse.hasPrevious();

        HashMap<String, Object> map = new HashMap<>();
        map.put("items", records);
        map.put("current", current);
        map.put("pages", pages);
        map.put("size", size);
        map.put("total", total);
        map.put("hasNext", hasNext);
        map.put("hasPrevious", hasPrevious);
        return map;
    }

    @Override
    public CourseWebVo getBaseCourseInfo(String courseId) {

        return baseMapper.getBaseCourseInfo(courseId);
    }
}
