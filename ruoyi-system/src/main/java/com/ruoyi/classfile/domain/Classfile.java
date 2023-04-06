package com.ruoyi.classfile.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * classfile对象 classfile
 *
 * @author ruoyi
 * @date 2023-04-06
 */
public class Classfile extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 文件id */
    private Long id;

    /** 文件名称 */
    @Excel(name = "文件名称")
    private String name;

    /** 文件地址 */
    @Excel(name = "文件地址")
    private String fileaddress;

    /** 课程id */
    @Excel(name = "课程id")
    private Long courseId;

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
    public void setFileaddress(String fileaddress)
    {
        this.fileaddress = fileaddress;
    }

    public String getFileaddress()
    {
        return fileaddress;
    }
    public void setCourseId(Long courseId)
    {
        this.courseId = courseId;
    }

    public Long getCourseId()
    {
        return courseId;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
                .append("id", getId())
                .append("name", getName())
                .append("fileaddress", getFileaddress())
                .append("courseId", getCourseId())
                .toString();
    }
}
