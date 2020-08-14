package com.atguigu.oss.service;/*
 *@Author lee
 * @date 2020/07/23
 */

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;


public interface OssService {
    String uploadFileAvatar(MultipartFile file);
}
