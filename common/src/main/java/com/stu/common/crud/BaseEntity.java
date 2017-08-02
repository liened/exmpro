package com.stu.common.crud;

import com.stu.common.persistence.Page;

public class BaseEntity<T> {

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
