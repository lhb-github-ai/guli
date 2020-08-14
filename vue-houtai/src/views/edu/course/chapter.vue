<template>
  <div class="app-container">
    <h2 style="text-align: center;">发布新课程</h2>
    <el-steps :active="2" process-status="wait" align-center style="margin-bottom: 40px;">
      <el-step title="填写课程基本信息"/>
      <el-step title="创建课程大纲"/>
      <el-step title="最终发布"/>
    </el-steps>
    <el-button type="text" @click="OpenDialog">添加章节</el-button>
          <!-- 章节 -->
          <ul class="chanpterList">
              <li
                  v-for="chapter in chapterVideoList"
                  :key="chapter.id">
                  <p>
                      {{ chapter.title }}
                      <span class="acts">
                          <el-button type="text" @click="OpenVideo(chapter.id)">添加小节</el-button>
                          <el-button style="" type="text" @click="openEditChapter(chapter.id)">编辑</el-button>
                          <el-button type="text" @click="remove(chapter.id)">删除</el-button>
                      </span>
                  </p>
                  <!-- 视频 -->
                  <ul class="chanpterList videoList">
                      <li
                          v-for="video in chapter.children"
                          :key="video.id">
                          <p>{{ video.title }}
                              <span class="acts">
                                  <el-button type="text" @click="openEditVideo(video.id)">编辑</el-button>
                                  <el-button type="text" @click="removeVideo(video.id)">删除</el-button>
                              </span>
                          </p>
                      </li>
                  </ul>
              </li>
          </ul>
          <div>
              <el-button @click="previous"  v-if="logo!='5'">上一步</el-button>
              <el-button :disabled="saveBtnDisabled" type="primary" v-if="logo!='5'" @click="next">下一步</el-button>
             <el-button type="primary"  v-if="logo==='5'" @click="update">提交</el-button>
          </div>


        <!-- 添加和修改章节表单 -->
        <el-dialog :visible.sync="dialogChapterFormVisibleL" title="添加章节">
            <el-form :model="chapter" label-width="120px">
                <el-form-item label="章节标题">
                    <el-input v-model="chapter.title"/>
                </el-form-item>
                <el-form-item label="章节排序">
                    <el-input-number v-model="chapter.sort" :min="0" controls-position="right"/>
                </el-form-item>
            </el-form>
            <div slot="footer" class="dialog-footer">
                <el-button @click="dialogChapterFormVisibleL = false">取 消</el-button>
                <el-button type="primary" @click="saveOrUpdate">确 定</el-button>
            </div>
        </el-dialog>
        <!-- 添加和修改课时表单 -->
        <el-dialog :visible.sync="dialogVideoFormVisible" title="添加课时">
        <el-form :model="video" label-width="120px">
            <el-form-item label="课时标题">
            <el-input v-model="video.title"/>
            </el-form-item>
            <el-form-item label="课时排序">
            <el-input-number v-model="video.sort" :min="0" controls-position="right"/>
            </el-form-item>
            <el-form-item label="是否免费">
            <el-radio-group v-model="video.free">
                <el-radio :label="true">免费</el-radio>
                <el-radio :label="false">默认</el-radio>
            </el-radio-group>
            </el-form-item>
            <el-form-item label="上传视频">
             <el-upload
                    :on-success="handleVodUploadSuccess"
                    :on-remove="handleVodRemove"
                    :before-remove="beforeVodRemove"
                    :on-exceed="handleUploadExceed"
                    :file-list="fileList"
                    :action="BASE_API+'/eduvideo/video'"
                    :limit="1"
                    class="upload-demo">
                <el-button size="small" type="primary">上传视频</el-button>
                <el-tooltip placement="right-end">
                <div slot="content">最大支持1G，<br>
                        支持3GP、ASF、AVI、DAT、DV、FLV、F4V、<br>
                        GIF、M2T、M4V、MJ2、MJPEG、MKV、MOV、MP4、<br>
                        MPE、MPG、MPEG、MTS、OGG、QT、RM、RMVB、<br>
                        SWF、TS、VOB、WMV、WEBM 等视频格式上传</div>
                    <i class="el-icon-question"/>
                </el-tooltip>
                </el-upload>
            </el-form-item>
        </el-form>
        <div slot="footer" class="dialog-footer">
            <el-button @click="dialogVideoFormVisible = false">取 消</el-button>
            <el-button  type="primary" @click="saveOrUpdateVideo">确 定</el-button>
            <!-- :disabled="saveVideoBtnDisabled" -->
        </div>
        </el-dialog>
  </div>
</template>
<script>
import chapter from '@/api/edu/chapter'
import video from '@/api/edu/video'
export default {
    data(){
        return{
           dialogChapterFormVisibleL:false,
           saveBtnDisabled:false,
           dialogVideoFormVisible:false,
           chapterVideoList:[],
           courseId:'',
           chapter:{},
           video:{
                title: '',
                sort: 0,
                free: 0,
                videoSourceId: '',
                videoOriginalName:'',
                }, 
            logo:''    ,
            fileList: [],//上传文件列表
            BASE_API: process.env.BASE_API // 接口API地址
        }
    },
    created() {
        if(this.$route.params && this.$route.params.id){
          this.courseId=this.$route.params.id.substring(0,19)
          this.logo=this.$route.params.id.substring(25,26)
           this.getChapterVideo()
        }
    },
    methods:{
            handleVodRemove(){
                video.deleteAliyun(this.video.videoSourceId).then(res=>{
                        this.$message({
                        type: 'success',
                        message: '删除视频成功!'
                    });
                    this.fileList=[]
                      this.video.videoSourceId=""
                    this.video.videoOriginalName=""
                })
            }, 
            beforeVodRemove(file){
                   return this.$confirm('确定移除${file.name}?')
            },
            handleVodUploadSuccess(res,file){
                    this.video.videoSourceId=res.data.videoId
                    this.video.videoOriginalName=file.name
            },
            handleUploadExceed(){
                 this.$message.warning('想要重新上传视频，请先删除已上传的视频')
            },
           openEditVideo(videoId){
                 this.dialogVideoFormVisible=true
                   video.getVideo(videoId).then(res=>{
                     this.video=res.data.video
                 })
           },
            removeVideo(videoId){
                 this.$confirm('此操作将永久删除章节记录, 是否继续?', '提示', {
                    confirmButtonText: '确定',
                    cancelButtonText: '取消',
                    type: 'warning'
                    }).then(() => {
                    video.deleteVideo(videoId).then(response=>{
                        this.getChapterVideo()
                    }).catch(error=>{
                    console.log(error);
                    })
                    this.$message({
                        type: 'success',
                        message: '删除成功!'
                    });
                    
                  })
                },
                saveVideo(){
                this.video.courseId=this.courseId
                // console.log(this.video)
                video.addVideo(this.video).then(res=>{
                      this.dialogVideoFormVisible=false
                       this.$message({ 
                        type: 'success',
                        message: '添加小节信息成功!'
                       });
                       this.getChapterVideo()
                          })
                  },
                updateVideo(){
                video.updateVideo(this.video).then(res=>{
                  this.dialogVideoFormVisible=false
                       this.$message({ 
                        type: 'success',
                        message: '修改小节信息成功!'
                       });
                       this.getChapterVideo()
              })
                  },
                saveOrUpdateVideo(){
                    if(!this.video.id){
                        this.saveVideo()
                    }else{
                        this.updateVideo()
                    }
                      
                },
                OpenVideo(chapterId){
                     this.dialogVideoFormVisible=true
                      //清空
                    this.video = {}
                    this.fileList = []
                    //设置章节id
                    this.video.chapterId = chapterId
                   
            
                },
                remove(chapterId){
                    this.$confirm('此操作将永久删除章节记录, 是否继续?', '提示', {
                    confirmButtonText: '确定',
                    cancelButtonText: '取消',
                    type: 'warning'
                    }).then(() => {
                    chapter.deleteChapter(chapterId).then(response=>{
                        this.getChapterVideo()
                    }).catch(error=>{
                    console.log(error);
                    })
                    this.$message({
                        
                        type: 'success',
                        message: '删除成功!'
                    });
                    
            })

                },
            openEditChapter(chapterId){
                 this.dialogChapterFormVisibleL=true
                 chapter.getChapter(chapterId).then(res=>{
                     this.chapter=res.data.chapter
                 })
            },

         addChapter(){
                   this.chapter.courseId=this.courseId
                   chapter.addChapter(this.chapter).then(res=>{
                    this.dialogChapterFormVisibleL=false
                       this.$message({ 
                        type: 'success',
                        message: '添加章节信息成功!'
                       });
                       this.getChapterVideo()
                })
         },
         updateChapter(){
              chapter.updateChapter(this.chapter).then(res=>{
                  this.dialogChapterFormVisibleL=false
                       this.$message({ 
                        type: 'success',
                        message: '修改章节信息成功!'
                       });
                       this.getChapterVideo()
              })
         },
        saveOrUpdate(){
          if(!this.chapter.id){
               this.addChapter()
          }else{
           this.updateChapter()   
          }
        },
          OpenDialog(){
                 this.dialogChapterFormVisibleL=true
                 this.chapter.title=''
                 this.chapter.sort=0
          },
         next(){
             this.$router.push({path:"/course/publish/"+ this.courseId})
         },
         update(){
                this.$router.push({path:"/course/list"})
         },
         previous(){
              this.$router.push({path:"/course/info/"+this.courseId})
         },
         getChapterVideo(){
           chapter.getAllChapterVideo(this.courseId).then(res=>{
             this.chapterVideoList=res.data.list
              
           })
         },
    }
}
</script>

<style scoped>
.chanpterList{
    position: relative;
    list-style: none;
    margin: 0;
    padding: 0;
}
.chanpterList li{
  position: relative;
}
.chanpterList p{
  float: left;
  font-size: 20px;
  margin: 10px 0;
  padding: 10px;
  height: 70px;
  line-height: 50px;
  width: 100%;
  border: 1px solid #DDD;
}

.chanpterList .acts {
    float: right;
    font-size: 14px;
}
.videoList{
  padding-left: 50px;
}
.videoList p{
  float: left;
  font-size: 14px;
  margin: 10px 0;
  padding: 10px;
  height: 50px;
  line-height: 30px;
  width: 100%;
  border: 1px dotted #DDD;
}
</style>