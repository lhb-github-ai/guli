package com.atguigu.educenter.service;

import com.atguigu.educenter.entity.EduVideo;
import com.baomidou.mybatisplus.extension.service.IService;

/**
 * <p>
 * 课程视频 服务类
 * </p>
 *
 * @author testjava
 * @since 2020-07-27
 */
public interface EduVideoService extends IService<EduVideo> {

    void removeByCourseId(String courseId);
}
