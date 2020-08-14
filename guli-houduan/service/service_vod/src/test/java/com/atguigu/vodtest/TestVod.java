package com.atguigu.vodtest;/*
 *@Author lee
 * @date 2020/08/01
 */

import com.aliyun.vod.upload.impl.UploadVideoImpl;
import com.aliyun.vod.upload.req.UploadVideoRequest;
import com.aliyun.vod.upload.resp.UploadVideoResponse;
import com.aliyuncs.DefaultAcsClient;
import com.aliyuncs.exceptions.ClientException;
import com.aliyuncs.vod.model.v20170321.GetPlayInfoRequest;
import com.aliyuncs.vod.model.v20170321.GetPlayInfoResponse;
import com.aliyuncs.vod.model.v20170321.GetVideoPlayAuthRequest;
import com.aliyuncs.vod.model.v20170321.GetVideoPlayAuthResponse;

import java.util.List;

public class TestVod {

    public static void main(String[] args) throws Exception {

//        String accessKeyId="LTAI4GKm1tLaQRcXbZbiqFD4";
//        String accessKeySecret="WPzemtRl3GXOwpU0uv1SNXEr2AeDjF";
//
//        String title="6 - What If I Want to Move Faster---upload";
//        String fileName="F:/6 - What If I Want to Move Faster.mp4";
//        UploadVideoRequest request = new UploadVideoRequest(accessKeyId, accessKeySecret, title, fileName);
//        /* 可指定分片上传时每个分片的大小，默认为2M字节 */
//        request.setPartSize(2 * 1024 * 1024L);
//        /* 可指定分片上传时的并发线程数，默认为1，(注：该配置会占用服务器CPU资源，需根据服务器情况指定）*/
//        request.setTaskNum(1);
//        UploadVideoImpl uploader = new UploadVideoImpl();
//        UploadVideoResponse response = uploader.uploadVideo(request);
//        System.out.print("RequestId=" + response.getRequestId() + "\n");  //请求视频点播服务的请求ID
//        if (response.isSuccess()) {
//            System.out.print("VideoId=" + response.getVideoId() + "\n");
//        } else {
//            /* 如果设置回调URL无效，不影响视频上传，可以返回VideoId同时会返回错误码。其他情况上传失败时，VideoId为空，此时需要根据返回错误码分析具体错误原因 */
//            System.out.print("VideoId=" + response.getVideoId() + "\n");
//            System.out.print("ErrorCode=" + response.getCode() + "\n");
//            System.out.print("ErrorMessage=" + response.getMessage() + "\n");
//        }
        getPlayAuth();
    }




    public static void getPlayAuth() throws Exception{
        DefaultAcsClient defaultAcsClient = InitObject.initVodClient("LTAI4GKm1tLaQRcXbZbiqFD4", "WPzemtRl3GXOwpU0uv1SNXEr2AeDjF");
        GetVideoPlayAuthRequest request = new GetVideoPlayAuthRequest();
        GetVideoPlayAuthResponse response = new GetVideoPlayAuthResponse();
        request.setVideoId("cf1ad0dc7d9f4e82926774faa80ed80f");
        response= defaultAcsClient.getAcsResponse(request);
        System.out.println("playauth"+response.getPlayAuth());
    }


    public static void getPlayUrl() throws Exception{
        //1.创建初始化对象
        DefaultAcsClient defaultAcsClient = InitObject.initVodClient("LTAI4GKm1tLaQRcXbZbiqFD4", "WPzemtRl3GXOwpU0uv1SNXEr2AeDjF");
        //创建获取视频地址request和response
        GetPlayInfoRequest request = new GetPlayInfoRequest();
        GetPlayInfoResponse response = new GetPlayInfoResponse();
        //想request对象里面设置视频id
        request.setVideoId("974df3e3903b4dad9a1fe675e8652a60");

        //调用初始化对象里面的方法，传递request ，获取数据
        response= defaultAcsClient.getAcsResponse(request);
        List<GetPlayInfoResponse.PlayInfo> playInfoList = response.getPlayInfoList();
        //播放地址
        for (GetPlayInfoResponse.PlayInfo playInfo : playInfoList) {
            System.out.print("PlayInfo.PlayURL = " + playInfo.getPlayURL() + "\n");
        }
        //Base信息
        System.out.print("VideoBase.Title = " + response.getVideoBase().getTitle() + "\n");
    }
}
