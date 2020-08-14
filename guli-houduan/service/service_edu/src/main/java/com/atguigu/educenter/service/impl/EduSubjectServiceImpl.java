package com.atguigu.educenter.service.impl;

import com.alibaba.excel.EasyExcel;
import com.atguigu.educenter.Listener.SubjectExcelListener;
import com.atguigu.educenter.entity.EduSubject;
import com.atguigu.educenter.entity.Subject.OneSubject;
import com.atguigu.educenter.entity.Subject.TwoSubject;
import com.atguigu.educenter.entity.excel.SubjectData;
import com.atguigu.educenter.mapper.EduSubjectMapper;
import com.atguigu.educenter.service.EduSubjectService;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;

/**
 * <p>
 * 课程科目 服务实现类
 * </p>
 *
 * @author testjava
 * @since 2020-07-25
 */
@Service
public class EduSubjectServiceImpl extends ServiceImpl<EduSubjectMapper, EduSubject> implements EduSubjectService {

    @Override
    public void saveSubject(MultipartFile file,EduSubjectService eduSubjectService) {

        try{
            InputStream inputStream = file.getInputStream();
            EasyExcel.read(inputStream, SubjectData.class,new SubjectExcelListener(eduSubjectService)).sheet().doRead();
        }catch (Exception e){
              e.printStackTrace();
        }
    }

    @Override
    public List<OneSubject> getAllOneTwoSubject() {
        //所有的一级分类
        QueryWrapper<EduSubject> wrapperOne = new QueryWrapper<>();
        wrapperOne.eq("parent_id","0");
        List<EduSubject> eduSubjectOne = baseMapper.selectList(wrapperOne);
        //所有的二级分类
        QueryWrapper<EduSubject> wrapperTwo = new QueryWrapper<>();
        wrapperOne.ne("parent_id","0");
        List<EduSubject> eduSubjectTwo = baseMapper.selectList(wrapperTwo);

        ArrayList<OneSubject> finalSubject = new ArrayList<>();

        //封装一级分类
        for (int i = 0; i < eduSubjectOne.size(); i++) {
            EduSubject eduSubject = eduSubjectOne.get(i);
            OneSubject oneSubject = new OneSubject();
            BeanUtils.copyProperties(eduSubject,oneSubject);
            finalSubject.add(oneSubject);

            //封装二级分类
            ArrayList<TwoSubject> OneSubject = new ArrayList<>();
            for (int j = 0; j < eduSubjectTwo.size(); j++) {
                EduSubject TSubject = eduSubjectTwo.get(j);
                if (TSubject.getParentId().equals(eduSubject.getId())){
                    TwoSubject TwoSubject = new TwoSubject();
                    BeanUtils.copyProperties(TSubject,TwoSubject);
                    OneSubject.add(TwoSubject);
                }
            }
            oneSubject.setChildren(OneSubject);
        }
        return finalSubject;
    }
}
