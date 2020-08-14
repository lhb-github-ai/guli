import request from '@/utils/request'

export default {

  getPlayAuth(id) {
    return request({
      url: `/eduvideo/video/getPlayAuth/${id}`,
      method: 'get'
    })
  }

}