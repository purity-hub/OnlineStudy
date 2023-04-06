<template>
  <div class="app-container">
    <el-row :gutter="20">
      <!--班级数据-->
      <el-col :span="4" :xs="24">
        <div class="head-container">
          <el-input
            v-model="courseName"
            placeholder="请输入课程名称"
            clearable
            size="small"
            prefix-icon="el-icon-search"
            style="margin-bottom: 20px"
          />
        </div>
        <div class="head-container">
          <el-tree
            :data="courseOptions"
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
      <el-col :span="20" :xs="24">
        <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch"
                 label-width="68px">
          <el-form-item label="章节名称" prop="name">
            <el-input
              v-model="queryParams.name"
              placeholder="请输入章节名称"
              clearable
              @keyup.enter.native="handleQuery"
            />
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
              v-hasPermi="['chapter:chapter:add']"
            >新增
            </el-button>
          </el-col>
          <el-col :span="1.5">
            <el-button
              type="info"
              plain
              icon="el-icon-sort"
              size="mini"
              @click="toggleExpandAll"
            >展开/折叠
            </el-button>
          </el-col>
          <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
        </el-row>

        <el-table
          v-if="refreshTable"
          v-loading="loading"
          :data="chapterList"
          row-key="id"
          :default-expand-all="isExpandAll"
          :tree-props="{children: 'children', hasChildren: 'hasChildren'}"
        >
          <el-table-column label="章节名称" prop="name"/>
          <el-table-column label="课程名称" align="center" prop="courseName"/>
          <el-table-column label="显示顺序" align="center" prop="orderNum"/>
          <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
            <template slot-scope="scope">
              <el-button
                size="mini"
                type="text"
                icon="el-icon-edit"
                @click="handleUpdate(scope.row)"
                v-hasPermi="['chapter:chapter:edit']"
              >修改
              </el-button>
              <el-button
                size="mini"
                type="text"
                icon="el-icon-plus"
                @click="handleAdd(scope.row)"
                v-hasPermi="['chapter:chapter:add']"
              >新增
              </el-button>
              <el-button
                size="mini"
                type="text"
                icon="el-icon-delete"
                @click="handleDelete(scope.row)"
                v-hasPermi="['chapter:chapter:remove']"
              >删除
              </el-button>
            </template>
          </el-table-column>
        </el-table>

        <!-- 添加或修改chapter对话框 -->
        <el-dialog :title="title" :visible.sync="open" width="500px" append-to-body>
          <el-form ref="form" :model="form" :rules="rules" label-width="80px">
            <el-form-item label="章节名称" prop="name">
              <el-input v-model="form.name" placeholder="请输入章节名称"/>
            </el-form-item>
            <el-form-item label="课程名称">
              <el-select v-model="form.courseid" placeholder="请选择课程名称" prop="courseid">
                <el-option
                  v-for="item in courseOptions"
                  :key="item.id"
                  :label="item.label"
                  :value="item.id"
                />
              </el-select>
            </el-form-item>
            <el-form-item label="显示排序" prop="orderNum">
              <el-input-number v-model="form.orderNum" controls-position="right" :min="0"/>
            </el-form-item>
            <el-form-item label="父章节" prop="parentid">
              <treeselect v-model="form.parentid" :options="chapterOptions" :normalizer="normalizer"
                          placeholder="请选择章节对应的父章节"/>
            </el-form-item>
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
import {listChapter, getChapter, delChapter, addChapter, updateChapter, courseTreeSelect} from "@/api/chapter/chapter";
import Treeselect from "@riophae/vue-treeselect";
import "@riophae/vue-treeselect/dist/vue-treeselect.css";

export default {
  name: "Chapter",
  components: {
    Treeselect
  },
  data() {
    return {
      // 遮罩层
      loading: false,
      // 显示搜索条件
      showSearch: true,
      // chapter表格数据
      chapterList: [],
      // chapter树选项
      chapterOptions: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 是否展开，默认全部展开
      isExpandAll: true,
      // 重新渲染表格状态
      refreshTable: true,
      // 查询参数
      queryParams: {
        name: null,
        courseid: null,
        orderNum: null,
        parentid: null
      },
      // 表单参数
      form: {},
      // 表单校验
      rules: {},
      // 课程名称
      courseName: "",
      // 课程树选项
      courseOptions: undefined,
      defaultProps: {
        children: "children",
        label: "label"
      },
    };
  },
  created() {
    this.getCourseTree();
    //this.getList();
  },
  watch: {
    courseName(val) {
      this.$refs.tree.filter(val);
    }
  },
  methods: {
    /** 查询chapter列表 */
    getList() {
      this.loading = true;
      listChapter(this.addDateRange(this.queryParams, this.dateRange)).then(response => {
        this.chapterList = this.handleTree(response.data, "id", "parentid");
        for (let i = 0; i < this.chapterList.length; i++) {
          this.chapterList[i].courseName = this.chapterList[i].courseid === 0 ? '' : this.courseOptions[this.courseOptions.findIndex(item => item.id === this.chapterList[i].courseid)].label
        }
        this.loading = false;
      }).catch(() => {
        this.loading = false;
      });
    },
    /** 转换chapter数据结构 */
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
    /** 查询chapter下拉树结构 */
    getTreeselect() {
      listChapter(this.queryParams).then(response => {
        this.chapterOptions = [];
        const data = {id: 0, name: '顶级节点', children: []};
        data.children = this.handleTree(response.data, "id", "parentid");
        this.chapterOptions.push(data);
      });
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
        name: null,
        courseid: null,
        orderNum: null,
        parentid: null
      };
      this.resetForm("form");
    },
    /** 搜索按钮操作 */
    handleQuery() {
      this.getList();
    },
    /** 重置按钮操作 */
    resetQuery() {
      this.resetForm("queryForm");
      this.handleQuery();
    },
    /** 新增按钮操作 */
    handleAdd(row) {
      this.reset();
      this.form.courseid = this.queryParams.courseid;
      this.getTreeselect();
      if (row != null && row.id) {
        this.form.parentid = row.id;
      } else {
        this.form.parentid = 0;
      }
      this.open = true;
      this.title = "添加chapter";
    },
    /** 展开/折叠操作 */
    toggleExpandAll() {
      this.refreshTable = false;
      this.isExpandAll = !this.isExpandAll;
      this.$nextTick(() => {
        this.refreshTable = true;
      });
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      this.getTreeselect();
      if (row != null) {
        this.form.parentid = row.id;
      }
      getChapter(row.id).then(response => {
        this.form = response.data;
        this.open = true;
        this.title = "修改chapter";
      });
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          if (this.form.id != null) {
            updateChapter(this.form).then(response => {
              this.$modal.msgSuccess("修改成功");
              this.open = false;
              this.getList();
            });
          } else {
            addChapter(this.form).then(response => {
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
      this.$modal.confirm('是否确认删除chapter编号为"' + row.id + '"的数据项？').then(function () {
        return delChapter(row.id);
      }).then(() => {
        this.getList();
        this.$modal.msgSuccess("删除成功");
      }).catch(() => {
      });
    },
    /** 查询部门下拉树结构 */
    getCourseTree() {
      courseTreeSelect().then(response => {
        let data = response.data;
        data.forEach(item => {
          item.label = item.name;
        });
        this.courseOptions = response.data;
      });
    },
    // 筛选节点
    filterNode(value, data) {
      if (!value) return true;
      return data.label.indexOf(value) !== -1;
    },
    // 节点单击事件
    handleNodeClick(data) {
      this.queryParams.courseid = data.id;
      this.handleQuery();
    },
  }
};
</script>
