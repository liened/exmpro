package com.stu.common.crud;

import java.util.List;

public interface BaseDao<T> {

    int save(T t);

    T get(T t);

    int update(T t);

    int delete(T t);

    List<T> findList(T t);


}
