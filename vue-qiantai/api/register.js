import request from '@/utils/request'
export default {

  sendCode(phone) {
    return request({
      url: `/edumsm/msm/send/${phone}`,
      method: 'get'
    })
  },
  register(formItem) {
    return request({
      url: `/educenter/ucenter-member/register`,
      method: 'post',
      data:formItem
    })
  }
}