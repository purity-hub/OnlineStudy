<template>
  <div class="app-container">
    <div class="fanyaMarking TiMu" id="fanyaMarking">
      <div class="fanyaMarking_left whiteBg">
        <div class="borderBom padBom20 detailsHead">
          <h2 class="mark_title">{{list.name}}</h2>
          <div class="infoHead fl">
            <span>题量：  {{totalNum}} </span>
            <span>满分： {{fullScore}}</span>
            <div style="margin-top:10px;margin-left:-9px;">
              <p>
                考试时间：<em style="font-weight:normal; font-style:normal;">{{ list.startTime }}</em>至<em
                style="font-weight:normal; font-style:normal;">{{list.endTime}}</em>
              </p>
            </div>
          </div>
          <div class="analysisCard fl">
          </div>
          <div class="clear"></div>
          <span class="resultNum"> <i>{{myAnswer.score}}</i>分</span>
        </div>
        <input type="hidden" id="stuCpi" value="148970466">
        <input type="hidden" id="isStudent" value="true">
        <div class="mark_table padTop60">
          <div class="mark_item ans-cc">
            <h2 class="type_tit">一. 单选题（共{{singleList.length}} 题，{{singleScore}}分）</h2>
            <div class="marBom60 questionLi scroll_882580922" id="question882580922" data="882580922" v-for="(item,index) in singleList" :key="item">
              <h3 class="mark_name colorDeep">{{index+1}}. <span class="colorShallow">(单选题,{{item.score}}分)</span>
                {{item.context}}
              </h3>
              <ul class="mark_letter colorDeep">
                <li>A. {{item.selectA}}</li>
                <li>B. {{item.selectB}}</li>
                <li>C. {{item.selectC}}</li>
                <li>D. {{item.selectD}}</li>
              </ul>
              <div class="mark_answer">
                <div class="mark_key clearfix">
                  <span class="colorDeep marginRight40 fl"><i class="fontWeight">我的答案:</i>{{myAnswer.answer[0][index].answer}}</span>
                  <span class="colorGreen marginRight40 fl"><i class="fontWeight">正确答案:</i> {{item.answer}}</span>
                </div>
                <div class="analysisDiv">
                  <div class="analysis"><i>答案解析：</i></div>
                </div>
                <div class="mark_score">
                  <div v-if="myAnswer.answer[0][index].answer===item.answer" class="totalScore fr"><i>{{item.score}}</i>分</div>
                  <div v-else class="totalScore fr"><i>0</i>分</div>
                </div>
              </div>
            </div>

            <h2 class="type_tit">二. 多选题（共{{multipleList.length}} 题，{{multipleScore}}分）</h2>
            <div class="marBom60 questionLi scroll_882580992" id="question882580992" data="882580992" v-for="(item,index) in multipleList" :key="item">
              <h3 class="mark_name colorDeep">1. <span class="colorShallow">(多选题,{{item.score}}分)</span>
                {{item.context}}
              </h3>
              <ul class="mark_letter colorDeep">

                <li>A. {{item.selectA}}</li>

                <li>B. {{item.selectB}}</li>

                <li>C. {{item.selectC}}</li>

                <li>D. {{item.selectD}}</li>
              </ul>

              <div class="mark_answer">
                <div class="mark_key clearfix">
                  <span class="colorDeep marginRight40 fl"><i class="fontWeight">我的答案:</i>{{myAnswer.answer[1][index].answer}}</span>
                  <span class="colorGreen marginRight40 fl"><i class="fontWeight">正确答案:</i> {{item.answer}}</span>
                </div>

                <div class="analysisDiv">
                  <div class="analysis"><i>答案解析：</i></div>
                </div>
                <div class="mark_score">

                  <div v-if="myAnswer.answer[1][index].answer===item.answer" class="totalScore fr"><i>{{item.score}}</i>分</div>
                  <div v-else class="totalScore fr"><i>0</i>分</div>
                </div>
              </div>
            </div>

            <h2 class="type_tit">三. 判断题（共{{judgeList.length}} 题，{{judgeScore}}分）</h2>
            <div class="marBom60 questionLi scroll_882581017" id="question882581017" data="882581017" v-for="(item,index) in judgeList" :key="item">
              <h3 class="mark_name colorDeep">1. <span class="colorShallow">(判断题,{{item.score}}分)</span>
                {{item.context}}
              </h3>
              <ul class="mark_letter colorDeep">
                <li>A. 对</li>
                <li>B. 错</li>
              </ul>
              <div class="mark_answer">
                <div class="mark_key clearfix">
                  <span class="colorDeep marginRight40 fl"><i class="fontWeight">我的答案:</i> {{ myAnswer.answer[2][index].answer }}</span>
                  <span class="colorGreen marginRight40 fl">
                                                            <i class="fontWeight">正确答案:</i> {{item.answer}}
                                                </span>
                </div>

                <div class="analysisDiv">
                  <div class="analysis"><i>答案解析：</i></div>
                </div>
                <div class="mark_score">

                  <div v-if="myAnswer.answer[2][index].answer===item.answer" class="totalScore fr"><i>{{item.score}}</i>分</div>
                  <div v-else class="totalScore fr"><i>0</i>分</div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>

      <div class="fanyaMarking_right" id="rightHeight" style="max-height: 607px; top: 70px;">
        <div class="topicNumber" id="topicNumberScroll" tabindex="1"
             style="max-height: 597px; overflow: hidden; outline: none;">

          <div class="topicNumber_checkbox colorDeep fs14">
            <span class="numRight fr" style="margin-right: 10px"></span>一. 单选题（{{singleScore}}分）
          </div>


          <ul class="topicNumber_list clearfix" >
            <li :id="index" :data="index" v-for="(item,index) in singleList" :key="item">{{index+1}}</li>
          </ul>

          <div class="topicNumber_checkbox colorDeep fs14">
            <span class="numRight fr" style="margin-right: 10px"></span>二. 多选题（{{multipleScore}}分）
          </div>


          <ul class="topicNumber_list clearfix" >
            <li v-for="(item,index) in multipleList" :key="item">{{index+1}}</li>
          </ul>

          <div class="topicNumber_checkbox colorDeep fs14">
            <span class="numRight fr" style="margin-right: 10px"></span>三. 判断题（{{judgeScore}}分）
          </div>


          <ul class="topicNumber_list clearfix" >
            <li v-for="(item,index) in judgeList" :key="item">{{index+1}}</li>
          </ul>
        </div>
        <div id="ascrail2000" class="nicescroll-rails nicescroll-rails-vr"
             style="width: 8px; z-index: auto; cursor: default; position: absolute; top: 0px; left: 272px; height: 597px; opacity: 0; display: block;">
          <div class="nicescroll-cursors"
               style="position: relative; top: 0px; float: right; width: 8px; height: 285px; background-color: rgb(230, 236, 245); background-clip: padding-box; border-radius: 5px;"></div>
        </div>
        <div id="ascrail2000-hr" class="nicescroll-rails nicescroll-rails-hr"
             style="height: 8px; z-index: auto; top: 589px; left: 0px; position: absolute; cursor: default; display: none; width: 272px; opacity: 0;">
          <div class="nicescroll-cursors"
               style="position: absolute; top: 0px; height: 8px; width: 280px; background-color: rgb(230, 236, 245); background-clip: padding-box; border-radius: 5px; left: 0px;"></div>
        </div>
      </div>
      <div class="maskDiv popMoveShowHide examScoreListDiv" style="display:none;" id="recordList">
        <div class="popDiv wid840 popMove" id="content">
          <div class="het62"></div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import {getExam, getMyAnswer} from "@/api/exam/exam";

export default {
  name: "exam",
  data() {
    return {
      examId: this.$route.query.examId,
      fullScore: 0,
      totalNum: 0,
      list: {},
      //单选题
      singleList: [],
      //多选题
      multipleList: [],
      //判断题
      judgeList: [],
      //填空题
      fillList: [],
      //简答题
      shortList: [],
      //每种题型的分数
      singleScore: 0,
      multipleScore: 0,
      judgeScore: 0,
      fillScore: 0,
      shortScore: 0,
      myAnswer: {
        answer: [
          [{id:"",answer:""}],
          [{id:"",answer:""}],
          [{id:"",answer:""}],
          [{id:"",answer:""}],
          [{id:"",answer:""}]
        ],
      },
    };
  },
  created() {
    this.listExam();
    this.getMyAnswer();
  },
  methods: {
    listExam() {
      getExam(this.examId).then(response => {
        this.list = response.data;
        //计算满分
        this.fullScore = 0;
        for (let i = 0; i < this.list.questionList.length; i++) {
          this.fullScore += this.list.questionList[i].score;
        }
        this.totalNum = this.list.questionList.length;
        //根据题型分类
        for (let i = 0; i < this.list.questionList.length; i++) {
          if (this.list.questionList[i].questionType === 1) {
            this.singleList.push(this.list.questionList[i]);
          } else if (this.list.questionList[i].questionType === 2) {
            this.multipleList.push(this.list.questionList[i]);
          } else if (this.list.questionList[i].questionType === 3) {
            this.judgeList.push(this.list.questionList[i]);
          } else if (this.list.questionList[i].questionType === 4) {
            this.fillList.push(this.list.questionList[i]);
          } else if (this.list.questionList[i].questionType === 5) {
            this.shortList.push(this.list.questionList[i]);
          }
        }
        //计算每种题型的满分
        this.singleScore = 0;
        for (let i = 0; i < this.singleList.length; i++) {
          this.singleScore += this.singleList[i].score;
        }
        this.multipleScore = 0;
        for (let i = 0; i < this.multipleList.length; i++) {
          this.multipleScore += this.multipleList[i].score;
        }
        this.judgeScore = 0;
        for (let i = 0; i < this.judgeList.length; i++) {
          this.judgeScore += this.judgeList[i].score;
        }
        this.fillScore = 0;
        for (let i = 0; i < this.fillList.length; i++) {
          this.fillScore += this.fillList[i].score;
        }
        this.shortScore = 0;
        for (let i = 0; i < this.shortList.length; i++) {
          this.shortScore += this.shortList[i].score;
        }
      });
    },
    //获取自己的答案
    getMyAnswer() {
      getMyAnswer(this.examId).then(response => {
        if(response.data == null){
          this.$message({
            message: '您还未参加考试',
            type: 'warning'
          });
          return;
        }
        console.log(response.data);
        this.myAnswer = response.data;
        //将字符串转换为数组
        let answer = this.myAnswer.answer
        this.myAnswer.answer = JSON.parse(answer);
      });
    },
  },
}
</script>

<style scoped>
.fanyaMarking {
  width: 1200px;
  margin: 30px auto 30px;
  position: relative;
}

.fanyaMarking_left {
  width: 900px;
  border-radius: 8px;
  min-height: 1000px;
  -webkit-box-shadow: 0px 2px 10px 0px rgba(237,238,240,0.5);
  box-shadow: 0px 2px 10px 0px rgba(237,238,240,0.5);
}

.whiteBg {
  background: #FFFFFF;
}

.padBom20 {
  padding-bottom: 20px;
}

.borderBom {
  border-bottom: 1px solid #F2F2F2;
}

.detailsHead {
  position: relative;
}

.padBom20 {
  padding-bottom: 20px;
}

.mark_title {
  line-height: 25px;
  padding: 30px 40px 0;
  font-size: 18px;
  color: #181E33;
  font-weight: bold;
  width: 575px;
}

.infoHead {
  padding: 10px 0 0 40px;
  overflow: hidden;
  line-height: 16px;
  color: #A8A8B3;
  font-size: 14px;
}

.fl {
  float: left;
}

.analysisCard {
  height: 29px;
  background: rgba(251,251,251,1);
  border-radius: 15px;
  border: 1px solid #F4F5F6;
  padding: 0 18px;
  text-align: center;
  line-height: 29px;
  margin-left: 20px;
}

.clear {
  clear: both;
}

.resultNum {
  position: absolute;
  right: 40px;
  top: 40px;
  color: #F7704E;
  font-size: 14px;
}

.padTop60 {
  padding-top: 60px;
}

.mark_item {
  margin-bottom: 10px;
  overflow: hidden;
}

.mark_item {
  margin: 0 20px;
  font-size: 14px;
}

.type_tit {
  padding-left: 20px;
  /* padding: 30px 0 30px 20px; */
  margin-bottom: 30px;
  font-size: 16px;
  color: #181E33;
  font-weight: bold;
}

.marBom60 {
  margin-bottom: 60px;
}

.mark_name {
  line-height: 20px;
  margin: 0 20px;
  font-size: 14px;
  overflow-wrap: break-word;
}

.colorDeep {
  color: #181E33;
}

.mark_letter {
  line-height: 20px;
  margin: 0 20px;
}

.mark_answer {
  min-height: 20px;
  line-height: 20px;
  padding: 16px 20px;
  margin-top: 16px;
  border: solid #F0F3F7 1px;
  border-left: 5px solid #e1e7f0;
  position: relative;
  margin-left: 20px;
}

.mark_key {
  padding-right: 212px;
}

.clearfix {
  zoom: 1;
  overflow: hidden;
}

.marginRight40 {
  margin-right: 40px;
}

.fontWeight {
  font-weight: 600;
}

.colorGreen {
  color: #00B86E;
}

.analysisDiv {
  padding-top: 16px;
}

.analysis {
  font-size: 13px;
  color: #A8A8B3;
  padding-bottom: 10px;
  overflow: hidden;
}

.mark_score {
  position: absolute;
  right: 20px;
  top: 14px;
}

.mark_score .totalScore {
  line-height: 26px;
  font-size: 12px;
  color: #181E33;
  font-family: din;
  display: inline-block;
  text-align: right;
  width: 90px;
}

.fr {
  float: right;
}

.fanyaMarking_right {
  width: 280px;
  background: #FFFFFF;
  border-radius: 8px;
  position: fixed;
  top: 30px;
  margin-left: 920px;
  -webkit-box-shadow: 0px 2px 10px 0px rgba(237,238,240,0.5);
  box-shadow: 0px 2px 10px 0px rgba(237,238,240,0.5);
}

.topicNumber_checkbox {
  padding: 20px;
  height: 20px;
  line-height: 20px;
}

.colorDeep {
  color: #181E33;
}

.fs14 {
  font-size: 14px;
}

.numRight {
  font-size: 12px;
}

.topicNumber_list {
  padding-left: 23px;
}

.clearfix {
  zoom: 1;
  overflow: hidden;
}

ul, ol, li {
  list-style-type: none;
}

.topicNumber_list li {
  width: 32px;
  height: 32px;
  line-height: 32px;
  margin: 0 16px 20px 0;
  background: #FFFFFF;
  border: solid #3A8BFF 1px;
  font-size: 14px;
  color: #3A8BFF;
  float: left;
  border-radius: 5px;
  text-align: center;
  cursor: pointer;
}

.topicNumber_list {
  padding-left: 23px;
}

.clearfix {
  zoom: 1;
  overflow: hidden;
}

ul, ol, li {
  list-style-type: none;
}

</style>
