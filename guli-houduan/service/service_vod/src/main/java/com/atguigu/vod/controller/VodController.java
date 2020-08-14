package com.atguigu.vod.controller;/*
 *@Author lee
 * @date 2020/08/01
 */

import com.aliyuncs.DefaultAcsClient;
import com.aliyuncs.exceptions.ClientException;
import com.aliyuncs.vod.model.v20170321.DeleteVideoRequest;
import com.aliyuncs.vod.model.v20170321.GetVideoPlayAuthRequest;
import com.aliyuncs.vod.model.v20170321.GetVideoPlayAuthResponse;
import com.atguigu.commonutils.R;
import com.atguigu.servicebase.exceptionhandler.GuliException;
import com.atguigu.vod.service.VodService;
import com.atguigu.vod.utils.ConstantVodUtils;
import com.atguigu.vod.utils.InitObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;


@RestController
@RequestMapping("/eduvideo/video")
@CrossOrigin
public class VodController {

    @Autowired
    private VodService vodService;

    @PostMapping
    public R  uploadAlyiVideo(MultipartFile file){
           String vodId=vodService.uploadVideo(file);
        return R.ok().data("videoId",vodId);
    }

    @DeleteMapping("remove/{id}")
    public R remove(@PathVariable String id){
           try{
               DefaultAcsClient client = InitObject.initVodClient(ConstantVodUtils.ACCESS_KEY_ID, ConstantVodUtils.ACCESS_KEY_SECRET);
               DeleteVideoRequest request = new DeleteVideoRequest();
               request.setVideoIds(id);
               client.getAcsResponse(request);
               return R.ok();
           }catch (Exception e){
               e.printStackTrace();
               throw  new GuliException(2001,"删除视频失败");
           }
    }

    //删除多个
    @DeleteMapping("delete-batch")
    public R deleteBatch(@RequestParam("videoIdList") List<String> videoIdList){

        vodService.removeMoreVideo(videoIdList);
        return R.ok();
    }
   @GetMapping("getPlayAuth/{id}")
    public R  getPlayAuth(@PathVariable String id){

       try {
           DefaultAcsClient client = InitObject.initVodClient(ConstantVodUtils.ACCESS_KEY_ID, ConstantVodUtils.ACCESS_KEY_SECRET);
           GetVideoPlayAuthRequest request = new GetVideoPlayAuthRequest();
           request.setVideoId(id);
           GetVideoPlayAuthResponse response = client.getAcsResponse(request);
           String playAuth = response.getPlayAuth();
           return R.ok().data("playAuth",playAuth);
       } catch (ClientException e) {
           e.printStackTrace();
           throw new GuliException(20001,"获取凭证失败");
       }


    }
}
