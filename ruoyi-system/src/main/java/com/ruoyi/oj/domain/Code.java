package com.ruoyi.oj.domain;

import com.ruoyi.common.core.domain.BaseEntity;

public class Code extends BaseEntity {

    private Long id;
    private String code;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }
}
