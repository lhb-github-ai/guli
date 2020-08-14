package com.atguigu.deom.excel;/*
 *@Author lee
 * @date 2020/07/25
 */

import com.alibaba.excel.context.AnalysisContext;
import com.alibaba.excel.event.AnalysisEventListener;

import java.util.Map;

public class ExcelListener extends AnalysisEventListener<DemoExcel> {

    //一行行读取
    @Override
    public void invoke(DemoExcel demoExcel, AnalysisContext analysisContext) {

        System.out.println("*****"+demoExcel);
    }

    //读取表头
    @Override
    public void invokeHeadMap(Map<Integer, String> headMap, AnalysisContext context) {
                System.out.println("表头："+headMap);
    }

    //读取完成之后
    @Override
    public void doAfterAllAnalysed(AnalysisContext analysisContext) {

    }
}
