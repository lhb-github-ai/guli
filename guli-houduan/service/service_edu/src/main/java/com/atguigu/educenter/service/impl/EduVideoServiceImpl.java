package com.atguigu.educenter.service.impl;

import com.atguigu.educenter.client.VodClient;
import com.atguigu.educenter.entity.EduVideo;
import com.atguigu.educenter.mapper.EduVideoMapper;
import com.atguigu.educenter.service.EduVideoService;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import java.util.ArrayList;
import java.util.List;

/**
 * <p>
 * 课程视频 服务实现类
 * </p>
 *
 * @author testjava
 * @since 2020-07-27
 */
@Service
public class EduVideoServiceImpl extends ServiceImpl<EduVideoMapper, EduVideo> implements EduVideoService {


    @Autowired
    private VodClient vodClient;
    @Override
    public void removeByCourseId(String courseId) {

        QueryWrapper<EduVideo> wrappervideo = new QueryWrapper<>();
        wrappervideo.eq("course_id",courseId);
        wrappervideo.select("video_source_id");

        ArrayList<String> videoId = new ArrayList<>();

        List<EduVideo> eduVideos = baseMapper.selectList(wrappervideo);
        for (int i = 0; i < eduVideos.size(); i++) {
            EduVideo eduVideo = eduVideos.get(i);
            String videoSourceId = eduVideo.getVideoSourceId();
            if(!StringUtils.isEmpty(videoSourceId)){
                videoId.add(videoSourceId);
            }
        }
        if(videoId.size()>0){
            vodClient.deleteBatch(videoId);
        }


        QueryWrapper<EduVideo> wrapper = new QueryWrapper<>();
        wrapper.eq("course_id",courseId);
        baseMapper.delete(wrapper);

    }
}
