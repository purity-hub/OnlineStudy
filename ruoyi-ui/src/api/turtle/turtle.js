import request from '@/utils/request'

// 提交turtle
export function submitTurtle(data) {
  return request({
    url: '/turtle/insert',
    method: 'post',
    data: data
  })
}

//list
export function listTurtle(query) {
  return request({
    url: '/turtle/list',
    method: 'get',
    params: query
  })
}

//uploadImg
export function uploadImg(data) {
  return request({
    url: '/turtle/uploadImg',
    method: 'post',
    data: data
  })
}

//updatelookNum
export function updatelookNum(data) {
  return request({
    url: '/turtle/updatelookNum',
    method: 'post',
    data: {
      id: data.id,
      lookNum: data.lookNum
    }
  })
}

//updatelikeNum
export function updatelikeNum(data) {
  return request({
    url: '/turtle/updatelikeNum',
    method: 'post',
    data: {
      id: data.id,
      likeNum: data.likeNum
    }
  })
}


export function listMostLike() {
  return request({
    url: '/turtle/listMostLike',
    method: 'get'
  })
}

//getAllSchool
export function getAllSchool() {
  return request({
    url: '/turtle/getAllSchool',
    method: 'get'
  })
}

//获取对应学校的turtle
export function getTurtleBySchool(schoolName) {
  return request({
    url: '/turtle/getTurtleBySchool/' + schoolName,
    method: 'get',
  })
}

//获取对应学校的作品的全部指导老师
export function getTeacherBySchool(schoolName) {
  return request({
    url: '/turtle/getTeacherBySchool/' + schoolName,
    method: 'get',
  })
}

//获取我的作品
export function getMyTurtle() {
  return request({
    url: '/turtle/getMyTurtle',
    method: 'get',
  })
}

//updatePublic
export function updatePublic(data) {
  return request({
    url: '/turtle/updatePublic',
    method: 'post',
    data: {
      id: data.id,
      isPublic: data.isPublic
    }
  })
}
