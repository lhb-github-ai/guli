import request from '@/utils/request'
export default {
  getListBanner() {
    return request({
      url: `/educms/crm-bannerfront/getAllBanner`,
      method: 'get'
    })
  }
}