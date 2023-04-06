<template>
  <div class="app-container">
    <div>
      <el-form
        ref="form"
        :model="form"
        :rules="rules"
        class="form"
      >
        <h4 class="card-label">设置任务</h4>
        <div class="card-panel">
          <div class="settings-wrap" style="width: 18%">
            <span class="content-label">开始时间</span>
            <el-form-item prop="startTime">
              <el-date-picker
                v-model="form.startTime"
                type="datetime"
                placeholder="选择日期时间"
                value-format="yyyy-MM-dd HH:mm:ss"
              />
            </el-form-item>
          </div>
          <div class="settings-wrap" style="width: 18%;padding-left: 20px">
            <span class="content-label">截止时间</span>
            <el-form-item prop="endTime">
              <el-date-picker
                v-model="form.endTime"
                type="datetime"
                placeholder="选择日期时间"
                value-format="yyyy-MM-dd HH:mm:ss"
              />
            </el-form-item>
          </div>
        </div>
        <h4 class="card-label">试卷标题</h4>
        <div class="card-panel">
          <div class="settings-wrap" style="width: 40%">
            <el-form-item prop="name">
              <el-input
                v-model="form.name"
                type="text"
                placeholder="请输入试卷标题（1-20个字）"
                maxlength="20"
                show-word-limit
              />
            </el-form-item>
          </div>
        </div>

        <h4 class="card-label">试卷内容</h4>
        <div class="card-panel">
          <div class="settings-wrap" style="width: 100%">
            <question ref="question" @removeQuestion="removeQuestion"
              v-for="(item,index) in form.questions"
              :key="item"
              :question="item"
              :questionIndex="index"
            />
          </div>
        </div>
        <div class="card-panel">
          <div class="settings-wrap" style="width: 18%">
            <span class="content-label">选择题目类型</span>
            <el-select
              v-model="questionId"
              placeholder="请选择题目类型"
              @change="changeQuestion"
            >
              <el-option v-for="(item,index) in questionType" :key="index" :label=item.label :value=item.value></el-option>
            </el-select>
          </div>
          <div class="settings-wrap" style="width: 18%">
            <span class="content-label">添加题目</span>
            <el-button
              type="primary"
              @click="addQuestion"
            >
              添加题目
            </el-button>
          </div>
        </div>
        <el-button
          type="primary"
          class="submit"
          :loading="loading"
          style="margin-top: 20px"
          @click="addExam"
        >
          提交试卷
        </el-button>
      </el-form>
    </div>
  </div>
</template>

<script>
import {addExam} from "@/api/exam/exam";
import question from '@/views/classroom/menu/question'
import Public from "@/views/public";
export default {
  name: 'Create',
  components: {
    question
  },
  data() {
    return {
      roles: [],
      loading: false,
      questionId: '',
      form: {
        name: '',
        startTime: '', // 开始时间
        endTime: '', // 截止时间
        questions: []
      },
      questionType: [
        {
          value: 1,
          label: '单选题'
        },
        {
          value: 2,
          label: '多选题'
        },
        {
          value: 3,
          label: '判断题'
        },
        {
          value: 4,
          label: '填空题'
        },
        {
          value: 5,
          label: '简答题'
        }
      ],
      rules: {
        roleList: [{
          required: true,
          message: '请选择考试对象',
          trigger: 'blur'
        }],
        startTime: [{
          required: true,
          message: '请选择开始时间',
          trigger: 'blur'
        }],
        endTime: [{
          required: true,
          message: '请选择截止时间',
          trigger: 'blur'
        }],
        name: [{
          required: true,
          message: '请输入试卷标题（1-20个字）',
          trigger: 'blur'
        }]
      }
    }
  },
  created() {
    this.form.courseId = Public.courseId
  },
  methods: {
    addExam() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          let questions = this.$refs['question']
          let questionList = []
          for(let i=0;i<questions.length;i++){
            let question = questions[i]
            question.$refs.form.validate(valid => {
              if (valid) {
                questionList.push(question.form)
              }else{
                this.$message({
                  message: '请检查题目信息',
                  type: 'warning'
                })
                return
              }
            })
          }
          //此时可以提交
          let form1 = Object.assign({},this.form)
          form1.questionList = Object.assign([],questionList)
          for(let i=0;i<form1.questionList.length;i++){
            let question = form1.questionList[i]
            //context,answer,select
            questionList[i].context = question.context
            questionList[i].answer = question.answer
            //将questionList[i].answer转化为字符串
            questionList[i].answer = questionList[i].answer.toString()
            if(questionList[i].questionType === 2){
              //多选题
              questionList[i].answer = questionList[i].answer.split(",").sort().join("");
            }
            questionList[i].selectA = question.select[0]
            questionList[i].selectB = question.select[1]
            questionList[i].selectC = question.select[2]
            questionList[i].selectD = question.select[3]
            questionList[i].score = question.score
            questionList[i].questionType = question.questionType
          }
          this.loading = true
          addExam(form1).then(response => {
            this.loading = false
            this.$message({
              message: '创建成功',
              type: 'success'
            })
            //跳转到试卷列表
          }).catch(() => {
            this.loading = false
          })
        }else{
          this.$message({
            message: '请检查试卷信息',
            type: 'warning'
          })
          return
        }
      })
    },
    changeQuestion() {
      this.dialogVisible = true
    },
    addQuestion() {
      //前端动态添加题目
      let question = {
        questionType : this.questionId,
        select:['','','',''],//选择题选项
        answer:[],//答案
        score:0,//分数
      }
      if(this.questionId === null || this.questionId === '') {
        this.$message({
          message: '请选择题目类型',
          type: 'warning'
        })
        return
      }
      this.form.questions.push(question)
    },
    removeQuestion(index) {
      this.form.questions.splice(index,1)
    }
  }
}
</script>

<style rel="stylesheet/scss" lang="scss" scoped>
.card-label {
  margin: 30px 0 15px;
}
.card-panel {
  display: flex;
  flex-direction: row;
  padding: 17px 15px 0;
  color: #666;
  box-shadow: 0 0 3px 1px #e7e7e7;
  border-color: #e7e7e7;

  .settings-wrap {
    margin-right: 4%;
  }
}
.content-label {
  display: block;
  padding-bottom: 5px;
}
.question-type {
  margin-top: 20px;
}
.question-content {
  margin-top: 20px;
  color: #666;
  box-shadow: 0 0 4px 2px rgba(0, 0, 0, .05);
  border-color: rgba(0, 0, 0, .05);
}
</style>

