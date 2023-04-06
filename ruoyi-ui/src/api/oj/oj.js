import request from '@/utils/request'

// 查询oj列表
export function listOj(query) {
  return request({
    url: '/oj/list',
    method: 'get',
    params: query
  })
}

// 查询oj详细
export function getOj(id) {
  return request({
    url: '/oj/' + id,
    method: 'get'
  })
}

// 新增oj
export function addOj(data) {
  return request({
    url: '/oj',
    method: 'post',
    data: data
  })
}

// 修改oj
export function updateOj(data) {
  return request({
    url: '/oj',
    method: 'put',
    data: data
  })
}

// 删除oj
export function delOj(id) {
  return request({
    url: '/oj/' + id,
    method: 'delete'
  })
}

// 发送代码到后端编译
export function sendCode(data) {
  return request({
    url: '/oj/sendCode',
    method: 'post',
    data: {
      id: data.id,
      code: data.code
    }
  })
}

export function chapterTreeSelect(query) {
  return request({
    url: '/oj/chapterTree',
    method: 'get',
    params: query
  })
}

//请求公开题库
export function getPublicProblemList(query) {
  return request({
    url: '/oj/publicProblemList',
    method: 'get',
    params: query
  })
}

//查询有没有通过该题
export function checkOj(id){
  return request({
    url: '/oj/checkOj/'+id,
    method: 'get'
  })
}

//获取评论列表
export function getComments(id){
  return request({
    url: '/oj/getComments/'+id,
    method: 'get'
  })
}
