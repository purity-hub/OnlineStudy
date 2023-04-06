<template>
  <div class="app-container">
    <el-container>
      <el-aside width="300px" style="background-color: rgb(238, 241, 246)">
        <el-menu :default-active="activeMenu">
          <router-link to="/classroom/classroom/notice">
            <el-menu-item index="/classroom/classroom/notice">
              <template slot="title"><i class="el-icon-message"></i>通知公告</template>
            </el-menu-item>
          </router-link>
          <el-submenu index="2">
            <template slot="title"><i class="el-icon-menu"></i>课堂实验</template>
            <el-submenu v-for="(item, index) in chapterList" :key="index" index="2-1">
              <template slot="title"><i class="el-icon-menu"></i>{{ item.name }}</template>
              <!--二级节点-->
              <router-link v-if="item2.children==null" v-for="(item2, index2) in item.children" :key="index2"
                           :to="'/classroom/classroom/classtest?chapterid='+item2.id">
                <el-menu-item :index="item2.id">
                  {{ item2.name }}
                </el-menu-item>
              </router-link>
              <!--三级节点-->
              <el-submenu v-if="item2.children!=null" v-for="(item2, index2) in item.children" :key="index2"
                          index="2-3">
                <template slot="title"><i class="el-icon-menu"></i>{{ item2.name }}</template>
                <router-link :to="'/classroom/classroom/classtest?chapterid='+item3.id"
                             v-for="(item3, index3) in item2.children" :key="index3">
                  <el-menu-item :index="item3.id">
                    {{ item3.name }}
                  </el-menu-item>
                </router-link>
              </el-submenu>
            </el-submenu>
          </el-submenu>
          <router-link to="/classroom/classroom/codework">
            <el-menu-item index="/classroom/classroom/codework">
              <template slot="title"><i class="el-icon-s-platform"></i>编程作业</template>
            </el-menu-item>
          </router-link>
          <router-link to="/classroom/classroom/examlist">
            <el-menu-item index="/classroom/classroom/examlist">
              <template slot="title"><i class="el-icon-document"></i>在线考试</template>
            </el-menu-item>
          </router-link>
          <router-link to="/classroom/classroom/teacherexam" v-hasRole="['teacher']">
            <el-menu-item index="/classroom/classroom/teacherexam">
              <template slot="title"><i class="el-icon-document"></i>在线考试[教师]</template>
            </el-menu-item>
          </router-link>
          <router-link to="/classroom/classroom/onlinetest">
            <el-menu-item index="/classroom/classroom/onlinetest">
              <template slot="title"><i class="el-icon-s-tools"></i>在线测试工具</template>
            </el-menu-item>
          </router-link>
          <router-link to="/classroom/classroom/classfile">
            <el-menu-item index="/classroom/classroom/classfile">
              <template slot="title"><i class="el-icon-folder"></i>教学资料</template>
            </el-menu-item>
          </router-link>
          <el-menu-item index="9">
            <template slot="title"><i class="el-icon-video-camera"></i>视频直播</template>
          </el-menu-item>
          <el-menu-item index="10">
            <template slot="title"><i class="el-icon-user"></i>课堂分班</template>
          </el-menu-item>
          <router-link to="/classroom/classroom/signin">
            <el-menu-item index="/classroom/classroom/signin">
              <template slot="title"><i class="el-icon-s-claim"></i>在线签到</template>
            </el-menu-item>
          </router-link>
          <el-menu-item index="12">
            <template slot="title"><i class="el-icon-s-data"></i>数据统计</template>
          </el-menu-item>
        </el-menu>
      </el-aside>
      <el-container>
        <el-main>
          <router-view></router-view>
        </el-main>
      </el-container>
    </el-container>
  </div>
</template>

<script>
import {listChapter} from "@/api/chapter/chapter";
import Public from "@/views/public";

export default {
  name: "classroom",
  components: {Public},
  data() {
    return {
      activeMenu: "",
      courseId: "",
      chapterid: "",
      queryParams: {
        courseid: "",
        chapterid: ""
      },
      chapterList: []
    };
  },
  created() {
    //课程id用全局变量来传递
    this.courseId = Public.courseId;
    this.queryParams.courseid = this.courseId;
    this.listChapter();
  },
  mounted() {
    this.activeMenu = this.$route.path;
  },
  computed: {},
  methods: {
    //获取章节列表
    listChapter() {
      listChapter(this.queryParams).then(response => {
        this.chapterList = this.handleTree(response.data, "id", "parentid");
      });
    },
  }
}
</script>

<style scoped>

</style>
