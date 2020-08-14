<template>
    <div>
        <!--查询表单-->
    <el-form :inline="true" class="demo-form-inline">
      <el-form-item>
        <el-input v-model="courseQuery.title" placeholder="课程名称"/>
      </el-form-item>
      <el-form-item>
        <el-select v-model="courseQuery.status" clearable placeholder="课程状态">
          <el-option value="Normal" label="已发布"/>
          <el-option value="Draft" label="未发布"/>
        </el-select>
      </el-form-item>
      </el-form-item>
      <el-button type="primary" icon="el-icon-search" @click="getList()">查询</el-button>
      <el-button type="default" @click="resetData()">清空</el-button>
    </el-form>
        <!-- 表格 -->
    <el-table
      v-loading="listLoading"
      :data="list"
      element-loading-text="数据加载中"
      border
      fit
      highlight-current-row>
      <el-table-column
        label="序号"
        width="70"
        align="center">
        <template slot-scope="scope">
          {{ (page - 1) * limit + scope.$index + 1 }}
        </template>
      </el-table-column>
      <el-table-column prop="title" label="课程名称" width="130" />
      <el-table-column label="课程状态" width="150">
        <template slot-scope="scope">
          {{ scope.row.status==='Normal'?'已发布':'未发布' }}
        </template>
      </el-table-column>
      <el-table-column prop="lessonNum" label="总课时" width="110" />
        <el-table-column prop="price" label="价格" width="110" />
      <el-table-column prop="gmtCreate" label="添加时间" width="150"/>
      <el-table-column prop="subjectLevelOne" label="一级分类" width="130"/>
      <el-table-column prop="subjectLevelTwo" label="二级分类" width="130"/>
       <el-table-column label="头像" width="150" >
        <template   slot-scope="scope">
          <img :src="scope.row.cover"  min-width="150" height="80" />
        </template>
      </el-table-column>
      <el-table-column label="操作" width="200" align="center">
        <template slot-scope="scope">
          <router-link :to="'/course/info/'+scope.row.id+'&logo=5'">
            <el-button type="primary" size="mini" icon="el-icon-edit">编辑课程基本信息</el-button>
          </router-link>
           <router-link :to="'/course/chapter/'+scope.row.id+'&logo=5'">
            <el-button type="primary" size="mini" icon="el-icon-edit">编辑课程大纲信息</el-button>
          </router-link>
          <el-button type="danger" size="mini" icon="el-icon-delete" @click="removeDataById(scope.row.id)">删除</el-button>
        </template>
      </el-table-column>
    </el-table>
    
   <!-- 分页 -->
    <el-pagination
      :current-page="page"
      :page-size="limit"
      :total="total"
      style="padding: 30px 0; text-align: center;"
      layout="total, prev, pager, next, jumper"
      @current-change="getList"
    />
    </div>
</template>
<script>
import course from '@/api/edu/course'
export default {
    data(){
        return{
               list:null,
               page:1,
               limit:5,
               courseQuery:{},
               total:0,
               listLoading:false,
        }
    },
    created(){
            this.getList()
    },
    methods:{
        getList(page=1){
            this.page=page
                course.getPageCourseCondition(this.page,this.limit,this.courseQuery)
                .then(response=>{
                    // console.log(response.data.rows);
                    this.list=response.data.rows;
                    this.total=response.data.total;
                }).catch(error=>{
                    console.log(error);
                }) 
        },
        resetData(){
            this.courseQuery={}
               this.getList()
        },
        removeDataById(courseId){
            this.$confirm('此操作将永久删除讲师记录, 是否继续?', '提示', {
            confirmButtonText: '确定',
            cancelButtonText: '取消',
            type: 'warning'
            }).then(() => {
              course.removeCourse(courseId).then(response=>{
                this.getList()
             }).catch(error=>{
              console.log(error);
            })
            this.$message({
                
                type: 'success',
                message: '删除成功!'
            });
            })
        }
             
    }
    
}
</script>
<style scoped>

</style>