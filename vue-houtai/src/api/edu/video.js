import request from '@/utils/request'

export default  {
   
      
        addVideo(video){
        return request({
        url: `/eduservice/edu-video/addVideo`,
        method: 'post',
        data:video
          })
        },
        getVideo(videoId){
         return request({
         url: `/eduservice/edu-video/GetVideo/${videoId}`,
         method: 'get',
          })
    },
        updateVideo(video){
            return request({
            url: `/eduservice/edu-video/updateVideo`,
            method: 'post',
            data:video
              })
            },
        deleteVideo(videoId){
                    return request({
                    url: `/eduservice/edu-video/${videoId}`,
                    method: 'delete',
                    })
              },
         deleteAliyun(id){
                return request({
                url: `/eduvideo/video/remove/${id}`,
                method: 'delete',
                })
          },
}