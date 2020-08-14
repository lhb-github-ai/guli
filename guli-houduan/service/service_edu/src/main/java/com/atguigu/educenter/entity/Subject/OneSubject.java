package com.atguigu.educenter.entity.Subject;/*
 *@Author lee
 * @date 2020/07/27
 */

import lombok.Data;

import java.util.ArrayList;
import java.util.List;

@Data
public class OneSubject {

    private String  id;
    private String  title;

    private List<TwoSubject> children=new ArrayList<>();
}
