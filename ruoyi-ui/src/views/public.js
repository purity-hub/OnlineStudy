//全局变量
import Vue from 'vue'
export default new Vue({
  data: {
    // 用于存储课程id
    courseId: null,
  },
  created() {
    this.read()
  },
  methods: {
    save(){
      localStorage.setItem('courseId',this.courseId)
    },
    read(){
      this.courseId = localStorage.getItem('courseId')
    }
  },
  watch: {
    courseId(){
      this.save()
    }
  }
})
