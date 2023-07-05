<template>
  <div class="app-container home">
    <el-row>
      <el-card>
        <div slot="header" class="clearfix">
          <span>我的课程</span>
        </div>
        <el-col :span="8" v-for="(course, index) in mycourseList" :key="course">
          <el-card :body-style="{ padding: '0px' }" style = "border-radius: 12px;padding-left: 10px">
            <img :src="url+'/'+course.picture" class="image" alt="加载图片失败">
            <div style="padding: 14px;">
              <span>{{course.name}}</span>
              <div class="bottom clearfix">
                <el-button type="text" class="button" @click="lookCourse(course.id)">查看</el-button>
              </div>
            </div>
          </el-card>
        </el-col>
      </el-card>
      <el-card>
        <div slot="header" class="clearfix">
          <span>公开课</span>
        </div>
        <el-col :span="8" v-for="(course, index) in publiccourseList" :key="course">
          <el-card :body-style="{ padding: '0px' }" style = "border-radius: 12px;padding-left: 10px">
            <img :src="url+'/'+course.picture" class="image" alt="加载图片失败">
            <div style="padding: 14px;">
              <span>{{course.name}}</span>
              <div class="bottom clearfix">
                <el-button v-hasRole="['student']" type="text" class="button" @click="selectCourse(course.id)">选课</el-button>
                <el-button type="text" class="button" @click="lookCourse(course.id)">查看</el-button>
              </div>
            </div>
          </el-card>
        </el-col>
      </el-card>
    </el-row>
  </div>
</template>

<script>
import {chooseCourse, listMyCourse, listPublicCourse} from "@/api";
import Public from "@/views/public";
export default {
  name: "Index",
  data() {
    return {
      // 课程列表
      // 公开课和已经选课的课程
      mycourseList :[],
      //公开课
      publiccourseList :[],
      url: process.env.VUE_APP_BASE_API
    };
  },
  created() {
    this.listCourse();
  },
  methods: {
    goTarget(href) {
      window.open(href, "_blank");
    },
    // 获取已选课程列表
    listCourse() {
      listMyCourse().then(response => {
        this.mycourseList = response.rows;
      });
      listPublicCourse().then(response => {
        this.publiccourseList = response.rows;
      });
    },
    selectCourse(id) {
      chooseCourse(id).then(response => {
        this.$message({
          message: '选课成功',
          type: 'success'
        });
        this.listCourse();
      });
    },
    lookCourse(id) {
      // 跳转到课程详情页面
      Public.courseId = id;
      this.$router.push({path: '/course/info/courseInfo', query: {id: id}});
    }
  }
};
</script>

<style scoped lang="scss">
.home {
  blockquote {
    padding: 10px 20px;
    margin: 0 0 20px;
    font-size: 17.5px;
    border-left: 5px solid #eee;
  }
}
.time {
  font-size: 13px;
  color: #999;
}

.bottom {
  margin-top: 13px;
  line-height: 12px;
}

.button {
  padding: 0;
  float: right;
}

.image {
  width: 100%;
  height: 350px;
  display: block;
}

.clearfix:before,
.clearfix:after {
  display: table;
  content: "";
}

.clearfix:after {
  clear: both
}
</style>

