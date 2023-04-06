package com.ruoyi.es.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 试卷学生成绩对象 es
 *
 * @author ruoyi
 * @date 2023-04-05
 */
public class Es extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** id */
    private Long id;

    /** 学生id */
    @Excel(name = "学生id")
    private Long sid;

    /** 试卷id */
    @Excel(name = "试卷id")
    private Long eid;

    /** 成绩 */
    @Excel(name = "成绩")
    private Long score;

    /** 学生考试答案记录 */
    @Excel(name = "学生考试答案记录")
    private String answer;

    public void setId(Long id)
    {
        this.id = id;
    }

    public Long getId()
    {
        return id;
    }
    public void setSid(Long sid)
    {
        this.sid = sid;
    }

    public Long getSid()
    {
        return sid;
    }
    public void setEid(Long eid)
    {
        this.eid = eid;
    }

    public Long getEid()
    {
        return eid;
    }
    public void setScore(Long score)
    {
        this.score = score;
    }

    public Long getScore()
    {
        return score;
    }
    public void setAnswer(String answer)
    {
        this.answer = answer;
    }

    public String getAnswer()
    {
        return answer;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
                .append("id", getId())
                .append("sid", getSid())
                .append("eid", getEid())
                .append("score", getScore())
                .append("answer", getAnswer())
                .toString();
    }
}
