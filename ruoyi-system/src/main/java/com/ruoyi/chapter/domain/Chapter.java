package com.ruoyi.chapter.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.TreeEntity;

import java.util.ArrayList;
import java.util.List;

/**
 * chapter对象 chapter
 *
 * @author ruoyi
 * @date 2023-03-28
 */
public class Chapter extends TreeEntity
{
    private static final long serialVersionUID = 1L;

    /** 章节编号 */
    private Long id;

    /** 章节名称 */
    @Excel(name = "章节名称")
    private String name;

    /** 课程id */
    @Excel(name = "课程id")
    private Long courseid;

    private Long parentid;

    private List<Chapter> children= new ArrayList<>();

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
    public void setCourseid(Long courseid)
    {
        this.courseid = courseid;
    }

    public Long getCourseid()
    {
        return courseid;
    }

    public Long getParentid() {
        return parentid;
    }

    public void setParentid(Long parentid) {
        this.parentid = parentid;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
                .append("id", getId())
                .append("name", getName())
                .append("courseid", getCourseid())
                .append("orderNum", getOrderNum())
                .append("parentid", getParentid())
                .toString();
    }
}
