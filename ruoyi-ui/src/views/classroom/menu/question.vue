<template>
  <el-card class="box-card">
    <div slot="header" class="clearfix" style="margin-bottom: -10px">
      <span>{{ questionIndex + 1 }}、</span>
      <span
        class="type-name"
        v-text="form.questionType < 3 ?
          form.questionType === 1 ?
            '单选题' : '多选题'
          :form.questionType < 5 ?
            form.questionType === 3 ?
              '判断题' : '填空题'
            : '简答题'"
      >卡片名称</span>
      <el-input v-model="form.score" style="width: 55px"/>
      <span>分</span>
      <el-button style="float: right; border: none; font-size: 20px" icon="el-icon-delete" @click="removeQuestion"/>
    </div>
    <el-form ref="form"
             :model="form"
             :rules="rules"
             class="form">
      <el-form-item prop="context">
        <el-input
          v-model="form.context"
          type="textarea"
          placeholder="请输入题目内容..."
        />
      </el-form-item>
      <!--单选、多选-->
      <div v-if="form.questionType === 1 || form.questionType === 2">
        <el-row v-for="(item, index) in ['A', 'B', 'C', 'D']" :key="item">
          <el-col :span="2">
            <el-form-item prop="answer">
              <el-checkbox-group :min="0" :max="form.questionType === 1 ? 1 : 4" v-model="form.answer">
                <el-checkbox :label="item" border :disabled="form.select[index]===''"></el-checkbox>
              </el-checkbox-group>
            </el-form-item>
          </el-col>
          <el-col :span="22">
            <el-form-item>
              <el-input placeholder="请输入选项" @input="contentChange(question)" v-model="form.select[index]"/>
            </el-form-item>
          </el-col>

        </el-row>
      </div>
      <!--简答、填空-->
      <el-form-item v-if="form.questionType === 4 || form.questionType === 5" style="margin-bottom: 0px"
                    prop="answer">
        <el-input
          v-model="form.answer"
          type="textarea"
          placeholder="请输入参考答案"
        />
      </el-form-item>
      <!--判断-->
      <el-form-item v-if="form.questionType === 3" style="margin-bottom: 0px" prop="answer">
        <el-checkbox-group
          v-model="form.answer"
          :min="0"
          :max="1"
        >
          <el-checkbox v-model="form.answer" label="对" border/>
          <el-checkbox v-model="form.answer" label="错" border/>
        </el-checkbox-group>
      </el-form-item>
    </el-form>
  </el-card>
</template>

<script>
export default {
  props: {
    question: {
      type: Object,
      required: true
    },
    questionIndex: {
      type: Number,
      required: true
    }
  },
  data() {
    return {
      form: {
        questionType: this.question.questionType,
        context: this.question.context,
        answer: this.question.answer,
        select: this.question.select
      },
      rules: {
        context: [
          {required: true, message: '请输入题目内容', trigger: 'blur'},
        ],
        chooseanswer: [
          {type: 'array', required: true, message: '请选择答案', trigger: 'change'}
        ],
        judge: [
          {required: true, message: '请选择答案', trigger: 'blur'},
        ],
        answer: [
          {required: true, message: '请输入答案', trigger: 'change'},
        ],
      }
    }
  },
  methods: {
    removeQuestion() {
      this.$emit('removeQuestion', this.questionIndex)
    },
    contentChange(question) {

    }
  }
}
</script>

<style scoped>
.type-name {
  color: #505050;
  margin-right: 20px;
}
</style>
