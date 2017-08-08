package com.stu.common.system.menu;


import com.stu.common.utils.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.List;

@Controller
@RequestMapping("/menu")
public class MenuController {

    @Autowired
    MenuService menuService;

    @RequestMapping(value="getMenus",method = RequestMethod.POST)
    public Result getMenus(){
        List<Menu> list = menuService.findList(null);
        return new Result("200","获取菜单成功");
    }

}
