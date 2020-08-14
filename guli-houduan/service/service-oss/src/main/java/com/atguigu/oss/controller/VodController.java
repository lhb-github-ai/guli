package com.atguigu.oss.controller;/*
 *@Author lee
 * @date 2020/08/01
 */

import com.atguigu.commonutils.R;

import com.atguigu.oss.service.VodService;
import io.swagger.annotations.Api;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;


@Api(description="视频")
@RestController
@RequestMapping("/eduoss/video")
@CrossOrigin
public class VodController {

    @Autowired
    private VodService vodService;

    @PostMapping
    public R  uploadAlyiVideo(MultipartFile file){
        String vodId=vodService.uploadVideo(file);
        return R.ok().data("videoId",vodId);
    }
}
