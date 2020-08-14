import request from '@/utils/request'

export default  {
   
        //课程分类
        getSubject(){
        return request({
        url: `/eduservice/edu-subject/getAllSubject`,
        method: 'get',
             })
        },
}