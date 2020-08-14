package com.atguigu.educenter.controller;/*
 *@Author lee
 * @date 2020/07/23
 */

import com.atguigu.commonutils.R;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("eduservice/user")

public class EduLoginController {

    @PostMapping("login")
     public R login(){

         return R.ok().data("token","admin");
     }

    @GetMapping("info")
    public R info(){
        return R.ok().data("roles","[admin]").data("name","admin").data("avatar","https://ss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=151472226,3497652000&fm=26&gp=0.jpg");
    }
}
