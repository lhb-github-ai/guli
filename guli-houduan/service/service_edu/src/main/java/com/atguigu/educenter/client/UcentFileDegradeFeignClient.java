package com.atguigu.educenter.client;/*
 *@Author lee
 * @date 2020/08/08
 */

import com.atguigu.commonutils.R;
import com.atguigu.educenter.entity.UcenterMemberPay;
import org.springframework.stereotype.Component;

@Component
public class UcentFileDegradeFeignClient implements UcentClient{
    @Override
    public UcenterMemberPay getMemberInfoByid(String id) {

        return null;
    }

}
