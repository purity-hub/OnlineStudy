<template>
  <!--  课程详情页面-->
  <div class="app-container home">
    <el-card class="box-card">
      <el-row>
        <el-col :span="12">
          <!-- 课程图片一 -->
          <el-col :span="24">
            <img :src="'../../..'+url+'/'+course.picture" class="image" alt="加载图片失败">
          </el-col>
          <el-row :span="24">
            <el-col :span="8">
              <!--累计页面浏览量-->
              <dl class="service_dl fl">
                <dt class="colorBlue" id="_viewTimes">0</dt>
                <dd>累计页面浏览量</dd>
              </dl>
            </el-col>
            <el-col :span="8">
              <!--累计课程学习人数-->
              <dl class="service_dl fl">
                <dt class="colorRed" id="_chooseCourseCount">0</dt>
                <dd>累计选课人数</dd>
              </dl>
            </el-col>
            <el-col :span="8">
              <!--累计课程学习时长-->
              <dl class="service_dl fl">
                <dt class="colorYellow" id="_bbsAllCount">0</dt>
                <dd>累计互动次数</dd>
              </dl>
            </el-col>
          </el-row>
        </el-col>
        <el-col :span="11" :offset="1">
          <!-- 课程名称 -->
          <el-col :span="24">
            <dl class="mgCard_deta">
              <dt>
                <h2 class="mgCard_h2">{{ course.name }}</h2>
                <span class=" ">
						</span>
              </dt>
              <dd class="teacher">主讲教师：{{ course.teacher }}</dd>
              <dd>期次：{{ course.period }}
                <span class="mgCard_dijiqi">
							<a class="mgCard_dijiqi_name" style="cursor: pointer"></a>
							<span class="mgCard_dijiqi_con" style="display: none;"></span>
              </span>
              </dd>
              <dd>起止日期 {{ course.starttime }}：至{{ course.endtime }}</dd>
              <dd>教学进度：
                <span class="mgCard_state">
                <a class="current" v-if="course.progress==='预报名'">预报名</a>
                <a v-else>预报名</a>
                <a class="current" v-if="course.progress==='进行中'">进行中</a>
                <a v-else>进行中</a>
                <a class="current" v-if="course.progress==='已结束'">已结束</a>
                <a v-else>已结束</a>
                </span>
              </dd>
              <dd>学时：{{ course.hours }} 学时</dd>
            </dl>
            <!--课程简介-->
            <span>
              课程简介:{{ course.introduce }}
            </span>
            <el-divider></el-divider>
            <el-button type="primary" class="joinclass" @click="selectCourse">加入课程</el-button>
            <el-button type="primary" class="joinclass" @click="intoCourse">进入课程</el-button>
          </el-col>
        </el-col>
      </el-row>
    </el-card>
    <el-card class="box-card">
      <el-tabs v-model="activeName">
        <el-tab-pane label="课程简介" name="first">
          <h2 class="kc_h2">这门课会讲什么？</h2><br/>
          {{ course.sayabout }}
          <el-divider></el-divider>
          <h2 class="kc_h2">这门课有什么特点？</h2><br/>
          {{ course.peculiarity }}
          <el-divider></el-divider>
          <h2 class="kc_h2">这门课有什么要求？</h2><br/>
          {{ course.request }}
        </el-tab-pane>
        <el-tab-pane label="课程章节" name="second">
          <el-table
            v-if="refreshTable"
            v-loading="loading"
            :data="chapterList"
            row-key="id"
            :default-expand-all="isExpandAll"
            :tree-props="{children: 'children', hasChildren: 'hasChildren'}"
          >
            <el-table-column label="章节名称" prop="name"/>
          </el-table>
        </el-tab-pane>
        <el-tab-pane label="师生互答" name="third">
          <div class="mkpt_search">
            <div class="mkpt_form">
              <input type="text" name="text" class="mkpt_input" placeholder="输入标题" id="c_title">
            </div>
            <div class="mkpt_form">
              <textarea class="mkpt_area fl" placeholder="写下您的提问..." id="askTopic"></textarea>
              <input type="button" name="button" value="提问" class="mkpt_bnt bgBlue fr" onclick="submitGroupTopicForm('227467518','61116204','b25307247f068d820a2db4b72104f3bb')">
            </div>
          </div>
        </el-tab-pane>
        <el-tab-pane label="课程评价" name="fourth">
          <el-rate class="elrate"
            v-model="value"
            show-text>
          </el-rate>
        </el-tab-pane>
        <el-tab-pane label="常见问题" name="fifth">
          <div class="mkRset" style="">
            <dl class="mkRset_row">
              <dt>1.我该如何学习这门课程？</dt>
              <dd>（1）首先您要注册一个学银在线的账号。</dd>
              <dd>（2）您需要有一定的上网条件，能够流畅的观看教学视频。在观看的过程中，您可以选择在PC端登陆我们的网页， 也可以选择下载我们的app学习通，通过手机客户端来学习</dd>
              <dd>（3）您一旦报名选择了课程，我们的课程主讲老师或课程团队会通过通知的形式给您发送课程有关的消息，同时会抄送您的邮箱，请您及时查收。</dd>
            </dl>
            <dl class="mkRset_row">
              <dt>2.我在学习过程中遇到问题了，怎么办？</dt>
              <dd>您可以通过以下几种方式获取帮助：</dd>
              <dd>（1）在课程群聊中发布求助信息，说不定和你一起学习这门课的小伙伴就能够解决你的问题呢；</dd>
              <dd>（2）在课程讨论区留言，课程团队看到后将会及时回复。</dd>
              <dd>（3）联系我们的客服，或者随时给我们发邮件，邮箱地址：xueyinkf@chaoxing.com</dd>
            </dl>
            <dl class="mkRset_row">
              <dt>3.我是新手，能否给我一些学习建议？</dt>
              <dd>
                （1）我们的课程采用MOOC的方式授课，因此您可以自由安排您的学习时间、学习地点。但我们仍旧希望您每周能都有固定的时间持续进行本课程的学习，根据人的记忆曲线显示这种规律的学习方式能够最大限度的提升您的学习质量。
              </dd>
              <dd>（2）学习的过程比较容易，为了检验您的学习成果，我们的课程团队会在课程章节结束后布置测验或作业，希望您尽可能的按时独立完成。如果有没有掌握的知识点，您可以继续回看复习课程。</dd>
              <dd>（3）希望您能够积极参与课程的讨论，与各位学习者一起煮酒论英雄。在讨论的过程中，不光可以对课程所学内容温习内化，还能互相碰撞出思想的火花，相信您一定会有额外的收获。</dd>
            </dl>
          </div>
        </el-tab-pane>
      </el-tabs>
    </el-card>
  </div>
</template>

<script>
import {getCourse, getTeacherName,getChapter} from "@/api/course/course";
import {listChapter} from "@/api/chapter/chapter";
import {chooseCourse} from "@/api";

export default {
  name: "CourseInfo",
  data() {
    return {
      activeName: "first",
      course: {
        id: 0,
        name: "",
        picture: "",
        teacher: "",
        introduce: "",
        ispublic: "",
        period: "",
        starttime: "",
        endtime: "",
        progress: "",
        hours: "",
        sayabout: "",
        peculiarity: "",
        request: ""
      },
      // 重新渲染表格状态
      refreshTable: true,
      chapterList: [],
      // 遮罩层
      loading: true,
      // 是否展开，默认全部展开
      isExpandAll: true,
      // 查询参数
      queryParams: {
        name: null,
        courseid: null
      },
      url: process.env.VUE_APP_BASE_API,
      value: null
    };
  },
  created() {
    this.course.id = this.$route.query.id;
    //根据id查询课程信息
    this.getCourseInfo();
    //根据id查询章节信息
    this.getChapter(this.course.id)
  },
  watch: {
    $route(to, from) {
      this.course.id = to.query.id;
      if(this.course.id!==undefined){
        //根据id查询课程信息
        this.getCourseInfo();
        //根据id查询章节信息
        this.getChapter(this.course.id)
      }
    }
  },
  mounted() {

  },
  methods: {
    getCourseInfo() {
      if (this.course.id == null) {

      } else {
        getCourse(this.course.id).then(response => {
          this.course = response.data;
          //根据teacherId查询教师信息
          this.getTeacherInfo(this.course.teacher);
        });
      }
    },
    getTeacherInfo(id) {
      //根据teacherId查询教师信息
      getTeacherName(id).then(response => {
        this.course.teacher = response.msg;
      });
    },
    getChapter(id) {
      this.queryParams.courseid = id;
      this.loading = true;
      listChapter(this.queryParams).then(response => {
        this.chapterList = this.handleTree(response.data, "id", "parentid");
        this.loading = false;
      });
    },
    //加入课程
    selectCourse() {
      chooseCourse(this.course.id).then(response => {
        this.$message({
          message: '选课成功',
          type: 'success'
        });
        this.listCourse();
      });
    },
    //进入课程
    intoCourse() {
      this.$router.push({
        path: "/classroom/classroom",
        query: {
          id: this.course.id
        }
      });
    },
  }
}
</script>

<style scoped>
/*随着窗口缩放,自动改变image*/
.image {
  width: 100%;
  height: auto;
}

.courseName {
  line-height: 46px;
  font-size: 20px;
  font-weight: bold;
  display: inline-block;
  vertical-align: middle;
  overflow: hidden;
  white-space: nowrap;
  text-overflow: ellipsis;
}

.mgCard_deta {
  min-height: 258px;
  border-bottom: solid #e5e5e5 1px;
}

.mgCard_deta .mgCard_h2 {
  line-height: 46px;
  font-size: 20px;
  font-weight: bold;
  display: inline-block;
  vertical-align: middle;
  overflow: hidden;
  white-space: nowrap;
  text-overflow: ellipsis;
}

.mgCard_deta dd {
  height: 40px;
  line-height: 40px;
  font-size: 14px;
}

.mgCard_state a.current, .mgCard_state a.current:hover {
  background: #166eb6;
  color: #FFFFFF;
}

.mgCard_state a, .mgCard_state a:hover {
  padding: 0 10px;
  height: 22px;
  line-height: 22px;
  font-size: 14px;
  color: #b5b5b5;
  border-radius: 20px;
  display: inline-block;
  vertical-align: middle;
}

a {
  color: #333;
  text-decoration: none;
}

.service_dl {
  width: 236px;
  padding-top: 24px;
  text-align: center;
}

.colorBlue {
  color: #187bcd;
}

.service_dl dt {
  line-height: 40px;
  font-size: 34px;
}

::v-deep .el-tabs__nav-scroll {
  width: 50%;
  margin: 0 auto
}

.joinclass {
  /*  居中*/
  margin: 0 auto;
  display: block;
}

.kc_h2 {
  padding-left: 16px;
  line-height: 22px;
  font-size: 16px;
  color: #111111;
  font-weight: bold;
}

.mkRset {
  padding: 20px 0;
}
.mkRset_row {
  padding: 15px 0;
  line-height: 22px;
  background: #FFFFFF;
  border-radius: 10px;
}

.mkRset_row dt {
  font-size: 16px;
  font-weight: bold;
}

.mkpt_search {
  padding: 15px 56px;
  background: #f7f7f7;
}

.mkpt_form {
  width: 824px;
  zoom: 1;
  overflow: hidden;
  margin: 0 auto;
}

.mkpt_input {
  width: 800px;
  height: 22px;
  line-height: 22px;
  font-size: 16px;
  padding: 10px 12px;
  border: 0;
  background: #FFFFFF;
  border-radius: 5px;
}
.mkpt_form + .mkpt_form {
  margin-top: 15px;
}

.mkpt_form {
  width: 824px;
  zoom: 1;
  overflow: hidden;
  margin: 0 auto;
}

.mkpt_area {
  width: 720px;
  height: 120px;
  line-height: 24px;
  font-size: 16px;
  padding: 10px 12px;
  border: 0;
  background: #FFFFFF;
  border-radius: 5px;
}

.mkpt_bnt {
  width: 80px;
  height: 140px;
  font-size: 20px;
  color: #FFF;
  border: 0 none;
  border-radius: 5px;
  cursor: pointer;
  background: #2d8bf2;
  background: -webkit-linear-gradient(60deg, #25b6fc, #3174ec);
  background: -moz-linear-gradient(60deg, #25b6fc, #3174ec);
  background: -o-linear-gradient(60deg, #25b6fc, #3174ec);
  background: linear-gradient(60deg, #25b6fc, #3174ec);
}

.elrate{
  display: inline-block;
  vertical-align: middle;
  margin-left: 10px;
}
</style>
