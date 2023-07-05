<template>
  <div class="app-container">
    <!--实现上下布局-->
    <el-container style="height: 100%">
      <nav aria-label="main navigation" role="navigation" class="navbar">
        <div class="navbar-menu container">
          <div class="navbar-start">
            <a href="/turtle/my" class="navbar-item">我的作品</a>
            <a href="/turtle/new" class="navbar-item router-link-exact-active router-link-active">创建新绘图</a>
            <a href="/turtle/latest" class="navbar-item">所有作品</a>
          </div>
        </div>
      </nav>
      <el-header height="auto">
        文字输出<pre id="output"></pre>
        <div class="canvas-card">
          <div class="python-turtle" style="width: 480px; height: 480px;">
            <div ref="canvas" id="mycanvas" class="canvas" style="transform: scale(1); outline: none; height: 480px; width: 480px;"
            @mousemove="getXY">
            </div>
          </div>
        </div>
<!--        图像<div id="mycanvas" class="mycanvas"></div>-->
        <el-button type="primary" @click="runit()">运行</el-button>
        <!--画布大小下拉框-->
        画布大小
        <el-select v-model="size" placeholder="请选择画布大小">
          <el-option
            v-for="item in sizeOptions"
            :key="item.value"
            :label="item.label"
            :value="item.value"
          ></el-option>
        </el-select>
        动画速度
        <el-select v-model="speed" placeholder="请选择动画速度">
          <el-option
            v-for="item in speedOptions"
            :key="item.value"
            :label="item.label"
            :value="item.value"
          ></el-option>
        </el-select>
        <el-button type="primary" @click="download()">下载原图</el-button>
        坐标({{x}},{{y}})
      </el-header>
      <el-container>
        <el-aside width="50%">
          <h3>{{form.name}} by {{form.uname}}</h3>
            <codemirror
              ref="cm"
              v-model="code"
              :options="cmOptions"
            ></codemirror>
            <br />
        </el-aside>
        <el-main>
          <el-form ref="form" :model="form" label-width="80px">
            <el-form-item  label="作品名称">
              <el-input v-model="form.name"></el-input>
            </el-form-item>
            <el-form-item label="昵称">
              <el-input v-model="form.uname"></el-input>
            </el-form-item>
            <el-form-item label="学校">
              <el-input v-model="form.school" placeholder="请填写学校全称，便于分类"></el-input>
            </el-form-item>
            <el-form-item label="指导老师">
              <el-input v-model="form.teacher" placeholder="自学成才"></el-input>
            </el-form-item>
            <!--是否公开-->
            <el-form-item label="是否公开">
              <el-switch v-model="form.isPublic" :active-value="1" :inactive-value="0"></el-switch>
            </el-form-item>
            <el-form-item>
              <el-button type="primary" @click="onSubmit">登录并保存</el-button>
            </el-form-item>
          </el-form>
          <!--提示-->
          <div class="card-content is-text-small content">
            <div class="text-gray-400 font-bold text-sm mb-1">
              <i class="fa fa-fw fa-exclamation"></i>
            小提示
            </div>
            <ol>
              <li>在线环境与本机环境略有差异，请注意报错提示</li>
              <li>颜色模式默认为 255，0~1 颜色模式需要手动设置</li>
              <li>如遇到<code>ImportError: No module named turtle请刷新页面再次尝试</code></li>
              <li>
                <code>setup</code>方法不会设置画布大小，请通过上方控件调整
              </li>
              <li>
                <code>chr</code>
                只支持 ASCII 字符，请使用字符串输入符号
              </li>
            </ol>
          </div>
        </el-main>
      </el-container>
    </el-container>
  </div>
</template>
<script>

import requireSkulpt from "skulpt/support/run/require-skulpt";
import skulpt from "skulpt";


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
import {download} from "@/utils/request";

import {submitTurtle, uploadImg} from "@/api/turtle/turtle";

export default {
  name: "App",
  data() {
    return {
      myUrl: "http://localhost:88/turtle.html",
      code: "import turtle\nprint('hello')\nt = turtle.Turtle()\nt.color('red')\nt.forward(75)\n",
      cmOptions: {
        // 语言及语法模式
        mode: 'text/x-python',
        // 主题
        theme: 'idea',
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
        //宽度
        width: '100%',
        // 高度
        height: '500px',
      },
      size: 2,
      width: 480,
      height: 480,
      sizeOptions:[
        {value: 1, label: '320x480(2:3)-手机'},
        {value: 2, label: '480x480(1:1)'},
        {value: 3, label: '640x480(4:3)-笔记本'},
        {value: 4, label: '960x480(2:1)'},
        {value: 5, label: '1200x600(2:1)-台式机'},
        {value: 6, label: '1280x720(16:9)'},
        {value: 7, label: '自定义'},
      ],
      speed: 1,
      speedOptions:[
        {value: 1, label: '标准'},
        {value: 2, label: '快'},
        {value: 3, label: '更快'},
        {value: 4, label: '最快'},
      ],
      form: {
        name: '没有名字的好作品',
        uname: this.$store.state.user.name,
        school: '',
        teacher: '',
        isPublic: 1,
        imgPath: '',
      },
      //坐标
      x: 0,
      y: 0,
    };
  },
  created() {
    this.$nextTick(() => {
      this.$refs.codeMirror.setSize('auto', 'auto')
    })
  },
  methods: {
    download(){
      //将canvas转换为图片
      let canvas = document.getElementById("mycanvas").getElementsByTagName("canvas")[1];
      if(canvas == null) {
        return;
      }
      let img = canvas.toDataURL("image/png");
      //图片显示到页面上
      var image = new Image();
      image.src = img;
      //直接前台下载
      var base64 = img.toString(); // imgSrc 就是base64哈
      var byteCharacters = atob(
        base64.replace(/^data:image\/(png|jpeg|jpg);base64,/, "")
      );
      var byteNumbers = new Array(byteCharacters.length);
      for (var i = 0; i < byteCharacters.length; i++) {
        byteNumbers[i] = byteCharacters.charCodeAt(i);
      }
      var byteArray = new Uint8Array(byteNumbers);
      var blob = new Blob([byteArray], {
        type: undefined,
      });
      var aLink = document.createElement("a");
      aLink.download = this.form.name+".png"; //这里写保存时的图片名称
      aLink.href = URL.createObjectURL(blob);
      aLink.click();
    },
    runit() {
      var prog = this.code;
      var mypre = document.getElementById("output");
      mypre.innerHTML = "";
      Sk.pre = "output";
      let outf = this.outf;
      let builtinRead = this.builtinRead;
      Sk.configure({
        output: outf,
        read: builtinRead,
        __future__: Sk.python3,
      });

      (Sk.TurtleGraphics || (Sk.TurtleGraphics = {})).target = "mycanvas";
      var myPromise = Sk.misceval.asyncToPromise(function () {
        return Sk.importMainWithBody("<stdin>", false, prog, true);
      });

      myPromise.then(
        function (mod) {
          //回到顶部
          document.body.scrollTop = document.documentElement.scrollTop = 0;
          console.log("success");
        },
        function (err) {
          console.log(err.toString());
          //加载skulpt
          mypre.innerHTML = err.toString();
        }
      );
    },
    builtinRead(file) {
      console.log("Attempting file: " + Sk.ffi.remapToJs(file));
      if (
        Sk.builtinFiles === undefined ||
        Sk.builtinFiles.files[file] === undefined
      ) {
        throw "File not found: '" + file + "'";
      }

      return Sk.builtinFiles.files[file];
    },
    outf(text) {
      var mypre = document.getElementById("output");
      mypre.innerHTML = mypre.innerHTML + text;
    },
    getXY(e) {
      //获取以中心点为原点的鼠标坐标
      //获取canvas元素
      var canvas = document.getElementById("mycanvas").getElementsByTagName("canvas")[0];
      if(!canvas) return;
      var rect = canvas.getBoundingClientRect();
      this.x = rect.width / 2 - (e.clientX - rect.left);
      this.y = rect.height / 2 - (e.clientY - rect.top);
      //保留整数
      this.x = parseInt(this.x);
      this.y = parseInt(this.y);
    },
    onSubmit(){
      let data = {
        name: this.form.name,
        uname: this.form.uname,
        school: this.form.school,
        teacher: this.form.teacher,
        code: this.code,
        isPublic: this.form.isPublic,
      }
      if(data.name === ''){
        this.$message({
          message: '作品名称不能为空',
          type: 'error'
        });
        return;
      }
      if(data.uname === ''){
        this.$message({
          message: '作者名称不能为空',
          type: 'error'
        });
        return;
      }
      if(data.school === ''){
        this.$message({
          message: '学校名称不能为空',
          type: 'error'
        });
        return;
      }
      if(data.teacher === ''){
        this.$message({
          message: '指导老师不能为空',
          type: 'error'
        });
        return;
      }
      //上传图片
      let canvas = document.getElementById("mycanvas").getElementsByTagName("canvas")[1];
      if(canvas == null) {
        this.$message({
          message: '请先运行代码',
          type: 'error'
        });
        return;
      }
      let img = canvas.toDataURL("image/png");
      //封装blob对象
      let blob = this.dataURLtoBlob(img);
      let formData = new FormData();
      formData.append('file', blob, 'turtle.png');
      //上传图片
      uploadImg(formData).then(res => {
        if(res.code === 200){
          data.imgPath = res.msg;
          //提交
          submitTurtle(data).then(res => {
            if(res.code === 200){
              this.$message({
                message: '提交成功',
                type: 'success'
              });
            }else{
              this.$message({
                message: res.msg,
                type: 'error'
              });
            }
          })
        }else{
          this.$message({
            message: res.msg,
            type: 'error'
          });
        }
      })
      //提交
      // submitTurtle(data).then(res => {
      //   console.log(res);
      //   if(res.code === 200){
      //     this.$message({
      //       message: '提交成功',
      //       type: 'success'
      //     });
      //   }else{
      //     this.$message({
      //       message: res.msg,
      //       type: 'error'
      //     });
      //   }
      // })
    },
    dataURLtoBlob(img) {
      //将base64转换为文件
      let arr = img.split(',');
      let mime = arr[0].match(/:(.*?);/)[1];
      let bstr = atob(arr[1]);
      let n = bstr.length;
      let u8arr = new Uint8Array(n);
      while(n--){
        u8arr[n] = bstr.charCodeAt(n);
      }
      return new Blob([u8arr], {type:mime});
    },
  },
  mounted() {
    // let script = document.createElement('script');
    // script.type = 'text/javascript';
    // script.src = 'https://cdn.jsdelivr.net/gh/skulpt/skulpt-dist/skulpt.min.js';
    // document.body.appendChild(script);
    // script = document.createElement('script');
    // script.type = 'text/javascript';
    // script.src = 'https://cdn.jsdelivr.net/gh/skulpt/skulpt-dist/skulpt-stdlib.js';
    // document.body.appendChild(script);
    // 代码提示功能 当用户有输入时，显示提示信息
    this.$refs.cm.codemirror.on('inputRead', cm => {
      cm.showHint();
    })
    this.$refs.cm.codemirror.setSize("auto", (document.documentElement.clientHeight - 100) + "px")
    // this.$nextTick(() => {
    //   window.addEventListener('resize', () => {
    //     //监听浏览器窗口大小改变
    //     //浏览器变化执行动作
    //     this.$refs.cm.codemirror.setSize("auto", (document.documentElement.clientHeight - 500) + "px")
    //   });
    // })
  },
  watch: {
    size(val) {
      switch (val) {
        case 1:
          this.width = 320;
          this.height = 480;
          break;
        case 2:
          this.width = 480;
          this.height = 480;
          break;
        case 3:
          this.width = 640;
          this.height = 480;
          break;
        case 4:
          this.width = 960;
          this.height = 480;
          break;
        case 5:
          this.width = 1200;
          this.height = 600;
          break;
        case 6:
          this.width = 1280;
          this.height = 720;
          break;
        case 7:
          this.width = 0;
          this.height = 0;
          break;
      }
    },
    width(val) {
      this.$refs.canvas.style.width = val + 'px';
    },
    height(val) {
      this.$refs.canvas.style.height = val + 'px';
    },
    speed(val) {
      switch (val) {
        case 1:
          this.$refs.canvas.style.animationDuration = '5s';
          break;
        case 2:
          this.$refs.canvas.style.animationDuration = '3s';
          break;
        case 3:
          this.$refs.canvas.style.animationDuration = '1s';
          break;
        case 4:
          this.$refs.canvas.style.animationDuration = '.5s';
          break;
      }
    },
  },
};
</script>

<style scoped lang="scss">
@media screen and (min-width: 1024px){
  .navbar {
    min-height: 3.25rem;
  }
}

@media screen and (min-width: 1024px){
  .navbar, .navbar-menu, .navbar-start, .navbar-end {
    align-items: stretch;
    display: flex;
  }
}

.navbar {
  background-color: white;
  min-height: 3.25rem;
  position: relative;
}
@media screen and (min-width: 1024px){
  .navbar {
    min-height: 3.25rem;
  }
}

@media screen and (min-width: 1024px){
  .navbar, .navbar-end, .navbar-menu, .navbar-start {
    align-items: stretch;
    display: flex;
  }
}

.navbar {
  background-color: #fff;
  min-height: 3.25rem;
  position: relative;
}

.navbar > .container {
  align-items: stretch;
  display: flex;
  min-height: 3.25rem;
  width: 100%;
}
.navbar>.container {
  align-items: stretch;
  display: flex;
  min-height: 3.25rem;
  width: 100%;
}

@media screen and (min-width: 1024px){
  .navbar-item, .navbar-link {
    align-items: center;
    display: flex;
  }
}



.navbar-menu {
  display: none;
}


.container {
  margin: 0 auto;
  position: relative;
}


.navbar-menu {
  display: none;
}


.navbar-item {
  color: #666;
  border-bottom: 2px solid transparent;
}
.navbar-item, .navbar-link {
  transition: all 0.2s;
}

.navbar-item {
  flex-grow: 0;
  flex-shrink: 0;
}
.navbar-item, .navbar-link {
  color: #4a4a4a;
  display: block;
  line-height: 1.5;
  padding: 0.5rem 1rem;
  position: relative;
}
.navbar-item {
  color: #666;
  border-bottom: 2px solid transparent;
}
.navbar-item, .navbar-link {
  transition: all .2s;
}

.navbar-item {
  flex-grow: 0;
  flex-shrink: 0;
}
.navbar-item, .navbar-link {
  color: #4a4a4a;
  display: block;
  line-height: 1.5;
  padding: .5rem 1rem;
  position: relative;
}
a, .title a:hover {
  color: #00a289;
}
a {
  color: #3273dc;
  cursor: pointer;
  text-decoration: none;
}
.title a:hover, a {
  color: #00a289;
}
a {
  color: #3273dc;
  cursor: pointer;
  text-decoration: none;
}

.navbar-item.is-on, .navbar-link.is-on, .navbar-item:not(.is-exact).router-link-active, .navbar-item.router-link-exact-active {
  color: #00d1b2 !important;
  border-color: #00d1b2 !important;
}
.navbar-item.is-on, .navbar-item.router-link-exact-active, .navbar-item:not(.is-exact).router-link-active, .navbar-link.is-on {
  color: #00d1b2!important;
  border-color: #00d1b2!important;
}
.navbar-item {
  color: #666;
  border-bottom: 2px solid transparent;
}
.navbar-item, .navbar-link {
  transition: all 0.2s;
}
@media screen and (min-width: 1024px){
  .navbar-item, .navbar-link {
    align-items: center;
    display: flex;
  }
}

.navbar-item {
  flex-grow: 0;
  flex-shrink: 0;
}
.navbar-item, .navbar-link {
  color: #4a4a4a;
  display: block;
  line-height: 1.5;
  padding: 0.5rem 1rem;
  position: relative;
}
.navbar-item {
  color: #666;
  border-bottom: 2px solid transparent;
}
.navbar-item, .navbar-link {
  transition: all .2s;
}
@media screen and (min-width: 1024px){
  .navbar-item, .navbar-link {
    align-items: center;
    display: flex;
  }
}

.navbar-item {
  flex-grow: 0;
  flex-shrink: 0;
}
.navbar-item, .navbar-link {
  color: #4a4a4a;
  display: block;
  line-height: 1.5;
  padding: .5rem 1rem;
  position: relative;
}
a, .title a:hover {
  color: #00a289;
}
a {
  color: #3273dc;
  cursor: pointer;
  text-decoration: none;
}
.title a:hover, a {
  color: #00a289;
}
a {
  color: #3273dc;
  cursor: pointer;
  text-decoration: none;
}


.mycanvas {
  width: 100%;
  height: auto;
  margin: 0 auto;
  display: block;
  align-items: center;
}
.canvas-card {
  overflow: auto;
  display: flex;
  justify-content: center;
  padding: 10px 0;
  background: #f5f5f5;
}
.python-turtle {
  position: relative;
  display: inline-block;
}
.canvas {
  z-index: 1;
  transform-origin: 0 0;
}
.code-editor, .code-example pre {
  font-family: Consolas,Monaco,Courier New,Courier,monospace!important;
}
.code-editor {
  background: #e8ebf0;
  width: 100%;
  padding: 0 .5rem;
  z-index: 5;
  position: absolute;
  top: 0;
}
.is-text-danger {
  color: #ef4444;
}
.code-editor {
  border: 1px solid #ddd;
}
.is-text-danger {
  color: #ef4444;
}
.code-editor {
  border: 1px solid #ddd;
}
pre {
  overflow: auto;
}
pre {
  -webkit-overflow-scrolling: touch;
  background-color: whitesmoke;
  color: #4a4a4a;
  font-size: 0.875em;
  overflow-x: auto;
  padding: 1.25rem 1.5rem;
  white-space: pre;
  word-wrap: normal;
}
code, pre {
  -moz-osx-font-smoothing: auto;
  -webkit-font-smoothing: auto;
  font-family: monospace;
}
.card-content {
  padding: 1rem;
}
.is-text-small {
  font-size: 0.8rem;
}
.card-content {
  padding: 1.5rem;
}
.card-content {
  padding: 1rem;
}
.is-text-small {
  font-size: .8rem;
}
.card-content {
  padding: 1.5rem;
}
.text-gray-400 {
  --tw-text-opacity: 1;
  color: rgba(156, 163, 175, var(--tw-text-opacity));
}
.font-bold {
  font-weight: 700;
}
.text-sm {
  font-size: 0.875rem;
  line-height: 1.25rem;
}
.mb-1 {
  margin-bottom: 0.25rem;
}
.text-gray-400 {
  --tw-text-opacity: 1;
  color: rgba(156,163,175,var(--tw-text-opacity));
}
.font-bold {
  font-weight: 700;
}
.text-sm {
  font-size: .875rem;
  line-height: 1.25rem;
}
.mb-1 {
  margin-bottom: .25rem;
}
</style>
