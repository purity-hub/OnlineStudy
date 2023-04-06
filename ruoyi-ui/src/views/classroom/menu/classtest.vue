<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch"
             label-width="68px">
      <el-form-item label="标题" prop="title">
        <el-input
          v-model="queryParams.title"
          placeholder="请输入标题"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="难度" prop="difficulty">
        <el-select v-model="queryParams.difficulty" placeholder="请选择难度" clearable>
          <el-option label="简单" value="简单"/>
          <el-option label="中等" value="中等"/>
          <el-option label="困难" value="困难"/>
        </el-select>
      </el-form-item>
      <el-form-item>
        <el-button type="primary" icon="el-icon-search" size="mini" @click="handleQuery">搜索</el-button>
        <el-button icon="el-icon-refresh" size="mini" @click="resetQuery">重置</el-button>
      </el-form-item>
    </el-form>

    <el-table v-loading="loading" :data="ojList">
      <el-table-column type="selection" width="55" align="center"/>
      <el-table-column label="序号" align="center" width="60" prop="id"/>
      <el-table-column label="状态" align="center" prop="status">
        <template slot-scope="scope">
          <el-tag v-if="scope.row.status === 1" type="success">已通过</el-tag>
          <el-tag v-else type="danger">未通过</el-tag>
        </template>
      </el-table-column>
      <el-table-column label="标题" align="center" prop="title">
        <template slot-scope="scope">
          <el-link type="primary" :underline="false" @click="handleEdit(scope.row.id)">{{scope.row.title}}</el-link>
        </template>
      </el-table-column>
      <el-table-column label="难度" align="center" prop="difficulty"/>
      <el-table-column label="点赞" align="center" prop="likeNum"/>
      <el-table-column label="通过率" align="center" prop="description" :show-overflow-tooltip="true"/>
      <el-table-column label="出现频率" align="center" class-name="small-padding fixed-width">
      </el-table-column>
    </el-table>

    <pagination
      v-show="total>0"
      :total="total"
      :page.sync="queryParams.pageNum"
      :limit.sync="queryParams.pageSize"
      @pagination="getList"
    />
  </div>
</template>

<script>
import {listOj, getOj, delOj, addOj, updateOj, chapterTreeSelect,checkOj} from "@/api/oj/oj";
import Treeselect from "@riophae/vue-treeselect";
import "@riophae/vue-treeselect/dist/vue-treeselect.css";
import Public from "@/views/public";
export default {
  name: "classtest",
  components: {Treeselect},
  data() {
    return {
      // 遮罩层
      loading: true,
      // 选中数组
      ids: [],
      // 子表选中数据
      checkedTestcase: [],
      // 非单个禁用
      single: true,
      // 非多个禁用
      multiple: true,
      // 显示搜索条件
      showSearch: true,
      // 总条数
      total: 0,
      // oj表格数据
      ojList: [],
      // 用例与答案表格数据
      testcaseList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        title: null,
        difficulty: null,
        likeNum: null,
        description: null,
        chapterid: null,
      },
      // 表单参数
      form: {},
      // 表单校验
      rules: {},
      chapterName: "",
    };
  },
  created() {
    this.queryParams.chapterid = this.$route.query.chapterid;
    this.getList();
  },
  watch: {
    '$route.query.chapterid': function (newVal, oldVal) {
      this.queryParams.chapterid = newVal;
      this.getList();
    }
  },
  methods: {
    /** 查询oj列表 */
    getList() {
      this.loading = true;
      if(Public.courseId !== null){
        this.queryParams.courseId = Public.courseId;
        listOj(this.addDateRange(this.queryParams, this.dateRange)).then(response => {
          this.ojList = response.rows;
          console.log(this.ojList);
          this.total = response.total;
          //循环ojList，查询每个oj的状态
          for (let i = 0; i < this.ojList.length; i++) {
            checkOj(this.ojList[i].id).then(response => {
              this.ojList[i].status = response.data;
            });
          }
          this.loading = false;
        });
      }
    },
    // 取消按钮
    cancel() {
      this.open = false;
      this.reset();
    },
    // 表单重置
    reset() {
      this.form = {
        id: null,
        title: null,
        difficulty: null,
        likeNum: null,
        description: null,
        chapterid: null
      };
      this.testcaseList = [];
      this.resetForm("form");
    },
    /** 搜索按钮操作 */
    handleQuery() {
      this.queryParams.pageNum = 1;
      this.getList();
    },
    /** 重置按钮操作 */
    resetQuery() {
      this.resetForm("queryForm");
      this.handleQuery();
    },
    handleEdit(id) {
      //跳转到代码编辑页面/oj
      //吧oj的id传过去
      this.$router.push({path: '/oj', query: {id: id}});
    }
  }
};
</script>
