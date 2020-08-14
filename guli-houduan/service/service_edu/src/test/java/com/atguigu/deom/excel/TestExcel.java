package com.atguigu.deom.excel;/*
 *@Author lee
 * @date 2020/07/25
 */

import com.alibaba.excel.EasyExcel;

import java.util.ArrayList;
import java.util.List;

public class TestExcel {

    public static void main(String[] args) {

        //写操作
//        String filename="F:\\write.xlsx";
//
//        EasyExcel.write(filename,DemoExcel.class).sheet("学生列表").doWrite(getData());



        //读操作
        String filename="F:\\write.xlsx";
        EasyExcel.read(filename,DemoExcel.class,new ExcelListener()).sheet().doRead();


    }

    private static List<DemoExcel> getData() {

        ArrayList<DemoExcel> list = new ArrayList<>();
        for (int i = 0; i < 10; i++) {
            DemoExcel demoExcel = new DemoExcel();
            demoExcel.setSno(i);
            demoExcel.setSname("lucy"+i);
            list.add(demoExcel);
        }
        return list;

    }
}
