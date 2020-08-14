package com.atguigu.educenter.controller;/*
 *@Author lee
 * @date 2020/08/06
 */

import com.atguigu.commonutils.JwtUtils;
import com.atguigu.educenter.entity.ConstantWxUtils;
import com.atguigu.educenter.entity.UcenterMember;
import com.atguigu.educenter.service.UcenterMemberService;
import com.atguigu.educenter.utils.HttpClientUtils;
import com.atguigu.servicebase.exceptionhandler.GuliException;
import com.google.gson.Gson;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.HashMap;

@Controller
@CrossOrigin
@RequestMapping("/api/ucenter/wx")
public class WxApiController {

    @Autowired
    private UcenterMemberService ucenterMemberService;

    @GetMapping("callback")
    public String callback(String code,String state){
//        System.out.println("coded:"+code);
//        System.out.println("coded:"+state);
        String baseAccessTokenUrl = "https://api.weixin.qq.com/sns/oauth2/access_token" +
                "?appid=%s" +
                "&secret=%s" +
                "&code=%s" +
                "&grant_type=authorization_code";
    String  accessTokenUrl=   String.format(
                baseAccessTokenUrl,
                ConstantWxUtils.WX_OPEN_APP_ID,
                ConstantWxUtils.WX_OPEN_APP_SECRET,
                code
        );

      String result=null;
        try {
            result= HttpClientUtils.get(accessTokenUrl);
        } catch (Exception e) {
            e.printStackTrace();
        }
//        System.out.println("result:"+result);
        Gson gson = new Gson();
        HashMap hashMap = gson.fromJson(result, HashMap.class);
        String accessToken = (String) hashMap.get("access_token");
        String openid = (String) hashMap.get("openid");



        UcenterMember member=  ucenterMemberService.getOpenIdMember(openid);
        if (member==null){
            String baseUserInfoUrl = "https://api.weixin.qq.com/sns/userinfo?access_token="+accessToken+"&openid="+openid;

            String userInfo=null;
            try {
                userInfo = HttpClientUtils.get(baseUserInfoUrl);
            } catch (Exception e) {
                e.printStackTrace();
            }
//        System.out.println("userInfo:"+userInfo);
            HashMap hashMap1 = gson.fromJson(userInfo, HashMap.class);
            String nickname = (String) hashMap1.get("nickname");
            String headimgurl = (String) hashMap1.get("headimgurl");
            member =new UcenterMember();
            member.setOpenid(openid);
            member.setAvatar(headimgurl);
            member.setNickname(nickname);
            ucenterMemberService.save(member);
        }
        String jwtToken = JwtUtils.getJwtToken(member.getId(), member.getNickname());
        return "redirect:http://localhost:3000?token="+jwtToken;
    }


    @GetMapping("login")
    public String getWxCode(){
        String baseUrl = "https://open.weixin.qq.com/connect/qrconnect" +
                "?appid=%s" +
                "&redirect_uri=%s" +
                "&response_type=code" +
                "&scope=snsapi_login" +
                "&state=%s" +
                "#wechat_redirect";
        String redirectUrl = ConstantWxUtils.WX_OPEN_REDIRECT_URL; //获取业务服务器重定向地址
        try {
            redirectUrl = URLEncoder.encode(redirectUrl, "UTF-8"); //url编码
        } catch (UnsupportedEncodingException e) {
            throw new GuliException(20001, e.getMessage());
        }
//        String state = "imhelen";//为了让大家能够使用我搭建的外网的微信回调跳转服务器，这里填写你在ngrok的前置域名
//        System.out.println("state = " + state);

        String url=String.format(
                baseUrl,
                ConstantWxUtils.WX_OPEN_APP_ID,
                redirectUrl,
                "atguigu");
        return "redirect:"+url;
    }
}
