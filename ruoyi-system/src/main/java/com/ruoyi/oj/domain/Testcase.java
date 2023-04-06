package com.ruoyi.oj.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 用例与答案对象 testcase
 *
 * @author ruoyi
 * @date 2023-03-28
 */
public class Testcase extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 测试编号 */
    private Long id;

    /** 测试用例 */
    @Excel(name = "测试用例")
    private String testcases;

    /** 每个测试用例对应的答案 */
    @Excel(name = "每个测试用例对应的答案")
    private String answer;

    /** 题目id */
    @Excel(name = "题目id")
    private Long oid;

    /** 解释 */
    @Excel(name = "解释")
    private String mark;

    public void setId(Long id)
    {
        this.id = id;
    }

    public Long getId()
    {
        return id;
    }
    public void setTestcases(String testcases)
    {
        this.testcases = testcases;
    }

    public String getTestcases()
    {
        return testcases;
    }
    public void setAnswer(String answer)
    {
        this.answer = answer;
    }

    public String getAnswer()
    {
        return answer;
    }
    public void setOid(Long oid)
    {
        this.oid = oid;
    }

    public Long getOid()
    {
        return oid;
    }
    public void setMark(String mark)
    {
        this.mark = mark;
    }

    public String getMark()
    {
        return mark;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
                .append("id", getId())
                .append("testcases", getTestcases())
                .append("answer", getAnswer())
                .append("oid", getOid())
                .append("mark", getMark())
                .toString();
    }
}
