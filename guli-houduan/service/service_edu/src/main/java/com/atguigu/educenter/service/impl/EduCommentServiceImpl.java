package com.atguigu.educenter.service.impl;

import com.atguigu.educenter.entity.EduComment;
import com.atguigu.educenter.entity.EduTeacher;
import com.atguigu.educenter.mapper.EduCommentMapper;
import com.atguigu.educenter.service.EduCommentService;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * <p>
 * 评论 服务实现类
 * </p>
 *
 * @author testjava
 * @since 2020-08-08
 */
@Service
public class EduCommentServiceImpl extends ServiceImpl<EduCommentMapper, EduComment> implements EduCommentService {

    @Override
    public Map<String, Object> getCommentList(Page<EduComment> pagecomment,String courseId) {
        QueryWrapper<EduComment> wrapper = new QueryWrapper<>();
        wrapper.eq("course_id",courseId);
        wrapper.orderByDesc("gmt_create");
        baseMapper.selectPage(pagecomment,wrapper);

        List<EduComment> records = pagecomment.getRecords();
        long current = pagecomment.getCurrent();
        long pages = pagecomment.getPages();
        long size = pagecomment.getSize();
        long total = pagecomment.getTotal();

        boolean hasNext = pagecomment.hasNext();
        boolean hasPrevious = pagecomment.hasPrevious();

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
