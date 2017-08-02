package com.stu.common.crud;

import com.stu.common.persistence.Page;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

public abstract class BaseService<D extends BaseDao,T extends BaseEntity>{

    @Autowired
    private D dao;

    private Logger logger = LoggerFactory.getLogger(this.getClass());

    public int save(T t) {
        return dao.save(t);
    }

    public T get(T t) {
        return (T) dao.get(t);
    }

    public int update(T t) {
        return dao.update(t);
    }

    public int delete(T t) {
        return dao.delete(t);
    }

    public List<T> findList(T t) {
        return dao.findList(t);
    }

    public void Tt(){

    }

    public Page<T> findPage(Page<T> page,T entity){
        entity.setPage(page);
        page.setList(this.dao.findList(entity));
        return page;
    }
}
