<template>
  <div class="app-container">
    <el-row :gutter="20">
      <!--班级数据-->
      <el-col :span="4" :xs="24">
        <div class="head-container">
          <el-input
            v-model="chapterName"
            placeholder="请输入章节名称"
            clearable
            size="small"
            prefix-icon="el-icon-search"
            style="margin-bottom: 20px"
          />
        </div>
        <div class="head-container">
          <el-tree
            :data="chapterOptions"
            :props="defaultProps"
            :expand-on-click-node="false"
            :filter-node-method="filterNode"
            ref="tree"
            node-key="id"
            default-expand-all
            highlight-current
            @node-click="handleNodeClick"
          />
        </div>
      </el-col>
      <!--用户数据-->
      <el-col :span="20" :xs="24">
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

        <el-row :gutter="10" class="mb8">
          <el-col :span="1.5">
            <el-button
              type="primary"
              plain
              icon="el-icon-plus"
              size="mini"
              @click="handleAdd"
              v-hasPermi="['oj:oj:add']"
            >新增
            </el-button>
          </el-col>
          <el-col :span="1.5">
            <el-button
              type="success"
              plain
              icon="el-icon-edit"
              size="mini"
              :disabled="single"
              @click="handleUpdate"
              v-hasPermi="['oj:oj:edit']"
            >修改
            </el-button>
          </el-col>
          <el-col :span="1.5">
            <el-button
              type="danger"
              plain
              icon="el-icon-delete"
              size="mini"
              :disabled="multiple"
              @click="handleDelete"
              v-hasPermi="['oj:oj:remove']"
            >删除
            </el-button>
          </el-col>
          <el-col :span="1.5">
            <el-button
              type="warning"
              plain
              icon="el-icon-download"
              size="mini"
              @click="handleExport"
              v-hasPermi="['oj:oj:export']"
            >导出
            </el-button>
          </el-col>
          <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
        </el-row>

        <el-table v-loading="loading" :data="ojList" @selection-change="handleSelectionChange">
          <el-table-column type="selection" width="55" align="center"/>
          <el-table-column label="序号" align="center" width="60" prop="id"/>
          <el-table-column label="标题" align="center" prop="title"/>
          <el-table-column label="难度(简单，中等，困难)" align="center" prop="difficulty"/>
          <el-table-column label="点赞" align="center" prop="likeNum"/>
          <el-table-column label="描述" align="center" prop="description" :show-overflow-tooltip="true"/>
          <el-table-column label="章节id,无id表示在线题目" align="center" prop="chapterName"/>
          <el-table-column label="代码" align="center" prop="code" :show-overflow-tooltip="true"/>
          <el-table-column label="主函数" align="center" prop="codemethod"/>
          <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
            <template slot-scope="scope">
              <el-button
                size="mini"
                type="text"
                icon="el-icon-edit"
                @click="handleUpdate(scope.row)"
                v-hasPermi="['oj:oj:edit']"
              >修改
              </el-button>
              <el-button
                size="mini"
                type="text"
                icon="el-icon-delete"
                @click="handleDelete(scope.row)"
                v-hasPermi="['oj:oj:remove']"
              >删除
              </el-button>
              <el-button
                size="mini"
                type="text"
                icon="el-icon-edit"
                @click="handleComment(scope.row)"
                v-hasPermi="['oj:oj:edit']"
              >评论
              </el-button>
            </template>
          </el-table-column>
        </el-table>

        <pagination
          v-show="total>0"
          :total="total"
          :page.sync="queryParams.pageNum"
          :limit.sync="queryParams.pageSize"
          @pagination="getList"
        />

        <!-- 添加或修改oj对话框 -->
        <el-dialog :title="title" :visible.sync="open" width="1000px" append-to-body>
          <el-form ref="form" :model="form" :rules="rules" label-width="80px">
            <el-form-item label="标题" prop="title">
              <el-input v-model="form.title" placeholder="请输入标题"/>
            </el-form-item>
            <el-form-item label="难度" prop="difficulty">
              <el-select v-model="form.difficulty" placeholder="请选择难度" clearable>
                <el-option label="简单" value="简单"/>
                <el-option label="中等" value="中等"/>
                <el-option label="困难" value="困难"/>
              </el-select>
            </el-form-item>
            <el-form-item label="描述" prop="description">
              <editor v-model="form.description" :min-height="192"/>
            </el-form-item>
            <el-form-item label="章节" prop="chapterid">
              <treeselect disabled="true" v-model="form.chapterid" :options="chapterOptions" :normalizer="normalizer"
                          placeholder="请选择章节对应的父章节"/>
            </el-form-item>
            <el-form-item label="代码" prop="code">
              <codemirror id="code" ref="codemirror" :options="cmOption" v-model="form.code"></codemirror>
            </el-form-item>
            <el-form-item label="主函数" prop="codemethod">
              <el-input v-model="form.codemethod" placeholder="请输入主函数"/>
            </el-form-item>
            <el-divider content-position="center">用例与答案信息</el-divider>
            <el-row :gutter="10" class="mb8">
              <el-col :span="1.5">
                <el-button type="primary" icon="el-icon-plus" size="mini" @click="handleAddTestcase">添加</el-button>
              </el-col>
              <el-col :span="1.5">
                <el-button type="danger" icon="el-icon-delete" size="mini" @click="handleDeleteTestcase">删除
                </el-button>
              </el-col>
            </el-row>
            <el-table :data="testcaseList" :row-class-name="rowTestcaseIndex"
                      @selection-change="handleTestcaseSelectionChange" ref="testcase">
              <el-table-column type="selection" width="50" align="center"/>
              <el-table-column label="序号" align="center" prop="index" width="50"/>
              <el-table-column label="测试用例" prop="testcases" width="300">
                <template slot-scope="scope">
                  <el-input type="textarea" v-model="scope.row.testcases" placeholder="请输入测试用例"/>
                </template>
              </el-table-column>
              <el-table-column label="每个测试用例对应的答案" prop="answer" width="300">
                <template slot-scope="scope">
                  <el-input type="textarea" v-model="scope.row.answer" placeholder="请输入每个测试用例对应的答案"/>
                </template>
              </el-table-column>
              <el-table-column label="解释" prop="mark" width="250">
                <template slot-scope="scope">
                  <el-input type="textarea" v-model="scope.row.mark" placeholder="请输入解释"/>
                </template>
              </el-table-column>
            </el-table>
          </el-form>
          <div slot="footer" class="dialog-footer">
            <el-button type="primary" @click="submitForm">确 定</el-button>
            <el-button @click="cancel">取 消</el-button>
          </div>
        </el-dialog>
      </el-col>
    </el-row>
  </div>
</template>

<script>
import {listOj, getOj, delOj, addOj, updateOj, chapterTreeSelect} from "@/api/oj/oj";
import Treeselect from "@riophae/vue-treeselect";
import "@riophae/vue-treeselect/dist/vue-treeselect.css";
//导入element-ui
import "codemirror/theme/cobalt.css";
import "codemirror/lib/codemirror.css";
import "codemirror/addon/hint/show-hint.css";
let CodeMirror = require("codemirror/lib/codemirror");
require("codemirror/addon/edit/matchbrackets");
require("codemirror/addon/selection/active-line");
require("codemirror/mode/python/python");
require("codemirror/addon/hint/show-hint");
require("codemirror/addon/hint/sql-hint");
export default {
  name: "Oj",
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
        chapterid: 0,
      },
      // 表单参数
      form: {},
      // 表单校验
      rules: {},
      chapterName: "",
      // 课程树选项
      chapterOptions: undefined,
      defaultProps: {
        children: "children",
        label: "label"
      },
      editScriptType: 'python',
      cobalt: 'cobalt',
      cmOption: {
        mode: 'text/x-python',
        theme: 'cobalt',
        lineNumbers: true,
        line: true,
        extraKeys: {"Ctrl": "autocomplete", "Ctrl-Space": "autocomplete"},
        hintOptions: { // 自定义提示选项
          tables: {
            users: {name: null, score: null, birthDate: null},
            countries: {name: null, population: null, size: null}
          },
          completeSingle: false
        }
      },
      // 现在选择的章节
      nowChapter: 0,
    };
  },
  mounted() {

  },
  created() {
    this.getChapterTree();
    this.getList();
  },
  watch: {
    chapterName(val) {
      this.$refs.tree.filter(val);
    }
  },
  methods: {
    /** 查询oj列表 */
    getList() {
      this.loading = true;
      listOj(this.addDateRange(this.queryParams, this.dateRange)).then(response => {
        this.ojList = response.rows;
        this.total = response.total;
        for(let i=0;i<this.ojList.length;i++){
          this.ojList[i].chapterName = this.ojList[i].id===0?'':this.chapterOptions[this.chapterOptions.findIndex(item => item.id === this.ojList[i].id)].label
        }
        this.loading = false;
      }).catch(error => {
        this.$message.error(error);
        this.loading = false;
      });
    },
    // 取消按钮
    cancel() {
      this.open = false;
      this.reset();
    },
    // 表单重置
    reset() {
      this.resetForm("form");
      this.form.chapterid = this.nowChapter;
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
    // 多选框选中数据
    handleSelectionChange(selection) {
      this.ids = selection.map(item => item.id)
      this.single = selection.length !== 1
      this.multiple = !selection.length
    },
    /** 新增按钮操作 */
    handleAdd() {
      this.reset();
      this.open = true;
      this.title = "添加题目";
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      const id = row.id || this.ids
      getOj(id).then(response => {
        this.form = response.data;
        this.testcaseList = response.data.testcaseList;
        this.open = true;
        this.title = "修改题目";
      });
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          this.form.testcaseList = this.testcaseList;
          if (this.form.id != null) {
            updateOj(this.form).then(response => {
              this.$modal.msgSuccess("修改成功");
              this.open = false;
              this.getList();
            });
          } else {
            addOj(this.form).then(response => {
              this.$modal.msgSuccess("新增成功");
              this.open = false;
              this.getList();
            });
          }
        }
      });
    },
    /** 删除按钮操作 */
    handleDelete(row) {
      const ids = row.id || this.ids;
      this.$modal.confirm('是否确认删除oj编号为"' + ids + '"的数据项？').then(function () {
        return delOj(ids);
      }).then(() => {
        this.getList();
        this.$modal.msgSuccess("删除成功");
      }).catch(() => {
      });
    },
    /** 用例与答案序号 */
    rowTestcaseIndex({row, rowIndex}) {
      row.index = rowIndex + 1;
    },
    /** 用例与答案添加按钮操作 */
    handleAddTestcase() {
      let obj = {};
      obj.testcases = "";
      obj.answer = "";
      obj.mark = "";
      this.testcaseList.push(obj);
    },
    /** 用例与答案删除按钮操作 */
    handleDeleteTestcase() {
      if (this.checkedTestcase.length === 0) {
        this.$modal.msgError("请先选择要删除的用例与答案数据");
      } else {
        const testcaseList = this.testcaseList;
        const checkedTestcase = this.checkedTestcase;
        this.testcaseList = testcaseList.filter(function (item) {
          return checkedTestcase.indexOf(item.index) === -1
        });
      }
    },
    /** 复选框选中数据 */
    handleTestcaseSelectionChange(selection) {
      this.checkedTestcase = selection.map(item => item.index)
    },
    /** 导出按钮操作 */
    handleExport() {
      this.download('oj/oj/export', {
        ...this.queryParams
      }, `oj_${new Date().getTime()}.xlsx`)
    },
    normalizer(node) {
      if (node.children && !node.children.length) {
        delete node.children;
      }
      return {
        id: node.id,
        label: node.name,
        children: node.children
      };
    },
    /** 查询章节下拉树结构 */
    getChapterTree() {
      chapterTreeSelect().then(response => {
        let data = this.handleTree(response.data, "id", "parentid");
        for(let i = 0; i < data.length; i++){
          data[i].label = data[i].name;
          data[i].value = data[i].id;
          if(data[i].children != null){
            for(let j = 0; j < data[i].children.length; j++){
              data[i].children[j].label = data[i].children[j].name;
              data[i].children[j].value = data[i].children[j].id;
              if(data[i].children[j].children != null){
                for(let k = 0; k < data[i].children[j].children.length; k++){
                  data[i].children[j].children[k].label = data[i].children[j].children[k].name;
                  data[i].children[j].children[k].value = data[i].children[j].children[k].id;
                }
              }
            }
          }
        }
        //加一个根节点label为在线题目
        data.unshift({
          id: 0,
          label: "公共题库",
          value: 0
        })
        this.chapterOptions = data;
      });
    },
    // 筛选节点
    filterNode(value, data) {
      if (!value) return true;
      return data.label.indexOf(value) !== -1;
    },
    // 节点单击事件
    handleNodeClick(data) {
      this.queryParams.chapterid = data.id;
      this.nowChapter = data.id;
      this.handleQuery();
    },
  }
};
</script>
