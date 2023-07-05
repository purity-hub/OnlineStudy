<template>
  <div class="app-container">
    <div class="hero is-small is-white">
      <div class="hero-body">
        <div class="container">
          <div class="columns is-multiline is-variable is-6">
            <div class="column is-12">
              <div class="v-title is-text-medium"><b><b data-v-516bedbd="">
                <span class="is-text-info is-text-xlarge">Python</span>×
                <span class="is-text-success is-text-xlarge">Turtle</span>
                程序设计艺术</b></b></div>
              <div class="hero-course-desc is-marginless">
                Turtle Computing Art
              </div>
            </div>
          </div>
        </div>
      </div>
      <div class="container">
        <div class="tab elastic-tab relative flex-wrap">
          <a href="/turtle/latest"
             class="tab-item border-b-2 border-transparent border-blue-500 active text-blue-500 bg-white">
            <span>所有作品</span>
          </a>
          <a href="/turtle/upvotes" class="tab-item border-b-2 border-transparent">
            <span>最多点赞</span>
          </a>
          <a href="/turtle/colleges" class="tab-item border-b-2 border-transparent">
            <span>高校精品</span>
          </a>
        </div>
      </div>
    </div>
    <div class="container leading-6  text-gray-400 text-sm pb-8 ">
      <div class="bg-white text-gray-900 shadow-md rounded-lg p-6 text-gray-400">
        <p>
          <b class="text-3xl text-gray-400 mr-2">前言</b>
          1967 年，Seymour Papert 在 Logo 语言中创造了 Turtle 海龟绘图。之后的 50
          多年里，这只不起眼的海龟为数不清的编程初学者提供了一个轻松的入门机会，让他们能够提前感知到计算机图形学和计算机辅助设计中许多最重要的主题。
          21 世纪的今天，Logo 语言已湮灭在编程语言发展的长河中，但海龟绘图的教学理念早已在 Python 中传承下来。</p>
        <p class="mt-1">
          海龟看似简单的运动，蕴含着无限的可能性。从点线面的简单形状，到随机生成艺术的思考。它已不只是初学者拨弄的玩具，更是计算机程序设计与视觉艺术结合的典范。
          下面 3963736 行代码构成的数万副作品，向我们展现着海龟绘图的种种形式。</p>
        <div class="mt-4">
          <el-button type="primary" size="small" round @click="newTurtle">开始创作</el-button>
        </div>
      </div>
    </div>
    <ul class=" grid">
      <li class="grid" v-for="(item,index) in list">
        <span class="tag is-warning is-7days">
          <i class="fa fa-heart is-icon">
          </i>本周最佳
        </span>
        <div class="drawing">
          <div class="python-turtle">
            <div :id="`mycanvas-`+index" class="canvas"
                 style="transform: scale(0.975); outline: none; height: 389px; width: 389px; background-image: none;">
            </div>
            <pre class="code-editor" style="display: none;"></pre>
            <pre class="code-editor is-text-danger" style="display: none;"></pre>
            <img :id="`myimg-`+index" :src="url+item.imgPath" class="thumbnail" alt=""
                 @mouseenter="enter(index)" @mouseleave="leave(index)">
            <div class="relative cursor-pointer
     inline-flex items-center  play-btn text-white bg-blue-500 hover:bg-blue-600 h-8 px-3.5 rounded-full"
                 style="-webkit-tap-highlight-color: transparent;opacity: 0;"
                 @mouseenter="enter(index)"
                 @click="startDraw(index)">
              播放绘制过程
            </div>
          </div>
        </div>
        <div class="drawing-info">
          <div class="media">
            <div class="media-content">
              <p class="single-line drawing-title">
                <span><b>《{{ item.name }}》</b></span></p>
              <p class="is-text-xs">{{ item.createTime }}</p>
              <p class="is-text-xs">{{ item.uname }}</p>
              <p class="is-text-xs">{{ item.school }}{{ item.teacher }}老师指导创作</p></div>
            <div class="media-right has-content-right is-text-xs"><br>
              <button class="is-clickable is-marginless" v-on:click="addlikeNum(index)">
                <span class="is-text-danger">{{ item.likeNum }}</span>
                <svg-icon class="white-love" icon-class="white-love"  class-name='custom-class'></svg-icon>
                <svg-icon class="red-love" icon-class="red-love"  class-name='custom-class' style="display: none;"></svg-icon>
              </button>
              <p>{{ item.lookNum }} 人观看</p>
              <p>
                <a class="is-title">
                  <span class="is-transparent is-text-grey">举报</span>
                </a>
                <a href="#" class="is-title">
                  <span><i class="fa fa-share-alt fa-fw"></i>分享</span></a></p>
            </div>
          </div>
        </div>

      </li>
    </ul>
  </div>
</template>
<script>

import requireSkulpt from "skulpt/support/run/require-skulpt";
import skulpt from "skulpt";
import {listTurtle,updatelookNum,updatelikeNum} from "@/api/turtle/turtle";

export default {
  name: "index",
  data() {
    return {
      activeName: "1",
      list: [],
      url: process.env.VUE_APP_BASE_API
    };
  },
  created() {
    listTurtle().then(res => {
      this.list = res.rows;
    });
  },
  methods: {
    newTurtle() {
      this.$router.push({path: "/turtle/new"});
    },
    enter(index) {
      //显示播放按钮
      //第index个
      document.querySelectorAll(".play-btn")[index].style.opacity = 1;
    },
    leave(index) {
      //隐藏播放按钮
      document.querySelectorAll(".play-btn")[index].style.opacity = 0;
    },
    //更新点赞次数
    addlikeNum(index) {
      //点赞次数+1
      //第一次点赞，创建isLike属性
      if(this.list[index].isLike===undefined){
        this.list[index].isLike=true;
        this.list[index].likeNum += 1;
        this.$message({
          message: "点赞成功",
          type: "success"
        });
      }else{
        this.list[index].isLike=!this.list[index].isLike;
        if(this.list[index].isLike){
          this.list[index].likeNum += 1;
          this.$message({
            message: "点赞成功",
            type: "success"
          });
        }else{
          this.list[index].likeNum -= 1;
          this.$message({
            message: "取消点赞",
            type: "success"
          });
        }
      }
      //将图标变为红色
      if(this.list[index].isLike){
        document.querySelectorAll(".red-love")[index].style.display="inline";
        document.querySelectorAll(".white-love")[index].style.display="none";
      }else{
        document.querySelectorAll(".red-love")[index].style.display="none";
        document.querySelectorAll(".white-love")[index].style.display="inline";
      }
      //调用接口，更新点赞次数
      let params = {
        id: this.list[index].id,
        likeNum: this.list[index].likeNum
      };
      updatelikeNum(params).then(res => {
        console.log(res);
      });
      //调用接口，更新点赞次数
    },
    //更新观看次数
    updateLookNum(index) {
      //观看次数+1
      //限制用户重复观看导致观看次数增加
      this.list[index].newLookNum = this.list[index].lookNum + 1;
      //调用接口，更新观看次数
      let params = {
        id: this.list[index].id,
        lookNum: this.list[index].newLookNum
      };
      updatelookNum(params).then(res => {
        console.log(res);
      });
    },
    startDraw(index) {
      //观看次数+1
      //限制用户重复观看导致观看次数增加
      this.updateLookNum(index);
      this.leave(index)
      //隐藏img标签
      document.querySelectorAll(".thumbnail")[index].style.display = "none";
      var prog = this.list[index].code;
      Sk.pre = "output";
      let builtinRead = this.builtinRead;
      Sk.configure({
        read: builtinRead,
        __future__: Sk.python3,
      });
      //将mycanvas的img标签变为div
      //将mycanvas的id变为mycanvas+index


      (Sk.TurtleGraphics || (Sk.TurtleGraphics = {})).target = "mycanvas-" + index;
      var myPromise = Sk.misceval.asyncToPromise(function () {
        return Sk.importMainWithBody("<stdin>", false, prog, true);
      });

      myPromise.then(
        function (mod) {
          //回到顶部
          document.body.scrollTop = document.documentElement.scrollTop = 0;
          //显示img标签
          document.querySelectorAll(".thumbnail")[index].style.display = "block";
          console.log("success");
        },
        function (err) {
          console.log(err.toString());
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
  },
};
</script>
<style scoped lang="scss">
.hero {
  align-items: stretch;
  display: flex;
  flex-direction: column;
  justify-content: space-between;
}

.hero.is-white {
  background-color: white;
  color: #0a0a0a;
}

.hero.is-small .hero-body {
  padding-bottom: 1.5rem;
  padding-top: 1.5rem;
}

.hero.is-small .hero-body {
  padding-bottom: 1.5rem;
  padding-top: 1.5rem;
}

.hero-body {
  flex-grow: 1;
  flex-shrink: 0;
  padding: 3rem 1.5rem;
}

.hero-body, .section {
  padding: 3rem 1.5rem;
}

.hero-body {
  flex-grow: 1;
  flex-shrink: 0;
}

.container {
  margin: 0 auto;
  position: relative;
}

.container {
  margin: 0 auto;
  position: relative;
}

.columns.is-variable.is-6 {
  --columnGap: 1.5rem;
}

.columns.is-variable.is-6 {
  --columnGap: 1.5rem;
}

.columns.is-variable {
  --columnGap: 0.75rem;
  margin-left: calc(-1 * var(--columnGap));
  margin-right: calc(-1 * var(--columnGap));
}

.columns:not(.is-desktop) {
  display: flex;
}

.columns.is-multiline {
  flex-wrap: wrap;
}

.columns:last-child {
  margin-bottom: -0.75rem;
}

.columns.is-variable {
  --columnGap: 0.75rem;
  margin-left: calc(var(--columnGap) * -1);
  margin-right: calc(var(--columnGap) * -1);
}

.columns:not(.is-desktop) {
  display: flex;
}

.columns.is-multiline {
  flex-wrap: wrap;
}

.columns:last-child {
  margin-bottom: -.75rem;
}

.columns {
  margin-left: -0.75rem;
  margin-right: -0.75rem;
  margin-top: -0.75rem;
}

.columns {
  margin-left: -.75rem;
  margin-right: -.75rem;
  margin-top: -.75rem;
}

.columns.is-variable .column {
  padding-left: var(--columnGap);
  padding-right: var(--columnGap);
}

.columns.is-variable .column {
  padding-left: var(--columnGap);
  padding-right: var(--columnGap);
}

.column.is-12, .column.is-12-tablet {
  flex: none;
  width: 100%;
}

.column.is-12, .column.is-12-tablet {
  flex: none;
  width: 100%;
}

.column {
  display: block;
  flex-basis: 0;
  flex-grow: 1;
  flex-shrink: 1;
  padding: 0.75rem;
}

.column {
  display: block;
  flex-basis: 0;
  flex-grow: 1;
  flex-shrink: 1;
  padding: .75rem;
}

.is-text-medium {
  font-size: 1.25rem;
}

.is-text-medium {
  font-size: 1.25rem;
}

.is-text-info {
  color: #1d96ea;
}

.is-text-info {
  color: #1d96ea;
}

span {
  font-style: inherit;
  font-weight: inherit;
}

span {
  font-style: inherit;
  font-weight: inherit;
}

.is-text-success {
  color: #23d160;
}

.is-text-success {
  color: #23d160;
}

span {
  font-style: inherit;
  font-weight: inherit;
}

span {
  font-style: inherit;
  font-weight: inherit;
}

.hero-course-desc {
  margin: 1.5rem 0;
  font-size: 14px;
  text-align: justify;
  color: #666;
}

.is-marginless {
  margin: 0 !important;
}

.hero-course-desc {
  margin: 1.5rem 0;
  font-size: 14px;
  text-align: justify;
  color: #666;
}

.is-marginless {
  margin: 0 !important;
}

.container {
  margin: 0 auto;
  position: relative;
}

.container {
  margin: 0 auto;
  position: relative;
}

.elastic-tab {
  user-select: none;
  background: none;
  position: relative;
  overflow: hidden;
  display: flex;
  align-items: center;
  overflow-x: auto;
  font-size: 14px;
  font-weight: bold;
}

.flex-wrap {
  flex-wrap: wrap;
}

.relative {
  position: relative;
}

.elastic-tab {
  user-select: none;
  background: none;
  position: relative;
  overflow: hidden;
  display: flex;
  align-items: center;
  overflow-x: auto;
  font-size: 14px;
  font-weight: 700;
}

.flex-wrap {
  flex-wrap: wrap;
}

.relative {
  position: relative;
}

.hero.is-white a:not(.button):not(.dropdown-item):not(.tag), .hero.is-white strong {
  color: inherit;
}

.hero.is-white a:not(.button):not(.dropdown-item):not(.tag), .hero.is-white strong {
  color: inherit;
}

.elastic-tab .tab-item.active, .elastic-tab .tab-item.router-link-active:not(.is-exact), .elastic-tab .tab-item.router-link-exact-active {
  font-weight: bold;
  opacity: 1;
}

.elastic-tab .tab-item.active, .elastic-tab .tab-item.router-link-active:not(.is-exact), .elastic-tab .tab-item.router-link-exact-active {
  font-weight: 700;
  opacity: 1;
}

.elastic-tab .tab-item {
  text-decoration: none;
  text-transform: uppercase;
  padding: 5px 16px;
  color: #363636;
  display: inline-block;
  position: relative;
  cursor: pointer;
  z-index: 2;
  transition: all 0.3s;
  flex-shrink: 0;
  opacity: 0.5;
}

.elastic-tab .tab-item {
  text-decoration: none;
  text-transform: uppercase;
  padding: 5px 16px;
  color: #363636;
  display: inline-block;
  position: relative;
  cursor: pointer;
  z-index: 2;
  transition: all .3s;
  flex-shrink: 0;
  opacity: .5;
}

.text-blue-500 {
  --tw-text-opacity: 1;
  color: rgba(59, 130, 246, var(--tw-text-opacity));
}

.bg-white {
  --tw-bg-opacity: 1;
  background-color: rgba(255, 255, 255, var(--tw-bg-opacity));
}

.border-blue-500 {
  --tw-border-opacity: 1;
  border-color: rgba(59, 130, 246, var(--tw-border-opacity));
}

.border-transparent {
  border-color: transparent;
}

.border-b-2 {
  border-bottom-width: 2px;
}

.text-blue-500 {
  --tw-text-opacity: 1;
  color: rgba(59, 130, 246, var(--tw-text-opacity));
}

.bg-white {
  --tw-bg-opacity: 1;
  background-color: rgba(255, 255, 255, var(--tw-bg-opacity));
}

.border-blue-500 {
  --tw-border-opacity: 1;
  border-color: rgba(59, 130, 246, var(--tw-border-opacity));
}

.border-transparent {
  border-color: transparent;
}

.border-b-2 {
  border-bottom-width: 2px;
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

.text-gray-400 {
  --tw-text-opacity: 1;
  color: rgba(156, 163, 175, var(--tw-text-opacity));
}

.leading-6 {
  line-height: 1.5rem;
}

.text-sm {
  font-size: 0.875rem;
  line-height: 1.25rem;
}

.pb-8 {
  padding-bottom: 2rem;
}

.container {
  margin: 0 auto;
  position: relative;
}

.text-gray-400 {
  --tw-text-opacity: 1;
  color: rgba(156, 163, 175, var(--tw-text-opacity));
}

.leading-6 {
  line-height: 1.5rem;
}

.text-sm {
  font-size: .875rem;
  line-height: 1.25rem;
}

.pb-8 {
  padding-bottom: 2rem;
}


.text-gray-900 {
  --tw-text-opacity: 1;
  color: rgba(17, 24, 39, var(--tw-text-opacity));
}

.text-gray-400 {
  --tw-text-opacity: 1;
  color: rgba(156, 163, 175, var(--tw-text-opacity));
}

.p-6 {
  padding: 1.5rem;
}

.bg-white {
  --tw-bg-opacity: 1;
  background-color: rgba(255, 255, 255, var(--tw-bg-opacity));
}

.rounded-lg {
  border-radius: 0.5rem;
}

.shadow-md {
  --tw-shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.1), 0 2px 4px -1px rgba(0, 0, 0, 0.06);
}


.text-gray-900 {
  --tw-text-opacity: 1;
  color: rgba(17, 24, 39, var(--tw-text-opacity));
}

.text-gray-400 {
  --tw-text-opacity: 1;
  color: rgba(156, 163, 175, var(--tw-text-opacity));
}

.p-6 {
  padding: 1.5rem;
}

.bg-white {
  --tw-bg-opacity: 1;
  background-color: rgba(255, 255, 255, var(--tw-bg-opacity));
}

.rounded-lg {
  border-radius: .5rem;
}

p {
  display: block;
  margin-block-start: 1em;
  margin-block-end: 1em;
  margin-inline-start: 0;
  margin-inline-end: 0;
}

b {
  font-weight: bold;
}

.text-gray-400 {
  --tw-text-opacity: 1;
  color: rgba(156, 163, 175, var(--tw-text-opacity));
}

.text-3xl {
  font-size: 1.875rem;
  line-height: 2.25rem;
}

.mr-2 {
  margin-right: 0.5rem;
}

.text-gray-400 {
  --tw-text-opacity: 1;
  color: rgba(156, 163, 175, var(--tw-text-opacity));
}

.text-3xl {
  font-size: 1.875rem;
  line-height: 2.25rem;
}

.mr-2 {
  margin-right: .5rem;
}

.mt-1 {
  margin-top: 0.25rem;
}

.mt-1 {
  margin-top: .25rem;
}

ul.grid {
  /* display: flex; */
  flex-wrap: wrap;
  /* flex-direction: row; */
  /* margin: 0 auto; */
}

@media screen and (max-width: 1169px) and (min-width: 961px) {
  ul.grid {
    max-width: 924px;
  }
}

ul.grid {
  display: flex;
  flex-wrap: wrap;
  flex-direction: row;
  margin: 0 auto;
}

.grid {
  display: grid;
}

ul {
  list-style: none;
}

@media screen and (max-width: 1169px) {
  ul.grid {
    max-width: 924px;
  }
}

@media screen and (max-width: 1539px) {
  li.grid {
    width: calc(33.333% - 3rem);
  }
}

li.grid {
  margin: 1.5rem;
  padding: 10px;
  float: left;
  position: relative;
}

.tag:not(body).is-warning {
  background-color: #ffdd57;
  color: rgba(0, 0, 0, 0.7);
}

.tag:not(body).is-warning {
  background-color: #ffdd57;
  color: rgba(0, 0, 0, .7);
}

.is-7days[data-v-7851195a] {
  position: absolute;
  right: 1rem;
  top: 1rem;
  z-index: 3;
}

.tag:not(body) {
  align-items: center;
  background-color: whitesmoke;
  border-radius: 3px;
  color: #4a4a4a;
  display: inline-flex;
  font-size: 0.75rem;
  height: 2em;
  justify-content: center;
  line-height: 1.5;
  padding-left: 0.75em;
  padding-right: 0.75em;
  white-space: nowrap;
}

.tag:not(body) {
  align-items: center;
  background-color: #f5f5f5;
  border-radius: 3px;
  color: #4a4a4a;
  display: inline-flex;
  font-size: .75rem;
  height: 2em;
  justify-content: center;
  line-height: 1.5;
  padding-left: .75em;
  padding-right: .75em;
  white-space: nowrap;
}

span {
  font-style: inherit;
  font-weight: inherit;
}

span {
  font-style: inherit;
  font-weight: inherit;
}

.fa.is-icon {
  margin-right: 0.4em;
  /* font-size: 1rem !important; */
}

.fa-2x.is-icon, .fa.is-icon {
  margin-right: .4em;
}

.fa {
  vertical-align: inherit;
}

.fa {
  display: inline-block;
  font: normal normal normal 14px/1 FontAwesome;
  font-size: inherit;
  text-rendering: auto;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
}

.fa {
  vertical-align: inherit;
}

.fa {
  display: inline-block;
  font: normal normal normal 14px/1 FontAwesome;
  font-size: inherit;
  text-rendering: auto;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
}

.drawing {
  border-radius: 3px;
  display: flex;
  align-items: flex-end;
  justify-content: center;
}

.python-turtle {
  box-shadow: 3px 2px 30px 0 rgba(50, 50, 50, .1);
  background: #fff;
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
  font-family: Consolas, Monaco, Courier New, Courier, monospace !important;
}

.code-editor {
  background: #e8ebf0;
  width: 100%;
  padding: 0 .5rem;
  z-index: 5;
  position: absolute;
  top: 0;
}

.code-editor {
  border: 1px solid #ddd;
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
  font-family: monospace;
}

.thumbnail {
  z-index: 2;
  width: 100%;
  position: absolute;
  top: 0;
  left: 0;
  opacity: .8;
}

img {
  height: auto;
  max-width: 100%;
}

img, embed, object, audio, video {
  max-width: 100%;
}

img {
  height: auto;
  max-width: 100%;
}

audio, embed, img, object, video {
  max-width: 100%;
}

.play-btn {
  position: absolute;
  left: 50%;
  top: -250px;
  height: 50px;
  font-weight: 700;
  z-index: 3;
  transition: all .6s;
  font-size: 17px;
  transform: translate(-50%, -50%);
}


.text-white {
  --tw-text-opacity: 1;
  color: rgba(255, 255, 255, var(--tw-text-opacity));
}

.leading-none {
  line-height: 1;
}

.text-sm {
  font-size: 0.875rem;
  line-height: 1.25rem;
}

.px-3\.5 {
  padding-left: 0.875rem;
  padding-right: 0.875rem;
}

.bg-blue-500 {
  --tw-bg-opacity: 1;
  background-color: rgba(59, 130, 246, var(--tw-bg-opacity));
}

.rounded-full {
  border-radius: 9999px;
}

.whitespace-nowrap {
  white-space: nowrap;
}

.items-center {
  align-items: center;
}

.select-none {
  -moz-user-select: none;
  user-select: none;
}

.cursor-pointer {
  cursor: pointer;
}

.h-8 {
  height: 2rem;
}

.inline-flex {
  display: inline-flex;
}

.relative {
  position: relative;
}


.shadow {
  --tw-shadow: 0 1px 3px 0 rgba(0, 0, 0, 0.1), 0 1px 2px 0 rgba(0, 0, 0, 0.06);
}

.text-white {
  --tw-text-opacity: 1;
  color: rgba(255, 255, 255, var(--tw-text-opacity));
}

.leading-none {
  line-height: 1;
}

.text-sm {
  font-size: .875rem;
  line-height: 1.25rem;
}

.px-3\.5 {
  padding-left: .875rem;
  padding-right: .875rem;
}

.bg-blue-500 {
  --tw-bg-opacity: 1;
  background-color: rgba(59, 130, 246, var(--tw-bg-opacity));
}

.rounded-full {
  border-radius: 9999px;
}

.whitespace-nowrap {
  white-space: nowrap;
}

.items-center {
  align-items: center;
}

.select-none {
  -moz-user-select: none;
  user-select: none;
}

.cursor-pointer {
  cursor: pointer;
}

.h-8 {
  height: 2rem;
}

.inline-flex {
  display: inline-flex;
}

.relative {
  position: relative;
}

.fa {
  vertical-align: inherit;
}

.fa-fw {
  width: 1.28571429em;
  text-align: center;
}

.fa {
  display: inline-block;
  font: normal normal normal 14px/1 FontAwesome;
  font-size: inherit;
  text-rendering: auto;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
}

.-ml-1 {
  margin-left: -0.25rem;
}

.mr-1 {
  margin-right: 0.25rem;
}

.fa {
  vertical-align: inherit;
}

.fa-fw {
  width: 1.28571429em;
  text-align: center;
}

.fa {
  display: inline-block;
  font: normal normal normal 14px/1 FontAwesome;
  font-size: inherit;
  text-rendering: auto;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
}

.-ml-1 {
  margin-left: -.25rem;
}

.mr-1 {
  margin-right: .25rem;
}

.drawing-info {
  width: 100%;
  padding: 1rem 1rem 2rem;
  font-size: 14px;
}

.media {
  align-items: flex-start;
  display: flex;
  text-align: left;
}

.media {
  align-items: flex-start;
  display: flex;
  text-align: left;
}

.media-content {
  overflow: initial;
}

.media-content {
  flex-basis: auto;
  flex-grow: 1;
  flex-shrink: 1;
  overflow: auto;
  text-align: left;
}

.media-content {
  overflow: initial;
}

.media-content {
  flex-basis: auto;
  flex-grow: 1;
  flex-shrink: 1;
  overflow: auto;
  text-align: left;
}

.drawing-title {
  margin-left: -.5rem;
  font-size: 17px;
}

.single-line {
  min-width: 0;
  flex: 1;
  overflow: hidden;
  text-overflow: ellipsis;
}

.single-line {
  min-width: 0;
  flex: 1;
  overflow: hidden;
  text-overflow: ellipsis;
}

.single-line p, .single-line a, .single-line span {
  overflow: hidden;
  white-space: nowrap;
  text-overflow: ellipsis;
}

.single-line a, .single-line p, .single-line span {
  overflow: hidden;
  white-space: nowrap;
  text-overflow: ellipsis;
}

span {
  font-style: inherit;
  font-weight: inherit;
}

span {
  font-style: inherit;
  font-weight: inherit;
}

.is-text-xs {
  font-size: 12px;
}

.is-text-xs {
  font-size: 12px;
}

.drawing-info .media-right[data-v-73cbc4ee] {
  opacity: 0;
  transform: translateX(10px);
  transition: all .6s;
}

.is-text-xs {
  font-size: 12px;
}

.has-content-right {
  text-align: right;
  justify-content: flex-end;
}

.media-right {
  margin-left: 1rem;
}

.media-left, .media-right {
  flex-basis: auto;
  flex-grow: 0;
  flex-shrink: 0;
}

.is-text-xs {
  font-size: 12px;
}

.has-content-right {
  text-align: right;
  justify-content: flex-end;
}

.media-right {
  margin-left: 1rem;
}

.media-left, .media-right {
  flex-basis: auto;
  flex-grow: 0;
  flex-shrink: 0;
}

.is-clickable {
  cursor: pointer;
}

.is-marginless {
  margin: 0 !important;
}

.is-clickable {
  cursor: pointer;
}

.is-marginless {
  margin: 0 !important;
}

.is-text-danger {
  color: #ef4444;
}

.is-text-danger {
  color: #ef4444;
}

span {
  font-style: inherit;
  font-weight: inherit;
}

span {
  font-style: inherit;
  font-weight: inherit;
}

.fa.is-icon-right {
  margin-left: 0.4em;
  /* font-size: 1rem !important; */
}

.fa.is-icon-right {
  margin-left: .4em;
}

.is-text-danger {
  color: #ef4444;
}

.fa {
  vertical-align: inherit;
}

.fa {
  display: inline-block;
  font: normal normal normal 14px/1 FontAwesome;
  font-size: inherit;
  text-rendering: auto;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
}

.is-text-danger {
  color: #ef4444;
}

.fa {
  vertical-align: inherit;
}

.fa {
  display: inline-block;
  font: normal normal normal 14px/1 FontAwesome;
  font-size: inherit;
  text-rendering: auto;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
}

a.is-title {
  color: #333 !important;
}

a.is-title {
  color: #333 !important;
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

.is-text-grey {
  color: #696969;
}

.is-transparent {
  opacity: 0.7;
}

.is-text-grey {
  color: #696969;
}

.is-transparent {
  opacity: .7;
}

span {
  font-style: inherit;
  font-weight: inherit;
}

span {
  font-style: inherit;
  font-weight: inherit;
}

a.is-title {
  color: #333 !important;
}

a.is-title {
  color: #333 !important;
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

.fa {
  vertical-align: inherit;
}

.fa-fw {
  width: 1.28571429em;
  text-align: center;
}

.fa {
  display: inline-block;
  font: normal normal normal 14px/1 FontAwesome;
  font-size: inherit;
  text-rendering: auto;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
}

.fa {
  vertical-align: inherit;
}

.fa-fw {
  width: 1.28571429em;
  text-align: center;
}

.fa {
  display: inline-block;
  font: normal normal normal 14px/1 FontAwesome;
  font-size: inherit;
  text-rendering: auto;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
}

.tag:not(body).is-warning {
  background-color: #ffdd57;
  color: rgba(0, 0, 0, 0.7);
}

.tag:not(body).is-warning {
  background-color: #ffdd57;
  color: rgba(0, 0, 0, .7);
}

.is-7days {
  position: absolute;
  right: 1rem;
  top: 1rem;
  z-index: 3;
}

.tag:not(body) {
  align-items: center;
  background-color: whitesmoke;
  border-radius: 3px;
  color: #4a4a4a;
  display: inline-flex;
  font-size: 0.75rem;
  height: 2em;
  justify-content: center;
  line-height: 1.5;
  padding-left: 0.75em;
  padding-right: 0.75em;
  white-space: nowrap;
}

.tag:not(body) {
  align-items: center;
  background-color: #f5f5f5;
  border-radius: 3px;
  color: #4a4a4a;
  display: inline-flex;
  font-size: .75rem;
  height: 2em;
  justify-content: center;
  line-height: 1.5;
  padding-left: .75em;
  padding-right: .75em;
  white-space: nowrap;
}

span {
  font-style: inherit;
  font-weight: inherit;
}

span {
  font-style: inherit;
  font-weight: inherit;
}


.text-white {
  --tw-text-opacity: 1;
  color: rgba(255, 255, 255, var(--tw-text-opacity));
}

.leading-none {
  line-height: 1;
}

.text-sm {
  font-size: 0.875rem;
  line-height: 1.25rem;
}

.px-3\.5 {
  padding-left: 0.875rem;
  padding-right: 0.875rem;
}

.bg-blue-500 {
  --tw-bg-opacity: 1;
  background-color: rgba(59, 130, 246, var(--tw-bg-opacity));
}

.rounded-full {
  border-radius: 9999px;
}

.whitespace-nowrap {
  white-space: nowrap;
}

.items-center {
  align-items: center;
}

.select-none {
  -moz-user-select: none;
  user-select: none;
}

.cursor-pointer {
  cursor: pointer;
}

.h-8 {
  height: 2rem;
}

.inline-flex {
  display: inline-flex;
}

.relative {
  position: relative;
}


.shadow {
  --tw-shadow: 0 1px 3px 0 rgba(0, 0, 0, 0.1), 0 1px 2px 0 rgba(0, 0, 0, 0.06);
}

.text-white {
  --tw-text-opacity: 1;
  color: rgba(255, 255, 255, var(--tw-text-opacity));
}

.leading-none {
  line-height: 1;
}

.text-sm {
  font-size: .875rem;
  line-height: 1.25rem;
}

.px-3\.5 {
  padding-left: .875rem;
  padding-right: .875rem;
}

.bg-blue-500 {
  --tw-bg-opacity: 1;
  background-color: rgba(59, 130, 246, var(--tw-bg-opacity));
}

.rounded-full {
  border-radius: 9999px;
}

.whitespace-nowrap {
  white-space: nowrap;
}

.items-center {
  align-items: center;
}

.select-none {
  -moz-user-select: none;
  user-select: none;
}

.cursor-pointer {
  cursor: pointer;
}

.h-8 {
  height: 2rem;
}

.inline-flex {
  display: inline-flex;
}

.relative {
  position: relative;
}

.fa.is-icon-right {
  margin-left: 0.4em;
  /* font-size: 1rem !important; */
}

.fa.is-icon-right {
  margin-left: .4em;
}

.is-text-danger {
  color: #ef4444;
}

.fa {
  vertical-align: inherit;
}

.fa {
  display: inline-block;
  font: normal normal normal 14px/1 FontAwesome;
  font-size: inherit;
  text-rendering: auto;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
}

.is-text-danger {
  color: #ef4444;
}

.fa {
  vertical-align: inherit;
}

.fa {
  display: inline-block;
  font: normal normal normal 14px/1 FontAwesome;
  font-size: inherit;
  text-rendering: auto;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
}

.thumbnail[data-v-2438ebc3] {
  z-index: 2;
  width: 100%;
  position: absolute;
  top: 0;
  left: 0;
  opacity: .8;
}

img {
  height: auto;
  max-width: 100%;
}

img, embed, object, audio, video {
  max-width: 100%;
}

img {
  height: auto;
  max-width: 100%;
}

audio, embed, img, object, video {
  max-width: 100%;
}

img {
  overflow-clip-margin: content-box;
  overflow: clip;
}
</style>
