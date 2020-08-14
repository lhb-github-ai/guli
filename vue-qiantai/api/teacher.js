import request from '@/utils/request'
export default {

    getTeacherList(page,limit) {
      return request({
        url: `/eduservice/teacherfront/getTeacherList/${page}/${limit}`,
        method: 'post',
      })
    },
      getTeacherListInfo(id){
      return request({
        url: `/eduservice/teacherfront/getTeacherInfo/${id}`,
        method: 'get',
      })
    },
 
}