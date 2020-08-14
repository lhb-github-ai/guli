package com.atguigu.educenter.service.impl;

import com.atguigu.educenter.entity.EduTeacher;
import com.atguigu.educenter.mapper.EduTeacherMapper;
import com.atguigu.educenter.service.EduTeacherService;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * <p>
 * 讲师 服务实现类
 * </p>
 *
 * @author testjava
 * @since 2020-07-20
 */
@Service
public class EduTeacherServiceImpl extends ServiceImpl<EduTeacherMapper, EduTeacher> implements EduTeacherService {

    @Cacheable(value = "teacher", key = "'teacherList'")
    @Override
    public List<EduTeacher> listTeacher() {
        QueryWrapper<EduTeacher> wrapperteacher = new QueryWrapper<>();
        wrapperteacher.orderByDesc("id");
        wrapperteacher.last("limit 4");
        List<EduTeacher> eduTeachers = baseMapper.selectList(wrapperteacher);
        return eduTeachers;
    }

    @Override
    public Map<String, Object> getTeacherList(Page<EduTeacher> pageteacher) {
               QueryWrapper<EduTeacher> wrapper = new QueryWrapper<>();
        wrapper.orderByDesc("id");
        baseMapper.selectPage(pageteacher,wrapper);

        List<EduTeacher> records = pageteacher.getRecords();
        long current = pageteacher.getCurrent();
        long pages = pageteacher.getPages();
        long size = pageteacher.getSize();
        long total = pageteacher.getTotal();

        boolean hasNext = pageteacher.hasNext();
        boolean hasPrevious = pageteacher.hasPrevious();

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
}
