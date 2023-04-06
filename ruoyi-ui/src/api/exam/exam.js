import request from '@/utils/request'

// 查询试卷列表
export function listExam(query) {
  return request({
    url: '/exam/exam/list',
    method: 'get',
    params: query
  })
}

export function listExam1(query) {
  return request({
    url: '/exam/exam/list1',
    method: 'get',
    params: query
  })
}

// 查询试卷详细
export function getExam(id) {
  return request({
    url: '/exam/exam/' + id,
    method: 'get'
  })
}

export function getExamNoAns(id) {
  return request({
    url: '/exam/exam/noans/' + id,
    method: 'get'
  })
}

export function getMyAnswer(id) {
  return request({
    url: '/exam/exam/myans/' + id,
    method: 'get'
  })
}

// 新增试卷
export function addExam(data) {
  return request({
    url: '/exam/exam',
    method: 'post',
    data: data
  })
}

// 修改试卷
export function updateExam(data) {
  return request({
    url: '/exam/exam',
    method: 'put',
    data: data
  })
}

// 删除试卷
export function delExam(id) {
  return request({
    url: '/exam/exam/' + id,
    method: 'delete'
  })
}
