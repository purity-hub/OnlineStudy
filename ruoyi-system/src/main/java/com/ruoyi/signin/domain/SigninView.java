package com.ruoyi.signin.domain;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

import java.util.Date;

public class SigninView extends BaseEntity {
    private static final long serialVersionUID = 1L;

    /** 签到id */
    private Long id;

    /** 课程id */
    @Excel(name = "课程id")
    private Long courseId;

    /** 开始时间 */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @Excel(name = "开始时间", width = 30, dateFormat = "yyyy-MM-dd HH:mm:ss")
    private Date startTime;

    /** 结束时间 */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @Excel(name = "结束时间", width = 30, dateFormat = "yyyy-MM-dd HH:mm:ss")
    private Date endTime;

    /** 状态 */
    @Excel(name = "状态")
    private Long status;

    /** 课程名称 */
    @Excel(name = "课程名称")
    private String courseName;

    /** 教师名称 */
    @Excel(name = "教师名称")
    private String teacherName;

    /** 已签到人数 */
    @Excel(name = "已签到人数")
    private Long signedNum;

    /** 应签到人数 */
    @Excel(name = "应签到人数")
    private Long shouldSignNum;

    /** 签到状态 */
    @Excel(name = "签到状态")
    private String signStatus;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getCourseId() {
        return courseId;
    }

    public void setCourseId(Long courseId) {
        this.courseId = courseId;
    }

    public Date getStartTime() {
        return startTime;
    }

    public void setStartTime(Date startTime) {
        this.startTime = startTime;
    }

    public Date getEndTime() {
        return endTime;
    }

    public void setEndTime(Date endTime) {
        this.endTime = endTime;
    }

    public Long getStatus() {
        return status;
    }

    public void setStatus(Long status) {
        this.status = status;
    }

    public String getCourseName() {
        return courseName;
    }

    public void setCourseName(String courseName) {
        this.courseName = courseName;
    }

    public String getTeacherName() {
        return teacherName;
    }

    public void setTeacherName(String teacherName) {
        this.teacherName = teacherName;
    }

    public Long getSignedNum() {
        return signedNum;
    }

    public void setSignedNum(Long signedNum) {
        this.signedNum = signedNum;
    }

    public Long getShouldSignNum() {
        return shouldSignNum;
    }

    public void setShouldSignNum(Long shouldSignNum) {
        this.shouldSignNum = shouldSignNum;
    }

    public String getSignStatus() {
        return signStatus;
    }

    public void setSignStatus(String signStatus) {
        this.signStatus = signStatus;
    }
}
