import request from '@/utils/request'

// 查询classfile列表
export function listClassfile(query) {
  return request({
    url: '/classfile/classfile/list',
    method: 'get',
    params: query
  })
}

// 查询classfile详细
export function getClassfile(id) {
  return request({
    url: '/classfile/classfile/' + id,
    method: 'get'
  })
}

// 新增classfile
export function addClassfile(data) {
  return request({
    url: '/classfile/classfile',
    method: 'post',
    data: data
  })
}

// 修改classfile
export function updateClassfile(data) {
  return request({
    url: '/classfile/classfile',
    method: 'put',
    data: data
  })
}

// 删除classfile
export function delClassfile(id) {
  return request({
    url: '/classfile/classfile/' + id,
    method: 'delete'
  })
}
