import request from '@/utils/request'

// 查询签到记录信息列表
export function listSigninrecord(query) {
  return request({
    url: '/signin/signin/list',
    method: 'get',
    params: query
  })
}

export function listSigninview(query) {
  return request({
    url: '/signin/signin/list2',
    method: 'get',
    params: query
  })
}

// 查询签到记录信息详细
export function getSigninrecord(id) {
  return request({
    url: '/signin/signin/' + id,
    method: 'get'
  })
}

// 新增签到记录信息
export function addSigninrecord(data) {
  return request({
    url: '/signin/signin',
    method: 'post',
    data: data
  })
}

// 修改签到记录信息
export function updateSigninrecord(data) {
  return request({
    url: '/signin/signin',
    method: 'put',
    data: data
  })
}

// 删除签到记录信息
export function delSigninrecord(id) {
  return request({
    url: '/signin/signin/' + id,
    method: 'delete'
  })
}

//签到
export function signin(signid) {
  return request({
    url: '/signin/signin/signin',
    method: 'post',
    data: signid
  })
}
