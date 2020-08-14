package com.atguigu.oss.service;/*
 *@Author lee
 * @date 2020/08/01
 */

import org.springframework.web.multipart.MultipartFile;

public interface VodService {
    String uploadVideo(MultipartFile file);
}
