package com.atguigu.oss.controller;/*
 *@Author lee
 * @date 2020/07/23
 */

import com.atguigu.commonutils.R;
import com.atguigu.oss.service.OssService;
import io.swagger.annotations.Api;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;


@Api(description="头像")
@RestController
@RequestMapping("/eduoss/fileoss")
@CrossOrigin
public class OssController {

    @Autowired
    public OssService ossService;
  @PostMapping
    public R uploadOssFile(MultipartFile file){
       String url =ossService.uploadFileAvatar(file);

        return R.ok().data("url",url);
    }
}
