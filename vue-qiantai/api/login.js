import request from '@/utils/request'
export default {

    submitLogin(userInfo) {
      return request({
        url: `/educenter/ucenter-member/login`,
        method: 'post',
        data:userInfo
      })
    },
    getUserInfo() {
      return request({
        url: `/educenter/ucenter-member/getMemberInfo`,
        method: 'get',
      })
    },

}