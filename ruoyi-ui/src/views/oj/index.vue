<template>
  <div class="app-container">
    <el-layout class="width-auto" id="product" name="product">
      <div class="content">
        <div id="left" class="left">
          <el-card class="box-card">
            <el-tabs v-model="activeName">
              <el-tab-pane label="题目详情" name="first">
                <!--模仿力扣-->
                <div class="question">
                  <div class="question-title">
                    <h1>{{problem.title}}</h1>
                  </div>
                  <div class="question-content">
                    <div class="question-content__detai">
                      <div class="question-content__detai--title">
                        <h2>题目描述</h2>
                      </div>
                      <div class="question-content__detai--content">
                        <span v-html="problem.description"></span>
                        <p v-for="(item,index) in testcaseList" :key="item">
                          <el-tag>
                          测试用例:{{item.testcases}}<br>
                          结果:{{item.answer}}<br>
                          解释:{{item.mark}}<br>
                          </el-tag>
                        </p>
                      </div>
                    </div>
                  </div>
                </div>
              </el-tab-pane>
              <el-tab-pane label="评论" name="second">
                <!--有头像和评论-->
                <comments></comments>
              </el-tab-pane>
              <el-tab-pane label="答案" name="third">
                <div class="question-content__detai">
                  <div class="question-content__detai--title">
                    <h2>解题思路</h2>
                  </div>
                  <div class="question-content__detai--content">
                    <p>暴力解法</p>
                    <p>时间复杂度：O(n^2)</p>
                    <p>空间复杂度：O(1)</p>
                  </div>
                </div>
              </el-tab-pane>
            </el-tabs>
          </el-card>
        </div>
        <div id="line" class="resize-line"></div>
        <div id="right" class="right">
          <codemirror
            ref="cm"
            v-model="code"
            :options="cmOptions"
            @input="inputChange"
          ></codemirror>
          <!--  按钮执行-->
          <el-button type="primary" id="python" @click="submitForm" v-bind:disabled="disable">运行</el-button>
          <!--  显示结果-->
          <el-card class="box-card">
            <el-tabs v-model="activeName2">
              <el-tab-pane label="测试用例" name="first">
                <textarea id="codeedit" style="height:200px;width:100%;resize:none;" v-model="testvalue" readonly></textarea>
              </el-tab-pane>
              <el-tab-pane label="运行结果" name="second">
                <div class="text item" id="result">
                  {{result}}
                </div>
              </el-tab-pane>
            </el-tabs>
          </el-card>
        </div>
      </div>
<!--      <iframe src="/test.html" ref="iframe" width="100%" height="900px" scrolling="no"></iframe>-->
    </el-layout>
  </div>
</template>

<script>
import {sendCode, getOj, getComments} from "@/api/oj/oj";
import comments from "@/views/oj/comments.vue";
// 全局引入vue-codemirror
import {codemirror} from 'vue-codemirror';
// 引入主题 可以从 codemirror/theme/ 下引入多个
import 'codemirror/theme/idea.css'
// 引入语言模式 可以从 codemirror/mode/ 下引入多个
import 'codemirror/mode/sql/sql.js';

import "codemirror/theme/cobalt.css";
import "codemirror/lib/codemirror.css";
import "codemirror/addon/hint/show-hint.css";
let CodeMirror = require("codemirror/lib/codemirror");
require("codemirror/addon/edit/matchbrackets");
require("codemirror/addon/selection/active-line");
require("codemirror/mode/python/python");

// 搜索功能
// find：Ctrl-F (PC), Cmd-F (Mac)
// findNext：Ctrl-G (PC), Cmd-G (Mac)
// findPrev：Shift-Ctrl-G (PC), Shift-Cmd-G (Mac)
// replace：Shift-Ctrl-F (PC), Cmd-Alt-F (Mac)
// replaceAll：Shift-Ctrl-R (PC), Shift-Cmd-Alt-F (Mac)
import 'codemirror/addon/dialog/dialog.css'
import 'codemirror/addon/dialog/dialog'
import 'codemirror/addon/search/searchcursor'
import 'codemirror/addon/search/search'
import 'codemirror/addon/search/jump-to-line'
import 'codemirror/addon/search/matchesonscrollbar'
import 'codemirror/addon/search/match-highlighter'

// 代码提示功能 具体语言可以从 codemirror/addon/hint/ 下引入多个
import 'codemirror/addon/hint/show-hint.css';
import 'codemirror/addon/hint/show-hint';
import 'codemirror/addon/hint/sql-hint';

// 高亮行功能
import 'codemirror/addon/selection/active-line'
import 'codemirror/addon/selection/selection-pointer'

// 调整scrollbar样式功能
import 'codemirror/addon/scroll/simplescrollbars.css'
import 'codemirror/addon/scroll/simplescrollbars'

// 自动括号匹配功能
import 'codemirror/addon/edit/matchbrackets'

// 全屏功能 由于项目复杂，自带的全屏功能一般不好使
import 'codemirror/addon/display/fullscreen.css'
import 'codemirror/addon/display/fullscreen'

// 显示自动刷新
import 'codemirror/addon/display/autorefresh'

// 多语言支持？
import 'codemirror/addon/mode/overlay'
import 'codemirror/addon/mode/multiplex'

// 代码段折叠功能
import 'codemirror/addon/fold/foldcode'
import 'codemirror/addon/fold/foldgutter'
import 'codemirror/addon/fold/foldgutter.css'

import 'codemirror/addon/fold/brace-fold'
import 'codemirror/addon/fold/comment-fold'
import 'codemirror/addon/fold/xml-fold.js';
import 'codemirror/addon/fold/indent-fold.js';
import 'codemirror/addon/fold/markdown-fold.js';
import 'codemirror/addon/fold/comment-fold.js';




import DragAdjustWidth from "@/components/DragAdjust/index.vue";
export default {
  name: "codeMirror",
  components: {DragAdjustWidth,codemirror,comments},
  data() {
    return {
      // 题目id
      problemId: '',
      //问题
      problem : {},
      //测试用例
      testcaseList: [],
      code: 'print("hello world")',
      testvalue:'',
      result: '',
      disable: false,
      styleLoc: {
        box: "catalogTreeContent",
        left: "leftMenu",
        right: "rightMenu",
      },
      activeName: 'first',
      activeName2: 'first',
      editScriptType: 'python',
      publicProblemList: [],
      autocomplete: {
        python: {
          showHint: true
        }
      },
      cmOptions: {
        // 语言及语法模式
        mode: 'text/x-python',
        // 主题
        theme: 'cobalt',
        // 显示函数
        line: true,
        lineNumbers: true,
        // 软换行
        lineWrapping: true,
        // tab宽度
        tabSize: 4,
        indentWithTabs: true,
        smartIndent: true,
        matchBrackets: true,
        // 自动补全
        extraKeys: {
          "Ctrl": "autocomplete"
        },
        // 代码提示功能
        hintOptions: {
          // 避免由于提示列表只有一个提示信息时，自动填充
          completeSingle: false,
          // 不同的语言支持从配置中读取自定义配置 sql语言允许配置表和字段信息，用于代码提示
          tables: {
            "table1": ["c1", "c2"],
          },
        },
        // 高亮行功能
        styleActiveLine: true,
        // 调整scrollbar样式功能
        scrollbarStyle: 'overlay',
      },
      sumbitcode:{
        id : '',
        code : '',
      },
      //评论
      commentList: [],
    }
  },
  created() {
    //获取路由参数
    this.problemId = this.$route.query.id
    if(this.problemId){
      //获取题目详情
      this.getComment()
    }else{
      this.$message.info("题目id为空,在线测试代码运行")
    }
  },
  mounted() {
    if(this.problemId) {
      //获取题目详情
      this.getProblemDetail()
    }
    this.drapContent()
    // 代码提示功能 当用户有输入时，显示提示信息
    this.$refs.cm.codemirror.on('inputRead', cm => {
      cm.showHint();
    })
    this.$refs.cm.codemirror.setSize("auto", (document.documentElement.clientHeight - 500) + "px")
    this.$nextTick(() => {
      window.addEventListener('resize', () => {
        //监听浏览器窗口大小改变
        //浏览器变化执行动作
        this.$refs.cm.codemirror.setSize("auto", (document.documentElement.clientHeight - 500) + "px")
      });
    })
  },
  methods: {
    submitForm() {
      //按钮设置不可点击
      this.disable = true
      //跳转到测试结果页面
      this.activeName2= "second"
      this.sumbitcode.id = this.problemId
      this.sumbitcode.code = this.code
      //在code里加入换行符
      //发送请求等待图标
      this.$loading({
        lock: true,
        text: '代码正在运行,请稍后...',
        spinner: 'el-icon-loading',
        background: 'rgba(0, 0, 0, 0.7)',
        //停留时间5秒
        duration: 5000
      });
      sendCode(this.sumbitcode).then(response => {
        if(this.problemId == null){
          let data = response.msg
          this.result = response.msg
          this.$loading().close();
        }else{
          //data是所有的测试结果的数据
          let data = response.data
          this.result = response.data
          this.$loading().close();
        }
      }).catch(error => {
        this.$loading().close();
        this.$message.error("代码运行失败")
      })
    },
    drapContent() {
      // 获取 左边区域 的 宽度
      let left = document.getElementById('left');
      // 获取 移动区域 的 宽度
      let line = document.getElementById('line');
      // 获取 右边区域 的 宽度
      let right = document.getElementById('right');
      // 移动区域鼠标移入事件
      line.onmousedown = function(e) {
        // 移动的距离
        let lineLeft = e.clientX;
        document.onmousemove = function(e) {
          // 移动的位置 （侧边栏的宽度 + 移动的宽度）
          let diffVal = 276 + (e.clientX -lineLeft);
          // 移动区间的范围 [276, 740]
          if(diffVal >= 276 && diffVal <= 840) {
            // 移动区域距离左边的距离
            line.style.left = diffVal+'px';
            // 左边缩放的宽度
            left.style.width = diffVal +'px';
            // 右边改变后的宽度 （改变后的宽度要加上移动区域的宽度）
            right.style.width = document.getElementById('product').clientWidth - (diffVal + 16) +'px';
          }
        }
        document.onmouseup = function() {
          document.onmousemove = null;
          document.onmouseup = null;
        }
      }
    },
    getProblemDetail(){
      //通过id获取题目详情
      getOj(this.problemId).then(response => {
        this.problem = response.data
        this.code = this.problem.code
        //这里我只让他显示前两个测试用例，其他用例对外隐藏
        this.testcaseList = this.problem.testcaseList
        for(let i = 0; i < this.testcaseList.length; i++){
          //多个测试用例
          this.testvalue += this.testcaseList[i].testcases + '\n'
        }
      })
    },
    inputChange(content) {
      this.$nextTick(() => {
        //避免重复提交相同的代码
        this.disable = false
      });
    },
    //获取评论
    getComment(){
      getComments(this.problemId).then(response => {
        this.commentList = response.data
      })
    },
  }
}
</script>

<style>
.code {
  font-size: 26px;
  font-family: Consolas, Menlo, Monaco, Lucida Console, Liberation Mono, DejaVu Sans Mono, Bitstream Vera Sans Mono, Courier New, monospace, serif;
}
#result{
  white-space: pre-wrap;
}
.content {
  display: flex;
  width: 100%;
  height: 100%;
}
.left {
  width: 500px;
  height: 100%;
}
.resize-line {
  /*鼠标移入显示左右箭头*/
  cursor: ew-resize;
  width: 16px;
  min-width: 16px;
  max-width: 16px;
  background-color: transparent;
}
.right {
  width: calc(100% - 276px);
  max-width: calc(100% - 276px);
  user-select: none;
}
.ant-layout {
  height: calc(100vh - 181px);
}
.width-auto .tree-layout-sider {
  height: calc(100vh - 181px);
  overflow-x: hidden;
  overflow-y: auto;
  padding-left: 8px !important;
  padding-right: 0 !important;
}

.width-auto li li .ant-tree-title {
  width: 100% !important;
}



</style>
