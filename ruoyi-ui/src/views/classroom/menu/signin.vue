<template>
  <div class="app-container">
    <!--教师端-->
    <el-row :gutter="10" class="mb8">
      <el-col :span="1.5">
        <el-button
          type="primary"
          plain
          icon="el-icon-plus"
          size="mini"
          @click="handleAdd"
          v-hasRole="['teacher']"
        >新增签到</el-button>
      </el-col>
    </el-row>
    <!--学生端-->
    <el-tabs v-model="activeName" @tab-click="handleClick" class="student">
      <el-tab-pane label="全部签到" name="first">
        <el-row>
          <el-col :span="24" class="listItem___E6c2h">
            <el-card shadow="hover" v-for="(item, index) in signinrecordList" :key="index" class="el-card__body">
              <div class="ant-checkbox-group listItem___E6c2h" style="display: flex;">
                <div>
                  <div class="ant-row ant-row-space-between" style="margin-left: -8px; margin-right: -8px;">
                    <div class="ant-col ant-col-20" style="padding-left: 8px; padding-right: 8px;">
                      <div class="ant-row">
                        <div class="ant-col c-blue font16 blod"><span class="attend___mY5tE">
                          <span class="title___AzpMG">{{item.courseName}} 签到{{item.startTime}}</span>
                          <span class="history___uoHNV">{{item.status}}</span>
                        </span>
                        </div>
                      </div>
                    </div>
                    <div class="ant-col font14" style="padding-left: 8px; padding-right: 8px;"></div>
                  </div>
                  <div class="ant-row mt20 c-light-black">
                    <div class="ant-col">签到人数</div>
                    <div class="ant-col ml20" style="flex: 0 0 200px;">
                      <div class="ant-progress ant-progress-line ant-progress-status-normal ant-progress-default"
                           role="progressbar">
                        <div class="ant-progress-outer">
                          <div class="ant-progress-inner">
                            <div class="ant-progress-bg" style="width: 93%; height: 8px;"></div>
                          </div>
                        </div>
                      </div>
                    </div>
                    <div class="ant-col ml20 c-blue" style="flex: 1 1 auto;">已签到 {{item.signedNum}} / 应签到 {{item.shouldSignNum}}</div>
                  </div>
                  <div class="signInStatus___zJts9 color0152d9___rRMTC">{{item.signStatus}}</div>
                  <div class="ant-row mt20 c-light-black">
                    <div class="ant-col" style="flex: 1 1 auto;">
                      <div class="ant-row">
                        <div class="ant-col" style="flex: 1 1 auto;">签到发起人：{{item.teacherName}}</div>
                        <div class="ant-col" style="flex: 1 1 auto;">签到方式：快捷签到</div>
                        <div class="ant-col" style="flex: 1 1 auto;">结束时间:{{item.endTime}}</div>
                        <div class="ant-col" style="flex: 1 1 auto;padding-left: 100px">
                          <el-button
                            type="primary"
                            plain
                            size="mini"
                            @click="handleSignin(item.id)"
                            v-hasRole="['student']"
                          >签到</el-button>
                        </div>
                        <div class="ant-col"></div>
                      </div>
                    </div>
                    <div class="ant-col"></div>
                  </div>
                </div>
              </div>
            </el-card>
          </el-col>
        </el-row>
      </el-tab-pane>
      <el-tab-pane label="正在签到" name="second">
        <el-row>
          <el-col :span="24" class="listItem___E6c2h">
            <el-card shadow="hover" v-if="item.status==='进行中'" v-for="(item, index) in signinrecordList" :key="index" class="el-card__body">
              <div class="ant-checkbox-group listItem___E6c2h" style="display: flex;">
                <div>
                  <div class="ant-row ant-row-space-between" style="margin-left: -8px; margin-right: -8px;">
                    <div class="ant-col ant-col-20" style="padding-left: 8px; padding-right: 8px;">
                      <div class="ant-row">
                        <div class="ant-col c-blue font16 blod"><span class="attend___mY5tE">
                          <span class="title___AzpMG">{{item.courseName}} 签到{{item.startTime}}</span>
                          <span class="history___uoHNV">{{item.status}}</span>
                        </span>
                        </div>
                      </div>
                    </div>
                    <div class="ant-col font14" style="padding-left: 8px; padding-right: 8px;"></div>
                  </div>
                  <div class="ant-row mt20 c-light-black">
                    <div class="ant-col">签到人数</div>
                    <div class="ant-col ml20" style="flex: 0 0 200px;">
                      <div class="ant-progress ant-progress-line ant-progress-status-normal ant-progress-default"
                           role="progressbar">
                        <div class="ant-progress-outer">
                          <div class="ant-progress-inner">
                            <div class="ant-progress-bg" style="width: 93%; height: 8px;"></div>
                          </div>
                        </div>
                      </div>
                    </div>
                    <div class="ant-col ml20 c-blue" style="flex: 1 1 auto;">已签到 {{item.signedNum}} / 应签到 {{item.shouldSignNum}}</div>
                  </div>
                  <div class="signInStatus___zJts9 color0152d9___rRMTC">{{item.signStatus}}</div>
                  <div class="ant-row mt20 c-light-black">
                    <div class="ant-col" style="flex: 1 1 auto;">
                      <div class="ant-row">
                        <div class="ant-col" style="flex: 1 1 auto;">签到发起人：{{item.teacherName}}</div>
                        <div class="ant-col" style="flex: 1 1 auto;">签到方式：快捷签到</div>
                        <div class="ant-col" style="flex: 1 1 auto;">结束时间:{{item.endTime}}</div>
                        <div class="ant-col" style="flex: 1 1 auto;padding-left: 100px">
                          <el-button
                            type="primary"
                            plain
                            size="mini"
                            @click="handleSignin(item.id)"
                            v-hasRole="['student']"
                          >签到</el-button>
                        </div>
                        <div class="ant-col"></div>
                      </div>
                    </div>
                    <div class="ant-col"></div>
                  </div>
                </div>
              </div>
            </el-card>
          </el-col>
        </el-row>
      </el-tab-pane>
      <el-tab-pane label="历史签到" name="third">
        <el-row>
          <el-col :span="24" class="listItem___E6c2h">
            <el-card shadow="hover" v-if="item.status==='已截止'" v-for="(item, index) in signinrecordList" :key="index" class="el-card__body">
              <div class="ant-checkbox-group listItem___E6c2h" style="display: flex;">
                <div>
                  <div class="ant-row ant-row-space-between" style="margin-left: -8px; margin-right: -8px;">
                    <div class="ant-col ant-col-20" style="padding-left: 8px; padding-right: 8px;">
                      <div class="ant-row">
                        <div class="ant-col c-blue font16 blod"><span class="attend___mY5tE">
                          <span class="title___AzpMG">{{item.courseName}} 签到{{item.startTime}}</span>
                          <span class="history___uoHNV">{{item.status}}</span>
                        </span>
                        </div>
                      </div>
                    </div>
                    <div class="ant-col font14" style="padding-left: 8px; padding-right: 8px;"></div>
                  </div>
                  <div class="ant-row mt20 c-light-black">
                    <div class="ant-col">签到人数</div>
                    <div class="ant-col ml20" style="flex: 0 0 200px;">
                      <div class="ant-progress ant-progress-line ant-progress-status-normal ant-progress-default"
                           role="progressbar">
                        <div class="ant-progress-outer">
                          <div class="ant-progress-inner">
                            <div class="ant-progress-bg" style="width: 93%; height: 8px;"></div>
                          </div>
                        </div>
                      </div>
                    </div>
                    <div class="ant-col ml20 c-blue" style="flex: 1 1 auto;">已签到 {{item.signedNum}} / 应签到 {{item.shouldSignNum}}</div>
                  </div>
                  <div class="signInStatus___zJts9 color0152d9___rRMTC">{{item.signStatus}}</div>
                  <div class="ant-row mt20 c-light-black">
                    <div class="ant-col" style="flex: 1 1 auto;">
                      <div class="ant-row">
                        <div class="ant-col" style="flex: 1 1 auto;">签到发起人：{{item.teacherName}}</div>
                        <div class="ant-col" style="flex: 1 1 auto;">签到方式：快捷签到</div>
                        <div class="ant-col" style="flex: 1 1 auto;">结束时间:{{item.endTime}}</div>
                        <div class="ant-col" style="flex: 1 1 auto;padding-left: 100px">
                          <el-button
                            type="primary"
                            plain
                            size="mini"
                            @click="handleSignin(item.id)"
                            v-hasRole="['student']"
                          >签到</el-button>
                        </div>
                        <div class="ant-col"></div>
                      </div>
                    </div>
                    <div class="ant-col"></div>
                  </div>
                </div>
              </div>
            </el-card>
          </el-col>
        </el-row>
      </el-tab-pane>
    </el-tabs>

    <!-- 添加或修改签到记录信息对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="500px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="80px">
<!--        <el-form-item label="课程id" prop="courseId">-->
<!--          <el-input v-model="form.courseId" placeholder="请输入课程id" disabled="true" />-->
<!--        </el-form-item>-->
        <el-form-item label="开始时间" prop="startTime">
          <el-date-picker clearable
                          v-model="form.startTime"
                          :picker-options="start_Date"
                          type="datetime"
                          format="yyyy-MM-dd HH:mm:ss"
                          value-format="yyyy-MM-dd HH:mm:ss"
                          placeholder="请选择开始时间">
          </el-date-picker>
        </el-form-item>
        <el-form-item label="结束时间" prop="endTime">
          <el-date-picker clearable
                          v-model="form.endTime"
                          :picker-options="end_Date"
                          type="datetime"
                          format="yyyy-MM-dd HH:mm:ss"
                          value-format="yyyy-MM-dd HH:mm:ss"
                          placeholder="请选择结束时间">
          </el-date-picker>
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button type="primary" @click="submitForm">确 定</el-button>
        <el-button @click="cancel">取 消</el-button>
      </div>
    </el-dialog>
  </div>
</template>

<script>
import {addSigninrecord, listSigninrecord, listSigninview, signin, updateSigninrecord} from "@/api/signin/signin";
import Public from "@/views/public";

export default {
  name: "signin",
  data() {
    return {
      activeName: "first",
      open: false,
      title: "",
      form: {
        id: null,
        courseId: null,
        startTime: null,
        endTime: null,
        status: null
      },
      queryParams: {
        courseId: Public.courseId
      },
      signinrecordList: [],
    };
  },
  created() {
    this.getList();
  },
  methods: {
    /** 查询签到记录信息列表 */
    getList() {
      this.loading = true;
      this.queryParams.courseId = Public.courseId;
      listSigninview(this.queryParams).then(response => {
        this.signinrecordList = response.data;
        this.total = response.total;
        //有没有截止
        for (let i = 0; i < this.signinrecordList.length; i++) {
          let date = new Date();
          let data2 = new Date(this.signinrecordList[i].endTime);
          if (data2 < date) {
            this.signinrecordList[i].status = "已截止"
          }else{
            this.signinrecordList[i].status = "进行中"
          }
        }
        this.loading = false;
      });
    },
    handleAdd() {
      this.reset();
      this.open = true;
      this.title = "添加签到记录信息";
      this.form.courseId = Public.courseId;
    },
    // 表单重置
    reset() {
      this.form = {
        id: null,
        courseId: null,
        startTime: null,
        endTime: null,
        status: null
      };
      this.resetForm("form");
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          if (this.form.id != null) {
            updateSigninrecord(this.form).then(response => {
              this.$modal.msgSuccess("修改成功");
              this.open = false;
              this.getList();
            });
          } else {
            addSigninrecord(this.form).then(response => {
              this.$modal.msgSuccess("新增成功");
              this.open = false;
              this.getList();
            });
          }
        }
      });
    },
    // 取消按钮
    cancel() {
      this.open = false;
      this.reset();
    },
    //签到
    handleSignin(id) {
      //获取当前登录用户角色
      console.log(this.$store.state.user.roles);
      let role = this.$store.state.user.roles;
      for(let i = 0; i < role.length; i++){
        if(role[i] === "student"){
          //查询时间是否在范围内
          let endTime = this.signinrecordList[this.signinrecordList.findIndex(item => item.id === id)].endTime;
          //查询现在时间
          let nowTime = new Date();
          let date = new Date(endTime);
          if(nowTime > date){
            this.$modal.msgWarning("签到已截止,下次记得准时签到");
            return;
          }
          //存在一个角色为学生（该用户有多个角色）
          signin(id).then(response => {
            this.$modal.msgSuccess("签到成功");
            this.getList();
          });
          return;
        }
      }
      this.$modal.msgWarning("不是学生不能签到");

    },
  },
}
</script>

<style scoped>
.student {
  margin-top: 20px;
  width: auto;
  height: auto;
}

.ant-checkbox-group {
  color: rgba(0, 0, 0, 0.85);
}

.listItem___E6c2h {
  position: relative;
  overflow: hidden;
  padding: 25px 30px 25px 30px !important;
  background: white;
  margin-top: 20px !important;
  cursor: pointer;
}

.ant-row-space-between {
  justify-content: space-between;
}


.ant-row {
  display: flex;
  flex-flow: row wrap;
  min-width: 0;
}

.mt20 {
  margin-top: 20px !important;
}

.c-light-black {
  color: #999 !important;
}

.ant-progress-outer {
  display: inline-block;
  width: 100%;
  margin-right: 0;
  padding-right: 0;
}

.ant-progress-inner {
  background-color: #f5f5f5;
  border-radius: 100px;
}

.ant-progress-inner {
  position: relative;
  display: inline-block;
  width: 100%;
  overflow: hidden;
  vertical-align: middle;
  background-color: #f5f5f5;
  border-radius: 100px;
}

.ant-progress-inner {
  position: relative;
  display: inline-block;
  width: 100%;
  overflow: hidden;
  vertical-align: middle;
  background-color: #f5f5f5;
  border-radius: 100px;
}

.c-blue, .highlight {
  color: #0152d9;
}

.signInStatus___zJts9 {
  position: absolute;
  right: -35px;
  top: -35px;
  width: 70px;
  height: 70px;
  display: flex;
  align-items: flex-end;
  justify-content: center;
  transform: rotate(45deg);
}

.attend___mY5tE .history___uoHNV {
  background-color: #ec4717;
  margin-left: 10px;
  color: white;
  font-weight: 400;
  border-radius: 10px;
  font-size: 12px;
  padding: 2px 9px;
}

.color0152d9___rRMTC {
  background-color: rgba(24, 144, 255, 0.2);
  color: #0152d9;
}

.attend___mY5tE .title___AzpMG {
  color: #0152d9;
}

.listItem___E6c2h {
  position: relative;
  overflow: hidden;
  padding: 25px 30px 25px 30px !important;
  background: white;
  background-image: initial;
  background-position-x: initial;
  background-position-y: initial;
  background-size: initial;
  background-repeat-x: initial;
  background-repeat-y: initial;
  background-attachment: initial;
  background-origin: initial;
  background-clip: initial;
  background-color: white;
  margin-top: 20px !important;
  cursor: pointer;
}
/*修改卡片高度*/
.el-card__body {
  padding: 0px;
  height: 200px;
}

.addBtn {
  width: 100%;
  height: 100%;
  display: flex;
  justify-content: center;
  align-items: center;
  font-size: 20px;
  color: #999;
  border: 1px dashed #999;
  border-radius: 5px;
}
.ant-col {
  position: relative;
  max-width: 100%;
  min-height: 1px;
}
</style>
