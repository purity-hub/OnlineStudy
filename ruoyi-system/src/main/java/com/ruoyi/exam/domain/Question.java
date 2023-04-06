package com.ruoyi.exam.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 题目对象 question
 *
 * @author ruoyi
 * @date 2023-04-05
 */
public class Question extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 问题id */
    private Long id;

    /** 试卷id */
    @Excel(name = "试卷id")
    private Long examId;

    /** 题目类型(1单选2多选3判断4简答) */
    @Excel(name = "题目类型(1单选2多选3判断4简答)")
    private Long questionType;

    /** 题目 */
    @Excel(name = "题目")
    private String context;

    /** 答案 */
    @Excel(name = "答案")
    private String answer;

    /** 选项A */
    @Excel(name = "选项A")
    private String selectA;

    /** 选项B */
    @Excel(name = "选项B")
    private String selectB;

    /** 选项C */
    @Excel(name = "选项C")
    private String selectC;

    /** 选项D */
    @Excel(name = "选项D")
    private String selectD;

    /** 成绩 */
    @Excel(name = "成绩")
    private Long score;


    public void setId(Long id)
    {
        this.id = id;
    }

    public Long getId()
    {
        return id;
    }
    public void setExamId(Long examId)
    {
        this.examId = examId;
    }

    public Long getExamId()
    {
        return examId;
    }
    public void setQuestionType(Long questionType)
    {
        this.questionType = questionType;
    }

    public Long getQuestionType()
    {
        return questionType;
    }
    public void setContext(String context)
    {
        this.context = context;
    }

    public String getContext()
    {
        return context;
    }
    public void setAnswer(String answer)
    {
        this.answer = answer;
    }

    public String getAnswer()
    {
        return answer;
    }
    public void setSelectA(String selectA)
    {
        this.selectA = selectA;
    }

    public String getSelectA()
    {
        return selectA;
    }
    public void setSelectB(String selectB)
    {
        this.selectB = selectB;
    }

    public String getSelectB()
    {
        return selectB;
    }
    public void setSelectC(String selectC)
    {
        this.selectC = selectC;
    }

    public String getSelectC()
    {
        return selectC;
    }
    public void setSelectD(String selectD)
    {
        this.selectD = selectD;
    }

    public String getSelectD()
    {
        return selectD;
    }

    public Long getScore() {
        return score;
    }

    public void setScore(Long score) {
        this.score = score;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
                .append("id", getId())
                .append("examId", getExamId())
                .append("questionType", getQuestionType())
                .append("context", getContext())
                .append("answer", getAnswer())
                .append("selectA", getSelectA())
                .append("selectB", getSelectB())
                .append("selectC", getSelectC())
                .append("selectD", getSelectD())
                .append("score", getScore())
                .toString();
    }
}
