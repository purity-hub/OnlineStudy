import request from '@/utils/request'

// 查询所有的已选课程
export function listMyCourse(query) {
  return request({
    url: '/course/listmycourse',
    method: 'get',
    params: query
  })
}

// 查询所有的公共课
export function listPublicCourse(query) {
  return request({
    url: '/course/listpubliccourse',
    method: 'get',
    params: query
  })
}

// 选课
export function chooseCourse(courseId) {
  return request({
    url: '/course/choosecourse/' + courseId,
    method: 'get'
  })
}
