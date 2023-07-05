package com.ruoyi.turtle.domain;


import com.ruoyi.common.core.domain.BaseEntity;

public class Turtle extends BaseEntity {

  private long id;
  private String name;
  private String uname;
  private String school;
  private String teacher;
  private long userId;
  private long isPublic;
  private String code;
  private long likeNum;
  private long lookNum;
  private String imgPath;
  private java.sql.Timestamp createTime;


  public long getId() {
    return id;
  }

  public void setId(long id) {
    this.id = id;
  }


  public String getName() {
    return name;
  }

  public void setName(String name) {
    this.name = name;
  }


  public String getUname() {
    return uname;
  }

  public void setUname(String uname) {
    this.uname = uname;
  }


  public String getSchool() {
    return school;
  }

  public void setSchool(String school) {
    this.school = school;
  }


  public String getTeacher() {
    return teacher;
  }

  public void setTeacher(String teacher) {
    this.teacher = teacher;
  }


  public long getUserId() {
    return userId;
  }

  public void setUserId(long userId) {
    this.userId = userId;
  }


  public long getIsPublic() {
    return isPublic;
  }

  public void setIsPublic(long isPublic) {
    this.isPublic = isPublic;
  }


  public String getCode() {
    return code;
  }

  public void setCode(String code) {
    this.code = code;
  }


  public long getLikeNum() {
    return likeNum;
  }

  public void setLikeNum(long likeNum) {
    this.likeNum = likeNum;
  }


  public long getLookNum() {
    return lookNum;
  }

  public void setLookNum(long lookNum) {
    this.lookNum = lookNum;
  }


  public String getImgPath() {
    return imgPath;
  }

  public void setImgPath(String imgPath) {
    this.imgPath = imgPath;
  }


  public java.sql.Timestamp getCreateTime() {
    return createTime;
  }

  public void setCreateTime(java.sql.Timestamp createTime) {
    this.createTime = createTime;
  }

}
