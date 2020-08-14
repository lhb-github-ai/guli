package com.atguigu.educenter.entity.chapter;/*
 *@Author lee
 * @date 2020/07/28
 */

import lombok.Data;

import java.util.ArrayList;
import java.util.List;

@Data
public class ChapterVo {

    private  String id;

    private  String  title;

    private List<VideoVo>  children=new ArrayList<>();

}
