package com.atguigu.vod.service;/*
 *@Author lee
 * @date 2020/08/01
 */

import org.springframework.web.multipart.MultipartFile;

import java.util.List;

public interface VodService {
    String uploadVideo(MultipartFile file);

    void removeMoreVideo(List videoIdList);
}
