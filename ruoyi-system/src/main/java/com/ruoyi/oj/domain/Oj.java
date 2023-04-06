package com.ruoyi.oj.domain;

import java.util.List;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * oj对象 oj
 *
 * @author ruoyi
 * @date 2023-03-28
 */
public class Oj extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /**  */
    private Long id;

    /** 标题 */
    @Excel(name = "标题")
    private String title;

    /** 难度(简单，中等，困难) */
    @Excel(name = "难度(简单，中等，困难)")
    private String difficulty;

    /** 点赞 */
    @Excel(name = "点赞")
    private Long likeNum;

    /** 描述 */
    @Excel(name = "描述")
    private String description;

    /** 章节id,无id表示在线题目 */
    @Excel(name = "章节id,无id表示在线题目")
    private Long chapterid;

    @Excel(name = "代码")
    private String code;

    @Excel(name = "代码方法")
    private String codemethod;

    //课程id，用于接收前端传来的课程id
    private Long courseId;

    private int status;

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    /** 用例与答案信息 */
    private List<Testcase> testcaseList;

    public void setId(Long id)
    {
        this.id = id;
    }

    public Long getId()
    {
        return id;
    }
    public void setTitle(String title)
    {
        this.title = title;
    }

    public String getTitle()
    {
        return title;
    }
    public void setDifficulty(String difficulty)
    {
        this.difficulty = difficulty;
    }

    public String getDifficulty()
    {
        return difficulty;
    }
    public void setLikeNum(Long likeNum)
    {
        this.likeNum = likeNum;
    }

    public Long getLikeNum()
    {
        return likeNum;
    }
    public void setDescription(String description)
    {
        this.description = description;
    }

    public String getDescription()
    {
        return description;
    }
    public void setChapterid(Long chapterid)
    {
        this.chapterid = chapterid;
    }

    public Long getChapterid()
    {
        return chapterid;
    }

    public List<Testcase> getTestcaseList()
    {
        return testcaseList;
    }

    public void setTestcaseList(List<Testcase> testcaseList)
    {
        this.testcaseList = testcaseList;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getCodemethod() {
        return codemethod;
    }

    public void setCodemethod(String codemethod) {
        this.codemethod = codemethod;
    }

    public Long getCourseId() {
        return courseId;
    }

    public void setCourseId(Long courseId) {
        this.courseId = courseId;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
                .append("id", getId())
                .append("title", getTitle())
                .append("difficulty", getDifficulty())
                .append("likeNum", getLikeNum())
                .append("description", getDescription())
                .append("chapterid", getChapterid())
                .append("code", getCode())
                .append("testcaseList", getTestcaseList())
                .append("codemethod", getCodemethod())
                .append("courseId", getCourseId())
                .toString();
    }
}
