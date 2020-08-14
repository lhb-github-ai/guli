package com.atguigu.msmservice.service;/*
 *@Author lee
 * @date 2020/08/04
 */

import java.util.HashMap;

public interface MsmService {
    boolean send(HashMap<String, Object> param, String phone);
}
