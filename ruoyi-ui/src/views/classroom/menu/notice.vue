<template>
  <div class="app-container">
    <!--发布公告按钮-->
    <el-button type="primary" @click="addNotice" v-hasRole="['teacher']">发布公告</el-button>
    <!--公告列表,不要用表格,用div-->
    <div v-loading="loading" class="notice-list" v-for="item in noticeList" :key="item.id">
      <div class="notice-item">
        <div class="notice-title">{{ item.title }}</div>
        <div class="notice-content">{{ item.context }}</div>
        <div class="notice-time">{{ item.createTime }}</div>
      </div>
    </div>
    <!-- 添加或修改课程通知公告对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="500px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="通知标题" prop="title">
          <el-input v-model="form.title" placeholder="请输入对应课程通知标题"/>
        </el-form-item>
        <el-form-item label="通知内容" prop="context">
          <el-input v-model="form.context" type="textarea" placeholder="请输入内容"/>
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
import {addNotice, listNotice, updateNotice} from "@/api/notice/notice";
import Public from "@/views/public";
import {addCourse, updateCourse} from "@/api/course/course";

export default {
  name: "about",
  data() {
    return {
      noticeList: [],
      courseId: '',
      queryParams: {
        courseId: '',
      },
      // 添加或修改课程通知公告对话框
      open: false,
      title: '添加课程通知公告',
      form: {
        title: '',
        context: '',
        courseId: '',
      },
      rules: {
        title: [
          {required: true, message: '请输入对应课程通知标题', trigger: 'blur'}
        ],
        context: [
          {required: true, message: '请输入内容', trigger: 'blur'}
        ],
        courseId: [
          {required: true, message: '请输入课程id', trigger: 'blur'}
        ],
      },
    };
  },
  created() {
    this.courseId = Public.courseId;
    this.queryParams.courseId = this.courseId;
    this.listNotice();
  },
  methods: {
    //获取公告列表
    listNotice() {
      this.loading = true;
      listNotice(this.queryParams).then(response => {
        this.noticeList = response.rows;
        this.loading = false;
      });
    },
    //发布公告
    addNotice() {
      this.open = true;
      this.title = '发布公告';
      this.form = {
        title: '',
        context: '',
        courseId: this.courseId,
      };
    },
    //提交表单
    submitForm() {
      this.$refs['form'].validate((valid) => {
        if (valid) {
          if (this.form.id != null) {
            updateNotice(this.form).then(response => {
              this.$modal.msgSuccess("修改成功");
              this.open = false;
              this.listNotice();
            });
          } else {
            addNotice(this.form).then(response => {
              this.$modal.msgSuccess("新增成功");
              this.open = false;
              this.listNotice();
            });
          }
        }
      });
    },
  }
}
</script>

<style scoped>
.notice-list {
  margin-top: 20px;
  border: 1px solid #ebeef5;
  border-radius: 4px;
  padding: 20px;
}

.notice-item {
  margin-bottom: 20px;
}

.notice-title {
  font-size: 16px;
  color: #303133;
  font-weight: 500;
}

.notice-content {
  margin-top: 10px;
  font-size: 14px;
  color: #606266;
}

.notice-time {
  margin-top: 10px;
  font-size: 12px;
  color: #909399;
  text-align: right;
}
</style>
