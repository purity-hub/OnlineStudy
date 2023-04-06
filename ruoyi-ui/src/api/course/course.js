import request from '@/utils/request'

// 查询课程列表
export function listCourse(query) {
  return request({
    url: '/course/list',
    method: 'get',
    params: query
  })
}

// 查询课程详细
export function getCourse(id) {
  return request({
    url: '/course/' + id,
    method: 'get'
  })
}

// 新增课程
export function addCourse(data) {
  return request({
    url: '/course',
    method: 'post',
    data: data
  })
}

// 修改课程
export function updateCourse(data) {
  return request({
    url: '/course',
    method: 'put',
    data: data
  })
}

// 删除课程
export function delCourse(id) {
  return request({
    url: '/course/' + id,
    method: 'delete'
  })
}

//获取教师列表
export function listTeacher() {
  return request({
    url: '/course/listteacher',
    method: 'get'
  })
}

//根据教师id获取教师姓名
export function getTeacherName(id) {
  return request({
    url: '/course/getteachername/' + id,
    method: 'get'
  })
}

// 获取课程章节
export function getChapter(id) {
  return request({
    url: '/chapter/' + id,
    method: 'get'
  })
}
