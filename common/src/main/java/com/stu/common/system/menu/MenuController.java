package com.stu.common.system.menu;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/menu")
public class MenuController {

    @Autowired
    MenuService menuService;

    @RequestMapping(value="/index")
    public String index(Model model){
        List<Menu> list = new ArrayList<Menu>();
        List<Menu> sourceList = menuService.findList(null);
        Menu.sortList(list,sourceList,"0",true);
        model.addAttribute("menuList",list);
        return "/system/menu/index";
    }

}
