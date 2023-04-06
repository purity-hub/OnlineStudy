package com.ruoyi.course.domain;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.ruoyi.chapter.domain.Chapter;
import com.ruoyi.common.core.domain.entity.SysMenu;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * 课程对象 course
 *
 * @author ruoyi
 * @date 2023-03-27
 */
public class Course extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /**  */
    private Long id;

    /** 课程名称 */
    @Excel(name = "课程名称")
    private String name;

    /** 教师id */
    @Excel(name = "教师id")
    private Long teacher;

    private String teacherName;

    /** 课程介绍 */
    @Excel(name = "课程介绍")
    private String introduce;

    /** 课程图片 */
    @Excel(name = "课程图片")
    private String picture;

    @Excel(name = "是否公开")
    private Integer ispublic;

    /** 期次 */
    @Excel(name = "期次")
    private Long period;

    /** 开始时间 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "开始时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date starttime;

    /** 结束时间 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "结束时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date endtime;

    /** 教学进度(预报名,进行中,已结束) */
    @Excel(name = "教学进度(预报名,进行中,已结束)")
    private String progress;

    /** 学时 */
    @Excel(name = "学时")
    private Long hours;

    /** 这门课讲什么 */
    @Excel(name = "这门课讲什么")
    private String sayabout;

    /** 这门课的特点 */
    @Excel(name = "这门课的特点")
    private String peculiarity;

    /** 这门课的要求 */
    @Excel(name = "这门课的要求")
    private String request;

    public String getTeacherName() {
        return teacherName;
    }

    public void setTeacherName(String teacherName) {
        this.teacherName = teacherName;
    }

    public void setId(Long id)
    {
        this.id = id;
    }

    public Long getId()
    {
        return id;
    }
    public void setName(String name)
    {
        this.name = name;
    }

    public String getName()
    {
        return name;
    }
    public void setTeacher(Long teacher)
    {
        this.teacher = teacher;
    }

    public Long getTeacher()
    {
        return teacher;
    }
    public void setIntroduce(String introduce)
    {
        this.introduce = introduce;
    }

    public String getIntroduce()
    {
        return introduce;
    }
    public void setPicture(String picture)
    {
        this.picture = picture;
    }

    public String getPicture()
    {
        return picture;
    }

    public Integer getIspublic() {
        return ispublic;
    }

    public void setIspublic(Integer ispublic) {
        this.ispublic = ispublic;
    }

    public Long getPeriod() {
        return period;
    }

    public void setPeriod(Long period) {
        this.period = period;
    }

    public Date getStarttime() {
        return starttime;
    }

    public void setStarttime(Date starttime) {
        this.starttime = starttime;
    }

    public Date getEndtime() {
        return endtime;
    }

    public void setEndtime(Date endtime) {
        this.endtime = endtime;
    }

    public String getProgress() {
        return progress;
    }

    public void setProgress(String progress) {
        this.progress = progress;
    }

    public Long getHours() {
        return hours;
    }

    public void setHours(Long hours) {
        this.hours = hours;
    }

    public String getSayabout() {
        return sayabout;
    }

    public void setSayabout(String sayabout) {
        this.sayabout = sayabout;
    }

    public String getPeculiarity() {
        return peculiarity;
    }

    public void setPeculiarity(String peculiarity) {
        this.peculiarity = peculiarity;
    }

    public String getRequest() {
        return request;
    }

    public void setRequest(String request) {
        this.request = request;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
                .append("id", getId())
                .append("name", getName())
                .append("teacher", getTeacher())
                .append("introduce", getIntroduce())
                .append("picture", getPicture())
                .append("ispublic", getIspublic())
                .append("period", getPeriod())
                .append("starttime", getStarttime())
                .append("endtime", getEndtime())
                .append("progress", getProgress())
                .append("hours", getHours())
                .append("sayabout", getSayabout())
                .append("peculiarity", getPeculiarity())
                .append("request", getRequest())
                .toString();
    }
}
