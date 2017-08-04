package com.stu.common.crud;

import java.util.List;

public interface BaseDao<T> {

    int save(T t);

    T getById(int id);

    T get(T t);

    int update(T t);

    int deleteById(int id);

    int delete(T t);

    List<T> findList(T t);


}
