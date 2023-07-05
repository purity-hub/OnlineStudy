package com.ruoyi.turtle.domain;

import com.ruoyi.common.core.domain.BaseEntity;

public class School extends BaseEntity {
    String name;
    String numberOfWorks;

    public School(String name, String numberOfWorks) {
        this.name = name;
        this.numberOfWorks = numberOfWorks;
    }

    public String getName() {
        return name;
    }

    public String getNumberOfWorks() {
        return numberOfWorks;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setNumberOfWorks(String numberOfWorks) {
        this.numberOfWorks = numberOfWorks;
    }

}
