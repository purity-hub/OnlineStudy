import request from '@/utils/request'

// 查询chapter列表
export function listChapter(query) {
  return request({
    url: '/chapter/list',
    method: 'get',
    params: query
  })
}

// 查询chapter详细
export function getChapter(id) {
  return request({
    url: '/chapter/' + id,
    method: 'get'
  })
}

// 新增chapter
export function addChapter(data) {
  return request({
    url: '/chapter',
    method: 'post',
    data: data
  })
}

// 修改chapter
export function updateChapter(data) {
  return request({
    url: '/chapter',
    method: 'put',
    data: data
  })
}

// 删除chapter
export function delChapter(id) {
  return request({
    url: '/chapter/' + id,
    method: 'delete'
  })
}

export function courseTreeSelect() {
  return request({
    url: '/chapter/courseTree',
    method: 'get'
  })
}
