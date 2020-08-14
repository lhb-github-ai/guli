import request from '@/utils/request'

export default  {
   
        
        getAllChapterVideo(courseId){
        return request({
        url: `/eduservice/edu-chapter/getChapterVideo/${courseId}`,
        method: 'get',
             })
        },

        addChapter(chapter){
        return request({
        url: `/eduservice/edu-chapter/addChapter`,
        method: 'post',
        data:chapter
          })
        },
        getChapter(courseId){
         return request({
         url: `/eduservice/edu-chapter/GetChapter/${courseId}`,
         method: 'get',
          })
    },
    updateChapter(chapter){
        return request({
        url: `/eduservice/edu-chapter/updateChapter`,
        method: 'post',
        data:chapter
          })
        },
        deleteChapter(courseId){
                return request({
                url: `/eduservice/edu-chapter/deleteChapter/${courseId}`,
                method: 'delete',
                 })
           },
}