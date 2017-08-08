package com.stu.common.system.menu;

import com.stu.common.crud.BaseService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional(readOnly = true)
public class MenuService extends BaseService<MenuDao,Menu>{

}
