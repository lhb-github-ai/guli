import request from '@/utils/request'

export default  {
   
        
        createDay(day){
        return request({
        url: `/statistics/daily/registerCount/${day}`,
        method: 'post',
             })
        },
        getDataSta(searchObj){
          return request({
          url: `/statistics/daily/showData/${searchObj.type}/${searchObj.begin}/${searchObj.end}`,
          method: 'get',
               })
          },
}