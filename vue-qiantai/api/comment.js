import request from '@/utils/request'
export default {

    getCommentList(page,limit,id) {
      return request({
        url: `/eduservice/commentfront/getCommentList/${page}/${limit}/${id}`,
        method: 'post',
      })
    },
    addComment(comment) {
      return request({
        url: `/eduservice/commentfront/addComment`,
        method: 'post',
        data:comment
      })
    },
 
}