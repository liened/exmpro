package com.stu.common.crud;

import com.stu.common.persistence.Page;

import java.io.Serializable;

public class BaseEntity<T> implements Serializable{

    private int id;

    private Page<T> page;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Page<T> getPage() {
        return page;
    }

    public void setPage(Page<T> page) {
        this.page = page;
    }
}
