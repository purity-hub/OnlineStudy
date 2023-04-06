package com.ruoyi.signin.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 签到对象 signin
 *
 * @author ruoyi
 * @date 2023-04-02
 */
public class Signin extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 签到id */
    private Long id;

    /** 签到记录对应的id */
    @Excel(name = "签到记录对应的id")
    private Long signId;

    /** 用户id，一般为学生 */
    @Excel(name = "用户id，一般为学生")
    private Long userId;

    public void setId(Long id)
    {
        this.id = id;
    }

    public Long getId()
    {
        return id;
    }
    public void setSignId(Long signId)
    {
        this.signId = signId;
    }

    public Long getSignId()
    {
        return signId;
    }
    public void setUserId(Long userId)
    {
        this.userId = userId;
    }

    public Long getUserId()
    {
        return userId;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
                .append("id", getId())
                .append("signId", getSignId())
                .append("userId", getUserId())
                .toString();
    }
}
