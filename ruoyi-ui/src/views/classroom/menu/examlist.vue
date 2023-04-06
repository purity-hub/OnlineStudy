<template>
  <div class="app-container">
    <el-card>
      <div class="listContainer___ZW4HW" v-for="(item, index) in list" :key="index">
        <div class="info___FuRA_">
          <div class="title___nxXeU">
            <div class="left___oBZYX" style="padding-right: 140px;"><span class="tag-style bg-0152d9 ml10soft"
                                                                          style="margin: 0px 10px 0px 0px;">{{item.status}}</span>
              <a v-if="item.status==='考试已结束'" :href="'/classroom/classroom/exam?examId='+item.id" target="_blank">{{item.name}}</a>
              <a v-if="item.status==='考试中'" :href="'/classroom/classroom/examing?examId='+item.id" target="_blank">{{item.name}}</a>
            </div>
            <div class="right___TePEU">
              <div>
                <aside class="flexBox___kp4Xl" style="margin-right: 10px;"><i
                  class="iconfont icon-kaishixuexi font14"></i>
                  <div>{{item.isSubmit}}</div>
                </aside>
              </div>
            </div>
          </div>
          <div class="detail___x1A55"></div>
          <div><span><span class="c-grey-333">{{item.createBy}}</span><span class="ml20 c-grey-999"><i
            class="iconfont icon-shijian1 font12 mr5"></i>{{item.startTime}} 至 {{item.endTime}} </span></span></div>
        </div>
      </div>
    </el-card>
  </div>
</template>

<script>
import {listExam1} from "@/api/exam/exam";
import Public from "@/views/public";

export default {
  name: "examlist",
  data() {
    return {
      list: [],
      loading: false,
      courseId: Public.courseId,
      queryParams: {
        courseId: Public.courseId,
      },
    };
  },
  created() {
    this.getList();
  },
  methods: {
    getList() {
      this.loading = true;
      listExam1(this.queryParams).then(response => {
        console.log(response);
        this.list = response.rows;
        //获取当前时间
        var date = new Date();
        for(var i=0;i<this.list.length;i++){
          let startTime = new Date(this.list[i].startTime)
          let endTime = new Date(this.list[i].endTime)
          if(date<startTime){
            this.list[i].status = "考试未开始";
          }else if(date>startTime && date<endTime){
            this.list[i].status = "考试中";
          }else{
            this.list[i].status = "考试已结束";
          }
          if(this.list[i].isSubmit==1){
            this.list[i].isSubmit = "已提交";
          }else{
            this.list[i].isSubmit = "未提交";
          }
        }
        //查看是否已经提交

        this.loading = false;
      });
    }
  }
}
</script>

<style scoped>
.listContainer___ZW4HW {
  padding: 20px 10px 25px 10px;
  display: flex;
  background: white;
  margin-top: 10px;
  cursor: pointer;
  position: relative;
  transition: all 0.3s;
}

.listContainer___ZW4HW .info___FuRA_ {
  flex: 1 1;
  margin-left: 7px;
}

.ant-layout, .ant-layout * {
  box-sizing: border-box;
}

.listContainer___ZW4HW .info___FuRA_ .title___nxXeU {
  display: flex;
  justify-content: space-between;
}

.listContainer___ZW4HW .info___FuRA_ .detail___x1A55 {
  display: flex;
  margin-top: 7px;
  font-size: 12px;
}

.ml20 {
  margin-left: 20px !important;
}

.font12 {
  font-size: 12px !important;
}

.mr5 {
  margin-right: 5px !important;
}

.iconfont {
  font-family: "iconfont" !important;
  font-size: 16px;
  font-style: normal;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
}

.iconfont {
  font-family: "iconfont" !important;
  font-size: 16px;
  font-style: normal;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
}

.tag-style {
  min-width: 68px;
  padding: 0 10px;
  height: 24px;
  line-height: 24px;
  text-align: center;
  color: white;
  display: inline-block;
  vertical-align: top;
  border-radius: 24px;
}

.bg-0152d9 {
  background: #0152d9;
}

.ml10soft {
  margin-left: 10px;
}
</style>
