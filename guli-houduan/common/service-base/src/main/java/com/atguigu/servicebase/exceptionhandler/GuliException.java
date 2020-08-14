package com.atguigu.servicebase.exceptionhandler;/*
 *@Author lee
 * @date 2020/07/22
 */

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class GuliException extends RuntimeException{

    private Integer code;
    private String  msg;
}
