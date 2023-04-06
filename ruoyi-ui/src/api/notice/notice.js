import request from '@/utils/request'

// 查询课程通知公告列表
export function listNotice(query) {
  return request({
    url: '/notice/notice/list',
    method: 'get',
    params: query
  })
}

// 查询课程通知公告详细
export function getNotice(id) {
  return request({
    url: '/notice/notice/' + id,
    method: 'get'
  })
}

// 新增课程通知公告
export function addNotice(data) {
  return request({
    url: '/notice/notice',
    method: 'post',
    data: data
  })
}

// 修改课程通知公告
export function updateNotice(data) {
  return request({
    url: '/notice/notice',
    method: 'put',
    data: data
  })
}

// 删除课程通知公告
export function delNotice(id) {
  return request({
    url: '/notice/notice/' + id,
    method: 'delete'
  })
}
