import request from '@/utils/request'

export default  {
   
        //课程分类
        addCourseInfo(courseInfo){
        return request({
        url: `/eduservice/edu-course/addCourseInfo`,
        method: 'post',
        data:courseInfo
             })
        },
        getListTeacher(){
                return request({
                url: `/eduservice/edu-teacher/findAll`,
                method: 'get',
                     })
                },
      getCourseInfo(courseId){
          return request({
           url: `/eduservice/edu-course/getCourseInfo/${courseId}`,
          method: 'get',
          })
     },
     updateCourseInfo(courseInfo){
          return request({
           url: `/eduservice/edu-course/updateCourseInfo`,
          method: 'post',
          data:courseInfo
          })
     },
     getCoursePublish(courseId){
          return request({
           url: `/eduservice/edu-course/getPublishCourse/${courseId}`,
          method: 'get',
          })
     },
     publishCourse(courseId){
          return request({
               url:'/eduservice/edu-course/publishCourse/'+courseId,
               method:'post'
          })
     },
     getPageCourseCondition(current,limit,courseQuery){
          return request({
          url: `/eduservice/edu-course/pageCourseCondition/${current}/${limit}`,
          method: 'post',
          data:courseQuery
               })
          },
          removeCourse(courseId){
               return request({
               url: `/eduservice/edu-course/deleteCourse/${courseId}`,
               method: 'delete',
             })
            },
}