package com.ruoyi.exam.domain;


import com.ruoyi.common.core.domain.BaseEntity;

public class ExamQuestion extends BaseEntity {

  private long id;
  private long examId;
  private long questionId;


  public long getId() {
    return id;
  }

  public void setId(long id) {
    this.id = id;
  }


  public long getExamId() {
    return examId;
  }

  public void setExamId(long examId) {
    this.examId = examId;
  }


  public long getQuestionId() {
    return questionId;
  }

  public void setQuestionId(long questionId) {
    this.questionId = questionId;
  }

}
