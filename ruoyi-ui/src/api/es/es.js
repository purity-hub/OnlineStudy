import request from '@/utils/request'

// 查询试卷学生成绩列表
export function listEs(query) {
  return request({
    url: '/es/es/list',
    method: 'get',
    params: query
  })
}

// 查询试卷学生成绩详细
export function getEs(id) {
  return request({
    url: '/es/es/' + id,
    method: 'get'
  })
}

// 新增试卷学生成绩
export function addEs(data) {
  return request({
    url: '/es/es',
    method: 'post',
    data: data
  })
}

// 修改试卷学生成绩
export function updateEs(data) {
  return request({
    url: '/es/es',
    method: 'put',
    data: data
  })
}

// 删除试卷学生成绩
export function delEs(id) {
  return request({
    url: '/es/es/' + id,
    method: 'delete'
  })
}
