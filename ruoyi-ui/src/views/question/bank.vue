<template>
  <div class="app-container">
    <el-tabs v-model="activeName">
      <el-tab-pane label="公共" name="first">
        <!--方向-->
        <div style="display: flex;">
        <el-cascader-panel :props="props" v-model="value1" :options="options1"></el-cascader-panel>
        <el-cascader-panel :props="props" v-model="value2" :options="options2"></el-cascader-panel>
        <el-cascader-panel :props="props" v-model="value3" :options="options3"></el-cascader-panel>
        <el-cascader-panel :props="props" v-model="value4" :options="options4"></el-cascader-panel>
        </div>
        <!--题库列表-->
        <el-collapse :key="index" v-for="(item,index) in list" v-loading="loading">
          <el-card class="li">
            <el-collapse-item :title="item.context" name="1">
              <div v-if="item.questionType===1||item.questionType===2">
                <div>A:{{item.selectA}}</div>
                <div>B:{{item.selectB}}</div>
                <div>C:{{item.selectC}}</div>
                <div>D:{{item.selectD}}</div>
              </div>
              <div>答案：{{item.answer}}</div>
              <div>解析：{{item.parse}}</div>
              <!--基础信息-->
              <div class="bottom">
                <p class="actionLeftItem questionTypeName" v-if="item.questionType===1">单选题</p>
                <p class="actionLeftItem questionTypeName" v-else-if="item.questionType===2">多选题</p>
                <p class="actionLeftItem questionTypeName" v-else-if="item.questionType===3">判断题</p>
                <p class="actionLeftItem questionTypeName" v-else-if="item.questionType===4">填空题</p>
                <p class="actionLeftItem questionTypeName" v-else-if="item.questionType===5">简答题</p>
                <p class="actionLeftItem">{{item.difficulty}}</p>
                <p class="actionLeftItem">创建者
                  <span class="c-grey">{{item.createBy}}</span>
                </p>
                <p class="actionLeftItem">更新<span class="c-grey">{{item.updateTime}}</span></p>
                <p class="actionLeftItem">使用次数<span class="c-grey">{{item.usedTime}}</span></p>
                <div class="more">
                  <span class="actonBtn">
                    <span class="textBtn" style="cursor: pointer;">
                      <div class="line">
                        <b class="b1"></b>
                        <b class="b2"></b>
                      </div>
                      <button class="el-button el-button--primary" type="button" @click="showView(item)">
                        体验
                      </button>
<!--                        <span>编辑</span>-->
                      <div class="line">
                        <b class="b1"></b>
                        <b class="b2"></b>
                      </div>
                    </span>
                  </span>
                </div>
              </div>
            </el-collapse-item>

          </el-card>
        </el-collapse>
        <pagination
          v-show="total>0"
          :total="total"
          :page.sync="queryParams.pageNum"
          :limit.sync="queryParams.pageSize"
          @pagination="getList"
        />
      </el-tab-pane>
      <el-tab-pane label="我创建的" name="second">

      </el-tab-pane>
    </el-tabs>


  </div>
</template>
<script>
import request from "@/utils/request";
import {listQuestion} from '@/api/question/question'

export default {
  data() {
    return {
      activeName: 'first',
      value1: '',
      value2: '',
      value3: '',
      value4: '',
      dicts: ['question_direction', 'question_points', 'question_type', 'question_difficulty'],
      list: [],
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        direction: '',
        points: '',
        questionType: '',
        difficulty: '',
      },
      total: 0,
      loading: false,
      props: {
        multiple: false,
        expandTrigger: 'hover',
      },
      options1: [
        {
          value: '方向',
          label: '方向',
          children: [
            {
              value: '全部',
              label: '全部',
            },
          ],
        }
      ],
      options2: [
        {
          value: '知识点',
          label: '知识点',
          children: [
            {
              value: '全部',
              label: '全部',
            },
          ]
        }
      ],
      options3: [
        {
          value: '题型',
          label: '题型',
          children: [
            {
              value: '全部',
              label: '全部',
            },
          ]
        }
      ],
      options4: [
        {
          value: '难度',
          label: '难度',
          children: [
            {
              value: '全部',
              label: '全部',
            },
          ]
        }
      ],
    };
  },
  created() {
    this.initDicts();
    this.value1 = ['方向', '全部'];
    this.value2 = ['知识点', '全部'];
    this.value3 = ['题型', '全部'];
    this.value4 = ['难度', '全部'];
  },
  methods: {
    initDicts() {
      this.dicts.forEach(dict => {
        this.getDict(dict).then(response => {
          let dictData = response.data;
          for (let i = 0; i < dictData.length; i++) {
            let dictLabel = dictData[i].dictLabel;
            let dictValue = dictData[i].dictLabel;
            let children = {
              value: dictValue,
              label: dictLabel,
            };
            if (dict === 'question_direction') {
              this.options1[0].children.push(children);
            } else if (dict === 'question_points') {
              this.options2[0].children.push(children);
            } else if (dict === 'question_type') {
              this.options3[0].children.push(children);
            } else if (dict === 'question_difficulty') {
              this.options4[0].children.push(children);
            }
          }
        });
      });
    },
    getDict(dictType) {
      return request({
        url: '/system/dict/data/type/' + dictType,
        method: 'get'
      });
    },
    //获取题库列表
    getList() {
      this.loading = true;
      console.log(this.queryParams)
      listQuestion(this.queryParams).then(response => {
        this.list = response.rows;
        this.total = response.total;
        this.loading = false;
      })
    },
    showView(item){
      if(item.questionType===1){
        this.$alert('<input type="radio" name="'+item.id+'" value="A">A:'+item.selectA+'</input><br>\n' +
          '              <input type="radio" name="'+item.id+'" value="B">B:'+item.selectB+'</input><br>\n' +
          '              <input type="radio" name="'+item.id+'" value="C">C:'+item.selectC+'</input><br>\n' +
          '              <input type="radio" name="'+item.id+'" value="D">D:'+item.selectD+'</input><br>\n' +
          '              <div>答案：'+item.answer+'</div>\n' +
          '              <div>解析：'+item.parse+'</div>', item.context, {
          dangerouslyUseHTMLString: true
        }).then(() => {
          //选择的选项和答案对比
          var radios = document.getElementsByName(item.id);
          var value = "";
          for(var i=0;i<radios.length;i++){
            if(radios[i].checked){
              value = radios[i].value;
            }
          }
          if(value===item.answer){
            this.$message({
              type: 'success',
              message: '回答正确'
            });
          }else{
            this.$message({
              type: 'error',
              message: '回答错误'
            });
          }
        })
      }else if(item.questionType===2){
        this.$alert('<input type="checkbox" name="'+item.id+'" value="A">A:'+item.selectA+'</input><br>\n' +
          '              <input type="checkbox" name="'+item.id+'" value="B">B:'+item.selectB+'</input><br>\n' +
          '              <input type="checkbox" name="'+item.id+'" value="C">C:'+item.selectC+'</input><br>\n' +
          '              <input type="checkbox" name="'+item.id+'" value="D">D:'+item.selectD+'</input><br>\n' +
          '              <div>答案：'+item.answer+'</div>\n' +
          '              <div>解析：'+item.parse+'</div>', item.context, {
          dangerouslyUseHTMLString: true
        }).then(() => {
          //选择的选项和答案对比
          var radios = document.getElementsByName(item.id);
          var value = "";
          for(var i=0;i<radios.length;i++){
            if(radios[i].checked){
              value += radios[i].value;
            }
          }
          if(value===item.answer){
            this.$message({
              type: 'success',
              message: '回答正确'
            });
          }else{
            this.$message({
              type: 'error',
              message: '回答错误'
            });
          }
        })
      }else if(item.questionType===3){
        this.$alert('<input type="radio" name="'+item.id+'" value="对">正确</input><br>\n' +
          '              <input type="radio" name="'+item.id+'" value="错">错误</input><br>\n' +
          '              <div>答案：'+item.answer+'</div>\n' +
          '              <div>解析：'+item.parse+'</div>', item.context, {
          dangerouslyUseHTMLString: true
        }).then(() => {
          //选择的选项和答案对比
          var radios = document.getElementsByName(item.id);
          var value = "";
          for(var i=0;i<radios.length;i++){
            if(radios[i].checked){
              value = radios[i].value;
            }
          }
          if(value===item.answer){
            this.$message({
              type: 'success',
              message: '回答正确'
            });
          }else{
            this.$message({
              type: 'error',
              message: '回答错误'
            });
          }
        })
      }else if(item.questionType===4){
        this.$alert('<input type="text" name="'+item.id+'" value="">', item.context, {
          dangerouslyUseHTMLString: true
        }).then(() => {
          this.$message({
            type: 'success',
            message: '提交成功!'
          });
        }).catch(() => {
          this.$message({
            type: 'info',
            message: '已取消提交'
          });
        });
      }else if(item.questionType===5){
        this.$alert('<textarea name="'+item.id+'" value="">', item.context, {
          dangerouslyUseHTMLString: true
        }).then(() => {
          this.$message({
            type: 'success',
            message: '提交成功!'
          });
        }).catch(() => {
          this.$message({
            type: 'info',
            message: '已取消提交'
          });
        });
      }
    }
  },
  computed: {
    //获取题库列表
    listenChange () {
      const {value1,value2,value3,value4,value5} = this
      return {value1,value2,value3,value4,value5}
    }
  },
  watch: {
    listenChange(val) {
      //筛选题目
      let type = null
      if(this.value3[1]==='单选题'){
        type=1
      }else if(this.value3[1]==='多选题'){
        type=2
      }else if(this.value3[1]==='判断题'){
        type=3
      }else if(this.value3[1]==='填空题'){
        type=4
      }else if(this.value3[1]==='简答题'){
        type=5
      }
      let direction = this.value1[1]
      if(this.value1[1]==='全部'){
        direction = null
      }
      let points = this.value2[1]
      if(this.value2[1]==='全部'){
        points = null
      }
      let difficulty = this.value4[1]
      if(this.value4[1]==='全部'){
        difficulty = null
      }
      this.queryParams = {
        pageNum: 1,
        pageSize: 10,
        direction: direction,
        points: points,
        questionType: type,
        difficulty: difficulty,
      }
      this.getList()
    }
  }
};
</script>

<style scoped lang="scss">
.li{
  margin-bottom: 20px;
}
.bottom {
  background-color: #f6f7f9;
  height: 42px;
  border-top: 1px solid #f1f1f1;
  display: flex;
  align-items: center;
  padding-left: 20px;
  padding-right: 15px;
}
.bottom .actionLeftItem.questionTypeName {
  margin-right: 14px;
}

.bottom .actionLeftItem {
  font-size: 14px;
  color: #5f6368;
  margin-right: 30px;
}
.bottom .actionLeftItem {
  font-size: 14px;
  color: #5f6368;
  margin-right: 30px;
}
.contentListWrap .li .bottom p {
  margin: 0;
}

</style>
