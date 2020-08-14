import request from '@/utils/request'
export default {

    getCourseList(page,limit,searchObj) {
      return request({
        url: `/eduservice/coursefront/getCourseList/${page}/${limit}`,
        method: 'post',
        data:searchObj
      })
    },
      getAllsubject(){
      return request({
        url: `/eduservice/edu-subject/getAllSubject`,
        method: 'get',
      })
    },
      getCourseInfo(id){
      return request({
        url: `/eduservice/coursefront/getFrontCourseInfo/${id}`,
        method: 'get',
      })
    },
 
}